<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Applicationtype Controller
*| --------------------------------------------------------------------------
*| Applicationtype site
*|
*/
class Applicationtype extends Admin	
{
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_applicationtype');
	}

	/**
	* show all Applicationtypes
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('applicationtype_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['applicationtypes'] = $this->model_applicationtype->get($filter, $field, $this->limit_page, $offset);
		$this->data['applicationtype_counts'] = $this->model_applicationtype->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/applicationtype/index/',
			'total_rows'   => $this->model_applicationtype->count_all($filter, $field),
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Applicationtype List');
		$this->render('backend/standart/administrator/applicationtype/applicationtype_list', $this->data);
	}
	
	/**
	* Add new applicationtypes
	*
	*/
	public function add()
	{
		$this->is_allowed('applicationtype_add');

		$this->template->title('Applicationtype New');
		$this->render('backend/standart/administrator/applicationtype/applicationtype_add', $this->data);
	}

	/**
	* Add New Applicationtypes
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('applicationtype_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$this->form_validation->set_rules('ApplicationName', 'ApplicationName', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('ApplicationSource', 'ApplicationSource', 'trim|required|max_length[255]');
		

		if ($this->form_validation->run()) {
		
			$save_data = [
				'ApplicationName' => $this->input->post('ApplicationName'),
				'ApplicationSource' => $this->input->post('ApplicationSource'),
			];

			
			$save_applicationtype = $this->model_applicationtype->store($save_data);

			if ($save_applicationtype) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_applicationtype;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/applicationtype/edit/' . $save_applicationtype, 'Edit Applicationtype'),
						anchor('administrator/applicationtype', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/applicationtype/edit/' . $save_applicationtype, 'Edit Applicationtype')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/applicationtype');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/applicationtype');
				}
			}

		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
		/**
	* Update view Applicationtypes
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('applicationtype_update');

		$this->data['applicationtype'] = $this->model_applicationtype->find($id);

		$this->template->title('Applicationtype Update');
		$this->render('backend/standart/administrator/applicationtype/applicationtype_update', $this->data);
	}

	/**
	* Update Applicationtypes
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('applicationtype_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
		
		$this->form_validation->set_rules('ApplicationName', 'ApplicationName', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('ApplicationSource', 'ApplicationSource', 'trim|required|max_length[255]');
		
		if ($this->form_validation->run()) {
		
			$save_data = [
				'ApplicationName' => $this->input->post('ApplicationName'),
				'ApplicationSource' => $this->input->post('ApplicationSource'),
			];

			
			$save_applicationtype = $this->model_applicationtype->change($id, $save_data);

			if ($save_applicationtype) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/applicationtype', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/applicationtype');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/applicationtype');
				}
			}
		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
	/**
	* delete Applicationtypes
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('applicationtype_delete');

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
            set_message(cclang('has_been_deleted', 'applicationtype'), 'success');
        } else {
            set_message(cclang('error_delete', 'applicationtype'), 'error');
        }

		redirect_back();
	}

		/**
	* View view Applicationtypes
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('applicationtype_view');

		$this->data['applicationtype'] = $this->model_applicationtype->join_avaiable()->find($id);

		$this->template->title('Applicationtype Detail');
		$this->render('backend/standart/administrator/applicationtype/applicationtype_view', $this->data);
	}
	
	/**
	* delete Applicationtypes
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$applicationtype = $this->model_applicationtype->find($id);

		
		
		return $this->model_applicationtype->remove($id);
	}
	
	
	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('applicationtype_export');

		$this->model_applicationtype->export('applicationtype', 'applicationtype');
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('applicationtype_export');

		$this->model_applicationtype->pdf('applicationtype', 'applicationtype');
	}
}


/* End of file applicationtype.php */
/* Location: ./application/controllers/administrator/Applicationtype.php */