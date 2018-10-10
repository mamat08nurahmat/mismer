<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_mismerdetail extends MY_Model {

	private $primary_key 	= 'RowID';
	private $table_name 	= 'mismerdetail';
	private $field_search 	= ['BatchID', 'OPEN_DATE', 'MID', 'MERCHAN_DBA_NAME', 'MSO', 'SOURCE_CODE', 'POS1', 'WILAYAH', 'CHANNEL', 'TYPE_MID'];

	public function __construct()
	{
		$config = array(
			'primary_key' 	=> $this->primary_key,
		 	'table_name' 	=> $this->table_name,
		 	'field_search' 	=> $this->field_search,
		 );

		parent::__construct($config);
	}

	public function count_all($q = null, $field = null)
	{
		$iterasi = 1;
        $num = count($this->field_search);
        $where = NULL;
        $q = $this->scurity($q);
		$field = $this->scurity($field);

        if (empty($field)) {
	        foreach ($this->field_search as $field) {
	            if ($iterasi == 1) {
	                $where .= "mismerdetail.".$field . " LIKE '%" . $q . "%' ";
	            } else {
	                $where .= "OR " . "mismerdetail.".$field . " LIKE '%" . $q . "%' ";
	            }
	            $iterasi++;
	        }

	        $where = '('.$where.')';
        } else {
        	$where .= "(" . "mismerdetail.".$field . " LIKE '%" . $q . "%' )";
        }

		$this->join_avaiable();
        $this->db->where($where);
		$query = $this->db->get($this->table_name);

		return $query->num_rows();
	}

	public function get($q = null, $field = null, $limit = 0, $offset = 0, $select_field = [])
	{
		$iterasi = 1;
        $num = count($this->field_search);
        $where = NULL;
        $q = $this->scurity($q);
		$field = $this->scurity($field);

        if (empty($field)) {
	        foreach ($this->field_search as $field) {
	            if ($iterasi == 1) {
	                $where .= "mismerdetail.".$field . " LIKE '%" . $q . "%' ";
	            } else {
	                $where .= "OR " . "mismerdetail.".$field . " LIKE '%" . $q . "%' ";
	            }
	            $iterasi++;
	        }

	        $where = '('.$where.')';
        } else {
        	$where .= "(" . "mismerdetail.".$field . " LIKE '%" . $q . "%' )";
        }

        if (is_array($select_field) AND count($select_field)) {
        	$this->db->select($select_field);
        }
		
		$this->join_avaiable();
        $this->db->where($where);
        $this->db->limit($limit, $offset);
        $this->db->order_by('mismerdetail.'.$this->primary_key, "DESC");
		$query = $this->db->get($this->table_name);

		return $query->result();
	}

	public function join_avaiable() {
		
    	return $this;
	}


// ============================================
public function get_report($bulan,$tahun){

	return $this->db->query("
	
	select
	
	WILAYAH,
	SUM(IFNULL(JUMLAH_YAP,0)) JUMLAH_YAP,
	SUM(IFNULL(JUMLAH_EDC,0)) JUMLAH_EDC,
	BULAN,
	TAHUN
	from
	(
	
	select
	a.WILAYAH,
	sum(IFNULL(a.JUMLAH,0)) JUMLAH_YAP,
	0 JUMLAH_EDC,
	a.BULAN,
	a.TAHUN
	from
	VW_YAP2 a left join VW_EDC2 b
	on a.wilayah = b.wilayah and a.channel = b.channel and a.bulan = b.bulan and a.tahun = b.tahun
	group by a.WILAYAH,a.BULAN,a.TAHUN
	
	union
	
	select
	a.WILAYAH,
	sum(IFNULL(b.JUMLAH,0)) JUMLAH_YAP,
	sum(IFNULL(a.JUMLAH,0)) JUMLAH_EDC,
	a.BULAN,
	a.TAHUN
	from
	VW_EDC2 a left join VW_YAP2 b
	on a.wilayah = b.wilayah and a.channel = b.channel and a.bulan = b.bulan and a.tahun = b.tahun
	group by a.WILAYAH,a.BULAN,a.TAHUN


-- UNION UNMATCH



)a
where
bulan = '$bulan' and tahun = '$tahun'
GROUP BY WILAYAH,BULAN,TAHUN;	


")->result();

// 	union
	
// 	  SELECT 
// 	tu.WILAYAH AS WILAYAH,
// 	0 JUMLAH_YAP,
// 	COUNT(tu.MID) AS JUMLAH_EDC,
// 	EXTRACT(MONTH FROM tu.OPEN_DATE) AS BULAN,
// 	EXTRACT(YEAR FROM tu.OPEN_DATE) AS TAHUN
// FROM
// 	templateunmatch tu
// LEFT JOIN channel ch ON tu.CHANNEL = ch.ID 
// GROUP BY tu.WILAYAH ,tu.OPEN_DATE    

}


public function get_report_between($tgl_awal,$tgl_akhir){

	return $this->db->query("
	select
	
	WILAYAH,
	SUM(IFNULL(JUMLAH_YAP,0)) JUMLAH_YAP,
	SUM(IFNULL(JUMLAH_EDC,0)) JUMLAH_EDC,
	BULAN,
	TAHUN
    -- ,OPEN_DATE
    
	from
	(
	select
	a.WILAYAH,
	sum(IFNULL(a.JUMLAH,0)) JUMLAH_YAP,
	0 JUMLAH_EDC,
	a.BULAN,
	a.TAHUN
     ,a.OPEN_DATE
	from
	VW_YAP2 a left join VW_EDC2 b
	on a.wilayah = b.wilayah and a.channel = b.channel and a.OPEN_DATE=b.OPEN_DATE
	group by a.WILAYAH,a.BULAN,a.TAHUN ,a.OPEN_DATE
	
	union
	
	select
	a.WILAYAH,
	sum(IFNULL(b.JUMLAH,0)) JUMLAH_YAP,
	sum(IFNULL(a.JUMLAH,0)) JUMLAH_EDC,
	a.BULAN,
	a.TAHUN,
	a.OPEN_DATE
	from
	VW_EDC2 a left join VW_YAP2 b
	on a.wilayah = b.wilayah and a.channel = b.channel and a.OPEN_DATE=b.OPEN_DATE
	group by a.WILAYAH,a.BULAN,a.TAHUN ,a.OPEN_DATE


-- UNION UNMATCH




)a
where
OPEN_DATE  >= '$tgl_awal' AND OPEN_DATE <= '$tgl_akhir'
GROUP BY WILAYAH,BULAN,TAHUN;		


")->result();

}


// union

//   SELECT 
// tu.WILAYAH AS WILAYAH,
// 0 JUMLAH_YAP,
// COUNT(tu.MID) AS JUMLAH_EDC,
// EXTRACT(MONTH FROM tu.OPEN_DATE) AS BULAN,
// EXTRACT(YEAR FROM tu.OPEN_DATE) AS TAHUN,
// tu.OPEN_DATE
// FROM
// templateunmatch tu
// LEFT JOIN channel ch ON tu.CHANNEL = ch.ID 
// GROUP BY tu.WILAYAH ,tu.OPEN_DATE    


// RESULT 1 sort by tgl_awal tgl akhir
public function getResult1($tgl_awal,$tgl_akhir){


	return $this->db->query("
	
	
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
WHERE
OPEN_DATE >= '$tgl_awal' AND OPEN_DATE <= '$tgl_akhir'
-- where bulan = '8' and tahun = '2018'
GROUP BY WILAYAH;
	
	
	
	")->result();


}



// RESULT 2 sort by bulan tahun
	public function getResult2($bulan,$tahun){


		return $this->db->query("
		
		
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
 WHERE
 EXTRACT(MONTH FROM OPEN_DATE)='$bulan' AND
 EXTRACT(YEAR FROM OPEN_DATE)='$tahun'

-- where bulan = '8' and tahun = '2018'
GROUP BY WILAYAH;
		
		
		
		")->result();


	}

// ------------
// GET MODAL RESULT 1 sort by tgl_awal tgl akhir
public function getModalResult1($tgl_awal,$tgl_akhir,$wilayah){


	return $this->db->query("
	
	select
	
	WILAYAH,
	CASE
	WHEN CHANNEL IS NULL THEN  '?'
	ELSE CHANNEL
	END as CHANNEL,
	SUM(IFNULL(JUMLAH_YAP,0)) JUMLAH_YAP,
	SUM(IFNULL(JUMLAH_EDC,0)) JUMLAH_EDC,
EXTRACT(MONTH FROM OPEN_DATE) AS BULAN,
EXTRACT(YEAR FROM OPEN_DATE) AS TAHUN,
OPEN_DATE
    
	from
	(
	
	select
	a.WILAYAH,
	a.CHANNEL,
	sum(IFNULL(a.JUMLAH,0)) JUMLAH_YAP,
	0 JUMLAH_EDC,
-- 	a.BULAN,
-- 	a.TAHUN
	a.OPEN_DATE
	from
	VW_YAP2 a left join VW_EDC2 b
	on a.wilayah = b.wilayah and a.channel = b.channel and a.OPEN_DATE=b.OPEN_DATE-- a.bulan = b.bulan and a.tahun = b.tahun
	group by a.WILAYAH,a.CHANNEL, a.OPEN_DATE-- a.BULAN,a.TAHUN
	
	union
	
	select
	a.WILAYAH,
	a.CHANNEL,
	sum(IFNULL(b.JUMLAH,0)) JUMLAH_YAP,
	sum(IFNULL(a.JUMLAH,0)) JUMLAH_EDC,
-- 	a.BULAN,
-- 	a.TAHUN
	a.OPEN_DATE
	from
	VW_EDC2 a left join VW_YAP2 b
	on a.wilayah = b.wilayah and a.channel = b.channel and a.OPEN_DATE=b.OPEN_DATE-- a.bulan = b.bulan and a.tahun = b.tahun
	group by a.WILAYAH,a.CHANNEL,a.OPEN_DATE-- a.BULAN,a.TAHUN


-- UNION UNMATCH
 union

   SELECT 
 mu.WILAYAH AS WILAYAH,
 mu.CHANNEL AS CHANNEL,
 0 JUMLAH_YAP,
 SUM(mu.POS1) AS JUMLAH_EDC,
-- EXTRACT(MONTH FROM mu.OPEN_DATE) AS BULAN,
--  EXTRACT(YEAR FROM mu.OPEN_DATE) AS TAHUN
mu.OPEN_DATE
 FROM
 mismerunmatch mu
	WHERE mu.IS_UPDATE=1
 GROUP BY mu.WILAYAH , mu.CHANNEL,mu.OPEN_DATE    



)a

WHERE
OPEN_DATE >= '$tgl_awal' AND OPEN_DATE <= '$tgl_akhir'
AND WILAYAH='$wilayah'

GROUP BY WILAYAH,CHANNEL;-- BULAN,TAHUN;	
	
	
	")->result();


}

// GET MODAL RESULT 2 sort by bulan tahun
public function getModalResult2($tahun,$bulan,$wilayah){


	return $this->db->query("
	
	select
	
	WILAYAH,
	CASE
	WHEN CHANNEL IS NULL THEN  '?'
	ELSE CHANNEL
	END as CHANNEL,
	SUM(IFNULL(JUMLAH_YAP,0)) JUMLAH_YAP,
	SUM(IFNULL(JUMLAH_EDC,0)) JUMLAH_EDC,
EXTRACT(MONTH FROM OPEN_DATE) AS BULAN,
EXTRACT(YEAR FROM OPEN_DATE) AS TAHUN,
OPEN_DATE
    
	from
	(
	
	select
	a.WILAYAH,
	a.CHANNEL,
	sum(IFNULL(a.JUMLAH,0)) JUMLAH_YAP,
	0 JUMLAH_EDC,
-- 	a.BULAN,
-- 	a.TAHUN
	a.OPEN_DATE
	from
	VW_YAP2 a left join VW_EDC2 b
	on a.wilayah = b.wilayah and a.channel = b.channel and a.OPEN_DATE=b.OPEN_DATE-- a.bulan = b.bulan and a.tahun = b.tahun
	group by a.WILAYAH,a.CHANNEL, a.OPEN_DATE-- a.BULAN,a.TAHUN
	
	union
	
	select
	a.WILAYAH,
	a.CHANNEL,
	sum(IFNULL(b.JUMLAH,0)) JUMLAH_YAP,
	sum(IFNULL(a.JUMLAH,0)) JUMLAH_EDC,
-- 	a.BULAN,
-- 	a.TAHUN
	a.OPEN_DATE
	from
	VW_EDC2 a left join VW_YAP2 b
	on a.wilayah = b.wilayah and a.channel = b.channel and a.OPEN_DATE=b.OPEN_DATE-- a.bulan = b.bulan and a.tahun = b.tahun
	group by a.WILAYAH,a.CHANNEL,a.OPEN_DATE-- a.BULAN,a.TAHUN


-- UNION UNMATCH
 union

   SELECT 
 mu.WILAYAH AS WILAYAH,
 mu.CHANNEL AS CHANNEL,
 0 JUMLAH_YAP,
 SUM(mu.POS1) AS JUMLAH_EDC,
-- EXTRACT(MONTH FROM mu.OPEN_DATE) AS BULAN,
--  EXTRACT(YEAR FROM mu.OPEN_DATE) AS TAHUN
mu.OPEN_DATE
 FROM
 mismerunmatch mu
	WHERE mu.IS_UPDATE=1
 GROUP BY mu.WILAYAH , mu.CHANNEL,mu.OPEN_DATE    



)a

WHERE
EXTRACT(MONTH FROM OPEN_DATE)='$bulan' AND
EXTRACT(YEAR FROM OPEN_DATE)='$tahun'
AND WILAYAH='$wilayah'

GROUP BY WILAYAH,CHANNEL;	
	
	
	")->result();


}

}

/* End of file Model_mismerdetail.php */
/* Location: ./application/models/Model_mismerdetail.php */