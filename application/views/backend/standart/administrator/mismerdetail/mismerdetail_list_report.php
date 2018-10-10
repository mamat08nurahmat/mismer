<style>
table.blueTable {
  border: 1px solid #1C6EA4;
  background-color: #EEEEEE;
  width: 80%;
  text-align: left;

}
table.blueTable td, table.blueTable th {
  border: 1px solid #AAAAAA;
  padding: 1px 1px;
}
table.blueTable tbody td {
  font-size: 10px;
  font-weight: bold;  
}
table.blueTable tr:nth-child(even) {
  background: #D0E4F5;
}
table.blueTable thead {
  background: #1C6EA4;
  background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  border-bottom: 2px solid #444444;
}
table.blueTable thead th {
  font-size: 10px;
  font-weight: bold;
  color: #FFFFFF;
  border-left: 2px solid #D0E4F5;
}
table.blueTable thead th:first-child {
  border-left: none;
}

table.blueTable tfoot {
  /* 
  background: #1C6EA4;
  background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  border-bottom: 2px solid #444444;    
  */
  font-size: 14px;
  font-weight: bold;
  color:#070B00;
  background: #D0E4F5;
  background: -moz-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  background: -webkit-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  background: linear-gradient(to bottom, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  border-top: 2px solid #444444; 
}
table.blueTable tfoot td {
  font-size: 14px;
}
/* table.blueTable tfoot .links {
  text-align: right;
} */
/* table.blueTable tfoot .links a{
  display: inline-block;
  background: #1C6EA4;
  color: #FFFFFF;
  padding: 2px 8px;
  border-radius: 5px;
} */

</style>
<!-- Content Header (Page header) -->
<section class="content-header">
   <h1>
      Mismerdetail<small>Report></small>
   </h1>
   <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Mismerdetail Report</li>
   </ol>
</section>
<!-- Main content -->
<section class="content">

    <!-- Default box -->
    <div class="box">
        <div class="box-header with-border">
            <h3 class="box-title">Title</h3>
            <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
            </div>
        </div>
        <div class="box-body">

		
		
<!---
    <div class="page-header">
        <h1>Panels with nav tabs.<span class="pull-right label label-default">:)</span></h1>
    </div>
-->
    <div class="row">
    	<div class="col-md-12">
            <div class="panel with-nav-tabs panel-default">
                <div class="panel-heading">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab1default" data-toggle="tab">Filter 1</a></li>
                            <li><a href="#tab2default" data-toggle="tab">Filter 2</a></li>		
                        </ul>
                </div>

                <div class="panel-body">
                    <div class="tab-content">

 <!--TAB 1 Active  -->
                        <div class="tab-pane fade in active" id="tab1default">
						
                <!-- <form id="form-filter" class="form-horizontal">
                    
                    <div class="form-group">
                        <label for="TanggalAwal" class="col-sm-2 control-label">Tanggal Awal</label>
                        <div class="col-sm-4">
                            <input type="date" class="form-control" id="tgl_awal">
                        </div>
                    </div>
					
                    <div class="form-group">
                        <label for="TanggalAkhir" class="col-sm-2 control-label">Tanggal Akhir</label>
                        <div class="col-sm-4">
                            <input type="date" class="form-control" id="tgl_akhir">
                        </div>
                    </div>

						
					
                    <div class="form-group">
                        <label for="LastName" class="col-sm-2 control-label"></label>
                        <div class="col-sm-4">
							
                            <button type="button" id="generate1" class="btn btn-primary">Generate</button>
                             <button type="button" id="excel" class="btn btn-default"><i class="fa fa-file-excel-o"></i></button> 
                        </div>
                    </div>

                </form>		 -->

<form class="form-inline">

  <div class="form-group mx-sm-3 mb-2">
    <label for="tgl_awal">Tgl Awal</label>
    <input type="date" class="form-control" id="tgl_awal">
  </div>
  
  <div class="form-group mx-sm-3 mb-2">
    <label for="tgl_akhir" >Tgl Akhir</label>
    <input type="date" class="form-control" id="tgl_akhir">
  </div>
  <button type="button" id="generate1" class="btn btn-primary">Generate</button>
