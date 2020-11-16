function prendiDataNascita(){
	var dataNascita = document.getElementById("dataDiNascita").value;
}

/*for(var i=0;i<101;i++){
	$( ".scelta" ).change(function() {
	  
	  if ($(this).val() == '2'){
	    jQuery('#'+i).removeClass('d-flex');
	    jQuery('#'+i).addClass('d-none');
	
	  } else if ($('#'+i).hasClass('d-flex')){
	    jQuery('#'+i).removeClass('d-flex');
	    jQuery('#'+i).addClass('d-none');
	    jQuery('#'+i).removeClass('d-none');
	    jQuery('#'+i).addClass('d-flex');
	  } 
	  else {
	
	    jQuery('#'+i).removeClass('d-none');
	    jQuery('#'+i).addClass('d-flex');
	}
	});
}*/

$(function () { 
    
    $(".scelta").on("change", function () {
    if ($(this).val() == '2'){
    $(".film").hide();
    } 
  else {
        $(".film").hide();
        $("div[id='" + $(this).val() + "']").show();
        }
    });
    
});