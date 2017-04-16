<script src="../assets/js/cancelarProyecto/cancelarProyecto.js"></script>

<script>
$(function() 
{	
	$('#tablaEstadoProyecto').DataTable({
		"paging"    : true,
		"autoWidth" : true,
		"pageLength": 10,
		"searching" : false,
		"bInfo"     : false, 
		//"bLengthChange": false,
		"language"  : {
			            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
			          }
	});	
	
	$('#fechaInicio').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fechaInicio').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});
	
	$('#fechafin').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fechafin').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});
	
	//[INI] BUSQUEDA
	$("#formBsqEjecucion").submit(function() 
	{
		var objeto = $("#registrarEstadoProyecto").serializeObject();
		objeto.estado = 1;
		console.log(objeto);
		$.postJSON('${pageContext.request.contextPath}/administracion/registrar_estadoProyecto.htm', objeto, function(data) {
			if(data == 0){
				$.gritter.add({
					title: 'Info!',
					text: 'Se listo correctamente.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-info gritter-light'
				});
				
				listarEstadoProyecto();
			}
		}).fail(function() {
			$.gritter.add({
				title: 'Error!',
				text: 'Ocurrio un error al tratar de listar los proyectos',
				sticky: false,
				time: '1200',
				class_name: 'gritter-error'
			});
		});
		
		return false;		
	});
	//[INI] BUSQUEDA
	
});
</script>