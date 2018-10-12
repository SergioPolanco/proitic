$(document).ready(function() {
	$("#btnGuardar").on("click", function(e){
        e.preventDefault();

        let inputIntroductoryImage = document.getElementById("introductoryImage")
        let imgB64 = ""

        convertImgToBase64(inputIntroductoryImage, function(value) {
            let data = {
                mission: $("#mission").val(),
                vission: $("#vission").val(),
                history: $("#mission").val(),
                email: $("#email").val(),
                phone: $("#phone").val(),
                address: $("#address").val(),
                introductoryText: $("#introductoryText").val(),
                introductoryImage: value,
            }
            
            saveData(data)
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
            console.log(response)
        },
        error: (error) => {
            let errorParsed = JSON.parse(error.responseText)
            console.log(errorParsed)

            for (let key in errorParsed) {
                NotificationError( 'Advertencia!', 'Error!!! ' + errorParsed[key][0] + '' )
            }
            
        }
    })
}