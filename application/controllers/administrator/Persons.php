<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Persons Controller
*| --------------------------------------------------------------------------
*| Persons site
*|
*/
class Persons extends Admin	
{
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_persons');
	}

	/**
	* show all Personss
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('persons_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['personss'] = $this->model_persons->get($filter, $field, $this->limit_page, $offset);
		$this->data['persons_counts'] = $this->model_persons->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/persons/index/',
			'total_rows'   => $this->model_persons->count_all($filter, $field),
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Persons List');
		$this->render('backend/standart/administrator/persons/persons_list', $this->data);
	}
	
	/**
	* Add new personss
	*
	*/
	public function add()
	{
		$this->is_allowed('persons_add');

		$this->template->title('Persons New');
		$this->render('backend/standart/administrator/persons/persons_add', $this->data);
	}

	/**
	* Add New Personss
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('persons_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$this->form_validation->set_rules('LastName', 'LastName', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('FirstName', 'FirstName', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('Age', 'Age', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('persons_image_name', 'Image', 'trim|required');
		

		if ($this->form_validation->run()) {
			$persons_image_uuid = $this->input->post('persons_image_uuid');
			$persons_image_name = $this->input->post('persons_image_name');
		
			$save_data = [
				'LastName' => $this->input->post('LastName'),
				'FirstName' => $this->input->post('FirstName'),
				'Age' => $this->input->post('Age'),
			];

			if (!is_dir(FCPATH . '/uploads/persons/')) {
				mkdir(FCPATH . '/uploads/persons/');
			}

			if (!empty($persons_image_name)) {
				$persons_image_name_copy = date('YmdHis') . '-' . $persons_image_name;

				rename(FCPATH . 'uploads/tmp/' . $persons_image_uuid . '/' . $persons_image_name, 
						FCPATH . 'uploads/persons/' . $persons_image_name_copy);

				if (!is_file(FCPATH . '/uploads/persons/' . $persons_image_name_copy)) {
					echo json_encode([
						'success' => false,
						'message' => 'Error uploading file'
						]);
					exit;
				}

				$save_data['image'] = $persons_image_name_copy;
			}
		
			
			$save_persons = $this->model_persons->store($save_data);

			if ($save_persons) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_persons;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/persons/edit/' . $save_persons, 'Edit Persons'),
						anchor('administrator/persons', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/persons/edit/' . $save_persons, 'Edit Persons')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/persons');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/persons');
				}
			}

		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
		/**
	* Update view Personss
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('persons_update');

		$this->data['persons'] = $this->model_persons->find($id);

		$this->template->title('Persons Update');
		$this->render('backend/standart/administrator/persons/persons_update', $this->data);
	}

	/**
	* Update Personss
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('persons_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
		
		$this->form_validation->set_rules('LastName', 'LastName', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('FirstName', 'FirstName', 'trim|required|max_length[255]');
		$this->form_validation->set_rules('Age', 'Age', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('persons_image_name', 'Image', 'trim|required');
		
		if ($this->form_validation->run()) {
			$persons_image_uuid = $this->input->post('persons_image_uuid');
			$persons_image_name = $this->input->post('persons_image_name');
		
			$save_data = [
				'LastName' => $this->input->post('LastName'),
				'FirstName' => $this->input->post('FirstName'),
				'Age' => $this->input->post('Age'),
			];

			if (!is_dir(FCPATH . '/uploads/persons/')) {
				mkdir(FCPATH . '/uploads/persons/');
			}

			if (!empty($persons_image_uuid)) {
				$persons_image_name_copy = date('YmdHis') . '-' . $persons_image_name;

				rename(FCPATH . 'uploads/tmp/' . $persons_image_uuid . '/' . $persons_image_name, 
						FCPATH . 'uploads/persons/' . $persons_image_name_copy);

				if (!is_file(FCPATH . '/uploads/persons/' . $persons_image_name_copy)) {
					echo json_encode([
						'success' => false,
						'message' => 'Error uploading file'
						]);
					exit;
				}

				$save_data['image'] = $persons_image_name_copy;
			}
		
			
			$save_persons = $this->model_persons->change($id, $save_data);

			if ($save_persons) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/persons', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/persons');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/persons');
				}
			}
		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
	/**
	* delete Personss
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('persons_delete');

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
            set_message(cclang('has_been_deleted', 'persons'), 'success');
        } else {
            set_message(cclang('error_delete', 'persons'), 'error');
        }

		redirect_back();
	}

		/**
	* View view Personss
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('persons_view');

		$this->data['persons'] = $this->model_persons->join_avaiable()->find($id);

		$this->template->title('Persons Detail');
		$this->render('backend/standart/administrator/persons/persons_view', $this->data);
	}
	
	/**
	* delete Personss
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$persons = $this->model_persons->find($id);

		if (!empty($persons->image)) {
			$path = FCPATH . '/uploads/persons/' . $persons->image;

			if (is_file($path)) {
				$delete_file = unlink($path);
			}
		}
		
		
		return $this->model_persons->remove($id);
	}
	
	/**
	* Upload Image Persons	* 
	* @return JSON
	*/
	public function upload_image_file()
	{
		if (!$this->is_allowed('persons_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$uuid = $this->input->post('qquuid');

		echo $this->upload_file([
			'uuid' 		 	=> $uuid,
			'table_name' 	=> 'persons',
		]);
	}

	/**
	* Delete Image Persons	* 
	* @return JSON
	*/
	public function delete_image_file($uuid)
	{
		if (!$this->is_allowed('persons_delete', false)) {
			echo json_encode([
				'success' => false,
				'error' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		echo $this->delete_file([
            'uuid'              => $uuid, 
            'delete_by'         => $this->input->get('by'), 
            'field_name'        => 'image', 
            'upload_path_tmp'   => './uploads/tmp/',
            'table_name'        => 'persons',
            'primary_key'       => 'ID',
            'upload_path'       => 'uploads/persons/'
        ]);
	}

	/**
	* Get Image Persons	* 
	* @return JSON
	*/
	public function get_image_file($id)
	{
		if (!$this->is_allowed('persons_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => 'Image not loaded, you do not have permission to access'
				]);
			exit;
		}

		$persons = $this->model_persons->find($id);

		echo $this->get_file([
            'uuid'              => $id, 
            'delete_by'         => 'id', 
            'field_name'        => 'image', 
            'table_name'        => 'persons',
            'primary_key'       => 'ID',
            'upload_path'       => 'uploads/persons/',
            'delete_endpoint'   => 'administrator/persons/delete_image_file'
        ]);
	}
	
	
	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('persons_export');

		$this->model_persons->export('persons', 'persons');
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('persons_export');

		$this->model_persons->pdf('persons', 'persons');
	}
}


/* End of file persons.php */
/* Location: ./application/controllers/administrator/Persons.php */