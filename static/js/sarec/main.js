$(document).ready(function(){
    $( "form[name='form-access']" ).submit(function( event ) {
        if ( $("input[name='username']").val()=='' || $("input[name='password']").val()=='' ) {
            event.preventDefault();
            $('div#message').empty().append('<div id="alert" class="alert alert-warning no-margin-bottom"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><strong>Error!</strong> Debe de completar todos los campos.</div>');
        }
    });

    $.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
        _title: function(title) {
            var $title = this.options.title || '&nbsp;'
            if( ("title_html" in this.options) && this.options.title_html == true )
                title.html($title);
            else title.text($title);
        }
    }));

    $( 'a[name="help"]' ).click(function(){
      var dialog = $( "#dialog" ).removeClass('hide').dialog({
          modal: true,
          title: "<div class='widget-header widget-header-small'><h4 class='smaller'><i class='ace-icon fa fa-check'></i> Contáctanos</h4></div>",
          title_html: true,
          buttons: [
              {
                  text: "OK",
                  "class" : "btn btn-primary btn-xs no-border-radius",
                  click: function() {
                      $( this ).dialog( "close" );
                  }
              }
          ],
          close: function() {
              $( '#dialog' ).addClass( 'hide' );
          }
      });
    });

    $( 'input[name="username"]' ).focus();

});
