<script src="assets/js/bootbox.min.js"></script>
<script type="text/javascript">
function detectarBoton(event, ind){
	
	if(event.button ==2){
		switch(ind){
			case 1: eliminarTipoProyecto();
					break;
			case 2: eliminarEstadoProyecto();
					break;
		}
	}
	 
};

function eliminarTipoProyecto(){
	alert("Entro");
	$("#idTipoProyecto").on(ace.click_event, function() {
		bootbox.confirm("Are you sure?", function(result) {
			if(result) {
				bootbox.alert("You are sure!");
			}
		});
	});
	
};

function eliminarEstadoProyecto(){
	
};
</script>