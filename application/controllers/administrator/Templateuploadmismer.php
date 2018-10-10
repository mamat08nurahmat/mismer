	<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Templateuploadmismer Controller
*| --------------------------------------------------------------------------
*| Templateuploadmismer site
*|
*/
class Templateuploadmismer extends Admin	
{
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_templateuploadmismer');
		$this->load->model('model_mismerdetail');
	}

	/**
	* show all Templateuploadmismers
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('templateuploadmismer_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['templateuploadmismers'] = $this->model_templateuploadmismer->get($filter, $field, $this->limit_page, $offset);
		$this->data['templateuploadmismer_counts'] = $this->model_templateuploadmismer->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/templateuploadmismer/index/',
			'total_rows'   => $this->model_templateuploadmismer->count_all($filter, $field),
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Templateuploadmismer List');
		$this->render('backend/standart/administrator/templateuploadmismer/templateuploadmismer_list', $this->data);
	}
	
	/**
	* Add new templateuploadmismers
	*
	*/
	public function add()
	{
		$this->is_allowed('templateuploadmismer_add');

		$this->template->title('Templateuploadmismer New');
		$this->render('backend/standart/administrator/templateuploadmismer/templateuploadmismer_add', $this->data);
	}

	/**
	* Add New Templateuploadmismers
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('templateuploadmismer_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$this->form_validation->set_rules('MID', 'MID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('MERCHAN_DBA_NAME', 'MERCHAN DBA NAME', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('STATUS_EDC', 'STATUS EDC', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('OPEN_DATE', 'OPEN DATE', 'trim|required');
		$this->form_validation->set_rules('MSO', 'MSO', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('SOURCE_CODE', 'SOURCE CODE', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('POS1', 'POS1', 'trim|required|max_length[25]');
		$this->form_validation->set_rules('IS_VALID', 'IS VALID', 'trim|required|max_length[11]');
		

		if ($this->form_validation->run()) {
		
			$save_data = [
				'MID' => $this->input->post('MID'),
				'MERCHAN_DBA_NAME' => $this->input->post('MERCHAN_DBA_NAME'),
				'STATUS_EDC' => $this->input->post('STATUS_EDC'),
				'OPEN_DATE' => $this->input->post('OPEN_DATE'),
				'MSO' => $this->input->post('MSO'),
				'SOURCE_CODE' => $this->input->post('SOURCE_CODE'),
				'POS1' => $this->input->post('POS1'),
				'IS_VALID' => $this->input->post('IS_VALID'),
			];

			
			$save_templateuploadmismer = $this->model_templateuploadmismer->store($save_data);

			if ($save_templateuploadmismer) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_templateuploadmismer;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/templateuploadmismer/edit/' . $save_templateuploadmismer, 'Edit Templateuploadmismer'),
						anchor('administrator/templateuploadmismer', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/templateuploadmismer/edit/' . $save_templateuploadmismer, 'Edit Templateuploadmismer')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/templateuploadmismer');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/templateuploadmismer');
				}
			}

		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
		/**
	* Update view Templateuploadmismers
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('templateuploadmismer_update');

		$this->data['templateuploadmismer'] = $this->model_templateuploadmismer->find($id);

		$this->template->title('Templateuploadmismer Update');
		$this->render('backend/standart/administrator/templateuploadmismer/templateuploadmismer_update', $this->data);
	}

	/**
	* Update Templateuploadmismers
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('templateuploadmismer_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
		
		$this->form_validation->set_rules('MID', 'MID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('MERCHAN_DBA_NAME', 'MERCHAN DBA NAME', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('STATUS_EDC', 'STATUS EDC', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('OPEN_DATE', 'OPEN DATE', 'trim|required');
		$this->form_validation->set_rules('MSO', 'MSO', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('SOURCE_CODE', 'SOURCE CODE', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('POS1', 'POS1', 'trim|required|max_length[25]');
		$this->form_validation->set_rules('IS_VALID', 'IS VALID', 'trim|required|max_length[11]');
		
		if ($this->form_validation->run()) {
		
			$save_data = [
				'MID' => $this->input->post('MID'),
				'MERCHAN_DBA_NAME' => $this->input->post('MERCHAN_DBA_NAME'),
				'STATUS_EDC' => $this->input->post('STATUS_EDC'),
				'OPEN_DATE' => $this->input->post('OPEN_DATE'),
				'MSO' => $this->input->post('MSO'),
				'SOURCE_CODE' => $this->input->post('SOURCE_CODE'),
				'POS1' => $this->input->post('POS1'),
				'IS_VALID' => $this->input->post('IS_VALID'),
			];

			
			$save_templateuploadmismer = $this->model_templateuploadmismer->change($id, $save_data);

			if ($save_templateuploadmismer) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/templateuploadmismer', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/templateuploadmismer');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/templateuploadmismer');
				}
			}
		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
	/**
	* delete Templateuploadmismers
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('templateuploadmismer_delete');

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
            set_message(cclang('has_been_deleted', 'templateuploadmismer'), 'success');
        } else {
            set_message(cclang('error_delete', 'templateuploadmismer'), 'error');
        }

		redirect_back();
	}

		/**
	* View view Templateuploadmismers
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('templateuploadmismer_view');

		$this->data['templateuploadmismer'] = $this->model_templateuploadmismer->join_avaiable()->find($id);

		$this->template->title('Templateuploadmismer Detail');
		$this->render('backend/standart/administrator/templateuploadmismer/templateuploadmismer_view', $this->data);
	}
	
	/**
	* delete Templateuploadmismers
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$templateuploadmismer = $this->model_templateuploadmismer->find($id);
// ----------------
		
$del = 	$this->db->query("DELETE FROM mismerdetail WHERE MID='$templateuploadmismer->MID'");

$res_insert = $this->db->query("
	INSERT INTO mismerdetail

	SELECT 
	NULL RowID,
	-- a.RowID,
	 (SELECT max(BatchID) as BatchID FROM systemupload) BatchID,
	-- 999 BatchID,
	
	--  date_format(str_to_date(a.OPEN_DATE,'%m/%d/%Y'),'%Y/%m/%d')
	-- AS OPEN_DATE , 
	
	a.OPEN_DATE,
	
	
	a.MID,
	a.MERCHAN_DBA_NAME,
	a.MSO,
	a.SOURCE_CODE,
	
	CASE
		WHEN a.POS1 <= 100 THEN 1
		ELSE LEFT(a.POS1,1)
	END
	AS
	POS1,
	
	CASE
		WHEN LEFT(a.MSO,1)='A' THEN 'WMD'
		WHEN LEFT(a.MSO,1)='B' THEN 'WPD'
		WHEN LEFT(a.MSO,1)='C' THEN 'WPL'
		WHEN LEFT(a.MSO,1)='D' THEN 'WBN'
		WHEN LEFT(a.MSO,1)='E' THEN 'WSM'
		WHEN LEFT(a.MSO,1)='F' THEN 'WSY'
		WHEN LEFT(a.MSO,1)='G' THEN 'WMK'
		WHEN LEFT(a.MSO,1)='H' THEN 'WDR'
		WHEN LEFT(a.MSO,1)='I' THEN 'WBJ'
		WHEN LEFT(a.MSO,1)='J' THEN 'WMO'
		WHEN LEFT(a.MSO,1)='K' THEN 'WPU'
		WHEN LEFT(a.MSO,1)='L' THEN 'WJS'
		WHEN LEFT(a.MSO,1)='M' THEN 'WJK'
		WHEN LEFT(a.MSO,1)='N' THEN 'WJB'
		WHEN LEFT(a.MSO,1)='O' THEN 'WJY'
		WHEN LEFT(a.MSO,1)='R' THEN 'WYK'
		WHEN LEFT(a.MSO,1)='S' THEN 'WMA'	
		
		WHEN SUBSTRING(a.MID,2,2)='01' THEN 'WMD'
		WHEN SUBSTRING(a.MID,2,2)='02' THEN 'WPD'
		WHEN SUBSTRING(a.MID,2,2)='03' THEN 'WPL'
		WHEN SUBSTRING(a.MID,2,2)='04' THEN 'WBN'
		WHEN SUBSTRING(a.MID,2,2)='05' THEN 'WSM'
		WHEN SUBSTRING(a.MID,2,2)='06' THEN 'WSY'
		WHEN SUBSTRING(a.MID,2,2)='07' THEN 'WMK'
		WHEN SUBSTRING(a.MID,2,2)='08' THEN 'WDR'
		WHEN SUBSTRING(a.MID,2,2)='09' THEN 'WBJ'
		WHEN SUBSTRING(a.MID,2,2)='10' THEN 'WJS'
		WHEN SUBSTRING(a.MID,2,2)='11' THEN 'WMO'
		WHEN SUBSTRING(a.MID,2,2)='12' THEN 'WJK'
		WHEN SUBSTRING(a.MID,2,2)='14' THEN 'WJB'
		WHEN SUBSTRING(a.MID,2,2)='15' THEN 'WJY'
		WHEN SUBSTRING(a.MID,2,2)='16' THEN 'WPU'
		WHEN SUBSTRING(a.MID,2,2)='17' THEN 'WYK'
		WHEN SUBSTRING(a.MID,2,2)='18' THEN 'WMA'    
		
	-- 	WHEN LEFT(a.MSO,1)='' THEN 'BLANK'
		  ELSE NULL
	END
	
	as WILAYAH,
	
	
	mc.Channel as CHANNEL,
	 
	
	 
	 
	 CASE
	
		WHEN LEFT(a.MID,1)='3'  THEN 'YAP'
	
		  ELSE 'EDC'
	END
	
	as TYPE_MID
	
	 
	
	FROM templateuploadmismer a 
	
	LEFT JOIN mso_channel mc ON a.MSO=mc.MSO
	
	WHERE a.ID='$templateuploadmismer->ID' 			
	
	");
// ----------------- 
$res_update = $this->db->query("
		
		UPDATE
		mismerdetail
		SET CHANNEL='EXH'
		WHERE MERCHAN_DBA_NAME like'%EXH%';

		");

	// if($res_update){
	// 	// echo '<script>alert("generate succes");</script>';

		// delete templateuploadmismer
		$this->db->query(" 
		INSERT INTO mismerunmatch
		
		SELECT 
		RowID,
		BatchID,
		OPEN_DATE,
		MID,
		MERCHAN_DBA_NAME,
		MSO,
		SOURCE_CODE,
		POS1,
		WILAYAH,
		CHANNEL,
		TYPE_MID,
		0 IS_UPDATE
		
		FROM mismerdetail
		WHERE TYPE_MID='EDC'
		AND CHANNEL IS NULL
		;
		");		
		// redirect mismerdetail
	// 	redirect(site_url('administrator/mismerdetail'),'refresh');
	// }
// -------------------
		return $this->model_templateuploadmismer->remove($id);
	}

	// dtes dev 
	public function tes_remove($id)
	{
		$templateuploadmismer = $this->model_templateuploadmismer->find($id);


		// $save_data = [
		// 	'BatchID' => $this->input->post('BatchID'),
		// 	'OPEN_DATE' => $this->input->post('OPEN_DATE'),
		// 	'MID' => $this->input->post('MID'),
		// 	'MERCHAN_DBA_NAME' => $this->input->post('MERCHAN_DBA_NAME'),
		// 	'MSO' => $this->input->post('MSO'),
		// 	'SOURCE_CODE' => $this->input->post('SOURCE_CODE'),
		// 	'POS1' => $this->input->post('POS1'),
		// 	'WILAYAH' => $this->input->post('WILAYAH'),
		// 	'CHANNEL' => $this->input->post('CHANNEL'),
		// 	'TYPE_MID' => $this->input->post('TYPE_MID'),
		// ];

		// $save_mismerdetail = $this->model_mismerdetail->store($save_data);		

		// BatchID
		// ????????????

		$del = 			$this->db->query("DELETE FROM mismerdetail WHERE MID='$templateuploadmismer->MID'");

		$res = 			$this->db->query("
			INSERT INTO mismerdetail

			SELECT 
			NULL RowID,
			-- a.RowID,
			-- (SELECT max(BatchID) as BatchID FROM systemupload) BatchID,
			999 BatchID,
			
			--  date_format(str_to_date(a.OPEN_DATE,'%m/%d/%Y'),'%Y/%m/%d')
			-- AS OPEN_DATE , 
			
			a.OPEN_DATE,
			
			
			a.MID,
			a.MERCHAN_DBA_NAME,
			a.MSO,
			a.SOURCE_CODE,
			
			CASE
				WHEN a.POS1 <= 100 THEN 1
				ELSE LEFT(a.POS1,1)
			END
			AS
			POS1,
			
			CASE
				WHEN LEFT(a.MSO,1)='A' THEN 'WMD'
				WHEN LEFT(a.MSO,1)='B' THEN 'WPD'
				WHEN LEFT(a.MSO,1)='C' THEN 'WPL'
				WHEN LEFT(a.MSO,1)='D' THEN 'WBN'
				WHEN LEFT(a.MSO,1)='E' THEN 'WSM'
				WHEN LEFT(a.MSO,1)='F' THEN 'WSY'
				WHEN LEFT(a.MSO,1)='G' THEN 'WMK'
				WHEN LEFT(a.MSO,1)='H' THEN 'WDR'
				WHEN LEFT(a.MSO,1)='I' THEN 'WBJ'
				WHEN LEFT(a.MSO,1)='J' THEN 'WMO'
				WHEN LEFT(a.MSO,1)='K' THEN 'WPU'
				WHEN LEFT(a.MSO,1)='L' THEN 'WJS'
				WHEN LEFT(a.MSO,1)='M' THEN 'WJK'
				WHEN LEFT(a.MSO,1)='N' THEN 'WJB'
				WHEN LEFT(a.MSO,1)='O' THEN 'WJY'
				WHEN LEFT(a.MSO,1)='R' THEN 'WYK'
				WHEN LEFT(a.MSO,1)='S' THEN 'WMA'	
				
				WHEN SUBSTRING(a.MID,2,2)='01' THEN 'WMD'
				WHEN SUBSTRING(a.MID,2,2)='02' THEN 'WPD'
				WHEN SUBSTRING(a.MID,2,2)='03' THEN 'WPL'
				WHEN SUBSTRING(a.MID,2,2)='04' THEN 'WBN'
				WHEN SUBSTRING(a.MID,2,2)='05' THEN 'WSM'
				WHEN SUBSTRING(a.MID,2,2)='06' THEN 'WSY'
				WHEN SUBSTRING(a.MID,2,2)='07' THEN 'WMK'
				WHEN SUBSTRING(a.MID,2,2)='08' THEN 'WDR'
				WHEN SUBSTRING(a.MID,2,2)='09' THEN 'WBJ'
				WHEN SUBSTRING(a.MID,2,2)='10' THEN 'WJS'
				WHEN SUBSTRING(a.MID,2,2)='11' THEN 'WMO'
				WHEN SUBSTRING(a.MID,2,2)='12' THEN 'WJK'
				WHEN SUBSTRING(a.MID,2,2)='14' THEN 'WJB'
				WHEN SUBSTRING(a.MID,2,2)='15' THEN 'WJY'
				WHEN SUBSTRING(a.MID,2,2)='16' THEN 'WPU'
				WHEN SUBSTRING(a.MID,2,2)='17' THEN 'WYK'
				WHEN SUBSTRING(a.MID,2,2)='18' THEN 'WMA'    
				
			-- 	WHEN LEFT(a.MSO,1)='' THEN 'BLANK'
				  ELSE NULL
			END
			
			as WILAYAH,
			
			
			mc.Channel as CHANNEL,
			 
			
			 
			 
			 CASE
			
				WHEN LEFT(a.MID,1)='3'  THEN 'YAP'
			
				  ELSE 'EDC'
			END
			
			as TYPE_MID
			
			 
			
			FROM templateuploadmismer a 
			
			LEFT JOIN mso_channel mc ON a.MSO=mc.MSO
			
			WHERE a.ID='$templateuploadmismer->ID' 			
			
			");

			print_r($templateuploadmismer);
			print_r('<hr>');
			print_r($del);
			print_r('<hr>');
			print_r($res);
			// return $this->model_templateuploadmismer->remove($id);
	}

	// dev generate per 100 data

	public function generate_limit()
	{
		// $templateuploadmismer = $this->model_templateuploadmismer->find($id);



		$res = 			$this->db->query("
		
		CALL P_gen_limit();			
			");

if($res){

	$del = 			$this->db->query(" 
	SET SQL_SAFE_UPDATES = 0; 
DELETE FROM templateuploadmismer
ORDER BY MID ASC LIMIT 100

	");


}			

			// return $this->model_templateuploadmismer->remove($id);
	}


	public function generate_all(){


	//    $set = $this->db->query("SET SQL_SAFE_UPDATES = 0;");
	//    $del = $this->db->query("delete from mismerdetail where MID IN(select MID from templateuploadmismer);");
	   $res = $this->db->query("CALL P_generate_all();");

	if($res){
		echo '<script>alert("generate succes");</script>';

		// delete templateuploadmismer
		$this->db->query("truncate templateuploadmismer");		
		// redirect mismerdetail
		redirect(site_url('administrator/mismerdetail'),'refresh');
	}
	}	

	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('templateuploadmismer_export');

		$this->model_templateuploadmismer->export('templateuploadmismer', 'templateuploadmismer');
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('templateuploadmismer_export');

		$this->model_templateuploadmismer->pdf('templateuploadmismer', 'templateuploadmismer');
	}

//================================

// ============generate all===
public function gen_all(){
// get all id templateuploadmismer
print_r('generate all');die();
}

// generate by checkbox===========================
public function generate($id = null)
{
	// $this->is_allowed('templateuploadmismer_delete');

	$this->load->helper('file');

	$arr_id = $this->input->get('id');
	$remove = false;

	if (!empty($id)) {
		$generate = $this->_generate($id);
	} elseif (count($arr_id) >0) {
		foreach ($arr_id as $id) {
			$generate = $this->_generate($id);
		}
	}

	if ($generate) {
		set_message(cclang('has_been_generate', 'templateuploadmismer'), 'success');
	} else {
		set_message(cclang('error_generate', 'templateuploadmismer'), 'error');
	}

	redirect_back();
}

// generate single

private function _generate($id)
{
	$templateuploadmismer = $this->model_templateuploadmismer->find($id);
// print_r($templateuploadmismer);die();
// act generate	
$del = 			$this->db->query("DELETE FROM mismerdetail WHERE MID='$templateuploadmismer->MID'");

$res = 			$this->db->query("
	INSERT INTO mismerdetail

	SELECT 
	NULL RowID,
	-- a.RowID,
	-- (SELECT max(BatchID) as BatchID FROM systemupload) BatchID,
	999 BatchID,
	
	--  date_format(str_to_date(a.OPEN_DATE,'%m/%d/%Y'),'%Y/%m/%d')
	-- AS OPEN_DATE , 
	
	a.OPEN_DATE,
	
	
	a.MID,
	a.MERCHAN_DBA_NAME,
	a.MSO,
	a.SOURCE_CODE,
	
	CASE
		WHEN a.POS1 <= 100 THEN 1
		ELSE LEFT(a.POS1,1)
	END
	AS
	POS1,
	
	CASE
		WHEN LEFT(a.MSO,1)='A' THEN 'WMD'
		WHEN LEFT(a.MSO,1)='B' THEN 'WPD'
		WHEN LEFT(a.MSO,1)='C' THEN 'WPL'
		WHEN LEFT(a.MSO,1)='D' THEN 'WBN'
		WHEN LEFT(a.MSO,1)='E' THEN 'WSM'
		WHEN LEFT(a.MSO,1)='F' THEN 'WSY'
		WHEN LEFT(a.MSO,1)='G' THEN 'WMK'
		WHEN LEFT(a.MSO,1)='H' THEN 'WDR'
		WHEN LEFT(a.MSO,1)='I' THEN 'WBJ'
		WHEN LEFT(a.MSO,1)='J' THEN 'WMO'
		WHEN LEFT(a.MSO,1)='K' THEN 'WPU'
		WHEN LEFT(a.MSO,1)='L' THEN 'WJS'
		WHEN LEFT(a.MSO,1)='M' THEN 'WJK'
		WHEN LEFT(a.MSO,1)='N' THEN 'WJB'
		WHEN LEFT(a.MSO,1)='O' THEN 'WJY'
		WHEN LEFT(a.MSO,1)='R' THEN 'WYK'
		WHEN LEFT(a.MSO,1)='S' THEN 'WMA'	
		
		WHEN SUBSTRING(a.MID,2,2)='01' THEN 'WMD'
		WHEN SUBSTRING(a.MID,2,2)='02' THEN 'WPD'
		WHEN SUBSTRING(a.MID,2,2)='03' THEN 'WPL'
		WHEN SUBSTRING(a.MID,2,2)='04' THEN 'WBN'
		WHEN SUBSTRING(a.MID,2,2)='05' THEN 'WSM'
		WHEN SUBSTRING(a.MID,2,2)='06' THEN 'WSY'
		WHEN SUBSTRING(a.MID,2,2)='07' THEN 'WMK'
		WHEN SUBSTRING(a.MID,2,2)='08' THEN 'WDR'
		WHEN SUBSTRING(a.MID,2,2)='09' THEN 'WBJ'
		WHEN SUBSTRING(a.MID,2,2)='10' THEN 'WJS'
		WHEN SUBSTRING(a.MID,2,2)='11' THEN 'WMO'
		WHEN SUBSTRING(a.MID,2,2)='12' THEN 'WJK'
		WHEN SUBSTRING(a.MID,2,2)='14' THEN 'WJB'
		WHEN SUBSTRING(a.MID,2,2)='15' THEN 'WJY'
		WHEN SUBSTRING(a.MID,2,2)='16' THEN 'WPU'
		WHEN SUBSTRING(a.MID,2,2)='17' THEN 'WYK'
		WHEN SUBSTRING(a.MID,2,2)='18' THEN 'WMA'    
		
	-- 	WHEN LEFT(a.MSO,1)='' THEN 'BLANK'
		  ELSE NULL
	END
	
	as WILAYAH,
	
	
	mc.Channel as CHANNEL,
	 
	
	 
	 
	 CASE
	
		WHEN LEFT(a.MID,1)='3'  THEN 'YAP'
	
		  ELSE 'EDC'
	END
	
	as TYPE_MID
	
	 
	
	FROM templateuploadmismer a 
	
	LEFT JOIN mso_channel mc ON a.MSO=mc.MSO
	
	WHERE a.ID='$templateuploadmismer->ID' 			
	
	");


	print_r($templateuploadmismer);
	print_r('<hr>');
	print_r($del);
	print_r('<hr>');
	print_r($res);

die();
	// return $this->model_mismerdetail->remove($id);
}



}


/* End of file templateuploadmismer.php */
/* Location: ./application/controllers/administrator/Templateuploadmismer.php */