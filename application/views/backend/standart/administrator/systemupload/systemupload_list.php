
<script src="<?= BASE_ASSET; ?>/js/jquery.hotkeys.js"></script>

<script type="text/javascript">
//This page is a result of an autogenerated content made by running test.html with firefox.
function domo(){

   // Binding keys
   $('*').bind('keydown', 'Ctrl+a', function assets() {
       window.location.href = BASE_URL + '/administrator/Systemupload/add';
       return false;
   });

   $('*').bind('keydown', 'Ctrl+f', function assets() {
       $('#sbtn').trigger('click');
       return false;
   });

   $('*').bind('keydown', 'Ctrl+x', function assets() {
       $('#reset').trigger('click');
       return false;
   });

   $('*').bind('keydown', 'Ctrl+b', function assets() {

       $('#reset').trigger('click');
       return false;
   });
}

jQuery(document).ready(domo);
</script>
<!-- Content Header (Page header) -->
<section class="content-header">
   <h1>
      Systemupload<small><?= cclang('list_all'); ?></small>
   </h1>
   <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Systemupload</li>
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
                        <?php is_allowed('systemupload_add', function(){?>
                          <a class="btn btn-flat btn-success btn_add_new" id="btn_add_new" title="<?= cclang('add_new_button', ['Systemupload']); ?>  (Ctrl+a)" href="<?=  site_url('administrator/systemupload/add'); ?>"><i class="fa fa-plus-square-o" ></i> <?= cclang('add_new_button', ['Systemupload']); ?></a>

                          <a class="btn btn-flat btn-success btn_add_generate" id="btn_add_generate" title="generate  (Ctrl+g)" href="<?=  site_url('administrator/systemupload/gen'); ?>"><i class="fa fa-plus-square-o" ></i> Generate</a>


                        <?php }) ?>
                        <?php is_allowed('systemupload_export', function(){?>
                        <a class="btn btn-flat btn-success" title="<?= cclang('export'); ?> Systemupload" href="<?= site_url('administrator/systemupload/export'); ?>"><i class="fa fa-file-excel-o" ></i> <?= cclang('export'); ?> XLS</a>
                        <?php }) ?>
                        <?php is_allowed('systemupload_export', function(){?>
                        <a class="btn btn-flat btn-success" title="<?= cclang('export'); ?> pdf Systemupload" href="<?= site_url('uploads/systemupload/format_upload.csv'); ?>"><i class="fa fa-file-file-o" ></i> <?= cclang('export'); ?> FORMAT UPLOAD</a>
                        <?php }) ?>
                     </div>
                     <div class="widget-user-image">
                        <img class="img-circle" src="<?= BASE_ASSET; ?>/img/list.png" alt="User Avatar">
                     </div>
                     <!-- /.widget-user-image -->
                     <h3 class="widget-user-username">Systemupload</h3>
                     <h5 class="widget-user-desc"><?= cclang('list_all', ['Systemupload']); ?>  <i class="label bg-yellow"><?= $systemupload_counts; ?>  <?= cclang('items'); ?></i></h5>
                  </div>

                  <form name="form_systemupload" id="form_systemupload" action="<?= base_url('administrator/systemupload/index'); ?>">


                  <div class="table-responsive">
                  <table class="table table-bordered table-striped dataTable">
                     <thead>
                        <tr class="">
                           <th>
                            <input type="checkbox" class="flat-red toltip" id="check_all" name="check_all" title="check all">
                           </th>
                           <th>BatchID</th>
                           <th>UploadDate</th>

                           <th>FilePath</th>
