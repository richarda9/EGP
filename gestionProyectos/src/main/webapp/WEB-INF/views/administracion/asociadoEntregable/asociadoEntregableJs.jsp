<script src="../assets/js/bootbox.min.js"></script>
<script>
var dataCompEntregable = eval('${model.listaCompEntregable}'); 
var dataEstEntregable = eval('${model.listaEstadoEntregable}');

$(function() 
{
	var tabla1 = $('#tablaComplejidadEntregable').DataTable({
		"ajax"		 : function (data, callback, settings) {
						callback ( { data: dataCompEntregable[0].COLUMNAS } );
					   },	
		"paging"     : true,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 
		"columnDefs" :
	    	[
				{	"targets": [ 0 ], "visible": true, "searchable": false, "width": "25%"},
				{	"targets": [ 1 ], "visible": true, "searchable": false, "width": "25%"},
				{	"targets": [ 2 ], "visible": true, "searchable": false, "width": "25%"},
				{	"targets": [ 3 ], "visible": true, "searchable": false, "width": "25%"}
	    	],
		"columns"	 : [
		     		   {"data": null, render: function ( data, type, row ) {
		     			   return '';
		     		   	}
		     		   },  
		     		   {"data": "descripcion"},  
				       {"data": null, render: function ( data, type, row ) {
				    	   if(data.estado == '1')
				    		   return '<span class="label label-info"><b>ACTIVO</b></span>';
				    	   else
				    		   return '<span class="label label-danger"><b>INACTIVO</b></span>';
				        }
		     		   },                      
				       {"data": null, render: function ( data, type, row ) {
				    	   return '<td class="td-actions"><div class="hidden-phone visible-desktop action-buttons">'+
								'<a class="red" onclick="eliminarComplejidadEntregable('+ data.id +')"> <i class="icon-trash bigger-130" data-rel="tooltip" title="Eliminar"> </i></a></div>'+
							'<div class="hidden-desktop visible-phone">'+
								'<div class="inline position-relative">'+
									'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
										'data-toggle="dropdown">'+
										'<i class="icon-caret-down icon-only bigger-120"></i>'+
									'</button>'+

									'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
										'<li><a class="tooltip-error" onclick=eliminarComplejidadEntregable('+ data.id +')'+ 
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
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       }
	});	
	
	tabla1.on( 'order.dt search.dt', function () {
		tabla1.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
	
	var tabla2 = $('#tablaEstadoEntregable').DataTable({
		"ajax"		 : function (data, callback, settings) {
						callback ( { data: dataEstEntregable } );
					   },	
		"paging"     : true,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 
		"columnDefs" :
	    	[
				{	"targets": [ 0 ], "visible": true, "searchable": false, "width": "25%"},
				{	"targets": [ 1 ], "visible": true, "searchable": false, "width": "25%"},
				{	"targets": [ 2 ], "visible": true, "searchable": false, "width": "25%"},
				{	"targets": [ 3 ], "visible": true, "searchable": false, "width": "25%"}
	    	],
		"columns"	 : [
		     		   {"data": null, render: function ( data, type, row ) {
		     			   return '';
		     		   	}
		     		   },  
		     		   {"data": "descripcion"},  
				       {"data": null, render: function ( data, type, row ) {
				    	   if(data.estado == '1')
				    		   return '<span class="label label-info"><b>ACTIVO</b></span>';
				    	   else
				    		   return '<span class="label label-danger"><b>INACTIVO</b></span>';
				        }
		     		   },                      
				       {"data": null, render: function ( data, type, row ) {
				    	   return '<td class="td-actions"><div class="hidden-phone visible-desktop action-buttons">'+
								'<a class="red" onclick="eliminarEstadoEntregable('+ data.id +')"> <i class="icon-trash bigger-130" data-rel="tooltip" title="Eliminar"> </i></a></div>'+
							'<div class="hidden-desktop visible-phone">'+
								'<div class="inline position-relative">'+
									'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
										'data-toggle="dropdown">'+
										'<i class="icon-caret-down icon-only bigger-120"></i>'+
									'</button>'+

									'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
										'<li><a class="tooltip-error" onclick=eliminarEstadoEntregable('+ data.id +')'+ 
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
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       }
	});	
	
	tabla2.on( 'order.dt search.dt', function () {
		tabla2.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
});

$('#formComplejidad').validate({
	errorClass: 'help-block',
	rules: {
		descripcion: {
			required: true,
			maxlength : 100
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
		registrarComplejidadEntregable();
	}
});

function registrarComplejidadEntregable()
{
	loadModalCargando();
	var objeto = $("#formComplejidad").serializeObject();
	objeto.estado = 1;
	console.log(objeto);
	$.postJSON('${pageContext.request.contextPath}/administracion/registrar_ComplejidadEntregable.htm', objeto, function(data) { 
		if(data == 1){
			
			listarComplejidadEntregable();
			closeModalCargando();
			
			$.gritter.add({
				title: 'Info!',
				text: 'Se registro con éxito.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light'
			});
		}else if(data == 0){
			closeModalCargando();
			$.gritter.add({
				title: 'Advertencia!',
				text: 'Existe un registro con los mismos datos.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-warning gritter-light'
			});
		}
	}).fail(function() {
		closeModalCargando();
		$.gritter.add({
			title: 'Error!',
			text: 'Ocurrio un error al tratar de realizar el registro',
			sticky: false,
			time: '1200',
			class_name: 'gritter-error'
		});
	});
	
	$("#tipoComplejidad").val('');
}

function listarComplejidadEntregable(){
	var t = $("#tablaComplejidadEntregable").DataTable();
	t.clear().draw();
	var dato = 1;
	$.postJSON('${pageContext.request.contextPath}/administracion/listar_ComplejidadEntregable.htm', dato,
		function(data) {
		dataCompEntregable = eval(data);
		$("#tablaComplejidadEntregable").DataTable().ajax.reload();		
	});
}

function eliminarComplejidadEntregable(id){
	bootbox.setLocale('es');
	bootbox.confirm("Esta seguro de eliminar la fila seleccionada?", function(result) {
				if(result) {
					loadModalCargando();
					$.postJSON('${pageContext.request.contextPath}/administracion/eliminar_ComplejidadEntregable.htm', id,
							function(data) {					
								listarComplejidadEntregable();
								closeModalCargando();
								$.gritter.add({
									title: 'Info!',
									text: 'Se realizo la operaci&oacute;n con &eacute;xito.',
									sticky: false,
									time: '1200',
									class_name: 'gritter-info gritter-light'
								});
							}
					).fail(function() {
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
			}
	);
}

$('#formEstadoEntregable').validate({
	errorClass: 'help-block',
	rules: {
		descripcion: {
			required: true,
			maxlength : 100
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
		registrarEstadoEntregable();
	}
});

function registrarEstadoEntregable()
{
	loadModalCargando();
	var objeto = $("#formEstadoEntregable").serializeObject();
	objeto.estado = 1;
	console.log(objeto);
	$.postJSON('${pageContext.request.contextPath}/administracion/registrar_EstadoEntregable.htm', objeto, function(data) { 
		if(data == 1){
			
			listarEstadoEntregable();
			closeModalCargando();
			
			$.gritter.add({
				title: 'Info!',
				text: 'Se registro con éxito.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light'
			});
		}else if(data == 0){
			closeModalCargando();
			$.gritter.add({
				title: 'Advertencia!',
				text: 'Existe un registro con los mismos datos.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-warning gritter-light'
			});
		}
	}).fail(function() {
		closeModalCargando();
		$.gritter.add({
			title: 'Error!',
			text: 'Ocurrio un error al tratar de realizar el registro',
			sticky: false,
			time: '1200',
			class_name: 'gritter-error'
		});
	});
	
	$("#estadoEntregable").val('');
}

function listarEstadoEntregable(){
	var t = $("#tablaEstadoEntregable").DataTable();
	t.clear().draw();
	var dato = 1;
	$.postJSON('${pageContext.request.contextPath}/administracion/listar_EstadoEntregable.htm', dato,
		function(data) {
		dataEstEntregable = eval(data);
		$("#tablaEstadoEntregable").DataTable().ajax.reload();		
	});
}

function eliminarEstadoEntregable(id){
	bootbox.setLocale('es');
	bootbox.confirm("Esta seguro de eliminar la fila seleccionada?", function(result) {
				if(result) {
					loadModalCargando();
					$.postJSON('${pageContext.request.contextPath}/administracion/eliminar_EstadoEntregable.htm', id,
							function(data) {					
								listarEstadoEntregable();
								closeModalCargando();
								$.gritter.add({
									title: 'Info!',
									text: 'Se realizo la operaci&oacute;n con &eacute;xito.',
									sticky: false,
									time: '1200',
									class_name: 'gritter-info gritter-light'
								});
							}
					).fail(function() {
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
			}
	);
}
</script>