$('document').ready(function(){

	$('#fechaInicioInfAvance').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy',
		 defaultDate: 0
	});
	$('#fechaInicioInfAvance').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});

	
	$('#fechaFinInfAvance').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy',
		 defaultDate: 0
	});
	$('#fechaFinInfAvance').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});

	$('#registrarInformeAvance').validate({
		errorClass: 'help-block',
		rules: {
			dirigido: {
				required: true
			},
			descripcion: {
				required: true
			},
			idTipoAvance: {
				required: true
			},
		},

		highlight: function (e) {
			$(e).closest('.control-group').removeClass('info').addClass('error');
		},

		success: function (e) {
			$(e).closest('.control-group').removeClass('error');
			$(e).remove();
		},
		
		submitHandler: function (form) {
			registrarInformeAvance();
		}
	});

	$('#btnInfAvance').click( function () {
		$("#btnEnviarInfoAvance").hide();
		limpiarMntInformeAvance();
	});
	
	function registrarInformeAvance(){
		$('#modal-infoAvance').modal('hide');
		loadModalCargando();

		var objeto = $("#registrarInformeAvance").serializeObject();

		$.postJSON('mnto_InformeAvance.htm', objeto, function(data) {
			if(data == 1){
				listarInformeAvance();
				closeModalCargando();			
				
				$.gritter.add({
					title: 'Info!',
					text: 'Se realizo la operaci&oacute;n con &eacute;xito.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-info gritter-light'
				});
			}else if(data == 0){
				closeModalCargando();
				
				$.gritter.add({
					title: 'Advertencia!',
					text: 'Ocurrio un error al tratar de realizar la operaci&oacute;n.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-warning gritter-light'
				});
			}
		}).fail(function() {
			closeModalCargando();
			
			$.gritter.add({
				title: 'Error!',
				text: 'Ocurrio un error al tratar de realizar la operaci&oacute;n',
				sticky: false,
				time: '1200',
				class_name: 'gritter-error'
			});
		});
	}

	function limpiarMntInformeAvance(){
		$("#registrarInformeAvance").validate().resetForm();
		$('#registrarInformeAvance .control-group').removeClass('error');
		document.getElementById("registrarInformeAvance").reset();
		$("#idInformeAvance").val('');
	}
});