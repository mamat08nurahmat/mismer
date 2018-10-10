<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
*| --------------------------------------------------------------------------
*| Report Controller
*| --------------------------------------------------------------------------
*| Report site
*|
*/
class Report extends Admin
{

	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_Report');

		$this->load->model('model_mismerunmatch');		
	}

// ======================


// =============================================
	/**
	* show all Reports
	*
	* @var $offset String
	*/
	public function index()
	{
	
	
		$tahun = $this->input->get('tahun');
		$bulan 	= $this->input->get('bulan');
		
		$this->data['query'] = $this->model_Report->get_report($bulan, $tahun);
		
		$this->data['tahun'] = $tahun;
		$this->data['bulan'] = $bulan;

		$this->template->title('Report List');
		$this->render('backend/standart/administrator/Report/Report_list', $this->data);
	}


//dev report
public function dev()
{


	$tahun = $this->input->get('tahun');
	$bulan 	= $this->input->get('bulan');
	
	$this->data['query'] = $this->model_Report->get_report($bulan, $tahun);
	
	$this->data['tahun'] = $tahun;
	$this->data['bulan'] = $bulan;

	$this->template->title('Report List');
	$this->render('backend/standart/administrator/Report/Report_list_dev', $this->data);
}

	public function getReport($tgl_awal,$tgl_akhir){

		$tgl_awal= date("Y-m-d",strtotime($tgl_awal));
        $tgl_akhir= date("Y-m-d",strtotime($tgl_akhir));

		$report = $this->model_Report->get_report_between($tgl_awal,$tgl_akhir);

		// echo"RESULTXXXXXXXXXXXXXXXXX".$tgl_awal."---------".$tgl_akhir;
		// print_r($report);
		$output_tabel='';

		$output_tabel.='

        <table class="table table-bordered table-striped" id="mytable">
			<thead>
            <tr>
				<th width="80px">WILAYAH</th>
				<th>EDC</th>
				<th>YAP</th>
				<th>TOTAL</th>
				<th>ACT</th>
            	
            </tr>
            </thead>
	    <tbody>';
//---------------
         $start = 1;
            foreach ($report as $r)
           {

	$jumlah =$r->JUMLAH_EDC+$r->JUMLAH_YAP;			
$output_tabel.='
            <tr>
		    <td>'.$r->WILAYAH.'</td>
		    <td>'.$r->JUMLAH_EDC.'</td>
	        <td>'.$r->JUMLAH_YAP.'</td>
	        <td>'.$jumlah.'</td>
			<td>
			<button type="button" id="detail" dataTglAwal="'.$tgl_awal.'" dataTglAkhir="'.$tgl_akhir.'" dataWilayah="'.$r->WILAYAH.'" class=" btn btn-primary"   >Detail</button>			
			</td>
	        </tr>
';            
// <button type="button" id="detail" dataTglAwal="'.$tgl_awal.'" dataTglAkhir="'.$tgl_akhir.'" dataWilayah="'.$r->WILAYAH.'" class=" btn btn-primary"   Onclick="get_detail()">Detail</button>			


}
	
//---------------	
		
$output_tabel.='
        </tbody>
		
	
		
        </table>	
	';
	
// $output_tabel.='
//         <script type="text/javascript">
//             $(document).ready(function () {

// 				// function get_detail($tgl_awal,$tgl_akhir){
// 					// // alert('detail');
// 					// var d=new Date($tgl_awal);
// 					// console.log(d);
// 					// console.log(typeof $tgl_akhir);
// 					// console.log($tgl_akhir);
// 					// }				
	
//             });
//         </script>
// ';		

//$output_tabel.='<br/> AgencyID : '.$AgencyID;
//$output_tabel.='</br> SalesCenterID : '.$SalesCenterID;
		
		
		
		echo $output_tabel;



	}



	public function getModal_between($tgl_awal,$tgl_akhir,$wilayah){

		$query = $this->model_Report->getModal_between($tgl_awal,$tgl_akhir,$wilayah);
			//print_r($query);die();
			
			$tabel='';
			
			
			
			// -------------
			$tabel.='
			<div class="modal-content">
		
					<div class="modal-header">
		<center>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title" id="myModalLabel">Detail report Wilayah '.$wilayah.' </h4>
		<h5 class="modal-title" id="myModalLabel">Periode :  '.$tgl_awal.'  s/d : '.$tgl_akhir.'</h5>
		</center>
					</div>
					<div class="modal-body">
			 ';
		// -------------
		
			$tabel.='
			<table class="table table-bordered table-striped dataTable">
			<thead>
				 <tr>
		
						<th>CHANNEL</th>
						<th>JUMLAH YAP</th>
						<th>JUMLAH EDC</th>
						<th>TOTAL</th>
		
				 </tr>
			</thead>';
		
		
			$tabel.='
					<tbody>';
		
					$tot=0;
					$tot1=0;
					$tot2=0;
					$total=0;
		
		
			foreach ($query as $q) {
		$jumlah = $q->JUMLAH_YAP+$q->JUMLAH_EDC;
		
		$tot1+=$q->JUMLAH_EDC;
		$tot2+=$q->JUMLAH_YAP;
		
		$total =$tot1+$tot2;
		
					$tabel.='
		<tr>
		
					<td>'.$q->CHANNEL.'</td>
					<td></td>
					<td>'.$q->JUMLAH_EDC.'</td>
					<td></td>
		</tr>';
		
		}
		
		
		$tabel.='</tbody>';
		
		$tabel.='
		<tfoot>
		<tr>
		<td>TOTAL</td>
		<td>'.$tot2.'</td>
		<td>'.$tot1.'</td>
		<td>'.$total.'</td>
		</tr>
		</tfoot>
		';
		
		$tabel.='
			</table>
			';
		// ------------
		
		$tabel.='
		
		</div>
		
		
		</div>
			';
		
		
		echo $tabel;
		}	