</form>



<hr>

<!-- RESULT  -->
<div id='result1'></div>

<!-- <table class="blueTable">
<thead>
<tr>
<th>WILAYAH</th>
<th>EDC</th>
<th>YAP</th>
<th>TOTAL</th>
<th>#</th>
</tr>
</thead>

<tbody>
<tr>
<td>cell1_1</td>
<td>cell2_1</td>
<td>cell3_1</td>
<td>cell4_1</td>
<td>cell5_1</td>
</tr>
<tr>
<td>cell1_2</td>
<td>cell2_2</td>
<td>cell3_2</td>
<td>cell4_2</td>
<td>cell5_2</td>
</tr>
<tr>
<td>cell1_3</td>
<td>cell2_3</td>
<td>cell3_3</td>
<td>cell4_3</td>
<td>cell5_3</td>
</tr>
</tbody>
</table> -->

<!-- /RESULT  -->
						</div>
 <!--/TAB 1 Active  -->


 <!--TAB 2  -->
                        <div class="tab-pane fade" id="tab2default">
						
                <!-- <form id="form-filter" class="form-horizontal">
                    
                <div class="form-group">
                        <label for="TanggalAwal" class="col-sm-2 control-label">Tahun</label>
                        <div class="col-sm-4">
                            <select name="tahun" id="tahun" class="form-control">
                            <option value="2017">2017</option>
                            <option value="2018">2018</option>
                            </select>

                        </div>
                    </div>
					
                    <div class="form-group">
                        <label for="TanggalAkhir" class="col-sm-2 control-label">Bulan</label>
                        <div class="col-sm-4">
                        <select name="bulan" id="bulan" class="form-control">
                            <option value="1">Januari</option>
                            <option value="2">Februari</option>
                            <option value="3">Maret</option>
                            <option value="4">April</option>
                            <option value="5">Mei</option>
                            <option value="6">Juni</option>
                            <option value="7">Juli</option>
                            <option value="8">Agustus</option>
                            <option value="9">September</option>
                            <option value="10">Oktober</option>
                            <option value="11">November</option>
                            <option value="12">Desember</option>
                            </select>
                        </div>
                    </div>		
						
					
                    <div class="form-group">
                        <label for="LastName" class="col-sm-2 control-label"></label>
                        <div class="col-sm-4">
							
                            <button type="button" id="generate2" class="btn btn-primary">Generate</button>
                            <button type="button" id="excel2" class="btn btn-default"><i class="fa fa-file-excel-o"></i></button>
                        </div>
                    </div>

                </form> -->


<form class="form-inline">

<div class="form-group mx-sm-3 mb-2">
  <label for="tahun">Tahun</label>

  <select name="tahun" id="tahun" class="form-control">
    <option value="2017">2017</option>
    <option value="2018">2018</option>
  </select>

</div>

<div class="form-group mx-sm-3 mb-2">
  <label for="bulan" >Bulan</label>
  <select name="bulan" id="bulan" class="form-control">
                            <option value="1">Januari</option>
                            <option value="2">Februari</option>
                            <option value="3">Maret</option>
                            <option value="4">April</option>
                            <option value="5">Mei</option>
                            <option value="6">Juni</option>
                            <option value="7">Juli</option>
                            <option value="8">Agustus</option>
                            <option value="9">September</option>
                            <option value="10">Oktober</option>
                            <option value="11">November</option>
                            <option value="12">Desember</option>
                            </select>


</div>
<button type="button" id="generate2" class="btn btn-primary">Generate</button>
</form>

<hr>
<!-- RESULT  -->
<div id="result2"></div>
<!-- <table class="blueTable">
<thead>
<tr>
<th>WILAYAH</th>
<th>EDC</th>
<th>YAP</th>
<th>TOTAL</th>
<th>#</th>
</tr>
</thead>

