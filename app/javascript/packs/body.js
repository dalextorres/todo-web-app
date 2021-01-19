function checkURL() {
    if(window.location.href === "http://localhost:3000/"){
        return true;
    }
}  
    
$(document).ready(function () {
    console.log(window.location.href);
    if(checkURL()){
        $('body').addClass('home-background');
    }
});