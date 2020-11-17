//lorem ipsum
$(document).ready(function(){
$('.fliter-btn').click(function() {
    const value = $(this).attr('data-filter');
    if (value == 'all'){
        $('.films').show('1000');
    }
    else{
        $('.films').not('.'+value).hide('1000');
        $('.films').filter('.'+value).show('1000');

    }
})  
})