<tbody>
<tr>
<td>cell1_1</td>
<td>cell2_1</td>
<td>cell3_1</td>
<td>cell4_1</td>
<td>cell5_1</td>
</tr>
<tr>
<td>cell1_2</td>
<td>cell2_2</td>
<td>cell3_2</td>
<td>cell4_2</td>
<td>cell5_2</td>
</tr>
<tr>
<td>cell1_3</td>
<td>cell2_3</td>
<td>cell3_3</td>
<td>cell4_3</td>
<td>cell5_3</td>
</tr>
</tbody>
</table> -->
<!-- /RESULT  -->

						</div>
<!-- /TAB 2  -->

					
                    </div>
                </div>
            </div>
        </div>

	</div>
		
		
<!--------------->


</section><!-- /.content -->
<!-- Main content -->


<!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog" style="width:800px">

            <!--  -->
            <!-- <div class="modal-content">

                <div class="modal-header">
                <center>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Detail report Wilayah '.$wilayah.' </h4>
                    <h5 class="modal-title" id="myModalLabel">Bulan :  '.$bulan.'  Tahun : '.$tahun.'</h5>
                </center>
                </div>

            <div class="modal-body"> -->

            <!--  -->
            <span class="loading loading-hide">
            <img src="<?= BASE_ASSET; ?>/img/loading-spin-primary.svg"> 
            <i><?= cclang('loading_saving_data'); ?></i>
            </span>

            <div id="result_modal"></div>

            <!--  -->
            </div>

            </div>
            <!--  -->
                </div>
            </div>
<!--MODAL-->


<!-- Page script -->
<script>
  $(document).ready(function(){

// tab 1
const generate1 = document.getElementById('generate1');
generate1.addEventListener('click',function(e){
let TglAwal = document.getElementById('tgl_awal').value;   
let TglAkhir = document.getElementById('tgl_akhir').value;


var url='<?= site_url('administrator/mismerdetail/getResult1/') ?>'+TglAwal+'/'+TglAkhir;
$('#result1').load(url);
/*
//ajax--------
$.ajax({

  type:"POST",
  url:"<?=site_url('administrator/mismerdetail/getfilter1')?>",
  dataType:"html",
  data:{
    TglAwal:TglAwal,
    TglAkhir:TglAkhir
  },
  cache:false,
// before
beforeSend : function(data){

console.log('beforeSend');

},
// success
success : function(data){
  console.log('success');

$('#result1').html(data);

},
// complete
complete : function(data){
  console.log('complete');


}


});
//ajax--------
*/

});



// tab 2

const generate2 = document.getElementById('generate2');

generate2.addEventListener('click',function(e){

let Bulan = document.getElementById('bulan').value;   
let Tahun = document.getElementById('tahun').value;

// console.log('klikkkkkkkkkk generate 2');
// console.log(Bulan);
// console.log(Tahun);
var url='<?= site_url('administrator/mismerdetail/getResult2/') ?>'+Tahun+'/'+Bulan;
$('#result2').load(url);

});



  }); /*end doc ready*/


// detail1 click
$(document).on('click', '#detail1', function (e) {


let TglAwal = $(this).attr('dataTglAwal');
let TglAkhir = $(this).attr('dataTglAkhir');
let Wilayah = $(this).attr('dataWilayah');

// console.log(TglAwal);
// console.log(TglAkhir);
// console.log(Wilayah);

$('#myModal').modal('show');

// var url='<?= site_url('administrator/report/getModal_between/') ?>'+TglAwal+'/'+TglAkhir+'/'+Wilayah;
var url='<?= site_url('administrator/mismerdetail/getModalResult1/') ?>'+TglAwal+'/'+TglAkhir+'/'+Wilayah;

$('#result_modal').load(url);


});


$(document).on('click', '#detail2', function (e) {

// console.log('klikkkkk');

var dataTahun = $(this).attr('dataTahun');
var dataBulan = $(this).attr('dataBulan');
var Wilayah = $(this).attr('dataWilayah');

console.log(dataTahun);
console.log(dataBulan);
console.log(Wilayah);

$('#myModal').modal('show');

//  var url='<?= site_url('administrator/report/getModal/') ?>'+dataTahun+'/'+dataBulan+'/'+Wilayah;
var url='<?= site_url('administrator/mismerdetail/getModalResult2/') ?>'+dataTahun+'/'+dataBulan+'/'+Wilayah;

$('#result_modal').load(url);


});



</script>