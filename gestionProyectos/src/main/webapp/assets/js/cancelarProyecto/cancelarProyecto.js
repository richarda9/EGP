$('document').ready(function(){
	$('#fecCancelacion').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'		
	}).datepicker("setDate", new Date()).datepicker("setStartDate", new Date()).datepicker("setEndDate", new Date()); 

	$('#fecCancelacion').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});
	
	$('#formCancelarProyecto').validate({
		errorClass: 'help-block',
		rules: {
			cancelarJustificacionProyecto: {
				required: true,
				maxlength : 300
			},
			fecCancelacion: {
				required: true
			}
		},

		highlight: function (e) {
			$(e).closest('.control-group').removeClass('info').addClass('error');
		},

		success: function (e) {
			$(e).closest('.control-group').removeClass('error');
			$(e).remove();
		},
		
		submitHandler: function (form) {
			registrarCancelarProyecto();
		}
	});
});