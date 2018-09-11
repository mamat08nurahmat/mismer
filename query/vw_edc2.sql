CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_edc2` AS
    SELECT 
        `vw_edc`.`WILAYAH` AS `WILAYAH`,
        `vw_edc`.`TYPE_MID` AS `TYPE_MID`,
        `vw_edc`.`CHANNEL` AS `CHANNEL`,
        SUM(`vw_edc`.`JUMLAH`) AS `JUMLAH`,
        `vw_edc`.`BULAN` AS `BULAN`,
        `vw_edc`.`TAHUN` AS `TAHUN`
    FROM
        `vw_edc`
    GROUP BY `vw_edc`.`WILAYAH` , `vw_edc`.`TYPE_MID` , `vw_edc`.`CHANNEL` , `vw_edc`.`BULAN` , `vw_edc`.`TAHUN`