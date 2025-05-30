-- BLUAI_AI.AI_DEPLOY definition

CREATE TABLE `AI_DEPLOY` (
  `DEPLOY_CD` varchar(12) NOT NULL,
  `AI_CD` varchar(10) NOT NULL,
  `DEPLOY_TYPE` varchar(3) NOT NULL,
  `PATH` varchar(200) NOT NULL,
  `CRN_USR` varchar(64) NOT NULL,
  `CRN_DTM` datetime NOT NULL,
  `UPT_DTM` datetime NOT NULL,
  PRIMARY KEY (`DEPLOY_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.AI_PROJECT definition

CREATE TABLE `AI_PROJECT` (
  `AI_CD` varchar(10) NOT NULL,
  `AI_TYPE` varchar(2) DEFAULT NULL,
  `AI_VER` int(3) DEFAULT NULL,
  `TITLE` varchar(64) NOT NULL,
  `OBJECT_TYPE` varchar(1) NOT NULL,
  `DATA_TYPE` varchar(1) NOT NULL,
  `DESC_TXT` varchar(2000) DEFAULT NULL,
  `THUM_NAIL_CD` varchar(8) DEFAULT NULL,
  `PATH` varchar(200) DEFAULT NULL,
  `AI_ACC` float DEFAULT NULL,
  `CRN_USR` varchar(128) NOT NULL,
  `CRN_DTM` datetime DEFAULT NULL,
  `UPT_DTM` datetime DEFAULT NULL,
  `AI_STS` varchar(8) NOT NULL,
  `TRAIN_SRT_DTM` datetime DEFAULT NULL,
  `TRAIN_END_DTM` datetime DEFAULT NULL,
  `TRAIN_TIME` double DEFAULT 0,
  `GPU_RATE` float DEFAULT NULL,
  `SET_DATASET` tinyint(1) DEFAULT 0,
  `SET_CLASSINFO` tinyint(1) DEFAULT 0,
  `AI_PID` int(11) DEFAULT NULL,
  `NETWORK_NAME` varchar(100) DEFAULT NULL,
  `LAST_MSG` varchar(4000) DEFAULT NULL,
  `AI_SIZE` int(11) DEFAULT NULL,
  PRIMARY KEY (`AI_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.AI_PROJECT_NUMBER definition

CREATE TABLE `AI_PROJECT_NUMBER` (
  `DATA_TYPE` varchar(1) NOT NULL,
  `OBJECT_TYPE` varchar(1) NOT NULL,
  `YEAR_NUM` varchar(4) NOT NULL,
  `SEQ` int(11) NOT NULL,
  `CRN_DTM` datetime NOT NULL,
  PRIMARY KEY (`DATA_TYPE`,`OBJECT_TYPE`,`YEAR_NUM`),
  UNIQUE KEY `DATA_TYPE` (`DATA_TYPE`,`OBJECT_TYPE`,`YEAR_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.BASE_MODELS definition

CREATE TABLE `BASE_MODELS` (
  `NETWORK_CD` int(11) NOT NULL AUTO_INCREMENT,
  `NETWORK_INFO` text NOT NULL,
  `OBJECT_TYPE` varchar(1) NOT NULL,
  `DATA_TYPE` varchar(1) NOT NULL,
  `NETWORK_NAME` varchar(64) NOT NULL,
  `NETWORK_PATH` varchar(64) NOT NULL,
  `PIRIORITY` int(11) DEFAULT 2,
  PRIMARY KEY (`NETWORK_CD`,`OBJECT_TYPE`,`DATA_TYPE`,`NETWORK_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.CAM_LIST definition

CREATE TABLE `CAM_LIST` (
  `HW_CD` int(11) NOT NULL AUTO_INCREMENT,
  `HW_TYPE` varchar(1) NOT NULL,
  `IS_CD` int(11) DEFAULT NULL,
  `CAM_SERIAL` varchar(64) NOT NULL,
  `SRV_IP` varchar(15) NOT NULL,
  `SRV_PORT` int(11) NOT NULL,
  `HW_TITLE` varchar(64) DEFAULT NULL,
  `DESC_TXT` varchar(2000) DEFAULT NULL,
  `HW_IP` varchar(15) DEFAULT NULL,
  `HW_PORT` int(11) DEFAULT NULL,
  `FILE_PPM` float DEFAULT NULL,
  PRIMARY KEY (`HW_CD`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.CODE_INFO definition

CREATE TABLE `CODE_INFO` (
  `CODE_TYPE` int(11) NOT NULL,
  `DP_NAME` varchar(32) NOT NULL,
  `DB_NAME` varchar(32) NOT NULL,
  PRIMARY KEY (`CODE_TYPE`,`DP_NAME`,`DB_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.CODE_KIND definition

CREATE TABLE `CODE_KIND` (
  `CODE_TYPE` int(11) NOT NULL AUTO_INCREMENT,
  `CODE_KIND` varchar(32) NOT NULL,
  `CODE_LOCATION` varchar(32) NOT NULL,
  PRIMARY KEY (`CODE_TYPE`,`CODE_KIND`,`CODE_LOCATION`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.COMPONENT_DEF definition

CREATE TABLE `COMPONENT_DEF` (
  `COMP_TYPE` int(11) NOT NULL,
  `IS_TYPE` varchar(1) NOT NULL,
  `DEF_TXT` varchar(4000) NOT NULL,
  `COMPONENT_NAME` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`COMP_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.DATASET definition

CREATE TABLE `DATASET` (
  `DATASET_CD` varchar(8) NOT NULL,
  `TITLE` varchar(64) NOT NULL,
  `DESC_TXT` varchar(2000) DEFAULT NULL,
  `OBJECT_TYPE` varchar(1) NOT NULL,
  `DATA_TYPE` varchar(1) NOT NULL,
  `CRN_USR` varchar(64) NOT NULL,
  `CRN_DTM` datetime NOT NULL,
  `UPT_DTM` datetime DEFAULT NULL,
  `THUM_NAIL_CD` varchar(8) DEFAULT NULL,
  `CATEGORY1` varchar(64) DEFAULT NULL,
  `CATEGORY2` varchar(64) DEFAULT NULL,
  `CATEGORY3` varchar(64) DEFAULT NULL,
  `DATASET_STS` varchar(10) DEFAULT NULL,
  `PID` int(11) DEFAULT NULL,
  `LAST_MSG` varchar(4000) DEFAULT NULL,
  `AUTO_ACC` float DEFAULT NULL,
  `AUTO_MODEL` varchar(32) DEFAULT NULL,
  `AUTO_EPOCH` int(11) DEFAULT 0,
  `UPLOAD_TYPE` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`DATASET_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.DATASET_NUMBER definition

CREATE TABLE `DATASET_NUMBER` (
  `DATA_TYPE` varchar(1) NOT NULL,
  `OBJECT_TYPE` varchar(1) NOT NULL,
  `YEAR_NUM` varchar(2) NOT NULL,
  `SEQ` int(11) NOT NULL,
  `CRN_DTM` datetime NOT NULL,
  PRIMARY KEY (`DATA_TYPE`,`OBJECT_TYPE`,`YEAR_NUM`),
  UNIQUE KEY `DATA_TYPE` (`DATA_TYPE`,`OBJECT_TYPE`,`YEAR_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.DATASET_TAGINFO definition

CREATE TABLE `DATASET_TAGINFO` (
  `TAG_CD` bigint(20) NOT NULL AUTO_INCREMENT,
  `DATASET_CD` varchar(8) NOT NULL,
  `NAME` varchar(64) NOT NULL,
  `CLASS_CD` varchar(8) DEFAULT NULL,
  `DESC_TXT` varchar(2000) DEFAULT NULL,
  `COLOR` varchar(8) DEFAULT NULL,
  `PRE_MDL_CD` varchar(10) DEFAULT NULL,
  `PRE_CLASS_CD` varchar(8) DEFAULT NULL,
  `CLASS_SUFFIX` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`TAG_CD`,`DATASET_CD`,`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=2625 DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.DATA_CATEGORY definition

CREATE TABLE `DATA_CATEGORY` (
  `CATEGORY_SEQ` int(11) NOT NULL,
  `DEPTH` int(11) NOT NULL,
  `PARENTS_SEQ` int(11) NOT NULL,
  `CATEGORY_NAME` varchar(64) NOT NULL,
  `OBJECT_TYPE` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.DATA_ELEMENT definition

CREATE TABLE `DATA_ELEMENT` (
  `DATASET_CD` varchar(8) NOT NULL,
  `DATA_CD` varchar(8) NOT NULL,
  `DATA_STATUS` varchar(16) DEFAULT NULL,
  `FILE_NAME` varchar(256) NOT NULL,
  `FILE_EXT` varchar(10) NOT NULL,
  `FILE_TYPE` varchar(1) NOT NULL,
  `FILE_PATH` varchar(800) NOT NULL,
  `CRN_DTM` datetime NOT NULL,
  `UPT_DTM` datetime DEFAULT NULL,
  `TAG_CD` int(11) DEFAULT NULL,
  `FILE_SIZE` float NOT NULL,
  `ANNO_DATA` varchar(4000) DEFAULT NULL,
  `FPS` float DEFAULT NULL,
  `IS_ANNO` tinyint(1) DEFAULT NULL,
  `ANNO_CNT` int(11) DEFAULT NULL,
  `TAG_CNT` int(11) DEFAULT NULL,
  `FILE_RELPATH` varchar(800) DEFAULT NULL,
  PRIMARY KEY (`DATASET_CD`,`DATA_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.FILE_LIST definition

CREATE TABLE `FILE_LIST` (
  `FILE_SEQ` int(11) NOT NULL AUTO_INCREMENT,
  `IS_CD` int(11) NOT NULL,
  `CRN_DTM` datetime NOT NULL,
  `FILE_PATH` varchar(128) NOT NULL,
  `FILE_NAME` varchar(256) NOT NULL,
  `FILE_EXT` varchar(32) NOT NULL,
  `FILE_SIZE` int(11) NOT NULL,
  `IS_PREDICT` tinyint(1) DEFAULT 0,
  `RESULT_PATH` varchar(800) DEFAULT NULL,
  `UPT_DTM` datetime DEFAULT NULL,
  `FILE_PPM` float DEFAULT 0,
  `FILE_FPS` float DEFAULT 0,
  PRIMARY KEY (`FILE_SEQ`,`IS_CD`,`FILE_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.HW_LIST definition

CREATE TABLE `HW_LIST` (
  `SEQ` int(11) NOT NULL,
  `HW_CD` varchar(32) DEFAULT NULL,
  `HW_TYPE` varchar(1) NOT NULL,
  `HW_TITLE` varchar(64) NOT NULL,
  `DESC_TXT` varchar(2000) DEFAULT NULL,
  `CAM_SERIAL` varchar(128) NOT NULL,
  `TGT_IP` varchar(12) NOT NULL,
  `TGT_PORT` varchar(6) NOT NULL,
  `MDL_NAME` varchar(64) DEFAULT NULL,
  `MDL_PATH` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.INPUT_SCHEDULE definition

CREATE TABLE `INPUT_SCHEDULE` (
  `IS_CD` int(11) NOT NULL,
  `SCHEDULE` varchar(32) NOT NULL,
  `USE_YN` varchar(1) NOT NULL,
  `CRN_DTM` datetime NOT NULL,
  PRIMARY KEY (`IS_CD`),
  UNIQUE KEY `IS_CD` (`IS_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.INPUT_SOURCE definition

CREATE TABLE `INPUT_SOURCE` (
  `IS_CD` int(11) NOT NULL AUTO_INCREMENT,
  `IS_TITLE` varchar(64) NOT NULL,
  `DESC_TXT` varchar(2000) DEFAULT NULL,
  `OBJECT_TYPE` varchar(1) NOT NULL,
  `IS_TYPE` varchar(1) NOT NULL,
  `IS_PATH` varchar(128) DEFAULT NULL,
  `CRN_USR` varchar(64) NOT NULL,
  `CRN_DTM` datetime NOT NULL,
  `UPT_DTM` datetime DEFAULT NULL,
  `SCHEDULE_YN` varchar(1) DEFAULT NULL,
  `IS_SAVED` tinyint(1) NOT NULL,
  `SCH_WEEKOPTION` varchar(16) DEFAULT NULL,
  `SCH_OPTION2` varchar(16) DEFAULT NULL,
  `SCH_TIME` varchar(16) DEFAULT NULL,
  `AI_CD` varchar(30) DEFAULT NULL,
  `MDL_TYPE` varchar(1) DEFAULT NULL,
  `SRV_PID` int(11) DEFAULT NULL,
  `HW_PID` int(11) DEFAULT NULL,
  `STATUS` varchar(1) DEFAULT NULL,
  `STATUS_MSG` varchar(4000) DEFAULT NULL,
  `STATUS_TIME` datetime(6) DEFAULT NULL,
  `STATUS_CODE` varchar(5) DEFAULT NULL,
  `ERR_MSG` varchar(4000) DEFAULT NULL,
  `IS_STS` varchar(10) DEFAULT NULL,
  `NETWORK_NAME` varchar(100) DEFAULT NULL,
  `MDL_PATH` varchar(300) DEFAULT NULL,
  `MDL_EPOCH` int(11) DEFAULT NULL,
  `SERVICE_PORT` int(11) DEFAULT NULL,
  `SERVICE_AUTH` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`IS_CD`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.`LANGUAGE` definition

CREATE TABLE `LANGUAGE` (
  `LANG_INFO` text NOT NULL,
  `CRN_DTM` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.LEGACY_MODELOPTIONS definition

CREATE TABLE `LEGACY_MODELOPTIONS` (
  `MDL_KIND` varchar(64) NOT NULL,
  `MDL_NM` varchar(64) NOT NULL,
  `OBJECT_TYPE` varchar(1) NOT NULL,
  `DATA_TYPE` varchar(1) NOT NULL,
  `PARAM` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.LEGACY_MODELS definition

CREATE TABLE `LEGACY_MODELS` (
  `MDL_KIND` varchar(64) NOT NULL,
  `MDL_NM` varchar(64) NOT NULL,
  `OBJECT_TYPE` varchar(1) NOT NULL,
  `DATA_TYPE` varchar(1) NOT NULL,
  `MDL_PATH` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.OUTPUT_TYPE definition

CREATE TABLE `OUTPUT_TYPE` (
  `OUT_CD` int(11) NOT NULL AUTO_INCREMENT,
  `IS_CD` int(11) DEFAULT NULL,
  `CLASS_CD` int(11) NOT NULL,
  `CLASS_NAME` varchar(64) NOT NULL,
  `DP_LABEL` varchar(32) NOT NULL,
  `COLOR` varchar(8) DEFAULT NULL,
  `ACC_SCOPE` varchar(32) DEFAULT NULL,
  `LOCATION` varchar(1) DEFAULT NULL,
  `HW_CD` bigint(20) DEFAULT NULL,
  `TARGET` varchar(10) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`OUT_CD`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.PRE_TRAINED_CLASS definition

CREATE TABLE `PRE_TRAINED_CLASS` (
  `CLASS_CD` bigint(20) NOT NULL,
  `MDL_PATH` varchar(200) NOT NULL,
  `CLASS_DP_NAME` varchar(128) NOT NULL,
  `OBJECT_TYPE` varchar(1) NOT NULL,
  `MDL_TYPE` varchar(1) NOT NULL,
  `BASE_MDL` varchar(64) DEFAULT NULL,
  `BASE_DATASET` varchar(64) DEFAULT NULL,
  `CATEGORY1` varchar(64) NOT NULL,
  `CATEGORY2` varchar(64) NOT NULL,
  `CATEGORY3` varchar(64) NOT NULL,
  `CLASS_DB_NAME` varchar(128) NOT NULL,
  PRIMARY KEY (`CLASS_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.PRJINPUT_LIST definition

CREATE TABLE `PRJINPUT_LIST` (
  `QP_CD` int(11) NOT NULL,
  `IS_CD` int(11) NOT NULL,
  `UPT_DTM` datetime NOT NULL,
  PRIMARY KEY (`QP_CD`,`IS_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.PRJ_LAYOUT definition

CREATE TABLE `PRJ_LAYOUT` (
  `QP_CD` int(11) NOT NULL,
  `SEQ` int(11) NOT NULL,
  `IS_CD` int(11) NOT NULL,
  `COMP_TYPE` int(11) DEFAULT NULL,
  `IS_VISIBLE` tinyint(1) DEFAULT NULL,
  `LAYOUT` varchar(4000) DEFAULT NULL,
  `IS_TITLE` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`QP_CD`,`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.PRJ_REPORT definition

CREATE TABLE `PRJ_REPORT` (
  `INS_TIME` datetime(6) NOT NULL COMMENT '수신시간',
  `SEQ` int(11) NOT NULL,
  `IS_TYPE` varchar(1) NOT NULL,
  `IS_CD` int(11) NOT NULL,
  `CLASS_CD` int(11) NOT NULL,
  `RAW_TIME` datetime(6) DEFAULT NULL COMMENT '해결시간',
  `COLOR` varchar(8) DEFAULT NULL,
  `DP_LABEL` varchar(32) NOT NULL,
  `CLASS_CNT` int(11) DEFAULT NULL,
  `LOCATION` varchar(1) DEFAULT NULL,
  `ACCURACY` float DEFAULT NULL,
  `RESULT_MSG` varchar(2000) DEFAULT NULL,
  `RESULT_PATH` varchar(128) DEFAULT NULL,
  `OUTPUT_PATH` varchar(128) DEFAULT NULL,
  `RESULT_URL` varchar(128) DEFAULT NULL,
  `OBJECT_TYPE` varchar(1) DEFAULT NULL,
  `FILE_INFO` varchar(2000) DEFAULT NULL,
  `PRC_TIME` double DEFAULT NULL COMMENT '예측시간',
  `REQ_DATA` longtext DEFAULT NULL,
  `RESULT_DATA` longtext DEFAULT NULL,
  `RS_STATUS` int(11) DEFAULT 0,
  `OUT_CD` int(11) DEFAULT NULL,
  `REQ_NO` int(11) DEFAULT 0,
  PRIMARY KEY (`INS_TIME`,`SEQ`,`IS_TYPE`,`IS_CD`,`CLASS_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.Q_PROJECT definition

CREATE TABLE `Q_PROJECT` (
  `QP_CD` int(11) NOT NULL AUTO_INCREMENT,
  `QP_TITLE` varchar(64) NOT NULL,
  `DESC_TXT` varchar(2000) NOT NULL,
  `CRN_USR` varchar(64) NOT NULL,
  `CRN_DTM` datetime NOT NULL,
  `UPT_DTM` datetime NOT NULL,
  PRIMARY KEY (`QP_CD`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.`ROLE` definition

CREATE TABLE `ROLE` (
  `ROLE_NM` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.SELECTED_MODEL definition

CREATE TABLE `SELECTED_MODEL` (
  `AI_CD` varchar(10) NOT NULL,
  `OBJECT_TYPE` varchar(1) NOT NULL,
  `DATA_TYPE` varchar(1) NOT NULL,
  `EPOCH` int(11) DEFAULT 0,
  `MDL_IDX` int(11) DEFAULT 0,
  `UPT_DTM` datetime NOT NULL,
  PRIMARY KEY (`AI_CD`,`UPT_DTM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.SYSTEM_LOG definition

CREATE TABLE `SYSTEM_LOG` (
  `LOG_CD` varchar(3) NOT NULL,
  `LOG_DTM` datetime(6) NOT NULL,
  `LOG_MSG` text NOT NULL,
  `ERR_MSG` text DEFAULT NULL,
  PRIMARY KEY (`LOG_CD`,`LOG_DTM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.SYSTEM_RESOURCE definition

CREATE TABLE `SYSTEM_RESOURCE` (
  `MRM_DTM` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `DISK_NM` varchar(64) DEFAULT NULL,
  `DISK_FULL_VOL` float DEFAULT NULL,
  `DISK_USED_VOL` float DEFAULT NULL,
  `DISK_USED_RATE` float DEFAULT NULL,
  `RAM_FULL_VOL` float DEFAULT NULL,
  `RAM_USED_VOL` float DEFAULT NULL,
  `RAM_USED_RATE` float DEFAULT NULL,
  `GPU_NM` varchar(64) NOT NULL,
  `GPU_FULL_VOL` float DEFAULT NULL,
  `GPU_USED_VOL` float DEFAULT NULL,
  `GPU_USED_RATE` float DEFAULT NULL,
  PRIMARY KEY (`MRM_DTM`,`GPU_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.TAB_ANALYSIS definition

CREATE TABLE `TAB_ANALYSIS` (
  `DATASET_CD` varchar(8) DEFAULT NULL,
  `ROW_CNT` int(11) DEFAULT NULL,
  `COL_CNT` int(11) DEFAULT NULL,
  `COLS` text DEFAULT NULL,
  `COL_INFO` longtext DEFAULT NULL,
  `TARGET` varchar(100) DEFAULT NULL,
  `SAMPLES` longtext DEFAULT NULL,
  `CLASS_CNT` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.TAB_FEATUREINFO definition

CREATE TABLE `TAB_FEATUREINFO` (
  `DATASET_CD` varchar(8) NOT NULL,
  `COLUMN_NM` varchar(64) NOT NULL,
  `COLUMN_ALIAS` varchar(64) DEFAULT NULL,
  `DEFAULT_VALUE` varchar(32) DEFAULT NULL,
  `IS_CLASS` tinyint(1) DEFAULT 0,
  `COLUMN_IDX` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`DATASET_CD`,`COLUMN_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.TAB_TRAINFEATURE definition

CREATE TABLE `TAB_TRAINFEATURE` (
  `AI_CD` varchar(10) NOT NULL,
  `DATASET_CD` varchar(8) NOT NULL,
  `COLUMN_NM` varchar(64) NOT NULL,
  `COLUMN_ALIAS` varchar(64) DEFAULT NULL,
  `DEFAULT_VALUE` varchar(32) DEFAULT NULL,
  `COLUMN_IDX` int(11) DEFAULT 0,
  PRIMARY KEY (`AI_CD`,`DATASET_CD`,`COLUMN_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.TAB_TRAINSET definition

CREATE TABLE `TAB_TRAINSET` (
  `AI_CD` varchar(10) NOT NULL,
  `DATASET_CD` varchar(8) NOT NULL,
  `TARGET` varchar(64) DEFAULT NULL,
  `SPLIT_YN` varchar(1) NOT NULL,
  `FE_MODE` varchar(10) DEFAULT NULL NULL,
  `DATASET_SPLIT` float DEFAULT NULL,
  `TEST_DATASET_CD` varchar(8) DEFAULT NULL,
  `UPT_DTM` datetime NOT NULL,
  PRIMARY KEY (`AI_CD`,`DATASET_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.TRAIN_CLASSINFO definition

CREATE TABLE `TRAIN_CLASSINFO` (
  `TAG_CD` bigint(20) NOT NULL AUTO_INCREMENT,
  `AI_CD` varchar(10) NOT NULL,
  `NAME` varchar(64) NOT NULL,
  `DESC_TXT` varchar(2000) DEFAULT NULL,
  `COLOR` varchar(8) DEFAULT NULL,
  `ELEMENT_TAGS` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`TAG_CD`,`AI_CD`,`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=1876 DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.TRAIN_DATALIST definition

CREATE TABLE `TRAIN_DATALIST` (
  `DATALIST_CD` bigint(20) NOT NULL AUTO_INCREMENT,
  `AI_CD` varchar(10) NOT NULL,
  `DATASET_CD` varchar(8) NOT NULL,
  `TAG_CD` int(11) DEFAULT NULL,
  `DATA_CD` varchar(8) NOT NULL,
  `UPT_DTM` datetime NOT NULL,
  PRIMARY KEY (`DATALIST_CD`,`AI_CD`,`DATASET_CD`,`DATA_CD`)
) ENGINE=InnoDB AUTO_INCREMENT=1223355 DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.TRAIN_LOG definition

CREATE TABLE `TRAIN_LOG` (
  `AI_CD` varchar(10) NOT NULL,
  `EPOCH` int(11) NOT NULL,
  `UPT_DTM` datetime NOT NULL,
  `OBJECT_TYPE` varchar(1) NOT NULL,
  `DATA_TYPE` varchar(1) NOT NULL,
  `GPU_RATE` float DEFAULT NULL,
  `CRN_USR` varchar(128) NOT NULL,
  `AI_LOSS` float DEFAULT NULL,
  `AI_ACC` float DEFAULT NULL,
  `AI_VAL_LOSS` float DEFAULT NULL,
  `AI_VAL_ACC` float DEFAULT NULL,
  `IS_LAST` tinyint(1) DEFAULT NULL,
  `R2_SCORE` float DEFAULT NULL,
  `MSE` float DEFAULT NULL,
  `MAE` float DEFAULT NULL,
  `RMSE` float DEFAULT NULL,
  `AI_PRECISION` float DEFAULT NULL,
  `AI_RECALL` float DEFAULT NULL,
  `F1` float DEFAULT NULL,
  `MDL_IDX` int(11) NOT NULL DEFAULT 0,
  `IS_PREDICT` tinyint(1) DEFAULT 0,
  `REMANING_TIME` float DEFAULT 0,
  PRIMARY KEY (`AI_CD`,`EPOCH`,`MDL_IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.TRAIN_MODELINFO definition

CREATE TABLE `TRAIN_MODELINFO` (
  `AI_CD` varchar(10) NOT NULL,
  `IS_AUTO` tinyint(1) NOT NULL,
  `EPOCH` int(11) DEFAULT NULL,
  `BATCH_SIZE` int(11) DEFAULT NULL,
  `ACTIVE_FUNC` varchar(32) DEFAULT NULL,
  `OPTIMIZER` varchar(32) DEFAULT NULL,
  `LOSS_FUNC` varchar(32) DEFAULT NULL,
  `IS_TRANSFER` tinyint(1) DEFAULT NULL,
  `BASE_AI_CD` varchar(10) DEFAULT NULL,
  `NETWORK_NAME` varchar(100) DEFAULT NULL,
  `NETWORK_PATH` varchar(256) DEFAULT NULL,
  `GPU_INDEX` varchar(1000) DEFAULT NULL,
  `GPU_LIMIT` float DEFAULT NULL,
  `MAX_TRIAL` int(11) DEFAULT NULL,
  `IS_EARLYSTOP` tinyint(1) DEFAULT NULL,
  `EARLY_MONITOR` varchar(20) DEFAULT NULL,
  `EARLY_MODE` varchar(5) DEFAULT NULL,
  `IMG_SIZE` int(11) DEFAULT NULL,
  `IMG_CHANNEL` int(11) DEFAULT NULL,
  `LAGACY_MDL_NM` varchar(64) DEFAULT NULL,
  `MDL_IDX` int(11) NOT NULL DEFAULT 0,
  `MDL_ALIAS` varchar(128) DEFAULT NULL,
  `PARAM` varchar(4000) DEFAULT NULL,
  `MDL_STS` varchar(16) DEFAULT NULL,
  `LAST_MSG` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`AI_CD`,`MDL_IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.USABLE_MODEL definition

CREATE TABLE `USABLE_MODEL` (
  `AI_CD` varchar(10) NOT NULL,
  `OBJECT_TYPE` varchar(1) NOT NULL,
  `TITLE` varchar(64) NOT NULL,
  `DESC_TXT` varchar(2000) DEFAULT NULL,
  `PATH` varchar(200) NOT NULL,
  `AI_ACC` float DEFAULT NULL,
  `CRN_USR` varchar(64) DEFAULT NULL,
  `CRN_DTM` datetime NOT NULL,
  `UPT_DTM` datetime NOT NULL,
  `SRC_LOC` varchar(1) NOT NULL,
  PRIMARY KEY (`AI_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.USERS definition

CREATE TABLE USERS(	
  `USER_ID` VARCHAR(100) NOT NULL,
	`USER_NM` VARCHAR(100) NOT NULL,
	`USER_PW` VARCHAR(256) NOT NULL,
	`ROLE` VARCHAR(100) NOT NULL,
	`PREV_PW` VARCHAR(256) NOT NULL,
	`USE` CHAR(1) NOT NULL,
	`LOGIN_CNT` VARCHAR(10) NOT NULL,
	`CRN_DTM` datetime NOT NULL,
  `UPT_DTM` datetime NOT NULL,
	PRIMARY KEY (USER_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.USER_INFO definition

CREATE TABLE `USER_INFO` (
  `USER_EMAIL` varchar(128) NOT NULL,
  `PASSWD` varchar(128) NOT NULL,
  `NAME` varchar(64) NOT NULL,
  `CRN_DTM` datetime NOT NULL,
  `UPT_DTM` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.USER_SERVICE_SCRIPT definition

CREATE TABLE `USER_SERVICE_SCRIPT` (
  `IS_CD` int(11) NOT NULL,
  `SCRIPT_PATH` varchar(255) NOT NULL,
  `UPT_DTM` datetime NOT NULL,
  `CRN_USER` varchar(256) DEFAULT NULL,
  `USER_SCRIPT` longtext DEFAULT NULL,
  `STATE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`IS_CD`,`SCRIPT_PATH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 블루아이 테뷸러 데이터베이스 정보 저장
CREATE TABLE `TAB_DBINFO` (
  `DATASET_CD` varchar(8) NOT NULL,
  `DB_SEQ` int(11) NOT NULL,
  `CLIENT` varchar(16) NOT NULL,
  `ADDRESS` varchar(256) NOT NULL,
  `PORT` int(11) NOT NULL,
  `DBNAME` varchar(64) NOT NULL,
  `USER` varchar(128) NOT NULL,
  `PASSWORD` varchar(128) NOT NULL,
  `QUERY` longtext NOT NULL,
  `IS_TEST` tinyint(1) NOT NULL,
  `LIMIT` int(11) DEFAULT 5,
  PRIMARY KEY (`DATASET_CD`, `DB_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- BLUAI_AI.TANGO_PROJECT ID definition

CREATE TABLE `TANGO_PROJECT` (
  `PROJECT_ID` varchar(50) NOT NULL,
  `USER_ID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;