require 'lims-busclient'
require 'lims-bridge-app/sample/sequencescape_updater'
require 'lims-bridge-app/s2_resource'
require 'lims-bridge-app/sample/json_decoder'

module Lims::BridgeApp
  module SampleManagement
    class SampleConsumer
      include Lims::BusClient::Consumer
      include SequencescapeUpdater
      include S2Resource
      include JsonDecoder

      attribute :queue_name, String, :required => true, :writer => :private, :reader => :private
      attribute :log, Object, :required => false, :writer => :private

      EXPECTED_ROUTING_KEYS_PATTERNS = [
        '*.*.sample.create', '*.*.sample.updatesample', '*.*.sample.deletesample',
        '*.*.bulkcreatesample.*', '*.*.bulkupdatesample.*', '*.*.bulkdeletesample.*'
      ].map { |k| Regexp.new(k.gsub(/\./, "\\.").gsub(/\*/, "[^\.]*")) }

      # @param [Hash] amqp_settings
      # @param [Hash] mysql_settings
      def initialize(amqp_settings, mysql_settings)
        @queue_name = amqp_settings.delete("sample_queue_name")
        consumer_setup(amqp_settings)
        sequencescape_db_setup(mysql_settings)
        set_queue
      end

      # @param [Object] logger
      def set_logger(logger)
        @log = logger
      end

      private

      # @param [String] routing_key
      # @return [Boolean]
      def expected_message?(routing_key)
        EXPECTED_ROUTING_KEYS_PATTERNS.each do |pattern|
          return true if routing_key.match(pattern)
        end
        false
      end

      # If the message is an expected message, we get the 
      # corresponding s2 resource from the message json, then
      # pass it to the sample message handler for processing.
      def set_queue
        self.add_queue(queue_name) do |metadata, payload|
          log.info("Message received with the routing key: #{metadata.routing_key}")

          if expected_message?(metadata.routing_key)
            log.debug("Processing message with routing key: '#{metadata.routing_key}' and payload: #{payload}")
            s2_resource = s2_resource(payload)
            action = case metadata.routing_key
                     when /sample\.create|bulkcreatesample/ then "create"
                     when /sample\.updatesample|bulkupdatesample/ then "update"
                     when /sample\.deletesample|bulkdeletesample/ then "delete"
                     end

            sample_message_handler(metadata, s2_resource, action)
          else
            metadata.reject
            log.debug("Message rejected: unexpected message (routing key: #{metadata.routing_key})")
          end
        end
      end

      # @param [AMQP::Header] metadata
      # @param [Hash] s2_resource
      # @param [String] action
      # If the message is about a bulk action, each sample needs
      # to be processed by the dispatch_s2_sample_in_sequencescape method.
      # If an update or delete message arrives before a sample is created,
      # an exception UnknownSample is raised and the message are requeue
      # waiting the message to create the sample arrives.
      def sample_message_handler(metadata, s2_resource, action)
        begin
          if s2_resource[:samples]
            s2_resource[:samples].each do |h|
              dispatch_s2_sample_in_sequencescape(h[:sample], h[:uuid], h[:date], action)
            end
          else
            dispatch_s2_sample_in_sequencescape(s2_resource[:sample], s2_resource[:uuid], s2_resource[:date], action)
          end
        rescue Sequel::Rollback, UnknownSample => e
          metadata.reject(:requeue => true)
          log.error("Error saving sample in Sequencescape: #{e}")
        else
          metadata.ack
          log.info("Sample message processed and acknowledged")
        end
      end
    end
  end
end
