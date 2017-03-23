<script>
$('#fechaCierre').datepicker({
	language: 'es',
	format: 'dd/mm/yyyy'
});
$('#fechaCierre').datepicker().next().on('click', function(){ 
	$(this).prev().focus();
});

</script>