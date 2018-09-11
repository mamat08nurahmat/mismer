-- SELECT * FROM mismer.templateunmatch;
-- DELETE FROM mismer. TRUNCATE templateunmatch;
-- UPLOAD CSV BY SQL	
LOAD DATA INFILE 'c:/TEMP/templateunmatch.csv'
INTO TABLE templateunmatch
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID,MID,WILAYAH,CHANNEL,@open_date)
SET open_date = STR_TO_DATE(@open_date, '%d/%m/%Y');



-- ===========


CREATE TABLE `templateunmatch` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MID` int(11) DEFAULT NULL,
  `WILAYAH` varchar(55) DEFAULT NULL,
  `CHANNEL` varchar(55) DEFAULT NULL,
  `OPEN_DATE` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1