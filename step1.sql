
--  SELECT * FROM templateuploadmismer 
--  SELECT COUNT(*)FROM templateuploadmismer 
--  TRUNCATE `mismer`.`templateuploadmismer`;

-- =========================================================================================
-- STEP 1 APPROVE CSV
-- import csv file to templateuploadmismer
-- =========================================================================================
TRUNCATE `mismer`.`templateuploadmismer`;
-- MISMER_2018-08-20 
-- NAMA FILE CSV
-- LOAD DATA INFILE 'C:/xampp/htdocs/mismer/uploads/systemupload/template_upload.csv' 
LOAD DATA INFILE 'C:/xampp/htdocs/mismer/uploads/systemupload/MISMER_2018-08-20.csv' 
INTO TABLE templateuploadmismer 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
 IGNORE 1 ROWS;
-- =========================================================================================
 
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

-- =========================================================================================
-- STEP 2 =====GENERATE==== 
-- insert into mismerdetail
CALL P_Delete_Mismerdetail_by_batchid();
CALL P_Generate();
-- =========================================================================================

-- ====================cek MismerDetail
-- SELECT COUNT(*) FROM MismerDetail
-- SELECT * FROM MismerDetail
-- ID, RowID, BatchID, OPEN_DATE, MID, MERCHAN_DBA_NAME, MSO, SOURCE_CODE, POS1, WILAYAH, CHANNEL, IS_YAP, EDC, EXH  


--  TRUNCATE `mismer`.`mid_mapping`;
-- SELECT * FROM `mismer`.`mid_mapping`;
CALL P_mapping_mid();
