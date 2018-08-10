<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_systemupload extends MY_Model {

	private $primary_key 	= 'ID';
	private $table_name 	= 'systemupload';
	private $field_search 	= ['BatchID', 'UploadDate', 'UploadBy', 'UploadRemark', 'ApplicationSource', 'ProcessMonth', 'ProcessYear', 'FilePath', 'VirtualPath', 'FileSize', 'ReportPath', 'RowDataCount', 'RowDataSucceed', 'RowDataFailed', 'ApprovalID'];

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
	                $where .= "systemupload.".$field . " LIKE '%" . $q . "%' ";
	            } else {
	                $where .= "OR " . "systemupload.".$field . " LIKE '%" . $q . "%' ";
	            }
	            $iterasi++;
	        }

	        $where = '('.$where.')';
        } else {
        	$where .= "(" . "systemupload.".$field . " LIKE '%" . $q . "%' )";
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
	                $where .= "systemupload.".$field . " LIKE '%" . $q . "%' ";
	            } else {
	                $where .= "OR " . "systemupload.".$field . " LIKE '%" . $q . "%' ";
	            }
	            $iterasi++;
	        }

	        $where = '('.$where.')';
        } else {
        	$where .= "(" . "systemupload.".$field . " LIKE '%" . $q . "%' )";
        }

        if (is_array($select_field) AND count($select_field)) {
        	$this->db->select($select_field);
        }
		
		$this->join_avaiable();
        $this->db->where($where);
        $this->db->limit($limit, $offset);
        $this->db->order_by('systemupload.'.$this->primary_key, "DESC");
		$query = $this->db->get($this->table_name);

		return $query->result();
	}

	public function join_avaiable() {
		$this->db->join('aauth_users', 'aauth_users.id = systemupload.UploadBy', 'LEFT');
	    $this->db->join('applicationtype', 'applicationtype.ApplicationSource = systemupload.ApplicationSource', 'LEFT');
	    
    	return $this;
	}

}

/* End of file Model_systemupload.php */
/* Location: ./application/models/Model_systemupload.php */