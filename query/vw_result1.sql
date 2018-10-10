create view vw_res as
		SELECT
        
		WILAYAH,
		SUM(IFNULL(JUMLAH_YAP,0)) JUMLAH_YAP,
		SUM(IFNULL(JUMLAH_EDC,0)) JUMLAH_EDC,
-- 		BULAN,
-- 		TAHUN
 EXTRACT(MONTH FROM OPEN_DATE) AS BULAN,
  EXTRACT(YEAR FROM OPEN_DATE) AS TAHUN,
 OPEN_DATE

		from
		(
        
		select
		a.WILAYAH,
		sum(IFNULL(a.JUMLAH,0)) JUMLAH_YAP,
		0 JUMLAH_EDC,
-- 		a.BULAN,
-- 		a.TAHUN
		a.OPEN_DATE
        
		from
		VW_YAP2 a left join VW_EDC2 b
		on a.wilayah = b.wilayah and a.channel = b.channel and a.OPEN_DATE=b.OPEN_DATE -- a.bulan = b.bulan and a.tahun = b.tahun
		group by a.WILAYAH,a.OPEN_DATE -- a.BULAN,a.TAHUN
        
		union
        
		select
		a.WILAYAH,
		sum(IFNULL(b.JUMLAH,0)) JUMLAH_YAP,
		sum(IFNULL(a.JUMLAH,0)) JUMLAH_EDC,
-- 		a.BULAN,
-- 		a.TAHUN
		a.OPEN_DATE
		from
		VW_EDC2 a left join VW_YAP2 b
		on a.wilayah = b.wilayah and a.channel = b.channel and a.OPEN_DATE=b.OPEN_DATE -- a.bulan = b.bulan and a.tahun = b.tahun
		group by a.WILAYAH,a.OPEN_DATE -- a.BULAN,a.TAHUN


-- UNION UNMATCH

 union

   SELECT 
 mu.WILAYAH AS WILAYAH,
 0 JUMLAH_YAP,
 SUM(mu.POS1) AS JUMLAH_EDC,
-- EXTRACT(MONTH FROM mu.OPEN_DATE) AS BULAN,
--  EXTRACT(YEAR FROM mu.OPEN_DATE) AS TAHUN
mu.OPEN_DATE
 FROM
mismerunmatch mu
 -- LEFT JOIN channel ch ON tu.CHANNEL = ch.ID 
WHERE mu.IS_UPDATE=1
GROUP BY mu.WILAYAH ,mu.OPEN_DATE 



)a
-- WHERE
-- EXTRACT(MONTH FROM OPEN_DATE)='8' AND
-- EXTRACT(YEAR FROM OPEN_DATE)='2018'

-- where bulan = '8' and tahun = '2018'
GROUP BY WILAYAH,OPEN_DATE;
