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

		$this->form_validation->set_rules('BatchID', 'BatchID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('OPEN_DATE', 'OPEN DATE', 'trim|required');
		$this->form_validation->set_rules('MID', 'MID', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('MERCHAN_DBA_NAME', 'MERCHAN DBA NAME', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('MSO', 'MSO', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('SOURCE_CODE', 'SOURCE CODE', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('POS1', 'POS1', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('WILAYAH', 'WILAYAH', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('CHANNEL', 'CHANNEL', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('TYPE_MID', 'TYPE MID', 'trim|required|max_length[45]');
		$this->form_validation->set_rules('IS_UPDATE', 'IS UPDATE', 'trim|required|max_length[11]');
		

		if ($this->form_validation->run()) {
		
			$save_data = [
				'BatchID' => $this->input->post('BatchID'),
				'OPEN_DATE' => $this->input->post('OPEN_DATE'),
				'MID' => $this->input->post('MID'),
				'MERCHAN_DBA_NAME' => $this->input->post('MERCHAN_DBA_NAME'),
				'MSO' => $this->input->post('MSO'),
				'SOURCE_CODE' => $this->input->post('SOURCE_CODE'),
				'POS1' => $this->input->post('POS1'),
				'WILAYAH' => $this->input->post('WILAYAH'),
				'CHANNEL' => $this->input->post('CHANNEL'),
				'TYPE_MID' => $this->input->post('TYPE_MID'),
				'IS_UPDATE' => $this->input->post('IS_UPDATE'),
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
		
		$this->form_validation->set_rules('BatchID', 'BatchID', 'trim|required|max_length[11]');
		$this->form_validation->set_rules('OPEN_DATE', 'OPEN DATE', 'trim|required');
		$this->form_validation->set_rules('MID', 'MID', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('MERCHAN_DBA_NAME', 'MERCHAN DBA NAME', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('MSO', 'MSO', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('SOURCE_CODE', 'SOURCE CODE', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('POS1', 'POS1', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('WILAYAH', 'WILAYAH', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('CHANNEL', 'CHANNEL', 'trim|required|max_length[55]');
		$this->form_validation->set_rules('TYPE_MID', 'TYPE MID', 'trim|required|max_length[45]');
		$this->form_validation->set_rules('IS_UPDATE', 'IS UPDATE', 'trim|required|max_length[11]');
		
		if ($this->form_validation->run()) {
		
			$save_data = [
				'BatchID' => $this->input->post('BatchID'),
				'OPEN_DATE' => $this->input->post('OPEN_DATE'),
				'MID' => $this->input->post('MID'),
				'MERCHAN_DBA_NAME' => $this->input->post('MERCHAN_DBA_NAME'),
				'MSO' => $this->input->post('MSO'),
				'SOURCE_CODE' => $this->input->post('SOURCE_CODE'),
				'POS1' => $this->input->post('POS1'),
				'WILAYAH' => $this->input->post('WILAYAH'),
				'CHANNEL' => $this->input->post('CHANNEL'),
				'TYPE_MID' => $this->input->post('TYPE_MID'),
				'IS_UPDATE' => $this->input->post('IS_UPDATE'),
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
// ---------------
public function report()
{


	$tahun = $this->input->get('tahun');
	$bulan 	= $this->input->get('bulan');
	
	$this->data['query'] = $this->model_mismerunmatch->get_report_unmatch($bulan, $tahun);
	
	$this->data['tahun'] = $tahun;
	$this->data['bulan'] = $bulan;

	$this->template->title('Report List');
	$this->render('backend/standart/administrator/Report/Report_unmatch_list', $this->data);
}
// ----------
// ====UNMATCH

public function excel_unmatch($tahun,$bulan)
{

	$subject = 'UNMATCH';

	$this->load->library('excel');

	$result = $this->db->query("

SELECT 
MID,
WILAYAH,
CHANNEL,
OPEN_DATE

FROM mismerunmatch
WHERE TYPE_MID='EDC' AND CHANNEL IS NULL

AND EXTRACT(MONTH FROM OPEN_DATE)='$bulan'
AND EXTRACT(YEAR FROM OPEN_DATE)='$tahun'
AND IS_UPDATE=0
	");

	// print_r($result->result());die;

	$this->excel->setActiveSheetIndex(0);

	$fields = $result->list_fields();

	$alphabet = 'ABCDEFGHIJKLMOPQRSTUVWXYZ';
	$alphabet_arr = str_split($alphabet);
	$column = [];

	foreach ($alphabet_arr as $alpha) {
		$column[] =  $alpha;
	}

	foreach ($alphabet_arr as $alpha) {
		foreach ($alphabet_arr as $alpha2) {
			$column[] =  $alpha.$alpha2;
		}
	}
	foreach ($alphabet_arr as $alpha) {
		foreach ($alphabet_arr as $alpha2) {
			foreach ($alphabet_arr as $alpha3) {
				$column[] =  $alpha.$alpha2.$alpha3;
			}
		}
	}

	foreach($column as $col)
	{
		$this->excel->getActiveSheet()->getColumnDimension($col)->setWidth(20);
	}

	$col_total = $column[count($fields)-1];

	//styling
	$this->excel->getActiveSheet()->getStyle('A1:'.$col_total.'1')->applyFromArray(
		array(
			'fill' => array(
				'type' => PHPExcel_Style_Fill::FILL_SOLID,
				'color' => array('rgb' => 'DA3232')
			),
			'alignment' => array(
				'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
				'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
			)
		)
	);

	$phpColor = new PHPExcel_Style_Color();
	$phpColor->setRGB('FFFFFF');

	$this->excel->getActiveSheet()->getStyle('A1:'.$col_total.'1')->getFont()->setColor($phpColor);

	$this->excel->getActiveSheet()->getRowDimension(1)->setRowHeight(40);

	$this->excel->getActiveSheet()->getStyle('A1:'.$col_total.'1')
	->getAlignment()->setWrapText(true);

	$col = 0;
	foreach ($fields as $field)
	{

		$this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, 1, ucwords(str_replace('_', ' ', $field)));
		$col++;
	}

	$row = 2;
	foreach($result->result() as $data)
	{
		$col = 0;
		foreach ($fields as $field)
		{
			$this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $data->$field);
			$col++;
		}

		$row++;
	}

	//set border
	$styleArray = array(
		  'borders' => array(
			  'allborders' => array(
				  'style' => PHPExcel_Style_Border::BORDER_THIN
			  )
		  )
	  );
	$this->excel->getActiveSheet()->getStyle('A1:'.$col_total.''.$row)->applyFromArray($styleArray);

	$this->excel->getActiveSheet()->setTitle(ucwords($subject));

	header('Content-Type: application/vnd.ms-excel');
//	header('Content-Disposition: attachment;filename='.ucwords($subject).'-'.date('Y-m-d').'.xls');
	header('Content-Disposition: attachment;filename='.ucwords($subject).'-'.baca_bulan($bulan).'-'.$tahun.'.xls');

	header('Cache-Control: max-age=0');
	header('Cache-Control: max-age=1');

	header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
	header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT');
	header ('Cache-Control: cache, must-revalidate');
	header ('Pragma: public');

	$objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');
	$objWriter->save('php://output');
}



}


/* End of file mismerunmatch.php */
/* Location: ./application/controllers/administrator/Mismerunmatch.php */