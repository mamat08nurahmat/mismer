
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
      Templateupload      <small><?= cclang('detail', ['Templateupload']); ?> </small>
   </h1>
   <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class=""><a  href="<?= site_url('administrator/templateupload'); ?>">Templateupload</a></li>
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
                     <h3 class="widget-user-username">Templateupload</h3>
                     <h5 class="widget-user-desc">Detail Templateupload</h5>
                     <hr>
                  </div>

                 
                  <div class="form-horizontal" name="form_templateupload" id="form_templateupload" >
                   
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">RowID </label>

                        <div class="col-sm-8">
                           <?= _ent($templateupload->RowID); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">BatchID </label>

                        <div class="col-sm-8">
                           <?= _ent($templateupload->BatchID); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">MID </label>

                        <div class="col-sm-8">
                           <?= _ent($templateupload->MID); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">MERCHAN DBA NAME </label>

                        <div class="col-sm-8">
                           <?= _ent($templateupload->MERCHAN_DBA_NAME); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">STATUS EDC </label>

                        <div class="col-sm-8">
                           <?= _ent($templateupload->STATUS_EDC); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">OPEN DATE </label>

                        <div class="col-sm-8">
                           <?= _ent($templateupload->OPEN_DATE); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">CITY </label>

                        <div class="col-sm-8">
                           <?= _ent($templateupload->CITY); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">MSO </label>

                        <div class="col-sm-8">
                           <?= _ent($templateupload->MSO); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">SOURCE CODE </label>

                        <div class="col-sm-8">
                           <?= _ent($templateupload->SOURCE_CODE); ?>
                        </div>
                    </div>
                                         
                    <div class="form-group ">
                        <label for="content" class="col-sm-2 control-label">POS1 </label>

                        <div class="col-sm-8">
                           <?= _ent($templateupload->POS1); ?>
                        </div>
                    </div>
                                        
                    <br>
                    <br>

                    <div class="view-nav">
                        <?php is_allowed('templateupload_update', function() use ($templateupload){?>
                        <a class="btn btn-flat btn-info btn_edit btn_action" id="btn_edit" data-stype='back' title="edit templateupload (Ctrl+e)" href="<?= site_url('administrator/templateupload/edit/'.$templateupload->RowID); ?>"><i class="fa fa-edit" ></i> <?= cclang('update', ['Templateupload']); ?> </a>
                        <?php }) ?>
                        <a class="btn btn-flat btn-default btn_action" id="btn_back" title="back (Ctrl+x)" href="<?= site_url('administrator/templateupload/'); ?>"><i class="fa fa-undo" ></i> <?= cclang('go_list_button', ['Templateupload']); ?></a>
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
