<script src="../assets/plugins/validate/additional/integer.js"></script>
<script type="text/javascript">

//[INI] CARGA DE TABLAS
$(function() {
		 $('#tablaTipoProyecto').DataTable({
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
		 
		 $('#tablaEstadoProyecto').DataTable({
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
		 		 
		 $('#tablaTipoRequisitoProyecto').DataTable({
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
});	
//[FIN] CARGA DE TABLAS

//#################################################### [INI] TIPO PROYECTO ####################################################
//Validar tipo proyecto
$('#registrarTipoProyecto').validate({
	errorClass: 'help-block',
	rules: {
		descripcion: {
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
		registrarTipoProyecto();
	}
});
				
//Registrar tipo proyecto 
function registrarTipoProyecto() 
{
	var objeto = $("#registrarTipoProyecto").serializeObject();
	objeto.estado = 1;
	console.log(objeto);
	$.postJSON('${pageContext.request.contextPath}/administracion/registrar_tipoProyecto.htm', objeto, function(data) {
		if(data == 0){
			$.gritter.add({
				title: 'Info!',
				text: 'Se registro con éxito.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light'
			});
			
			listarTipoProyecto();
		}else if(data == 1){
			$.gritter.add({
				title: 'Advertencia!',
				text: 'Existe un registro con los mismos datos.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-warning gritter-light'
			});
		}
	}).fail(function() {
		$.gritter.add({
			title: 'Error!',
			text: 'Ocurrio un error al tratar de realizar el registro',
			sticky: false,
			time: '1200',
			class_name: 'gritter-error'
		});
	});
	
	$("#descripcionTipoProyecto").val('');
};

//Listar tipo proyectos
function listarTipoProyecto() {
	var t = $("#tablaTipoProyecto").DataTable();
	t.clear().draw();
	var dato = 1;
	$.postJSON('${pageContext.request.contextPath}/administracion/listar_tipoProyecto.htm',dato,
		function(data) {
			console.log(data);
			for (i in data) {
				var descripcion = data[i].descripcion;
				var activado = '';
				if (data[i].estado == 1) {
					activado = '<span class="label label-info"><b>ACTIVO</b></span>';
				} else {
					activado = '<span class="label label-danger"><b>INACTIVO</b></span>';
				}
				var accion = '<td class="td-actions">'+'<div class="hidden-phone visible-desktop action-buttons">'+
							 '<a class="abrir-eliminarTproyecto red tooltip-error" data-rel="tooltip" title="Eliminar" href="#eliminarTipoProyecto" data-toggle="modal" data-id="'+data[i].id+'">'+
							 '<i class="icon-trash bigger-130"></i></a></div>'+
							 '<div class="hidden-desktop visible-phone"><div class="inline position-relative">'+
							 '<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">'+
							 '<i class="icon-caret-down icon-only bigger-120"></i></button>'+
							 '<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
							 '<li><a href="##eliminarTipoProyecto" class="abrir-eliminarTproyecto tooltip-error" data-rel="tooltip" '+
							 'title="Eliminar" data-toggle="modal" data-id="'+data[i].id+'">'+'<span class="red">'+
							 '<i class="icon-trash bigger-120"></i></span></a></li></ul></div></div></td>';

				t.row.add([++i, descripcion, activado, accion ]).draw();
			}
		});
};

//Pasar parametro eliminar tipo proyecto
$(document).on("click", ".abrir-eliminarTproyecto", function () {
     var id = $(this).data('id');
     $(".modal-body #idTipoProyecto").val(id);
});

//Eliminar Tipo Proyecto
$("#formEliminarTipoProyecto").submit(
		function() {
			var objeto = document.getElementById("idTipoProyecto").value;  //$(this).serializeObject();
			console.log(objeto);
			$.postJSON('${pageContext.request.contextPath}/administracion/eliminar_tipoProyecto.htm',objeto, function(data) {
				$('#eliminarTipoProyecto').modal('hide');
				$.gritter.add({
					title: 'Info!',
					text: 'Se eliminó correctamente.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-info gritter-light'
				});
								
				listarTipoProyecto();
			}).fail(function() {
				
			});
			
		return false;
});
//#################################################### [FIN] TIPO PROYECTO ####################################################

//#################################################### [INI] ESTADO PROYECTO ##################################################
//Validar estado proyecto
$('#registrarEstadoProyecto').validate({
	errorClass: 'help-block',
	rules: {
		descripcion: {
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
		registrarEstadoProyecto();
	}
});

//Registrar estado proyecto
function registrarEstadoProyecto() 
{
	var objeto = $("#registrarEstadoProyecto").serializeObject();
	objeto.estado = 1;
	console.log(objeto);
	$.postJSON('${pageContext.request.contextPath}/administracion/registrar_estadoProyecto.htm', objeto, function(data) {
		if(data == 0){
			$.gritter.add({
				title: 'Info!',
				text: 'Se registro con éxito.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light'
			});
			
			listarEstadoProyecto();
		}else if(data == 1){
			$.gritter.add({
				title: 'Advertencia!',
				text: 'Existe un registro con los mismos datos.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-warning gritter-light'
			});
		}
	}).fail(function() {
		$.gritter.add({
			title: 'Error!',
			text: 'Ocurrio un error al tratar de realizar el registro',
			sticky: false,
			time: '1200',
			class_name: 'gritter-error'
		});
	});
	
	$("#descripcionEstadoProyecto").val('');	
};

//Listar estado proyectos
function listarEstadoProyecto() {
	var t = $("#tablaEstadoProyecto").DataTable();
	t.clear().draw();
	var dato = 1;
	$.postJSON('${pageContext.request.contextPath}/administracion/listar_estadoProyecto.htm',dato,
		function(data) {
			console.log(data);
			for (i in data) {
				var descripcion = data[i].descripcion;
				var activado = '';
				if (data[i].estado == 1) {
					activado = '<span class="label label-info"><b>ACTIVO</b></span>';
				} else {
					activado = '<span class="label label-danger"><b>INACTIVO</b></span>';
				}
				var accion = '<td class="td-actions">'+'<div class="hidden-phone visible-desktop action-buttons">'+
							 '<a class="abrir-eliminarEproyecto red tooltip-error" data-rel="tooltip" title="Eliminar" href="#eliminarEstadoProyecto" data-toggle="modal" data-id="'+data[i].id+'">'+
							 '<i class="icon-trash bigger-130"></i></a></div>'+
							 '<div class="hidden-desktop visible-phone"><div class="inline position-relative">'+
							 '<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">'+
							 '<i class="icon-caret-down icon-only bigger-120"></i></button>'+
							 '<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
							 '<li><a href="##eliminarEstadoProyecto" class="abrir-eliminarEproyecto tooltip-error" data-rel="tooltip" '+
							 'title="Eliminar" data-toggle="modal" data-id="'+data[i].id+'">'+'<span class="red">'+
							 '<i class="icon-trash bigger-120"></i></span></a></li></ul></div></div></td>';

				t.row.add([++i, descripcion, activado, accion ]).draw();
			}
		});
};

//Pasar parametro eliminar estado proyecto
$(document).on("click", ".abrir-eliminarEproyecto", function () {
   var id = $(this).data('id');
   $(".modal-body #idEstadoProyecto").val(id);
});

//Eliminar Estado Proyecto
$("#formEliminarEstadoProyecto").submit(
		function() {
			var objeto = document.getElementById("idEstadoProyecto").value;
			console.log(objeto);
			$.postJSON('${pageContext.request.contextPath}/administracion/eliminar_estadoProyecto.htm',objeto, function(data) {
				$('#eliminarEstadoProyecto').modal('hide');
				$.gritter.add({
					title: 'Info!',
					text: 'Se eliminó correctamente.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-info gritter-light'
				});
								
				listarEstadoProyecto();
			}).fail(function() {
				
			});
			
		return false;
});
//#################################################### [FIN] ESTADO PROYECTO ####################################################
//#################################################### [INI] TIPO REQUISITO #####################################################
//validar tipo requisito
$('#registrarTipoRequisito').validate({
	errorClass: 'help-block',
	rules: {
		idTipoProyecto: {
			required: true
		},
		descripcion: {
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
		registrarTipoRequisitoProyecto();
	}
});

//Registrar tipo requisito
function registrarTipoRequisitoProyecto() 
{
	var objeto = $("#registrarTipoRequisito").serializeObject();
	objeto.estado = 1;
	console.log(objeto);
	$.postJSON('${pageContext.request.contextPath}/administracion/registrar_tipoRequisitoProyecto.htm', objeto, function(data) {
		if(data == 0){
			$.gritter.add({
				title: 'Info!',
				text: 'Se registro con éxito.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light' 
			});
			
			listarTipoRequisitoProyecto();
		}else if(data == 1){
			$.gritter.add({
				title: 'Advertencia!',
				text: 'Existe un registro con los mismos datos.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-warning gritter-light'
			});
		}
	}).fail(function() {
		$.gritter.add({
			title: 'Error!',
			text: 'Ocurrio un error al tratar de realizar el registro',
			sticky: false,
			time: '1200',
			class_name: 'gritter-error'
		});
	});
	
	$("#idReqProyecto").val('');	
};

//Listar tipo Requisito proyectos
function listarTipoRequisitoProyecto() {
	var t = $("#tablaTipoRequisitoProyecto").DataTable();
	t.clear().draw();
	var dato = 1;
	$.postJSON('${pageContext.request.contextPath}/administracion/listar_tipoRequisitoProyecto.htm',dato,
		function(data) {
			console.log(data);
			for (i in data) {
				var descripcion = data[i].descripcion;
				var dsc_tipoproyecto = data[i].dsc_tipoproyecto;
				var activado = '';
				if (data[i].estado == 1) {
					activado = '<span class="label label-info"><b>ACTIVO</b></span>';
				} else {
					activado = '<span class="label label-danger"><b>INACTIVO</b></span>';
				}
							 
				var accion = '<td class="td-actions">'+'<div class="hidden-phone visible-desktop action-buttons">'+
							 '<a class="abrir-eliminarTipReqproyecto red tooltip-error" data-rel="tooltip" title="Eliminar" href="#eliminarTipReqProyecto" data-toggle="modal" data-id="'+ data[i].id+'">'+
							 '<i class="icon-trash bigger-130"></i></a></div>'+
							 '<div class="hidden-desktop visible-phone"><div class="inline position-relative">'+
							 '<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">'+
							 '<i class="icon-caret-down icon-only bigger-120"></i></button>'+
							 '<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+ 
							 '<li><a href="#eliminarTipReqProyecto" class="abrir-eliminarTipReqproyecto tooltip-error" data-rel="tooltip"'+
							 ' title="Eliminar" data-toggle="modal" data-id="'+data[i].id+'"> <span class="red">'+
							 '<i class="icon-trash bigger-120"></i></span></a></li></ul></div></div></td>';
				t.row.add([++i, dsc_tipoproyecto, descripcion, activado, accion]).draw();
			}
		});
};



//Pasar parametro eliminar tipo requisito proyecto
$(document).on("click", ".abrir-eliminarTipReqproyecto", function () {
 var id = $(this).data('id');
 $(".modal-body #idTipReqProyecto").val(id);
});

//Eliminar Tipo requisito Proyecto
$("#formEliminarTipReqEstadoProyecto").submit(
		function() {
			var objeto = document.getElementById("idTipReqProyecto").value;
			console.log(objeto);
			$.postJSON('${pageContext.request.contextPath}/administracion/eliminar_tipoRequisitoProyecto.htm',objeto, function(data) {
				$('#eliminarTipReqProyecto').modal('hide');
				$.gritter.add({
					title: 'Info!',
					text: 'Se eliminó correctamente.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-info gritter-light'
				});
								
				listarTipoRequisitoProyecto();
			}).fail(function() {
				
			});
			
		return false;
});
//#################################################### [FIN] TIPO REQUISITO #####################################################
</script>