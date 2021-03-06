
<script src="<?= BASE_ASSET; ?>/js/jquery.hotkeys.js"></script>
<script type="text/javascript">
//This page is a result of an autogenerated content made by running test.html with firefox.
function domo(){
 
   // Binding keys
   $('*').bind('keydown', 'Ctrl+e', function assets() {
      $('#btn_edit').trigger('click');
       return false;
   });

   $('*').bind('keydown', 'Ctrl+x', function assets() {
      $('#btn_back').trigger('click');
       return false;
   });
    
}


jQuery(document).ready(domo);
</script>
<!-- Content Header (Page header) -->
<section class="content-header">
   <h1>
      Systemupload      <small><?= cclang('detail', ['Systemupload']); ?> </small>
   </h1>
   <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class=""><a  href="<?= site_url('administrator/systemupload'); ?>">Systemupload</a></li>
      <li class="active"><?= cclang('detail'); ?></li>
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
                    
                     <div class="widget-user-image">
                        <img class="img-circle" src="<?= BASE_ASSET; ?>/img/view.png" alt="User Avatar">
                     </div>
                     <!-- /.widget-user-image -->
                     <h3 class="widget-user-username">Systemupload</h3>
                     <h5 class="widget-user-desc">Detail Systemupload</h5>
                     <hr>
                  </div>

                 
                  <div class="form-horizontal" name="form_systemupload" id="form_systemupload" >
                   
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">ID </label>

                        <div class="col-sm-8">
                           <?= _ent($systemupload->ID); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">BatchID </label>

                        <div class="col-sm-8">
                           <?= _ent($systemupload->BatchID); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">UploadDate </label>

                        <div class="col-sm-8">
                           <?= _ent($systemupload->UploadDate); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">UploadBy </label>

                        <div class="col-sm-8">
                           <?= _ent($systemupload->username); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">UploadRemark </label>

                        <div class="col-sm-8">
                           <?= _ent($systemupload->UploadRemark); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">ApplicationSource </label>

                        <div class="col-sm-8">
                           <?= _ent($systemupload->ApplicationSource); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">ProcessMonth </label>

                        <div class="col-sm-8">
                           <?= _ent($systemupload->ProcessMonth); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">ProcessYear </label>

                        <div class="col-sm-8">
                           <?= _ent($systemupload->ProcessYear); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label"> FilePath </label>
                        <div class="col-sm-8">
                             <?php if (is_image($systemupload->FilePath)): ?>
                              <a class="fancybox" rel="group" href="<?= BASE_URL . 'uploads/systemupload/' . $systemupload->FilePath; ?>">
                                <img src="<?= BASE_URL . 'uploads/systemupload/' . $systemupload->FilePath; ?>" class="image-responsive" alt="image systemupload" title="FilePath systemupload" width="40px">
                              </a>
                              <?php else: ?>
                              <label>
                                <a href="<?= BASE_URL . 'administrator/file/download/systemupload/' . $systemupload->FilePath; ?>">
                                 <img src="<?= get_icon_file($systemupload->FilePath); ?>" class="image-responsive" alt="image systemupload" title="FilePath <?= $systemupload->FilePath; ?>" width="40px"> 
                               <?= $systemupload->FilePath ?>
                               </a>
                               </label>
                              <?php endif; ?>
                        </div>
                    </div>
                                       
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">VirtualPath </label>

                        <div class="col-sm-8">
                           <?= _ent($systemupload->VirtualPath); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">FileSize </label>

                        <div class="col-sm-8">
                           <?= _ent($systemupload->FileSize); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">ReportPath </label>

                        <div class="col-sm-8">
                           <?= _ent($systemupload->ReportPath); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">RowDataCount </label>

                        <div class="col-sm-8">
                           <?= _ent($systemupload->RowDataCount); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">RowDataSucceed </label>

                        <div class="col-sm-8">
                           <?= _ent($systemupload->RowDataSucceed); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">RowDataFailed </label>

                        <div class="col-sm-8">
                           <?= _ent($systemupload->RowDataFailed); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">ApprovalID </label>

                        <div class="col-sm-8">
                           <?= _ent($systemupload->ApprovalID); ?>
                        </div>
                    </div>
                                        
                    <br>
                    <br>

                    <div class="view-nav">
                        <?php is_allowed('systemupload_update', function() use ($systemupload){?>
                        <a class="btn btn-flat btn-info btn_edit btn_action" id="btn_edit" data-stype='back' title="edit systemupload (Ctrl+e)" href="<?= site_url('administrator/systemupload/edit/'.$systemupload->ID); ?>"><i class="fa fa-edit" ></i> <?= cclang('update', ['Systemupload']); ?> </a>
                        <?php }) ?>
                        <a class="btn btn-flat btn-default btn_action" id="btn_back" title="back (Ctrl+x)" href="<?= site_url('administrator/systemupload/'); ?>"><i class="fa fa-undo" ></i> <?= cclang('go_list_button', ['Systemupload']); ?></a>
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
