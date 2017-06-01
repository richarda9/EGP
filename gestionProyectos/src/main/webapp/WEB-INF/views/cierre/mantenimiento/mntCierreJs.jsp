<script src="../assets/js/bootbox.min.js"></script>
<script>
$('#fechaCierreProyecto').datepicker({
	language: 'es',
	format: 'dd/mm/yyyy'
});

$('#fechaCierreProyecto').datepicker().next().on('click', function(){ 
	$(this).prev().focus();
});

$('#tablaLecAprendidasProyecto').DataTable({
	"paging"     : true,
	"autoWidth"  : true,
	"pageLength" : 10,
	"searching"  : false,
	"bInfo"      : false, 
	//"bLengthChange": false,
	"language"   : {
						"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
			       }
});

$('#tablaCierreProyecto').DataTable({
	"order"		 : [[0, "asc"]],  
	"paging"     : true,
	"autoWidth"  : true,
	"pageLength" : 10,
	"searching"  : false,
	"bInfo"      : false, 
	//"bLengthChange": false,
	"language"   : {
						"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
			       }
});

//-------------------------- [INI] LECCIONES APRENDIDAS ----------------------------------
$('#formMntLeccionAprendida').validate({
	errorClass: 'help-block',
	rules: {
		idEntregableAfectado: {
			required: true
		},
		dscproblema: {
			required: true,
			maxlength 	: 300
		},
		dsccausa: {
			required: true,
			maxlength 	: 300
		},
		dsccorrelativa: {
			required: true,
			maxlength 	: 300
		},
		dscobtenido: {
			required: true,
			maxlength 	: 300
		},
		dscaprendida: {
			required: true,
			maxlength 	: 300
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
		mantenimientoLeccionesAprendidas();
	}
});

//Registro de Lecciones Aprendidas
function mantenimientoLeccionesAprendidas() 
{
	var objeto = $("#formMntLeccionAprendida").serializeObject();
		objeto.idProyecto = $("#idProyectoGeneral").val();
	console.log(objeto);
	$.postJSON('${pageContext.request.contextPath}/cierre/mantenimiento_leccionAprendida.htm', objeto, function(data) {
		if(data == 1){
			$.gritter.add({
				title: 'Info!',
				text: 'Se realizo la operaci&oacute;n con &eacute;xito.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light'
			});

			$('#mntLeccionAprendida').modal('hide');
			listarLeccionAprendida();
			
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

//Listar Lecciones Aprendidas
function listarLeccionAprendida() {
	var t = $("#tablaLecAprendidasProyecto").DataTable();
	t.clear().draw();
	var objeto = new Object();
	if($("#idEntregable").val())
		objeto.idEntregableAfectado = $("#idEntregable").val();
	else
		objeto.idEntregableAfectado = null;
	
	if($("#idProyectoGeneral").val())
		objeto.idProyecto = $("#idProyectoGeneral").val();
	else
		objeto.idProyecto = null;

	$.postJSON('${pageContext.request.contextPath}/cierre/listar_LeccionesAprendidas.htm',objeto,
		function(data) {
			console.log(data);
			for (i in data) {
				var accion = '<td class="td-actions">'+
								'<!-- [INI] BOTON EDITAR -->'+
								'<div class="hidden-phone visible-desktop action-buttons">'+
									'<a class="blue tooltip-info" href="#mntLeccionAprendida" data-toggle="modal" data-id="'+data[i].idLeccionAprendida+'"'+ 
									   ' data-rel="tooltip" title="Editar" onclick="editarLeccionAprendida('+data[i].idLeccionAprendida+')">'+
									   '<i class="icon-edit bigger-130"></i></a>'+
								'</div>'+
								'<div class="hidden-desktop visible-phone"><div class="inline position-relative">'+
										'<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">'+
											'<i class="icon-caret-down icon-only bigger-120"></i></button>'+
										'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
											'<li><a href="#mntLeccionAprendida" class="tooltip-info" data-rel="tooltip" title="Editar" data-toggle="modal"'+
											' data-id="'+data[i].idLeccionAprendida+'" onclick="editarLeccionAprendida('+data[i].idLeccionAprendida+')">'+
											'<span class="blue"><i class="icon-edit bigger-120"></i></span>'+
												'</a></li></ul></div></div><!-- [FIN] BOTON EDITAR -->'+
								'<!-- [INI] BOTON ELIMINAR -->'+
								'<div class="hidden-phone visible-desktop action-buttons">'+
									'<a class="red tooltip-error" href="#eliminarLeccionAprendida" data-toggle="modal" data-id="'+data[i].idLeccionAprendida+'"'+ 
									   ' data-rel="tooltip" title="Eliminar" onclick="eliminarLeccionAprendida('+data[i].idLeccionAprendida+')">'+
									   '<i class="icon-trash bigger-130"></i></a></div>'+
								'<div class="hidden-desktop visible-phone"><div class="inline position-relative">'+
										'<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">'+
											'<i class="icon-caret-down icon-only bigger-120"></i></button>'+
										'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
											'<li><a href="#eliminarLeccionAprendida" class="tooltip-error" data-rel="tooltip" title="Eliminar" data-toggle="modal" data-id="'+
											data[i].idLeccionAprendida+'" onclick="eliminarLeccionAprendida('+data[i].idLeccionAprendida+')">'+
											'<span class="red"><i class="icon-trash bigger-120"></i></span></a></li>'+
										'</ul></div></div><!-- [FIN] BOTON ELIMINAR -->'+
							'</td>';

				t.row.add([data[i].codLeccionAprendida, data[i].nombreEntregable, data[i].dscproblema, data[i].dsccausa, 
						data[i].dsccorrelativa, data[i].dscobtenido, data[i].dscaprendida, accion ]).draw();
			}
		});
};

//Editar Lecciones Aprendidas
function editarLeccionAprendida(id){
	var objeto = new Object();
		objeto.idLeccionAprendida = id;
	$.postJSON('${pageContext.request.contextPath}/cierre/listar_LeccionesAprendidas.htm',objeto,
		function(data) {
			$("#idEntregableAfectado").val(data[0].idEntregableAfectado);
			$("#dscproblema").val(data[0].dscproblema);
			$("#dsccausa").val(data[0].dsccausa);
			$("#dsccorrelativa").val(data[0].dsccorrelativa);
			$("#dscobtenido").val(data[0].dscobtenido);
			$("#dscaprendida").val(data[0].dscaprendida);
			$("#idProyectoLecAprendida").val(data[0].idProyecto);
			$("#idLeccionAprendida").val(data[0].idLeccionAprendida);
		}
	);
}

//Eliminar Lecciones Aprendidas
function eliminarLeccionAprendida(id){
     $("#idLeccionAprendidaEliminar").val(id);
}

$("#formEliminarLeccionAprendida").submit(
		function() {
	var objeto = $("#formEliminarLeccionAprendida").serializeObject();

	$.postJSON('${pageContext.request.contextPath}/cierre/eliminar_LeccionesAprendidas.htm',objeto,
		function(data) {
		if(data == 1){
			$.gritter.add({
				title: 'Info!',
				text: 'Se elimino el registro seleccionado con &eacute;xito.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light'
			});

			$('#eliminarLeccionAprendida').modal('hide');
			listarLeccionAprendida();
			
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

//Limpiar Lecciones Aprendidas
$('#btnAgregarLecAprendida').click( function () {
    	limpiarLeccionesAprendida();
});

//Buscar Lecciones Aprendidas
$('#btnBuscarLecAprendida').click( function () {
    	listarLeccionAprendida();
});

function limpiarLeccionesAprendida(){
	$("#formMntLeccionAprendida").validate().resetForm();
	$('#formMntLeccionAprendida .control-group').removeClass('error');
	document.getElementById("formMntLeccionAprendida").reset();
}

//-------------------------- [FIN] LECCIONES APRENDIDAS ----------------------------------
//-------------------------- [INI] ACTA DE CIERRE ----------------------------------------
$('#registrarActaCierre').validate({
	errorClass: 'help-block',
	rules: {
		idSponsor: {
			required: true
		},
		declAceptacion: {
			required: true,
			maxlength 	: 100
		},
		tipoLeccion: {
			required: false
		},
		vistaPrevia: {
			required: true,
			maxlength 	: 100
		},
		observacion: {
			required: true,
			maxlength 	: 100
		},
		firmas: {
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
		mantenimientoActaCierre();
	}
});

//Registro de Acta de Cierre
function mantenimientoActaCierre(){
	var objeto = $("#registrarActaCierre").serializeObject();
	
	console.log(objeto);

	$.postJSON('${pageContext.request.contextPath}/cierre/mantenimiento_actaCierre.htm', objeto, function(data) {
		if(data == 1){
			$.gritter.add({
				title: 'Info!',
				text: 'Se realizo la operaci&oacute;n con &eacute;xito.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light'
			});

			$('#modal-ActaCierre').modal('hide');
			listarActadeCierre();
			
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
}

//Listar Acta de Cierre
function listarActadeCierre() {
	var t = $("#tablaCierreProyecto").DataTable();
	t.clear().draw();
	var objeto = new Object();
	
	if($("#idProyectoGeneral").val())
		objeto.idProyecto = $("#idProyectoGeneral").val();
	else
		objeto.idProyecto = null;

	$.postJSON('${pageContext.request.contextPath}/cierre/listar_ActaCierre.htm',objeto,
		function(data) {
			console.log(data);
			for (i in data) {
				var accion = '<td class="td-actions">';
				
				if(data[i].envioCorreo == 0){
					accion = accion + 
							 '<!-- [INI] BOTON EDITAR -->'+
							 '<div class="hidden-phone visible-desktop action-buttons">'+
							 	'<a class="blue tooltip-info" href="#modal-ActaCierre" data-toggle="modal" data-id="'+ data[i].idActaCierre +
							 	'" data-rel="tooltip" title="Editar" onclick="editarActaCierre('+ data[i].idActaCierre +')"><i class="icon-edit bigger-130"></i></a></div><div class="hidden-desktop visible-phone">'+
							 	'<div class="inline position-relative"><button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">'+
							 	'<i class="icon-caret-down icon-only bigger-120"></i></button>'+
							 	'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close"><li><a href="#modal-ActaCierre" '+
							 	'class="tooltip-info" data-rel="tooltip" title="Editar" data-toggle="modal" data-id="'+ data[i].idActaCierre +'" onclick="editarActaCierre('+ data[i].idActaCierre +')"><span class="blue">'+ 
							 	'<i class="icon-edit bigger-120"></i></span></a></li></ul></div></div><!-- [FIN] BOTON EDITAR -->';
				}
							 	
					accion = accion + '<!-- [INI] BOTON IMPRIMIR -->'+
							 	'<div class="hidden-phone visible-desktop action-buttons"><a class="blue tooltip-info" href="#modal-VisualizarCertificacion" '+
							 	'data-toggle="modal" data-id="'+ data[i].idActaCierre +'" data-rel="tooltip" title="Imprimir"><i class="icon-print bigger-130"></i>'+
							 	'</a></div><div class="hidden-desktop visible-phone"><div class="inline position-relative">'+
							 	'<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown"><i class="icon-caret-down icon-only bigger-120"></i>'+
							 	'</button><ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close"><li>'+
							 	'<a href="#modal-VisualizarCertificacion" class="tooltip-info" data-rel="tooltip" title="Imprimir" data-toggle="modal" data-id="'+ data[i].idActaCierre +
							 	'"><span class="blue"><i class="icon-print bigger-120"></i></span></a></li></ul></div></div>'+
							 	'<!-- [FIN] BOTON IMPRIMIR --><!-- [INI] BOTON ENVIAR CORREO --><div class="hidden-phone visible-desktop action-buttons">'+
							 	'<a class="blue tooltip-info" href="#modal-EnviarCertificacion" data-toggle="modal" data-id="'+ data[i].idActaCierre +'" data-rel="tooltip" title="Enviar por Correo">'+
							 	'<i class="icon-envelope bigger-130"></i></a></div><div class="hidden-desktop visible-phone"><div class="inline position-relative">'+
							 	'<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown"><i class="icon-caret-down icon-only bigger-120"></i>'+
							 	'</button><ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close"><li>'+
							 	'<a href="#modal-EnviarCertificacion" class="abrir-eliminarTproyecto tooltip-info" data-rel="tooltip" title="Enviar por Correo"'+
							 	' data-toggle="modal" data-id="'+ data[i].idActaCierre +'"><span class="blue"><i class="icon-envelope bigger-120"></i></span>'+
							 	'</a></li></ul></div></div><!-- [FIN] BOTON ENVIAR CORREO --></td>';

				t.row.add([data[i].versionActa, data[i].dscSponsor, data[i].responsable, data[i].fechaElaboracion, accion]).draw();
			}
		});
};

//Editar Acta de Cierre
function editarActaCierre(id){
	var objeto = new Object();
		objeto.idActaCierre = id;
	$.postJSON('${pageContext.request.contextPath}/cierre/listar_ActaCierre.htm',objeto,
		function(data) {
			if(data[0].envioCorreo == 1){
				$('#modal-ActaCierre').modal('hide');
				bootbox.dialog("No es posible editar, ya que se envio por correo al Sponsor", [{
						"label" : "Salir",
						"class" : "btn-small"
						}]
					);

			}else{
				$("#idActaCierre").val(data[0].idActaCierre);
				$("#idProyectoActaCierre").val(data[0].idProyecto);
				$("#sponsor").val(data[0].idSponsor);
				$("#declaAceptacion").val(data[0].declAceptacion);
				data[0].tipoLeccionEntregbale == '1' ? $("#tipoLeccionEntregbale").prop("checked", true) : $("#tipoLeccionEntregbale").prop("checked", false);
				data[0].tipoLeccionAdquisiciones == '1' ? $("#tipoLeccionAdquisiciones").prop("checked", true) : $("#tipoLeccionAdquisiciones").prop("checked", false);
				data[0].tipoLeccionLecAprendida == '1' ? $("#tipoLeccionLecAprendida").prop("checked", true) : $("#tipoLeccionLecAprendida").prop("checked", false);
				data[0].tipoLeccionEncuesta == '1' ? $("#tipoLeccionEncuesta").prop("checked", true) : $("#tipoLeccionEncuesta").prop("checked", false);
				$("#descripcionTarea").val(data[0].vistaPrevia);
				$("#observaciones").val(data[0].observacion);
				$("#firmas").val(data[0].firmas);
			}
		}
	);
}

//Limpiar Acta de Cierre
$('#btnAgregarActaCierre').click( function () {
    	limpiarActaCierre();
});

function limpiarActaCierre(){
	$("#registrarActaCierre").validate().resetForm();
	$('#registrarActaCierre .control-group').removeClass('error');
	document.getElementById("registrarActaCierre").reset();
}

//Enviar por correo


//-------------------------- [FIN] ACTA DE CIERRE ----------------------------------------
//-------------------------- [FIN] CIERRE PROYECTO ---------------------------------------
$('#formCierreProyecto').validate({
	errorClass: 'help-block',
	rules: {
		fechaCierreProyecto: {
			required: true
		},
		comentariosCierreProyecto: {
			required: true,
			maxlength 	: 200
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
		return false;
	}
});
//-------------------------- [FIN] CIERRE PROYECTO ---------------------------------------


</script>