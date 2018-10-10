<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Systemupload Controller
*| --------------------------------------------------------------------------
*| Systemupload site
*|
*/
class Systemupload extends Admin	
{
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_systemupload');
	}

	/**
	* show all Systemuploads
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('systemupload_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['systemuploads'] = $this->model_systemupload->get($filter, $field, $this->limit_page, $offset);
		$this->data['systemupload_counts'] = $this->model_systemupload->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/systemupload/index/',
			'total_rows'   => $this->model_systemupload->count_all($filter, $field),
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Systemupload List');
		$this->render('backend/standart/administrator/systemupload/systemupload_list', $this->data);
	}
	
	/**
	* Add new systemuploads
	*
	*/
	public function add()
	{
		$this->is_allowed('systemupload_add');

		$this->template->title('Systemupload New');
		$this->render('backend/standart/administrator/systemupload/systemupload_add', $this->data);
	}

	/**
	* Add New Systemuploads
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('systemupload_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$this->form_validation->set_rules('ApplicationSource', 'ApplicationSource', 'trim|required');
		$this->form_validation->set_rules('UploadRemark', 'UploadRemark', 'trim|required|max_length[255]');
		
//dev  form_validation off
/*
$this->form_validation->set_rules('UploadBy', 'UploadBy', 'trim|required|max_length[11]');

$this->form_validation->set_rules('ProcessYear', 'ProcessYear', 'trim|required');
$this->form_validation->set_rules('ProcessMonth', 'ProcessMonth', 'trim|required');
$this->form_validation->set_rules('ProcessDate', 'ProcessDate', 'trim|required');
$this->form_validation->set_rules('systemupload_FilePath_name', 'FilePath', 'trim|required');
$this->form_validation->set_rules('VirtualPath', 'VirtualPath', 'trim|required|max_length[255]');
$this->form_validation->set_rules('FileSize', 'FileSize', 'trim|required|max_length[255]');
$this->form_validation->set_rules('ReportPath', 'ReportPath', 'trim|required|max_length[255]');
$this->form_validation->set_rules('RowDataCount', 'RowDataCount', 'trim|required|max_length[11]');
$this->form_validation->set_rules('RowDataSucceed', 'RowDataSucceed', 'trim|required|max_length[11]');
$this->form_validation->set_rules('RowDataFailed', 'RowDataFailed', 'trim|required|max_length[11]');
$this->form_validation->set_rules('ApprovalID', 'ApprovalID', 'trim|required|max_length[11]');
$this->form_validation->set_rules('IS_APPROVED', 'IS APPROVED', 'trim|required|max_length[11]');
*/
		

		if ($this->form_validation->run()) {
			$systemupload_FilePath_uuid = $this->input->post('systemupload_FilePath_uuid');
			$systemupload_FilePath_name = $this->input->post('systemupload_FilePath_name');
		
			$save_data = [
				// 'UploadDate' => date('Y-m-d H:i:s'),
				// 'UploadBy' => $this->input->post('UploadBy'),
				// 'UploadRemark' => $this->input->post('UploadRemark'),
				// 'ApplicationSource' => $this->input->post('ApplicationSource'),
				// 'ProcessYear' => $this->input->post('ProcessYear'),
				// 'ProcessMonth' => $this->input->post('ProcessMonth'),
				// 'ProcessDate' => $this->input->post('ProcessDate'),
				// 'VirtualPath' => $this->input->post('VirtualPath'),
				// 'FileSize' => $this->input->post('FileSize'),
				// 'ReportPath' => $this->input->post('ReportPath'),
				// 'RowDataCount' => $this->input->post('RowDataCount'),
				// 'RowDataSucceed' => $this->input->post('RowDataSucceed'),
				// 'RowDataFailed' => $this->input->post('RowDataFailed'),
				// 'ApprovalID' => $this->input->post('ApprovalID'),
				// 'IS_APPROVED' => $this->input->post('IS_APPROVED'),

				'UploadDate' => date('Y-m-d H:i:s'),
				'UploadBy' => 999,
				'UploadRemark' => $this->input->post('UploadRemark'),
				'ApplicationSource' => $this->input->post('ApplicationSource'),
				'ProcessYear' => date('Y'),
				'ProcessMonth' => date('m'),
				'ProcessDate' => date('d'),
				'VirtualPath' => 'VirtualPath',
				'FileSize' => 123,
				'ReportPath' => 'ReportPath',
				'RowDataCount' => 111,
				'RowDataSucceed' => 222,
				'RowDataFailed' => 333,
				'ApprovalID' => 999,
				'IS_APPROVED' => 0,				
			];

			if (!is_dir(FCPATH . '/uploads/systemupload/')) {
				mkdir(FCPATH . '/uploads/systemupload/');
			}



			if (!empty($systemupload_FilePath_name)) {
				// format file name csv 
				// $systemupload_FilePath_name_copy = date('YmdHis') . '-' . $systemupload_FilePath_name;
				$BatchID = get_batchid();
				$systemupload_FilePath_name_copy = $BatchID. '-' . $this->input->post('ApplicationSource').'.csv';

				rename(FCPATH . 'uploads/tmp/' . $systemupload_FilePath_uuid . '/' . $systemupload_FilePath_name, 
						FCPATH . 'uploads/systemupload/' . $systemupload_FilePath_name_copy);

				if (!is_file(FCPATH . '/uploads/systemupload/' . $systemupload_FilePath_name_copy)) {
					echo json_encode([
						'success' => false,
						'message' => 'Error uploading file'
						]);
					exit;
				}

				$save_data['FilePath'] = $systemupload_FilePath_name_copy;
			}
		
			
			$save_systemupload = $this->model_systemupload->store($save_data);

			if ($save_systemupload) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_systemupload;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/systemupload/edit/' . $save_systemupload, 'Edit Systemupload'),
						anchor('administrator/systemupload', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/systemupload/edit/' . $save_systemupload, 'Edit Systemupload')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/systemupload');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/systemupload');
				}
			}

		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
		/**
	* Update view Systemuploads
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('systemupload_update');

		$this->data['systemupload'] = $this->model_systemupload->find($id);

		$this->template->title('Systemupload Update');
		$this->render('backend/standart/administrator/systemupload/systemupload_update', $this->data);
	}

	/**
	* Update Systemuploads
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('systemupload_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
		
		$this->form_validation->set_rules('UploadBy', 'UploadBy', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('UploadRemark', 'UploadRemark', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('ApplicationSource', 'ApplicationSource', 'trim|required');
		$this->form_validation->set_rules('ProcessYear', 'ProcessYear', 'trim|required');
		$this->form_validation->set_rules('ProcessMonth', 'ProcessMonth', 'trim|required');
		$this->form_validation->set_rules('ProcessDate', 'ProcessDate', 'trim|required');
		$this->form_validation->set_rules('systemupload_FilePath_name', 'FilePath', 'trim|required');
		$this->form_validation->set_rules('VirtualPath', 'VirtualPath', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('FileSize', 'FileSize', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('ReportPath', 'ReportPath', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('RowDataCount', 'RowDataCount', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('RowDataSucceed', 'RowDataSucceed', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('RowDataFailed', 'RowDataFailed', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('ApprovalID', 'ApprovalID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('IS_APPROVED', 'IS APPROVED', 'trim|required|max_length[11]');
		
		if ($this->form_validation->run()) {
			$systemupload_FilePath_uuid = $this->input->post('systemupload_FilePath_uuid');
			$systemupload_FilePath_name = $this->input->post('systemupload_FilePath_name');
		
			$save_data = [
				'UploadDate' => date('Y-m-d H:i:s'),
				'UploadBy' => $this->input->post('UploadBy'),
				'UploadRemark' => $this->input->post('UploadRemark'),
				'ApplicationSource' => $this->input->post('ApplicationSource'),
				'ProcessYear' => $this->input->post('ProcessYear'),
				'ProcessMonth' => $this->input->post('ProcessMonth'),
				'ProcessDate' => $this->input->post('ProcessDate'),
				'VirtualPath' => $this->input->post('VirtualPath'),
				'FileSize' => $this->input->post('FileSize'),
				'ReportPath' => $this->input->post('ReportPath'),
				'RowDataCount' => $this->input->post('RowDataCount'),
				'RowDataSucceed' => $this->input->post('RowDataSucceed'),
				'RowDataFailed' => $this->input->post('RowDataFailed'),
				'ApprovalID' => $this->input->post('ApprovalID'),
				'IS_APPROVED' => $this->input->post('IS_APPROVED'),
			];

			if (!is_dir(FCPATH . '/uploads/systemupload/')) {
				mkdir(FCPATH . '/uploads/systemupload/');
			}

			if (!empty($systemupload_FilePath_uuid)) {
				$systemupload_FilePath_name_copy = date('YmdHis') . '-' . $systemupload_FilePath_name;

				rename(FCPATH . 'uploads/tmp/' . $systemupload_FilePath_uuid . '/' . $systemupload_FilePath_name, 
						FCPATH . 'uploads/systemupload/' . $systemupload_FilePath_name_copy);

				if (!is_file(FCPATH . '/uploads/systemupload/' . $systemupload_FilePath_name_copy)) {
					echo json_encode([
						'success' => false,
						'message' => 'Error uploading file'
						]);
					exit;
				}

				$save_data['FilePath'] = $systemupload_FilePath_name_copy;
			}
		
			
			$save_systemupload = $this->model_systemupload->change($id, $save_data);

			if ($save_systemupload) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/systemupload', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/systemupload');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/systemupload');
				}
			}
		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
	/**
	* delete Systemuploads
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('systemupload_delete');

		$this->load->helper('file');

		$arr_id = $this->input->get('id');
		$remove = false;

		if (!empty($id)) {
			$remove = $this->_remove($id);
		} elseif (count($arr_id) >0) {
			foreach ($arr_id as $id) {
				$remove = $this->_remove($id);
			}
		}

		if ($remove) {
            set_message(cclang('has_been_deleted', 'systemupload'), 'success');
        } else {
            set_message(cclang('error_delete', 'systemupload'), 'error');
        }

		redirect_back();
	}

		/**
	* View view Systemuploads
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('systemupload_view');

		$this->data['systemupload'] = $this->model_systemupload->join_avaiable()->find($id);

		$this->template->title('Systemupload Detail');
		$this->render('backend/standart/administrator/systemupload/systemupload_view', $this->data);
	}
	
	/**
	* delete Systemuploads
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$systemupload = $this->model_systemupload->find($id);

		if (!empty($systemupload->FilePath)) {
			$path = FCPATH . '/uploads/systemupload/' . $systemupload->FilePath;

			if (is_file($path)) {
				$delete_file = unlink($path);
			}
		}
		
		
		return $this->model_systemupload->remove($id);
	}
	
	/**
	* Upload Image Systemupload	* 
	* @return JSON
	*/
	public function upload_FilePath_file()
	{
		if (!$this->is_allowed('systemupload_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
// ????????????????????????????????????????
		$uuid = $this->input->post('qquuid');

		echo $this->upload_file([
			'uuid' 		 	=> $uuid,
			'table_name' 	=> 'systemupload',
		]);
	}

	/**
	* Delete Image Systemupload	* 
	* @return JSON
	*/
	public function delete_FilePath_file($uuid)
	{
		if (!$this->is_allowed('systemupload_delete', false)) {
			echo json_encode([
				'success' => false,
				'error' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		echo $this->delete_file([
            'uuid'              => $uuid, 
            'delete_by'         => $this->input->get('by'), 
            'field_name'        => 'FilePath', 
            'upload_path_tmp'   => './uploads/tmp/',
            'table_name'        => 'systemupload',
            'primary_key'       => 'BatchID',
            'upload_path'       => 'uploads/systemupload/'
        ]);
	}

	/**
	* Get Image Systemupload	* 
	* @return JSON
	*/
	public function get_FilePath_file($id)
	{
		if (!$this->is_allowed('systemupload_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => 'Image not loaded, you do not have permission to access'
				]);
			exit;
		}

		$systemupload = $this->model_systemupload->find($id);

		echo $this->get_file([
            'uuid'              => $id, 
            'delete_by'         => 'id', 
            'field_name'        => 'FilePath', 
            'table_name'        => 'systemupload',
            'primary_key'       => 'BatchID',
            'upload_path'       => 'uploads/systemupload/',
            'delete_endpoint'   => 'administrator/systemupload/delete_FilePath_file'
        ]);
	}
	
	
	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('systemupload_export');

		$this->model_systemupload->export('systemupload', 'systemupload');
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('systemupload_export');

		$this->model_systemupload->pdf('systemupload', 'systemupload');
	}

// ---dev
	public function view_temp($BatchID){

		$systemupload = $this->model_systemupload->find($BatchID);

		// print_r($systemupload);die();

		// dev

		
		
		if($systemupload->ApplicationSource=="MISMER"){
			
			$truncate = $this->db->query('truncate templateuploadmismer');
			
			$xxx = '"'; //!!!!!!!!!
			$lokasi_csv='C:/xampp/htdocs/mismer/uploads/systemupload/'.$systemupload->BatchID.'-'.$systemupload->ApplicationSource.'.csv';
			// $lokasi_csv=base_url('/uploads/systemupload/').$systemupload->BatchID.'-'.$systemupload->ApplicationSource.'.csv';
// print_r($lokasi_csv);die();
// $truncate = $this->db->query('truncate templateuploadmismer');
// $xxx = '"';
// $lokasi_csv='C:/xampp/htdocs/mismer/sample_csv/DevUploadMismer.csv';

// $set = "(MID,MERCHAN_DBA_NAME,STAT
// US_EDC,@OPEN_DATE,MSO,SOURCE_CODE,POS1,IS_VALID,ID)
// SET OPEN_DATE = STR_TO_DATE(@OPEN_DATE, '%m/%d/%Y')";

$res1 = $this->db->query("
LOAD DATA INFILE '$lokasi_csv' 
INTO TABLE templateuploadmismer
FIELDS TERMINATED BY ',' 
ENCLOSED BY '$xxx'
LINES TERMINATED BY '\n'
 IGNORE 1 ROWS
(MID,MERCHAN_DBA_NAME,STATUS_EDC,@OPEN_DATE,MSO,SOURCE_CODE,POS1,IS_VALID,ID)
SET OPEN_DATE = STR_TO_DATE(@OPEN_DATE, '%m/%d/%Y')
 ");

//  if($res1){
	$ApplicationSource = strtolower($systemupload->ApplicationSource);
	redirect(site_url('administrator/templateupload'.$ApplicationSource.''),'refresh');		
// }



}else{

	$truncate = $this->db->query('truncate templateuploadunmatch');
	$xxx = '"'; //!!!!!!!!!
	$lokasi_csv='C:/xampp/htdocs/mismer/uploads/systemupload/'.$systemupload->BatchID.'-'.$systemupload->ApplicationSource.'.csv';

	
	// $truncate = $this->db->query('truncate templateuploadmismer');
	// $xxx = '"';
	// $lokasi_csv='C:/xampp/htdocs/mismer/sample_csv/DevUploadMismer.csv'; 
	$set = "
	(@OPEN_DATE,MID,MERCHAN_DBA_NAME,MSO,SOURCE_CODE,POS1,WILAYAH,CHANNEL,TYPE_MID,RowID)
	SET OPEN_DATE = STR_TO_DATE(@OPEN_DATE, '%Y-%m-%d')	";
	
	$res = $this->db->query("
	LOAD DATA INFILE '$lokasi_csv' 
	INTO TABLE templateuploadunmatch
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '$xxx' 
	LINES TERMINATED BY '\n'
	 IGNORE 1 ROWS
	 ".$set."
	 ;

	 


	 ");
	

	//  if($res2){
		 $ApplicationSource = strtolower($systemupload->ApplicationSource);
		 redirect(site_url('administrator/templateupload'.$ApplicationSource.''),'refresh');		
	//  }

}		


	}
//=============
// dev read csv
	public function dev(){

		$csvfile = base_url('unmatch100.csv');

		$csvData = readCSV($csvfile);

		print_r($csvData);
print_r('<hr>');

// Obtain a list of columns
foreach ($csvData as $key => $row) {
    $date[$key]  = $row[0]; //date
	$MID[$key] = $row[1]; //MID
	$DB_NAME[$key] = $row[2]; //MID
	// print_r($key);
	// print_r('<hr>');	
	// print_r($row[0]);
	// print_r('<hr>');	
// $data_upload = array(

	
// )

}

 print_r($date);
 print_r($MID);
print_r($MID);

// Sort the data with age first, then favorite
// Add $csvData as the last parameter, to sort by the common key
// $sortx = array_multisort($MID, SORT_ASC, $DB_NAME, SORT_ASC, $csvData);
// print_r($sortx);
// print_r('<hr>');
// print_r($MID);


	}




}


/* End of file systemupload.php */
/* Location: ./application/controllers/administrator/Systemupload.php */