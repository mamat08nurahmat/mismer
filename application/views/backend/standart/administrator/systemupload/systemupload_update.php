
<!-- Fine Uploader Gallery CSS file
    ====================================================================== -->
<link href="<?= BASE_ASSET; ?>/fine-upload/fine-uploader-gallery.min.css" rel="stylesheet">
<!-- Fine Uploader jQuery JS file
    ====================================================================== -->
<script src="<?= BASE_ASSET; ?>/fine-upload/jquery.fine-uploader.js"></script>
<?php $this->load->view('core_template/fine_upload'); ?>
<script src="<?= BASE_ASSET; ?>/js/jquery.hotkeys.js"></script>
<script type="text/javascript">
    function domo(){
     
       // Binding keys
       $('*').bind('keydown', 'Ctrl+s', function assets() {
          $('#btn_save').trigger('click');
           return false;
       });
    
       $('*').bind('keydown', 'Ctrl+x', function assets() {
          $('#btn_cancel').trigger('click');
           return false;
       });
    
      $('*').bind('keydown', 'Ctrl+d', function assets() {
          $('.btn_save_back').trigger('click');
           return false;
       });
        
    }
    
    jQuery(document).ready(domo);
</script>
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Systemupload        <small>Edit Systemupload</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class=""><a  href="<?= site_url('administrator/systemupload'); ?>">Systemupload</a></li>
        <li class="active">Edit</li>
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
                                <img class="img-circle" src="<?= BASE_ASSET; ?>/img/add2.png" alt="User Avatar">
                            </div>
                            <!-- /.widget-user-image -->
                            <h3 class="widget-user-username">Systemupload</h3>
                            <h5 class="widget-user-desc">Edit Systemupload</h5>
                            <hr>
                        </div>
                        <?= form_open(base_url('administrator/systemupload/edit_save/'.$this->uri->segment(4)), [
                            'name'    => 'form_systemupload', 
                            'class'   => 'form-horizontal', 
                            'id'      => 'form_systemupload', 
                            'method'  => 'POST'
                            ]); ?>
                         
                         
                                                <div class="form-group ">
                            <label for="UploadBy" class="col-sm-2 control-label">UploadBy 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" name="UploadBy" id="UploadBy" placeholder="UploadBy" value="<?= set_value('UploadBy', $systemupload->UploadBy); ?>">
                                <small class="info help-block">
                                <b>Input UploadBy</b> Max Length : 11.</small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="UploadRemark" class="col-sm-2 control-label">UploadRemark 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <textarea id="UploadRemark" name="UploadRemark" rows="5" class="textarea"><?= set_value('UploadRemark', $systemupload->UploadRemark); ?></textarea>
                                <small class="info help-block">
                                <b>Input UploadRemark</b> Max Length : 255.</small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="ApplicationSource" class="col-sm-2 control-label">ApplicationSource 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <select  class="form-control chosen chosen-select" name="ApplicationSource" id="ApplicationSource" data-placeholder="Select ApplicationSource" >
                                    <option value=""></option>
                                    <option <?= $systemupload->ApplicationSource == "MISMER" ? 'selected' :''; ?> value="MISMER">MISMER</option>
                                    <option <?= $systemupload->ApplicationSource == "UMNATCH" ? 'selected' :''; ?> value="UMNATCH">UNMATCH</option>
                                    </select>
                                <small class="info help-block">
                                </small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="ProcessYear" class="col-sm-2 control-label">ProcessYear 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <select  class="form-control chosen chosen-select" name="ProcessYear" id="ProcessYear" data-placeholder="Select ProcessYear" >
                                    <option value=""></option>
                                    <option <?= $systemupload->ProcessYear == "2018" ? 'selected' :''; ?> value="2018">2018</option>
                                    <option <?= $systemupload->ProcessYear == "2017" ? 'selected' :''; ?> value="2017">2017</option>
                                    </select>
                                <small class="info help-block">
                                </small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="ProcessMonth" class="col-sm-2 control-label">ProcessMonth 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <select  class="form-control chosen chosen-select" name="ProcessMonth" id="ProcessMonth" data-placeholder="Select ProcessMonth" >
                                    <option value=""></option>
                                    <option <?= $systemupload->ProcessMonth == "1" ? 'selected' :''; ?> value="1">Januari</option>
                                    <option <?= $systemupload->ProcessMonth == "2" ? 'selected' :''; ?> value="2">Februari</option>
                                    <option <?= $systemupload->ProcessMonth == "3" ? 'selected' :''; ?> value="3">Maret</option>
                                    </select>
                                <small class="info help-block">
                                </small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="ProcessDate" class="col-sm-2 control-label">ProcessDate 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <select  class="form-control chosen chosen-select" name="ProcessDate" id="ProcessDate" data-placeholder="Select ProcessDate" >
                                    <option value=""></option>
                                    <option <?= $systemupload->ProcessDate == "1" ? 'selected' :''; ?> value="1">1</option>
                                    <option <?= $systemupload->ProcessDate == "2" ? 'selected' :''; ?> value="2">2</option>
                                    <option <?= $systemupload->ProcessDate == "3" ? 'selected' :''; ?> value="3">3</option>
                                    </select>
                                <small class="info help-block">
                                </small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="FilePath" class="col-sm-2 control-label">FilePath 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <div id="systemupload_FilePath_galery"></div>
                                <input class="data_file data_file_uuid" name="systemupload_FilePath_uuid" id="systemupload_FilePath_uuid" type="hidden" value="<?= set_value('systemupload_FilePath_uuid'); ?>">
                                <input class="data_file" name="systemupload_FilePath_name" id="systemupload_FilePath_name" type="hidden" value="<?= set_value('systemupload_FilePath_name', $systemupload->FilePath); ?>">
                                <small class="info help-block">
                                </small>
                            </div>
                        </div>
                                                  
                                                <div class="form-group ">
                            <label for="VirtualPath" class="col-sm-2 control-label">VirtualPath 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="VirtualPath" id="VirtualPath" placeholder="VirtualPath" value="<?= set_value('VirtualPath', $systemupload->VirtualPath); ?>">
                                <small class="info help-block">
                                <b>Input VirtualPath</b> Max Length : 255.</small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="FileSize" class="col-sm-2 control-label">FileSize 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="FileSize" id="FileSize" placeholder="FileSize" value="<?= set_value('FileSize', $systemupload->FileSize); ?>">
                                <small class="info help-block">
                                <b>Input FileSize</b> Max Length : 255.</small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="ReportPath" class="col-sm-2 control-label">ReportPath 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="ReportPath" id="ReportPath" placeholder="ReportPath" value="<?= set_value('ReportPath', $systemupload->ReportPath); ?>">
                                <small class="info help-block">
                                <b>Input ReportPath</b> Max Length : 255.</small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="RowDataCount" class="col-sm-2 control-label">RowDataCount 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" name="RowDataCount" id="RowDataCount" placeholder="RowDataCount" value="<?= set_value('RowDataCount', $systemupload->RowDataCount); ?>">
                                <small class="info help-block">
                                <b>Input RowDataCount</b> Max Length : 11.</small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="RowDataSucceed" class="col-sm-2 control-label">RowDataSucceed 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" name="RowDataSucceed" id="RowDataSucceed" placeholder="RowDataSucceed" value="<?= set_value('RowDataSucceed', $systemupload->RowDataSucceed); ?>">
                                <small class="info help-block">
                                <b>Input RowDataSucceed</b> Max Length : 11.</small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="RowDataFailed" class="col-sm-2 control-label">RowDataFailed 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" name="RowDataFailed" id="RowDataFailed" placeholder="RowDataFailed" value="<?= set_value('RowDataFailed', $systemupload->RowDataFailed); ?>">
                                <small class="info help-block">
                                <b>Input RowDataFailed</b> Max Length : 11.</small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="ApprovalID" class="col-sm-2 control-label">ApprovalID 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" name="ApprovalID" id="ApprovalID" placeholder="ApprovalID" value="<?= set_value('ApprovalID', $systemupload->ApprovalID); ?>">
                                <small class="info help-block">
                                <b>Input ApprovalID</b> Max Length : 11.</small>
                            </div>
                        </div>
                                                 
                                                <div class="form-group ">
                            <label for="IS_APPROVED" class="col-sm-2 control-label">IS APPROVED 
                            <i class="required">*</i>
                            </label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" name="IS_APPROVED" id="IS_APPROVED" placeholder="IS APPROVED" value="<?= set_value('IS_APPROVED', $systemupload->IS_APPROVED); ?>">
                                <small class="info help-block">
                                <b>Input IS APPROVED</b> Max Length : 11.</small>
                            </div>
                        </div>
                                                
                        <div class="message"></div>
                        <div class="row-fluid col-md-7">
                            <button class="btn btn-flat btn-primary btn_save btn_action" id="btn_save" data-stype='stay' title="<?= cclang('save_button'); ?> (Ctrl+s)">
                            <i class="fa fa-save" ></i> <?= cclang('save_button'); ?>
                            </button>
                            <a class="btn btn-flat btn-info btn_save btn_action btn_save_back" id="btn_save" data-stype='back' title="<?= cclang('save_and_go_the_list_button'); ?> (Ctrl+d)">
                            <i class="ion ion-ios-list-outline" ></i> <?= cclang('save_and_go_the_list_button'); ?>
                            </a>
                            <a class="btn btn-flat btn-default btn_action" id="btn_cancel" title="<?= cclang('cancel_button'); ?> (Ctrl+x)">
                            <i class="fa fa-undo" ></i> <?= cclang('cancel_button'); ?>
                            </a>
                            <span class="loading loading-hide">
                            <img src="<?= BASE_ASSET; ?>/img/loading-spin-primary.svg"> 
                            <i><?= cclang('loading_saving_data'); ?></i>
                            </span>
                        </div>
                        <?= form_close(); ?>
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
      
             
      $('#btn_cancel').click(function(){
        swal({
            title: "Are you sure?",
            text: "the data that you have created will be in the exhaust!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes!",
            cancelButtonText: "No!",
            closeOnConfirm: true,
            closeOnCancel: true
          },
          function(isConfirm){
            if (isConfirm) {
              window.location.href = BASE_URL + 'administrator/systemupload';
            }
          });
    
        return false;
      }); /*end btn cancel*/
    
      $('.btn_save').click(function(){
        $('.message').fadeOut();
            
        var form_systemupload = $('#form_systemupload');
        var data_post = form_systemupload.serializeArray();
        var save_type = $(this).attr('data-stype');
        data_post.push({name: 'save_type', value: save_type});
    
        $('.loading').show();
    
        $.ajax({
          url: form_systemupload.attr('action'),
          type: 'POST',
          dataType: 'json',
          data: data_post,
        })
        .done(function(res) {
          if(res.success) {
            var id = $('#systemupload_image_galery').find('li').attr('qq-file-id');
            if (save_type == 'back') {
              window.location.href = res.redirect;
              return;
            }
    
            $('.message').printMessage({message : res.message});
            $('.message').fadeIn();
            $('.data_file_uuid').val('');
    
          } else {
            $('.message').printMessage({message : res.message, type : 'warning'});
          }
    
        })
        .fail(function() {
          $('.message').printMessage({message : 'Error save data', type : 'warning'});
        })
        .always(function() {
          $('.loading').hide();
          $('html, body').animate({ scrollTop: $(document).height() }, 2000);
        });
    
        return false;
      }); /*end btn save*/
      
                     var params = {};
       params[csrf] = token;

       $('#systemupload_FilePath_galery').fineUploader({
          template: 'qq-template-gallery',
          request: {
              endpoint: BASE_URL + '/administrator/systemupload/upload_FilePath_file',
              params : params
          },
          deleteFile: {
              enabled: true, // defaults to false
              endpoint: BASE_URL + '/administrator/systemupload/delete_FilePath_file'
          },
          thumbnails: {
              placeholders: {
                  waitingPath: BASE_URL + '/asset/fine-upload/placeholders/waiting-generic.png',
                  notAvailablePath: BASE_URL + '/asset/fine-upload/placeholders/not_available-generic.png'
              }
          },
           session : {
             endpoint: BASE_URL + 'administrator/systemupload/get_FilePath_file/<?= $systemupload->BatchID; ?>',
             refreshOnRequest:true
           },
          multiple : false,
          validation: {
              allowedExtensions: ["*"],
              sizeLimit : 0,
                        },
          showMessage: function(msg) {
              toastr['error'](msg);
          },
          callbacks: {
              onComplete : function(id, name, xhr) {
                if (xhr.success) {
                   var uuid = $('#systemupload_FilePath_galery').fineUploader('getUuid', id);
                   $('#systemupload_FilePath_uuid').val(uuid);
                   $('#systemupload_FilePath_name').val(xhr.uploadName);
                } else {
                   toastr['error'](xhr.error);
                }
              },
              onSubmit : function(id, name) {
                  var uuid = $('#systemupload_FilePath_uuid').val();
                  $.get(BASE_URL + '/administrator/systemupload/delete_FilePath_file/' + uuid);
              },
              onDeleteComplete : function(id, xhr, isError) {
                if (isError == false) {
                  $('#systemupload_FilePath_uuid').val('');
                  $('#systemupload_FilePath_name').val('');
                }
              }
          }
      }); /*end FilePath galey*/
              
       
           
    
    }); /*end doc ready*/
</script>