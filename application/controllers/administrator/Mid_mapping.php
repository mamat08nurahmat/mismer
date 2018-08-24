<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Mid Mapping Controller
*| --------------------------------------------------------------------------
*| Mid Mapping site
*|
*/
class Mid_mapping extends Admin	
{
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_mid_mapping');
	}

	/**
	* show all Mid Mappings
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('mid_mapping_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['mid_mappings'] = $this->model_mid_mapping->get($filter, $field, $this->limit_page, $offset);
		$this->data['mid_mapping_counts'] = $this->model_mid_mapping->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/mid_mapping/index/',
			'total_rows'   => $this->model_mid_mapping->count_all($filter, $field),
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Mid Mapping List');
		$this->render('backend/standart/administrator/mid_mapping/mid_mapping_list', $this->data);
	}
	
	/**
	* Add new mid_mappings
	*
	*/
	public function add()
	{
		$this->is_allowed('mid_mapping_add');

		$this->template->title('Mid Mapping New');
		$this->render('backend/standart/administrator/mid_mapping/mid_mapping_add', $this->data);
	}

	/**
	* Add New Mid Mappings
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('mid_mapping_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$this->form_validation->set_rules('MID', 'MID', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('MERCHAN_DBA_NAME', 'MERCHAN DBA NAME', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('EDC', 'EDC', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('EXH', 'EXH', 'trim|required|max_length[11]');
		

		if ($this->form_validation->run()) {
		
			$save_data = [
				'MID' => $this->input->post('MID'),
				'MERCHAN_DBA_NAME' => $this->input->post('MERCHAN_DBA_NAME'),
				'EDC' => $this->input->post('EDC'),
				'EXH' => $this->input->post('EXH'),
			];

			
			$save_mid_mapping = $this->model_mid_mapping->store($save_data);

			if ($save_mid_mapping) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_mid_mapping;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/mid_mapping/edit/' . $save_mid_mapping, 'Edit Mid Mapping'),
						anchor('administrator/mid_mapping', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/mid_mapping/edit/' . $save_mid_mapping, 'Edit Mid Mapping')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/mid_mapping');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/mid_mapping');
				}
			}

		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
		/**
	* Update view Mid Mappings
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('mid_mapping_update');

		$this->data['mid_mapping'] = $this->model_mid_mapping->find($id);

		$this->template->title('Mid Mapping Update');
		$this->render('backend/standart/administrator/mid_mapping/mid_mapping_update', $this->data);
	}

	/**
	* Update Mid Mappings
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('mid_mapping_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
		
		$this->form_validation->set_rules('MID', 'MID', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('MERCHAN_DBA_NAME', 'MERCHAN DBA NAME', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('EDC', 'EDC', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('EXH', 'EXH', 'trim|required|max_length[11]');
		
		if ($this->form_validation->run()) {
		
			$save_data = [
				'MID' => $this->input->post('MID'),
				'MERCHAN_DBA_NAME' => $this->input->post('MERCHAN_DBA_NAME'),
				'EDC' => $this->input->post('EDC'),
				'EXH' => $this->input->post('EXH'),
			];

			
			$save_mid_mapping = $this->model_mid_mapping->change($id, $save_data);

			if ($save_mid_mapping) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/mid_mapping', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/mid_mapping');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/mid_mapping');
				}
			}
		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
	/**
	* delete Mid Mappings
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('mid_mapping_delete');

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
            set_message(cclang('has_been_deleted', 'mid_mapping'), 'success');
        } else {
            set_message(cclang('error_delete', 'mid_mapping'), 'error');
        }

		redirect_back();
	}

		/**
	* View view Mid Mappings
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('mid_mapping_view');

		$this->data['mid_mapping'] = $this->model_mid_mapping->join_avaiable()->find($id);

		$this->template->title('Mid Mapping Detail');
		$this->render('backend/standart/administrator/mid_mapping/mid_mapping_view', $this->data);
	}
	
	/**
	* delete Mid Mappings
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$mid_mapping = $this->model_mid_mapping->find($id);

		
		
		return $this->model_mid_mapping->remove($id);
	}
	
	
	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('mid_mapping_export');

		$this->model_mid_mapping->export('mid_mapping', 'mid_mapping');
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('mid_mapping_export');

		$this->model_mid_mapping->pdf('mid_mapping', 'mid_mapping');
	}
}


/* End of file mid_mapping.php */
/* Location: ./application/controllers/administrator/Mid Mapping.php */