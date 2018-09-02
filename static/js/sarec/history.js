class History {
  constructor() {
    this.formHistory = document.getElementsByName('formHistory')[0]
    this.url = document.body.querySelectorAll('*[href="/administrator/others/history/"]')[0]
    this.formHistory.addEventListener('submit', (e) => { this.processForm(e) })
  }
  initApp() {
    this.url.parentElement.parentElement.parentElement.classList.add('active', 'open', 'hsub')
    this.url.parentElement.classList.add('active')
    this.url.parentElement.parentElement.classList.add('open')
  }
  processForm(e) {
    if (e.preventDefault) {
      e.preventDefault()
    }
    $.ajax({
      url : '/administrator/others/history/',
      type : 'post',
      data : new FormData(this.formHistory),
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
  let history = new History()
  history.initApp()
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
  };

  $('#trumbowyg-demo').trumbowyg('destroy')
  $('#trumbowyg-demo').trumbowyg(configurations)

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