<!--
                           <th>UploadBy</th>
                           <th>UploadRemark</th>
                           <th>ApplicationSource</th>
                           <th>ProcessMonth</th>
                           <th>ProcessYear</th>

                           <th>VirtualPath</th>
                           <th>FileSize</th>
                           <th>ReportPath</th>
                           <th>RowDataCount</th>
                           <th>RowDataSucceed</th>
                           <th>RowDataFailed</th>
                           <th>ApprovalID</th>
                           <th>Action</th>
                         -->
                        </tr>
                     </thead>
                     <tbody id="tbody_systemupload">
                     <?php foreach($systemuploads as $systemupload): ?>
                        <tr>
                           <td width="5">
                              <input type="checkbox" class="flat-red check" name="id[]" value="<?= $systemupload->ID; ?>">
                           </td>

                           <td><?= _ent($systemupload->BatchID); ?></td>
                           <td><?= _ent($systemupload->UploadDate); ?></td>

                           <td>
                              <?php if (!empty($systemupload->FilePath)): ?>
                                <?php if (is_image($systemupload->FilePath)): ?>
                                <a class="fancybox" rel="group" href="<?= BASE_URL . 'uploads/systemupload/' . $systemupload->FilePath; ?>">
                                  <img src="<?= BASE_URL . 'uploads/systemupload/' . $systemupload->FilePath; ?>" class="image-responsive" alt="image systemupload" title="FilePath systemupload" width="40px">
                                </a>
                                <?php else: ?>
<!--
                                  <a href="<?= BASE_URL . 'administrator/file/download/systemupload/' . $systemupload->FilePath; ?>">
-->
                                  <a href="<?= BASE_URL . 'uploads/systemupload/' . $systemupload->FilePath; ?>">


                                   <img src="<?= get_icon_file($systemupload->FilePath); ?>" class="image-responsive image-icon" alt="image systemupload" title="FilePath <?= $systemupload->FilePath; ?>" width="40px">
                                 </a>

                                 <a class="btn btn-flat btn-danger btn_del_temp" id="btn_add_generate"   href="<?=  site_url('administrator/systemupload/del_temp'); ?>">DELETE TEMP_UPLOAD</a>
                                 <!-- <a href="javascript:void(0);" data-href="<?= site_url('administrator/systemupload/upload/' . $systemupload->FilePath); ?>" class=" btn btn-primary approve-data"></i>APPROVE</a> -->

<!--cek template kosong  -->
<?php
// print_r(cek_temp_upload());
$temp = cek_temp_upload();
 if($temp==0){
?>
<a href="javascript:void(0);" data-href="<?= site_url('administrator/systemupload/upload/' . $systemupload->FilePath); ?>" class=" btn btn-primary approve-data"></i>APPROVE</a>
<?php
}
?>

                                 <!-- <a href="javascript:void(0);" data-href="<?= site_url('administrator/systemupload/bacacsv/' . $systemupload->ID); ?>" class=" btn btn-primary approve-data"><i class="fa fa-gear"></i>APPROVE</a> -->
                                 <!-- <a href="javascript:void(0);" data-href="<?= site_url('administrator/systemupload/delete/' . $systemupload->ID); ?>" class="label-default remove-data"><i class="fa fa-close"></i> <?= cclang('remove_button'); ?></a> -->

                                <?php endif; ?>
                              <?php endif; ?>
                           </td>


<!---
                           <td><?= _ent($systemupload->username); ?></td>

                           <td><?= _ent($systemupload->UploadRemark); ?></td>
                           <td><?= _ent($systemupload->ApplicationSource); ?></td>

                           <td><?= _ent($systemupload->ProcessMonth); ?></td>
                           <td><?= _ent($systemupload->ProcessYear); ?></td>


                           <td><?= _ent($systemupload->VirtualPath); ?></td>
                           <td><?= _ent($systemupload->FileSize); ?></td>
                           <td><?= _ent($systemupload->ReportPath); ?></td>
                           <td><?= _ent($systemupload->RowDataCount); ?></td>
                           <td><?= _ent($systemupload->RowDataSucceed); ?></td>
                           <td><?= _ent($systemupload->RowDataFailed); ?></td>
                           <td><?= _ent($systemupload->ApprovalID); ?></td>
