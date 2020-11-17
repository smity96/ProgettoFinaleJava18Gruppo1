//lorem ipsum
function prendiDataNascita(){
	var dataNascita = document.getElementById("dataDiNascita").value;
}

var valDiApp
$(".scelta" ).change(function() {
	
	if(valDiApp){
		$(valDiApp).addClass('d-none');
		
	}
		var val= $('.scelta').val()
	if(val!=0){
		var id = '#'+val;
		
		$(id).removeClass('d-none');
		valDiApp=id;
	}
});


