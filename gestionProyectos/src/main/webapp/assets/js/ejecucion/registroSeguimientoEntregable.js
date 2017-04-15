$('document').ready(function(){				
	$('#editfecRespSegEntregable').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#editfecRespSegEntregable').datepicker().next().on('click', function(){  
		$(this).prev().focus();
	});
});