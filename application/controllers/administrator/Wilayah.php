<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Wilayah Controller
*| --------------------------------------------------------------------------
*| Wilayah site
*|
*/
class Wilayah extends Admin	
{
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_wilayah');
	}

	/**
	* show all Wilayahs
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('wilayah_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['wilayahs'] = $this->model_wilayah->get($filter, $field, $this->limit_page, $offset);
		$this->data['wilayah_counts'] = $this->model_wilayah->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/wilayah/index/',
			'total_rows'   => $this->model_wilayah->count_all($filter, $field),
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Wilayah List');
		$this->render('backend/standart/administrator/wilayah/wilayah_list', $this->data);
	}
	
	/**
	* Add new wilayahs
	*
	*/
	public function add()
	{
		$this->is_allowed('wilayah_add');

		$this->template->title('Wilayah New');
		$this->render('backend/standart/administrator/wilayah/wilayah_add', $this->data);
	}

	/**
	* Add New Wilayahs
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('wilayah_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$this->form_validation->set_rules('WilayahID', 'WilayahID', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('WilayahCode', 'WilayahCode', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('WilayahName', 'WilayahName', 'trim|required|max_length[255]');
		

		if ($this->form_validation->run()) {
		
			$save_data = [
				'WilayahID' => $this->input->post('WilayahID'),
				'WilayahCode' => $this->input->post('WilayahCode'),
				'WilayahName' => $this->input->post('WilayahName'),
			];

			
			$save_wilayah = $this->model_wilayah->store($save_data);

			if ($save_wilayah) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_wilayah;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/wilayah/edit/' . $save_wilayah, 'Edit Wilayah'),
						anchor('administrator/wilayah', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/wilayah/edit/' . $save_wilayah, 'Edit Wilayah')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/wilayah');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/wilayah');
				}
			}

		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
		/**
	* Update view Wilayahs
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('wilayah_update');

		$this->data['wilayah'] = $this->model_wilayah->find($id);

		$this->template->title('Wilayah Update');
		$this->render('backend/standart/administrator/wilayah/wilayah_update', $this->data);
	}

	/**
	* Update Wilayahs
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('wilayah_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
		
		$this->form_validation->set_rules('WilayahID', 'WilayahID', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('WilayahCode', 'WilayahCode', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('WilayahName', 'WilayahName', 'trim|required|max_length[255]');
		
		if ($this->form_validation->run()) {
		
			$save_data = [
				'WilayahID' => $this->input->post('WilayahID'),
				'WilayahCode' => $this->input->post('WilayahCode'),
				'WilayahName' => $this->input->post('WilayahName'),
			];

			
			$save_wilayah = $this->model_wilayah->change($id, $save_data);

			if ($save_wilayah) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/wilayah', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/wilayah');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/wilayah');
				}
			}
		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
	/**
	* delete Wilayahs
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('wilayah_delete');

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
            set_message(cclang('has_been_deleted', 'wilayah'), 'success');
        } else {
            set_message(cclang('error_delete', 'wilayah'), 'error');
        }

		redirect_back();
	}

		/**
	* View view Wilayahs
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('wilayah_view');

		$this->data['wilayah'] = $this->model_wilayah->join_avaiable()->find($id);

		$this->template->title('Wilayah Detail');
		$this->render('backend/standart/administrator/wilayah/wilayah_view', $this->data);
	}
	
	/**
	* delete Wilayahs
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$wilayah = $this->model_wilayah->find($id);

		
		
		return $this->model_wilayah->remove($id);
	}
	
	
	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('wilayah_export');

		$this->model_wilayah->export('wilayah', 'wilayah');
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('wilayah_export');

		$this->model_wilayah->pdf('wilayah', 'wilayah');
	}
}


/* End of file wilayah.php */
/* Location: ./application/controllers/administrator/Wilayah.php */