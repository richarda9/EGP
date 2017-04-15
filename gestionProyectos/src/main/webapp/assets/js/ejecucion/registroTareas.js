$('document').ready(function(){
	$('#fecIniTarea').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fecIniTarea').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});
	
	$('#fecFinTarea').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fecFinTarea').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});
});