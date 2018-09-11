CREATE DEFINER=`root`@`localhost` PROCEDURE `P_reset`()
BEGIN
 TRUNCATE `mismer`.`templateuploadmismer`;
 TRUNCATE `mismer`.`mismerdetail`;
DELETE FROM SystemUpload WHERE BatchID!=1;
END