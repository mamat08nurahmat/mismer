
-- SELECT * FROM templateuploadmismer 
-- SELECT * FROM mismer.wilayah;
-- ===============================
-- STEP 1 UPLOAD CSV
TRUNCATE `mismer`.`templateuploadmismer`;


-- LOAD DATA INFILE 'c:/tmp/template_upload.csv' 
LOAD DATA INFILE 'C:/xampp/htdocs/mismer/uploads/systemupload/template_upload.csv' 
INTO TABLE templateuploadmismer 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
 IGNORE 1 ROWS;
 
 -- ???
 -- INSERT SystemUpload
 -- SELECT * FROM SystemUpload
 
 -- ???
 -- INSERT MasterApproval
 
 -- cek
-- select count(*) from templateuploadmismer
-- CALL P_Generate();

-- SELECT * FROM MismerDetail

-- GENERATE==================================================

-- CALL =========
-- CALL P_Delete_Mismerdetail_by_batchid();
-- CALL P_Generate();

-- ====================cek MismerDetail
-- SELECT COUNT(*) FROM MismerDetail
-- SELECT * FROM MismerDetail
  

INSERT INTO  MismerDetail

SELECT 
a.RowID as ID,
a.RowID,
(SELECT max(BatchID) as BatchID FROM systemupload) BatchID,

-- OPEN_DATE , --FROMAT CARDLINK Type Varchar
 -- CONVERT FORMAT DATE CARDLINK TO YYYMMDD
 -- CONVERT STR TO DATE date_format(str_to_date('2018/12/31', '%Y/%m/%d'), '%Y%m%d')
-- CONCAT("20",SUBSTRING(a.OPEN_DATE ,5,2), "/", SUBSTRING(a.OPEN_DATE ,3,2), "/", SUBSTRING(a.OPEN_DATE ,1,2)) as YYYMMDD ,

date_format(
str_to_date(
CONCAT("20",SUBSTRING(a.OPEN_DATE ,5,2), "/", SUBSTRING(a.OPEN_DATE ,3,2), "/", SUBSTRING(a.OPEN_DATE ,1,2)), '%Y/%m/%d'), '%Y/%m/%d')
AS OPEN_DATE , -- FORMAT YYYYMMDD

a.MID,
a.MERCHAN_DBA_NAME,
a.MSO,
a.SOURCE_CODE,
-- a.POS1,LEFT(CAST(a.POS1 AS UNSIGNED),1) as LEFT_INT,
-- STEP 2
-- CAST(PROD_CODE AS UNSIGNED) 
CASE
    WHEN CAST(a.POS1 AS UNSIGNED) < 100 THEN 1  -- convert varchar to int
    ELSE  LEFT(CAST(a.POS1 AS UNSIGNED),1)
END
as POS1
/**
,

-- ---CEK MSO
CASE
-- concat('',col1 * 1) = col1
    WHEN a.MSO = 100 THEN 1  -- convert varchar to int
    ELSE  LEFT(CAST(a.POS1 AS UNSIGNED),1)
END
 as KODE_WILAYAH,

**/

,
CASE
	WHEN LEFT(a.MSO,1)='A' THEN 'WMD'
	WHEN LEFT(a.MSO,1)='B' THEN 'WPD'
	WHEN LEFT(a.MSO,1)='C' THEN 'WPL'
	WHEN LEFT(a.MSO,1)='D' THEN 'WBN'
	WHEN LEFT(a.MSO,1)='E' THEN 'WSM'
	WHEN LEFT(a.MSO,1)='F' THEN 'WSY'
	WHEN LEFT(a.MSO,1)='G' THEN 'WMK'
	WHEN LEFT(a.MSO,1)='H' THEN 'WDR'
	WHEN LEFT(a.MSO,1)='I' THEN 'WBJ'
	WHEN LEFT(a.MSO,1)='J' THEN 'WMO'
	WHEN LEFT(a.MSO,1)='K' THEN 'WPU'
	WHEN LEFT(a.MSO,1)='L' THEN 'WJS'
	WHEN LEFT(a.MSO,1)='M' THEN 'WJK'
	WHEN LEFT(a.MSO,1)='N' THEN 'WJB'
	WHEN LEFT(a.MSO,1)='O' THEN 'WJY'
	WHEN LEFT(a.MSO,1)='R' THEN 'WYK'
	WHEN LEFT(a.MSO,1)='S' THEN 'WMA'
	
 	WHEN LEFT(a.MSO,1)='' THEN 'BLANK'
-- 	WHEN CAST(LEFT(a.MSO,1) as UNSIGNED) between 0 AND 9 THEN 'MBR'
  	ELSE 'ELSE'
END

as WILAYAH,

CASE
	WHEN RIGHT(a.MSO,2)='01' THEN '01.MBA'
	WHEN RIGHT(a.MSO,2)='02' THEN '02.MBR'
	WHEN RIGHT(a.MSO,2)='03' THEN '03.TDP'
	WHEN RIGHT(a.MSO,2)='04' THEN '04.TPU'
	WHEN RIGHT(a.MSO,2)='05' THEN '05.BDP'
	WHEN RIGHT(a.MSO,2)='06' THEN '06.PPP'
	WHEN RIGHT(a.MSO,2)='07' THEN '07.CABANG'
	WHEN RIGHT(a.MSO,2)='' THEN 'BLANK'
	-- WHEN CAST(LEFT(a.MSO,1) as UNSIGNED) between 0 AND 9 THEN '02-MBR'
    ELSE  'ELSE'
END
 as CHANNEL,
 
  CASE
	WHEN LEFT(a.MSO,1)!='Q'  THEN 0
    ELSE 1
 END
 
 as IS_YAP, -- KODE Q IS_YAP
 
-- POS1 ---> jumlah EDC
CASE
    WHEN CAST(a.POS1 AS UNSIGNED) < 100 THEN 1  -- convert varchar to int
    ELSE  LEFT(CAST(a.POS1 AS UNSIGNED),1)
END
as EDC, 
 
  CASE
	WHEN LEFT(a.MSO,1)='Q'  THEN 1
    ELSE 0
END
 
 as EXH
--     
-- 999 EDC,
 -- 999 EXH
 
FROM templateuploadmismer a 
-- LEFT JOIN wilayah b ON LEFT(a.MSO,1)=b.KodeWilaya
/*
 WHERE 
-- STEP 1 MSO SELAI kode Q
 LEFT(a.MSO,1)!='Q' 
-- AND CAST(a.POS1 AS UNSIGNED) > 100

-- STEP 3
AND LEFT(a.MID,1)!='3' -- selain kode 3 (YAP)
-- AND RIGHT(a.MSO,2)='02'
-- MSO KOSONG
-- AND LEFT(a.MSO,1)!=''
-- AND concat('',col1 * 1) = col1
-- LIMIT 3
*/

