<script src="../assets/js/bootbox.min.js"></script>
<script>
var dataRecursos = eval('${model.listaRecursos}');
$(function() 
{

	
	jQuery.validator.addMethod("formatCelular", function(phone_number, element) {
	    phone_number = phone_number.replace(/\s+/g, "");
	    return this.optional(element) || phone_number.length == 9 && 
	    phone_number.match('[0-9]+'); //(/^(\+?1-?)?(\([2-9]\d{2}\)|[2-9]\d{2})-?[2-9]\d{2}-?\d{4}$/);
	}, "Por favor, especifique un n&uacute;mero de celular v&aacute;lido.");

	$('#tablaRecursosProyecto').DataTable({
		"ajax"		 : function (data, callback, settings) {
						callback ( { data: dataRecursos } );
					   },	
		"paging" 	 : true,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false,
		"columnDefs" :
				    	[
							{	"targets": [ 0 ], "visible": true, "searchable": false},
							{	"targets": [ 1 ], "visible": true, "searchable": false},
							{	"targets": [ 2 ], "visible": true, "searchable": false},
							{	"targets": [ 3 ], "visible": true, "searchable": false},
							{	"targets": [ 4 ], "visible": true, "searchable": false},

							{	"targets": [ 5 ], "visible": false, "searchable": false},
							{	"targets": [ 6 ], "visible": false, "searchable": false},
							{	"targets": [ 7 ], "visible": false, "searchable": false},
							{	"targets": [ 8 ], "visible": false, "searchable": false},
							{	"targets": [ 9 ], "visible": false, "searchable": false},
							{	"targets": [ 10 ], "visible": false, "searchable": false},
							{	"targets": [ 11 ], "visible": false, "searchable": false},
							{	"targets": [ 12 ], "visible": false, "searchable": false},
							{	"targets": [ 13 ], "visible": false, "searchable": false},
							{	"targets": [ 14 ], "visible": false, "searchable": false},
							{	"targets": [ 15 ], "visible": false, "searchable": false},
							{	"targets": [ 16 ], "visible": false, "searchable": false}
				    	],
		"columns"	 : [
			     		   {"data": "nombreCompletos"},  
			     		   {"data": "dscTipoCargo"},  
					       {"data": "celular"},   
					       {"data": null, render: function ( data, type, row ) {
					    	   if(data.estado == '1')
					    		   return '<span class="label label-info"><b>ACTIVO</b></span>';
					    	   else
					    		   return '<span class="label label-danger"><b>INACTIVO</b></span>';
					        }
			     		   },                    
					       {"data": null, render: function ( data, type, row ) {
					    	   return '<td class="td-actions">'+
							    	   '<div class="hidden-phone visible-desktop action-buttons">'+
										'<a class="blue" onclick="editarRecurso('+ data.id +')"> <i class="icon-edit bigger-130" data-rel="tooltip" title="Editar"> </i></a></div>'+
									'<div class="hidden-desktop visible-phone">'+
										'<div class="inline position-relative">'+
											'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
												'data-toggle="dropdown">'+
												'<i class="icon-caret-down icon-only bigger-120"></i>'+
											'</button>'+
		
											'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
												'<li><a class="tooltip-error" onclick=editarRecurso('+ data.id +')'+ 
													' data-rel="tooltip" title="Editar"> <span class="blue">'+
															'<i class="icon-edit bigger-120"></i>'+
													'</span>'+
												'</a></li>'+
											'</ul>'+
										'</div>'+
									'</div>'+
								'</td>'+					    	   
					    	   	'<div class="hidden-phone visible-desktop action-buttons">'+
									'<a class="red" onclick="eliminarRecurso('+ data.id +')"> <i class="icon-trash bigger-130" data-rel="tooltip" title="Eliminar"> </i></a></div>'+
								'<div class="hidden-desktop visible-phone">'+
									'<div class="inline position-relative">'+
										'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
											'data-toggle="dropdown">'+
											'<i class="icon-caret-down icon-only bigger-120"></i>'+
										'</button>'+

										'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
											'<li><a class="tooltip-error" onclick=eliminarRecurso('+ data.id +')'+ 
												' data-rel="tooltip" title="Eliminar"> <span class="red">'+
														'<i class="icon-trash bigger-120"></i>'+
												'</span>'+
											'</a></li>'+
										'</ul>'+
									'</div>'+
								'</div>'+
							'</td>';  		     			
			     		   	}
					       },
					       {"data": "idTipoDocumento"},
					       {"data": "nroDocumento"},
					       {"data": "nombres"},
					       {"data": "apellidos"},
					       {"data": "idTipoCargo"},
					       {"data": "direccion"},
					       {"data": "facebookRecurso"},
					       {"data": "twitterRecurso"},
					       {"data": "linkedinRecurso"},
					       {"data": "gmailRecurso"},
					       {"data": "correo"},
					       {"data": "dscperfil"}
					  ],
		"destroy"	 : true,
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       }
	});

	$('[data-rel=tooltip]').tooltip();
});

