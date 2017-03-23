<script>
$('#fechaCambio').datepicker({
	language: 'es',
	format: 'dd/mm/yyyy'
});
$('#fechaCambio').datepicker().next().on('click', function(){ 
	$(this).prev().focus();
});
</script>