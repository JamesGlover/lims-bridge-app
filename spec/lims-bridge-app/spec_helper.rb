require 'spec_helper'
require 'sequel'

shared_context "test database" do
  let(:db) { Sequel.sqlite 'test.db' }
end


shared_context "prepare database" do
  include_context "test database"

  after(:each) do
    seed_tables = ["maps", "uuids", "barcode_prefixes", "studies", "study_metadata", "locations"]
    db.tables.each do |table|
      db[table.to_sym].delete unless seed_tables.include?(table.to_s)
    end
    db[:uuids].where{id > 6}.delete
    db[:barcode_prefixes].where{id > 1}.delete
  end
end
