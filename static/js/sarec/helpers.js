//Notifications 

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
    //$.gritter.removeAll()
    var unique_id = $.gritter.add({
        title: title,
        text: message,
        sticky: false,
        time: '',
        class_name: 'gritter-error gritter-center'
    })
}


// Image

function convertImgToBase64(element, callback) {
    if (element.files && element.files[0]) {
        let reader = new FileReader()
        reader.onload = function (e) {
            callback(e.target.result)
        }
        reader.readAsDataURL(element.files[0])
    }
}