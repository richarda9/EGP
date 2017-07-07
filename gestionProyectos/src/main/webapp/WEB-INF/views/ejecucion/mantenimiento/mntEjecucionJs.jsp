<script src="../assets/js/bootstrap-wysiwyg.min.js"></script>
<script src="../assets/js/jquery.hotkeys.min.js"></script>
<script src="../assets/js/fuelux/data/fuelux.tree-sampledata.js"></script>
<script src="../assets/js/fuelux/fuelux.tree.min.js"></script>
<script src="../assets/js/ejecucion/registroTareas.js"></script>
<script src="../assets/js/ejecucion/asignarRecursos.js"></script>
<script src="../assets/js/ejecucion/envioAprobacion.js"></script>
<script src="../assets/js/ejecucion/envioCertificacion.js"></script>
<script src="../assets/js/ejecucion/registroAdquisiciones.js"></script>
<script src="../assets/js/ejecucion/registroControlCambio.js"></script>
<script src="../assets/js/ejecucion/registroSeguimientoEntregable.js"></script>
<script src="../assets/plugins/validate/additional/pattern.js"></script>
<script src="../assets/js/bootbox.min.js"></script>

<script>

var dataTarea = eval('${model.listaTareas}');
$(function() 
{	
	$('#tablaRecProveedor').DataTable({
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
	
	$('#tablaRecCliente').DataTable({
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
	
	var tablaSegTareas = $('#tablaSegTareas').DataTable({
		//"data"	 : eval('${model.listaTareas}'),
		
		"ajax"		 : function (data, callback, settings) {
			callback ( { data: dataTarea } );
		   },				        
		"paging"     : true,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 
		//"scrollCollapse": true,
		//"bLengthChange": false,
		"columnDefs"		:
	    	[
		    	{	"targets": [ 8 ], "visible": false, "searchable": false, "width": "0%"},
		        {	"targets": [ 9 ], "visible": false, "searchable": false, "width": "0%"},
		        {	"targets": [ 10 ], "visible": false, "searchable": false, "width": "0%"},
		        {	"targets": [ 11 ], "visible": false, "searchable": false, "width": "0%"},
		        {	"targets": [ 12 ], "visible": false, "searchable": false, "width": "0%"},
		        {	"targets": [ 13 ], "visible": false, "searchable": false, "width": "0%"},
		        {	"targets": [ 14 ], "visible": false, "searchable": false, "width": "0%"}
	    	],
	    "columns"		: [
	             		   {"data": "codigo"},  
	             		   {"data": "descripcion"},  
					       {"data": "fechaInicio"},                      
					       {"data": "fechaFin"},                  
					       {"data": "dscComplejidad"},    
					       {"data": "horas"},  
					       {"data": "dscEstado"},  
					       {"data": "justificacion"},
					       {"data": "idEstado"},
					       {"data": "idComplejidad"},
					       {"data": "dscRecursos"},
					       {"data": "precede"},
					       {"data": "idResponsable"},
					       {"data": "id"},
					       {"data": "estadoTarea"}
						  ],
	    "destroy"		: true,
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       }
	});

	$('#tablaSegTareas tbody').on( 'click', 'tr', function () {
		var texto = this.innerText; 
		
		//alert(tablaSegTareas.cell( this ).data());
		
		if(!texto.endsWith("dato disponible en esta tabla")){
	        if ( $(this).hasClass('selected') ) {
	            $(this).removeClass('selected');
	        }
	        else {
	        	tablaSegTareas.$('tr.selected').removeClass('selected');
	            $(this).addClass('selected');
	        }
    	}
    });
 	
	$('#tablacertiEntregables').DataTable({
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
	
	$('#tablasegEntregables').DataTable({
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
	
	$('#tablasegAdquisiciones').DataTable({
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
	
	$('#tablaControlCambios').DataTable({
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
	
	$('#tablainfAvance').DataTable({
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

	//bootbox.setLocale('es');
	bootbox.addLocale('ys',
		 {
		      OK      : "OK",
		      CANCEL  : "NO",
		      CONFIRM : "SI"
		 }
		);
	//bootbox.setLocale('ys');
});

//-------------------------------------[INI] ASIGNACION RESPONSABLE ---------------------------------------------
function mostrarRecursoAsignar(obj)
{
	var tipo = obj.value;

	if(obj.id == 'rolasigproveedor'){
		$("#recdispproveedor").empty();
		$("#recdispproveedor").append('<option value="">Seleccionar</option>');
		$.postJSON('${pageContext.request.contextPath}/ejecucion/listar_Recursos.htm', tipo, function(data) {
			 $.each(data, function (key, value) {
	             $("#recdispproveedor").append("<option value=" + value.id + ">" + value.nombreCompleto + "</option>");
	         });
		});
	}else{
		$("#recdispcliente").empty();
		$("#recdispcliente").append('<option value="">Seleccionar</option>');
		$.postJSON('${pageContext.request.contextPath}/ejecucion/listar_Recursos.htm', tipo, function(data) {
			 $.each(data, function (key, value) {
	             $("#recdispcliente").append("<option value=" + value.id + ">" + value.nombreCompleto + "</option>");
	         });
		});		
	}
}

$('#idformProveedor').validate({
	errorClass: 'help-block',
	rules: {
		idrol: {
			required: true
		},
		idrecurso: {
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
		mantenimientoAsignarRecurso('#idformProveedor');
	}
});

function mantenimientoAsignarRecurso(idform)
{
	var form = $(idform);
	var objeto = form.serializeObject();

	$.postJSON('${pageContext.request.contextPath}/ejecucion/mnt_AsignarRecursos.htm',objeto,
		function(data) {
			if(data == 0){

				$.gritter.add({
					title: 'Info!',
					text: 'Se realizo la operaci&oacute;n con &eacute;xito.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-info gritter-light'
				});

				listarAsignacionRecurso(idform);

			}else if(data == 1){
				$.gritter.add({
					title: 'Advertencia!',
					text: 'Supero el l&iacute;mite de recursos para este rol.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-warning gritter-light'
				});
			}else{
				$.gritter.add({
					title: 'Error!',
					text: 'Ocurrio un error al tratar de realizar la operaci&oacute;n solicitada',
					sticky: false,
					time: '1200',
					class_name: 'gritter-error'
				});				
			}
			$("#recdispproveedor").empty();
		}
	).fail(function() {
		$.gritter.add({
			title: 'Error!',
			text: 'Ocurrio un error al tratar de realizar la operaci&oacute;n solicitada',
			sticky: false,
			time: '1200',
			class_name: 'gritter-error'
		});
	});
}

//Listar Asignacion Responsable 
function listarAsignacionRecurso(idform) 
{
	var form = $(idform);
	var objeto = form.serializeObject();

	if(idform == "#idformProveedor"){
		var t = $("#tablaRecProveedor").DataTable();
		t.clear().draw();

		$.postJSON('${pageContext.request.contextPath}/ejecucion/listar_AsignacionRecursos.htm',objeto,
		function(data) {
			console.log(data);
			for (i in data) {
				var accion = '<td class="td-actions">'+
							  	'<div class="hidden-phone visible-desktop action-buttons">'+
									'<a class="red tooltip-error" href="#modal-proveedor" data-toggle="modal"'+
										'data-rel="tooltip" title="Desasignar" onclick="desasignarProveedor(' + data[i].id +')">'+
										'<i class="icon-minus-sign bigger-130"></i>'+
									'</a></div>'+
								'<div class="hidden-desktop visible-phone">'+
									'<div class="inline position-relative">'+
										'<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">'+
											'<i class="icon-caret-down icon-only bigger-120"></i>'+
										'</button>'+
					
										'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
											'<li>'+
												'<a href="#modal-proveedor" class="tooltip-error" onclick="desasignarProveedor(' + data[i].id +')"'+
													'data-rel="tooltip" title="Desasignar" data-toggle="modal" >'+
													'<span class="red">'+
														'<i class="icon-minus-sign bigger-120"></i>'+
													'</span>'+
												'</a>'+
											'</li>'+
										'</ul>'+
									'</div>'+
								'</div>'+
							'</td>';

				t.row.add([data[i].dsctiporol, data[i].nomcompletopersona, accion ]).draw();
			}
		});
	}else{
		var t = $("#tablaRecCliente").DataTable();
		t.clear().draw();

		$.postJSON('${pageContext.request.contextPath}/ejecucion/listar_AsignacionRecursos.htm',objeto,
		function(data) {
			console.log(data);
			for (i in data) {
				var accion = '<td class="td-actions">'+
							  	'<div class="hidden-phone visible-desktop action-buttons">'+
									'<a class="red tooltip-error" href="#modal-proveedor" data-toggle="modal"'+
										'data-rel="tooltip" title="Desasignar" onclick="desasignarProveedor(' + data[i].id +')">'+
										'<i class="icon-minus-sign bigger-130"></i>'+
									'</a></div>'+
								'<div class="hidden-desktop visible-phone">'+
									'<div class="inline position-relative">'+
										'<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">'+
											'<i class="icon-caret-down icon-only bigger-120"></i>'+
										'</button>'+
					
										'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
											'<li>'+
												'<a href="#modal-proveedor" class="tooltip-error" onclick="desasignarProveedor(' + data[i].id +')"'+
													'data-rel="tooltip" title="Desasignar" data-toggle="modal" >'+
													'<span class="red">'+
														'<i class="icon-minus-sign bigger-120"></i>'+
													'</span>'+
												'</a>'+
											'</li>'+
										'</ul>'+
									'</div>'+
								'</div>'+
							'</td>';

				t.row.add([data[i].dsctiporol, data[i].nomcompletopersona, accion ]).draw();
			}
		});
	}
};

//Eliminar Desasignar Proveedor
function desasignarProveedor(id){
     $("#idrecursoProvEliminar").val(id);
}

$("#idformProveedorEditar").submit(
		function() {
	var objeto = $("#idformProveedorEditar").serializeObject();

	$.postJSON('${pageContext.request.contextPath}/ejecucion/eliminar_AsignacionRecursos.htm',objeto,
		function(data) {
		if(data == 1){
			$.gritter.add({
				title: 'Info!',
				text: 'Se elimino el registro seleccionado con &eacute;xito.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light'
			});

			$('#modal-proveedor').modal('hide');
			listarAsignacionRecurso('#idformProveedor');
			
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

$('#idformCliente').validate({
	errorClass: 'help-block',
	rules: {
		idrol: {
			required: true
		},
		idrecurso: {
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
		mantenimientoAsignarRecurso('#idformCliente');
	}
});

//Eliminar Desasignar Cliente
function desasignarCliente(id){
     $("#idrecursoClieEliminar").val(id);
}

$("#idformClienteEditar").submit(
		function() {
	var objeto = $("#idformClienteEditar").serializeObject();

	$.postJSON('${pageContext.request.contextPath}/ejecucion/eliminar_AsignacionRecursos.htm',objeto,
		function(data) {
		if(data == 1){
			$.gritter.add({
				title: 'Info!',
				text: 'Se elimino el registro seleccionado con &eacute;xito.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light'
			});

			$('#modal-cliente').modal('hide');
			listarAsignacionRecurso('#idformCliente');
			
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
//-------------------------------------[INI] ASIGNACION RESPONSABLE ---------------------------------------------
//-------------------------------------[INI] CONTROL DE CAMBIOS ---------------------------------------------
//Editar Control de Cambios
function editarCtrolCambios(id){
	var objeto = new Object();
		objeto.idCtrolCambios = id;
	$.postJSON('${pageContext.request.contextPath}/ejecucion/listar_CtrolCambios.htm',objeto,
		function(data) {
			$("#idCtrolCambios").val(data[0].idCtrolCambios);
			$("#solicitanteCtrolCambios").val(data[0].idsolicitante);
			$("#descripcionCtrolCambios").val(data[0].descripcionCtrolCambios);
			$("#fecSolCtrolCambios").val(data[0].fecSolCtrolCambios);
			$("#complejidadCtrolCambios").val(data[0].idComplejidad);
			$("#horasCtrolCambios").val(data[0].horasEstimadas);
			$("#comentariosCtrolCambios").val(data[0].comentarios);
			$("#codctrolcambios").val(data[0].codctrolcambios);
		}
	);
};

//Eliminar Control de Cambios
function eliminarCtrolCambios(id){
     $("#idCtrolCambiosEliminar").val(id);
}
//-------------------------------------[FIN] CONTROL DE CAMBIOS ---------------------------------------------
function mostrarRecursoProyecto(obj){
		var objeto = new Object();
		    objeto.tipo = obj.value;
 			objeto.idproyecto = $("#idProyectoGeneral").val();

		$("#idrecursoAsignadoTarea").empty();
		$.postJSON('${pageContext.request.contextPath}/ejecucion/listar_RecursosProyecto.htm', objeto, function(data) {
			if(data.length > 0){
				 $.each(data, function (key, value) {
		             $("#idrecursoAsignadoTarea").append("<option value=" + value.codpersona + ">" + value.nombreCompleto + "</option>");
		         });
				}else
					$("#idrecursoAsignadoTarea").append('<option value="">Seleccionar un recurso</option>');

		});
	}

$('#btnMostarRecursosProyecto').click( function () {
    	limpiarPopupRecurso();
});

function limpiarPopupRecurso(){
	$("#registrarRecursoTarea").validate().resetForm();
	$('#registrarRecursoTarea .control-group').removeClass('error');
	$("#idrecursoAsignadoTarea").empty();
	$("#idrecursoAsignadoTarea").append('<option value="">Seleccionar un recurso</option>');
	document.getElementById("registrarRecursoTarea").reset();
}
</script>