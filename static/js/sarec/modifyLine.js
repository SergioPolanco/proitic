$(document).ready(load)

function load(){
  $( "[href='/administrator/investigationLines/modify/']" ).parent().addClass('active').parent().addClass('open');
  $( "[href='/administrator/investigationLines/modify/']" ).parent().parent().parent().addClass('active open hsub');
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
         $('#txtDescripcion')
         .trumbowyg(formTbwOptions)
         .on('dblclick', function(){
             $(this).trumbowyg(formTbwOptions);
         });


      // Demo switch
      var $demoTextarea = $('#txtDescripcion');
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
  $('#sample-table-2').dataTable( {
      bAutoWidth: false,
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
  $(".ace-icon.fa.fa-pencil.bigger-130").on('click', function(){
    var idLine= $.trim($($(this).parent().parent().parent().parent().children(":nth-child(1)")).text());
    $("#idLine").val(idLine);
    var formData = new FormData( $( "form[name='form-id-line']" )[0] );

    $.ajax({
            url : '/administrator/investigationLines/view/',
            type : 'post',
            data : formData,
            async : true,
            contentType: false,
            processData: false,
            success: function(data) {
              if(data.status == '3'){
                $("#idFormLine").val(data.id);
                $("#txtTitulo").val(data.titulo);
                $('#txtDescripcion').trumbowyg('html', data.descripcion);
                //$("#txtDescripcion").val(data.descripcion);
                $("#div-Form").toggle( "slow" );
              }else {

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
  });

  $("#btnCancelar").on('click',function(){
    $("#div-Form").toggle( "slow" );

  });

  $(document).on('submit', "form[name='form-modificar-linea']", function() {

    var formData = new FormData( $( "form[name='form-modificar-linea']" )[0] );
    $.ajax({
            url : '/administrator/investigationLines/update/',
            type : 'post',
            data : formData,
            async : true,
            contentType: false,
            processData: false,
            success: function(data) {
              if(data.status == '3'){
                NotificationSuccess( 'Mensaje!', 'Excelente!!! '+ data.message +'' );
                $("#div-Form").toggle( "slow" );
                location.reload();
              }
              if(data.status == '2'){
                NotificationError( 'Advertencia!', 'Error!!! '+ data.message +'' );
              }
              if(data.status == '1'){
                NotificationError( 'Advertencia!', 'Error!!! '+ data.message +'' );
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
        return false;
  });
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
