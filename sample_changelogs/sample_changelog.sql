-- liquibase formatted sql

-- changeset initDB:1
CREATE TABLE `arbitrage_media_mix` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ARB_MEDIA_ID` bigint(20) DEFAULT '0',
  `ARB_MEDIA_IMG_ID` bigint(20) DEFAULT '0',
  `ARB_MEDIA_TEXT_ID` bigint(20) DEFAULT '0',
  `STATUS` varchar(45) CHARACTER SET latin1 DEFAULT '1',
  `UPDATER_UID` varchar(512) CHARACTER SET latin1 DEFAULT NULL,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL,
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `unq` (`ARB_MEDIA_ID`,`ARB_MEDIA_IMG_ID`,`ARB_MEDIA_TEXT_ID`),
  KEY `ind1` (`ARB_MEDIA_ID`,`ARB_MEDIA_IMG_ID`,`ARB_MEDIA_TEXT_ID`),
  KEY `ind2` (`ARB_MEDIA_TEXT_ID`),
  KEY `ind3` (`ARB_MEDIA_IMG_ID`),
  KEY `ind4` (`ARB_MEDIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- problematic table
-- changeset initDB:2
CREATE TABLE `arbitrage_media_texts` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ARB_MEDIA_ID` bigint(20) DEFAULT '0',
  `TITLE` varchar(512) DEFAULT NULL,
  `SUB_TITLE1` varchar(1024) DEFAULT NULL,
  `SUB_TITLE2` varchar(1024) DEFAULT NULL,
  `SUB_TITLE3` varchar(3000) DEFAULT NULL,
  `STATUS` smallint(6) DEFAULT '1',
  `UPDATER_UID` varchar(512) CHARACTER SET latin1 DEFAULT NULL,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL,
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `LAST_ADWORDS_DATE` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `unq` (`ARB_MEDIA_ID`,`TITLE`,`SUB_TITLE3`(300),`SUB_TITLE1`(100),`SUB_TITLE2`(100)),
  KEY `ind4` (`STATUS`),
  KEY `ind2` (`ARB_MEDIA_ID`,`TITLE`),
  KEY `ind1` (`ARB_MEDIA_ID`,`STATUS`,`TITLE`),
  KEY `ind3` (`TITLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- problematic table
-- changeset initDB:3
CREATE TABLE `arbitrage_media_texts_copy` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ARB_MEDIA_ID` bigint(20) DEFAULT '0',
  `title` text CHARACTER SET utf8,
  `SUB_TITLE1` varchar(1024) DEFAULT NULL,
  `SUB_TITLE2` varchar(1024) DEFAULT NULL,
  `SUB_TITLE3` varchar(1024) DEFAULT NULL,
  `STATUS` smallint(6) DEFAULT '1',
  `UPDATER_UID` varchar(512) DEFAULT NULL,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL,
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `LAST_ADWORDS_DATE` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- problematic table
-- changeset initDB:4
CREATE TABLE `arbitrage_missing_campaigns_errors` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CAMPAIGN_ID` varchar(128) DEFAULT '0',
  `ERR_DESC` longtext,
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `STATUS` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- problematic table
-- changeset initDB:5
CREATE TABLE `arbitrage_nti_batch` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BATCH_NAME` varchar(255) DEFAULT NULL,
  `BRAND_ID` bigint(20) DEFAULT NULL,
  `SOURCE_TAG` varchar(256) DEFAULT NULL,
  `HOTSPOTS_PUBLISHER` varchar(256) DEFAULT NULL,
  `X1` varchar(256) DEFAULT NULL,
  `X2` varchar(256) DEFAULT NULL,
  `STATUS` smallint(6) DEFAULT '1',
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL,
  `IS_READY` smallint(6) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- problematic table
-- changeset initDB:6
CREATE TABLE `arbitrage_nti_import_csvs` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BRAND_ID` bigint(20) DEFAULT '3066',
  `NETWORK` varchar(45) DEFAULT NULL,
  `KEYWORDS` text,
  `QC` varchar(255) DEFAULT NULL,
  `PLATFORM` varchar(128) DEFAULT NULL,
  `CC` varchar(45) DEFAULT NULL,
  `DEF_ST` varchar(256) DEFAULT 'ironsource_s2s_xmlb_2780_bing_lm',
  `STATUS` varchar(45) DEFAULT '1',
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `LAST_CREATION_DATE` timestamp NULL DEFAULT NULL,
  `CAMPAIGN_ID` bigint(20) DEFAULT '0',
  `BATCH_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- problematic table
-- changeset initDB:7
CREATE TABLE `arbitrage_nti_import_csvs_campaigns` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BATCH_ID` bigint(20) DEFAULT NULL,
  `NETWORK` varchar(45) DEFAULT NULL,
  `KEYWORDS` text,
  `QC` varchar(255) DEFAULT NULL,
  `PLATFORM` varchar(128) DEFAULT NULL,
  `CC` varchar(45) DEFAULT NULL,
  `STATUS` varchar(45) DEFAULT '1',
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `LAST_CREATION_DATE` timestamp NULL DEFAULT NULL,
  `CAMPAIGN_ID` bigint(20) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- problematic table
