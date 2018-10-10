
<!--
<script src="<?= BASE_ASSET; ?>/js/jquery.hotkeys.js"></script>
<script type="text/javascript" src="<?= BASE_ASSET; ?>/datatables/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="<?= BASE_ASSET; ?>/datatables/jquery.dataTables.min.css">
-->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.js"></script> -->
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
    
    



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
<section class="content">
   <div class="row" >

      <div class="col-md-12">
         <div class="box box-warning">
            <div class="box-body ">
               <!-- Widget: user widget style 1 -->
               <div class="box box-widget widget-user-2">
                  <!-- Add the bg color to the header using any of the bg-* classes -->
                  <div class="widget-user-header ">
                     <div class="row pull-right">

                     </div>
                     <div class="widget-user-image">
                        <img class="img-circle" src="<?= BASE_ASSET; ?>/img/list.png" alt="User Avatar">
                     </div>
                     <!-- /.widget-user-image -->
                     <h3 class="widget-user-username">
<?php
// if(!empty($_GET['tanun']) && !empty($_GET['bulan']) ):
if (isset($_GET['tahun']) && isset($_GET['tahun'])) {
?>

Report MISMER UNMATC Tahun : <?= $this->input->get('tahun');?> - Bulan : <?= baca_bulan($this->input->get('bulan'));?>


<?php
}
// endif;
?>


                     </h3>

                  </div>

</br></br></br>
           <form name="form_mismerdetail" id="form_mismerdetail" method="GET" action="<?= base_url('administrator/report/unmatch'); ?>">

               <!-- /.widget-user -->
               <div class="row">
                  <div class="col-md-8">

                     <div class="col-sm-2 padd-left-0 " >
					 <label class="form-control">TAHUN</label>
					</div>

                     <div class="col-sm-2 padd-left-0 " >
                        <select  class="form-control chosen chosen-select"  id="tahun" name="tahun"  >
                           <option <?= $this->input->get('tahun') == '2017' ? 'selected' :''; ?> value="2017">2017</option>
                           <option <?= $this->input->get('tahun') == '2018' ? 'selected' :''; ?> value="2018">2018</option>

                        </select>
                     </div>

                     <div class="col-sm-2 padd-left-0 " >
					 <label class="form-control">BULAN</label>
					</div>


                     <div class="col-sm-2 padd-left-0 " >
                        <select  class="form-control chosen chosen-select"  id="bulan" name="bulan"  >

                          <option <?= $this->input->get('bulan') == '1' ? 'selected' :''; ?> value="1">Januari</option>
                          <option <?= $this->input->get('bulan') == '2' ? 'selected' :''; ?> value="2">Februari</option>
                          <option <?= $this->input->get('bulan') == '3' ? 'selected' :''; ?> value="3">Maret</option>
                          <option <?= $this->input->get('bulan') == '4' ? 'selected' :''; ?> value="4">April</option>
                          <option <?= $this->input->get('bulan') == '5' ? 'selected' :''; ?> value="5">Mei</option>
                          <option <?= $this->input->get('bulan') == '6' ? 'selected' :''; ?> value="6">Juni</option>
                          <option <?= $this->input->get('bulan') == '7' ? 'selected' :''; ?> value="7">Juli</option>
                          <option <?= $this->input->get('bulan') == '8' ? 'selected' :''; ?> value="8">Agustus</option>
                          <option <?= $this->input->get('bulan') == '9' ? 'selected' :''; ?> value="9">September</option>
                          <option <?= $this->input->get('bulan') == '10' ? 'selected' :''; ?> value="10">Oktober</option>
                          <option <?= $this->input->get('bulan') == '11' ? 'selected' :''; ?> value="11">November</option>
                          <option <?= $this->input->get('bulan') == '12' ? 'selected' :''; ?> value="12">Desember</option>

                        </select>
                     </div>

                     <div class="col-sm-2 padd-left-0 ">
                        <button type="submit" class="btn btn-success"  title="generate">GENERATE</button>
                        
                     </div>

                     <div class="col-sm-2 padd-left-0 ">
                        
                        <button type="button" id="detail" class="btn btn-success"   Onclick="get_download(<?=$this->input->get('tahun');?>,<?=$this->input->get('bulan');?>)">DOWNLOAD</button>

                     </div>


                  </div>



                  <div class="col-md-4">
                     <div class="dataTables_paginate paging_simple_numbers pull-right" id="example2_paginate" >

                     </div>
                  </div>
               </div>
<br><br>




                  <div class="table-responsive">


                    <!-- <table class="table table-bordered table-striped dataTable" > -->
                    <table id="example" class="display" style="width:100%">

                     <thead>
                        <tr>

                           <th>MID</th>
                           <th>WILAYAH</th>
                           <th>CHANNEL</th>
                           <th>OPEN_DATE</th>
                           <!-- <th>ACT</th> -->

                        </tr>
                     </thead>
                     <tbody id="tbody_Report">

                <?php
                foreach($query as $q){
                ?>
                          <tr>
                           <td><?=$q->MID;?></td>
                           <td><?=$q->WILAYAH;?></td>
                           <td><?=$q->CHANNEL;?></td>
                           <td><?=$q->OPEN_DATE;?></td>
                           <!-- <td>
<button type="button" id="detail" class=" btn btn-primary" data_wilayah="<?=$q->WILAYAH;?>"  Onclick="get_detail(<?=$tahun;?>,<?=$bulan;?>,'<?=$q->WILAYAH;?>')">Detail</button>
			               </td> -->

                        </tr>

                      <?php
                      }
                      ?>

                     </tbody>
                  </table>

                  </div>

		  </div>
			  </div>
               <hr>

            </div>
            <!--/box body -->
         </div>
         <!--/box -->
      </div>
   </div>
</section>
<!-- /.content -->

<!-- Page script -->
<script type="text/javascript">

$(document).ready(function() {
    $('#example').DataTable();
} );


 function get_download(tahun,bulan){

console.log(tahun);
console.log(bulan);

var url='<?= site_url('administrator/report/excel_unmatch/') ?>'+tahun+'/'+bulan;
window.location = url;

}


/*

function get_detail(tahun,bulan,wilayah)
{
$('#myModal').modal('show');

var url='<?= site_url('administrator/report/getModal/') ?>'+tahun+'/'+bulan+'/'+wilayah;
// var url='<?= site_url('administrator/report/getModalTES/') ?>';
// $('#result').innerHTML='LOADING.....';

//document.getElementById('result').innerHTML = ".<img src="<?= base_url('asset\Loading_icon.gif'); ?>" alt="LOADING">.";
$('#result').html('<img src="localhost:81/mismer/asset/Loading_icon.gif"> <span>LOADING</span>');
$('#result').load(url);
//document.getElementById('result').load(url);

 }

 function get_unmatch(tahun,bulan){

   console.log(tahun);
   console.log(bulan);

   var url='<?= site_url('administrator/report/excel_unmatch/') ?>'+tahun+'/'+bulan;
window.location = url;

 }
*/ 

</script>
