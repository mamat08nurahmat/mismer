
-- =========================================================================================
-- STEP 1 UPLOAD CSV 
-- =========================================================================================
-- by applikasi 
--  => mismer/administrator/systemupload/add
-- cek => 
SELECT * FROM systemupload
-- =========================================================================================
-- STEP 2 APPROVE CSV
-- =========================================================================================
-- => mismer/administrator/systemupload 
-- proses truncate templateuploadmismer and insert csv by query
-- import csv file to templateuploadmismer
-- cek
-- =========================================================================================
-- manual proses 
TRUNCATE `mismer`.`templateuploadmismer`;
-- MISMER_2018-08-20 
-- NAMA FILE CSV
-- LOAD DATA INFILE 'C:/xampp/htdocs/mismer/uploads/systemupload/template_upload.csv' 
LOAD DATA INFILE 'C:/xampp/htdocs/mismer/uploads/systemupload/MISMER_2018-09-03.csv' 
INTO TABLE templateuploadmismer 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
 IGNORE 1 ROWS;
 
 -- --------------
 SELECT count(*) FROM templateuploadmismer;

-- =========================================================================================
-- STEP 3 =====GENERATE==== 
-- =========================================================================================
-- cek
SELECT count(*) FROM mismerdetail

-- delete data di mismerdetail by batch terbaru di systemupload
CALL P_Delete_Mismerdetail_by_batchid();

-- insert into mismerdetail from templateuploadmismer
CALL P_Generate();

-- update EXH CHANNEl where BDA_MERCHAN_NAME like '%EXH%'
CALL P_update_EXH();

select distinct CHANNEL from mismerdetail -- WHERE WILAYAH IS NULL

SELECT 
ID,
RowID,
BatchID,
MID,
WILAYAH,
CHANNEL,
TYPE_MID,
0 ISUPDATE

 FROM mismerdetail
WHERE CHANNEL IS NULL AND TYPE_MID='EDC'
-- =========================================================================================
-- STEP 4 =====UNMATCH==== 
-- select unmatch mismerdetail WHERE null EDC inser into mismerunmatch
-- ?????
-- SELECT * FROM mismerunmatch
-- =========================================================================================
create table mismerunmatch (
ID int(11) not null auto_increment,
RowID int(11) not null,
BatchID int(11) not null,
MID int(11) not null,
CHANNEL varcahar(55),
WILAYAH varcahar(55),
TYPE_MID varcahar(55),
ISUPDATE int(5),
primary key(ID)
 
);


drop table mismerunmatch

CREATE TABLE `mismerunmatch` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RowID` int(11) NOT NULL,
  `BatchID` int(11) NOT NULL,
 
  `MID` varchar(55) DEFAULT NULL,



  `WILAYAH` varchar(55) DEFAULT NULL,
  `CHANNEL` varchar(55) DEFAULT NULL,
  `TYPE_MID` varchar(45) DEFAULT NULL,
  `ISUPDATE` int(11) DEFAULT 0,
  
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1376236 DEFAULT CHARSET=latin1






 
 -- ???
 -- INSERT SystemUpload
 -- SELECT * FROM SystemUpload
 
 -- ???
 -- INSERT MasterApproval
 
 -- cek
-- select count(*) from templateuploadmismer
-- CALL P_Generate();

-- SELECT * FROM MismerDetail

-- =========================================================================================
-- SET SQL_SAFE_UPDATES = 0;
 -- DELETE FROM MismerDetail WHERE BatchID=(SELECT max(BatchID) as BatchID FROM systemupload);  
 --  TRUNCATE `mismer`.`mismerdetail`;
-- P_reset();

-- ====================cek MismerDetail
-- SELECT COUNT(*) FROM MismerDetail
-- SELECT * FROM MismerDetail
-- ID, RowID, BatchID, OPEN_DATE, MID, MERCHAN_DBA_NAME, MSO, SOURCE_CODE, POS1, WILAYAH, CHANNEL, IS_YAP, EDC, EXH  


--  TRUNCATE `mismer`.`mid_mapping`;
-- SELECT * FROM `mismer`.`mid_mapping`;