-- changeset initDB:8
CREATE TABLE `arbitrage_problematic_campaigns_ctr` (
  `campaign_id` bigint(20) NOT NULL DEFAULT '0',
  `cur_imps` int(11) DEFAULT '0',
  `prev_imps` int(11) DEFAULT '0',
  PRIMARY KEY (`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- problematic table
-- changeset initDB:9
CREATE TABLE `arbitrage_problematic_campaigns_demand_ctr` (
  `campaign_id` int(11) NOT NULL,
  `ctr` float DEFAULT '0',
  PRIMARY KEY (`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- problematic table
-- changeset initDB:10
CREATE TABLE `arbitrage_publishers_data_by_conversion` (
  `supply_publisher_id` varchar(512) NOT NULL,
  `brand` varchar(128) NOT NULL,
  `demand_type` varchar(128) NOT NULL,
  `conversions` int(11) DEFAULT '0',
  `cost` float DEFAULT '0',
  `conversions_value` float DEFAULT '0',
  `impressions` int(11) DEFAULT '0',
  `clicks` int(11) DEFAULT '0',
  `supply_ctr` float DEFAULT '0',
  `full_ctr` float DEFAULT '0',
  `demand_ctr` float DEFAULT '0',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_blocked` int(11) DEFAULT '0',
  PRIMARY KEY (`supply_publisher_id`,`brand`,`demand_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- problematic table
-- changeset initDB:11
CREATE TABLE `arbitrage_publishers_data_by_conversion_rt` (
  `supply_publisher_id` varchar(512) NOT NULL,
  `brand` varchar(128) NOT NULL,
  `demand_type` varchar(128) NOT NULL,
  `conversions` int(11) DEFAULT '0',
  `cost` float DEFAULT '0',
  `conversions_value` float DEFAULT '0',
  `impressions` int(11) DEFAULT '0',
  `clicks` int(11) DEFAULT '0',
  `supply_ctr` float DEFAULT '0',
  `full_ctr` float DEFAULT '0',
  `demand_ctr` float DEFAULT '0',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`supply_publisher_id`,`brand`,`demand_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- problematic table
-- changeset initDB:12
CREATE TABLE `arbitrage_qc` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VAL` varchar(512) DEFAULT NULL,
  `STATUS` smallint(6) NOT NULL DEFAULT '1',
  `LAST_REFRESHED_DATE` timestamp NULL DEFAULT NULL,
  `UPDATER_UID` varchar(512) DEFAULT NULL,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL,
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `BLACK_KEYWORDS` mediumtext,
  `MUSTHAVE_KEYWORDS` mediumtext,
  `IMAGES` text,
  `AUDIENCE_ID` varchar(128) DEFAULT NULL,
  `Z_INTERESTS` varchar(2056) DEFAULT '[]',
  PRIMARY KEY (`ID`,`STATUS`),
  UNIQUE KEY `unq` (`VAL`,`STATUS`),
  KEY `ind1` (`STATUS`,`VAL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- problematic table
-- changeset initDB:13
CREATE TABLE `arbitrage_qc_batch` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(512) DEFAULT NULL,
  `SOURCE_TAG` varchar(512) DEFAULT NULL,
  `DOMAIN` varchar(1024) DEFAULT NULL,
  `REDIRECT_MAP` text,
  `DEMAND_ID` bigint(20) DEFAULT NULL,
  `BATCH_ID` bigint(20) DEFAULT NULL,
  `FLOW_STATUS` int(11) DEFAULT '1',
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- problematic table
-- changeset initDB:14
CREATE TABLE `arbitrage_qc_campaign_tonic_items` (
  `QC_ID` bigint(20) NOT NULL DEFAULT '0',
  `Q` varchar(1024) NOT NULL DEFAULT '',
  `CC` varchar(6) NOT NULL DEFAULT '',
  `STATE` varchar(128) NOT NULL DEFAULT '',
  `ADWORDS_CPC` float DEFAULT '0',
  `ADWORDS_SEARCHES` int(11) DEFAULT '0',
  `STATUS` smallint(6) DEFAULT '1',
  `UPDATE_DATE` timestamp NULL DEFAULT NULL,
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CC`,`STATE`,`Q`,`QC_ID`),
  KEY `ind1` (`QC_ID`,`STATUS`),
  KEY `ind2` (`QC_ID`),
  KEY `ind4` (`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- problematic table
-- changeset initDB:15
CREATE TABLE `arbitrage_qc_items` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `QC_ID` bigint(20) DEFAULT '0',
  `BASE_TEXT` varchar(1024) DEFAULT NULL,
  `Q` varchar(512) DEFAULT NULL,
  `CC` varchar(6) CHARACTER SET latin1 DEFAULT NULL,
  `STATE` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `ADWORDS_CPC` float DEFAULT '0',
  `ADWORDS_SEARCHES` int(11) DEFAULT '0',
  `STATUS` smallint(6) DEFAULT '1',
  `UPDATER_UID` varchar(512) CHARACTER SET latin1 DEFAULT NULL,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL,
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `LAST_ADWORDS_UPDATE` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `unq` (`CC`,`STATE`,`Q`,`BASE_TEXT`(150),`QC_ID`),
  KEY `ind1` (`QC_ID`,`BASE_TEXT`(150),`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- problematic table
-- changeset initDB:16
CREATE TABLE `arbitrage_revive_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) DEFAULT NULL,
  `campaign_name` varchar(2048) DEFAULT NULL,
  `current_cpc` float DEFAULT NULL,
  `new_cpc` float DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `report_sent` int(11) DEFAULT NULL,
  `revive_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- problematic table
-- changeset initDB:17
CREATE TABLE `arbitrage_roi_factor_history` (
  `campaign_id` int(11) NOT NULL,
  `cost_` float DEFAULT NULL,
  `rev` float DEFAULT NULL,
  `factor` float DEFAULT NULL,
  `old_roi_factor` float DEFAULT '1',
  `new_factor` double DEFAULT NULL,
  `min_imp_date` timestamp NULL DEFAULT NULL,
  `calc_date` timestamp NULL DEFAULT NULL,
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- changeset initDB:18
CREATE TABLE `automation_log_events` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DISPLAY_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- changeset initDB:19
CREATE TABLE `automation_type_categories` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  `STATUS` tinyint(1) NOT NULL DEFAULT '1',
  `UPDATER_UID` varchar(128) NOT NULL,
  `UPDATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- changeset initDB:20
CREATE TABLE `lu_comp_types` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DISPLAY_NAME` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `DESCRIPTION` varchar(2048) DEFAULT NULL,
  `DLL_NAME_PATTERN` varchar(45) DEFAULT NULL,
  `IS_VIRTUAL` tinyint(4) DEFAULT '0',
  `AUTO_BUILD` tinyint(4) DEFAULT '0',
  `IS_JSON` smallint(6) DEFAULT '0',
  `CANBE_IN_PACKAGE` varchar(45) DEFAULT '1',
  `CANBE_STANDALONE` varchar(45) DEFAULT '0',
  `INI_JSON` mediumtext,
  `PARENT_COMP_ID` bigint(20) DEFAULT '1',
  `MIRROR_COMP_ID` bigint(20) DEFAULT '0',
  `UPLOAD_S3_TAG_ID` int(11) DEFAULT '0',
  `URL_CREATE_TAG_ID` int(11) DEFAULT '0',
  `COMP_TYPE` int(11) DEFAULT '1',
  `GENERATION` int(11) DEFAULT '1',
  `STATUS` smallint(6) DEFAULT '1',
  `UPDATER_UID` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL,
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ENCODE_TYPE` smallint(6) DEFAULT '0',
  `SECURED` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- changeset initDB:21
CREATE TABLE `lu_tag_groups` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DISPLAY_NAME` varchar(128) DEFAULT NULL,
  `UPDATER_UID` varchar(128) DEFAULT NULL,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL,
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- changeset initDB:22
CREATE TABLE `tag_types` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TAG_GROUP_ID` bigint(20) DEFAULT NULL,
  `TAG_NAME` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `PREFIX` varchar(128) DEFAULT NULL,
  `STATUS` smallint(6) DEFAULT '1',
  `UPDATER_UID` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL,
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `fk_tt_1_idx` (`TAG_GROUP_ID`),
  CONSTRAINT `fk_tg_1` FOREIGN KEY (`TAG_GROUP_ID`) REFERENCES `lu_tag_groups` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- problematic table
-- changeset initDB:23
CREATE TABLE `automation_types` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CATEGORY_ID` bigint(20) NOT NULL,
  `COMP_TYPE_ID` bigint(20) NOT NULL,
  `COMMAND_COMP_TYPE_ID` bigint(20) NOT NULL,
  `DOMAINS_TAG_TYPE_ID` bigint(20) NOT NULL,
  `FALLBACK_DOMAINS_TAG_TYPE_ID` bigint(20) DEFAULT NULL,
  `DOMAIN_PER_AV` tinyint(1) NOT NULL DEFAULT '0',
  `DISTRIBUTED_BRAND_TYPES` varchar(45) NOT NULL DEFAULT '[]',
  `STATUS` tinyint(1) NOT NULL DEFAULT '1',
  `UPDATER_UID` varchar(45) NOT NULL,
  `UPDATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `COMP_TYPE_ID_UNIQUE` (`COMP_TYPE_ID`),
  KEY `fk_command_idx` (`COMMAND_COMP_TYPE_ID`),
  KEY `fk_tag_type_idx` (`DOMAINS_TAG_TYPE_ID`),
  KEY `fk_type_idx` (`CATEGORY_ID`),
  KEY `fk_fb_domains_tag_type_idx` (`FALLBACK_DOMAINS_TAG_TYPE_ID`),
  CONSTRAINT `fk_cat` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `automation_type_categories` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_command` FOREIGN KEY (`COMMAND_COMP_TYPE_ID`) REFERENCES `lu_comp_types` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comp_type` FOREIGN KEY (`COMP_TYPE_ID`) REFERENCES `lu_comp_types` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_domain_tag_type` FOREIGN KEY (`DOMAINS_TAG_TYPE_ID`) REFERENCES `tag_types` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fb_domains_tag_type` FOREIGN KEY (`FALLBACK_DOMAINS_TAG_TYPE_ID`) REFERENCES `tag_types` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- rollback drop table automation_types