-->
                           <!-- <td width="200">



                              <?php is_allowed('systemupload_view', function() use ($systemupload){?>
                              <a href="<?= site_url('administrator/systemupload/view/' . $systemupload->ID); ?>" class="label-default"><i class="fa fa-newspaper-o"></i> <?= cclang('view_button'); ?>
                              <?php }) ?>
                              <?php is_allowed('systemupload_update', function() use ($systemupload){?>
                              <a href="<?= site_url('administrator/systemupload/edit/' . $systemupload->ID); ?>" class="label-default"><i class="fa fa-edit "></i> <?= cclang('update_button'); ?></a>
                              <?php }) ?>
                              <?php is_allowed('systemupload_delete', function() use ($systemupload){?>
                              <a href="javascript:void(0);" data-href="<?= site_url('administrator/systemupload/delete/' . $systemupload->ID); ?>" class="label-default remove-data"><i class="fa fa-close"></i> <?= cclang('remove_button'); ?></a>
                               <?php }) ?>
                           </td>
 -->

                        </tr>
                      <?php endforeach; ?>
                      <?php if ($systemupload_counts == 0) :?>
                         <tr>
                           <td colspan="100">
                           Systemupload data is not available
                           </td>
                         </tr>
                      <?php endif; ?>
                     </tbody>
                  </table>
                  </div>
               </div>
               <hr>
               <!-- /.widget-user -->
               <div class="row">
                  <div class="col-md-8">
                     <div class="col-sm-2 padd-left-0 " >
                        <select type="text" class="form-control chosen chosen-select" name="bulk" id="bulk" placeholder="Site Email" >
                           <option value="">Bulk</option>
                           <option value="delete">Delete</option>
                        </select>
                     </div>
                     <div class="col-sm-2 padd-left-0 ">
                        <button type="button" class="btn btn-flat" name="apply" id="apply" title="<?= cclang('apply_bulk_action'); ?>"><?= cclang('apply_button'); ?></button>
                     </div>
                     <div class="col-sm-3 padd-left-0  " >
                        <input type="text" class="form-control" name="q" id="filter" placeholder="<?= cclang('filter'); ?>" value="<?= $this->input->get('q'); ?>">
                     </div>
                     <div class="col-sm-3 padd-left-0 " >
                        <select type="text" class="form-control chosen chosen-select" name="f" id="field" >
                           <option value=""><?= cclang('all'); ?></option>
                            <option <?= $this->input->get('f') == 'BatchID' ? 'selected' :''; ?> value="BatchID">BatchID</option>
                           <option <?= $this->input->get('f') == 'UploadDate' ? 'selected' :''; ?> value="UploadDate">UploadDate</option>
                           <option <?= $this->input->get('f') == 'UploadBy' ? 'selected' :''; ?> value="UploadBy">UploadBy</option>
                           <option <?= $this->input->get('f') == 'UploadRemark' ? 'selected' :''; ?> value="UploadRemark">UploadRemark</option>
                           <option <?= $this->input->get('f') == 'ApplicationSource' ? 'selected' :''; ?> value="ApplicationSource">ApplicationSource</option>
                           <option <?= $this->input->get('f') == 'ProcessMonth' ? 'selected' :''; ?> value="ProcessMonth">ProcessMonth</option>
                           <option <?= $this->input->get('f') == 'ProcessYear' ? 'selected' :''; ?> value="ProcessYear">ProcessYear</option>
                           <option <?= $this->input->get('f') == 'FilePath' ? 'selected' :''; ?> value="FilePath">FilePath</option>
                           <option <?= $this->input->get('f') == 'VirtualPath' ? 'selected' :''; ?> value="VirtualPath">VirtualPath</option>
                           <option <?= $this->input->get('f') == 'FileSize' ? 'selected' :''; ?> value="FileSize">FileSize</option>
                           <option <?= $this->input->get('f') == 'ReportPath' ? 'selected' :''; ?> value="ReportPath">ReportPath</option>
                           <option <?= $this->input->get('f') == 'RowDataCount' ? 'selected' :''; ?> value="RowDataCount">RowDataCount</option>
                           <option <?= $this->input->get('f') == 'RowDataSucceed' ? 'selected' :''; ?> value="RowDataSucceed">RowDataSucceed</option>
                           <option <?= $this->input->get('f') == 'RowDataFailed' ? 'selected' :''; ?> value="RowDataFailed">RowDataFailed</option>
                           <option <?= $this->input->get('f') == 'ApprovalID' ? 'selected' :''; ?> value="ApprovalID">ApprovalID</option>
                          </select>
                     </div>
                     <div class="col-sm-1 padd-left-0 ">
                        <button type="submit" class="btn btn-flat" name="sbtn" id="sbtn" value="Apply" title="<?= cclang('filter_search'); ?>">
                        Filter
                        </button>
                     </div>
                     <div class="col-sm-1 padd-left-0 ">
                        <a class="btn btn-default btn-flat" name="reset" id="reset" value="Apply" href="<?= base_url('administrator/systemupload');?>" title="<?= cclang('reset_filter'); ?>">
                        <i class="fa fa-undo"></i>
                        </a>
                     </div>
                  </div>
                  </form>                  <div class="col-md-4">
                     <div class="dataTables_paginate paging_simple_numbers pull-right" id="example2_paginate" >
                        <?= $pagination; ?>
                     </div>
                  </div>
               </div>
            </div>
            <!--/box body -->
         </div>
         <!--/box -->
      </div>
   </div>
