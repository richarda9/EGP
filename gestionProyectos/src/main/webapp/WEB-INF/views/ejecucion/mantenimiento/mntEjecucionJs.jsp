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
<script src="../assets/js/ejecucion/registroInformeAvance.js"></script>
<script src="../assets/js/ejecucion/registroSeguimientoEntregable.js"></script>
<script src="../assets/plugins/validate/additional/pattern.js"></script>
<script src="../assets/js/bootbox.min.js"></script>

<script>

var dataTarea = eval('${model.listaTareas}');
var dataCategAdquisiciones = eval('${model.listaCategoriaAdquisiciones}');
var dataEnvioCertificacion = eval('${model.listaEnvioCertificacion}');
var datainfAvance = eval('${model.listaInformeAvance}');

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
 	
	var tablacertiEntregables = $('#tablacertiEntregables').DataTable({
		"ajax"		 : function (data, callback, settings) {
						callback ( { data: dataEnvioCertificacion } );
					   },				        
		"paging"     : true,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false,
		"columns"	 : [
		     		   {"data": null, render: function ( data, type, row ) {
		     			   return '';
		     		   	}
		     		   },  
		     		   {"data": "dscestadoentregable"},  
		     		   {"data": "dscentregable"},  
		     		   {"data": "fechaEnvio"},  
		     		   {"data": "nombreresponentregable"},  
		     		   {"data": "fechaAprobacion"}, 
		     		   {"data": "dsccertificador"}, 
				       {"data": null, render: function ( data, type, row ) {
				    	   if(data.indcertificacion == '0')
				    		   return '<div class="hidden-phone visible-desktop action-buttons">'+
										'<a class="blue tooltip-info" onclick="enviarCertificacionProyecto('+ data.identregable +')"> <i class="icon-envelope bigger-130" data-rel="tooltip" title="Enviar a Certificaci&oacute;n"> </i></a></div>'+
									'<div class="hidden-desktop visible-phone">'+
										'<div class="inline position-relative">'+
											'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
												'data-toggle="dropdown">'+
												'<i class="icon-caret-down icon-only bigger-120"></i>'+
											'</button>'+
		
											'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
												'<li><a class="tooltip-error" onclick=enviarCertificacionProyecto('+ data.identregable +')'+ 
													' data-rel="tooltip" title="Enviar a Certificaci&oacute;n"> <span class="blue tooltip-info">'+
															'<i class="icon-envelope bigger-120"></i>'+
													'</span>'+
												'</a></li>'+
											'</ul>'+
										'</div>'+
									'</div>';
				    	   else
				    		   return '<div class="hidden-phone visible-desktop action-buttons">'+
										'<a class="blue" onclick="visualizarCertificacion('+ data.identregable +')"> <i class="icon-eye-open bigger-130" data-rel="tooltip" title="Visualizar Certificaci&oacute;n"> </i></a></div>'+
									'<div class="hidden-desktop visible-phone">'+
										'<div class="inline position-relative">'+
											'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
												'data-toggle="dropdown">'+
												'<i class="icon-caret-down icon-only bigger-120"></i>'+
											'</button>'+
		
											'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
												'<li><a class="tooltip-error" onclick=visualizarCertificacion('+ data.identregable +')'+ 
													' data-rel="tooltip" title="Visualizar Certificaci&oacute;n"> <span class="blue">'+
															'<i class="icon-eye-open bigger-120"></i>'+
													'</span>'+
												'</a></li>'+
											'</ul>'+
										'</div>'+
									'</div>';
				        }
		     		   }
					  ],
		"destroy"	 : true,
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       }
	});	

	tablacertiEntregables.on( 'order.dt search.dt', function () {
		tablacertiEntregables.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	        cell.innerHTML = i+1;
	    } );
	}).draw();
	
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
		"ajax"		 : function (data, callback, settings) {
						callback ( { data: dataCategAdquisiciones } );
					   },	
		"paging"     : true,
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
							{	"targets": [ 5 ], "visible": true, "searchable": false},
							{	"targets": [ 6 ], "visible": true, "searchable": false},
							{	"targets": [ 7 ], "visible": true, "searchable": false},
							{	"targets": [ 8 ], "visible": true, "searchable": false},
							{	"targets": [ 9 ], "visible": true, "searchable": false},
							{	"targets": [ 10 ], "visible": false, "searchable": false},
							{	"targets": [ 11 ], "visible": false, "searchable": false},
							{	"targets": [ 12 ], "visible": false, "searchable": false}
				    	],
		"columns"	 : [
			     		   {"data": "id"},  
			     		   {"data": "dscEstadoAdquisicion"},  
					       {"data": "dscCategoria"},   
					       {"data": "descripcion"},
					       {"data": "fechaCompra"},
					       {"data": "dscResponsable"},
					       {"data": "cantidad"},
					       {"data": "costoUnitario"},    
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
										'<a class="blue" onclick="editarAdquisicion('+ data.id +')"> <i class="icon-edit bigger-130" data-rel="tooltip" title="Editar"> </i></a></div>'+
									'<div class="hidden-desktop visible-phone">'+
										'<div class="inline position-relative">'+
											'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
												'data-toggle="dropdown">'+
												'<i class="icon-caret-down icon-only bigger-120"></i>'+
											'</button>'+
		
											'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
												'<li><a class="tooltip-error" onclick=editarAdquisicion('+ data.id +')'+ 
													' data-rel="tooltip" title="Editar"> <span class="blue">'+
															'<i class="icon-edit bigger-120"></i>'+
													'</span>'+
												'</a></li>'+
											'</ul>'+
										'</div>'+
									'</div>'+
								'</td>'+					    	   
					    	   	'<div class="hidden-phone visible-desktop action-buttons">'+
									'<a class="red" onclick="eliminarAdquisicion('+ data.id +')"> <i class="icon-trash bigger-130" data-rel="tooltip" title="Eliminar"> </i></a></div>'+
								'<div class="hidden-desktop visible-phone">'+
									'<div class="inline position-relative">'+
										'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
											'data-toggle="dropdown">'+
											'<i class="icon-caret-down icon-only bigger-120"></i>'+
										'</button>'+

										'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
											'<li><a class="tooltip-error" onclick=eliminarAdquisicion('+ data.id +')'+ 
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
					       {"data": "idEstadoAdquisicion"},
					       {"data": "idCategAdquisicion"},
					       {"data": "idResponsable"}
					  ],
		"destroy"	 : true,
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
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       }
	});
	
	var tablainfAvance = $('#tablainfAvance').DataTable({
		"ajax"		 : function (data, callback, settings) {
						callback ( { data: datainfAvance } );
					   },	
		"paging"     : true,
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
							{	"targets": [ 13 ], "visible": false, "searchable": false}
				    	],
		"columns"	 : [
			     		   {"data": null, render: function ( data, type, row ) { 
			     			   return '';
			     		   	}
			     		   }, 
			     		   {"data": "descripcion"},  
					       {"data": "fechaEnvio"},   
					       {"data": "dscTipoAvance"},          
					       {"data": null, render: function ( data, type, row ) {
					    	   if(data.envioCorreo != '1')
					    	   	return '<div class="hidden-phone visible-desktop action-buttons">'+
										'<a class="blue" onclick="editarInfAvance('+ data.id +')"> <i class="icon-edit bigger-130" data-rel="tooltip" title="Editar"> </i></a></div>'+
										'<div class="hidden-desktop visible-phone">'+
											'<div class="inline position-relative">'+
												'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
													'data-toggle="dropdown">'+
													'<i class="icon-caret-down icon-only bigger-120"></i>'+
												'</button>'+
			
												'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
													'<li><a class="tooltip-error" onclick=editarInfAvance('+ data.id +')'+ 
														' data-rel="tooltip" title="Editar"> <span class="blue">'+
																'<i class="icon-edit bigger-120"></i>'+
														'</span>'+
													'</a></li>'+
												'</ul>'+
											'</div>'+
										'</div>'+

							    	   	'<div class="hidden-phone visible-desktop action-buttons">'+
											'<a class="blue" onclick="descargarInfAvance('+ data.id +')"> <i class="icon-download-alt bigger-130" data-rel="tooltip" title="Descargar"> </i></a></div>'+
										'<div class="hidden-desktop visible-phone">'+
											'<div class="inline position-relative">'+
												'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
													'data-toggle="dropdown">'+
													'<i class="icon-caret-down icon-only bigger-120"></i>'+
												'</button>'+

												'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
													'<li><a class="tooltip-error" onclick=descargarInfAvance('+ data.id +')'+ 
														' data-rel="tooltip" title="Descargar"> <span class="blue">'+
																'<i class="icon-download-alt bigger-120"></i>'+
														'</span>'+
													'</a></li>'+
												'</ul>'+
											'</div>'+
										'</div>'+

							    	   	'<div class="hidden-phone visible-desktop action-buttons">'+
											'<a class="red" onclick="eliminarInfAvance('+ data.id +')"> <i class="icon-trash bigger-130" data-rel="tooltip" title="Eliminar"> </i></a></div>'+
										'<div class="hidden-desktop visible-phone">'+
											'<div class="inline position-relative">'+
												'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
													'data-toggle="dropdown">'+
													'<i class="icon-caret-down icon-only bigger-120"></i>'+
												'</button>'+

												'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
													'<li><a class="tooltip-error" onclick=eliminarInfAvance('+ data.id +')'+ 
														' data-rel="tooltip" title="Eliminar"> <span class="red">'+
																'<i class="icon-trash bigger-120"></i>'+
														'</span>'+
													'</a></li>'+
												'</ul>'+
											'</div>'+
										'</div>'; 
								else
							 		return '<div class="hidden-phone visible-desktop action-buttons">'+
											'<a class="blue" onclick="descargarInfAvance('+ data.id +')"> <i class="icon-download-alt bigger-130" data-rel="tooltip" title="Descargar"> </i></a></div>'+
										'<div class="hidden-desktop visible-phone">'+
											'<div class="inline position-relative">'+
												'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
													'data-toggle="dropdown">'+
													'<i class="icon-caret-down icon-only bigger-120"></i>'+
												'</button>'+

												'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
													'<li><a class="tooltip-error" onclick=descargarInfAvance('+ data.id +')'+ 
														' data-rel="tooltip" title="Descargar"> <span class="blue">'+
																'<i class="icon-download-alt bigger-120"></i>'+
														'</span>'+
													'</a></li>'+
												'</ul>'+
											'</div>'+
										'</div>'+

							    	   	'<div class="hidden-phone visible-desktop action-buttons">'+
											'<a class="red" onclick="eliminarInfAvance('+ data.id +')"> <i class="icon-trash bigger-130" data-rel="tooltip" title="Eliminar"> </i></a></div>'+
										'<div class="hidden-desktop visible-phone">'+
											'<div class="inline position-relative">'+
												'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
													'data-toggle="dropdown">'+
													'<i class="icon-caret-down icon-only bigger-120"></i>'+
												'</button>'+

												'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
													'<li><a class="tooltip-error" onclick=eliminarInfAvance('+ data.id +')'+ 
														' data-rel="tooltip" title="Eliminar"> <span class="red">'+
																'<i class="icon-trash bigger-120"></i>'+
														'</span>'+
													'</a></li>'+
												'</ul>'+
											'</div>'+
										'</div>'; 		     			
			     		   	}
					       },
					       {"data": "id"},
					       {"data": "idTipoAvance"},
					       {"data": "fechaInicio"},
					       {"data": "fechaFin"},
					       {"data": "incluirAdquisiciones"},
					       {"data": "incluirCtrolCambios"},
					       {"data": "incluirTareaTerminada"},
					       {"data": "incluirTareaAtrasada"},
					       {"data": "incluirReuniones"}
					  ],
		"destroy"	 : true,
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       }
	});	

	tablainfAvance.on( 'order.dt search.dt', function () {
		tablainfAvance.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	        cell.innerHTML = i + 1;
	    } );
	}).draw();

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
	loadModalCargando();
	var form = $(idform);
	var objeto = form.serializeObject();

	$.postJSON('${pageContext.request.contextPath}/ejecucion/mnt_AsignarRecursos.htm',objeto,
		function(data) {
			if(data == 0){

				listarAsignacionRecurso(idform);
				
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
					text: 'Supero el l&iacute;mite de recursos para este rol.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-warning gritter-light'
				});
			}else{
				closeModalCargando();
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
		closeModalCargando();
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
	loadModalCargando();
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
			
			closeModalCargando();
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
			
			closeModalCargando();
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
	
	loadModalCargando();

	$.postJSON('${pageContext.request.contextPath}/ejecucion/eliminar_AsignacionRecursos.htm',objeto,
		function(data) {
		if(data == 1){
			$('#modal-proveedor').modal('hide');
			listarAsignacionRecurso('#idformProveedor');
			closeModalCargando();
			
			$.gritter.add({
				title: 'Info!',
				text: 'Se elimino el registro seleccionado con &eacute;xito.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light'
			});
			
		}else if(data == 0){
			closeModalCargando();
			$.gritter.add({
				title: 'Error!',
				text: 'Ocurrio un error al tratar de realizar la operaci&oacute;n solicitada',
				sticky: false,
				time: '1200',
				class_name: 'gritter-error'
			});
		}
	}).fail(function() {
		closeModalCargando();
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
//-------------------------------------[INI] SEGUIMIENTO DE ADQUISICIONES ---------------------------------------------
function editarAdquisicion(id){
	loadModalCargando();
	var objeto = new Object();
	    objeto.idproyecto = $("#idProyectoGeneral").val();
	    objeto.id = id;
	$.postJSON('${pageContext.request.contextPath}/ejecucion/obtener_Adquisiciones.htm', objeto,
		function(data1) {
			var data = eval(data1);
			$("#idProyectoAdquisicion").val(data[0].idproyecto);
			$("#idAdquisiciones").val(data[0].id);
			$("#estadoRegAdquisicion").val(data[0].estado);
			$("#estadoAdquisiciones").val(data[0].idEstadoAdquisicion);
			$("#categoriaAdquisiciones").val(data[0].idCategAdquisicion);
			$("#descripcionAdquisiciones").val(data[0].descripcion);
			$("#fecCompAdquisiciones").val(data[0].fechaCompra);
			$("#responsableAdquisiciones").val(data[0].idResponsable);
			$("#cantAdquisiciones").val(data[0].cantidad);
			$("#costUniAdquisiciones").val(data[0].costoUnitario);
			closeModalCargando();
			$('#modal-Adquisiciones').modal('show');
	});
}

//Eliminar Adquisiciones
function eliminarAdquisicion(id){
	bootbox.setLocale('es');
	bootbox.confirm("Esta seguro de eliminar la fila seleccionada?", function(result) {
				if(result) {
					loadModalCargando();
					$.postJSON('${pageContext.request.contextPath}/ejecucion/eliminar_Adquisiciones.htm',id, function(data) {
						listarAdquisiciones();
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
};

function listarAdquisiciones() {
	var t = $("#tablasegAdquisiciones").DataTable();
	t.clear().draw();
	var dato = $("#idProyectoGeneral").val();
	$.postJSON('listar_Adquisiciones.htm', dato,
		function(data) {
		dataCategAdquisiciones = eval(data);
		$("#tablasegAdquisiciones").DataTable().ajax.reload();	
		$('[data-rel=tooltip]').tooltip();	
	});
};
//-------------------------------------[FIN] SEGUIMIENTO DE ADQUISICIONES ---------------------------------------------
//-------------------------------------[INI] ENVIO CERTIFICACION ------------------------------------------------------
function mostrarCorreoCertificador(){
	var correo = $("#idDestinoCertificacion option:selected").attr("data-correo");
	$("#destinoCertificacion").val(correo);
}

function enviarCertificacionProyecto(id){
	$("#idEnvioEntregable").val(id);
	$('#modal-EnviarCertificacion').modal('show');
}

function listarEnvioCertificacion() {
	var t = $("#tablacertiEntregables").DataTable();
	t.clear().draw();
	var dato = $("#idProyectoGeneral").val();
	$.postJSON('${pageContext.request.contextPath}/ejecucion/listar_EnvioCertificacion.htm', dato,
		function(data) {
		dataEnvioCertificacion = eval(data);
		$("#tablacertiEntregables").DataTable().ajax.reload();	
		$('[data-rel=tooltip]').tooltip();	
	});
};
//-------------------------------------[FIN] ENVIO CERTIFICACION ------------------------------------------------------
//-------------------------------------[INI] INFORME DE AVANCE --------------------------------------------------------
function editarInfAvance(id){
	loadModalCargando();
	var objeto = new Object();
	    objeto.idProyecto = $("#idProyectoGeneral").val();
	    objeto.id = id;
	$.postJSON('${pageContext.request.contextPath}/ejecucion/obtener_InformeAvance.htm', objeto,
		function(data1) {
			var data = eval(data1);
			$("#idProyectoInformeAvance").val(data[0].idProyecto);
			$("#idInformeAvance").val(data[0].id);
			$("#idDirigido").val(data[0].dirigido);
			$("#dscInfAvance").val(data[0].descripcion);
			$("#idTipoInfAvance").val(data[0].idTipoAvance);
			$("#fechaInicioInfAvance").val(data[0].fechaInicio);
			$("#fechaFinInfAvance").val(data[0].fechaFin);
			data[0].incluirAdquisiciones == '1' ? $("#incluirAdquisicionesInfAvance").prop("checked", true) : $("#incluirAdquisicionesInfAvance").prop("checked", false);
			data[0].incluirCtrolCambios == '1' ? $("#incluirCtrolCambiosInfAvance").prop("checked", true) : $("#incluirCtrolCambiosInfAvance").prop("checked", false);
			data[0].incluirTareaTerminada == '1' ? $("#incluirTareaTerminadaInfAvance").prop("checked", true) : $("#incluirTareaTerminadaInfAvance").prop("checked", false);
			data[0].incluirTareaAtrasada == '1' ? $("#incluirTareaAtrasadaInfAvance").prop("checked", true) : $("#incluirTareaAtrasadaInfAvance").prop("checked", false);
			data[0].incluirReuniones == '1' ? $("#incluirReunionesInfAvance").prop("checked", true) : $("#incluirReunionesInfAvance").prop("checked", false);

			closeModalCargando();
			$("#btnEnviarInfoAvance").show();
			$('#modal-infoAvance').modal('show');
	});
}

//Eliminar Adquisiciones
function eliminarInfAvance(id){
	bootbox.setLocale('es');
	bootbox.confirm("Esta seguro de eliminar la fila seleccionada?", function(result) {
				if(result) {
					loadModalCargando();
					$.postJSON('${pageContext.request.contextPath}/ejecucion/eliminar_InformeAvance.htm',id, function(data) {
						listarInformeAvance();
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
};

function listarInformeAvance() {
	var t = $("#tablainfAvance").DataTable();
	t.clear().draw();
	var dato = $("#idProyectoGeneral").val();
	$.postJSON('${pageContext.request.contextPath}/ejecucion/listar_InformeAvance.htm', dato,
		function(data) {
		datainfAvance = eval(data);
		$("#tablainfAvance").DataTable().ajax.reload();	
		$('[data-rel=tooltip]').tooltip();	
	});
};

function descargarInfAvance(id){
	var objeto = new Object();
	    objeto.idProyecto = $("#idProyectoGeneral").val();
	    objeto.id = id;

	$.postJSON('${pageContext.request.contextPath}/ejecucion/descargar_InformeAvance.htm', dato,
		function(data) {

				closeModalCargando();			
				
				$.gritter.add({
					title: 'Info!',
					text: 'Se realizo la operaci&oacute;n con &eacute;xito.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-info gritter-light'
				});

				window.open("/gestionProyectos/"+ data,'_blank');
	}).fail(function() {
		closeModalCargando();
		$.gritter.add({
			title: 'Error!',
			text: 'Ocurrio un error al tratar de descargar el informe de avance',
			sticky: false,
			time: '1200',
			class_name: 'gritter-error'
		});				
	});
}

$('#btnEnviarInfoAvance').click( function () {
	$('#modal-infoAvance').modal('hide');
	loadModalCargando();
	var objeto = new Object();
	    objeto.idProyecto = $("#idProyectoGeneral").val();
	    objeto.id = $("#idInformeAvance").val();	

	$.postJSON('${pageContext.request.contextPath}/ejecucion/enviarCorreo_InformeAvance.htm', dato,
		function(data) {
		
	}).fail(function() {
		closeModalCargando();
		$.gritter.add({
			title: 'Error!',
			text: 'Ocurrio un error al tratar de enviar por correo el informe de avance',
			sticky: false,
			time: '1200',
			class_name: 'gritter-error'
		});				
	});
});

//-------------------------------------[FIN] INFORME DE AVANCE --------------------------------------------------------
</script>