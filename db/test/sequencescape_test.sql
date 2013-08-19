/* Samples */

CREATE TABLE "sample_manifest_templates" (
  "id" INTEGER PRIMARY KEY,
  "name" varchar(255) DEFAULT NULL,
  "asset_type" varchar(255) DEFAULT NULL,
  "path" varchar(255) DEFAULT NULL,
  "default_values" varchar(255) DEFAULT NULL,
  "cell_map" varchar(255) DEFAULT NULL
);

CREATE TABLE "sample_manifests" (
  "id" INTEGER PRIMARY KEY,
  "created_at" datetime DEFAULT NULL,
  "updated_at" datetime DEFAULT NULL,
  "study_id" int(11) DEFAULT NULL,
  "project_id" int(11) DEFAULT NULL,
  "supplier_id" int(11) DEFAULT NULL,
  "count" int(11) DEFAULT NULL,
  "uploaded_file" longblob,
  "generated_file" longblob,
  "asset_type" varchar(255) DEFAULT NULL,
  "last_errors" text,
  "state" varchar(255) DEFAULT NULL,
  "barcodes" text,
  "user_id" int(11) DEFAULT NULL
);

CREATE TABLE "sample_metadata" (
  "id" INTEGER PRIMARY KEY,
  "sample_id" int(11) DEFAULT NULL,
  "organism" varchar(255) DEFAULT NULL,
  "gc_content" varchar(255) DEFAULT NULL,
  "cohort" varchar(255) DEFAULT NULL,
  "gender" varchar(255) DEFAULT NULL,
  "country_of_origin" varchar(255) DEFAULT NULL,
  "geographical_region" varchar(255) DEFAULT NULL,
  "ethnicity" varchar(255) DEFAULT NULL,
  "dna_source" varchar(255) DEFAULT NULL,
  "volume" varchar(255) DEFAULT NULL,
  "supplier_plate_id" varchar(255) DEFAULT NULL,
  "mother" varchar(255) DEFAULT NULL,
  "father" varchar(255) DEFAULT NULL,
  "replicate" varchar(255) DEFAULT NULL,
  "sample_public_name" varchar(255) DEFAULT NULL,
  "sample_common_name" varchar(255) DEFAULT NULL,
  "sample_strain_att" varchar(255) DEFAULT NULL,
  "sample_taxon_id" int(11) DEFAULT NULL,
  "sample_ebi_accession_number" varchar(255) DEFAULT NULL,
  "sample_sra_hold" varchar(255) DEFAULT NULL,
  "sample_reference_genome_old" varchar(255) DEFAULT NULL,
  "sample_description" text,
  "sibling" varchar(255) DEFAULT NULL,
  "is_resubmitted" tinyint(1) DEFAULT NULL,
  "date_of_sample_collection" varchar(255) DEFAULT NULL,
  "date_of_sample_extraction" varchar(255) DEFAULT NULL,
  "sample_extraction_method" varchar(255) DEFAULT NULL,
  "sample_purified" varchar(255) DEFAULT NULL,
  "purification_method" varchar(255) DEFAULT NULL,
  "concentration" varchar(255) DEFAULT NULL,
  "concentration_determined_by" varchar(255) DEFAULT NULL,
  "sample_type" varchar(255) DEFAULT NULL,
  "sample_storage_conditions" varchar(255) DEFAULT NULL,
  "supplier_name" varchar(255) DEFAULT NULL,
  "reference_genome_id" int(11) DEFAULT '1',
  "genotype" varchar(255) DEFAULT NULL,
  "phenotype" varchar(255) DEFAULT NULL,
  "age" varchar(255) DEFAULT NULL,
  "developmental_stage" varchar(255) DEFAULT NULL,
  "cell_type" varchar(255) DEFAULT NULL,
  "disease_state" varchar(255) DEFAULT NULL,
  "compound" varchar(255) DEFAULT NULL,
  "dose" varchar(255) DEFAULT NULL,
  "immunoprecipitate" varchar(255) DEFAULT NULL,
  "growth_condition" varchar(255) DEFAULT NULL,
  "rnai" varchar(255) DEFAULT NULL,
  "organism_part" varchar(255) DEFAULT NULL,
  "time_point" varchar(255) DEFAULT NULL,
  "disease" varchar(255) DEFAULT NULL,
  "subject" varchar(255) DEFAULT NULL,
  "treatment" varchar(255) DEFAULT NULL,
  "created_at" datetime DEFAULT NULL,
  "updated_at" datetime DEFAULT NULL
);