</section>
<!-- /.content -->

<!-- Page script -->
<script>
  $(document).ready(function(){
//approve data
    $('.approve-data').click(function(){

      var url = $(this).attr('data-href');

      swal({
          title: "Approve Data Upload ?",
          text: "<?= cclang('data_to_be_approve_can_not_be_restored'); ?>",
          type: "warning",
          showCancelButton: true,
          confirmButtonColor: "#DD6B55",
          confirmButtonText: "<?= cclang('yes_approve_it'); ?>",
          cancelButtonText: "<?= cclang('no_cancel_plx'); ?>",
          closeOnConfirm: true,
          closeOnCancel: true
        },
        function(isConfirm){
          if (isConfirm) {
            document.location.href = url;
          }
        });

      return false;
    });


    $('.remove-data').click(function(){

      var url = $(this).attr('data-href');

      swal({
          title: "<?= cclang('are_you_sure'); ?>",
          text: "<?= cclang('data_to_be_deleted_can_not_be_restored'); ?>",
          type: "warning",
          showCancelButton: true,
          confirmButtonColor: "#DD6B55",
          confirmButtonText: "<?= cclang('yes_delete_it'); ?>",
          cancelButtonText: "<?= cclang('no_cancel_plx'); ?>",
          closeOnConfirm: true,
          closeOnCancel: true
        },
        function(isConfirm){
          if (isConfirm) {
            document.location.href = url;
          }
        });

      return false;
    });


    $('#apply').click(function(){

      var bulk = $('#bulk');
      var serialize_bulk = $('#form_systemupload').serialize();

      if (bulk.val() == 'delete') {
         swal({
            title: "<?= cclang('are_you_sure'); ?>",
            text: "<?= cclang('data_to_be_deleted_can_not_be_restored'); ?>",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "<?= cclang('yes_delete_it'); ?>",
            cancelButtonText: "<?= cclang('no_cancel_plx'); ?>",
            closeOnConfirm: true,
            closeOnCancel: true
          },
          function(isConfirm){
            if (isConfirm) {
               document.location.href = BASE_URL + '/administrator/systemupload/delete?' + serialize_bulk;
            }
          });

        return false;

      } else if(bulk.val() == '')  {
          swal({
            title: "Upss",
            text: "<?= cclang('please_choose_bulk_action_first'); ?>",
            type: "warning",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Okay!",
            closeOnConfirm: true,
            closeOnCancel: true
          });

        return false;
      }

      return false;

    });/*end appliy click*/


    //check all
    var checkAll = $('#check_all');
    var checkboxes = $('input.check');

    checkAll.on('ifChecked ifUnchecked', function(event) {
        if (event.type == 'ifChecked') {
            checkboxes.iCheck('check');
        } else {
            checkboxes.iCheck('uncheck');
        }
    });

    checkboxes.on('ifChanged', function(event){
        if(checkboxes.filter(':checked').length == checkboxes.length) {
            checkAll.prop('checked', 'checked');
        } else {
            checkAll.removeProp('checked');
        }
        checkAll.iCheck('update');
    });

  }); /*end doc ready*/
</script>
