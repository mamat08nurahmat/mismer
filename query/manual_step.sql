


/*
 truncate templateuploadmismer;
 truncate mismerdetail;
 
 truncate mismerunmatch;
 truncate templateuploadunmatch;
*/
 
-- select * from systemupload
-- ==================
-- STEP 1 BULK IMPORT CSV templateuploadmimser
-- ==================
truncate templateuploadmismer;

LOAD DATA INFILE 'C:/xampp/htdocs/cicooldev/sample_csv/DevUploadMismer.csv' 
INTO TABLE templateuploadmismer
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
 IGNORE 1 ROWS
(MID,MERCHAN_DBA_NAME,STATUS_EDC,@OPEN_DATE,MSO,SOURCE_CODE,POS1,IS_VALID,ID)
SET OPEN_DATE = STR_TO_DATE(@OPEN_DATE, '%m/%d/%Y');


-- truncate templateuploadmismer
-- select * from templateuploadmismer
-- select count(*) from templateuploadmismer

-- ==================
-- STEP 2 INSERT INTO mismerdetail
-- ==================
 -- SET SQL_SAFE_UPDATES = 0; 
 -- -------
-- delete from mismerdetail where MID IN(select MID from templateuploadmismer)
-- =========================================================
INSERT INTO mismerdetail

SELECT 
NULL RowID,
-- (SELECT max(BatchID) as BatchID FROM systemupload WHERE ApplicationSource='MISMER') BatchID, -- !!!
 999 BatchID, -- dev

--  date_format(str_to_date(a.OPEN_DATE,'%m/%d/%Y'),'%Y/%m/%d')
-- AS OPEN_DATE , 

a.OPEN_DATE,
a.MID,
a.MERCHAN_DBA_NAME,
a.MSO,
a.SOURCE_CODE,

CASE
	WHEN a.POS1 <= 100 THEN 1
	ELSE LEFT(a.POS1,1)
END
AS
POS1,

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
    
	WHEN SUBSTRING(a.MID,2,2)='01' THEN 'WMD'
	WHEN SUBSTRING(a.MID,2,2)='02' THEN 'WPD'
	WHEN SUBSTRING(a.MID,2,2)='03' THEN 'WPL'
	WHEN SUBSTRING(a.MID,2,2)='04' THEN 'WBN'
	WHEN SUBSTRING(a.MID,2,2)='05' THEN 'WSM'
	WHEN SUBSTRING(a.MID,2,2)='06' THEN 'WSY'
	WHEN SUBSTRING(a.MID,2,2)='07' THEN 'WMK'
	WHEN SUBSTRING(a.MID,2,2)='08' THEN 'WDR'
	WHEN SUBSTRING(a.MID,2,2)='09' THEN 'WBJ'
	WHEN SUBSTRING(a.MID,2,2)='10' THEN 'WJS'
	WHEN SUBSTRING(a.MID,2,2)='11' THEN 'WMO'
	WHEN SUBSTRING(a.MID,2,2)='12' THEN 'WJK'
	WHEN SUBSTRING(a.MID,2,2)='14' THEN 'WJB'
	WHEN SUBSTRING(a.MID,2,2)='15' THEN 'WJY'
	WHEN SUBSTRING(a.MID,2,2)='16' THEN 'WPU'
	WHEN SUBSTRING(a.MID,2,2)='17' THEN 'WYK'
	WHEN SUBSTRING(a.MID,2,2)='18' THEN 'WMA'    
    
-- 	WHEN LEFT(a.MSO,1)='' THEN 'BLANK'
  	ELSE NULL
END

as WILAYAH,
mc.Channel as CHANNEL,
  
 CASE

	WHEN LEFT(a.MID,1)='3'  THEN 'YAP'
  	ELSE 'EDC'
END
as TYPE_MID

FROM templateuploadmismer a 
LEFT JOIN mso_channel mc ON a.MSO=mc.MSO

-- WHERE a.ID =??? -- IN(select ID from templateuploadmismer)
-- AND IS_VALID=1

;
-- !!!! next build procedure run by ID from templateuploadmismer
-- !!!! delete WHERE MID and INSERT INTO

-- truncate mismerdetail
-- select * from mismerdetail
-- select count(*) from mismerdetail
-- cek jumalh rows??
-- ============================

-- ==================
-- STEP 2.1 UPDATE CHANNEL EXH
-- ==================

-- SELECT * FROM mismerdetail WHERE MERCHAN_DBA_NAME like'%EXH%'

SET SQL_SAFE_UPDATES = 0;
UPDATE
mismerdetail
SET CHANNEL='EXH'
WHERE MERCHAN_DBA_NAME like'%EXH%';
-- ================================================

-- ==================
-- STEP 2.2 INSERT INTO mismerunmatch
-- ==================
-- select * from  mismerunmatch WHERE TYPE_MID='EDC' AND CHANNEL IS NULL AND IS_UPDATE=1

INSERT INTO mismerunmatch

SELECT 
RowID,
BatchID,
OPEN_DATE,
MID,
MERCHAN_DBA_NAME,
MSO,
SOURCE_CODE,
POS1,
WILAYAH,
CHANNEL,
TYPE_MID,
0 IS_UPDATE

