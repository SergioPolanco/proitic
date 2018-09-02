
$(document).ready(function() {
      $( "[href='/administrator/blog/category/list/']" ).parent().addClass('active').parent().addClass('open');

      $( '.chosen-select' ).chosen({
          allow_single_deselect:true
      });

    $('#sample-table-2').dataTable( {
        bAutoWidth: false,
        "aoColumns": [ { "bSortable": false }, null ,null,null ,null, null,
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

    $('#sample-table-2_info').attr('style','display:inline;margin-left:20px;').parent().append('<button id="btn-add" class="btn btn-warning btn-xs pull-left" style="display:inline-block;"><i class="ace-icon fa fa-plus bigger-110 icon-only"></i></button>');

    $.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
        _title: function(title) {
            var $title = this.options.title || '&nbsp;'
            if( ("title_html" in this.options) && this.options.title_html == true )
                title.html($title);
            else title.text($title);
        }
    }));

    $( document ).on( 'click', '#btn-add',function(){
      var dialog = $( "#dialog" ).removeClass('hide').dialog({
          modal: true,
          height : 320,
          title: "<div class='widget-header widget-header-small'><h4 class='smaller'><i class='ace-icon fa fa-check'></i> Agregar Categoría</h4></div>",
          title_html: true,
          close: function() {
              cleardata();
              $( '#dialog' ).addClass( 'hide' );
          }
      });
  });

    $(document).on( 'submit' , "form[name='form-insert']" ,function () {
      if( validateblank() ) {
          NotificationWarning( 'Advertencia!', 'Error!!! Aun existen campos requeridos sin completar.' );
      } else {
        var formData = new FormData( $( "form[name='form-insert']" )[0] );
        $.ajax({
            url : '/administrator/blog/category/insert/',
            type : 'post',
            data : formData,
            async : true,
            contentType: false,
            processData: false,
            success: function(data) {
              if( data.status === 'False' ) {
                  NotificationError( 'Advertencia!', 'Error!!! '+ data.message +'' );
              } else if( data.status === 'True' ) {
                cleardata();
                if( data.active.toString() == 'true' ) {
                    $( '#sample-table-2 tbody').append('<tr role="row" class="odd" name="'+ data.id +'"><td class="center"><label class="position-relative"><input type="checkbox" class="ace"><span class="lbl"></span></label></td><td class="hide">'+ data.id +'</td><td>'+ data.category +'</td><td>'+ data.name +'</td><td><span class="label label-sm label-info arrowed arrowed-righ">Activo</span></td><td><div class="action-buttons"><a class="green" href="#"><i class="ace-icon fa fa-pencil bigger-130"></i></a></div></td></tr>');
                } else {
                    $( '#sample-table-2 tbody').append('<tr role="row" class="odd" name="'+ data.id +'"><td class="center"><label class="position-relative"><input type="checkbox" class="ace"><span class="lbl"></span></label></td><td class="hide">'+ data.id +'</td><td>'+ data.category +'</td><td>'+ data.name +'</td><td><span class="label label-sm label-warning arrowed arrowed-righ">Inactivo</span></td><td><div class="action-buttons"><a class="green" href="#"><i class="ace-icon fa fa-pencil bigger-130"></i></a></div></td></tr>');
                }
                NotificationSuccess( 'Mensaje!', 'Excelente!!! '+ data.message +'' );
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
      return false;
    });

    $(document).on( 'submit' , "form[name='form-update']" ,function () {
      if( validateblank2() ) {
          NotificationWarning( 'Advertencia!', 'Error!!! Aun existen campos requeridos sin completar.' );
      } else {
        var formData = new FormData( $( "form[name='form-update']" )[0] );
        $.ajax({
            url : '/administrator/blog/category/modify/',
            type : 'post',
            data : formData,
            async : true,
            contentType: false,
            processData: false,
            success: function(data) {
              if( data.status === 'False' ) {
                  NotificationError( 'Advertencia!', 'Error!!! '+ data.message +'' );
              } else if( data.status === 'True' ) {
                $( '#sample-table-2 tbody tr[name=' + data.id + '] td:nth-child(5)' ).text( data.name );
                $( '#sample-table-2 tbody tr[name=' + data.id + '] td:nth-child(4)' ).text( data.category );
                $( '#sample-table-2 tbody tr[name=' + data.id + '] td:nth-child(3)' ).text( data.categoryid );
                if( data.active.toString() == 'true' ) {
                    $( '#sample-table-2 tbody tr[name=' + data.id + '] td:nth-child(6)' ).empty().append( '<span class="label label-sm label-info arrowed arrowed-righ">Activo</span>' );
                } else {
                    $( '#sample-table-2 tbody tr[name=' + data.id + '] td:nth-child(6)' ).empty().append( '<span class="label label-sm label-warning arrowed arrowed-righ">Inactivo</span>' );
                }
                  NotificationSuccess( 'Mensaje!', 'Excelente!!! '+ data.message +'' );
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
      return false;
    });


    $(document).on( 'click' , "#btn-close" ,function () {
      $('#result').text('');
      $('#url').val('');
      $('#url').hide();
      var input = $("#file-7");
      input.replaceWith(input.val('').clone(true));
    });

    $( document ).on( 'click', 'i.fa-pencil.bigger-130', function(e) {
      var dialog = $( "#dialog2" ).removeClass('hide').dialog({
          modal: true,
          height : 320,
          title: "<div class='widget-header widget-header-small'><h4 class='smaller'><i class='ace-icon fa fa-check'></i> Agregar Categoría</h4></div>",
          title_html: true,
          close: function() {
              cleardata();
              $( '#dialog' ).addClass( 'hide' );
          }
      });
      $( 'input[name="nombre2"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(5)") ).text()) );
      $('select[name="category2"]').val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(3)") ).text()) ).trigger("chosen:updated");
      $( 'input[name="id"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(2)") ).text()) );
      if( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(6)") ).text()) == 'Activo') {
          $( 'input[name="active2"]' ).prop( "checked" , "true" );
      }
      e.preventDefault();
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

function validateblank(){
  var response = false;
  if( $('input[name="nombre"]').val() === '' ) {
    response = true;
  }
  if( $('select[name="category"]').val() === '' ) {
    response = true;
  }
  return response;
}
function validateblank2(){
  var response = false;
  if( $('input[name="nombre2"]').val() === '' ) {
    response = true;
  }
  if( $('select[name="category2"]').val() === '' ) {
    response = true;
  }
  return response;
}

function cleardata(){
  $('input[name="nombre"]').val('');
  $('input[name="active"]').prop('checked', true);
  $('select[name="category2"]').val('').trigger("chosen:updated");
  $('select[name="category"]').val('').trigger("chosen:updated");
  $('input[name="nombre2"]').val('');
  $('input[name="active2"]').prop('checked', false);
}
