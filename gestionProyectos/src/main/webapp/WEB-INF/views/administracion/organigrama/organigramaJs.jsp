<script src="../assets/js/bootbox.min.js"></script>
<script>
var dataOrganigrama = eval('${model.listaOrganigrama}');
$(function() 
{
	$('#tablaOrganigramaProyecto').DataTable({
		"ajax"		 : function (data, callback, settings) {
						callback ( { data: dataOrganigrama } );
					   },
		"order"		 : [[ 2, "asc" ]],
		"paging" 	 : true,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false,
		"columns"	 : [
			     		   {"data": "nombreRol"},  
			     		   {"data": "descripcion"},  
					       {"data": null, render: function ( data, type, row ) {
					    	   if(data.tipoRol == '1')
					    		   return '<b>PROVEEDOR</b>';
					    	   else
					    		   return '<b>CLIENTE</b>';
					        }
					       },   
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
										'<a class="blue" onclick="editarOrganigrama('+ data.id +')"> <i class="icon-edit bigger-130" data-rel="tooltip" title="Editar"> </i></a></div>'+
									'<div class="hidden-desktop visible-phone">'+
										'<div class="inline position-relative">'+
											'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
												'data-toggle="dropdown">'+
												'<i class="icon-caret-down icon-only bigger-120"></i>'+
											'</button>'+
		
											'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
												'<li><a class="tooltip-error" onclick=editarOrganigrama('+ data.id +')'+ 
													' data-rel="tooltip" title="Editar"> <span class="blue">'+
															'<i class="icon-edit bigger-120"></i>'+
													'</span>'+
												'</a></li>'+
											'</ul>'+
										'</div>'+
									'</div>'+
								'</td>'+					    	   
					    	   	'<div class="hidden-phone visible-desktop action-buttons">'+
									'<a class="red" onclick="eliminarOrganigrama('+ data.id +')"> <i class="icon-trash bigger-130" data-rel="tooltip" title="Eliminar"> </i></a></div>'+
								'<div class="hidden-desktop visible-phone">'+
									'<div class="inline position-relative">'+
										'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
											'data-toggle="dropdown">'+
											'<i class="icon-caret-down icon-only bigger-120"></i>'+
										'</button>'+

										'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
											'<li><a class="tooltip-error" onclick=eliminarOrganigrama('+ data.id +')'+ 
												' data-rel="tooltip" title="Eliminar"> <span class="red">'+
														'<i class="icon-trash bigger-120"></i>'+
												'</span>'+
											'</a></li>'+
										'</ul>'+
									'</div>'+
								'</div>'+
							'</td>';  		     			
			     		   	}
					       }
					  ],
		"destroy"	 : true,
		"language": {
	            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
	        }
	});
});

$('#registrarOrganigrama').validate({
	errorClass: 'help-block',
	rules: {
		nombreRol: {
			required: true,
			maxlength : 150
		},
		descripcion: {
			required: true,
			maxlength : 200
		},

		tipoRol: {
			required: true
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
		registrarOrganigrama();
	}
});

$('#btnAgregarOrganigrama').click( function () {
	limpiarMntOrganigrama();
});

function registrarOrganigrama(){

	$('#modal-Organigrama').modal('hide');
	loadModalCargando();
	var objeto = $("#registrarOrganigrama").serializeObject();
	$.postJSON('${pageContext.request.contextPath}/administracion/mnto_Organigrama.htm', objeto, function(data) {
		if(data == 0){
			listarOrganigrama();
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
				text: 'Existe un registro con los datos ingresados.',
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

//Listar organigrama
function listarOrganigrama() {
	var t = $("#tablaOrganigramaProyecto").DataTable();
	t.clear().draw();
	var dato = 1;
	$.postJSON('${pageContext.request.contextPath}/administracion/listar_Organigrama.htm', dato,
		function(data) {
		dataOrganigrama = eval(data);
		$("#tablaOrganigramaProyecto").DataTable().ajax.reload();	
		$('[data-rel=tooltip]').tooltip();	
	});
};

function editarOrganigrama(id){
	loadModalCargando();
	$.postJSON('${pageContext.request.contextPath}/administracion/obtener_Organigrama.htm', id,
		function(data1) {
			var data = eval(data1);
			$("#idTipoRol").val(data[0].id);
			$("#nombreRol").val(data[0].nombreRol);
			$("#descripcion").val(data[0].descripcion);
			$("#tipoRol").val(data[0].tipoRol);
			$("#estado").val(data[0].estado);
			closeModalCargando();
			$('#modal-Organigrama').modal('show');
	});

}

//Eliminar organigrama
function eliminarOrganigrama(id){
	bootbox.setLocale('es');
	bootbox.confirm("Esta seguro de eliminar la fila seleccionada?", function(result) {
				if(result) {
					loadModalCargando();
					$.postJSON('${pageContext.request.contextPath}/administracion/eliminar_Organigrama.htm',id, function(data) {
						listarOrganigrama();
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

function limpiarMntOrganigrama(){	
	$("#registrarOrganigrama").validate().resetForm();
	$('#registrarOrganigrama .control-group').removeClass('error');
	document.getElementById("registrarOrganigrama").reset();
	$("#idTipoRol").val("");
}
</script>