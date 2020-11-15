function prendiDataNascita(){
	var dataNascita = document.getElementById("dataDiNascita").value;
}

$( ".scelta" ).change(function() {
  
  if ($(this).val() == '2'){
    jQuery('#info-prenotazione').removeClass('d-flex');
    jQuery('#info-prenotazione').addClass('d-none');

  } else if ($('#info-prenotazione').hasClass('d-flex')){
    jQuery('#info-prenotazione').removeClass('d-flex');
    jQuery('#info-prenotazione').addClass('d-none');
    jQuery('#info-prenotazione').removeClass('d-none');
    jQuery('#info-prenotazione').addClass('d-flex');
  } 
  else {

    jQuery('#info-prenotazione').removeClass('d-none');
    jQuery('#info-prenotazione').addClass('d-flex');
}
});