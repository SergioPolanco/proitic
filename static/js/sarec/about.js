class About {
  constructor() {
    this.formAbout = document.getElementsByName('formAbout')[0]
    this.url = document.body.querySelectorAll('*[href="/administrator/others/about/"]')[0]
    this.formAbout.addEventListener('submit', (e) => { this.processForm(e) })
    $( '.chosen-select' ).chosen({
        allow_single_deselect:true
    });
    $("#file_grade").on("change", function(e){
      var filename = e.target.files[0].name;
      $("#result_file_grade").html(filename);
    });
  }
  initApp() {
    this.url.parentElement.parentElement.parentElement.classList.add('active', 'open', 'hsub')
    this.url.parentElement.classList.add('active')
    this.url.parentElement.parentElement.classList.add('open')
    $('.input-mask-phone').mask('(999) 9999-9999')
    
  }
  processForm(e) {
    if (e.preventDefault) {
      e.preventDefault()
    }
    $.ajax({
      url : '/administrator/others/about/',
      type : 'post',
      data : new FormData(this.formAbout),
      async : true,
      contentType: false,
      processData: false,
      success: function(data) {
        if (data.status == 'True'){
          NotificationSuccess( 'Mensaje!', 'Excelente!!! ' + data.message + '' )
        } else {
          NotificationError( 'Advertencia!', 'Error!!! ' + data.message + '' )
        }
      },
      error: function (XMLHttpRequest, estado, errorS) {
        var error = eval("(" + XMLHttpRequest.responseText + ")")
        console.log(error.Message)
        console.log(estado)
        console.log(errorS)
      }
    })
    return false
  }
}

(() => {
  let about = new About()
  about.initApp()
})()

function NotificationSuccess(title, message) {
    $.gritter.removeAll()
    var unique_id = $.gritter.add({
        title: title,
        text: message,
        sticky: true,
        time: '',
        class_name: 'gritter-success gritter-center'
    })
}

function NotificationWarning(title, message) {
    $.gritter.removeAll()
    var unique_id = $.gritter.add({
        title: title,
        text: message,
        sticky: true,
        time: '',
        class_name: 'gritter-warning gritter-center'
    })
}

function NotificationError(title, message) {
    $.gritter.removeAll()
    var unique_id = $.gritter.add({
        title: title,
        text: message,
        sticky: true,
        time: '',
        class_name: 'gritter-error gritter-center'
    })
}
