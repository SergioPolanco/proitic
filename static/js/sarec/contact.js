$(document).ready(load)

function load() {

  $(document).on( 'submit' , "form[name='form-message']" ,function () {
    var formData = new FormData( $( "form[name='form-message']" )[0] );

        if(validarCampoVacios() != 0){
          $("#EmptyFields").removeClass('hidden');
        }
        else {
          $.ajax({
              url : '/enviar_sugerencia',
              type : 'post',
              data : formData,
              async : true,
              contentType: false,
              processData: false,
              beforeSend: function(){
                $("#btnEnviar").val('Cargando...');
              },
              success: function(data) {
                if(data.status == 'true'){
                  $("#ErrorBackends").addClass('hidden')
                  $("#MessageSent").removeClass('hidden');

                  limpiar();
                }else {
                  $("#ErrorBackends").removeClass('hidden').text(data.message);
                }

              },
              complete:function(){
                $("#btnEnviar").val('Enviar');
              },
              error: function (XMLHttpRequest, estado, errorS) {
                var error = eval("(" + XMLHttpRequest.responseText + ")");
                console.log(error.Message);
                console.log(estado);
                console.log(errorS);
              },

          });
        }

    return false;
  });
}
function validarCampoVacios(){
  var band = 0;
  if ($("#txtNombre").val() == "") {
    $("#fgNombre").addClass("has-error");
    band++;
  }else {
    $("#fgNombre").removeClass("has-error");
  }

  if ($("#txtCorreo").val() == "") {
    $("#fgCorreo").addClass("has-error");
    band++;
  }else {
    $("#fgCorreo").removeClass("has-error");
  }

  if ($("#txtMensaje").val() == "") {
    $("#fgMensaje").addClass("has-error");
    band++;
  }else {
    $("#fgMensaje").removeClass("has-error");
  }
  return band;
}
function limpiar(){
  $('#form-message').each (function(){
    this.reset();
  });
}

function initMap(){
  if ($("#map-canvas").length>0) {
  var map, myLatlng, myZoom, marker;
  // Set the coordinates of your location
  myLatlng = new google.maps.LatLng(12.131726, -86.269826);
  myZoom = 18;
  function initialize() {
   var mapOptions = {
    zoom: myZoom,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    center: myLatlng,
    scrollwheel: false
   };
   map = new google.maps.Map(document.getElementById("map-canvas"),mapOptions);
   marker = new google.maps.Marker({
    map:map,
    draggable:true,
    animation: google.maps.Animation.DROP,
    position: myLatlng
   });
   google.maps.event.addDomListener(window, "resize", function() {
    map.setCenter(myLatlng);
   });
  }
  google.maps.event.addDomListener(window, "load", initialize);
 }
}
