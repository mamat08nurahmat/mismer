-- SELECT * FROM Wilayah

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


-- ------------------

SET @TS = DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s');
 
SET @FOLDER = 'c:/tmp/MISMER/';
SET @PREFIX = 'wilayah';
SET @EXT    = '.csv';
 
SET @CMD = CONCAT("SELECT * FROM wilayah 
-- 
INTO OUTFILE '",@FOLDER,@PREFIX,@TS,@EXT,
    "' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'",
    "  LINES TERMINATED BY '\r\n';");
 
PREPARE statement FROM @CMD;
 
EXECUTE statement;