$('document').ready(function(){
	$('#fecCompAdquisiciones').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fecCompAdquisiciones').datepicker().next().on('click', function(){  
		$(this).prev().focus();
	});

	$('#registrarAdquisiciones').validate({
		errorClass: 'help-block',
		rules: {
			id: {
				required: false
			},
			estado: {
				required: true
			},
			idestadoadquisicion: {
				required: true
			},
			idcatadquisicion: {
				required: true
			},
			producto: {
				required: true
			},
			fechaAdquisicion: {
				required: true
			},
			idresponsable: {
				required: true,
				number	: true
			},
			cantidad: {
				required: true
			},
			costoUnitario: {
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
			registrarAdquisiciones();
		}
	});

	$('#btnAdquisciones').click( function () {
		limpiarMntAdquisiciones();
	});

	//Registrar Recurso
	function registrarAdquisiciones() 
	{
		$('#modal-Adquisiciones').modal('hide');
		loadModalCargando();
		var objeto = $("#registrarAdquisiciones").serializeObject();
			objeto.idproyecto = $("#idProyectoGeneral").val();
		$.postJSON('mnto_Adquisiciones.htm', objeto, function(data) {
			if(data == 1){
				listarAdquisiciones();
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
	};

	//Listar tipo proyectos
	

	function limpiarMntAdquisiciones(){
		$("#registrarAdquisiciones").validate().resetForm();
		$('#registrarAdquisiciones .control-group').removeClass('error');
		document.getElementById("registrarAdquisiciones").reset();
	}

});