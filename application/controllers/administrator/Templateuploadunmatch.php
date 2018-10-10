<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Templateuploadunmatch Controller
*| --------------------------------------------------------------------------
*| Templateuploadunmatch site
*|
*/
class Templateuploadunmatch extends Admin	
{
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_templateuploadunmatch');
	}

	/**
	* show all Templateuploadunmatchs
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('templateuploadunmatch_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['templateuploadunmatchs'] = $this->model_templateuploadunmatch->get($filter, $field, $this->limit_page, $offset);
		$this->data['templateuploadunmatch_counts'] = $this->model_templateuploadunmatch->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/templateuploadunmatch/index/',
			'total_rows'   => $this->model_templateuploadunmatch->count_all($filter, $field),
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Templateuploadunmatch List');
		$this->render('backend/standart/administrator/templateuploadunmatch/templateuploadunmatch_list', $this->data);
	}
	
	/**
	* Add new templateuploadunmatchs
	*
	*/
	public function add()
	{
		$this->is_allowed('templateuploadunmatch_add');

		$this->template->title('Templateuploadunmatch New');
		$this->render('backend/standart/administrator/templateuploadunmatch/templateuploadunmatch_add', $this->data);
	}

	/**
	* Add New Templateuploadunmatchs
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('templateuploadunmatch_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$this->form_validation->set_rules('OPEN_DATE', 'OPEN DATE', 'trim|required');
		$this->form_validation->set_rules('MID', 'MID', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('MERCHAN_DBA_NAME', 'MERCHAN DBA NAME', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('MSO', 'MSO', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('SOURCE_CODE', 'SOURCE CODE', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('POS1', 'POS1', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('WILAYAH', 'WILAYAH', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('CHANNEL', 'CHANNEL', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('TYPE_MID', 'TYPE MID', 'trim|required|max_length[45]');
		

		if ($this->form_validation->run()) {
		
			$save_data = [
				'OPEN_DATE' => $this->input->post('OPEN_DATE'),
				'MID' => $this->input->post('MID'),
				'MERCHAN_DBA_NAME' => $this->input->post('MERCHAN_DBA_NAME'),
				'MSO' => $this->input->post('MSO'),
				'SOURCE_CODE' => $this->input->post('SOURCE_CODE'),
				'POS1' => $this->input->post('POS1'),
				'WILAYAH' => $this->input->post('WILAYAH'),
				'CHANNEL' => $this->input->post('CHANNEL'),
				'TYPE_MID' => $this->input->post('TYPE_MID'),
			];

			
			$save_templateuploadunmatch = $this->model_templateuploadunmatch->store($save_data);

			if ($save_templateuploadunmatch) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_templateuploadunmatch;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/templateuploadunmatch/edit/' . $save_templateuploadunmatch, 'Edit Templateuploadunmatch'),
						anchor('administrator/templateuploadunmatch', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/templateuploadunmatch/edit/' . $save_templateuploadunmatch, 'Edit Templateuploadunmatch')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/templateuploadunmatch');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/templateuploadunmatch');
				}
			}

		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
		/**
	* Update view Templateuploadunmatchs
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('templateuploadunmatch_update');

		$this->data['templateuploadunmatch'] = $this->model_templateuploadunmatch->find($id);

		$this->template->title('Templateuploadunmatch Update');
		$this->render('backend/standart/administrator/templateuploadunmatch/templateuploadunmatch_update', $this->data);
	}

	/**
	* Update Templateuploadunmatchs
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('templateuploadunmatch_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
		
		$this->form_validation->set_rules('OPEN_DATE', 'OPEN DATE', 'trim|required');
		$this->form_validation->set_rules('MID', 'MID', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('MERCHAN_DBA_NAME', 'MERCHAN DBA NAME', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('MSO', 'MSO', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('SOURCE_CODE', 'SOURCE CODE', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('POS1', 'POS1', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('WILAYAH', 'WILAYAH', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('CHANNEL', 'CHANNEL', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('TYPE_MID', 'TYPE MID', 'trim|required|max_length[45]');
		
		if ($this->form_validation->run()) {
		
			$save_data = [
				'OPEN_DATE' => $this->input->post('OPEN_DATE'),
				'MID' => $this->input->post('MID'),
				'MERCHAN_DBA_NAME' => $this->input->post('MERCHAN_DBA_NAME'),
				'MSO' => $this->input->post('MSO'),
				'SOURCE_CODE' => $this->input->post('SOURCE_CODE'),
				'POS1' => $this->input->post('POS1'),
				'WILAYAH' => $this->input->post('WILAYAH'),
				'CHANNEL' => $this->input->post('CHANNEL'),
				'TYPE_MID' => $this->input->post('TYPE_MID'),
			];

			
			$save_templateuploadunmatch = $this->model_templateuploadunmatch->change($id, $save_data);

			if ($save_templateuploadunmatch) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/templateuploadunmatch', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/templateuploadunmatch');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/templateuploadunmatch');
				}
			}
		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
	/**
	* delete Templateuploadunmatchs
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('templateuploadunmatch_delete');

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
            set_message(cclang('has_been_deleted', 'templateuploadunmatch'), 'success');
        } else {
            set_message(cclang('error_delete', 'templateuploadunmatch'), 'error');
        }

		redirect_back();
	}

		/**
	* View view Templateuploadunmatchs
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('templateuploadunmatch_view');

		$this->data['templateuploadunmatch'] = $this->model_templateuploadunmatch->join_avaiable()->find($id);

		$this->template->title('Templateuploadunmatch Detail');
		$this->render('backend/standart/administrator/templateuploadunmatch/templateuploadunmatch_view', $this->data);
	}
	
	/**
	* delete Templateuploadunmatchs
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$templateuploadunmatch = $this->model_templateuploadunmatch->find($id);

		$update = $this->db->query("
		UPDATE mismerunmatch
		SET WILAYAH = '$templateuploadunmatch->WILAYAH',
		CHANNEL = '$templateuploadunmatch->CHANNEL',
		IS_UPDATE=1
		
		WHERE MID='$templateuploadunmatch->MID'
		
		
		");
				
		
		return $this->model_templateuploadunmatch->remove($id);
	}

	
// dev tes
public function tes_remove($id)
{
	
	$templateuploadunmatch = $this->model_templateuploadunmatch->find($id);



$update = $this->db->query("
UPDATE mismerunmatch
SET WILAYAH = '$templateuploadunmatch->WILAYAH',
CHANNEL = '$templateuploadunmatch->CHANNEL',
IS_UPDATE=1

WHERE MID='$templateuploadunmatch->MID'


");

print_r($templateuploadunmatch);	
print_r('<hr>');	
print_r($update);	

	// return $this->model_templateuploadunmatch->remove($id);
}



	
	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('templateuploadunmatch_export');

		$this->model_templateuploadunmatch->export('templateuploadunmatch', 'templateuploadunmatch');
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('templateuploadunmatch_export');

		$this->model_templateuploadunmatch->pdf('templateuploadunmatch', 'templateuploadunmatch');
	}
}


/* End of file templateuploadunmatch.php */
/* Location: ./application/controllers/administrator/Templateuploadunmatch.php */