//dev 
public function getReport2($tahun,$bulan){

	// $tgl_awal= date("Y-m-d",strtotime($tgl_awal));
	// $tgl_akhir= date("Y-m-d",strtotime($tgl_akhir));

	// $report = $this->model_Report->get_report_between($tgl_awal,$tgl_akhir);
	$report = $this->model_Report->get_report($bulan,$tahun);

	// echo"RESULTXXXXXXXXXXXXXXXXX".$tgl_awal."---------".$tgl_akhir;
	// print_r($report);
	$output_tabel='';

	$output_tabel.='

	<table class="table table-bordered table-striped" id="mytable">
		<thead>
		<tr>
			<th width="80px">WILAYAH</th>
			<th>EDC</th>
			<th>YAP</th>
			<th>TOTAL</th>
			<th>ACT</th>
			
		</tr>
		</thead>
	<tbody>';
//---------------
	 $start = 1;
		foreach ($report as $r)
	   {

$jumlah =$r->JUMLAH_EDC+$r->JUMLAH_YAP;			
$output_tabel.='
		<tr>
		<td>'.$r->WILAYAH.'</td>
		<td>'.$r->JUMLAH_EDC.'</td>
		<td>'.$r->JUMLAH_YAP.'</td>
		<td>'.$jumlah.'</td>
		<td>
		<button type="button" id="detail2" dataTahun="'.$tahun.'" dataBulan="'.$bulan.'" dataWilayah="'.$r->WILAYAH.'" class=" btn btn-primary"   >Detail</button>			
		</td>
		</tr>
';            
// <button type="button" id="detail" dataTglAwal="'.$tgl_awal.'" dataTglAkhir="'.$tgl_akhir.'" dataWilayah="'.$r->WILAYAH.'" class=" btn btn-primary"   Onclick="get_detail()">Detail</button>			


}

//---------------	
	
$output_tabel.='
	</tbody>
	

	
	</table>	
';

// $output_tabel.='
//         <script type="text/javascript">
//             $(document).ready(function () {

// 				// function get_detail($tgl_awal,$tgl_akhir){
// 					// // alert('detail');
// 					// var d=new Date($tgl_awal);
// 					// console.log(d);
// 					// console.log(typeof $tgl_akhir);
// 					// console.log($tgl_akhir);
// 					// }				

//             });
//         </script>
// ';		

//$output_tabel.='<br/> AgencyID : '.$AgencyID;
//$output_tabel.='</br> SalesCenterID : '.$SalesCenterID;
	
	
	
	echo $output_tabel;



}