CREATE TABLE "sample_registrars" (
  "id" INTEGER PRIMARY KEY,
  "study_id" int(11) DEFAULT NULL,
  "user_id" int(11) DEFAULT NULL,
  "sample_id" int(11) DEFAULT NULL,
  "sample_tube_id" int(11) DEFAULT NULL,
  "asset_group_id" int(11) DEFAULT NULL
);

CREATE TABLE "samples" (
  "id" INTEGER PRIMARY KEY,
  "name" varchar(255) DEFAULT NULL,
  "new_name_format" tinyint(1) DEFAULT '1',
  "created_at" datetime DEFAULT NULL,
  "updated_at" datetime DEFAULT NULL,
  "sanger_sample_id" varchar(255) DEFAULT NULL,
  "sample_manifest_id" int(11) DEFAULT NULL,
  "control" tinyint(1) DEFAULT NULL,
  "empty_supplier_sample_name" tinyint(1) DEFAULT '0',
  "updated_by_manifest" tinyint(1) DEFAULT '0',
  "consent_withdrawn" tinyint(1) NOT NULL DEFAULT '0'
);

CREATE TABLE "sanger_sample_ids" (
  "id" INTEGER PRIMARY KEY
);

/* Plates */

CREATE TABLE "assets" (
  "id" INTEGER PRIMARY KEY,
  "name" varchar(255) DEFAULT NULL,
  "value" varchar(255) DEFAULT NULL,
  "descriptors" text,
  "descriptor_fields" text,
  "sti_type" varchar(50) DEFAULT NULL,
  "barcode" varchar(255) DEFAULT NULL,
  "qc_state" varchar(20) DEFAULT NULL,
  "resource" tinyint(1) DEFAULT NULL,
  "created_at" datetime DEFAULT NULL,
  "updated_at" datetime DEFAULT NULL,
  "map_id" int(11) DEFAULT NULL,
  "size" int(11) DEFAULT NULL,
  "closed" tinyint(1) DEFAULT '0',
  "public_name" varchar(255) DEFAULT NULL,
  "archive" tinyint(1) DEFAULT NULL,
  "external_release" tinyint(1) DEFAULT NULL,
  "two_dimensional_barcode" varchar(255) DEFAULT NULL,
  "plate_purpose_id" int(11) DEFAULT NULL,
  "volume" decimal(10,2) DEFAULT NULL,
  "barcode_prefix_id" int(11) DEFAULT NULL,
  "concentration" decimal(18,8) DEFAULT NULL,
  "legacy_sample_id" int(11) DEFAULT NULL,
  "legacy_tag_id" int(11) DEFAULT NULL
);

CREATE TABLE "maps" (
  "id" INTEGER PRIMARY KEY,
  "description" varchar(4) DEFAULT NULL,
  "asset_size" int(11) DEFAULT NULL,
  "location_id" int(11) DEFAULT NULL,
  "row_order" int(11) DEFAULT NULL,
  "column_order" int(11) DEFAULT NULL
); 

CREATE TABLE "container_associations" (
  "id" INTEGER PRIMARY KEY,
  "container_id" int(11) NOT NULL,
  "content_id" int(11) NOT NULL
);

CREATE TABLE "aliquots" (
  "id" INTEGER PRIMARY KEY,
  "receptacle_id" int(11) NOT NULL,
  "study_id" int(11) DEFAULT NULL,
  "project_id" int(11) DEFAULT NULL,
  "library_id" int(11) DEFAULT NULL,
  "sample_id" int(11) NOT NULL,
  "tag_id" int(11) DEFAULT NULL,
  "library_type" varchar(255) DEFAULT NULL,
  "insert_size_from" int(11) DEFAULT NULL,
  "insert_size_to" int(11) DEFAULT NULL,
  "created_at" datetime DEFAULT NULL,
  "updated_at" datetime DEFAULT NULL,
  "bait_library_id" int(11) DEFAULT NULL
);

