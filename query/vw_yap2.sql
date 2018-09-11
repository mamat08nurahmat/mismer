CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_yap2` AS
    SELECT 
        `vw_yap`.`WILAYAH` AS `WILAYAH`,
        `vw_yap`.`TYPE_MID` AS `TYPE_MID`,
        `vw_yap`.`CHANNEL` AS `CHANNEL`,
        SUM(`vw_yap`.`JUMLAH`) AS `JUMLAH`,
        `vw_yap`.`BULAN` AS `BULAN`,
        `vw_yap`.`TAHUN` AS `TAHUN`
    FROM
        `vw_yap`
    GROUP BY `vw_yap`.`WILAYAH` , `vw_yap`.`TYPE_MID` , `vw_yap`.`CHANNEL` , `vw_yap`.`BULAN` , `vw_yap`.`TAHUN`