<!-- <script src="../assets/js/cancelarProyecto/cancelarProyecto.js"> -->
<<script type="text/javascript">

$(document).ready(function() {
		
	$('#fechaContacto').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fechaContacto').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});
	
	$('#archObservacion , #archAnexo').ace_file_input({
		no_file:'Seleccionar archivo ...',
		btn_choose:'Seleccionar',
		btn_change:'Cambiar',
		droppable:false,
		onchange:null,
		thumbnail:false 
		//| true | large
		//whitelist:'gif|png|jpg|jpeg'
		//blacklist:'exe|php'
		//onchange:''
		//
	});

});
</script>