$('#registrarRecurso').validate({
	errorClass: 'help-block',
	rules: {
		idTipoDocumento: {
			required: true
		},
		nroDocumento: {
			required: true,
			maxlength: function(element) {	
				if($("#idTipoDocumento").val() == '1'){
					return 8;
				}else if($("#idTipoDocumento").val() == '2'){
					return 15;
				}else if($("#idTipoDocumento").val() == '3'){
					return 15;
				}else
				return 15;
			},
			/*digits: function(element) {	
				if($("#idTipoDocumento").val() != '1'){
					return false;
				}else 
				    return true; 
			}*/
		},

		nombres: {
			required: true,
			maxlength: 100
		},
		apellidos: {
			required: true,
			maxlength: 100
		},
		celular: {
			required: true,
			formatCelular: true
		},
		idTipoCargo: {
			required: true
		},
		direccion: {
			required: true,
			maxlength: 250
		},
		twitterRecurso: {
			required: false,
			maxlength: 200
		},
		facebookRecurso: {
			required: false,
			maxlength: 200
		},
		linkedinRecurso: {
			required: false,
			maxlength: 200
		},
		gmailRecurso: {
			required: false,
			maxlength: 200
		},
		correo: {
			required: true,
			email	: true
		},
		dscperfil: {
			required: false,
			maxlength: 300
		},
		estado: {
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
		registrarRecurso();
	}
});

$('#btnAgregarRecursos').click( function () {
	limpiarMntRecursos();
});

//Registrar Recurso
function registrarRecurso() 
{
	$('#modal-Recurso').modal('hide');
	loadModalCargando();
	var objeto = $("#registrarRecurso").serializeObject();
	$.postJSON('${pageContext.request.contextPath}/administracion/mnto_Recurso.htm', objeto, function(data) {
		if(data == 0){
			listarRecursos();
			closeModalCargando();			
			
			$.gritter.add({
				title: 'Info!',
				text: 'Se realizo la operaci&oacute;n con &eacute;xito.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light'
			});
		}else if(data == 1){
			closeModalCargando();
			
			$.gritter.add({
				title: 'Advertencia!',
				text: 'Existe un registro con el mismo tipo y numero de documento.',
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
function listarRecursos() {
	var t = $("#tablaRecursosProyecto").DataTable();
	t.clear().draw();
	var dato = 1;
	$.postJSON('${pageContext.request.contextPath}/administracion/listar_Recurso.htm', dato,
		function(data) {
		dataRecursos = eval(data);
		$("#tablaRecursosProyecto").DataTable().ajax.reload();	
		$('[data-rel=tooltip]').tooltip();	
	});
};

function editarRecurso(id){
	loadModalCargando();
	$.postJSON('${pageContext.request.contextPath}/administracion/obtener_Recurso.htm', id,
		function(data1) {
			var data = eval(data1);
			$("#idPersona").val(data[0].id);
			$("#idTipoDocumento").val(data[0].idTipoDocumento);
			$("#nroDocumento").val(data[0].nroDocumento);
			$("#nombresRecurso").val(data[0].nombres);
			$("#apellidosRecurso").val(data[0].apellidos);
			$("#celularRecurso").val(data[0].celular);
			$("#idPerfilRecurso").val(data[0].idTipoCargo);
			$("#direccionRecurso").val(data[0].direccion);
			$("#twitterRecurso").val(data[0].twitterRecurso);
			$("#facebookRecurso").val(data[0].facebookRecurso);
			$("#linkedinRecurso").val(data[0].linkedinRecurso);
			$("#gmailRecurso").val(data[0].gmailRecurso);
			$("#correoRecurso").val(data[0].correo);
			$("#estadoRecurso").val(data[0].estado);
			$("#perfilRecurso").val(data[0].dscperfil);
			closeModalCargando();
			$('#modal-Recurso').modal('show');
	});

}

//Eliminar Tipo Recurso
function eliminarRecurso(id){
	bootbox.setLocale('es');
	bootbox.confirm("Esta seguro de eliminar la fila seleccionada?", function(result) {
				if(result) {
					loadModalCargando();
					$.postJSON('${pageContext.request.contextPath}/administracion/eliminar_Recurso.htm',id, function(data) {
						listarRecursos();
						closeModalCargando();
						
						$.gritter.add({
							title: 'Info!',
							text: 'Se elimin&oacute; correctamente.',
							sticky: false,
							time: '1200',
							class_name: 'gritter-info gritter-light'
						});
					}).fail(function() {
						closeModalCargando();
						$.gritter.add({
							title: 'Error!',
							text: 'Ocurrio un error al tratar de eliminar el registro',
							sticky: false,
							time: '1200',
							class_name: 'gritter-error'
						});				
					});
				}
			}
	);
}

function limpiarMntRecursos(){
	$("#registrarRecurso").validate().resetForm();
	$('#registrarRecurso .control-group').removeClass('error');
	document.getElementById("registrarRecurso").reset();
	$("#idPersona").val("");
}
</script>