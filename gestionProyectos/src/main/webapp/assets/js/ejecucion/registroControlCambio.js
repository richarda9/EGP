$('document').ready(function(){
	$('#fecSolCtrolCambios').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fecSolCtrolCambios').datepicker().next().on('click', function(){  
		$(this).prev().focus();
	});
});