$(document).ready(function() {
	$("#btnGuardar").on("click", function(e){
        e.preventDefault();

        let inputIntroductoryImage = document.getElementById("introductoryImage")
        let imgB64 = ""
        
        convertImgToBase64Async(inputIntroductoryImage)
        .then((result) => {
            let data = {
                mission: $("#mission").val(),
                vission: $("#vission").val(),
                history: $("#mission").val(),
                email: $("#email").val(),
                phone: $("#phone").val(),
                address: $("#address").val(),
                introductoryText: $("#introductoryText").val(),
                introductoryImage: result,
            }
            saveData(data)
        })
        .catch((error) => {
        })
        
    })
})

function saveData(data) {
    $.ajax({
        url: "/administrator/others/about/",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(data),
        success: (response) => {
            alertify.notify("Datos actualizados correctamente" , 'success', 10);
        },
        error: (error) => {
            let errorParsed = JSON.parse(error.responseText)
            console.log(errorParsed)

            for (let key in errorParsed) {
                alertify.notify(errorParsed[key][0] , 'error', 10);
                // NotificationError( 'Advertencia!', 'Error!!! ' + errorParsed[key][0] + '' )
            }
            
        }
    })
}