CREATE TABLE "barcode_prefixes" (
  "id" INTEGER PRIMARY KEY,
  "prefix" varchar(255) DEFAULT NULL
);

CREATE TABLE "studies" (
  "id" INTEGER PRIMARY KEY,
  "name" varchar(255) NOT NULL
);

CREATE TABLE "study_metadata" (
  "id" INTEGER PRIMARY KEY,
  "study_id" int(11) default null,
  "study_name_abbreviation" varchar(255) NOT NULL
);

CREATE TABLE "study_samples" (
  "id" INTEGER PRIMARY KEY,
  "study_id" int(11) NOT NULL,
  "sample_id" int(11) NOT NULL,
  "created_at" datetime DEFAULT NULL,
  "updated_at" datetime DEFAULT NULL
);

CREATE TABLE "locations" (
  "id" INTEGER PRIMARY KEY,
  "name" varchar(255) NOT NULL
);

CREATE TABLE "location_associations" (
  "id" INTEGER PRIMARY KEY,
  "locatable_id" int(11) NOT NULL,
  "location_id" int(11) NOT NULL
);

CREATE TABLE "requests" (
  "id" INTEGER PRIMARY KEY,
  "asset_id" int(11) NOT NULL,
  "initial_study_id" int(11) NOT NULL,
  "sti_type" varchar(255) NOT NULL,
  "state" varchar(255) NOT NULL,
  "request_type_id" int(11) DEFAULT NULL,
  "created_at" datetime DEFAULT NULL,
  "updated_at" datetime DEFAULT NULL
);


/* Common */

CREATE TABLE "uuids" (
  "id" INTEGER PRIMARY KEY,
  "resource_type" varchar(128) NOT NULL,
  "resource_id" int(11) NOT NULL,
  "external_id" varchar(36) NOT NULL
);

