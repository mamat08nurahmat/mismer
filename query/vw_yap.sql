CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_yap` AS
    SELECT 
        `mismerdetail`.`WILAYAH` AS `WILAYAH`,
        `mismerdetail`.`TYPE_MID` AS `TYPE_MID`,
        `mismerdetail`.`CHANNEL` AS `CHANNEL`,
        COUNT(`mismerdetail`.`MID`) AS `JUMLAH`,
        EXTRACT(MONTH FROM `mismerdetail`.`OPEN_DATE`) AS `BULAN`,
        EXTRACT(YEAR FROM `mismerdetail`.`OPEN_DATE`) AS `TAHUN`
    FROM
        `mismerdetail`
    WHERE
        ((`mismerdetail`.`TYPE_MID` = 'YAP')
            AND (`mismerdetail`.`CHANNEL` IS NOT NULL))
    GROUP BY `mismerdetail`.`WILAYAH` , `mismerdetail`.`CHANNEL` , `mismerdetail`.`TYPE_MID` , `mismerdetail`.`OPEN_DATE`