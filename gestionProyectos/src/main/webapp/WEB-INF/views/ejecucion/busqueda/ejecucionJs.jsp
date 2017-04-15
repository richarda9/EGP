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
	
	$('#fecCancelacion').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fecCancelacion').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});
});
</script>