-- SELECT * FROM Wilayah
/*
SELECT 
    ID, WilayahID, WilayahCode, WilayahName, KodeWilayah
FROM
    Wilayah
-- WHERE
 --   status = 'Cancelled' 
INTO OUTFILE 'C:/tmp/MISMER/Wilayah1.csv' 
FIELDS ENCLOSED BY '"' 
TERMINATED BY '|' 
ESCAPED BY '"' 
LINES TERMINATED BY '\r\n';
*/
-- select ID,MID,WILAYAH,CHANNEL from mismerdetail;
-- ------------------

SET @TS = DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s');
-- \\10.70.17.165\c\Temp 
-- SET @FOLDER = 'c:/tmp/MISMER/';
-- C:\tmp\MISMER
SET @FOLDER = '//10.70.17.165/c:/Temp/';
SET @PREFIX = 'mismerdetail';
SET @EXT    = '.csv';
 
SET @CMD = CONCAT("
(SELECT 'ID','MID','WILAYAH','CHANNEL')
-- =============HEADER==================
UNION

(SELECT ID,MID,WILAYAH,CHANNEL
FROM mismerdetail 
WHERE WILAYAH='WPD'

INTO OUTFILE '",@FOLDER,@PREFIX,@TS,@EXT,
    "' FIELDS ENCLOSED BY '\"' TERMINATED BY '|' ESCAPED BY '\"'",
    "  LINES TERMINATED BY '\r\n');
    
    ");
 
PREPARE statement FROM @CMD;
 
EXECUTE statement;

-- 
create table unmatch(
ID int not null auto_increment,
RowID int,
BatchID int,
MID int,
WILAYAH varchar(55),
CHANNEL varchar(55),
TYPE_MID varchar(55),
primary key(ID)
);
--
-- select count(*) from unmatch

-- generate insert unmatch
-- delete by batch and insert
-- =============Generate unmatch==============================
INSERT INTO unmatch

SELECT 
RowID,
BatchID,
OPEN_DATE,
MID,
WILAYAH,
CHANNEL,
TYPE_MID
 FROM mismerdetail
WHERE TYPE_MID='EDC' AND CHANNEL IS NULL

AND EXTRACT(MONTH FROM OPEN_DATE)='8'
AND EXTRACT(YEAR FROM OPEN_DATE)='2018'

-- ===========================================

-- select * from systemupload