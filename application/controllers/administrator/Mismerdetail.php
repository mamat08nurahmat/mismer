<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Mismerdetail Controller
*| --------------------------------------------------------------------------
*| Mismerdetail site
*|
*/
class Mismerdetail extends Admin
{

	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_mismerdetail');
	}

// ======================
public function dev($offset = 0)
{
	$this->is_allowed('mismerdetail_list');

	$filter = $this->input->get('q');
	$field 	= $this->input->get('f');
if($field==""){
	$this->data['mismerdetails'] = $this->model_mismerdetail->get($filter, $field, $this->limit_page, $offset);
	$this->data['mismerdetail_counts'] = 0;

}else {

$this->data['mismerdetails'] = $this->model_mismerdetail->get($filter, $field, $this->limit_page, $offset);
$this->data['mismerdetail_counts'] = $this->model_mismerdetail->count_all($filter, $field);

}

	$config = [
		'base_url'     => 'administrator/mismerdetail/dev/',
		'total_rows'   => $this->model_mismerdetail->count_all($filter, $field),
		'per_page'     => $this->limit_page,
		'uri_segment'  => 4,
	];

	$this->data['pagination'] = $this->pagination($config);

	$this->template->title('Mismerdetail List');
	$this->render('backend/standart/administrator/mismerdetail/mismerdetail_list_dev', $this->data);
}

// dev====================

