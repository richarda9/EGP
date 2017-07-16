<script src="../assets/plugins/validate/additional/integer.js"></script>
<script src="../assets/js/bootbox.min.js"></script>

<script type="text/javascript">
var dataTipoProyecto = eval('${model.listaTipoProyecto}');
var dataEstadoProyecto = eval('${model.listaEstadoProyecto}');
var datatipoReqProyecto = eval('${model.listaTipoRequisito}');
var datatipoSupProyecto = eval('${model.listaTipoSupuesto}');
var datatipoDepProyecto = eval('${model.listaTipoDependencia}');
var dataCategAdquisiciones = eval('${model.listaAdquisiciones}');
var dataCostoOperativo = eval('${model.listaCostoOperativo}');
dataFormaPago = eval('${model.listaFormaPago}');

//[INI] CARGA DE TABLAS
$(function() {
var tabla1 = $('#tablaTipoProyecto').DataTable({
				"ajax"		 : function (data, callback, settings) {
								callback ( { data: dataTipoProyecto } );
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
										'<a class="red" onclick="eliminarTipoProyecto('+ data.id +')"> <i class="icon-trash bigger-130" data-rel="tooltip" title="Eliminar"> </i></a></div>'+
									'<div class="hidden-desktop visible-phone">'+
										'<div class="inline position-relative">'+
											'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
												'data-toggle="dropdown">'+
												'<i class="icon-caret-down icon-only bigger-120"></i>'+
											'</button>'+

											'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
												'<li><a class="tooltip-error" onclick=eliminarTipoProyecto('+ data.id +')'+ 
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
		 }).draw();
		 	 
var tabla2 = $('#tablaEstadoProyecto').DataTable({
				"ajax"		 : function (data, callback, settings) {
								callback ( { data: dataEstadoProyecto } );
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
										'<a class="red" onclick="eliminarEstadoProyecto('+ data.id +')"> <i class="icon-trash bigger-130" data-rel="tooltip" title="Eliminar"> </i></a></div>'+
									'<div class="hidden-desktop visible-phone">'+
										'<div class="inline position-relative">'+
											'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
												'data-toggle="dropdown">'+
												'<i class="icon-caret-down icon-only bigger-120"></i>'+
											'</button>'+

											'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
												'<li><a class="tooltip-error" onclick=eliminarEstadoProyecto('+ data.id +')'+ 
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
			}).draw();
		 
var tabla3 = $('#tablaTipoRequisitoProyecto').DataTable({
				"ajax"		 : function (data, callback, settings) {
								callback ( { data: datatipoReqProyecto } );
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
									{	"targets": [ 3 ], "visible": true, "searchable": false, "width": "25%"},
									{	"targets": [ 4 ], "visible": true, "searchable": false, "width": "25%"}
						    	],
			"columns"	 : [
				     		   {"data": null, render: function ( data, type, row ) {
				     			   return '';
				     		   	}
				     		   },  
				     		   {"data": "dscTipoProyecto"},   
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
										'<a class="red" onclick="eliminarTipoReqProyecto('+ data.id +')"> <i class="icon-trash bigger-130" data-rel="tooltip" title="Eliminar"> </i></a></div>'+
									'<div class="hidden-desktop visible-phone">'+
										'<div class="inline position-relative">'+
											'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
												'data-toggle="dropdown">'+
												'<i class="icon-caret-down icon-only bigger-120"></i>'+
											'</button>'+

											'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
												'<li><a class="tooltip-error" onclick=eliminarTipoReqProyecto('+ data.id +')'+ 
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

			tabla3.on( 'order.dt search.dt', function () {
				tabla3.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
			       cell.innerHTML = i+1;
			   } );
			}).draw();
			
			
var tabla4 = $('#tablaTipoSupuestoProyecto').DataTable({
				"ajax"		 : function (data, callback, settings) {
								callback ( { data: datatipoSupProyecto } );
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
									{	"targets": [ 3 ], "visible": true, "searchable": false, "width": "25%"},
									{	"targets": [ 4 ], "visible": true, "searchable": false, "width": "25%"}
						    	],
			"columns"	 : [
				     		   {"data": null, render: function ( data, type, row ) {
				     			   return '';
				     		   	}
				     		   },  
				     		   {"data": "dscTipoProyecto"},   
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
										'<a class="red" onclick="eliminarTipoSupProyecto('+ data.id +')"> <i class="icon-trash bigger-130" data-rel="tooltip" title="Eliminar"> </i></a></div>'+
									'<div class="hidden-desktop visible-phone">'+
										'<div class="inline position-relative">'+
											'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
												'data-toggle="dropdown">'+
												'<i class="icon-caret-down icon-only bigger-120"></i>'+
											'</button>'+

											'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
												'<li><a class="tooltip-error" onclick=eliminarTipoSupProyecto('+ data.id +')'+ 
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

			tabla4.on( 'order.dt search.dt', function () {
				tabla4.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
			       cell.innerHTML = i+1;
			   } );
			}).draw();

var tabla5 = $('#tablaTipoDependenciaProyecto').DataTable({
				"ajax"		 : function (data, callback, settings) {
								callback ( { data: datatipoDepProyecto } );
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
									{	"targets": [ 3 ], "visible": true, "searchable": false, "width": "25%"},
									{	"targets": [ 4 ], "visible": true, "searchable": false, "width": "25%"}
						    	],
			"columns"	 : [
				     		   {"data": null, render: function ( data, type, row ) {
				     			   return '';
				     		   	}
				     		   },  
				     		   {"data": "dscTipoProyecto"},   
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
										'<a class="red" onclick="eliminarTipoDepProyecto('+ data.id +')"> <i class="icon-trash bigger-130" data-rel="tooltip" title="Eliminar"> </i></a></div>'+
									'<div class="hidden-desktop visible-phone">'+
										'<div class="inline position-relative">'+
											'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
												'data-toggle="dropdown">'+
												'<i class="icon-caret-down icon-only bigger-120"></i>'+
											'</button>'+

											'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
												'<li><a class="tooltip-error" onclick=eliminarTipoDepProyecto('+ data.id +')'+ 
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

			tabla5.on( 'order.dt search.dt', function () {
				tabla5.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
			       cell.innerHTML = i+1;
			   } );
			}).draw();

var tabla6 = $('#tablaCategoriaAdquisiciones').DataTable({
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
										'<a class="red" onclick="eliminarCategAdquisicion('+ data.id +')"> <i class="icon-trash bigger-130" data-rel="tooltip" title="Eliminar"> </i></a></div>'+
									'<div class="hidden-desktop visible-phone">'+
										'<div class="inline position-relative">'+
											'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
												'data-toggle="dropdown">'+
												'<i class="icon-caret-down icon-only bigger-120"></i>'+
											'</button>'+

											'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
												'<li><a class="tooltip-error" onclick=eliminarCategAdquisicion('+ data.id +')'+ 
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

		 tabla6.on( 'order.dt search.dt', function () {
			tabla6.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
		        cell.innerHTML = i+1;
		    } );
		 }).draw();

var tabla7 = $('#tablaCostoOpertivo').DataTable({
				"ajax"		 : function (data, callback, settings) {
								callback ( { data: dataCostoOperativo } );
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
										'<a class="red" onclick="eliminarCostoOperativo('+ data.id +')"> <i class="icon-trash bigger-130" data-rel="tooltip" title="Eliminar"> </i></a></div>'+
									'<div class="hidden-desktop visible-phone">'+
										'<div class="inline position-relative">'+
											'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
												'data-toggle="dropdown">'+
												'<i class="icon-caret-down icon-only bigger-120"></i>'+
											'</button>'+

											'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
												'<li><a class="tooltip-error" onclick=eliminarCostoOperativo('+ data.id +')'+ 
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

		 tabla7.on( 'order.dt search.dt', function () {
			tabla7.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
		        cell.innerHTML = i+1;
		    } );
		 }).draw();

var tabla8 = $('#tablaFormaPago').DataTable({
				"ajax"		 : function (data, callback, settings) {
								callback ( { data: dataFormaPago } );
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
										'<a class="red" onclick="eliminarFormaPago('+ data.id +')"> <i class="icon-trash bigger-130" data-rel="tooltip" title="Eliminar"> </i></a></div>'+
									'<div class="hidden-desktop visible-phone">'+
										'<div class="inline position-relative">'+
											'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
												'data-toggle="dropdown">'+
												'<i class="icon-caret-down icon-only bigger-120"></i>'+
											'</button>'+

											'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
												'<li><a class="tooltip-error" onclick=eliminarFormaPago('+ data.id +')'+ 
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

		 tabla8.on( 'order.dt search.dt', function () {
			tabla8.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
		        cell.innerHTML = i+1;
		    } );
		 }).draw();

		 $('[data-rel=tooltip]').tooltip();

		 mostrarTipoProyecto();
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
	loadModalCargando();
	var objeto = $("#registrarTipoProyecto").serializeObject();
	objeto.estado = 1;
	console.log(objeto);
	$.postJSON('${pageContext.request.contextPath}/administracion/registrar_tipoProyecto.htm', objeto, function(data) {
		if(data == 0){
			listarTipoProyecto();
			mostrarTipoProyecto();
			closeModalCargando();			
			
			$.gritter.add({
				title: 'Info!',
				text: 'Se registro con éxito.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light'
			});
		}else if(data == 1){
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
	
	$("#descripcionTipoProyecto").val('');
};

//Listar tipo proyectos
function listarTipoProyecto() {
	var t = $("#tablaTipoProyecto").DataTable();
	t.clear().draw();
	var dato = 1;
	$.postJSON('${pageContext.request.contextPath}/administracion/listar_tipoProyecto.htm', dato,
		function(data) {
		dataTipoProyecto = eval(data);
		$("#tablaTipoProyecto").DataTable().ajax.reload();		
	});
};

//Eliminar Tipo Proyecto
function eliminarTipoProyecto(id){
	bootbox.setLocale('es');
	bootbox.confirm("Esta seguro de eliminar la fila seleccionada?", function(result) {
				if(result) {
					loadModalCargando();
					$.postJSON('${pageContext.request.contextPath}/administracion/eliminar_tipoProyecto.htm',id, function(data) {
						listarTipoProyecto();
						mostrarTipoProyecto();
						closeModalCargando();
						
						$.gritter.add({
							title: 'Info!',
							text: 'Se eliminó correctamente.',
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
	loadModalCargando();
	var objeto = $("#registrarEstadoProyecto").serializeObject();
	objeto.estado = 1;
	console.log(objeto);
	$.postJSON('${pageContext.request.contextPath}/administracion/registrar_estadoProyecto.htm', objeto, function(data) {
		if(data == 0){
			listarEstadoProyecto();
			closeModalCargando();
			
			$.gritter.add({
				title: 'Info!',
				text: 'Se registro con éxito.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light'
			});
		}else if(data == 1){
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
	
	$("#descripcionEstadoProyecto").val('');	
};

//Listar estado proyectos
function listarEstadoProyecto() {
	var t = $("#tablaEstadoProyecto").DataTable();
	t.clear().draw();
	var dato = 1;
	$.postJSON('${pageContext.request.contextPath}/administracion/listar_estadoProyecto.htm', dato,
		function(data) {
		dataEstadoProyecto = eval(data);
		$("#tablaEstadoProyecto").DataTable().ajax.reload();		
	});
};

//Eliminar Estado Proyecto
function eliminarEstadoProyecto(id){
	bootbox.setLocale('es');
	bootbox.confirm("Esta seguro de eliminar la fila seleccionada?", function(result) {
				if(result) {
					loadModalCargando();
					$.postJSON('${pageContext.request.contextPath}/administracion/eliminar_estadoProyecto.htm',id, function(data) {
										
						listarEstadoProyecto();
						closeModalCargando();
						
						$.gritter.add({
							title: 'Info!',
							text: 'Se eliminó correctamente.',
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
	loadModalCargando();
	var objeto = $("#registrarTipoRequisito").serializeObject();
	objeto.estado = 1;
	console.log(objeto);
	$.postJSON('${pageContext.request.contextPath}/administracion/registrar_tipoRequisitoProyecto.htm', objeto, function(data) {
		if(data == 0){
			
			listarTipoRequisitoProyecto();
			closeModalCargando();
			
			$.gritter.add({
				title: 'Info!',
				text: 'Se registro con éxito.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light' 
			});
		}else if(data == 1){
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
	
	$("#idReqProyecto").val('');	
};

//Listar tipo Requisito proyectos
function listarTipoRequisitoProyecto() {	
	var t = $("#tablaTipoRequisitoProyecto").DataTable();
	t.clear().draw();
	var dato = 1;
	$.postJSON('${pageContext.request.contextPath}/administracion/listar_tipoRequisitoProyecto.htm', dato,
		function(data) {
		datatipoReqProyecto = eval(data);
		$("#tablaTipoRequisitoProyecto").DataTable().ajax.reload();		
	});
};

//Eliminar Tipo requisito Proyecto
function eliminarTipoReqProyecto(id){
	bootbox.setLocale('es');
	bootbox.confirm("Esta seguro de eliminar la fila seleccionada?", function(result) {
				if(result) {
					loadModalCargando();
					$.postJSON('${pageContext.request.contextPath}/administracion/eliminar_tipoRequisitoProyecto.htm',id, function(data) {
										
						listarTipoRequisitoProyecto();
						closeModalCargando();
						
						$.gritter.add({
							title: 'Info!',
							text: 'Se eliminó correctamente.',
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

function mostrarTipoProyecto()
{
	var dato = 1; 
	$("#idTipoProyectoReq").empty();
	$("#idTipoProyectoReq").append('<option value="">Seleccionar</option>');

	$("#idTipoProyectoSup").empty();
	$("#idTipoProyectoSup").append('<option value="">Seleccionar</option>');

	$("#idTipoProyectoDep").empty();
	$("#idTipoProyectoDep").append('<option value="">Seleccionar</option>');

	
	$.postJSON('${pageContext.request.contextPath}/administracion/listar_tipoProyecto.htm', dato,
		function(data) {
		var listarTipProyecto = eval(data);
		 $.each(listarTipProyecto, function (key, value) {
             $("#idTipoProyectoReq").append("<option value=" + value.id + ">" + value.descripcion + "</option>");
             $("#idTipoProyectoSup").append("<option value=" + value.id + ">" + value.descripcion + "</option>");
             $("#idTipoProyectoDep").append("<option value=" + value.id + ">" + value.descripcion + "</option>");
         });
	});
}
//#################################################### [FIN] TIPO REQUISITO #####################################################
//#################################################### [INI] TIPO SUPUESTO ######################################################
//validar tipo supuesto
$('#registrarTipoSupuesto').validate({
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
		registrarTipoSupuestoProyecto();
	}
});

//Registrar tipo supuesto
function registrarTipoSupuestoProyecto() 
{
	loadModalCargando();
	var objeto = $("#registrarTipoSupuesto").serializeObject();
	objeto.estado = 1;
	console.log(objeto);
	$.postJSON('${pageContext.request.contextPath}/administracion/registrar_tipoSupuestoProyecto.htm', objeto, function(data) {
		if(data == 0){
			
			listarTipoSupuestoProyecto();
			closeModalCargando();

			$.gritter.add({
				title: 'Info!',
				text: 'Se registro con éxito.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light' 
			});
		}else if(data == 1){
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
	
	$("#idTipoSupuesto").val('');	
};

//Listar tipo Supuesto proyectos
function listarTipoSupuestoProyecto() {	
	var t = $("#tablaTipoSupuestoProyecto").DataTable();
	t.clear().draw();
	var dato = 1;
	$.postJSON('${pageContext.request.contextPath}/administracion/listar_tipoSupuestoProyecto.htm', dato,
		function(data) {
		datatipoSupProyecto = eval(data);
		$("#tablaTipoSupuestoProyecto").DataTable().ajax.reload();		
	});
};

function eliminarTipoSupProyecto(){
	bootbox.setLocale('es');
	bootbox.confirm("Esta seguro de eliminar la fila seleccionada?", function(result) {
				if(result) {
					loadModalCargando();
					$.postJSON('${pageContext.request.contextPath}/administracion/eliminar_tipoSupuestoProyecto.htm',id, function(data) {
										
						listarTipoSupuestoProyecto();
						closeModalCargando();
						
						$.gritter.add({
							title: 'Info!',
							text: 'Se eliminó correctamente.',
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
//#################################################### [FIN] TIPO SUPUESTO ######################################################
//#################################################### [INI] TIPO DEPENDENCIA ######################################################
//validar tipo supuesto
$('#registrarTipoDependencia').validate({
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
		registrarTipoDependenciaProyecto();
	}
});

//Registrar tipo supuesto
function registrarTipoDependenciaProyecto() 
{
	loadModalCargando();
	var objeto = $("#registrarTipoDependencia").serializeObject();
	objeto.estado = 1;
	console.log(objeto);
	$.postJSON('${pageContext.request.contextPath}/administracion/registrar_tipoDependenciaProyecto.htm', objeto, function(data) {
		if(data == 0){
			
			listarTipoDependenciaProyecto();
			closeModalCargando();

			$.gritter.add({
				title: 'Info!',
				text: 'Se registro con éxito.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light' 
			});
		}else if(data == 1){
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
	
	$("#idTipoDependencia").val('');	
};

//Listar tipo Dependencia proyectos
function listarTipoDependenciaProyecto() {	
	var t = $("#tablaTipoDependenciaProyecto").DataTable();
	t.clear().draw();
	var dato = 1;
	$.postJSON('${pageContext.request.contextPath}/administracion/listar_tipoDependenciaProyecto.htm', dato,
		function(data) {
		datatipoDepProyecto = eval(data);
		$("#tablaTipoDependenciaProyecto").DataTable().ajax.reload();		
	});
};

function eliminarTipoDepProyecto(id){
	bootbox.setLocale('es');
	bootbox.confirm("Esta seguro de eliminar la fila seleccionada?", function(result) {
				if(result) {
					loadModalCargando();
					$.postJSON('${pageContext.request.contextPath}/administracion/eliminar_tipoDependenciaProyecto.htm',id, function(data) {
										
						listarTipoDependenciaProyecto();
						closeModalCargando();
						
						$.gritter.add({
							title: 'Info!',
							text: 'Se eliminó correctamente.',
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
//#################################################### [FIN] TIPO DEPENDENCIA ######################################################
//#################################################### [INI] CATEGORIA ADQUISICION ####################################################
//Validar tipo proyecto
$('#registrarCategoriaAdquisicion').validate({
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
		registrarCategoriaAdquisicion();
	}
});
				
//Registrar tipo proyecto 
function registrarCategoriaAdquisicion() 
{
	loadModalCargando();
	var objeto = $("#registrarCategoriaAdquisicion").serializeObject();
	objeto.estado = 1;
	console.log(objeto);
	$.postJSON('${pageContext.request.contextPath}/administracion/registrar_CategAdquisicion.htm', objeto, function(data) {
		if(data == 0){
			listarCategAdquisicion();
			closeModalCargando();			
			
			$.gritter.add({
				title: 'Info!',
				text: 'Se registro con éxito.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light'
			});
		}else if(data == 1){
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
	
	$("#descripcionCatAdquisicion").val('');
};

//Listar categoria adquisiciones
function listarCategAdquisicion() {
	var t = $("#tablaCategoriaAdquisiciones").DataTable();
	t.clear().draw();
	var dato = 1;
	$.postJSON('${pageContext.request.contextPath}/administracion/listar_CategAdquisicion.htm', dato,
		function(data) {
		dataCategAdquisiciones = eval(data);
		$("#tablaCategoriaAdquisiciones").DataTable().ajax.reload();		
	});
};

//Eliminar Categoria Adquisiciones
function eliminarCategAdquisicion(id){
	bootbox.setLocale('es');
	bootbox.confirm("Esta seguro de eliminar la fila seleccionada?", function(result) {
				if(result) {
					loadModalCargando();
					$.postJSON('${pageContext.request.contextPath}/administracion/eliminar_CatgAdquisicion.htm',id, function(data) {
						listarCategAdquisicion();
						closeModalCargando();
						
						$.gritter.add({
							title: 'Info!',
							text: 'Se eliminó correctamente.',
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
//#################################################### [FIN] CATEGORIA ADQUISICION ####################################################

//#################################################### [INI] COSTOS OPERATIVOS ####################################################
//Validar tipo proyecto
$('#registrarCostoOperativo').validate({
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
		registrarCostoOperativo();
	}
});
				
//Registrar tipo proyecto 
function registrarCostoOperativo() 
{
	loadModalCargando();
	var objeto = $("#registrarCostoOperativo").serializeObject();
	objeto.estado = 1;
	console.log(objeto);
	$.postJSON('${pageContext.request.contextPath}/administracion/registrar_CostoOperativo.htm', objeto, function(data) {
		if(data == 0){
			listarCostoOperativo();
			closeModalCargando();			
			
			$.gritter.add({
				title: 'Info!',
				text: 'Se registro con éxito.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light'
			});
		}else if(data == 1){
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
	
	$("#idCostosOperativos").val('');
};

//Listar categoria adquisiciones
function listarCostoOperativo() {
	var t = $("#tablaCostoOpertivo").DataTable();
	t.clear().draw();
	var dato = 1;
	$.postJSON('${pageContext.request.contextPath}/administracion/listar_CostoOperativo.htm', dato,
		function(data) {
		dataCostoOperativo = eval(data);
		$("#tablaCostoOpertivo").DataTable().ajax.reload();		
	});
};

//Eliminar Categoria Adquisiciones
function eliminarCostoOperativo(id){
	bootbox.setLocale('es');
	bootbox.confirm("Esta seguro de eliminar la fila seleccionada?", function(result) {
				if(result) {
					loadModalCargando();
					$.postJSON('${pageContext.request.contextPath}/administracion/eliminar_CostoOperativo.htm',id, function(data) {
						listarCostoOperativo();
						closeModalCargando();
						
						$.gritter.add({
							title: 'Info!',
							text: 'Se eliminó correctamente.',
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
//#################################################### [FIN] COSTOS OPERATIVOS ####################################################

//#################################################### [INI] FORMA DE PAGO ####################################################
//Validar tipo proyecto
$('#registrarFormaPago').validate({
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
		registrarFormaPago();
	}
});
				
//Registrar tipo proyecto 
function registrarFormaPago() 
{
	loadModalCargando();
	var objeto = $("#registrarFormaPago").serializeObject();
	objeto.estado = 1;
	console.log(objeto);
	$.postJSON('${pageContext.request.contextPath}/administracion/registrar_FormaPago.htm', objeto, function(data) {
		if(data == 0){
			listarFormaPago();
			closeModalCargando();			
			
			$.gritter.add({
				title: 'Info!',
				text: 'Se registro con éxito.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light'
			});
		}else if(data == 1){
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
	
	$("#idFormaPago").val('');
};

//Listar categoria adquisiciones
function listarFormaPago() {
	var t = $("#tablaFormaPago").DataTable();
	t.clear().draw();
	var dato = 1;
	$.postJSON('${pageContext.request.contextPath}/administracion/listar_FormaPago.htm', dato,
		function(data) {
		dataFormaPago = eval(data);
		$("#tablaFormaPago").DataTable().ajax.reload();		
	});
};

//Eliminar Categoria Adquisiciones
function eliminarFormaPago(id){
	bootbox.setLocale('es');
	bootbox.confirm("Esta seguro de eliminar la fila seleccionada?", function(result) {
				if(result) {
					loadModalCargando();
					$.postJSON('${pageContext.request.contextPath}/administracion/eliminar_FormaPago.htm',id, function(data) {
						listarFormaPago();
						closeModalCargando();
						
						$.gritter.add({
							title: 'Info!',
							text: 'Se eliminó correctamente.',
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
//#################################################### [FIN] FORMA DE PAGO ####################################################
</script>