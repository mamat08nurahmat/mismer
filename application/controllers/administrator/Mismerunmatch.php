<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Mismerunmatch Controller
*| --------------------------------------------------------------------------
*| Mismerunmatch site
*|
*/
class Mismerunmatch extends Admin	
{
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_mismerunmatch');
	}

	/**
	* show all Mismerunmatchs
	*
	* @var $offset String
	*/
	public function index($offset = 0)
	{
		$this->is_allowed('mismerunmatch_list');

		$filter = $this->input->get('q');
		$field 	= $this->input->get('f');

		$this->data['mismerunmatchs'] = $this->model_mismerunmatch->get($filter, $field, $this->limit_page, $offset);
		$this->data['mismerunmatch_counts'] = $this->model_mismerunmatch->count_all($filter, $field);

		$config = [
			'base_url'     => 'administrator/mismerunmatch/index/',
			'total_rows'   => $this->model_mismerunmatch->count_all($filter, $field),
			'per_page'     => $this->limit_page,
			'uri_segment'  => 4,
		];

		$this->data['pagination'] = $this->pagination($config);

		$this->template->title('Mismerunmatch List');
		$this->render('backend/standart/administrator/mismerunmatch/mismerunmatch_list', $this->data);
	}
	
	public function getGenerate($tahun,$bulan){

// $where = array(
// EXTRACT(MONTH FROM `mismerdetail`.`OPEN_DATE`) AS `BULAN`,
// );
		// $this->model_mismerunmatch->get_single($where);

$mismerunmatchs = 	$this->db->query("
SELECT * FROM mismerunmatch
WHERE EXTRACT(YEAR FROM OPEN_DATE)=2018
AND EXTRACT(MONTH FROM OPEN_DATE)=5
")->result();

$output='<table class="table table-bordered table-striped dataTable">';
// <th>
//  <input type="checkbox" class="flat-red toltip" id="check_all" name="check_all" title="check all">
// </th>

$output.=$tahun;
$output.='<hr>';
$output.=$bulan;

$output.='
		
		<thead>
		<tr>
		   <th>MID</th>
		   <th>WILAYAH</th>
		   <th>CHANNEL</th>
		   <th>OPEN_DATE</th>
		</tr>
	 </thead>		
		';
		$output.='<tbody id="tbody_mismerunmatch">';

		foreach($mismerunmatchs as $mismerunmatch): 
		$output.='<tr>';
		$output.='<td>'.$mismerunmatch->MID.'<td>';
		$output.='<td>'.$mismerunmatch->WILAYAH.'<td>';
		$output.='<td>'.$mismerunmatch->CHANNEL.'<td>';
		$output.='<td>'.$mismerunmatch->OPEN_DATE.'<td>';
		$output.='<tr>';
		endforeach;

		$output.='</tbody>';
		$output.='</tabel>';
		
		
		echo  $output;
		

	}

	/**
	* Add new mismerunmatchs
	*
	*/
	public function add()
	{
		$this->is_allowed('mismerunmatch_add');

		$this->template->title('Mismerunmatch New');
		$this->render('backend/standart/administrator/mismerunmatch/mismerunmatch_add', $this->data);
	}

	/**
	* Add New Mismerunmatchs
	*
	* @return JSON
	*/
	public function add_save()
	{
		if (!$this->is_allowed('mismerunmatch_add', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}

		$this->form_validation->set_rules('RowID', 'RowID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('BatchID', 'BatchID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('MID', 'MID', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('WILAYAH', 'WILAYAH', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('CHANNEL', 'CHANNEL', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('TYPE_MID', 'TYPE MID', 'trim|required|max_length[45]');
		$this->form_validation->set_rules('ISUPDATE', 'ISUPDATE', 'trim|required|max_length[11]');
		

		if ($this->form_validation->run()) {
		
			$save_data = [
				'RowID' => $this->input->post('RowID'),
				'BatchID' => $this->input->post('BatchID'),
				'MID' => $this->input->post('MID'),
				'WILAYAH' => $this->input->post('WILAYAH'),
				'CHANNEL' => $this->input->post('CHANNEL'),
				'TYPE_MID' => $this->input->post('TYPE_MID'),
				'ISUPDATE' => $this->input->post('ISUPDATE'),
			];

			
			$save_mismerunmatch = $this->model_mismerunmatch->store($save_data);

			if ($save_mismerunmatch) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $save_mismerunmatch;
					$this->data['message'] = cclang('success_save_data_stay', [
						anchor('administrator/mismerunmatch/edit/' . $save_mismerunmatch, 'Edit Mismerunmatch'),
						anchor('administrator/mismerunmatch', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_save_data_redirect', [
						anchor('administrator/mismerunmatch/edit/' . $save_mismerunmatch, 'Edit Mismerunmatch')
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/mismerunmatch');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/mismerunmatch');
				}
			}

		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
		/**
	* Update view Mismerunmatchs
	*
	* @var $id String
	*/
	public function edit($id)
	{
		$this->is_allowed('mismerunmatch_update');

		$this->data['mismerunmatch'] = $this->model_mismerunmatch->find($id);

		$this->template->title('Mismerunmatch Update');
		$this->render('backend/standart/administrator/mismerunmatch/mismerunmatch_update', $this->data);
	}

	/**
	* Update Mismerunmatchs
	*
	* @var $id String
	*/
	public function edit_save($id)
	{
		if (!$this->is_allowed('mismerunmatch_update', false)) {
			echo json_encode([
				'success' => false,
				'message' => cclang('sorry_you_do_not_have_permission_to_access')
				]);
			exit;
		}
		
		$this->form_validation->set_rules('RowID', 'RowID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('BatchID', 'BatchID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('MID', 'MID', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('WILAYAH', 'WILAYAH', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('CHANNEL', 'CHANNEL', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('TYPE_MID', 'TYPE MID', 'trim|required|max_length[45]');
		$this->form_validation->set_rules('ISUPDATE', 'ISUPDATE', 'trim|required|max_length[11]');
		
		if ($this->form_validation->run()) {
		
			$save_data = [
				'RowID' => $this->input->post('RowID'),
				'BatchID' => $this->input->post('BatchID'),
				'MID' => $this->input->post('MID'),
				'WILAYAH' => $this->input->post('WILAYAH'),
				'CHANNEL' => $this->input->post('CHANNEL'),
				'TYPE_MID' => $this->input->post('TYPE_MID'),
				'ISUPDATE' => $this->input->post('ISUPDATE'),
			];

			
			$save_mismerunmatch = $this->model_mismerunmatch->change($id, $save_data);

			if ($save_mismerunmatch) {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = true;
					$this->data['id'] 	   = $id;
					$this->data['message'] = cclang('success_update_data_stay', [
						anchor('administrator/mismerunmatch', ' Go back to list')
					]);
				} else {
					set_message(
						cclang('success_update_data_redirect', [
					]), 'success');

            		$this->data['success'] = true;
					$this->data['redirect'] = base_url('administrator/mismerunmatch');
				}
			} else {
				if ($this->input->post('save_type') == 'stay') {
					$this->data['success'] = false;
					$this->data['message'] = cclang('data_not_change');
				} else {
            		$this->data['success'] = false;
            		$this->data['message'] = cclang('data_not_change');
					$this->data['redirect'] = base_url('administrator/mismerunmatch');
				}
			}
		} else {
			$this->data['success'] = false;
			$this->data['message'] = validation_errors();
		}

		echo json_encode($this->data);
	}
	
	/**
	* delete Mismerunmatchs
	*
	* @var $id String
	*/
	public function delete($id = null)
	{
		$this->is_allowed('mismerunmatch_delete');

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
            set_message(cclang('has_been_deleted', 'mismerunmatch'), 'success');
        } else {
            set_message(cclang('error_delete', 'mismerunmatch'), 'error');
        }

		redirect_back();
	}

		/**
	* View view Mismerunmatchs
	*
	* @var $id String
	*/
	public function view($id)
	{
		$this->is_allowed('mismerunmatch_view');

		$this->data['mismerunmatch'] = $this->model_mismerunmatch->join_avaiable()->find($id);

		$this->template->title('Mismerunmatch Detail');
		$this->render('backend/standart/administrator/mismerunmatch/mismerunmatch_view', $this->data);
	}
	
	/**
	* delete Mismerunmatchs
	*
	* @var $id String
	*/
	private function _remove($id)
	{
		$mismerunmatch = $this->model_mismerunmatch->find($id);

		
		
		return $this->model_mismerunmatch->remove($id);
	}
	
	
	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/
	public function export()
	{
		$this->is_allowed('mismerunmatch_export');

		$this->model_mismerunmatch->export('mismerunmatch', 'mismerunmatch');
	}

	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('mismerunmatch_export');

		$this->model_mismerunmatch->pdf('mismerunmatch', 'mismerunmatch');
	}
}


/* End of file mismerunmatch.php */
/* Location: ./application/controllers/administrator/Mismerunmatch.php */