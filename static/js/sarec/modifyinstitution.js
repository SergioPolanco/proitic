$(document).ready(function() {

    $( "[href='/administrator/cooperation/institution/modify/']" ).parent().addClass('active').parent().addClass('open');
    $( "[href='/administrator/cooperation/institution/modify/']" ).parent().parent().parent().addClass('active open hsub');
    $( "[href='/administrator/cooperation/institution/modify/']" ).parent().parent().parent().parent().parent().addClass('active open hsub');

    $('#sample-table-2').dataTable( {
        bAutoWidth: false,
        "aoColumns": [ { "bSortable": false }, null ,null,null,
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

    $( " input[type='text'] " ).on( 'input' , function() {
        if( $( this ).val() === '' ) {
            $( this ).parent().parent().addClass('has-error');
        } else {
            $( this ).parent().parent().removeClass('has-error');
        }
    });


    $( document ).on('change', "input[type='file']", function(e) {
        mostrarImagen(this);
    });

    $( " button[name='cancelar'] " ).click( function() {
        cleardata();
        $( '.form-modify' ).toggle( "slow" );
        $( '.form-search' ).toggle( "slow" );
    });

    $( document ).on( 'click', 'i.fa-pencil.bigger-130', function(e) {
        $.ajax({
            url : '/administrator/cooperation/institution/search/',
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
                  $( 'input[name="name"]' ).val( data.name );
                  $( 'input[name="id"]' ).val( data.id );
                  $('#trumbowyg-demo').trumbowyg('html', data.description);
                  $( '#avatarimage' ).prop( 'src', data.photo );
                  if( data.active == true ){
                    $( 'input[name="active"]' ).prop( "checked" , "true" );
                  }
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
        e.preventDefault();
    });

    $(document).on( 'submit' , "form[name='form-new-project']" ,function () {
        $( '.load' ).removeClass( 'hide' );
        var formData = new FormData( $( "form[name='form-new-project']" )[0] );
        if( validateblank() ) {
            NotificationWarning( 'Advertencia!', 'Error!!! Aun existen campos requeridos sin completar.' );
        } else {
            $.ajax({
                url : '/administrator/cooperation/institution/update/',
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
                      if( data.active.toString() == 'true' ) {
                          $( '#sample-table-2 tbody tr[name=' + data.id + '] td:nth-child(4)' ).empty().append( '<span class="label label-sm label-info arrowed arrowed-righ">Activo</span>' );
                      } else {
                          $( '#sample-table-2 tbody tr[name=' + data.id + '] td:nth-child(4)' ).empty().append( '<span class="label label-sm label-warning arrowed arrowed-righ">Inactivo</span>' );
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
    $(" input[name='name'] ").each(function(){
        if( $( this ).val() === '' ) {
            validate = true;
            $( this ).parent().parent().addClass('has-error');
        }
    });
    return validate;
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

function cleardata() {
    $( '.has-error' ).removeClass( 'has-error' );
    $( '#avatarimage' ).prop( 'src','/static/img/image.png' );
    $fileupload = $( "input[type='file']" );
    $fileupload.replaceWith($fileupload.clone(true));
    $( " input[type='text'] " ).each( function(){
        $( this ).val( '' );
    });
    $( " input[type='checkbox'] " ).each( function( i, item ){
        this.checked = item.defaultChecked;
    });
    $(" #trumbowyg-demo ").val('');
    $( ".trumbowyg-editor" ).empty();
}

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
