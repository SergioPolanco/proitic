hljs.initHighlightingOnLoad();

(function ($) {
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

    // Languages continent switch
    var $continentNames = $('.continent-name');
    $continentNames.each(function() {
        $(this).parent().attr('data-height', $(this).parent().height());
    });
    $continentNames.click(function () {
        var $oldOpen = $('#languages').find('.col-list ul li[style]');
        $oldOpen.removeAttr('style');
        $(this).parent().css({
            height: $(this).parent().attr('data-height') + 'px'
        });
    });
    $continentNames.last().parent().css({
        height: $continentNames.last().parent().attr('data-height') + 'px'
    });

    // Add anchors
    $('.feature h3[id]').each(function () {
        $(this).after($('<a/>', {
            html: '<svg><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#trumbowyg-link"></use></svg>',
            'class': 'title-link',
            href: '#' + $(this).attr('id'),
            title: 'Permalink to ' + $(this).text()
        }));
    });

    // Toggle class on body to show/hide removed features
    $('#show-removed').click(function () {
        $('body').toggleClass('show-removed');
    });

    $('.link-to-removed').click(function () {
        $('body').addClass('show-removed');
    });
    if (window.location.hash.length > 1 && !$(window.location.hash).is(':visible')) {
        $('body').addClass('show-removed');
    }
})(jQuery);


$(document).ready(function() {
    $( "[href='/administrator/mastery/add/']" ).parent().addClass('active').parent().addClass('open');
    $( "[href='/administrator/mastery/add/']" ).parent().parent().parent().addClass('active open hsub');

    $.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
        _title: function(title) {
            var $title = this.options.title || '&nbsp;'
            if( ("title_html" in this.options) && this.options.title_html == true )
                title.html($title);
            else title.text($title);
        }
    }));

    $( " input[type='text'] " ).on( 'input' , function() {
        if( $( this ).val() === '' ) {
            $( this ).parent().parent().addClass('has-error');
        } else {
            $( this ).parent().parent().removeClass('has-error');
        }
    });

    $( " button[name='cancelar'] " ).click( function() {
        cleardata();
    });

    $(document).on( 'submit' , "form[name='form-new-history']" ,function () {
      if( validateblank() ) {
          NotificationWarning( 'Advertencia!', 'Error!!! Aun existen campos requeridos sin completar.' );
      } else {
        $( '.load' ).removeClass( 'hide' );
        var formData = new FormData( $( "form[name='form-new-history']" )[0] );
        $.ajax({
            url : '/administrator/mastery/insert/',
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

    $(document).on( 'submit' , "form[name='form-upload']" ,function () {
      if( document.getElementById("file-7").files.length == 0 ){
          return false;
      }
        var formData = new FormData( $( "form[name='form-upload']" )[0] );
        $.ajax({
            url : '/administrator/blog/upload/media/',
            type : 'post',
            data : formData,
            async : true,
            contentType: false,
            processData: false,
            beforeSend: function(xhr, settings) {
              $.ajaxSettings.beforeSend(xhr, settings);
            },
            success: function(data) {
              $('#url').show();
              $('#url').val(data.message);
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
    $(" #trumbowyg-demo, input[name='masteryname'] ").each(function(){
        if( $( this ).val() === '' ) {
            validate = true;
            $( this ).parent().parent().addClass('has-error');
        }
    });
    return validate;
}

function cleardata() {
    $(" #trumbowyg-demo ").val('');
    $(" input[name='masteryname']  ").val('');
    $( " .has-error " ).removeClass('has-error');
    $( ".trumbowyg-editor" ).empty();
}
