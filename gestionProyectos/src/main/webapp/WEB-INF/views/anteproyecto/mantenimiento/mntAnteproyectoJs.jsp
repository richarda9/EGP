<script>
$('#fechaContacto').datepicker({
	language: 'es',
	format: 'dd/mm/yyyy'
});
$('#fechaContacto').datepicker().next().on('click', function(){ 
	$(this).prev().focus();
});

// $('#archObservacion').ace_file_input({
// 	no_file:'Archivo ...',
// 	btn_choose:'Cargar Archivo',
// 	btn_change:'Cambiar',
// 	droppable:false,
// 	onchange:null,
// 	thumbnail:false //| true | large
// 	//whitelist:'gif|png|jpg|jpeg'
// 	//blacklist:'exe|php'
// 	//onchange:''
// 	//
// });

$('#archObservacion').ace_file_input({
					no_file:'No File ...',
					btn_choose:'Choose',
					btn_change:'Change',
					droppable:false,
					onchange:null,
					thumbnail:false //| true | large
					//whitelist:'gif|png|jpg|jpeg'
					//blacklist:'exe|php'
					//onchange:''
					//
				});
</script>