<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Mso Channel Controller
*| --------------------------------------------------------------------------
*| Mso Channel site
*|
*/
class Mso_channel extends Admin	
{
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_mso_channel');
	}

	/**
	* show all Mso Channels
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('mso_channel_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['mso_channels'] = $this->model_mso_channel->get($filter, $field, $this->limit_page, $offset);
		$this->data['mso_channel_counts'] = $this->model_mso_channel->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/mso_channel/index/',
			'total_rows'   => $this->model_mso_channel->count_all($filter, $field),
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Mso Channel List');
		$this->render('backend/standart/administrator/mso_channel/mso_channel_list', $this->data);
	}
	
	/**
	* Add new mso_channels
	*
	*/
	public function add()
	{
		$this->is_allowed('mso_channel_add');

		$this->template->title('Mso Channel New');
		$this->render('backend/standart/administrator/mso_channel/mso_channel_add', $this->data);
	}

	/**
	* Add New Mso Channels
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('mso_channel_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$this->form_validation->set_rules('Wilayah', 'Wilayah', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('KodeWilayah', 'KodeWilayah', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('MSO', 'MSO', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('Channel', 'Channel', 'trim|required|max_length[55]');
		

		if ($this->form_validation->run()) {
		
			$save_data = [
				'Wilayah' => $this->input->post('Wilayah'),
				'KodeWilayah' => $this->input->post('KodeWilayah'),
				'MSO' => $this->input->post('MSO'),
				'Channel' => $this->input->post('Channel'),
			];

			
			$save_mso_channel = $this->model_mso_channel->store($save_data);

			if ($save_mso_channel) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_mso_channel;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/mso_channel/edit/' . $save_mso_channel, 'Edit Mso Channel'),
						anchor('administrator/mso_channel', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/mso_channel/edit/' . $save_mso_channel, 'Edit Mso Channel')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/mso_channel');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/mso_channel');
				}
			}

		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
		/**
	* Update view Mso Channels
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('mso_channel_update');

		$this->data['mso_channel'] = $this->model_mso_channel->find($id);

		$this->template->title('Mso Channel Update');
		$this->render('backend/standart/administrator/mso_channel/mso_channel_update', $this->data);
	}

	/**
	* Update Mso Channels
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('mso_channel_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
		
		$this->form_validation->set_rules('Wilayah', 'Wilayah', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('KodeWilayah', 'KodeWilayah', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('MSO', 'MSO', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('Channel', 'Channel', 'trim|required|max_length[55]');
		
		if ($this->form_validation->run()) {
		
			$save_data = [
				'Wilayah' => $this->input->post('Wilayah'),
				'KodeWilayah' => $this->input->post('KodeWilayah'),
				'MSO' => $this->input->post('MSO'),
				'Channel' => $this->input->post('Channel'),
			];

			
			$save_mso_channel = $this->model_mso_channel->change($id, $save_data);

			if ($save_mso_channel) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/mso_channel', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/mso_channel');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/mso_channel');
				}
			}
		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
	/**
	* delete Mso Channels
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('mso_channel_delete');

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
            set_message(cclang('has_been_deleted', 'mso_channel'), 'success');
        } else {
            set_message(cclang('error_delete', 'mso_channel'), 'error');
        }

		redirect_back();
	}

		/**
	* View view Mso Channels
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('mso_channel_view');

		$this->data['mso_channel'] = $this->model_mso_channel->join_avaiable()->find($id);

		$this->template->title('Mso Channel Detail');
		$this->render('backend/standart/administrator/mso_channel/mso_channel_view', $this->data);
	}
	
	/**
	* delete Mso Channels
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$mso_channel = $this->model_mso_channel->find($id);

		
		
		return $this->model_mso_channel->remove($id);
	}
	
	
	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('mso_channel_export');

		$this->model_mso_channel->export('mso_channel', 'mso_channel');
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('mso_channel_export');

		$this->model_mso_channel->pdf('mso_channel', 'mso_channel');
	}
}


/* End of file mso_channel.php */
/* Location: ./application/controllers/administrator/Mso Channel.php */