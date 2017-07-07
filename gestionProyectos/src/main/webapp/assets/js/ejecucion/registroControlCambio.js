$('document').ready(function(){
	$('#fecSolCtrolCambios').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy',
		maxDate: '0'
	});
	$('#fecSolCtrolCambios').datepicker().next().on('click', function(){  
		$(this).prev().focus();
	});
	
	$("#fecSolCtrolCambios").datepicker().datepicker("setDate", new Date());
	
	//-------------------------- [INI] CONTROL DE CAMBIOS ---------------------------------------
	$('#registrarCtrolCambios').validate({
		errorClass: 'help-block',
		rules: {
			solicitanteCtrolCambios: {
				required: false
			},
			descripcionCtrolCambios: {
				required: true,
				maxlength 	: 100
			},
			fecSolCtrolCambios: {
				required: true
			},
			complejidadCtrolCambios: {
				required: true
			},
			horasCtrolCambios: {
				required: true,
				digits 	: true
			},
			comentariosCtrolCambios: {
				required: true,
				maxlength 	: 100
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
			mantenimientoCtrolCambios();
		}
	});

	//Registro de Control de Cambios
	function mantenimientoCtrolCambios() 
	{
		var objeto = $("#registrarCtrolCambios").serializeObject();
		
		$.postJSON('mantenimiento_ctrolCambios.htm', objeto, function(data) {
			if(data == 1){
				$.gritter.add({
					title: 'Info!',
					text: 'Se realizo la operaci&oacute;n con &eacute;xito.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-info gritter-light'
				});

				$('#modal-ctrolCambios').modal('hide');
				listarCtrolCambios();
				
			}else if(data == 0){
				$.gritter.add({
					title: 'Error!',
					text: 'Ocurrio un error al tratar de realizar la operaci&oacute;n solicitada',
					sticky: false,
					time: '1200',
					class_name: 'gritter-error'
				});
			}
		}).fail(function() {
			$.gritter.add({
				title: 'Error!',
				text: 'Ocurrio un error al tratar de realizar la operaci&oacute;n solicitada',
				sticky: false,
				time: '1200',
				class_name: 'gritter-error'
			});
		});
	};

	//Listar Control de Cambios
	function listarCtrolCambios() {
		var t = $("#tablaControlCambios").DataTable();
		t.clear().draw();
		var objeto = new Object();
			objeto.estado = 1;

		$.postJSON('listar_CtrolCambios.htm',objeto,
			function(data) {
				console.log(data);
				for (i in data) {
					var accion = '<td class="td-actions">'+
									'<!-- [INI] BOTON EDITAR -->'+
									'<div class="hidden-phone visible-desktop action-buttons">'+
										'<a class="blue tooltip-info" href="#modal-ctrolCambios" data-toggle="modal" data-rel="tooltip"'+ 
										' title="Editar" onclick="editarCtrolCambios('+data[i].idCtrolCambios+')">'+
											'<i class="icon-edit bigger-130"></i>'+
										'</a></div>'+				
									'<div class="hidden-desktop visible-phone">'+
										'<div class="inline position-relative">'+
											'<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">'+
												'<i class="icon-caret-down icon-only bigger-120"></i>'+
											'</button>'+				
											'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
												'<li>'+
													'<a href="#modal-ctrolCambios" class="tooltip-info" data-rel="tooltip" '+  
														'title="Editar" data-toggle="modal" onclick="editarCtrolCambios('+data[i].idCtrolCambios+')">'+
														'<span class="blue">'+
															'<i class="icon-edit bigger-120"></i>'+
														'</span>'+
													'</a></li></ul></div>'+
									'</div>'+
									'<!-- [FIN] BOTON EDITAR -->'+
									'<!-- [INI] BOTON ELIMINAR -->'+
									'<div class="hidden-phone visible-desktop action-buttons">'+
										'<a class="red tooltip-error" href="#modal-eliminarCtrolCambios" data-toggle="modal" data-rel="tooltip"  '+ 
										   'title="Eliminar" onclick="eliminarCtrolCambios('+data[i].idCtrolCambios+')">'+
											'<i class="icon-trash bigger-130"></i>'+
										'</a></div>'+
									'<div class="hidden-desktop visible-phone">'+
										'<div class="inline position-relative">'+
											'<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">'+
												'<i class="icon-caret-down icon-only bigger-120"></i>'+
											'</button>'+
											'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
												'<li>'+
													'<a href="#modal-eliminarCtrolCambios" class="abrir-eliminarTproyecto tooltip-error" data-rel="tooltip"  '+  
														'title="Eliminar" data-toggle="modal" onclick="eliminarCtrolCambios('+data[i].idCtrolCambios+')">'+
														'<span class="red">'+
															'<i class="icon-trash bigger-120"></i>'+
														'</span>'+
													'</a></li></ul></div></div>'+
									'<!-- [FIN] BOTON ELIMINAR -->'+
								'</td>';

					t.row.add([data[i].codctrolcambios, data[i].descripcionCtrolCambios, data[i].fecSolCtrolCambios, data[i].dscSolicitante, 
							data[i].dscComplejidad, data[i].horasEstimadas, data[i].comentarios, accion ]).draw();
				}
		});
	};

	//Eliminar Control de Cambios
	$("#formEliminarCtrolCambios").submit(
			function() {
		var objeto = $("#formEliminarCtrolCambios").serializeObject();

		$.postJSON('eliminar_ctrolCambios.htm',objeto,
			function(data) {
			if(data == 1){
				$.gritter.add({
					title: 'Info!',
					text: 'Se elimino el registro seleccionado con &eacute;xito.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-info gritter-light'
				});

				$('#modal-eliminarCtrolCambios').modal('hide');
				listarCtrolCambios();
				
			}else if(data == 0){
				$.gritter.add({
					title: 'Error!',
					text: 'Ocurrio un error al tratar de realizar la operaci&oacute;n solicitada',
					sticky: false,
					time: '1200',
					class_name: 'gritter-error'
				});
			}
		}).fail(function() {
			$.gritter.add({
				title: 'Error!',
				text: 'Ocurrio un error al tratar de realizar la operaci&oacute;n solicitada',
				sticky: false,
				time: '1200',
				class_name: 'gritter-error'
			});
		});
			return false;
	});

	function limpiarmntCtrolCambios(){
		$("#registrarCtrolCambios").validate().resetForm();
		$('#registrarCtrolCambios .control-group').removeClass('error');
		document.getElementById("registrarCtrolCambios").reset();
	};

	//Limpiar Lecciones Aprendidas
	$('#btnCtrolCambios').click( function () {
	    	limpiarmntCtrolCambios();
	});
	//-------------------------- [FIN] CONTROL DE CAMBIOS ---------------------------------------
});