// =============================================
	/**
	* show all Mismerdetails
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('mismerdetail_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');
// if($field==""){
// 	$this->data['mismerdetails'] = $this->model_mismerdetail->get($filter, $field, $this->limit_page, $offset);
// 	$this->data['mismerdetail_counts'] = 0;
//
// }else {

$this->data['mismerdetails'] = $this->model_mismerdetail->get($filter, $field, $this->limit_page, $offset);

// $this->data['mismerdetails'] = $this->model_mismerdetail->get_all();
	$this->data['mismerdetail_counts'] = $this->model_mismerdetail->count_all($filter, $field);
// }

		$config = [
			'base_url'     => 'administrator/mismerdetail/index/',
			'total_rows'   => $this->model_mismerdetail->count_all($filter, $field),
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Mismerdetail List');
		$this->render('backend/standart/administrator/mismerdetail/mismerdetail_list', $this->data);
	}

	/**
	* Add new mismerdetails
	*
	*/
	public function add()
	{
		$this->is_allowed('mismerdetail_add');

		$this->template->title('Mismerdetail New');
		$this->render('backend/standart/administrator/mismerdetail/mismerdetail_add', $this->data);
	}

	/**
	* Add New Mismerdetails
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('mismerdetail_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$this->form_validation->set_rules('RowID', 'RowID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('BatchID', 'BatchID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('OPEN_DATE', 'OPEN DATE', 'trim|required');
		$this->form_validation->set_rules('MID', 'MID', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('MERCHAN_DBA_NAME', 'MERCHAN DBA NAME', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('MSO', 'MSO', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('SOURCE_CODE', 'SOURCE CODE', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('POS1', 'POS1', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('WILAYAH', 'WILAYAH', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('CHANNEL', 'CHANNEL', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('EDC', 'EDC', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('EXH', 'EXH', 'trim|required|max_length[11]');


		if ($this->form_validation->run()) {

			$save_data = [
				'RowID' => $this->input->post('RowID'),
				'BatchID' => $this->input->post('BatchID'),
				'OPEN_DATE' => $this->input->post('OPEN_DATE'),
				'MID' => $this->input->post('MID'),
				'MERCHAN_DBA_NAME' => $this->input->post('MERCHAN_DBA_NAME'),
				'MSO' => $this->input->post('MSO'),
				'SOURCE_CODE' => $this->input->post('SOURCE_CODE'),
				'POS1' => $this->input->post('POS1'),
				'WILAYAH' => $this->input->post('WILAYAH'),
				'WILAYAH_2' => $this->input->post('WILAYAH_2'),
				'CHANNEL' => $this->input->post('CHANNEL'),
				'IS_YAP' => $this->input->post('IS_YAP'),
				'EDC' => $this->input->post('EDC'),
				'EXH' => $this->input->post('EXH'),
			];


			$save_mismerdetail = $this->model_mismerdetail->store($save_data);

			if ($save_mismerdetail) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_mismerdetail;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/mismerdetail/edit/' . $save_mismerdetail, 'Edit Mismerdetail'),
						anchor('administrator/mismerdetail', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/mismerdetail/edit/' . $save_mismerdetail, 'Edit Mismerdetail')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/mismerdetail');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/mismerdetail');
				}
			}

		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}

		/**
	* Update view Mismerdetails
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('mismerdetail_update');

		$this->data['mismerdetail'] = $this->model_mismerdetail->find($id);

		$this->template->title('Mismerdetail Update');
		$this->render('backend/standart/administrator/mismerdetail/mismerdetail_update', $this->data);
	}

	/**
	* Update Mismerdetails
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('mismerdetail_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$this->form_validation->set_rules('RowID', 'RowID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('BatchID', 'BatchID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('OPEN_DATE', 'OPEN DATE', 'trim|required');
		$this->form_validation->set_rules('MID', 'MID', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('MERCHAN_DBA_NAME', 'MERCHAN DBA NAME', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('MSO', 'MSO', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('SOURCE_CODE', 'SOURCE CODE', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('POS1', 'POS1', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('WILAYAH', 'WILAYAH', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('CHANNEL', 'CHANNEL', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('EDC', 'EDC', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('EXH', 'EXH', 'trim|required|max_length[11]');

		if ($this->form_validation->run()) {

			$save_data = [
				'RowID' => $this->input->post('RowID'),
				'BatchID' => $this->input->post('BatchID'),
				'OPEN_DATE' => $this->input->post('OPEN_DATE'),
				'MID' => $this->input->post('MID'),
				'MERCHAN_DBA_NAME' => $this->input->post('MERCHAN_DBA_NAME'),
				'MSO' => $this->input->post('MSO'),
				'SOURCE_CODE' => $this->input->post('SOURCE_CODE'),
				'POS1' => $this->input->post('POS1'),
				'WILAYAH' => $this->input->post('WILAYAH'),
				'WILAYAH_2' => $this->input->post('WILAYAH_2'),
				'CHANNEL' => $this->input->post('CHANNEL'),
				'IS_YAP' => $this->input->post('IS_YAP'),
				'EDC' => $this->input->post('EDC'),
				'EXH' => $this->input->post('EXH'),
			];


			$save_mismerdetail = $this->model_mismerdetail->change($id, $save_data);

			if ($save_mismerdetail) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/mismerdetail', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/mismerdetail');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/mismerdetail');
				}
			}
		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}

	/**
	* delete Mismerdetails
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('mismerdetail_delete');

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
            set_message(cclang('has_been_deleted', 'mismerdetail'), 'success');
        } else {
            set_message(cclang('error_delete', 'mismerdetail'), 'error');
        }

		redirect_back();
	}
//=======================
public function exh($id = null)
{
	// $this->is_allowed('mismerdetail_delete');

	$this->load->helper('file');

	$arr_id = $this->input->get('id');
	$approve = false;

	if (!empty($id)) {
		$approve = $this->_approve($id);
	} elseif (count($arr_id) >0) {
		foreach ($arr_id as $id) {
			$approve = $this->_approve($id);
		}
	}

	if ($approve) {
					set_message(cclang('has_been_approve', 'mismerdetail'), 'success');
			} else {
					set_message(cclang('error_approve', 'mismerdetail'), 'error');
			}

	redirect_back();
}

//============
		/**
	* View view Mismerdetails
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('mismerdetail_view');

		$this->data['mismerdetail'] = $this->model_mismerdetail->join_avaiable()->find($id);

		$this->template->title('Mismerdetail Detail');
		$this->render('backend/standart/administrator/mismerdetail/mismerdetail_view', $this->data);
	}

	/**
	* delete Mismerdetails
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$mismerdetail = $this->model_mismerdetail->find($id);



		return $this->model_mismerdetail->remove($id);
	}


//==============
private function _approve($id)
{
	$mismerdetail = $this->model_mismerdetail->find($id);
	return $this->model_mismerdetail->bulk_update_exh($id);
}

//===========

	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('mismerdetail_export');

		$this->model_mismerdetail->export('mismerdetail', 'mismerdetail');
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('mismerdetail_export');

		$this->model_mismerdetail->pdf('mismerdetail', 'mismerdetail');
	}
}


/* End of file mismerdetail.php */
/* Location: ./application/controllers/administrator/Mismerdetail.php */
