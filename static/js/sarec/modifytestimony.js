$(document).ready(function() {

    $( "[href='/administrator/testimony/modify/']" ).parent().addClass('active').parent().addClass('open');
    $( "[href='/administrator/testimony/modify/']" ).parent().parent().parent().addClass('active open hsub');

    var table = $('#sample-table-2').dataTable( {
        bAutoWidth: false,
        "aoColumns": [ { "bSortable": false }, null ,null, null,null,null,
          { "bSortable": false }
        ],
        "aaSorting": [],
        "language": {
            "lengthMenu": "Mostrar _MENU_ registros",
            "zeroRecords": "No se encontraron coincidencias...",
            "info": "Páginas Mostradas: _PAGE_ de _PAGES_",
            "infoEmpty": "registros encontrados:",
            "infoFiltered": "(0 de 0)",
            "paginate": {
                            "first":      "Primero",
                            "last":       "Ultimo",
                            "next":       "Siguiente",
                            "previous":   "Previo"
                        },
            "processing": "Procesando...",
            "search": "Buscar:",
        }
    } );

    $( " input.required, textarea " ).on( 'input' , function() {
        if( $( this ).val() === '' ) {
            $( this ).parent().parent().addClass('has-error');
        } else {
            $( this ).parent().parent().removeClass('has-error');
        }
    });

    $.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
        _title: function(title) {
            var $title = this.options.title || '&nbsp;'
            if( ("title_html" in this.options) && this.options.title_html == true )
                title.html($title);
            else title.text($title);
        }
    }));

    $( document ).on( 'click', 'i.fa-search-plus.bigger-130', function(e) {
        $( "#dialog-message" ).append( '<form name="FormPost" id="FrmGrid_grid-table" class="FormGrid" onsubmit="return false;" style="width:auto;overflow:auto;position:relative;height:auto;"> <table id="TblGrid_grid-table" class="EditTable" cellspacing="0" cellpadding="0" border="0" style="width:100%;"> <tbody> <tr rowpos="1" class="FormData" id="tr_id" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">ID</td><td class="DataTD">&nbsp; <input type="text" id="td_id" name="td_id" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;width:90%;"> </td></tr><tr rowpos="2" class="FormData" id="tr_name" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Nombre</td><td class="DataTD">&nbsp; <input type="text" id="td_name" readonly role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;width:90%;"> </td></tr><tr rowpos="2" class="FormData" id="tr_profession" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Profesión</td><td class="DataTD">&nbsp; <input type="text" id="td_profession" readonly role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;width:90%;"> </td></tr><tr rowpos="2" class="FormData" id="tr_expression" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Expresión</td><td class="DataTD">&nbsp; <input type="text" id="td_expression" readonly role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;width:90%;"> </td></tr><tr rowpos="2" class="FormData" id="tr_email" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Email</td><td class="DataTD">&nbsp; <input type="text" id="td_email" readonly role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;width:90%;"> </td></tr><tr rowpos="2" class="FormData" id="tr_facebook" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Facebook</td><td class="DataTD">&nbsp; <input type="text" id="td_facebook" readonly role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;width:90%;"> </td></tr><tr rowpos="2" class="FormData" id="tr_twitter" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Twitter</td><td class="DataTD">&nbsp; <input type="text" id="td_twitter" readonly role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;width:90%;"> </td></tr><tr rowpos="2" class="FormData" id="tr_googleplus" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Google +</td><td class="DataTD">&nbsp; <input type="text" id="td_googleplus" readonly role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;width:90%;"> </td></tr><tr rowpos="2" class="FormData" id="tr_testimony" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Testimonio</td><td class="DataTD">&nbsp; <textarea class="form-control" readonly id="td_testimony" placeholder="Testimonio!!!!"></textarea> </td></tr><tr rowpos="2" class="FormData" id="tr_active" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Activo</td><td class="DataTD">&nbsp; <input type="checkbox" value="Yes" offval="No" id="td_active" role="checkbox" class="FormElement ace ace-switch ace-switch-5"> <span class="lbl" style="margin-bottom:2px;margin-top:5px;"> </span> </td></tr><tr rowpos="2" class="FormData" id="tr_privacy" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Datos Perso.</td><td class="DataTD">&nbsp; <input type="checkbox" value="Yes" offval="No" id="td_privacy" role="checkbox" class="FormElement ace ace-switch ace-switch-5"> <span class="lbl" style="margin-bottom:2px;margin-top:5px;"> </span> </td></tr></tbody> </table> </form>' );

        $.ajax({
            url : '/administrator/testimony/search/',
            type : 'post',
            data : { 'id': parseInt($.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(2)") ).text()))},
            async : true,
            beforeSend: function(xhr, settings) {
              $.ajaxSettings.beforeSend(xhr, settings);
            },
            success: function(data) {
                showdata( data );
            },
            error: function (XMLHttpRequest, estado, errorS) {
                var error = eval("(" + XMLHttpRequest.responseText + ")");
                console.log(error.Message);
                console.log(estado);
                console.log(errorS);
            },
            complete: function (jqXHR, estado) {

            }
        });
        e.preventDefault();
    });

    $( document ).on( 'click', 'i.fa-search-plus.bigger-120', function(e) {
        $( "#dialog-message" ).append( '<form name="FormPost" id="FrmGrid_grid-table" class="FormGrid" onsubmit="return false;" style="width:auto;overflow:auto;position:relative;height:auto;"> <table id="TblGrid_grid-table" class="EditTable" cellspacing="0" cellpadding="0" border="0" style="width:100%;"> <tbody> <tr rowpos="1" class="FormData" id="tr_id" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">ID</td><td class="DataTD">&nbsp; <input type="text" id="td_id" name="td_id" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;width:90%;"> </td></tr><tr rowpos="2" class="FormData" id="tr_name" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Nombre</td><td class="DataTD">&nbsp; <input type="text" id="td_name" readonly role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;width:90%;"> </td></tr><tr rowpos="2" class="FormData" id="tr_profession" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Profesión</td><td class="DataTD">&nbsp; <input type="text" id="td_profession" readonly role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;width:90%;"> </td></tr><tr rowpos="2" class="FormData" id="tr_expression" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Expresión</td><td class="DataTD">&nbsp; <input type="text" id="td_expression" readonly role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;width:90%;"> </td></tr><tr rowpos="2" class="FormData" id="tr_email" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Email</td><td class="DataTD">&nbsp; <input type="text" id="td_email" readonly role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;width:90%;"> </td></tr><tr rowpos="2" class="FormData" id="tr_facebook" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Facebook</td><td class="DataTD">&nbsp; <input type="text" id="td_facebook" readonly role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;width:90%;"> </td></tr><tr rowpos="2" class="FormData" id="tr_twitter" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Twitter</td><td class="DataTD">&nbsp; <input type="text" id="td_twitter" readonly role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;width:90%;"> </td></tr><tr rowpos="2" class="FormData" id="tr_googleplus" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Google +</td><td class="DataTD">&nbsp; <input type="text" id="td_googleplus" readonly role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;width:90%;"> </td></tr><tr rowpos="2" class="FormData" id="tr_testimony" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Testimonio</td><td class="DataTD">&nbsp; <textarea class="form-control" readonly id="td_testimony" placeholder="Testimonio!!!!"></textarea> </td></tr><tr rowpos="2" class="FormData" id="tr_active" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Activo</td><td class="DataTD">&nbsp; <input type="checkbox" value="Yes" offval="No" id="td_active" role="checkbox" class="FormElement ace ace-switch ace-switch-5"> <span class="lbl" style="margin-bottom:2px;margin-top:5px;"> </span> </td></tr><tr rowpos="2" class="FormData" id="tr_privacy" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Datos Perso.</td><td class="DataTD">&nbsp; <input type="checkbox" value="Yes" offval="No" id="td_privacy" role="checkbox" class="FormElement ace ace-switch ace-switch-5"> <span class="lbl" style="margin-bottom:2px;margin-top:5px;"> </span> </td></tr></tbody> </table> </form>' );

        $.ajax({
            url : '/administrator/testimony/search/',
            type : 'post',
            data : { 'id': parseInt($.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(2)") ).text()))},
            async : true,
            beforeSend: function(xhr, settings) {
              $.ajaxSettings.beforeSend(xhr, settings);
            },
            success: function(data) {
                showdata( data );
            },
            error: function (XMLHttpRequest, estado, errorS) {
                var error = eval("(" + XMLHttpRequest.responseText + ")");
                console.log(error.Message);
                console.log(estado);
                console.log(errorS);
            },
            complete: function (jqXHR, estado) {

            }
        });
        e.preventDefault();
    });

    $( " button[name='cancelar'] " ).click( function() {
        $( '.has-error' ).removeClass( 'has-error' );
        $( '#avatarimage' ).prop( 'src','/static/img/image.png' );
        $( "form[name='form-new-testimony']" )[0].reset();
        $( '.form-modify' ).toggle( "slow" );
        $( '.form-search' ).toggle( "slow" );
    });

    $( document ).on('change', "input[type='file']", function(e) {
        mostrarImagen(this);
    });

    $(document).on( 'submit' , "form[name='form-new-testimony']" ,function () {
        $( '.load' ).removeClass( 'hide' );
        var formData = new FormData( $( "form[name='form-new-testimony']" )[0] );
        if( validateblank() ) {
            NotificationWarning( 'Advertencia!', 'Error!!! Aun existen campos requeridos sin completar.' );
        } else {
            $.ajax({
                url : '/administrator/testimony/update/',
                type : 'post',
                data : formData,
                async : true,
                contentType: false,
                processData: false,
                success: function(data) {
                    if( data.status === 'False' ) {
                        NotificationError( 'Advertencia!', 'Error!!! '+ data.message +'' );
                    } else if( data.status === 'True' ) {
                      $( '#sample-table-2 tbody tr[name=' + data.id + '] td:nth-child(3)' ).text( data.name );
                      $( '#sample-table-2 tbody tr[name=' + data.id + '] td:nth-child(4)' ).text( data.profession );
                      $( '#sample-table-2 tbody tr[name=' + data.id + '] td:nth-child(6)' ).text( data.email );
                      if( data.active.toString() == 'true' ) {
                          $( '#sample-table-2 tbody tr[name=' + data.id + '] td:nth-child(5)' ).empty().append( '<span class="label label-sm label-info arrowed arrowed-righ">Activo</span>' );
                      } else {
                          $( '#sample-table-2 tbody tr[name=' + data.id + '] td:nth-child(5)' ).empty().append( '<span class="label label-sm label-warning arrowed arrowed-righ">Inactivo</span>' );
                      }
                        cleardata();
                        NotificationSuccess( 'Mensaje!', 'Excelente!!! '+ data.message +'' );
                        $( '.form-modify' ).toggle( "slow" );
                        $( '.form-search' ).toggle( "slow" );
                    }
                },
                error: function (XMLHttpRequest, estado, errorS) {
                    var error = eval("(" + XMLHttpRequest.responseText + ")");
                    console.log(error.Message);
                    console.log(estado);
                    console.log(errorS);
                },
                complete: function (jqXHR, estado) {

                }
            });
        }
        $( '.load' ).addClass( 'hide' );
        return false;
    });

    $( document ).on( 'click', 'i.fa-pencil.bigger-130', function(e) {

      $.ajax({
          url : '/administrator/testimony/search/',
          type : 'post',
          data : { 'id': parseInt($.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(2)") ).text()))},
          async : true,
          beforeSend: function(xhr, settings) {
            $.ajaxSettings.beforeSend(xhr, settings);
          },
          success: function(data) {
            if( data.status === 'False' ) {
                NotificationError( 'Advertencia!', 'Error!!! '+ data.message +'' );
            } else if( data.status === 'True' ) {
              $( 'input[name="id"]' ).val( data.id );
              $( 'input[name="name"]' ).val( data.name );
              $( 'input[name="profession"]' ).val( data.profession );
              $( 'input[name="expression"]' ).val( data.expression );
              $( 'input[name="email"]' ).val( data.email );
              $( 'input[name="facebook"]' ).val( data.facebook );
              $( 'input[name="twitter"]' ).val( data.twitter );
              $( 'input[name="googleplus"]' ).val( data.googlePlus );
              $( 'textarea[name="testimony"]' ).val( data.testimony );
              if( data.active == true ){
                $( 'input[name="active"]' ).prop( "checked" , "true" );
              }
              if( data.privacy == true ){
                $( 'input[name="viewcontact"]' ).prop( "checked" , "true" );
              }
              if( data.photo != 'False') {
                  $( 'img[name="avatarimage"]' ).prop( 'src', '/media/' + data.photo );
              }
            }
            $( '.form-modify' ).toggle( "slow" );
            $( '.form-search' ).toggle( "slow" );
          },
          error: function (XMLHttpRequest, estado, errorS) {
              var error = eval("(" + XMLHttpRequest.responseText + ")");
              console.log(error.Message);
              console.log(estado);
              console.log(errorS);
          },
          complete: function (jqXHR, estado) {

          }
      });
      e.preventDefault();
    });

    $( document ).on( 'click', 'i.fa-pencil.bigger-120', function(e) {

      $.ajax({
          url : '/administrator/testimony/search/',
          type : 'post',
          data : { 'id': parseInt($.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(2)") ).text()))},
          async : true,
          beforeSend: function(xhr, settings) {
            $.ajaxSettings.beforeSend(xhr, settings);
          },
          success: function(data) {
            if( data.status === 'False' ) {
                NotificationError( 'Advertencia!', 'Error!!! '+ data.message +'' );
            } else if( data.status === 'True' ) {
              $( 'input[name="id"]' ).val( data.id );
              $( 'input[name="name"]' ).val( data.name );
              $( 'input[name="profession"]' ).val( data.profession );
              $( 'input[name="expression"]' ).val( data.expression );
              $( 'input[name="email"]' ).val( data.email );
              $( 'input[name="facebook"]' ).val( data.facebook );
              $( 'input[name="twitter"]' ).val( data.twitter );
              $( 'input[name="googleplus"]' ).val( data.googlePlus );
              $( 'textarea[name="testimony"]' ).val( data.testimony );
              if( data.active == true ){
                $( 'input[name="active"]' ).prop( "checked" , "true" );
              }
              if( data.privacy == true ){
                $( 'input[name="viewcontact"]' ).prop( "checked" , "true" );
              }
              $( 'img[name="avatarimage"]' ).prop( 'src', '/media/' + data.photo );
            }
            $( '.form-modify' ).toggle( "slow" );
            $( '.form-search' ).toggle( "slow" );
          },
          error: function (XMLHttpRequest, estado, errorS) {
              var error = eval("(" + XMLHttpRequest.responseText + ")");
              console.log(error.Message);
              console.log(estado);
              console.log(errorS);
          },
          complete: function (jqXHR, estado) {

          }
      });
      e.preventDefault();
    });

    $( document ).on( 'click', 'i.fa-trash-o.bigger-130', function(e) {
      $( "#dialog-message" ).append( '<div><h5 class="center">¿Desea eliminar este registro?</h5></div>' );
      var row = parseInt($.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(2)") ).text()));
      var dialog = $( "#dialog-message" ).removeClass('hide').dialog({
          modal: true,
          width : 350,
          resizable : false,
          title: "<div class='widget-header widget-header-small'><h4 class='smaller'><i class='ace-icon fa fa-check'></i> Eliminar Testimonio</h4></div>",
          title_html: true,
          buttons: [
            {
                text: "Si",
                "class" : "btn btn-success btn-xs",
                click: function() {
                  $.ajax({
                      url : '/administrator/testimony/delete/',
                      type : 'post',
                      data : { 'id': row },
                      async : true,
                      beforeSend: function(xhr, settings) {
                        $.ajaxSettings.beforeSend(xhr, settings);
                      },
                      success: function(data) {
                        if( data.status === 'False' ) {
                            NotificationError( 'Advertencia!', 'Error!!! '+ data.message +'' );
                        } else if( data.status === 'True' ) {
                            $("tr[name='"+row+"']").remove();
                            NotificationSuccess( 'Mensaje!', 'Registro eliminado satisfactoriamente.' );
                        }
                      },
                      error: function (XMLHttpRequest, estado, errorS) {
                          var error = eval("(" + XMLHttpRequest.responseText + ")");
                          console.log(error.Message);
                          console.log(estado);
                          console.log(errorS);
                      },
                      complete: function (jqXHR, estado) {
                      }
                  });
                  $( this ).dialog( "close" );
                  e.preventDefault();
                }
            },
            {
                text: "Cancelar",
                "class" : "btn btn-primary btn-xs",
                click: function() {
                    $( this ).dialog( "close" );
                }
            }
          ],
          close: function() {
              $( '#dialog-message' ).empty().addClass( 'hide' );
          }
      });
    });

    $( document ).on( 'click', 'i.fa-trash-o.bigger-120', function(e) {
      $( "#dialog-message" ).append( '<div><h5 class="center">¿Desea eliminar este registro?</h5></div>' );
      var row = parseInt($.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(2)") ).text()));
      var dialog = $( "#dialog-message" ).removeClass('hide').dialog({
          modal: true,
          width : 350,
          resizable : false,
          title: "<div class='widget-header widget-header-small'><h4 class='smaller'><i class='ace-icon fa fa-check'></i> Eliminar Testimonio</h4></div>",
          title_html: true,
          buttons: [
            {
                text: "Si",
                "class" : "btn btn-success btn-xs",
                click: function() {
                  $.ajax({
                      url : '/administrator/testimony/delete/',
                      type : 'post',
                      data : { 'id': row },
                      async : true,
                      beforeSend: function(xhr, settings) {
                        $.ajaxSettings.beforeSend(xhr, settings);
                      },
                      success: function(data) {
                        if( data.status === 'False' ) {
                            NotificationError( 'Advertencia!', 'Error!!! '+ data.message +'' );
                        } else if( data.status === 'True' ) {
                            $("tr[name='"+row+"']").remove();
                            NotificationSuccess( 'Mensaje!', 'Registro eliminado satisfactoriamente.' );
                        }
                      },
                      error: function (XMLHttpRequest, estado, errorS) {
                          var error = eval("(" + XMLHttpRequest.responseText + ")");
                          console.log(error.Message);
                          console.log(estado);
                          console.log(errorS);
                      },
                      complete: function (jqXHR, estado) {
                      }
                  });
                  $( this ).dialog( "close" );
                  e.preventDefault();
                }
            },
            {
                text: "Cancelar",
                "class" : "btn btn-primary btn-xs",
                click: function() {
                    $( this ).dialog( "close" );
                }
            }
          ],
          close: function() {
              $( '#dialog-message' ).empty().addClass( 'hide' );
          }
      });
    });

});

function NotificationSuccess(title, message) {
    $.gritter.removeAll();
    var unique_id = $.gritter.add({
        title: title,
        text: message,
        sticky: true,
        time: '',
        class_name: 'gritter-success gritter-center'
    });
}

function NotificationWarning(title, message) {
    $.gritter.removeAll();
    var unique_id = $.gritter.add({
        title: title,
        text: message,
        sticky: true,
        time: '',
        class_name: 'gritter-warning gritter-center'
    });
}

function NotificationError(title, message) {
    $.gritter.removeAll();
    var unique_id = $.gritter.add({
        title: title,
        text: message,
        sticky: true,
        time: '',
        class_name: 'gritter-error gritter-center'
    });
}

function validateblank() {
    var validate = false;
    $(" input.required, textarea ").each(function(){
        if( $( this ).val() === '' ) {
            validate = true;
            $( this ).parent().parent().addClass('has-error');
        }
    });
    return validate;
}

function cleardata() {
    $( '.has-error' ).removeClass( 'has-error' );
    $( '#avatarimage' ).prop( 'src','/static/img/image.png' );
    $fileupload = $( "input[type='file']" );
    $fileupload.replaceWith($fileupload.clone(true));
    $( " input[type='text'], input[type='email'], textarea " ).each( function(){
        $( this ).val( '' );
    });
    $( " input[type='checkbox'] " ).each( function( i, item ){
        this.checked = item.defaultChecked;
    });
}

function mostrarImagen(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $( '#avatarimage' ).attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

function showdata(data) {
  if( data.status === 'False' ) {
      NotificationError( 'Advertencia!', 'Error!!! '+ data.message +'' );
  } else if( data.status === 'True' ) {
    var dialog = $( "#dialog-message" ).removeClass('hide').dialog({
        modal: true,
        width : 350,
        resizable : false,
        title: "<div class='widget-header widget-header-small'><h4 class='smaller'><i class='ace-icon fa fa-check'></i> Datos del Testimonio</h4></div>",
        title_html: true,
        buttons: [
            {
                text: "OK",
                "class" : "btn btn-primary btn-xs",
                click: function() {
                    $( this ).dialog( "close" );
                }
            }
        ],
        close: function() {
            $( '#dialog-message' ).empty().addClass( 'hide' );
        }
    });
    $( '#td_name' ).val( data.name );
    $( '#td_profession' ).val( data.profession );
    $( '#td_expression' ).val( data.expression );
    $( '#td_email' ).val( data.email );
    $( '#td_facebook' ).val( data.facebook );
    $( '#td_twitter' ).val( data.twitter );
    $( '#td_googleplus' ).val( data.googlePlus );
    $( '#td_testimony' ).val( data.testimony );
    if( data.active == true ){
      $( '#td_active' ).prop( "checked" , "true" );
    }
    if( data.privacy == true ){
      $( '#td_privacy' ).prop( "checked" , "true" );
    }
  }
}
