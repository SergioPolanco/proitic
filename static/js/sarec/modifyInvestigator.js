$(document).ready(load)

function load() {
  $( "[href='/administrator/investigator/modify/']" ).parent().addClass('active').parent().addClass('open');
  $( "[href='/administrator/investigator/modify/']" ).parent().parent().parent().addClass('active open hsub');

  $('.input-mask-phone').mask('(505) 9999-9999');
  $('.date-picker').datepicker({
          autoclose: true,
          todayHighlight: true,
          dateFormat: 'yy-mm-dd'
  });
  $( '.chosen-select' ).chosen({
      allow_single_deselect:true
  });
  if ($.trumbowyg) {
      var configurations = {
          core: {},
          autogrow: true,
          plugins: {
              btnsDef: {
                  // Customizables dropdowns
                  image: {
                      dropdown: ['insertImage', 'upload', 'base64', 'noEmbed'],
                      ico: 'insertImage'
                  }
              },
              btns: [
                  ['viewHTML'],
                  ['undo', 'redo'],
                  ['formatting'],
                  'btnGrp-design',
                  ['link'],
                  ['image'],
                  '|', 'foreColor', 'backColor',
                  'btnGrp-justify',
                  'btnGrp-lists',
                  ['foreColor', 'backColor'],
                  ['preformatted'],
                  ['horizontalRule'],
                  ['fullscreen']
              ]
          }
      };

      var formTbwOptions = {
             lang: 'es',
             closable: true,
             mobile: true,
             fixedBtnPane: true,
             fixedFullWidth: true,
             semantic: true,
             resetCss: true,
             autoAjustHeight: true,
             autogrow: true
         };
         $('#txtPresentacion')
         .trumbowyg(formTbwOptions)
         .on('dblclick', function(){
             $(this).trumbowyg(formTbwOptions);
         });


      // Demo switch
      var $demoTextarea = $('#txtPresentacion');
      $demoTextarea.trumbowyg();
      $('.demo-switcher .button').on('click', function () {
          var $current = $('.demo-switcher .current');
          $(this).parent().removeClass('current-' + $current.data('config'));
          $current.removeClass('current');
          $(this).addClass('current');
          $(this).parent().addClass('current-' + $(this).data('config'));
          $demoTextarea.trumbowyg('destroy');
          $demoTextarea.trumbowyg(configurations[$(this).data('config')]);
      });

      // Lang accordion
      $('#lang-list-view-full').on('click', function () {
          $('#lang-list-light').slideUp(100);
          $('#lang-list-full').slideDown(350);
      });
  }
 $('.chosen-select').val("2").trigger('chosen:updated');
  $('#sample-table-2').dataTable( {
      bAutoWidth: false,
      "aoColumns": [
                  null, null, null, null,null,null,null,null,null,null,null,null,null,null,
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

  $.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
      _title: function(title) {
          var $title = this.options.title || '&nbsp;'
          if( ("title_html" in this.options) && this.options.title_html == true )
              title.html($title);
          else title.text($title);
      }
  }));

  $( document ).on( 'click', 'i.fa-search-plus.bigger-130', function(e) {
      $( "#dialog-message" ).append( '<form name="FormPost" id="FrmGrid_grid-table" class="FormGrid" onsubmit="return false;" style="width:auto;overflow:auto;position:relative;height:auto;">\
        <table id="TblGrid_grid-table" class="EditTable" cellspacing="0" cellpadding="0" border="0" style="width:100%;">\
          <tbody>\
            <tr rowpos="1" class="FormData" id="tr_id" style="border-bottom: 1px dotted #E8E8E8; width:100%;">\
              <td class="CaptionTD">ID</td>\
              <td class="DataTD">&nbsp;\
                <input type="text" id="td_id" name="td_id" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;">\
              </td>\
            </tr>\
            <tr rowpos="2" class="FormData" id="tr_nombres" style="border-bottom: 1px dotted #E8E8E8; width:100%;">\
              <td class="CaptionTD">Nombres</td>\
              <td class="DataTD">&nbsp;\
                <input type="text" id="td_nombres" readonly name="td_nombres" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;">\
              </td>\
            </tr>\
            <tr rowpos="2" class="FormData" id="tr_apellidos" style="border-bottom: 1px dotted #E8E8E8; width:100%;">\
              <td class="CaptionTD">Apellidos</td>\
              <td class="DataTD">&nbsp;\
                <input type="text" id="td_apellidos" readonly name="td_apellidos" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;">\
              </td>\
            </tr>\
            <tr rowpos="2" class="FormData" id="tr_fechaNac" style="border-bottom: 1px dotted #E8E8E8; width:100%;">\
              <td class="CaptionTD">Fecha de Nacimiento</td>\
              <td class="DataTD">&nbsp;\
                <input type="text" id="td_fechaNac" readonly name="td_fechaNac" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;">\
              </td>\
            </tr>\
            <tr rowpos="2" class="FormData" id="tr_correo" style="border-bottom: 1px dotted #E8E8E8; width:100%;">\
              <td class="CaptionTD">Correo</td>\
              <td class="DataTD">&nbsp;\
                <input type="text" id="td_correo" readonly name="td_correo" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;">\
              </td>\
            </tr>\
            <tr rowpos="2" class="FormData" id="tr_telefono" style="border-bottom: 1px dotted #E8E8E8; width:100%;">\
              <td class="CaptionTD">Teléfono</td>\
              <td class="DataTD">&nbsp;\
                <input type="text" id="td_telefono" readonly name="td_telefono" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;">\
              </td>\
            </tr>\
            <tr rowpos="2" class="FormData" id="tr_direccion" style="border-bottom: 1px dotted #E8E8E8; width:100%;">\
              <td class="CaptionTD">Dirección</td>\
              <td class="DataTD">&nbsp;\
                <textarea name="td_direccion" id="td_direccion" role="textarea" readonly class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;" rows="5" cols="25"></textarea>\
              </td>\
            </tr>\
            <tr rowpos="2" class="FormData" id="tr_departamento" style="border-bottom: 1px dotted #E8E8E8; width:100%;">\
              <td class="CaptionTD">Departamento</td>\
              <td class="DataTD">&nbsp;\
                <input type="text" id="td_departamento" readonly name="td_departamento" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;">\
              </td>\
            <tr rowpos="2" class="FormData" id="tr_titulo" style="border-bottom: 1px dotted #E8E8E8; width:100%;">\
              <td class="CaptionTD">Título</td>\
              <td class="DataTD">&nbsp;\
                <input type="text" id="td_titulo" readonly name="td_titulo" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;">\
              </td>\
            </tr>\
            <tr rowpos="2" class="FormData" id="tr_activo" style="border-bottom: 1px dotted #E8E8E8; width:100%;">\
              <td class="CaptionTD">Activo</td>\
              <td class="DataTD">&nbsp;\
                <input type="checkbox" value="Yes" offval="No" id="is_activo" name="is_activo" role="checkbox" class="FormElement ace ace-switch ace-switch-5">\
                <span class="lbl" style="margin-bottom:2px;margin-top:5px;"></span>\
              </td>\
            </tr>\
            <tr rowpos="2" class="FormData" id="tr_cuentaUsuario" style="border-bottom: 1px dotted #E8E8E8; width:100%;">\
              <td class="CaptionTD">Cuenta de Usuario</td>\
              <td class="DataTD">&nbsp;\
                <input type="text" id="td_cuentaUsuario" readonly name="td_cuentaUsuario" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;">\
              </td>\
            </tr>\
          </tbody>\
        </table>\
      </form>' );

      $( 'input[name="td_nombres"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(2)") ).text()) );
      $( 'input[name="td_apellidos"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(3)") ).text()) );
      $( 'input[name="td_fechaNac"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(4)") ).text()) );
      $( 'input[name="td_correo"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(5)") ).text()) );
      $( 'input[name="td_telefono"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(6)") ).text()) );
      $( 'textarea[name="td_direccion"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(7)") ).text()) );
      $( 'input[name="td_departamento"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(8)") ).text()) );
      $( 'input[name="td_titulo"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(9)") ).text()) );

      if( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(11)") ).text()) == 'Activo') {
          $( '#is_activo' ).prop( "checked" , "true" );      }
      $( 'input[name="td_cuentaUsuario"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(14)") ).text()) );
      e.preventDefault();

      var dialog = $( "#dialog-message" ).removeClass('hide').dialog({
          modal: true,
          title: "<div class='widget-header widget-header-small'><h4 class='smaller'><i class='ace-icon fa fa-check'></i> Datos del Investigador</h4></div>",
          title_html: true,
          width:"40%",
          height:500,
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

  });

  $( document ).on( 'click', 'i.fa-search-plus.bigger-120', function(e) {
    $( "#dialog-message" ).append( '<form name="FormPost" id="FrmGrid_grid-table" class="FormGrid" onsubmit="return false;" style="width:100%;overflow:auto;position:relative;height:auto;">\
      <table id="TblGrid_grid-table" class="EditTable" cellspacing="0" cellpadding="0" border="0" style="width:100%;">\
        <tbody>\
          <tr rowpos="1" class="FormData" id="tr_id" style="border-bottom: 1px dotted #E8E8E8; width:100%;">\
            <td class="CaptionTD">ID</td>\
            <td class="DataTD">&nbsp;\
              <input type="text" id="td_id" name="td_id" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;">\
            </td>\
          </tr>\
          <tr rowpos="2" class="FormData" id="tr_nombres" style="border-bottom: 1px dotted #E8E8E8; width:100%;">\
            <td class="CaptionTD">Nombres</td>\
            <td class="DataTD">&nbsp;\
              <input type="text" id="td_nombres" readonly name="td_nombres" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;">\
            </td>\
          </tr>\
          <tr rowpos="2" class="FormData" id="tr_apellidos" style="border-bottom: 1px dotted #E8E8E8; width:100%;">\
            <td class="CaptionTD">Apellidos</td>\
            <td class="DataTD">&nbsp;\
              <input type="text" id="td_apellidos" readonly name="td_apellidos" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;">\
            </td>\
          </tr>\
          <tr rowpos="2" class="FormData" id="tr_fechaNac" style="border-bottom: 1px dotted #E8E8E8; width:100%;">\
            <td class="CaptionTD">Fecha de Nacimiento</td>\
            <td class="DataTD">&nbsp;\
              <input type="text" id="td_fechaNac" readonly name="td_fechaNac" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;">\
            </td>\
          </tr>\
          <tr rowpos="2" class="FormData" id="tr_correo" style="border-bottom: 1px dotted #E8E8E8; width:100%;">\
            <td class="CaptionTD">Correo</td>\
            <td class="DataTD">&nbsp;\
              <input type="text" id="td_correo" readonly name="td_correo" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;">\
            </td>\
          </tr>\
          <tr rowpos="2" class="FormData" id="tr_telefono" style="border-bottom: 1px dotted #E8E8E8; width:100%;">\
            <td class="CaptionTD">Teléfono</td>\
            <td class="DataTD">&nbsp;\
              <input type="text" id="td_telefono" readonly name="td_telefono" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;">\
            </td>\
          </tr>\
          <tr rowpos="2" class="FormData" id="tr_direccion" style="border-bottom: 1px dotted #E8E8E8; width:100%;">\
            <td class="CaptionTD">Dirección</td>\
            <td class="DataTD">&nbsp;\
              <textarea name="td_direccion" id="td_direccion" readonly class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;" rows="5" cols="25"></textarea>\
            </td>\
          </tr>\
          <tr rowpos="2" class="FormData" id="tr_departamento" style="border-bottom: 1px dotted #E8E8E8; width:100%;">\
            <td class="CaptionTD">Departamento</td>\
            <td class="DataTD">&nbsp;\
              <input type="text" id="td_departamento" readonly name="td_departamento" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;">\
            </td>\
          </tr>\
          <tr rowpos="2" class="FormData" id="tr_titulo" style="border-bottom: 1px dotted #E8E8E8; width:100%;">\
            <td class="CaptionTD">Título</td>\
            <td class="DataTD">&nbsp;\
              <input type="text" id="td_titulo" readonly name="td_titulo" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;">\
            </td>\
          </tr>\
          <tr rowpos="2" class="FormData" id="tr_activo" style="border-bottom: 1px dotted #E8E8E8; width:100%;">\
            <td class="CaptionTD">Activo</td>\
            <td class="DataTD">&nbsp;\
              <input type="checkbox" value="Yes" offval="No" id="is_activo" name="is_activo" role="checkbox" class="FormElement ace ace-switch ace-switch-5">\
              <span class="lbl" style="margin-bottom:2px;margin-top:5px;"></span>\
            </td>\
          </tr>\
          <tr rowpos="2" class="FormData" id="tr_cuentaUsuario" style="border-bottom: 1px dotted #E8E8E8; width:100%;">\
            <td class="CaptionTD">Cuenta de Usuario</td>\
            <td class="DataTD">&nbsp;\
              <input type="text" id="td_cuentaUsuario" readonly name="td_cuentaUsuario" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;">\
            </td>\
          </tr>\
        </tbody>\
      </table>\
    </form>' );

      $( 'input[name="td_nombres"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(2)") ).text()) );
      $( 'input[name="td_apellidos"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(3)") ).text()) );
      $( 'input[name="td_fechaNac"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(4)") ).text()) );
      $( 'input[name="td_correo"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(5)") ).text()) );
      $( 'input[name="td_telefono"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(6)") ).text()) );
      $( 'textarea[name="td_direccion"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(7)") ).text()) );
      $( 'input[name="td_departamento"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(8)") ).text()) );
      $( 'input[name="td_titulo"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(9)") ).text()) );
      if( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(11)") ).text()) == 'Activo') {
          $( '#is_activo' ).prop( "checked" , "true" );
      }
      $( 'input[name="td_cuentaUsuario"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(14)") ).text()) );
      e.preventDefault();
      var dialog = $( "#dialog-message" ).removeClass('hide').dialog({
          modal: true,
          title: "<div class='widget-header widget-header-small'><h4 class='smaller'><i class='ace-icon fa fa-check'></i> Datos del Usuario</h4></div>",
          title_html: true,
          width:"80%",
          height:500,
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

  });

  $( document ).on( 'click', 'i.fa-pencil.bigger-130', function(e) {
    $( 'input[name="txtId"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(1)") ).text()) );
    $( 'input[name="txtNombres"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(2)") ).text()) );
    $( 'input[name="txtApellidos"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(3)") ).text()) );
    $( 'input[name="txtFechaNac"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(4)") ).text()) );
    $( 'input[name="txtCorreo"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(5)") ).text()) );
    $( 'input[name="txtTelefono"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(6)") ).text()) );
    $( 'textarea[name="txtDireccion"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(7)") ).text()) );
    $( 'input[name="txtDepartamento"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(8)") ).text()) );
    $( 'input[name="txtTitulo"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(9)") ).text()) );
    $( '#avatarimage' ).prop( 'src', $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(10)") ).text()) );

    if( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(11)") ).text()) == 'Activo') {
        $( 'input[name="activo"]' ).prop( "checked" , "true" );
    }
    $('textarea[name="txtPresentacion"]').trumbowyg('html', $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(12)") ).text()));
    //$( 'textarea[name="txtPresentacion"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(15)") ).text()) );
    $('.chosen-select option:contains('+ $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(14)") ).text()) +')').prop('selected','selected');
    $('.chosen-select').trigger('chosen:updated');
    //var idU = parseInt($.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(16)") ).text())) ;
    //$('.chosen-select').val(idU).trigger('chosen:update');

      $( '#divModificarInvestigador' ).toggle( "slow" );
      $( '.form-search' ).toggle( "slow" );

  });

  $( " button[name='cancelar'] " ).click( function() {
      $( '.has-error' ).removeClass( 'has-error' );
      $( '#avatar' ).prop( 'src','/static/img/image.png' );
      limpiar();
      $( '#divModificarInvestigador' ).toggle( "slow" );
      $( '.form-search' ).toggle( "slow" );
  });

  $( document ).on('change', "input[type='file']", function(e) {
      mostrarImagen(this);
  });

  $(document).on( 'submit' , "form[name='form-modificar-investigador']" ,function (e) {
      e.preventDefault()
      
      $( '.load' ).removeClass( 'hide' );
      var formData = new FormData( $( "form[name='form-modificar-investigador']" )[0] );

      if(validarCampoVacios() != 0){
          NotificationWarning( 'Advertencia!', 'Error!!! Aun existen campos requeridos sin completar.' );
      }else {
        formData.append("cmbCuentaUsuario", $(".chosen-select").val());
        console.log(formData)
        $.ajax({
            url : '/administrator/investigator/investigatormodify/',
            type : 'put',
            data : formData,
            async : true,
            contentType: "application/json",
            success: function(data) {
                if( data.status === 'False' ) {
                    NotificationError( 'Advertencia!', 'Error!!! '+ data.message +'' );
                } else if( data.status === 'True' ) {
                    $( '#sample-table-2 tbody tr[name=' + data.key + '] td:nth-child(2)' ).text( data.nombres );
                    $( '#sample-table-2 tbody tr[name=' + data.key + '] td:nth-child(3)' ).text( data.apellidos );
                    $( '#sample-table-2 tbody tr[name=' + data.key + '] td:nth-child(4)' ).text( data.fechaNac );
                    $( '#sample-table-2 tbody tr[name=' + data.key + '] td:nth-child(5)' ).text( data.correo );
                    $( '#sample-table-2 tbody tr[name=' + data.key + '] td:nth-child(6)' ).text( data.telefono );
                    $( '#sample-table-2 tbody tr[name=' + data.key + '] td:nth-child(7)' ).text( data.direccion );
                    $( '#sample-table-2 tbody tr[name=' + data.key + '] td:nth-child(8)' ).text( data.departamento );
                    $( '#sample-table-2 tbody tr[name=' + data.key + '] td:nth-child(9)' ).text( data.titulo );
                    $( '#sample-table-2 tbody tr[name=' + data.key + '] td:nth-child(13)' ).text( data.fotoPerfil );


                    if( data.activo.toString() == 'true' ) {
                        $( '#sample-table-2 tbody tr[name=' + data.key + '] td:nth-child(14)' ).empty().append( '<span class="label label-sm label-info arrowed arrowed-righ">Activo</span>' );
                    } else {
                        $( '#sample-table-2 tbody tr[name=' + data.key + '] td:nth-child(14)' ).empty().append( '<span class="label label-sm label-warning arrowed arrowed-righ">Inactivo</span>' );
                    }
                    $( '#sample-table-2 tbody tr[name=' + data.key + '] td:nth-child(15)' ).text( data.presentacion );
                    $( '#sample-table-2 tbody tr[name=' + data.key + '] td:nth-child(16)' ).text( data.idCuenta );
                    $( '#sample-table-2 tbody tr[name=' + data.key + '] td:nth-child(17)' ).text( data.userName );
                    limpiar();
                    NotificationSuccess( 'Mensaje!', 'Excelente!!! '+ data.message +'' );
                    $( '#divModificarInvestigador' ).toggle( "slow" );
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
              console.log(estado);
              console.log(jqXHR);
            }
        });
      }

      $( '.load' ).addClass( 'hide' );
      
  });

}


function validarCampoVacios(){
  var band = 0;
  if ($("#txtNombres").val() == "") {
    $("#fgNombres").addClass("has-error");
    band++;
  }else {
    $("#fgNombres").removeClass("has-error");
  }

  if ($("#txtApellidos").val() == "") {
    $("#fgApellidos").addClass("has-error");
    band++;
  }else {
    $("#fgApellidos").removeClass("has-error");
  }

  if ($("#txtFechaNac").val() == "") {
    $("#fgFechaNac").addClass("has-error");
    band++;
  }else {
    $("#fgFechaNac").removeClass("has-error");
  }

  if ($("#txtCorreo").val() == "") {
    $("#fgCorreo").addClass("has-error");
    band++;
  }else {
    $("#fgCorreo").removeClass("has-error");
  }

  if ($("#txtTelefono").val() == "") {
    $("#fgTelefono").addClass("has-error");
    band++;
  }else {
    $("#fgTelefono").removeClass("has-error");
  }

  if ($("#txtDepartamento").val() == "") {
    $("#fgDepartamento").addClass("has-error");
    band++;
  }else {
    $("#fgDepartamento").removeClass("has-error");
  }

  if ($("#txtDireccion").val() == "") {
    $("#fgDireccion").addClass("has-error");
    band++;
  }else {
    $("#fgDireccion").removeClass("has-error");
  }

  if ($("#txtPresentacion").val() == "") {
    $("#fgPresentacion").addClass("has-error");
    band++;
  }else {
    $("#fgPresentacion").removeClass("has-error");
  }

  if ($("#txtTitulo").val() == "") {
    $("#fgTitulo").addClass("has-error");
    band++;
  }else {
    $("#fgTitulo").removeClass("has-error");
  }

  if($(".chosen-select").val() == ""){
    $("#fgCuentaUsuario").addClass("has-error");
    band++;;
  }else {
    $("#fgCuentaUsuario").removeClass("has-error");
  }
 return band;
}

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

function limpiar(){
  $( '#avatarimage' ).prop( 'src','/static/img/image.png' );
  $fileupload = $( "input[type='file']" );
  $fileupload.replaceWith($fileupload.clone(true));
  $('#form-modificar-investigador').each (function(){
    this.reset();
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
