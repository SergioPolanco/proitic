$(document).ready(function() {

    $( "[href='/administrator/accounts/add/']" ).parent().addClass('active').parent().addClass('open');
    $( "[href='/administrator/accounts/add/']" ).parent().parent().parent().addClass('active open hsub');


    $( " input[type='text'], input[type='email'], input[type='password'] " ).on( 'input' , function() {
        if( $( this ).val() === '' ) {
            $( this ).parent().parent().addClass('has-error');
        } else {
            $( this ).parent().parent().removeClass('has-error');
        }
    });

    $( " input[type='text'], input[type='email'], input[type='password'] " ).on( 'input' , function() {
        if( $( this ).val() === '' ) {
            $( this ).parent().parent().addClass('has-error');
        } else {
            $( this ).parent().parent().removeClass('has-error');
        }
    });

    $( " button[name='reset'] " ).click( function() {
        $( '.has-error' ).removeClass( 'has-error' );
        $( '#avatarimage' ).prop( 'src','/static/img/image.png' );
    });

    $( document ).on('change', "input[type='file']", function(e) {
        mostrarImagen(this);
    });

    $(document).on( 'submit' , "form[name='form-new-account']" ,function () {
        $( '.load' ).removeClass( 'hide' );
        var formData = new FormData( $( "form[name='form-new-account']" )[0] );
        if( validateblank() ) {
            NotificationWarning( 'Advertencia!', 'Error!!! Aun existen campos requeridos sin completar.' );
        } else if( validatepassword() ) {
            NotificationWarning( 'Advertencia!', 'Error!!! Los campos de contraseñas no coinciden.' );
        } else if( lengthpassword() ){
            NotificationWarning( 'Advertencia!', 'Error!!! La longitud de la contraseña, debe ser mayor a 8 caracteres.' );
        } else {
            $.ajax({
                url : '/administrator/accounts/insert/',
                type : 'post',
                data : formData,
                async : true,
                contentType: false,
                processData: false,
                success: function(data) {
                    if( data.status === 'False' ) {
                        NotificationError( 'Advertencia!', 'Error!!! '+ data.message +'' );
                        if( 'Lo sentimos, este nombre de usuario ya ha siso registrado, por favor seleccione otro...' === data.message ){
                            $( "input[name='username']" ).parent().parent().addClass('has-error');
                        }
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
    $(" input[type='text'], input[type='email'], input[type='password'] ").each(function(){
        if( $( this ).val() === '' ) {
            validate = true;
            $( this ).parent().parent().addClass('has-error');
        }
    });
    return validate;
}

function validatepassword() {
    var validate = false;
    if( $( "input[name='newpassword']" ).val() !== $( "input[name='confirmpassword']" ).val() ) {
        validate = true;
        $(" input[type='password'] ").parent().parent().addClass('has-error');
    }
    return validate;
}

function lengthpassword() {
    var validate = false;
    if( $( "input[name='newpassword']" ).val().length < 8 ) {
        validate = true;
        $(" input[type='password'] ").parent().parent().addClass('has-error');
    }
    return validate;
}

function cleardata() {
    $( '.has-error' ).removeClass( 'has-error' );
    $( '#avatarimage' ).prop( 'src','/static/img/image.png' );
    $fileupload = $( "input[type='file']" );
    $fileupload.replaceWith($fileupload.clone(true));
    $( " input[type='text'], input[type='email'], input[type='password'] " ).each( function(){
        $( this ).val( '' );
    });
    $( " input[type='checkbox'] " ).each( function( i, item ){
        this.checked = item.defaultChecked;
    });
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
