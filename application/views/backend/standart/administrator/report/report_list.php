
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

Report MISMER Tahun : <?= $this->input->get('tahun');?> - Bulan : <?= baca_bulan($this->input->get('bulan'));?>


<?php
}
// endif;
?>


                     </h3>

                  </div>

</br></br></br>
           <form name="form_mismerdetail" id="form_mismerdetail" method="GET" action="<?= base_url('administrator/report/index'); ?>">

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
                        <button type="submit" class="btn btn-default"  title="generate">GENERATE</button>
                     </div>


                  </div>



                  <div class="col-md-4">
                     <div class="dataTables_paginate paging_simple_numbers pull-right" id="example2_paginate" >

                     </div>
                  </div>
               </div>
<br><br>




                  <div class="table-responsive">


                    <table class="table table-bordered table-striped dataTable">


                     <thead>
                        <tr>

                           <th>WILAYAH</th>
                           <th>EDC</th>
                           <th>YAP</th>
                           <th>TOTAL</th>
                           <th>ACT</th>

                        </tr>
                     </thead>
                     <tbody id="tbody_Report">

                <?php
                $tot=0;
                $tot1=0;
                $tot2=0;
                $total=0;
                foreach($query as $q){

                $tot1+=$q->JUMLAH_EDC;
                $tot2+=$q->JUMLAH_YAP;

                $total =$tot1+$tot2;
                ?>
                          <tr>
                           <td><?=$q->WILAYAH;?></td>
                           <td><?=$q->JUMLAH_EDC;?></td>
                           <td><?=$q->JUMLAH_YAP;?></td>
                           <td><?=$q->JUMLAH_EDC+$q->JUMLAH_YAP;?></td>
                           <td>

                            <!-- <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">. . .</button> -->
<!-- <input type="hidden" class="form-control" name="data-detail" id="data-detail"  value="<?= site_url('administrator/report/getModal/'.$tahun.'/'.$bulan.'/'.$q->WILAYAH); ?>" readonly="" />
<input type="text" name="kode-wilayah" id="kode-wilayah" value="<?=$q->WILAYAH;?>" readonly>
<input type="text" name="tahun" id="tahun" value="<?=$tahun;?>" readonly>
<input type="text" name="bulan" id="bulan" value="<?=$bulan;?>" readonly> -->

<!-- <a href="<?= site_url('administrator/report/detail/'.$tahun.'/'.$bulan.'/'.$q->WILAYAH); ?>" target="_blank" class=" btn btn-primary">DETAIL</a> -->
<button type="button" id="detail" class=" btn btn-primary" data_wilayah="<?=$q->WILAYAH;?>"  Onclick="get_detail(<?=$tahun;?>,<?=$bulan;?>,'<?=$q->WILAYAH;?>')">Detail</button>
<!-- ||
<button type="button" id="unmatch" class=" btn btn-primary" data_wilayah="<?=$q->WILAYAH;?>"  Onclick="get_unmatch(<?=$tahun;?>,<?=$bulan;?>)">EXCEL Unmatch EDC</button> -->




						               </td>
                        </tr>

                      <?php
                      }
                      ?>
                        <tr bgcolor="#FF0000">
                           <td >TOTAL</td>
                           <td><?=$tot1;?></td>
                           <td><?=$tot2;?></td>
                           <td><?=$total;?></td>
                           <td></td>
                        </tr>
<!--
-->

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
 <div id="result"></div>

<!--  -->
</div>

</div>
<!--  -->
    </div>
</div>
<!--MODAL-->

<!-- Page script -->

<script type="text/javascript">


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


</script>
