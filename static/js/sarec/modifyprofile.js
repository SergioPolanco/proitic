$(document).ready(function() {

    $( "[href='/administrator/accounts/modify/']" ).parent().addClass('active').parent().addClass('open');
    $( "[href='/administrator/accounts/modify/']" ).parent().parent().parent().addClass('active open hsub');

    $('#sample-table-2').dataTable( {
        bAutoWidth: false,
        "aoColumns": [ { "bSortable": false }, null ,null, null,null, null, null, null,null,
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

    $( document ).on( 'click', 'i.fa-search-plus.bigger-130', function(e) {
        $( "#dialog-message" ).append( '<form name="FormPost" id="FrmGrid_grid-table" class="FormGrid" onsubmit="return false;" style="width:auto;overflow:auto;position:relative;height:auto;"> <table id="TblGrid_grid-table" class="EditTable" cellspacing="0" cellpadding="0" border="0" style="width:100%;"> <tbody> <tr rowpos="1" class="FormData" id="tr_id" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">ID</td><td class="DataTD">&nbsp; <input type="text" id="td_id" name="td_id" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;"> </td></tr><tr rowpos="2" class="FormData" id="tr_username" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Usuario</td><td class="DataTD">&nbsp; <input type="text" id="td_username" readonly name="td_username" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;"> </td></tr><tr rowpos="2" class="FormData" id="tr_first_name" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Nombre</td><td class="DataTD">&nbsp; <input type="text" id="td_first_name" readonly name="td_first_name" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;"> </td></tr><tr rowpos="2" class="FormData" id="tr_last_name" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Apellido</td><td class="DataTD">&nbsp; <input type="text" id="td_last_name" readonly name="td_last_name" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;"> </td></tr><tr rowpos="2" class="FormData" id="tr_email" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Correo</td><td class="DataTD">&nbsp; <input type="text" id="td_email" readonly name="td_email" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;"> </td></tr><tr rowpos="2" class="FormData" id="tr_is_active" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Activo</td><td class="DataTD">&nbsp; <input type="checkbox" value="Yes" offval="No" id="is_active" name="is_active" role="checkbox" class="FormElement ace ace-switch ace-switch-5"> <span class="lbl" style="margin-bottom:2px;margin-top:5px;"></span> </td></tr><tr rowpos="2" class="FormData" id="tr_is_admin" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Administrator</td><td class="DataTD">&nbsp; <input type="checkbox" value="Yes" offval="No" id="is_admin" name="is_admin" role="checkbox" class="FormElement ace ace-switch ace-switch-5"> <span class="lbl" style="margin-bottom:2px;margin-top:5px;"></span> </td></tr></tbody> </table> </form>' );

        $( 'input[name="td_username"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(3)") ).text()) );
        $( 'input[name="td_first_name"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(4)") ).text()) );
        $( 'input[name="td_last_name"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(5)") ).text()) );
        $( 'input[name="td_email"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(6)") ).text()) );
        if( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(7)") ).text()) == 'Activo') {
            $( '#is_active' ).prop( "checked" , "true" );
        }
        if( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(8)") ).text()) == 'Activo') {
            $( '#is_admin' ).prop( "checked", "true" );
        }

        e.preventDefault();

        var dialog = $( "#dialog-message" ).removeClass('hide').dialog({
            modal: true,
            title: "<div class='widget-header widget-header-small'><h4 class='smaller'><i class='ace-icon fa fa-check'></i> Datos del Usuario</h4></div>",
            title_html: true,
            buttons: [
                {
                    text: "OK",
                    "class" : "btn btn-primary btn-xs",
                    click: function() {
                        $( this ).dialog( "close" );
                    }
                }
            ],
            close: function() {
                $( '#dialog-message' ).empty().addClass( 'hide' );
            }
        });

    });

    $( document ).on( 'click', 'i.fa-search-plus.bigger-120', function(e) {

        $( "#dialog-message" ).append( '<form name="FormPost" id="FrmGrid_grid-table" class="FormGrid" onsubmit="return false;" style="width:auto;overflow:auto;position:relative;height:auto;"> <table id="TblGrid_grid-table" class="EditTable" cellspacing="0" cellpadding="0" border="0" style="width:100%;"> <tbody> <tr rowpos="1" class="FormData" id="tr_id" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">ID</td><td class="DataTD">&nbsp; <input type="text" id="td_id" name="td_id" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;"> </td></tr><tr rowpos="2" class="FormData" id="tr_username" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Usuario</td><td class="DataTD">&nbsp; <input type="text" id="td_username" readonly name="td_username" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;"> </td></tr><tr rowpos="2" class="FormData" id="tr_first_name" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Nombre</td><td class="DataTD">&nbsp; <input type="text" id="td_first_name" readonly name="td_first_name" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;"> </td></tr><tr rowpos="2" class="FormData" id="tr_last_name" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Apellido</td><td class="DataTD">&nbsp; <input type="text" id="td_last_name" readonly name="td_last_name" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;"> </td></tr><tr rowpos="2" class="FormData" id="tr_email" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Correo</td><td class="DataTD">&nbsp; <input type="text" id="td_email" readonly name="td_email" role="textbox" class="FormElement ui-widget-content ui-corner-all" style="margin-bottom:5px;margin-top:5px;"> </td></tr><tr rowpos="2" class="FormData" id="tr_is_active" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Activo</td><td class="DataTD">&nbsp; <input type="checkbox" value="Yes" offval="No" id="is_active" name="is_active" role="checkbox" class="FormElement ace ace-switch ace-switch-5"> <span class="lbl" style="margin-bottom:2px;margin-top:5px;"></span> </td></tr><tr rowpos="2" class="FormData" id="tr_is_admin" style="border-bottom: 1px dotted #E8E8E8; width:100%;"> <td class="CaptionTD">Administrator</td><td class="DataTD">&nbsp; <input type="checkbox" value="Yes" offval="No" id="is_admin" name="is_admin" role="checkbox" class="FormElement ace ace-switch ace-switch-5"> <span class="lbl" style="margin-bottom:2px;margin-top:5px;"></span> </td></tr></tbody> </table> </form>' );

        $( 'input[name="td_username"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(3)") ).text()) );
        $( 'input[name="td_first_name"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(4)") ).text()) );
        $( 'input[name="td_last_name"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(5)") ).text()) );
        $( 'input[name="td_email"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(6)") ).text()) );
        if( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(7)") ).text()) == 'Activo') {
            $( '#is_active' ).prop( "checked" , "true" );
        }
        if( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(8)") ).text()) == 'Activo') {
            $( '#is_admin' ).prop( "checked", "true" );
        }

        e.preventDefault();
        var dialog = $( "#dialog-message" ).removeClass('hide').dialog({
            modal: true,
            title: "<div class='widget-header widget-header-small'><h4 class='smaller'><i class='ace-icon fa fa-check'></i> Datos del Usuario</h4></div>",
            title_html: true,
            buttons: [
                {
                    text: "OK",
                    "class" : "btn btn-primary btn-xs",
                    click: function() {
                        $( this ).dialog( "close" );
                    }
                }
            ],
            close: function() {
                $( '#dialog-message' ).empty().addClass( 'hide' );
            }
        });

    });

    $( document ).on( 'click', 'i.fa-pencil.bigger-130', function(e) {

        $( 'input[name="id"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(2)") ).text()) );
        $( 'input[name="username"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(3)") ).text()) );
        $( 'input[name="firstname"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(4)") ).text()) );
        $( 'input[name="lastname"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(5)") ).text()) );
        $( 'input[name="email"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(6)") ).text()) );
        $( '#avatarimage' ).prop( 'src', $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(9)") ).text()) );
        if( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(7)") ).text()) == 'Activo') {
            $( 'input[name="active"]' ).prop( "checked", "true" );
        }
        if( $.trim($( $( this ).parent().parent().parent().parent().children(":nth-child(8)") ).text()) == 'Activo') {
            $( 'input[name="admin"]' ).prop( "checked", "true" );
        }
        $( '.form-modify' ).toggle( "slow" );
        $( '.form-search' ).toggle( "slow" );

    });

    $( document ).on( 'click', 'i.fa-pencil.bigger-120', function(e) {

        $( 'input[name="id"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(2)") ).text()) );
        $( 'input[name="username"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(3)") ).text()) );
        $( 'input[name="firstname"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(4)") ).text()) );
        $( 'input[name="lastname"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(5)") ).text()) );
        $( 'input[name="email"]' ).val( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(6)") ).text()) );
        $( '#avatarimage' ).prop( 'src', $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(9)") ).text()) );
        if( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(7)") ).text()) == 'Activo') {
            $( 'input[name="active"]' ).prop( "checked", "true" );
        }
        if( $.trim($( $( this ).parent().parent().parent().parent().parent().parent().parent().parent().children(":nth-child(8)") ).text()) == 'Activo') {
            $( 'input[name="admin"]' ).prop( "checked", "true" );
        }
        $( '.form-modify' ).toggle( "slow" );
        $( '.form-search' ).toggle( "slow" );

    });

    $( document ).on('change', "input[type='file']", function(e) {
        mostrarImagen(this);
    });

    $( " button[name='cancelar'] " ).click( function() {
        $( '.has-error' ).removeClass( 'has-error' );
        $( '#avatarimage' ).prop( 'src','/static/img/image.png' );
        $( "form[name='form-new-account']" )[0].reset();
        $( '.form-modify' ).toggle( "slow" );
        $( '.form-search' ).toggle( "slow" );
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
                url : '/administrator/accounts/update/',
                type : 'post',
                data : formData,
                async : true,
                contentType: false,
                processData: false,
                success: function(data) {
                    if( data.status === 'False' ) {
                        NotificationError( 'Advertencia!', 'Error!!! '+ data.message +'' );
                    } else if( data.status === 'True' ) {
                        $( '#sample-table-2 tbody tr[name=' + data.id + '] td:nth-child(4)' ).text( data.first_name );
                        $( '#sample-table-2 tbody tr[name=' + data.id + '] td:nth-child(5)' ).text( data.last_name );
                        $( '#sample-table-2 tbody tr[name=' + data.id + '] td:nth-child(6)' ).text( data.email );
                        if( data.photo ) {
                            $( '#sample-table-2 tbody tr[name=' + data.id + '] td:nth-child(9)' ).text( data.photo );
                        }
                        if( data.is_active.toString() == 'true' ) {
                            $( '#sample-table-2 tbody tr[name=' + data.id + '] td:nth-child(7)' ).empty().append( '<span class="label label-sm label-info arrowed arrowed-righ">Activo</span>' );
                        } else {
                            $( '#sample-table-2 tbody tr[name=' + data.id + '] td:nth-child(7)' ).empty().append( '<span class="label label-sm label-warning arrowed arrowed-righ">Inactivo</span>' );
                        }
                        if( data.is_superuser.toString() == 'true' ) {
                            $( '#sample-table-2 tbody tr[name=' + data.id + '] td:nth-child(8)' ).empty().append( '<span class="label label-sm label-info arrowed arrowed-righ">Activo</span>' );
                        } else {
                            $( '#sample-table-2 tbody tr[name=' + data.id + '] td:nth-child(8)' ).empty().append( '<span class="label label-sm label-warning arrowed arrowed-righ">Inactivo</span>' );
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
    $(" input[type='text'], input[type='email'] ").each(function(){
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
    if( $( "input[name='newpassword']" ).val().length < 8 && $( "input[name='newpassword']" ).val().length !== 0 ) {
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