// ====================================

// dev
public function unmatch()
{


	$tahun = $this->input->get('tahun');
	$bulan 	= $this->input->get('bulan');
	
	$this->data['query'] = $this->model_Report->get_report_unmatch($bulan, $tahun);
	
	$this->data['tahun'] = $tahun;
	$this->data['bulan'] = $bulan;

	$this->template->title('Report List');
	$this->render('backend/standart/administrator/Report/Report_unmatch_list', $this->data);
}






	// hardcode
	public function detail($tahun,$bulan,$wilayah){



$query = $this->db->query("
select
WILAYAH,
CHANNEL,
SUM(IFNULL(JUMLAH_YAP,0)) JUMLAH_YAP,
SUM(IFNULL(JUMLAH_EDC,0)) JUMLAH_EDC,
BULAN,
TAHUN
from
(
select
a.WILAYAH,
a.CHANNEL,
sum(IFNULL(a.JUMLAH,0)) JUMLAH_YAP,
0 JUMLAH_EDC,
a.BULAN,
a.TAHUN
from
VW_YAP2 a left join VW_EDC2 b
on a.wilayah = b.wilayah and a.channel = b.channel and a.bulan = b.bulan and a.tahun = b.tahun
group by a.WILAYAH,a.CHANNEL,a.BULAN,a.TAHUN
union
select
a.WILAYAH,
a.channel,
sum(IFNULL(b.JUMLAH,0)) JUMLAH_YAP,
sum(IFNULL(a.JUMLAH,0)) JUMLAH_EDC,
a.BULAN,
a.TAHUN
from
VW_EDC2 a left join VW_YAP2 b
on a.wilayah = b.wilayah and a.channel = b.channel and a.bulan = b.bulan and a.tahun = b.tahun
group by a.WILAYAH,a.channel,a.BULAN,a.TAHUN
)a
where
a.bulan='$bulan' and a.tahun='$tahun' and a.wilayah='$wilayah'
GROUP BY WILAYAH,CHANNEL,BULAN,TAHUN;

")->result();

//print_r($query);die();
$this->data['tahun'] = $tahun;
$this->data['bulan'] = $bulan;
// $this->data['wilayah'] = $wilayah;
$this->data['query'] = $query;


		$this->template->title('Report List Detail');
		$this->render('backend/standart/administrator/Report/Report_list_detail', $this->data);

	}

public function getModal($tahun,$bulan,$wilayah){

$query = $this->model_Report->getModal($tahun,$bulan,$wilayah);
	//print_r($query);die();
	
	$tabel='';
	
	
	
	// -------------
	$tabel.='
	<div class="modal-content">

			<div class="modal-header">
<center>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<h4 class="modal-title" id="myModalLabel">Detail report Wilayah '.$wilayah.' </h4>
<h5 class="modal-title" id="myModalLabel">Bulan :  '.baca_bulan($bulan).'  Tahun : '.$tahun.'</h5>
</center>
			</div>
			<div class="modal-body">
	 ';
// -------------

	$tabel.='
	<table class="table table-bordered table-striped dataTable">
	<thead>
		 <tr>

				<th>CHANNEL</th>
				<th>JUMLAH YAP</th>
				<th>JUMLAH EDC</th>
				<th>TOTAL</th>

		 </tr>
	</thead>';


	$tabel.='
			<tbody>';

			$tot=0;
			$tot1=0;
			$tot2=0;
			$total=0;


	foreach ($query as $q) {
$jumlah = $q->JUMLAH_YAP+$q->JUMLAH_EDC;

$tot1+=$q->JUMLAH_EDC;
$tot2+=$q->JUMLAH_YAP;

$total =$tot1+$tot2;

			$tabel.='
<tr>

			<td>'.$q->CHANNEL.'</td>
			<td></td>
			<td>'.$q->JUMLAH_EDC.'</td>
			<td></td>
</tr>';

}


$tabel.='</tbody>';

$tabel.='
<tfoot>
<tr>
<td>TOTAL</td>
<td>'.$tot2.'</td>
<td>'.$tot1.'</td>
<td>'.$total.'</td>
</tr>
</tfoot>
';

$tabel.='
	</table>
	';
// ------------

$tabel.='

</div>


</div>
	';


echo $tabel;
}

//===========

	/**
	* Export to excel
	*
	* @return Files Excel .xls
	*/


	public function export()
	{
		$this->is_allowed('Report_export');

		$this->model_Report->export('Report', 'Report');
	}


    public function excel($tahun,$bulan)
    {

		$subject = 'file';

        $this->load->library('excel');

		$result = $this->db->query("

		select
		WILAYAH,
		
		CASE
		WHEN CHANNEL IS NULL THEN  '?'
		ELSE CHANNEL
		END as CHANNEL,
		
		SUM(IFNULL(JUMLAH_YAP,0)) JUMLAH_YAP,
		SUM(IFNULL(JUMLAH_EDC,0)) JUMLAH_EDC,
		BULAN,
		TAHUN
		from
		(
			select
			a.WILAYAH,
			a.CHANNEL,
			sum(IFNULL(a.JUMLAH,0)) JUMLAH_YAP,
			sum(IFNULL(b.JUMLAH,0)) JUMLAH_EDC,
			a.BULAN,
			a.TAHUN
			from
			VW_YAP2 a left join VW_EDC2 b
			on a.wilayah = b.wilayah and a.channel = b.channel and a.bulan = b.bulan and a.tahun = b.tahun
			group by a.WILAYAH,a.CHANNEL,a.BULAN,a.TAHUN
			union
			select
			a.WILAYAH,
			a.channel,
			sum(IFNULL(b.JUMLAH,0)) JUMLAH_YAP,
			sum(IFNULL(a.JUMLAH,0)) JUMLAH_EDC,
			a.BULAN,
			a.TAHUN
			from
			VW_EDC2 a left join VW_YAP2 b
			on a.wilayah = b.wilayah and a.channel = b.channel and a.bulan = b.bulan and a.tahun = b.tahun
			group by a.WILAYAH,a.channel,a.BULAN,a.TAHUN
			)a
			where
			a.bulan='$bulan' and a.tahun='$tahun' 
			GROUP BY WILAYAH,CHANNEL,BULAN,TAHUN;		
		


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
        header('Content-Disposition: attachment;filename='.ucwords($subject).'-'.date('Y-m-d').'.xls');
        header('Cache-Control: max-age=0');
        header('Cache-Control: max-age=1');

        header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
        header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT');
        header ('Cache-Control: cache, must-revalidate');
        header ('Pragma: public');

        $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');
        $objWriter->save('php://output');
    }

// ====UNMATCH

public function excel_unmatch($tahun,$bulan)
{

	$subject = 'UNMATCH';

	$this->load->library('excel');

	$result = $this->db->query("

SELECT 

OPEN_DATE,	
MID,	
MERCHAN_DBA_NAME,
MSO,
SOURCE_CODE,
POS1,
WILAYAH,
CHANNEL,
TYPE_MID

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








	/**
	* Export to PDF
	*
	* @return Files PDF .pdf
	*/
	public function export_pdf()
	{
		$this->is_allowed('Report_export');

		$this->model_Report->pdf('Report', 'Report');
	}
}


/* End of file Report.php

 select
 a.WILAYAH
 ,COUNT(a.COUNT_EDC) as COUNT_EDC
 ,COUNT(b.COUNT_YAP) as COUNT_YAP
 ,(COUNT(a.COUNT_EDC) + COUNT(b.COUNT_YAP)) as TOTAL

 from v_report_edc a
 left join v_report_yap b ON a.WILAYAH=b.WILAYAH

WHERE
EXTRACT(MONTH FROM a.OPEN_DATE)='$bulan' OR EXTRACT(MONTH FROM b.OPEN_DATE)='$bulan'
AND EXTRACT(YEAR FROM a.OPEN_DATE)='$tahun' OR EXTRACT(YEAR FROM b.OPEN_DATE)='$tahun'

	group by a.WILAYAH
    order by TOTAL ASC

*/
/* Location: ./application/controllers/administrator/Report.php */
