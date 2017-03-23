<script>
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
</script>