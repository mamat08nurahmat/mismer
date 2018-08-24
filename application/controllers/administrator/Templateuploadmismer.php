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
	}


// =================================
//PROSES GENERATE
// proses baca table templateupload dan insert ke tabel mismerdetail
// ==================================
	public function generate(){

print_r('generateeeeee');

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
				'MID' => $this->input->post('MID'),
				'MERCHAN_DBA_NAME' => $this->input->post('MERCHAN_DBA_NAME'),
				'STATUS_EDC' => $this->input->post('STATUS_EDC'),
				'OPEN_DATE' => $this->input->post('OPEN_DATE'),
				'CITY' => $this->input->post('CITY'),
				'MSO' => $this->input->post('MSO'),
				'SOURCE_CODE' => $this->input->post('SOURCE_CODE'),
				'POS1' => $this->input->post('POS1'),
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
				'MID' => $this->input->post('MID'),
				'MERCHAN_DBA_NAME' => $this->input->post('MERCHAN_DBA_NAME'),
				'STATUS_EDC' => $this->input->post('STATUS_EDC'),
				'OPEN_DATE' => $this->input->post('OPEN_DATE'),
				'CITY' => $this->input->post('CITY'),
				'MSO' => $this->input->post('MSO'),
				'SOURCE_CODE' => $this->input->post('SOURCE_CODE'),
				'POS1' => $this->input->post('POS1'),
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



		return $this->model_templateuploadmismer->remove($id);
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
}


/* End of file templateuploadmismer.php */
/* Location: ./application/controllers/administrator/Templateuploadmismer.php */
