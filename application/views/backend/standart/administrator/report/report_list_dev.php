
<!--
<script src="<?= BASE_ASSET; ?>/js/jquery.hotkeys.js"></script>
<script type="text/javascript" src="<?= BASE_ASSET; ?>/datatables/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="<?= BASE_ASSET; ?>/datatables/jquery.dataTables.min.css">
-->



<!-- Content Header (Page header) -->
<section class="content-header">
   <h1>
      Report<small>
   </h1>
   <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Report</li>
   </ol>
</section>
<!-- Main content -->
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
<!---
                            <li><a href="#tab3default" data-toggle="tab">Default 3</a></li>
                            <li class="dropdown">
                                <a href="#" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#tab4default" data-toggle="tab">Default 4</a></li>
                                    <li><a href="#tab5default" data-toggle="tab">Default 5</a></li>
                                </ul>
                            </li>
-->							
                        </ul>
                </div>

                <div class="panel-body">
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1default">
						
                <form id="form-filter" class="form-horizontal">
                    
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
							
                            <button type="button" id="generate" class="btn btn-primary">Generate</button>
                            <!-- <button type="button" id="excel" class="btn btn-default"><i class="fa fa-file-excel-o"></i></button> -->
                        </div>
                    </div>

                </form>
										
						
						</div>
                        <div class="tab-pane fade" id="tab2default">
						
                <form id="form-filter" class="form-horizontal">
                    
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
                            <!-- <button type="button" id="excel2" class="btn btn-default"><i class="fa fa-file-excel-o"></i></button> -->
                        </div>
                    </div>

                </form>
						
						</div>


<!--
                        <div class="tab-pane fade" id="tab3default">Default 3</div>
                        <div class="tab-pane fade" id="tab4default">Default 4</div>
                        <div class="tab-pane fade" id="tab5default">Default 5</div>
-->						
                    </div>
                </div>
            </div>
        </div>

	</div>
		
		
<!--------------->

<div class="container-fluid">

    <div class="row-fluid">
        <div class="span4">&nbsp;</div>
        <div class="span4 loader" style="text-align: center">
            <div class="progress progress-striped active" style="display: none">
                <div class="bar" style="width: 100%;"></div>
            </div>
        </div>
        <div class="span4">&nbsp;</div>
    </div>

    <div style="border-bottom: 1px #999 dashed; margin-bottom: 20px"></div>

    <div class="row-fluid">
        <div id="result"></div>
    </div>

    <div style="border-bottom: 1px #999 dashed; margin-bottom: 20px"></div>


</div>
<!--------------->		



		</div><!-- /.box-body -->
        <div class="box-footer">
            Footer
        </div><!-- /.box-footer-->
    </div><!-- /.box -->

</section><!-- /.content -->
<!-- /.content -->
<!--MODAL-->
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

<script type="text/javascript">
//Generate
const generate = document.getElementById('generate');	
const generate2 = document.getElementById('generate2');	

generate.addEventListener('click',function(){
// console.log('click');	

const tgl_awal =document.getElementById('tgl_awal').value;
const tgl_akhir =document.getElementById('tgl_akhir').value;

var url='<?= site_url('administrator/report/getReport/') ?>'+tgl_awal+'/'+tgl_akhir;
  $('.loading').show();
$('#result').load(url);
$('.loading').hide();

});


// function get_detail(){
//     var TglAwal = document.getElementById("detail").getAttribute("dataTglAwal");    
//     var TglAkhir = document.getElementById("detail").getAttribute("dataTglAkhir");    
//     var DataWilayah = document.getElementById("detail").getAttribute("dataWilayah");    
// // console.log(TglAwal);
// // console.log(TglAkhir);
// // console.log(DataWilayah);
// $('#myModal').modal('show');

// var url='<?= site_url('administrator/report/getModal_between/') ?>'+TglAwal+'/'+TglAkhir+'/'+DataWilayah;

// $('#result_modal').load(url);

// }

// const detail = document.getElementById('detail');	
// detail.addEventListener('click',function(){
// console.log('detail');	
// });

$(document).on('click', '#detail', function (e) {


var TglAwal = $(this).attr('dataTglAwal');
var TglAkhir = $(this).attr('dataTglAkhir');
var Wilayah = $(this).attr('dataWilayah');

// console.log(TglAwal);
// console.log(TglAkhir);
// console.log(Wilayah);

$('#myModal').modal('show');

var url='<?= site_url('administrator/report/getModal_between/') ?>'+TglAwal+'/'+TglAkhir+'/'+Wilayah;

$('#result_modal').load(url);


            });
 //============================================================== 
generate2.addEventListener('click',function(e){


// console.log('generateeeeeee2');
const tahun =document.getElementById('tahun').value;
const bulan =document.getElementById('bulan').value;

var url='<?= site_url('administrator/report/getReport2/') ?>'+tahun+'/'+bulan;
$('#result').load(url);


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

var url='<?= site_url('administrator/report/getModal/') ?>'+dataTahun+'/'+dataBulan+'/'+Wilayah;

$('#result_modal').load(url);


});



</script>