/* seeds */
INSERT INTO `maps` VALUES (1,'A1',96,1,0,0),(2,'A2',96,2,1,8),(3,'A3',96,3,2,16),(4,'A4',96,4,3,24),(5,'A5',96,5,4,32),(6,'A6',96,6,5,40),(7,'A7',96,7,6,48),(8,'A8',96,8,7,56),(9,'A9',96,9,8,64),(10,'A10',96,10,9,72),(11,'A11',96,11,10,80),(12,'A12',96,12,11,88),(13,'B1',96,13,12,1),(14,'B2',96,14,13,9),(15,'B3',96,15,14,17),(16,'B4',96,16,15,25),(17,'B5',96,17,16,33),(18,'B6',96,18,17,41),(19,'B7',96,19,18,49),(20,'B8',96,20,19,57),(21,'B9',96,21,20,65),(22,'B10',96,22,21,73),(23,'B11',96,23,22,81),(24,'B12',96,24,23,89),(25,'C1',96,25,24,2),(26,'C2',96,26,25,10),(27,'C3',96,27,26,18),(28,'C4',96,28,27,26),(29,'C5',96,29,28,34),(30,'C6',96,30,29,42),(31,'C7',96,31,30,50),(32,'C8',96,32,31,58),(33,'C9',96,33,32,66),(34,'C10',96,34,33,74),(35,'C11',96,35,34,82),(36,'C12',96,36,35,90),(37,'D1',96,37,36,3),(38,'D2',96,38,37,11),(39,'D3',96,39,38,19),(40,'D4',96,40,39,27),(41,'D5',96,41,40,35),(42,'D6',96,42,41,43),(43,'D7',96,43,42,51),(44,'D8',96,44,43,59),(45,'D9',96,45,44,67),(46,'D10',96,46,45,75),(47,'D11',96,47,46,83),(48,'D12',96,48,47,91),(49,'E1',96,49,48,4),(50,'E2',96,50,49,12),(51,'E3',96,51,50,20),(52,'E4',96,52,51,28),(53,'E5',96,53,52,36),(54,'E6',96,54,53,44),(55,'E7',96,55,54,52),(56,'E8',96,56,55,60),(57,'E9',96,57,56,68),(58,'E10',96,58,57,76),(59,'E11',96,59,58,84),(60,'E12',96,60,59,92),(61,'F1',96,61,60,5),(62,'F2',96,62,61,13),(63,'F3',96,63,62,21),(64,'F4',96,64,63,29),(65,'F5',96,65,64,37),(66,'F6',96,66,65,45),(67,'F7',96,67,66,53),(68,'F8',96,68,67,61),(69,'F9',96,69,68,69),(70,'F10',96,70,69,77),(71,'F11',96,71,70,85),(72,'F12',96,72,71,93),(73,'G1',96,73,72,6),(74,'G2',96,74,73,14),(75,'G3',96,75,74,22),(76,'G4',96,76,75,30),(77,'G5',96,77,76,38),(78,'G6',96,78,77,46),(79,'G7',96,79,78,54),(80,'G8',96,80,79,62),(81,'G9',96,81,80,70),(82,'G10',96,82,81,78),(83,'G11',96,83,82,86),(84,'G12',96,84,83,94),(85,'H1',96,85,84,7),(86,'H2',96,86,85,15),(87,'H3',96,87,86,23),(88,'H4',96,88,87,31),(89,'H5',96,89,88,39),(90,'H6',96,90,89,47),(91,'H7',96,91,90,55),(92,'H8',96,92,91,63),(93,'H9',96,93,92,71),(94,'H10',96,94,93,79),(95,'H11',96,95,94,87),(96,'H12',96,96,95,95),(97,'A1',384,1,0,0),(98,'A2',384,2,1,16),(99,'A3',384,3,2,32),(100,'A4',384,4,3,48),(101,'A5',384,5,4,64),(102,'A6',384,6,5,80),(103,'A7',384,7,6,96),(104,'A8',384,8,7,112),(105,'A9',384,9,8,128),(106,'A10',384,10,9,144),(107,'A11',384,11,10,160),(108,'A12',384,12,11,176),(109,'A13',384,13,12,192),(110,'A14',384,14,13,208),(111,'A15',384,15,14,224),(112,'A16',384,16,15,240),(113,'A17',384,17,16,256),(114,'A18',384,18,17,272),(115,'A19',384,19,18,288),(116,'A20',384,20,19,304),(117,'A21',384,21,20,320),(118,'A22',384,22,21,336),(119,'A23',384,23,22,352),(120,'A24',384,24,23,368),(121,'B1',384,25,24,1),(122,'B2',384,26,25,17),(123,'B3',384,27,26,33),(124,'B4',384,28,27,49),(125,'B5',384,29,28,65),(126,'B6',384,30,29,81),(127,'B7',384,31,30,97),(128,'B8',384,32,31,113),(129,'B9',384,33,32,129),(130,'B10',384,34,33,145),(131,'B11',384,35,34,161),(132,'B12',384,36,35,177),(133,'B13',384,37,36,193),(134,'B14',384,38,37,209),(135,'B15',384,39,38,225),(136,'B16',384,40,39,241),(137,'B17',384,41,40,257),(138,'B18',384,42,41,273),(139,'B19',384,43,42,289),(140,'B20',384,44,43,305),(141,'B21',384,45,44,321),(142,'B22',384,46,45,337),(143,'B23',384,47,46,353),(144,'B24',384,48,47,369),(145,'C1',384,49,48,2),(146,'C2',384,50,49,18),(147,'C3',384,51,50,34),(148,'C4',384,52,51,50),(149,'C5',384,53,52,66),(150,'C6',384,54,53,82),(151,'C7',384,55,54,98),(152,'C8',384,56,55,114),(153,'C9',384,57,56,130),(154,'C10',384,58,57,146),(155,'C11',384,59,58,162),(156,'C12',384,60,59,178),(157,'C13',384,61,60,194),(158,'C14',384,62,61,210),(159,'C15',384,63,62,226),(160,'C16',384,64,63,242),(161,'C17',384,65,64,258),(162,'C18',384,66,65,274),(163,'C19',384,67,66,290),(164,'C20',384,68,67,306),(165,'C21',384,69,68,322),(166,'C22',384,70,69,338),(167,'C23',384,71,70,354),(168,'C24',384,72,71,370),(169,'D1',384,73,72,3),(170,'D2',384,74,73,19),(171,'D3',384,75,74,35),(172,'D4',384,76,75,51),(173,'D5',384,77,76,67),(174,'D6',384,78,77,83),(175,'D7',384,79,78,99),(176,'D8',384,80,79,115),(177,'D9',384,81,80,131),(178,'D10',384,82,81,147),(179,'D11',384,83,82,163),(180,'D12',384,84,83,179),(181,'D13',384,85,84,195),(182,'D14',384,86,85,211),(183,'D15',384,87,86,227),(184,'D16',384,88,87,243),(185,'D17',384,89,88,259),(186,'D18',384,90,89,275),(187,'D19',384,91,90,291),(188,'D20',384,92,91,307),(189,'D21',384,93,92,323),(190,'D22',384,94,93,339),(191,'D23',384,95,94,355),(192,'D24',384,96,95,371),(193,'E1',384,97,96,4),(194,'E2',384,98,97,20),(195,'E3',384,99,98,36),(196,'E4',384,100,99,52),(197,'E5',384,101,100,68),(198,'E6',384,102,101,84),(199,'E7',384,103,102,100),(200,'E8',384,104,103,116),(201,'E9',384,105,104,132),(202,'E10',384,106,105,148),(203,'E11',384,107,106,164),(204,'E12',384,108,107,180),(205,'E13',384,109,108,196),(206,'E14',384,110,109,212),(207,'E15',384,111,110,228),(208,'E16',384,112,111,244),(209,'E17',384,113,112,260),(210,'E18',384,114,113,276),(211,'E19',384,115,114,292),(212,'E20',384,116,115,308),(213,'E21',384,117,116,324),(214,'E22',384,118,117,340),(215,'E23',384,119,118,356),(216,'E24',384,120,119,372),(217,'F1',384,121,120,5),(218,'F2',384,122,121,21),(219,'F3',384,123,122,37),(220,'F4',384,124,123,53),(221,'F5',384,125,124,69),(222,'F6',384,126,125,85),(223,'F7',384,127,126,101),(224,'F8',384,128,127,117),(225,'F9',384,129,128,133),(226,'F10',384,130,129,149),(227,'F11',384,131,130,165),(228,'F12',384,132,131,181),(229,'F13',384,133,132,197),(230,'F14',384,134,133,213),(231,'F15',384,135,134,229),(232,'F16',384,136,135,245),(233,'F17',384,137,136,261),(234,'F18',384,138,137,277),(235,'F19',384,139,138,293),(236,'F20',384,140,139,309),(237,'F21',384,141,140,325),(238,'F22',384,142,141,341),(239,'F23',384,143,142,357),(240,'F24',384,144,143,373),(241,'G1',384,145,144,6),(242,'G2',384,146,145,22),(243,'G3',384,147,146,38),(244,'G4',384,148,147,54),(245,'G5',384,149,148,70),(246,'G6',384,150,149,86),(247,'G7',384,151,150,102),(248,'G8',384,152,151,118),(249,'G9',384,153,152,134),(250,'G10',384,154,153,150),(251,'G11',384,155,154,166),(252,'G12',384,156,155,182),(253,'G13',384,157,156,198),(254,'G14',384,158,157,214),(255,'G15',384,159,158,230),(256,'G16',384,160,159,246),(257,'G17',384,161,160,262),(258,'G18',384,162,161,278),(259,'G19',384,163,162,294),(260,'G20',384,164,163,310),(261,'G21',384,165,164,326),(262,'G22',384,166,165,342),(263,'G23',384,167,166,358),(264,'G24',384,168,167,374),(265,'H1',384,169,168,7),(266,'H2',384,170,169,23),(267,'H3',384,171,170,39),(268,'H4',384,172,171,55),(269,'H5',384,173,172,71),(270,'H6',384,174,173,87),(271,'H7',384,175,174,103),(272,'H8',384,176,175,119),(273,'H9',384,177,176,135),(274,'H10',384,178,177,151),(275,'H11',384,179,178,167),(276,'H12',384,180,179,183),(277,'H13',384,181,180,199),(278,'H14',384,182,181,215),(279,'H15',384,183,182,231),(280,'H16',384,184,183,247),(281,'H17',384,185,184,263),(282,'H18',384,186,185,279),(283,'H19',384,187,186,295),(284,'H20',384,188,187,311),(285,'H21',384,189,188,327),(286,'H22',384,190,189,343),(287,'H23',384,191,190,359),(288,'H24',384,192,191,375),(289,'I1',384,193,192,8),(290,'I2',384,194,193,24),(291,'I3',384,195,194,40),(292,'I4',384,196,195,56),(293,'I5',384,197,196,72),(294,'I6',384,198,197,88),(295,'I7',384,199,198,104),(296,'I8',384,200,199,120),(297,'I9',384,201,200,136),(298,'I10',384,202,201,152),(299,'I11',384,203,202,168),(300,'I12',384,204,203,184),(301,'I13',384,205,204,200),(302,'I14',384,206,205,216),(303,'I15',384,207,206,232),(304,'I16',384,208,207,248),(305,'I17',384,209,208,264),(306,'I18',384,210,209,280),(307,'I19',384,211,210,296),(308,'I20',384,212,211,312),(309,'I21',384,213,212,328),(310,'I22',384,214,213,344),(311,'I23',384,215,214,360),(312,'I24',384,216,215,376),(313,'J1',384,217,216,9),(314,'J2',384,218,217,25),(315,'J3',384,219,218,41),(316,'J4',384,220,219,57),(317,'J5',384,221,220,73),(318,'J6',384,222,221,89),(319,'J7',384,223,222,105),(320,'J8',384,224,223,121),(321,'J9',384,225,224,137),(322,'J10',384,226,225,153),(323,'J11',384,227,226,169),(324,'J12',384,228,227,185),(325,'J13',384,229,228,201),(326,'J14',384,230,229,217),(327,'J15',384,231,230,233),(328,'J16',384,232,231,249),(329,'J17',384,233,232,265),(330,'J18',384,234,233,281),(331,'J19',384,235,234,297),(332,'J20',384,236,235,313),(333,'J21',384,237,236,329),(334,'J22',384,238,237,345),(335,'J23',384,239,238,361),(336,'J24',384,240,239,377),(337,'K1',384,241,240,10),(338,'K2',384,242,241,26),(339,'K3',384,243,242,42),(340,'K4',384,244,243,58),(341,'K5',384,245,244,74),(342,'K6',384,246,245,90),(343,'K7',384,247,246,106),(344,'K8',384,248,247,122),(345,'K9',384,249,248,138),(346,'K10',384,250,249,154),(347,'K11',384,251,250,170),(348,'K12',384,252,251,186),(349,'K13',384,253,252,202),(350,'K14',384,254,253,218),(351,'K15',384,255,254,234),(352,'K16',384,256,255,250),(353,'K17',384,257,256,266),(354,'K18',384,258,257,282),(355,'K19',384,259,258,298),(356,'K20',384,260,259,314),(357,'K21',384,261,260,330),(358,'K22',384,262,261,346),(359,'K23',384,263,262,362),(360,'K24',384,264,263,378),(361,'L1',384,265,264,11),(362,'L2',384,266,265,27),(363,'L3',384,267,266,43),(364,'L4',384,268,267,59),(365,'L5',384,269,268,75),(366,'L6',384,270,269,91),(367,'L7',384,271,270,107),(368,'L8',384,272,271,123),(369,'L9',384,273,272,139),(370,'L10',384,274,273,155),(371,'L11',384,275,274,171),(372,'L12',384,276,275,187),(373,'L13',384,277,276,203),(374,'L14',384,278,277,219),(375,'L15',384,279,278,235),(376,'L16',384,280,279,251),(377,'L17',384,281,280,267),(378,'L18',384,282,281,283),(379,'L19',384,283,282,299),(380,'L20',384,284,283,315),(381,'L21',384,285,284,331),(382,'L22',384,286,285,347),(383,'L23',384,287,286,363),(384,'L24',384,288,287,379),(385,'M1',384,289,288,12),(386,'M2',384,290,289,28),(387,'M3',384,291,290,44),(388,'M4',384,292,291,60),(389,'M5',384,293,292,76),(390,'M6',384,294,293,92),(391,'M7',384,295,294,108),(392,'M8',384,296,295,124),(393,'M9',384,297,296,140),(394,'M10',384,298,297,156),(395,'M11',384,299,298,172),(396,'M12',384,300,299,188),(397,'M13',384,301,300,204),(398,'M14',384,302,301,220),(399,'M15',384,303,302,236),(400,'M16',384,304,303,252),(401,'M17',384,305,304,268),(402,'M18',384,306,305,284),(403,'M19',384,307,306,300),(404,'M20',384,308,307,316),(405,'M21',384,309,308,332),(406,'M22',384,310,309,348),(407,'M23',384,311,310,364),(408,'M24',384,312,311,380),(409,'N1',384,313,312,13),(410,'N2',384,314,313,29),(411,'N3',384,315,314,45),(412,'N4',384,316,315,61),(413,'N5',384,317,316,77),(414,'N6',384,318,317,93),(415,'N7',384,319,318,109),(416,'N8',384,320,319,125),(417,'N9',384,321,320,141),(418,'N10',384,322,321,157),(419,'N11',384,323,322,173),(420,'N12',384,324,323,189),(421,'N13',384,325,324,205),(422,'N14',384,326,325,221),(423,'N15',384,327,326,237),(424,'N16',384,328,327,253),(425,'N17',384,329,328,269),(426,'N18',384,330,329,285),(427,'N19',384,331,330,301),(428,'N20',384,332,331,317),(429,'N21',384,333,332,333),(430,'N22',384,334,333,349),(431,'N23',384,335,334,365),(432,'N24',384,336,335,381),(433,'O1',384,337,336,14),(434,'O2',384,338,337,30),(435,'O3',384,339,338,46),(436,'O4',384,340,339,62),(437,'O5',384,341,340,78),(438,'O6',384,342,341,94),(439,'O7',384,343,342,110),(440,'O8',384,344,343,126),(441,'O9',384,345,344,142),(442,'O10',384,346,345,158),(443,'O11',384,347,346,174),(444,'O12',384,348,347,190),(445,'O13',384,349,348,206),(446,'O14',384,350,349,222),(447,'O15',384,351,350,238),(448,'O16',384,352,351,254),(449,'O17',384,353,352,270),(450,'O18',384,354,353,286),(451,'O19',384,355,354,302),(452,'O20',384,356,355,318),(453,'O21',384,357,356,334),(454,'O22',384,358,357,350),(455,'O23',384,359,358,366),(456,'O24',384,360,359,382),(457,'P1',384,361,360,15),(458,'P2',384,362,361,31),(459,'P3',384,363,362,47),(460,'P4',384,364,363,63),(461,'P5',384,365,364,79),(462,'P6',384,366,365,95),(463,'P7',384,367,366,111),(464,'P8',384,368,367,127),(465,'P9',384,369,368,143),(466,'P10',384,370,369,159),(467,'P11',384,371,370,175),(468,'P12',384,372,371,191),(469,'P13',384,373,372,207),(470,'P14',384,374,373,223),(471,'P15',384,375,374,239),(472,'P16',384,376,375,255),(473,'P17',384,377,376,271),(474,'P18',384,378,377,287),(475,'P19',384,379,378,303),(476,'P20',384,380,379,319),(477,'P21',384,381,380,335),(478,'P22',384,382,381,351),(479,'P23',384,383,382,367),(480,'P24',384,384,383,383);
INSERT INTO `uuids` VALUES (1, 'Sample', 1, '11111111-0000-0000-0000-111111111111'), (2, 'Sample', 2, '11111111-0000-0000-0000-222222222222'), (3, 'Sample', 3, '11111111-0000-0000-0000-333333333333'), (4, 'Sample', 4, '11111111-0000-0000-0000-444444444444'), (5, 'Sample', 5, '11111111-0000-0000-0000-555555555555'), (6, 'Sample', 6, '11111111-0000-0000-0000-666666666666');
INSERT INTO `barcode_prefixes` VALUES (1, 'ND');
INSERT INTO `studies` VALUES (1, 'study x');
INSERT INTO `study_metadata` VALUES (1, 1, 'StudyX'), (2, 1, 'studyx');
INSERT INTO `locations` VALUES (1, 'Sample logistics freezer');
INSERT INTO `samples` (name, created_at, updated_at) VALUES ('sample 1', date('now'), date('now'));
INSERT INTO `study_samples` VALUES (1, 1, 1, date('now'), date('now'));