<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Templateunmatch Controller
*| --------------------------------------------------------------------------
*| Templateunmatch site
*|
*/
class Templateunmatch extends Admin	
{
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_templateunmatch');
	}

	/**
	* show all Templateunmatchs
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('templateunmatch_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['templateunmatchs'] = $this->model_templateunmatch->get($filter, $field, $this->limit_page, $offset);
		$this->data['templateunmatch_counts'] = $this->model_templateunmatch->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/templateunmatch/index/',
			'total_rows'   => $this->model_templateunmatch->count_all($filter, $field),
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Templateunmatch List');
		$this->render('backend/standart/administrator/templateunmatch/templateunmatch_list', $this->data);
	}
	
	/**
	* Add new templateunmatchs
	*
	*/
	public function add()
	{
		$this->is_allowed('templateunmatch_add');

		$this->template->title('Templateunmatch New');
		$this->render('backend/standart/administrator/templateunmatch/templateunmatch_add', $this->data);
	}

	/**
	* Add New Templateunmatchs
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('templateunmatch_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$this->form_validation->set_rules('MID', 'MID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('CHANNEL', 'CHANNEL', 'trim|required|max_length[55]');
		

		if ($this->form_validation->run()) {
		
			$save_data = [
				'MID' => $this->input->post('MID'),
				'CHANNEL' => $this->input->post('CHANNEL'),
			];

			
			$save_templateunmatch = $this->model_templateunmatch->store($save_data);

			if ($save_templateunmatch) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_templateunmatch;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/templateunmatch/edit/' . $save_templateunmatch, 'Edit Templateunmatch'),
						anchor('administrator/templateunmatch', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/templateunmatch/edit/' . $save_templateunmatch, 'Edit Templateunmatch')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/templateunmatch');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/templateunmatch');
				}
			}

		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
		/**
	* Update view Templateunmatchs
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('templateunmatch_update');

		$this->data['templateunmatch'] = $this->model_templateunmatch->find($id);

		$this->template->title('Templateunmatch Update');
		$this->render('backend/standart/administrator/templateunmatch/templateunmatch_update', $this->data);
	}

	/**
	* Update Templateunmatchs
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('templateunmatch_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
		
		$this->form_validation->set_rules('MID', 'MID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('CHANNEL', 'CHANNEL', 'trim|required|max_length[55]');
		
		if ($this->form_validation->run()) {
		
			$save_data = [
				'MID' => $this->input->post('MID'),
				'CHANNEL' => $this->input->post('CHANNEL'),
			];

			
			$save_templateunmatch = $this->model_templateunmatch->change($id, $save_data);

			if ($save_templateunmatch) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/templateunmatch', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/templateunmatch');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/templateunmatch');
				}
			}
		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
	/**
	* delete Templateunmatchs
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('templateunmatch_delete');

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
            set_message(cclang('has_been_deleted', 'templateunmatch'), 'success');
        } else {
            set_message(cclang('error_delete', 'templateunmatch'), 'error');
        }

		redirect_back();
	}

		/**
	* View view Templateunmatchs
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('templateunmatch_view');

		$this->data['templateunmatch'] = $this->model_templateunmatch->join_avaiable()->find($id);

		$this->template->title('Templateunmatch Detail');
		$this->render('backend/standart/administrator/templateunmatch/templateunmatch_view', $this->data);
	}
	
	/**
	* delete Templateunmatchs
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$templateunmatch = $this->model_templateunmatch->find($id);

		
		
		return $this->model_templateunmatch->remove($id);
	}
	
	
	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('templateunmatch_export');

		$this->model_templateunmatch->export('templateunmatch', 'templateunmatch');
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('templateunmatch_export');

		$this->model_templateunmatch->pdf('templateunmatch', 'templateunmatch');
	}
}


/* End of file templateunmatch.php */
/* Location: ./application/controllers/administrator/Templateunmatch.php */