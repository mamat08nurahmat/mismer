
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
                     <h3 class="widget-user-username">Report Detail</h3>

                  </div>

</br></br></br></br>
           <form name="form_mismerdetail" id="form_mismerdetail"  action="<?= base_url('administrator/report/index'); ?>">

               <!-- /.widget-user -->
               <div class="row">
                  <div class="col-md-8">

                     <div class="col-sm-2 padd-left-0 " >

					</div>

                     <div class="col-sm-2 padd-left-0 " >

                     </div>

                     <div class="col-sm-2 padd-left-0 " >

					</div>


                     <div class="col-sm-2 padd-left-0 " >

                     </div>

                     <div class="col-sm-2 padd-left-0 ">

                     </div>


                  </div>



                  <div class="col-md-4">
                     <div class="dataTables_paginate paging_simple_numbers pull-right" id="example2_paginate" >

                     </div>
                  </div>
               </div>


                  <div class="table-responsive">


                    <table class="table table-bordered table-striped dataTable">


                     <thead>
                        <tr>

                           <th>CHANNEL</th>
                           <th>JUMLAH YAP</th>
                           <th>JUMLAH EDC</th>
                           <th>TOTAL</th>

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
                           <td><?=$q->CHANNEL;?></td>
                           <td></td>
                           <td><?=$q->JUMLAH_EDC;?></td>
                           <td><?=$q->JUMLAH_YAP+$q->JUMLAH_EDC;?></td>

                        </tr>

<?php
}
?>
                        <tr>
                           <td>TOTAL</td>
                           <td><?=$tot2;?></td>
                           <td><?=$tot1;?></td>
                           <td><?=$total;?></td>
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

<!-- Page script -->

<script type="text/javascript">
$(document).ready(function(){

console.log('ready.........');

});
</script>
