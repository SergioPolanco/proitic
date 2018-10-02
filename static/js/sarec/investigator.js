class Investigator {
  constructor () {
    this.formInvestigator = document.getElementsByName('formInvestigator')[0]
    this.picture = document.getElementById('fotoPerfil')
    this.avatarImage = document.getElementById('avatarimage')
    this.url = document.body.querySelectorAll('*[href="/perfilesnew/"]')[0]
    this.buttonReset = document.getElementById('btnReiniciar')
    this.formInvestigator.addEventListener('submit', (e) => { this.processForm(e) })
    this.buttonReset.addEventListener('click', (e) => { this.resetForm() })
    this.picture.addEventListener('change', (e) => { this.showImage() })
  }
  initApp () {
    this.url.parentElement.parentElement.parentElement.classList.add('active', 'open', 'hsub')
    this.url.parentElement.classList.add('active')
    this.url.parentElement.parentElement.classList.add('open')
    $('.input-mask-phone').mask('(999) 9999-9999')
    $('.date-picker').datepicker({
      autoclose: true,
  		todayHighlight: true,
      dateFormat: 'yy-mm-dd'
  	})
    $( '.chosen-select' ).chosen({
      allow_single_deselect: true
    })
  }
  showImage () {
    if (this.picture.files && this.picture.files[0]) {
      let reader = new FileReader()
      let avatarImage = this.avatarImage
      reader.onload = function (e) {
        avatarImage.src = e.target.result
      }
      reader.readAsDataURL(this.picture.files[0])
    }
  }
  processForm (e) {
    if (e.preventDefault) {
      e.preventDefault()
    }
    if (this.validate()) {
      NotificationWarning( 'Advertencia!', 'Error!!! Aun existen campos requeridos sin completar.' )
    } else {
      $.ajax({
        url : '/administrator/investigator/new/',
        type : 'post',
        data : new FormData(this.formInvestigator),
        async : true,
        contentType: false,
        processData: false,
        success: function(data) {
          if (data.status == 'True') {
            NotificationSuccess( 'Mensaje!', 'Excelente!!! ' + data.message + '' )
            location.reload()
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
    }
    return false
  }
  isNullOrBlank (element, fgElement) {
    let flag = 0
    if (document.getElementById(element).value === '') {
      document.getElementById(fgElement).classList.add('has-error')
      flag = 1
    } else {
      document.getElementById(fgElement).classList.remove('has-error')
    }
    return flag
  }
  validate () {
    let flag = 0
    flag += this.isNullOrBlank('names', 'fgNames')
    flag += this.isNullOrBlank('surnames', 'fgSurnames')
    flag += this.isNullOrBlank('birthdate', 'fgBirthdate')
    flag += this.isNullOrBlank('email', 'fgEmail')
    flag += this.isNullOrBlank('phone', 'fgPhone')
    flag += this.isNullOrBlank('address', 'fgAddress')
    flag += this.isNullOrBlank('workDepartment', 'fgWorkDepartment')
    flag += this.isNullOrBlank('academicTitle', 'fgAcademicTitle')
    flag += this.isNullOrBlank('presentation', 'fgPresentation')
    flag += this.isNullOrBlank('userId', 'fgUserId')
    return flag !== 0
  }
  resetForm () {
    $(".has-error").removeClass("has-error")
    this.formInvestigator.reset()
    this.avatarImage.src = '/static/img/image.png'
  }
}

(() => {
  let investigator = new Investigator()
  investigator.initApp()
})()

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
    removeformatPasted: true,
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
  }
  $('#presentation').trumbowyg('destroy')
  $('#presentation').trumbowyg(configurations)
  $.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
      _title: function(title) {
          var $title = this.options.title || '&nbsp;'
          if( ("title_html" in this.options) && this.options.title_html == true )
              title.html($title);
          else title.text($title);
      }
  }))
})

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
