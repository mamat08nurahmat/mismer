-- ===========CREATE TABLE

CREATE TABLE IF NOT EXISTS `systemupload` (
  `BatchID` int(11) NOT NULL AUTO_INCREMENT,
  `UploadDate` datetime DEFAULT NULL,
  `UploadBy` int(11) DEFAULT NULL,
  `UploadRemark` varchar(255) DEFAULT NULL,
  `ApplicationSource` varchar(55) DEFAULT NULL,
  `ProcessYear` int(11) DEFAULT NULL,
  `ProcessMonth` int(11) DEFAULT NULL,
  `ProcessDate` int(11) DEFAULT NULL,
  `FilePath` varchar(255) DEFAULT NULL,
  `VirtualPath` varchar(255) DEFAULT NULL,
  `FileSize` varchar(255) DEFAULT NULL,
  `ReportPath` varchar(255) DEFAULT NULL,
  `RowDataCount` int(11) DEFAULT NULL,
  `RowDataSucceed` int(11) DEFAULT NULL,
  `RowDataFailed` int(11) DEFAULT NULL,
  `ApprovalID` int(11) DEFAULT 999,
  `IS_APPROVED` int(11) DEFAULT 0,
  
  PRIMARY KEY(BatchID)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


CREATE TABLE `templateuploadmismer` (
   -- `BatchID` int(11) NOT NULL,
  `MID` int(11) NOT NULL,
  `MERCHAN_DBA_NAME` varchar(55) DEFAULT NULL,
  `STATUS_EDC` varchar(55) DEFAULT NULL,
  `OPEN_DATE` date NOT NULL,
  `MSO` varchar(55) DEFAULT NULL,
  `SOURCE_CODE` varchar(255) DEFAULT NULL,
  `POS1` varchar(25) DEFAULT NULL,
  `IS_VALID` int(11) DEFAULT 0 ,
  `ID` int(11) NOT NULL AUTO_INCREMENT,  
  PRIMARY  KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- drop table templateuploadmismer
-- select * from templateuploadmismer

CREATE TABLE `mismerdetail` (
  `RowID` int(11) NOT NULL AUTO_INCREMENT,
  `BatchID` int(11) NOT NULL,
  `OPEN_DATE` date DEFAULT NULL,
  `MID` varchar(55) DEFAULT NULL,
  `MERCHAN_DBA_NAME` varchar(55) DEFAULT NULL,
  `MSO` varchar(55) DEFAULT NULL,
  `SOURCE_CODE` varchar(55) DEFAULT NULL,
  `POS1` varchar(55) DEFAULT NULL,
  `WILAYAH` varchar(55) DEFAULT NULL,
  `CHANNEL` varchar(55) DEFAULT NULL,
  `TYPE_MID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`RowID`)
) ENGINE=InnoDB AUTO_INCREMENT=437431 DEFAULT CHARSET=latin1;




CREATE TABLE `mismerunmatch` (
  `RowID` int(11) NOT NULL AUTO_INCREMENT,
  `BatchID` int(11) NOT NULL,
  `OPEN_DATE` date DEFAULT NULL,
  `MID` varchar(55) DEFAULT NULL,
  `MERCHAN_DBA_NAME` varchar(55) DEFAULT NULL,
  `MSO` varchar(55) DEFAULT NULL,
  `SOURCE_CODE` varchar(55) DEFAULT NULL,
  `POS1` varchar(55) DEFAULT NULL,
  `WILAYAH` varchar(55) DEFAULT NULL,
  `CHANNEL` varchar(55) DEFAULT NULL,
  `TYPE_MID` varchar(45) DEFAULT NULL,
`IS_UPDATE` int(11) DEFAULT 0 ,  
  PRIMARY KEY (`RowID`)
) ENGINE=InnoDB AUTO_INCREMENT=437431 DEFAULT CHARSET=latin1;

-- select * from  templateuploadunmatch

CREATE TABLE `templateuploadunmatch` (
  `OPEN_DATE` date DEFAULT NULL,
  `MID` varchar(55) DEFAULT NULL,
  `MERCHAN_DBA_NAME` varchar(55) DEFAULT NULL,
  `MSO` varchar(55) DEFAULT NULL,
  `SOURCE_CODE` varchar(55) DEFAULT NULL,
  `POS1` varchar(55) DEFAULT NULL,
  `WILAYAH` varchar(55) DEFAULT NULL,
  `CHANNEL` varchar(55) DEFAULT NULL,
  `TYPE_MID` varchar(45) DEFAULT NULL,
  `RowID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`RowID`)
) ENGINE=InnoDB AUTO_INCREMENT=437431 DEFAULT CHARSET=latin1;