FROM mismerdetail
WHERE TYPE_MID='EDC'
AND CHANNEL IS NULL
;
-- ----------------------
-- truncate mismerunmatch
-- select * from mismerunmatch
-- select count(*) from mismerunmatch

	SELECT * FROM mismerunmatch
	WHERE EXTRACT(YEAR FROM OPEN_DATE)='2018'
	AND EXTRACT(MONTH FROM OPEN_DATE)='8'	
-- =======================
-- STEP 3 BULK UMPORT CSV emplateuploadmismer
-- =======================
LOAD DATA INFILE 'C:/xampp/htdocs/cicooldev/sample_csv/DevUploadUnmatch.csv' 
INTO TABLE templateuploadunmatch
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
 IGNORE 1 ROWS
(@OPEN_DATE,MID,MERCHAN_DBA_NAME,MSO,SOURCE_CODE,POS1,WILAYAH,CHANNEL,TYPE_MID,RowID)
SET OPEN_DATE = STR_TO_DATE(@OPEN_DATE, '%m/%d/%Y');

-- --------------------------------------------------
-- truncate templateuploadunmatch
-- select MID from templateuploadunmatch
-- select count(MID) from templateuploadunmatch

-- select * from mismerunmatch WHERE IS_UPDATE=1
-- select count(*) from mismerunmatch WHERE IS_UPDATE=1


--  reset
/*
truncate templateuploadunmatch
UPDATE mismerunmatch SET IS_UPDATE=0
*/


-- =======================????????????????
-- STEP 4 UPDATE mismerunmatch
-- =======================????????????
-- =================
-- select * from mismerunmatch where mid='201076189' 

-- select * from mismerunmatch
/*
-- next build by procedure
update mismerunmatch
SET WILAYAH='xxx'
,CHANNEL='xxx'
,IS_UPDATE=1

WHERE MID=''
*/

-- =================================

SET SQL_SAFE_UPDATES = 0; 

DELETE FROM templateuploadmismer
ORDER BY MID ASC LIMIT 99

WHERE MID IN(
SELECT MID FROM templateuploadmismer ORDER BY ID ASC LIMIT 10
)

select count(*) from templateuploadmismer


INSERT INTO mismerdetail

			SELECT 
			NULL RowID,
			-- a.RowID,
			 (SELECT max(BatchID) as BatchID FROM systemupload) BatchID,
-- 			999 BatchID,
			
			--  date_format(str_to_date(a.OPEN_DATE,'%m/%d/%Y'),'%Y/%m/%d')
			-- AS OPEN_DATE , 
			
			a.OPEN_DATE,
			
			
			a.MID,
			a.MERCHAN_DBA_NAME,
			a.MSO,
			a.SOURCE_CODE,
			
			CASE
				WHEN a.POS1 <= 100 THEN 1
				ELSE LEFT(a.POS1,1)
			END
			AS
			POS1,
			
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
				
				WHEN SUBSTRING(a.MID,2,2)='01' THEN 'WMD'
				WHEN SUBSTRING(a.MID,2,2)='02' THEN 'WPD'
				WHEN SUBSTRING(a.MID,2,2)='03' THEN 'WPL'
				WHEN SUBSTRING(a.MID,2,2)='04' THEN 'WBN'
				WHEN SUBSTRING(a.MID,2,2)='05' THEN 'WSM'
				WHEN SUBSTRING(a.MID,2,2)='06' THEN 'WSY'
				WHEN SUBSTRING(a.MID,2,2)='07' THEN 'WMK'
				WHEN SUBSTRING(a.MID,2,2)='08' THEN 'WDR'
				WHEN SUBSTRING(a.MID,2,2)='09' THEN 'WBJ'
				WHEN SUBSTRING(a.MID,2,2)='10' THEN 'WJS'
				WHEN SUBSTRING(a.MID,2,2)='11' THEN 'WMO'
				WHEN SUBSTRING(a.MID,2,2)='12' THEN 'WJK'
				WHEN SUBSTRING(a.MID,2,2)='14' THEN 'WJB'
				WHEN SUBSTRING(a.MID,2,2)='15' THEN 'WJY'
				WHEN SUBSTRING(a.MID,2,2)='16' THEN 'WPU'
				WHEN SUBSTRING(a.MID,2,2)='17' THEN 'WYK'
				WHEN SUBSTRING(a.MID,2,2)='18' THEN 'WMA'    
				
			-- 	WHEN LEFT(a.MSO,1)='' THEN 'BLANK'
				  ELSE NULL
			END
			
			as WILAYAH,
			
			
			mc.Channel as CHANNEL,
			 
			
			 
			 
			 CASE
			
				WHEN LEFT(a.MID,1)='3'  THEN 'YAP'
			
				  ELSE 'EDC'
			END
			
			as TYPE_MID
			
			 
			
			FROM templateuploadmismer a 
			
			LEFT JOIN mso_channel mc ON a.MSO=mc.MSO
            
             ORDER BY a.MID ASC 
            LIMIT 100
            

            
/*            
CALL P_gen_limit();
truncate mismerdetail
select count(*) from mismerdetail
WHERE
a.MID IN(
SELECT MID FROM templateuploadmismer ORDER BY ID ASC LIMIT 1000
)			
*/
