<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_mismerunmatch extends MY_Model {

	private $primary_key 	= 'RowID';
	private $table_name 	= 'mismerunmatch';
	private $field_search 	= ['BatchID', 'OPEN_DATE', 'MID', 'MERCHAN_DBA_NAME', 'MSO', 'SOURCE_CODE', 'POS1', 'WILAYAH', 'CHANNEL', 'TYPE_MID', 'IS_UPDATE'];

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
	                $where .= "mismerunmatch.".$field . " LIKE '%" . $q . "%' ";
	            } else {
	                $where .= "OR " . "mismerunmatch.".$field . " LIKE '%" . $q . "%' ";
	            }
	            $iterasi++;
	        }

	        $where = '('.$where.')';
        } else {
        	$where .= "(" . "mismerunmatch.".$field . " LIKE '%" . $q . "%' )";
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
	                $where .= "mismerunmatch.".$field . " LIKE '%" . $q . "%' ";
	            } else {
	                $where .= "OR " . "mismerunmatch.".$field . " LIKE '%" . $q . "%' ";
	            }
	            $iterasi++;
	        }

	        $where = '('.$where.')';
        } else {
        	$where .= "(" . "mismerunmatch.".$field . " LIKE '%" . $q . "%' )";
        }

        if (is_array($select_field) AND count($select_field)) {
        	$this->db->select($select_field);
        }
		
		$this->join_avaiable();
        $this->db->where($where);
        $this->db->limit($limit, $offset);
        $this->db->order_by('mismerunmatch.'.$this->primary_key, "DESC");
		$query = $this->db->get($this->table_name);

		return $query->result();
	}

	public function join_avaiable() {
		
    	return $this;
	}

// --------
public function get_report_unmatch($bulan,$tahun){

	return $this->db->query("
	
	SELECT * FROM mismerunmatch
	WHERE EXTRACT(YEAR FROM OPEN_DATE)='$tahun'
	AND EXTRACT(MONTH FROM OPEN_DATE)='$bulan'	
	")->result();

}
// ----


}

/* End of file Model_mismerunmatch.php */
/* Location: ./application/models/Model_mismerunmatch.php */