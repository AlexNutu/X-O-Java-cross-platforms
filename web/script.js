window.onload = main;

function main(){
    var submitButton = document.createElement("Button");
    submitButton.innerHTML = "TEST";
    document.getElementById("main").appendChild(submitButton);


    $(document).ready(function () {
        setInterval(function(){ $.get("rest/export/199", function(data) {
            alert(data);
        })}, 5000);
    });
}