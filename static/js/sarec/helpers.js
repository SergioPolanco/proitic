//Notifications 

function NotificationSuccess(title, message) {
    var unique_id = $.gritter.add({
        title: title,
        text: message,
        sticky: true,
        time: '',
        class_name: 'gritter-success gritter-center'
    })
}

function NotificationWarning(title, message) {
    var unique_id = $.gritter.add({
        title: title,
        text: message,
        sticky: true,
        time: '',
        class_name: 'gritter-warning gritter-center'
    })
}

function NotificationError(title, message) {
    var unique_id = $.gritter.add({
        title: title,
        text: message,
        sticky: false,
        time: '',
        class_name: 'gritter-error gritter-center'
    })
}


// Image

function convertImgToBase64(element) {
    return new Promise((resolve, reject) => {
        if (element.files && element.files[0]) {
            let reader = new FileReader()
            reader.onload = function (e) {
                resolve(e.target.result)
            }
            reader.readAsDataURL(element.files[0])
        } else {
            resolve("")
        }
    })
}

async function convertImgToBase64Async(element) {
    let result = await convertImgToBase64(element)
    return result
}