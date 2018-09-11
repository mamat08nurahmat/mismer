select
	WILAYAH,

	CASE
	WHEN CHANNEL IS NULL THEN  '?'
	ELSE CHANNEL
	END as CHANNEL,

	SUM(IFNULL(JUMLAH_YAP,0)) JUMLAH_YAP,
	SUM(IFNULL(JUMLAH_EDC,0)) JUMLAH_EDC,
	BULAN,
	TAHUN
	from
	(
	select
	a.WILAYAH,
	a.CHANNEL,
	sum(IFNULL(a.JUMLAH,0)) JUMLAH_YAP,
	sum(IFNULL(b.JUMLAH,0)) JUMLAH_EDC,
	a.BULAN,
	a.TAHUN
	from
	VW_YAP2 a left join VW_EDC2 b
	on a.wilayah = b.wilayah and a.channel = b.channel and a.bulan = b.bulan and a.tahun = b.tahun
	group by a.WILAYAH,a.CHANNEL,a.BULAN,a.TAHUN
	union
	select
	a.WILAYAH,
	a.channel,
	sum(IFNULL(b.JUMLAH,0)) JUMLAH_YAP,
	sum(IFNULL(a.JUMLAH,0)) JUMLAH_EDC,
	a.BULAN,
	a.TAHUN
	from
	VW_EDC2 a left join VW_YAP2 b
	on a.wilayah = b.wilayah and a.channel = b.channel and a.bulan = b.bulan and a.tahun = b.tahun
	group by a.WILAYAH,a.channel,a.BULAN,a.TAHUN
	)a
	where
	a.bulan='8' and a.tahun='2018' -- and a.wilayah='$wilayah'
	GROUP BY WILAYAH,CHANNEL,BULAN,TAHUN;