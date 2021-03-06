$('document').ready(function(){
	$('#fecIniTarea').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy',
		 defaultDate: 0
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
	
	
	//-------------------------- [INI] TAREA ---------------------------------------
	$('#registrarTarea').validate({
		errorClass: 'help-block',
		rules: {
			idEstadoTarea: {
				required: true
			},
			descripcionTarea: {
				required: true,
				maxlength 	: 100
			},
			fecIniTarea: {
				required: true
			},
			fecFinTarea: {
				required: true
			},
			duracion: {
				required: true,
				digits 	: true
			},
			recursoTarea: {
				required: true
			},
			idResponsableTarea: {
				required: true
			},
			idComplejidadTarea: {
				required: true
			},
			justificacionTarea: {
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
			mantenimientoRegistroTareas();
		}
	});

	//Registro Tareas
	function mantenimientoRegistroTareas(){
		var objeto = $("#registrarTarea").serializeObject();
		var tabla = $("#tablaSegTareas").DataTable();
		var tamanio = $("#tablaSegTareas").DataTable().data().length;
			
		if($("#tipoOperacion").val() == "AGREGAR"){
			objeto.estadoTarea = 1;
				
			tabla.row.add({ 
			                "descripcion"   : objeto.descripcionTarea, 
			                "fechaInicio"	: objeto.fecIniTarea, 
			                "fechaFin"		: objeto.fecFinTarea, 
			                "dscComplejidad": $("#complejidadTarea option:selected").text(), 
				            "horas"			: objeto.duracion, 
				            "dscEstado"		: objeto.dscEstadoTarea, 
				            "justificacion" : objeto.justificacionTarea, 
				            "idEstado"		: objeto.idEstadoTarea, 
				            "idComplejidad" : objeto.idComplejidadTarea,  
				            "precede"		: objeto.idTareaPredecesora,
				            "id"			: objeto.idTarea,
				            "estadoTarea"	: objeto.estadoTarea
			}).draw();
		}else{
			var objetoSelec = $("#tablaSegTareas").DataTable().row('.selected');
			objetoSelec.cell('.selected', 1).data(objeto.descripcionTarea);
			objetoSelec.cell('.selected', 2).data(objeto.fecIniTarea);
			objetoSelec.cell('.selected', 3).data(objeto.fecFinTarea);
			objetoSelec.cell('.selected', 4).data($("#complejidadTarea option:selected").text());
			objetoSelec.cell('.selected', 5).data(objeto.duracion);
			objetoSelec.cell('.selected', 6).data(objeto.dscEstadoTarea);
			objetoSelec.cell('.selected', 7).data(objeto.justificacionTarea);
			objetoSelec.cell('.selected', 8).data(objeto.idEstadoTarea);
			objetoSelec.cell('.selected', 9).data(objeto.idComplejidadTarea);
			objetoSelec.cell('.selected', 10).data(objeto.recursoTarea);
			objetoSelec.cell('.selected', 11).data(objeto.idTareaPredecesora);
			objetoSelec.cell('.selected', 12).data(objeto.idResponsableTarea);
			
		}

		$('#modal-Tarea').modal('hide');
	}

	//Limpiar Tareas
	$('#btnAgregarTarea').click( function () {
	    	limpiarTarea();
	    	agregarTareaPredecesora();
	    	$("#tipoOperacion").val("AGREGAR");
	});

	function limpiarTarea(){
		$("#registrarTarea").validate().resetForm();
		$('#registrarTarea .control-group').removeClass('error');
		document.getElementById("registrarTarea").reset();
	}
	
	function agregarTareaPredecesora(){
		var cant = $("#tablaSegTareas").DataTable().data().length;
		if(cant > 0){
			$("#tareaPredecesora").empty();
			$("#tareaPredecesora").append('<option value="">Seleccionar</option>');
			var data = $("#tablaSegTareas").DataTable().rows().data();
			$.each(data, function (key, value) {
	             $("#tareaPredecesora").append("<option value=" + value.id + ">" + value.descripcion + "</option>");
	         });
		}
	}

	//Editar Tareas
	$('#btnEditarTarea').click( function () {
	    	EditarTarea();
	});

	function EditarTarea(){
		var datos = $("#tablaSegTareas").DataTable().row('.selected').length;
		var data = $("#tablaSegTareas").DataTable().row('.selected').data();

		$("#tipoOperacion").val("EDITAR");
		
		if(datos == 0){
			$.gritter.add({
					title: 'Advertencia!',
					text: 'Seleccion un registro de la grilla.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-warning gritter-light'
				});
		}else{
			$("#codTarea").val(data.codigo);
			$("#estadoTarea").val(data.estadoTarea);
			$("#descripcionTarea").val(data.descripcion);
			$("#fecIniTarea").val(data.fechaInicio);
			$("#fecFinTarea").val(data.fechaFin);
			$("#horasTarea").val(data.horas);
			$("#recursoTarea").val(data.dscRecursos);
			$("#responsableTarea").val(data.idResponsable);
			$("#complejidadTarea").val(data.idComplejidad);
			$("#justificacionTarea").val(data.justificacion);
			$("#tareaPredecesora").val(data.precede);
			$("#idTarea").val(data.id);

			$('#modal-Tarea').modal('show');
		}
	}

	//Eliminar Tareas
	$('#btnEliminarTarea').click( function () {
	    	EliminarTarea();
	});

	function EliminarTarea(){
		var datos = $("#tablaSegTareas").DataTable().row('.selected').length;
		var data = $("#tablaSegTareas").DataTable().row('.selected').data();
		
		if(datos > 0){
			var objeto = new Object();
			objeto.id = data.id;
			objeto.idProyecto = $("#idProyectoGeneral").val(); 

			bootbox.setLocale('es');
			bootbox.confirm("Esta seguro de eliminar la fila seleccionada?", function(result) {
						if(result) {
							$.postJSON('eliminar_TareaCronograma.htm', objeto, function(data) {
								$("#tablaSegTareas").DataTable().row('.selected').remove().draw(false);

								$.gritter.add({
									title: 'Info!',
									text: 'Se realizo la operaci&oacute;n con &eacute;xito.',
									sticky: false,
									time: '1200',
									class_name: 'gritter-info gritter-light'
								});
							});
						}
			});
		}else{
			$.gritter.add({
					title: 'Advertencia!',
					text: 'Seleccione un registro.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-warning gritter-light'
			});
		}
	}

	//Guardar Tareas
	$('#btnGuardarTarea').click( function () {
	    	GuardarTarea();
	});

	function GuardarTarea(){
		var datos = $("#tablaSegTareas").DataTable().data().length;

		if(datos > 0){
			//Se guarda sin seleccionar el control de cambios
			mantenimientoRegistroTareasCtrolCambios();
		}else{
			$.gritter.add({
					title: 'Advertencia!',
					text: 'No existen cambios para registrar.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-warning gritter-light'
			});

		}
	}

	//Almacena en BD
	function mantenimientoRegistroTareasCtrolCambios()
	{
		var objetoCtrol = null;
			objetoCtrol = new Object();
			objetoCtrol["lista"] =  obtenerTareaJson();
			objetoCtrol.idProyecto = $("#codigoPy").val();
			
			$.postJSON('mantenimiento_TareasctrolCambio.htm', objetoCtrol, function(data) {
				if(data){
					dataTarea = eval(data);
					$("#tablaSegTareas").DataTable().ajax.reload();
					
					$.gritter.add({
						title: 'Info!',
						text: 'Se realizo la operaci&oacute;n con &eacute;xito.',
						sticky: false,
						time: '1200',
						class_name: 'gritter-info gritter-light'
					});
					
				}
			}).fail(function() {
				$.gritter.add({
					title: 'Error!',
					text: 'Ocurrio un error al tratar de realizar la operaci&oacute;n',
					sticky: false,
					time: '1200',
					class_name: 'gritter-error'
				});
			});
	}
	
	function obtenerTareaJson() {
		var jsonObjTareas = [];		
		var data = $("#tablaSegTareas").DataTable().rows().data();

		if (data.length > 0){
			$.each( data, function( i, l ){
				jsonObjTareas.push(data[i]);	
			});
		}
		
		return jsonObjTareas;
	}
	//-------------------------- [FIN] TAREA ---------------------------------------
});