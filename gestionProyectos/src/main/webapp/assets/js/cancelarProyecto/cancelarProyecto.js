$('document').ready(function(){
	$('#fecCancelacion').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fecCancelacion').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});
});