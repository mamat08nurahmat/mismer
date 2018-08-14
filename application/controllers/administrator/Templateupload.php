<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Templateupload Controller
*| --------------------------------------------------------------------------
*| Templateupload site
*|
*/
class Templateupload extends Admin
{

	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_templateupload');
	}

	/**
	* show all Templateuploads
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('templateupload_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['templateuploads'] = $this->model_templateupload->get($filter, $field, $this->limit_page, $offset);
		$this->data['templateupload_counts'] = $this->model_templateupload->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/templateupload/index/',
			'total_rows'   => $this->model_templateupload->count_all($filter, $field),
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Templateupload List');
		$this->render('backend/standart/administrator/templateupload/templateupload_list', $this->data);
	}

	/**
	* Add new templateuploads
	*
	*/
	public function add()
	{
		$this->is_allowed('templateupload_add');

		$this->template->title('Templateupload New');
		$this->render('backend/standart/administrator/templateupload/templateupload_add', $this->data);
	}

	/**
	* Add New Templateuploads
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('templateupload_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$this->form_validation->set_rules('BatchID', 'BatchID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('MID', 'MID', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('MERCHAN_DBA_NAME', 'MERCHAN DBA NAME', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('STATUS_EDC', 'STATUS EDC', 'trim|required|max_length[5]');
		$this->form_validation->set_rules('OPEN_DATE', 'OPEN DATE', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('CITY', 'CITY', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('MSO', 'MSO', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('SOURCE_CODE', 'SOURCE CODE', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('POS1', 'POS1', 'trim|required|max_length[5]');


		if ($this->form_validation->run()) {

			$save_data = [
				'BatchID' => $this->input->post('BatchID'),
				'MID' => $this->input->post('MID'),
				'MERCHAN_DBA_NAME' => $this->input->post('MERCHAN_DBA_NAME'),
				'STATUS_EDC' => $this->input->post('STATUS_EDC'),
				'OPEN_DATE' => $this->input->post('OPEN_DATE'),
				'CITY' => $this->input->post('CITY'),
				'MSO' => $this->input->post('MSO'),
				'SOURCE_CODE' => $this->input->post('SOURCE_CODE'),
				'POS1' => $this->input->post('POS1'),
			];


			$save_templateupload = $this->model_templateupload->store($save_data);

			if ($save_templateupload) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_templateupload;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/templateupload/edit/' . $save_templateupload, 'Edit Templateupload'),
						anchor('administrator/templateupload', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/templateupload/edit/' . $save_templateupload, 'Edit Templateupload')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/templateupload');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/templateupload');
				}
			}

		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}

		/**
	* Update view Templateuploads
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('templateupload_update');

		$this->data['templateupload'] = $this->model_templateupload->find($id);

		$this->template->title('Templateupload Update');
		$this->render('backend/standart/administrator/templateupload/templateupload_update', $this->data);
	}

	/**
	* Update Templateuploads
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('templateupload_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$this->form_validation->set_rules('BatchID', 'BatchID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('MID', 'MID', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('MERCHAN_DBA_NAME', 'MERCHAN DBA NAME', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('STATUS_EDC', 'STATUS EDC', 'trim|required|max_length[5]');
		$this->form_validation->set_rules('OPEN_DATE', 'OPEN DATE', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('CITY', 'CITY', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('MSO', 'MSO', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('SOURCE_CODE', 'SOURCE CODE', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('POS1', 'POS1', 'trim|required|max_length[5]');

		if ($this->form_validation->run()) {

			$save_data = [
				'BatchID' => $this->input->post('BatchID'),
				'MID' => $this->input->post('MID'),
				'MERCHAN_DBA_NAME' => $this->input->post('MERCHAN_DBA_NAME'),
				'STATUS_EDC' => $this->input->post('STATUS_EDC'),
				'OPEN_DATE' => $this->input->post('OPEN_DATE'),
				'CITY' => $this->input->post('CITY'),
				'MSO' => $this->input->post('MSO'),
				'SOURCE_CODE' => $this->input->post('SOURCE_CODE'),
				'POS1' => $this->input->post('POS1'),
			];


			$save_templateupload = $this->model_templateupload->change($id, $save_data);

			if ($save_templateupload) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/templateupload', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/templateupload');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/templateupload');
				}
			}
		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}

	/**
	* delete Templateuploads
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('templateupload_delete');

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
            set_message(cclang('has_been_deleted', 'templateupload'), 'success');
        } else {
            set_message(cclang('error_delete', 'templateupload'), 'error');
        }

		redirect_back();
	}

		/**
	* View view Templateuploads
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('templateupload_view');

		$this->data['templateupload'] = $this->model_templateupload->join_avaiable()->find($id);

		$this->template->title('Templateupload Detail');
		$this->render('backend/standart/administrator/templateupload/templateupload_view', $this->data);
	}

	/**
	* delete Templateuploads
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$templateupload = $this->model_templateupload->find($id);



		return $this->model_templateupload->remove($id);
	}


	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('templateupload_export');

		$this->model_templateupload->export('templateupload', 'templateupload');
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('templateupload_export');

		$this->model_templateupload->pdf('templateupload', 'templateupload');
	}


//=====================================
public function generate_upload(){

print_r('generateeeeeeeeeee');die();

}


}


/* End of file templateupload.php */
/* Location: ./application/controllers/administrator/Templateupload.php */
