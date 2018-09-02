$(document).ready(function() {
    var configurations = {
      btnsDef: {
        image: {
          dropdown: ['insertImage', 'upload', 'noEmbed'],
          ico: 'insertImage'
        }
      },
      lang: 'es',
      resetCss: true,
      removeformatPasted: false,
      btns: [
        ['viewHTML'],
        ['undo', 'redo'],
        ['formatting'],
        'btnGrp-design',
        ['link'],
        ['image'],
        'btnGrp-justify',
        'btnGrp-lists',
        ['foreColor', 'backColor'],
        ['preformatted'],
        ['horizontalRule'],
        ['removeformat'],
        ['fullscreen']
      ],
      plugins: {
        upload: {
          serverPath: 'https://api.imgur.com/3/image',
          fileFieldName: 'image',
          headers: {
            'Authorization': 'Client-ID 9e57cb1c4791cea'
          },
          urlPropertyName: 'data.link'
        }
      }
    };
    $('#trumbowyg-demo').trumbowyg('destroy');
    $('#trumbowyg-demo').trumbowyg(configurations);
    $( "[href='/administrator/cooperation/']" ).parent().addClass('active').parent().addClass('open');

    $.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
        _title: function(title) {
            var $title = this.options.title || '&nbsp;'
            if( ("title_html" in this.options) && this.options.title_html == true )
                title.html($title);
            else title.text($title);
        }
    }));

    $(document).on( 'submit' , "form[name='form-new-cooperation']" ,function () {
        $( '.load' ).removeClass( 'hide' );
        var formData = new FormData( $( "form[name='form-new-cooperation']" )[0] );
        $.ajax({
            url : '/administrator/cooperation/update/',
            type : 'post',
            data : formData,
            async : true,
            contentType: false,
            processData: false,
            success: function(data) {
              if( data.status === 'False' ) {
                  NotificationError( 'Advertencia!', 'Error!!! '+ data.message +'' );
              } else if( data.status === 'True' ) {
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
        $( '.load' ).addClass( 'hide' );
        return false;
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
