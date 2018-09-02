$(document).ready(load)

function load(){
  $( "[href='/administrator/graduationWork/modifyPosGrade/']" ).parent().addClass('active').parent().addClass('open');
  $( "[href='/administrator/graduationWork/modifyPosGrade/']" ).parent().parent().parent().addClass('active open hsub');
  $( "[href='/administrator/graduationWork/modifyPosGrade/']" ).parent().parent().parent().parent().parent().addClass('active open hsub');

  $('.date-picker').datepicker({
					autoclose: true,
					todayHighlight: true,
          dateFormat: 'yy-mm-dd'
	});
  $( '.chosen-select' ).chosen({
      allow_single_deselect:true
  });
  $("#file_posgrade_modify").on("change", function(e){
    var filename = e.target.files[0].name;
    $("#result_file_posgrade_modify").html(filename);
  });

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
         $('#trumbowyg-demo')
         .trumbowyg(formTbwOptions)
         .on('dblclick', function(){
             $(this).trumbowyg(formTbwOptions);
         });


      // Demo switch
      var $demoTextarea = $('#trumbowyg-demo');
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

  $(".ace-icon.fa.fa-pencil.bigger-130").on('click', function(){
    var idPosgrade= $.trim($($(this).parent().parent().parent().parent().children(":nth-child(1)")).text());
    $("#idPosgrade").val(idPosgrade);
    var formData = new FormData( $( "form[name='form-id-posgrade']" )[0] );

    $.ajax({
            url : '/administrator/graduationWork/viewPosGrade/',
            type : 'post',
            data : formData,
            async : true,
            contentType: false,
            processData: false,
            success: function(data) {
              if(data.status == 'True'){
                $("#idPosGradeForm").val(data.id);
                $("#txtEstudiantes").val(data.estudiantes);
                $('.chosen-select option:contains('+ $.trim(data.autor) +')').prop('selected','selected');
                $('.chosen-select').trigger('chosen:updated');
                $("#txtTitulo").val(data.titulo);
                $("#txtFecha").val(data.fechaDefensa);
                $("#result_file_posgrade_modify").html(data.filename);
                $('#trumbowyg-demo').trumbowyg('html', data.descripcion);
                $("#div-Form").toggle( "slow" );
                $("#div-table").toggle( "slow" );
              }else {
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
  });
  $("#form-modificar-posgrado").bootstrapValidator({
    excluded: [':disabled'],
    fields:{
      txtEstudiantes:{
        validators:{
          notEmpty:{
            message: "Este campo es requerido"
          }
        }
      },
      txtTutor:{
        validators:{
          notEmpty:{
            message: "Este campo es requerido"
          }
        }
      },
      txtTitulo:{
        validators:{
          notEmpty:{
            message: "Este campo es requerido"
          }
        }
      },
      txtFecha:{
        validators:{
          notEmpty:{
            message: "Este campo es requerido"
          }
        }
      }
    }
  }).on('success.form.bv', function(e, data) {

    e.preventDefault();
    var formData = new FormData( $( "form[name='form-modificar-posgrado']" )[0] );
    formData.append("txtTutor", $(".chosen-select").val());
    formData.append('descripcion', $('#trumbowyg-demo').val());
      $.ajax({
          url : '/administrator/graduationWork/updatePosGrade/',
          type : 'post',
          data : formData,
          async : true,
          contentType: false,
          processData: false,
          success: function(data) {
            if(data.status == 'True'){
              NotificationSuccess( 'Mensaje!', 'Excelente!!! '+ data.message +'' );
              location.reload();
            }else {
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


	});

  $("#btnCancelar").on('click',function(){
    location.reload();

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
