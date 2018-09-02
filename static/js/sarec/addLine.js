$(document).ready(load)

function load(){
  $( "[href='/administrator/investigationLines/add/']" ).parent().addClass('active').parent().addClass('open');
  $( "[href='/administrator/investigationLines/add/']" ).parent().parent().parent().addClass('active open hsub');

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
  $(document).on( 'submit' , "form[name='form-nueva-linea']" ,function () {
    var formData = new FormData( $( "form[name='form-nueva-linea']" )[0] );
        formData.append("cmbCuentaUsuario", $(".chosen-select").val());
        $.ajax({
            url : '/administrator/investigationLines/insert/',
            type : 'post',
            data : formData,
            async : true,
            contentType: false,
            processData: false,
            success: function(data) {
              if(data.status == 'True'){
                NotificationSuccess( 'Mensaje!', 'Excelente!!! '+ data.message +'' );

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
