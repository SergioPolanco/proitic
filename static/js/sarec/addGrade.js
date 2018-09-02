$(document).ready(load)

function load(){
  $( "[href='/administrator/graduationWork/addGrade/']" ).parent().addClass('active').parent().addClass('open');
  $( "[href='/administrator/graduationWork/addGrade/']" ).parent().parent().parent().addClass('active open hsub');
  $( "[href='/administrator/graduationWork/addGrade/']" ).parent().parent().parent().parent().parent().addClass('active open hsub');
  $('.date-picker').datepicker({
					autoclose: true,
					todayHighlight: true,
          dateFormat: 'yy-mm-dd'
	});
  $( '.chosen-select' ).chosen({
      allow_single_deselect:true
  });

  $("#file_grade").on("change", function(e){
    var filename = e.target.files[0].name;
    $("#result_file_grade").html(filename);
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

  $("#form-nuevo-grado").bootstrapValidator({
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
    var formData = new FormData( $( "form[name='form-nuevo-grado']" )[0] );
    formData.append("txtTutor", $(".chosen-select").val());
    formData.append('descripcion', $('#trumbowyg-demo').val());
      $.ajax({
          url : '/administrator/graduationWork/insertGrade/',
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
