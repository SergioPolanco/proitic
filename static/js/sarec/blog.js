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

  $("#blog_active").on("change", function(ev){
    if(ev.target.checked){
        $("#div_blog_content").toggle("slow");
        $('#trumbowyg-demo2').trumbowyg('destroy');
        $('#trumbowyg-demo2').trumbowyg(configurations);
    }else{
        $("#div_blog_content").toggle("slow");
    }
  });

  $( "[href='/administrator/blog/']" ).parent().addClass('active').parent().addClass('open');
  $( '.chosen-select' ).chosen({
      allow_single_deselect:true
  });

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


    var tag_input = $('#form-field-tags');
  	try{
      tag_input.tag( { placeholder:tag_input.attr('placeholder') } );
      $( tag_input ).parent().css('width','100%');
  		var $tag_obj = $('#form-field-tags').data('tag');
  	} catch(e) {
      tag_input.after('<textarea id="'+tag_input.attr('id')+'" name="'+tag_input.attr('name')+'" rows="3">'+tag_input.val()+'</textarea>').remove();
  	}

    var authors_input = $('#form-field-authors');
    try{
      authors_input.tag( { placeholder:authors_input.attr('placeholder') } );
      $( authors_input ).parent().css('width','100%');
      var $authors_obj = $('#form-field-authors').data('tag');
    } catch(e) {
      authors_input.after('<textarea id="'+authors_input.attr('id')+'" name="'+authors_input.attr('name')+'" rows="3">'+authors_input.val()+'</textarea>').remove();
    }

    $(document).on( 'click' , "button[type='reset']" ,function () {
        $( '#form-field-tags' ).val('');
        $( '#form-field-authors' ).val('');
        $( 'input[name="title"]' ).val('');
        $( 'input[name="city"]' ).val('');
        $(".chosen-select").val('').trigger("chosen:updated");
        $(" #trumbowyg-demo ").val('');
        $( ".trumbowyg-editor" ).empty();
        $( 'span.tag' ).remove();
        $( '.has-error' ).removeClass( 'has-error' );
    });

    $(document).on( 'submit' , "form[name='form-new-blog']" ,function () {
        $( 'i.load' ).removeClass( 'hide' );
        var formData = new FormData( $( "form[name='form-new-blog']" )[0] );
        if( validateblank() ) {
            NotificationWarning( 'Advertencia!', 'Error!!! Aun existen campos requeridos sin completar.' );
        } else {
            $.ajax({
                url : '/administrator/blog/insert/',
                type : 'post',
                data : formData,
                async : true,
                contentType: false,
                processData: false,
                success: function(data) {
                    if( data.status === 'False' ) {
                        NotificationError( 'Advertencia!', 'Error!!! '+ data.message +'' );
                        $( "input[name='title']" ).parent().parent().addClass('has-error');
                    } else if( data.status === 'True' ) {
                        window.location.href = '/administrator/blog/';
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


$(window).off('resize.chosen').on('resize.chosen', function() {
    $('.chosen-select').each(function() {
        var $this = $(this);
        $this.next().css({'width': $this.parent().width()});
    })
}).trigger('resize.chosen');

function validateblank() {
    var validate = false;
    $(" input.validate ").each(function(){
        if( $( this ).val() === '' ) {
            validate = true;
            $( this ).parent().parent().addClass('has-error');
        }
    });
    if( $('select[name="category"]').val() === '' ) {
      validate = true;
      $( 'select[name="category"]' ).parent().parent().addClass('has-error');
    }

    return validate;
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
