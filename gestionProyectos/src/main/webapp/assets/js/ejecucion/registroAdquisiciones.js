$('document').ready(function(){
	$('#fecCompAdquisiciones').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fecCompAdquisiciones').datepicker().next().on('click', function(){  
		$(this).prev().focus();
	});
});