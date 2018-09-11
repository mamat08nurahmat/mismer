<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Channel Controller
*| --------------------------------------------------------------------------
*| Channel site
*|
*/
class Channel extends Admin	
{
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_channel');
	}

	/**
	* show all Channels
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('channel_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['channels'] = $this->model_channel->get($filter, $field, $this->limit_page, $offset);
		$this->data['channel_counts'] = $this->model_channel->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/channel/index/',
			'total_rows'   => $this->model_channel->count_all($filter, $field),
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Channel List');
		$this->render('backend/standart/administrator/channel/channel_list', $this->data);
	}
	
	/**
	* Add new channels
	*
	*/
	public function add()
	{
		$this->is_allowed('channel_add');

		$this->template->title('Channel New');
		$this->render('backend/standart/administrator/channel/channel_add', $this->data);
	}

	/**
	* Add New Channels
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('channel_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$this->form_validation->set_rules('channel', 'Channel', 'trim|required|max_length[55]');
		

		if ($this->form_validation->run()) {
		
			$save_data = [
				'channel' => $this->input->post('channel'),
			];

			
			$save_channel = $this->model_channel->store($save_data);

			if ($save_channel) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_channel;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/channel/edit/' . $save_channel, 'Edit Channel'),
						anchor('administrator/channel', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/channel/edit/' . $save_channel, 'Edit Channel')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/channel');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/channel');
				}
			}

		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
		/**
	* Update view Channels
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('channel_update');

		$this->data['channel'] = $this->model_channel->find($id);

		$this->template->title('Channel Update');
		$this->render('backend/standart/administrator/channel/channel_update', $this->data);
	}

	/**
	* Update Channels
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('channel_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
		
		$this->form_validation->set_rules('channel', 'Channel', 'trim|required|max_length[55]');
		
		if ($this->form_validation->run()) {
		
			$save_data = [
				'channel' => $this->input->post('channel'),
			];

			
			$save_channel = $this->model_channel->change($id, $save_data);

			if ($save_channel) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/channel', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/channel');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/channel');
				}
			}
		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
	/**
	* delete Channels
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('channel_delete');

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
            set_message(cclang('has_been_deleted', 'channel'), 'success');
        } else {
            set_message(cclang('error_delete', 'channel'), 'error');
        }

		redirect_back();
	}

		/**
	* View view Channels
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('channel_view');

		$this->data['channel'] = $this->model_channel->join_avaiable()->find($id);

		$this->template->title('Channel Detail');
		$this->render('backend/standart/administrator/channel/channel_view', $this->data);
	}
	
	/**
	* delete Channels
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$channel = $this->model_channel->find($id);

		
		
		return $this->model_channel->remove($id);
	}
	
	
	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('channel_export');

		$this->model_channel->export('channel', 'channel');
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('channel_export');

		$this->model_channel->pdf('channel', 'channel');
	}
}


/* End of file channel.php */
/* Location: ./application/controllers/administrator/Channel.php */