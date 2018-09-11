<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Unmatch Controller
*| --------------------------------------------------------------------------
*| Unmatch site
*|
*/
class Unmatch extends Admin	
{
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_unmatch');
	}

	/**
	* show all Unmatchs
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('unmatch_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['unmatchs'] = $this->model_unmatch->get($filter, $field, $this->limit_page, $offset);
		$this->data['unmatch_counts'] = $this->model_unmatch->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/unmatch/index/',
			'total_rows'   => $this->model_unmatch->count_all($filter, $field),
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Unmatch List');
		$this->render('backend/standart/administrator/unmatch/unmatch_list', $this->data);
	}
	
	/**
	* Add new unmatchs
	*
	*/
	public function add()
	{
		$this->is_allowed('unmatch_add');

		$this->template->title('Unmatch New');
		$this->render('backend/standart/administrator/unmatch/unmatch_add', $this->data);
	}

	/**
	* Add New Unmatchs
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('unmatch_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$this->form_validation->set_rules('RowID', 'RowID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('BatchID', 'BatchID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('MID', 'MID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('WILAYAH', 'WILAYAH', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('CHANNEL', 'CHANNEL', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('TYPE_MID', 'TYPE MID', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('OPEN_DATE', 'OPEN DATE', 'trim|required');
		

		if ($this->form_validation->run()) {
		
			$save_data = [
				'RowID' => $this->input->post('RowID'),
				'BatchID' => $this->input->post('BatchID'),
				'MID' => $this->input->post('MID'),
				'WILAYAH' => $this->input->post('WILAYAH'),
				'CHANNEL' => $this->input->post('CHANNEL'),
				'TYPE_MID' => $this->input->post('TYPE_MID'),
				'OPEN_DATE' => $this->input->post('OPEN_DATE'),
			];

			
			$save_unmatch = $this->model_unmatch->store($save_data);

			if ($save_unmatch) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_unmatch;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/unmatch/edit/' . $save_unmatch, 'Edit Unmatch'),
						anchor('administrator/unmatch', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/unmatch/edit/' . $save_unmatch, 'Edit Unmatch')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/unmatch');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/unmatch');
				}
			}

		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
		/**
	* Update view Unmatchs
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('unmatch_update');

		$this->data['unmatch'] = $this->model_unmatch->find($id);

		$this->template->title('Unmatch Update');
		$this->render('backend/standart/administrator/unmatch/unmatch_update', $this->data);
	}

	/**
	* Update Unmatchs
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('unmatch_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
		
		$this->form_validation->set_rules('RowID', 'RowID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('BatchID', 'BatchID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('MID', 'MID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('WILAYAH', 'WILAYAH', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('CHANNEL', 'CHANNEL', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('TYPE_MID', 'TYPE MID', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('OPEN_DATE', 'OPEN DATE', 'trim|required');
		
		if ($this->form_validation->run()) {
		
			$save_data = [
				'RowID' => $this->input->post('RowID'),
				'BatchID' => $this->input->post('BatchID'),
				'MID' => $this->input->post('MID'),
				'WILAYAH' => $this->input->post('WILAYAH'),
				'CHANNEL' => $this->input->post('CHANNEL'),
				'TYPE_MID' => $this->input->post('TYPE_MID'),
				'OPEN_DATE' => $this->input->post('OPEN_DATE'),
			];

			
			$save_unmatch = $this->model_unmatch->change($id, $save_data);

			if ($save_unmatch) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/unmatch', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/unmatch');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/unmatch');
				}
			}
		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
	/**
	* delete Unmatchs
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('unmatch_delete');

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
            set_message(cclang('has_been_deleted', 'unmatch'), 'success');
        } else {
            set_message(cclang('error_delete', 'unmatch'), 'error');
        }

		redirect_back();
	}

		/**
	* View view Unmatchs
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('unmatch_view');

		$this->data['unmatch'] = $this->model_unmatch->join_avaiable()->find($id);

		$this->template->title('Unmatch Detail');
		$this->render('backend/standart/administrator/unmatch/unmatch_view', $this->data);
	}
	
	/**
	* delete Unmatchs
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$unmatch = $this->model_unmatch->find($id);

		
		
		return $this->model_unmatch->remove($id);
	}
	
	
	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('unmatch_export');

		$this->model_unmatch->export('unmatch', 'unmatch');
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('unmatch_export');

		$this->model_unmatch->pdf('unmatch', 'unmatch');
	}
}


/* End of file unmatch.php */
/* Location: ./application/controllers/administrator/Unmatch.php */