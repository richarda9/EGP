<script src="../assets/js/bootstrap-wysiwyg.min.js"></script>
<script src="../assets/js/jquery.hotkeys.min.js"></script>
<script src="../assets/js/fuelux/data/fuelux.tree-sampledata.js"></script>
<script src="../assets/js/fuelux/fuelux.tree.min.js"></script>
<script src="../assets/js/bootbox.min.js"></script>
<script src="../assets/js/planificacion/registroTareasPlanificacion.js"></script>

<script>
var dataSetRequisitoProyecto = [];
var dataSetExclusion = [];
var dataSetSupuesto = [];
var dataSetDependencia = [];
var dataSetFactorExito = [];
var dataSetFormaPago = [];
var dataSetDetalleRiesgo = [];
var dataSetDetalleAdquisicion = [];
var dataSetRolProveedor = [];
var dataSetRolCliente = [];
var dataEntregable = eval('${model.listaEntregableProyecto}');
var dataProductoEntregable = [];
var dataSetDetalleCostoOperativo = [];
var dataSetRRHHResponsabilidadesProveedor = [];
var dataSetRRHHResponsabilidadesCliente = [];
var dataSetCostosProyecto = [];
var dataSetCostosProyecto = eval('${model.listaDetalleCostoProyectoBD}');
var dataTarea = eval('${model.listaTareas}');

$(document).ready(function() {/* INI - READY */
	
	$('#archContrato').ace_file_input({
        no_file:'Seleccionar archivo ...',
        btn_choose:'Seleccionar',
        btn_change:'Cambiar',
        droppable:false,
        onchange:null,
        thumbnail:false 
        //| true | large
        //whitelist:'gif|png|jpg|jpeg'
        //blacklist:'exe|php'
        //onchange:''
        //
    });
    
	$('#fechaAprobacion').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fechaAprobacion').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});

	
	$('#fechaContacto').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fechaContacto').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});
	
	$('#fechaFacturaFP').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fechaFacturaFP').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});
	
	$('#fechaCobranzaFP').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fechaCobranzaFP').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});
	
	$('#fechaAdquirirAD').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fechaAdquirirAD').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});
	
	$('#fechaCostoOP').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fechaCostoOP').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});
	
	$('#fechaProgramadaET').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fechaProgramadaET').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});
	
	$('#editor1').ace_wysiwyg({
		toolbar:
		[
			'font',
			null,
			'fontSize',
			null,
			{name:'bold', className:'btn-info'},
			{name:'italic', className:'btn-info'},
			{name:'strikethrough', className:'btn-info'},
			{name:'underline', className:'btn-info'},
			null,
			{name:'insertunorderedlist', className:'btn-success'},
			{name:'insertorderedlist', className:'btn-success'},
			{name:'outdent', className:'btn-purple'},
			{name:'indent', className:'btn-purple'},
			null,
			{name:'justifyleft', className:'btn-primary'},
			{name:'justifycenter', className:'btn-primary'},
			{name:'justifyright', className:'btn-primary'},
			{name:'justifyfull', className:'btn-inverse'},
			null,
			{name:'createLink', className:'btn-pink'},
			{name:'unlink', className:'btn-pink'},
			null,
			{name:'insertImage', className:'btn-success'},
			null,
			'foreColor',
			null,
			{name:'undo', className:'btn-grey'},
			{name:'redo', className:'btn-grey'}
		],
		'wysiwyg': {
			fileUploadError: showErrorAlert
		}
	}).prev().addClass('wysiwyg-style2');
	
	
	
	$('#archObservacion').ace_file_input({
						no_file:'No File ...',
						btn_choose:'Choose',
						btn_change:'Change',
						droppable:false,
						onchange:null,
						thumbnail:false
					});
					
	function showErrorAlert (reason, detail) {
		var msg='';
		if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
		else {
			console.log("error uploading file", reason, detail);
		}
		$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
		 '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
	}
	
	$('#editor2').ace_wysiwyg({
		toolbar:
		[
			'font',
			null,
			'fontSize',
			null,
			{name:'bold', className:'btn-info'},
			{name:'italic', className:'btn-info'},
			{name:'strikethrough', className:'btn-info'},
			{name:'underline', className:'btn-info'},
			null,
			{name:'insertunorderedlist', className:'btn-success'},
			{name:'insertorderedlist', className:'btn-success'},
			{name:'outdent', className:'btn-purple'},
			{name:'indent', className:'btn-purple'},
			null,
			{name:'justifyleft', className:'btn-primary'},
			{name:'justifycenter', className:'btn-primary'},
			{name:'justifyright', className:'btn-primary'},
			{name:'justifyfull', className:'btn-inverse'},
			null,
			{name:'createLink', className:'btn-pink'},
			{name:'unlink', className:'btn-pink'},
			null,
			{name:'insertImage', className:'btn-success'},
			null,
			'foreColor',
			null,
			{name:'undo', className:'btn-grey'},
			{name:'redo', className:'btn-grey'}
		],
		'wysiwyg': {
			fileUploadError: showErrorAlert
		}
	}).prev().addClass('wysiwyg-style2');
	
	/* INI - TAB TIPO REQUISITO  */
	var opcionesTipoRequisito = '<a id="deleteTipoRequisito" class="red tooltip-error" data-rel="tooltip" title="Eliminar"><i class="icon-trash bigger-130"> </i></a>';
	$('#tablaReqProyecto').DataTable({
		"ajax"		 : function (data, callback, settings) {
			callback ( { data: dataSetRequisitoProyecto } );
		   },
		"ordering"   : false,
		"paging"     : false,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 
		//"bLengthChange": false,
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       },
        "columns"	 : [
		            	{ "data": "descTipoRequisito"},
		            	/* { "data": "codigo"}, */
		            	{ "data": "descripcion"},
		            	{ "data": "observacion"},
		            	{ "data": null}
		        ],
        "columnDefs" : [
                        {        				
	         				"targets": -1,
	         				"data": null,
	         				"defaultContent": opcionesTipoRequisito}	         			
        		]
	});
	
	$('#tablaReqProyecto tbody').on( 'click', '#deleteTipoRequisito', function () {
		var indice = $(this).parents('tr').index();
		$('#modalEliminarRequisitoProyecto').attr('data-attr-index',indice);
		$('#modalEliminarRequisitoProyecto').modal('show'); 

	} );
	
	$('#modalEliminarRequisitoProyecto').on('click', '#confirmarEliminarRequisitoProyecto', function(){
		deleteRequisitoProyecto();		
	});
	/* FIN - TAB TIPO REQUISITO  */
	
	/* INI - TAB EXCLUSION  */
	var opcionesExclusion = '<a id="deleteExclusion" class="red tooltip-error" data-rel="tooltip" title="Eliminar"><i class="icon-trash bigger-130"> </i></a>';
	$('#tablaExclProyecto').DataTable({
		"ajax"		 : function (data, callback, settings) {
			callback ( { data: dataSetExclusion } );
		   },
		"ordering"   : false,
		"paging"     : false,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 
		//"bLengthChange": false,
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       },
        "columns"	 : [
		            	/* { "data": "codigo"}, */
		            	{ "data": "descripcion"},
		            	{ "data": null}
		        ],
        "columnDefs" : [
                        {        				
	         				"targets": -1,
	         				"data": null,
	         				"defaultContent": opcionesExclusion}	         			
        		]
	});
	
	$('#tablaExclProyecto tbody').on( 'click', '#deleteExclusion', function () {
		var indice = $(this).parents('tr').index();
		$('#modalEliminarExclusiones').attr('data-attr-index',indice);
		$('#modalEliminarExclusiones').modal('show'); 

	} );
	
	$('#modalEliminarExclusiones').on('click', '#confirmarEliminarExclusion', function(){
		deleteExclusion();		
	});
	/* FIN - TAB EXCLUSION  */
	
	/* INI - TAB SUPUESTO Y CONSIDERACIONES  */
	var opcionesSupuesto = '<a id="deleteSupuesto" class="red tooltip-error" data-rel="tooltip" title="Eliminar"><i class="icon-trash bigger-130"> </i></a>';
	$('#tablaSupuestoProyecto').DataTable({
		"ajax"		 : function (data, callback, settings) {
			callback ( { data: dataSetSupuesto } );
		   },
		"ordering"   : false,
		"paging"     : false,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 
		//"bLengthChange": false,
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       },
        "columns"	 : [
		            	{ "data": "descTipoSupuesto"},
		            	{ "data": "descripcion"},
		            	{ "data": null}
		        ],
        "columnDefs" : [
                        {        				
	         				"targets": -1,
	         				"data": null,
	         				"defaultContent": opcionesSupuesto}	         			
        		]
	});
	
	$('#tablaSupuestoProyecto tbody').on( 'click', '#deleteSupuesto', function () {
		var indice = $(this).parents('tr').index();
		$('#modalEliminarSupuesto').attr('data-attr-index',indice);
		$('#modalEliminarSupuesto').modal('show'); 

	} );
	
	$('#modalEliminarSupuesto').on('click', '#confirmarEliminarSupuesto', function(){
		deleteSupuesto();		
	});
	/* FIN - TAB SUPUESTO Y CONSIDERACIONES  */
	
	/* INI - TAB DEPENDENCIA  */
	var opcionesDependencia = '<a id="deleteDependencia" class="red tooltip-error" data-rel="tooltip" title="Eliminar"><i class="icon-trash bigger-130"> </i></a>';	
	$('#tablaDependenciaProyecto').DataTable({
		"ajax"		 : function (data, callback, settings) {
			callback ( { data: dataSetDependencia } );
		   },
		"ordering"   : false,
		"paging"     : false,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 
		//"bLengthChange": false,
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       },
	       "columns"	 : [
		            	{ "data": "descTipoDepedencia"},
		            	{ "data": "descripcion"},
		            	{ "data": null}
		        ],
	       "columnDefs" : [
	                       {        				
	         				"targets": -1,
	         				"data": null,
	         				"defaultContent": opcionesDependencia}	         			
	       		]
	});
	
	$('#tablaDependenciaProyecto tbody').on( 'click', '#deleteDependencia', function () {
		var indice = $(this).parents('tr').index();
		$('#modalEliminarDependencia').attr('data-attr-index',indice);
		$('#modalEliminarDependencia').modal('show'); 

	} );
	
	$('#modalEliminarDependencia').on('click', '#confirmarEliminarDependencia', function(){
		deleteDependencia();		
	});
	/* FIN - TAB DEPENDENCIA  */
	
	/* INI - TAB FACTOR EXITO  */
	var opcionesFactorExito= '<a id="deleteFactorExito" class="red tooltip-error" data-rel="tooltip" title="Eliminar"><i class="icon-trash bigger-130"> </i></a>';
	$('#tablafactExitoProyecto').DataTable({
		"ajax"		 : function (data, callback, settings) {
			callback ( { data: dataSetFactorExito } );
		   },
		"ordering"   : false,		
		"paging"     : false,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 
		//"bLengthChange": false,
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       },
       "columns"	 : [
		            	{ "data": "descripcion"},
		            	{ "data": null}
		        ],
	       "columnDefs" : [
	                       {        				
	         				"targets": -1,
	         				"data": null,
	         				"defaultContent": opcionesFactorExito}	         			
	       		]
	});
	
	$('#tablafactExitoProyecto tbody').on( 'click', '#deleteFactorExito', function () {
		var indice = $(this).parents('tr').index();
		$('#modalEliminarFactorExito').attr('data-attr-index',indice);
		$('#modalEliminarFactorExito').modal('show'); 

	} );
	
	$('#modalEliminarFactorExito').on('click', '#confirmarEliminarFactorExito', function(){
		deleteFactorExito();		
	});
	/* FIN - TAB FACTOR EXITO  */
	
	$('#arbolProveedor').ace_tree({
		dataSource: treeDataSource ,
		//multiSelect:true,
		loadingHTML:'<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
		'open-icon' : 'icon-minus',
		'close-icon' : 'icon-plus',
		'selectable' : true,
		'selected-icon' : 'icon-ok',
		'unselected-icon' : 'icon-remove'
	});
	
	$('#arbolCliente').ace_tree({
		dataSource: treeDataSource ,
		//multiSelect:true,
		loadingHTML:'<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
		'open-icon' : 'icon-minus',
		'close-icon' : 'icon-plus',
		'selectable' : true,
		'selected-icon' : 'icon-ok',
		'unselected-icon' : 'icon-remove'
	});
	
	$('#tablaEntregableProyecto').DataTable({
		"ajax"		 : function (data, callback, settings) {
						callback ( { data: dataEntregable } );
					   },
		"ordering"   : false,		
		"paging"     : false,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 		
	    "columns"	 : [
	             		   {"data": "nombre"},  
	             		   {"data": "descripcion"},  
					       {"data": "fechaProgramada"},
					       {"data": null, render: function ( data, type, row ) {
					    	   return '<td class="td-actions">'+
							    	   '<div class="hidden-phone visible-desktop action-buttons">'+
										'<a class="blue" onclick="editarEntregable('+ data.identregable +')"> <i class="icon-edit bigger-130" data-rel="tooltip" title="Editar"> </i></a></div>'+
									'<div class="hidden-desktop visible-phone">'+
										'<div class="inline position-relative">'+
											'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
												'data-toggle="dropdown">'+
												'<i class="icon-caret-down icon-only bigger-120"></i>'+
											'</button>'+
		
											'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
												'<li><a class="tooltip-error" onclick=editarEntregable('+ data.identregable +')'+ 
													' data-rel="tooltip" title="Editar"> <span class="blue">'+
															'<i class="icon-edit bigger-120"></i>'+
													'</span>'+
												'</a></li>'+
											'</ul>'+
										'</div>'+
									'</div>'+
								'</td>'+					    	   
					    	   	'<div class="hidden-phone visible-desktop action-buttons">'+
									'<a class="red" onclick="eliminarEntregable('+ data.identregable +')"> <i class="icon-trash bigger-130" data-rel="tooltip" title="Eliminar"> </i></a></div>'+
								'<div class="hidden-desktop visible-phone">'+
									'<div class="inline position-relative">'+
										'<button class="btn btn-minier btn-yellow dropdown-toggle"'+
											'data-toggle="dropdown">'+
											'<i class="icon-caret-down icon-only bigger-120"></i>'+
										'</button>'+

										'<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">'+
											'<li><a class="tooltip-error" onclick=eliminarEntregable('+ data.identregable +')'+ 
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
	
	/* INICIO - DETALLE RIESGO */
	$('#tablaRiesgosProyecto tbody').on( 'click', '#deleteDetalleRiesgos', function () {
		var indice = $(this).parents('tr').index();		
		$('#modalEliminarDetalleRiesgo').attr('data-attr-index',indice);
		$('#modalEliminarDetalleRiesgo').modal('show');
	} );
	
	$('#modalEliminarDetalleRiesgo').on('click', '#confirmarEliminarDetalleRiesgo', function(){
		deleteDetalleRiesgos();		
	});	
	
	var opcionesEliminarDetalleRiesgos= '<a id="deleteDetalleRiesgos" class="red tooltip-error" data-rel="tooltip" title="Eliminar"><i class="icon-trash bigger-130"> </i></a>';
	$('#tablaRiesgosProyecto').DataTable({
		"ajax"		 : function (data, callback, settings) {
						callback ( { data: dataSetDetalleRiesgo } );
		   				},
		"ordering"   : false,
		"paging"     : false,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 		
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       },
		 "columns"	 : [
			{ "data": "idDetalleRiesgos", "visible":false},
			{ "data": "valRiesgo"},
			{ "data": "valResponsable"},
			{ "data": "valImpacto"},
			{ "data": "valProbabilidad"},
			{ "data": "valContigencia"},
			{ "data": "valMitigacion"},
			{ "data": null}
				       	],
		 "columnDefs" : [
			{   "targets": -1,
			    "data": null,
			    "defaultContent": opcionesEliminarDetalleRiesgos}	         			
					    ]
	});
	
	/* INICIO - DETALLE ADQUISICIONES */
	$('#tablaAdquisicionesProyecto tbody').on( 'click', '#deleteDetalleAdquisicion', function () {
		var indice = $(this).parents('tr').index();		
		$('#modalEliminarDetalleAdquisicion').attr('data-attr-index',indice);
		$('#modalEliminarDetalleAdquisicion').modal('show');
	} );
	
	$('#modalEliminarDetalleAdquisicion').on('click', '#confirmarEliminarDetalleAdquisicion', function(){
		deleteDetalleAdquisicion();		
	});	
	
	var opcionesEliminarAdquisicion= '<a id="deleteDetalleAdquisicion" class="red tooltip-error" data-rel="tooltip" title="Eliminar"><i class="icon-trash bigger-130"> </i></a>';
	$('#tablaAdquisicionesProyecto').DataTable({
		"ajax"		 : function (data, callback, settings) {
						callback ( { data: dataSetDetalleAdquisicion } );
		   				},
		"ordering"   : false,
		"paging"     : false,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 		
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
					   },
		"columns"	 : [
			{ "data": "id", "visible":false},
			{ "data": "producto"},
			{ "data": "categoriaDescripcion"},
			{ "data": "cantidad"},
			{ "data": "costoUnitario"},
			{ "data": "fechaAdquisicion"},			
			{ "data": null}
						],
		"columnDefs" : [
			{   "targets": -1,
				"data": null,
				"defaultContent": opcionesEliminarAdquisicion}	         			
						]

	});
	
	/* INICIO - DETALLE COSTOS OPERATIVOS */
	$('#tablaCostosOperativo tbody').on( 'click', '#deleteDetalleCostosOperativo', function () {
		var indice = $(this).parents('tr').index();		
		$('#modalEliminarDetalleCostoOperativo').attr('data-attr-index',indice);
		$('#modalEliminarDetalleCostoOperativo').modal('show');
	} );
	
	$('#modalEliminarDetalleCostoOperativo').on('click', '#confirmarEliminarDetalleCostoOperativo', function(){
		deleteDetalleCostosOperativos();		
	});	
	
	var opcionesEliminarCostosOperativo= '<a id="deleteDetalleCostosOperativo" class="red tooltip-error" data-rel="tooltip" title="Eliminar"><i class="icon-trash bigger-130"> </i></a>';
	$('#tablaCostosOperativo').DataTable({
		"ajax"		 : function (data, callback, settings) {
						callback ( { data: dataSetDetalleCostoOperativo } );
		   				},
		"ordering"   : false,
		"paging"     : false,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 		
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
					   },
		"columns"	 : [
			{ "data": "idCostoOperativo", "visible":false},
			{ "data": "valTipoCosto"},
			{ "data": "descripcionCosto"},
			{ "data": "fecha"},
			{ "data": "monto"},					
			{ "data": null}
						],
		"columnDefs" : [
			{   "targets": -1,
				"data": null,
				"defaultContent": opcionesEliminarCostosOperativo}	         			
						]

	});
	
	var tablaProductoEntregable = $('#tablaProductoEntregable').DataTable({
		"ajax"		 : function (data, callback, settings) {
						callback ( { data: dataProductoEntregable } );
					   },
	    "paging"     : true,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 
		"columnDefs" :
				    	[
							{	"targets": [ 0 ], "visible": false, "searchable": false, "width": "0%"},
							{	"targets": [ 1 ], "visible": true, "searchable": false, "width": "100%"}
				    	],
	    "columns"	 : [
	             		   {"data": "id"},
	             		   {"data": "producto"}
						  ],
	    "destroy"	 : true,
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       }
	});

	$('#tablaProductoEntregable tbody').on( 'click', 'tr', function () {
		var texto = this.innerText; 		
		if(!texto.endsWith("dato disponible en esta tabla")){
	        if ( $(this).hasClass('selected') ) {
	            $(this).removeClass('selected');
	        }
	        else {
	        	tablaProductoEntregable.$('tr.selected').removeClass('selected');
	            $(this).addClass('selected');
	        }
    	}
    });
	
	/* $('#tablaCostosProyecto').DataTable({
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
	 */
	/* INI - DESCRIPCION DEL PRODUCTO */
	$('#formPlanDescripcion').validate({
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
		}
	});		
	/* FIN - DESCRIPCION DEL PRODUCTO */
	
	/* INI - ALCANCE */
	$('#formPlanAlcance').validate({
		errorClass: 'help-block',
		rules: {
			definicionAlcance: {
				required: true
			}
		},
		
		highlight: function (e) {
			$(e).closest('.control-group').removeClass('info').addClass('error');
		},

		success: function (e) {
			$(e).closest('.control-group').removeClass('error');
			$(e).remove();
		}
	});		
	/* FIN - ALCANCE */	

	/* INI - RRHH */
	$('#formTipoRolProveedor').validate({
		errorClass: 'help-block',
		rules: {
			idTipoRolProveedor: {
				required: true
			},
			idCantidadTipoRolProveedor: {
				required: true,
				digits: true
			}
		},
		
		highlight: function (e) {
			$(e).closest('.control-group').removeClass('info').addClass('error');
		},

		success: function (e) {
			$(e).closest('.control-group').removeClass('error');
			$(e).remove();
		}
	});
	
	$('#formTipoRolCliente').validate({
		errorClass: 'help-block',
		rules: {
			idTipoRolCliente: {
				required: true
			},
			idCantidadTipoRolCliente: {
				required: true,
				digits: true
			}
		},
		
		highlight: function (e) {
			$(e).closest('.control-group').removeClass('info').addClass('error');
		},

		success: function (e) {
			$(e).closest('.control-group').removeClass('error');
			$(e).remove();
		}
	});	
	/* FIN - RRHH */

	/* INI - RIESGOS */
	$('#formDetalleRiesgos').validate({
		errorClass: 'help-block',
		rules: {
			valRiesgo: {
				required: true
			},
			valResponsable: {
				required: true
			},
			valImpacto: {
				required: true
			},
			valProbabilidad: {
				required: true,
				number: true
			},
			valContigencia: {
				required: true
			},
			valMitigacion: {
				required: true
			}
		},
		
		highlight: function (e) {
			$(e).closest('.control-group').removeClass('info').addClass('error');
		},

		success: function (e) {
			$(e).closest('.control-group').removeClass('error');
			$(e).remove();
		}
	});		
	/* FIN - RIESGOS */
	
	/* INI - ADQUISICIONES */
	$('#formDetalleAdquisicion').validate({
		errorClass: 'help-block',
		rules: {
			valProductoAD: {
				required: true
			},
			idCategoriaAD: {
				required: true
			},
			valCantidadAD: {
				required: true,
				digits: true
			},
			valCostoUnitAD: {
				required: true,
				number: true
			},
			fechaAdquirirAD: {
				required: true
			}			
		},
		
		highlight: function (e) {
			$(e).closest('.control-group').removeClass('info').addClass('error');
		},

		success: function (e) {
			$(e).closest('.control-group').removeClass('error');
			$(e).remove();
		}
	});		
	/* FIN - ADQUISICIONES */		

	/* INI - COSTOS OPERATIVOS */
	$('#formCostoOperativo').validate({
		errorClass: 'help-block',
		rules: {
			idTipoCostoOP: {
				required: true
			},
			valDescripcionOP: {
				required: true
			},
			fechaCostoOP: {
				required: true
			},
			valMontoOP: {
				required: true,
				number: true
			}			
		},
		
		highlight: function (e) {
			$(e).closest('.control-group').removeClass('info').addClass('error');
		},

		success: function (e) {
			$(e).closest('.control-group').removeClass('error');
			$(e).remove();
		}
	});		
	/* FIN - COSTOS OPERATIVOS */		
	
	/* INICIO - FORMAS DE PAGO */	
		$('#formFormasPago').validate({
		errorClass: 'help-block',
		rules: {
			fechaFacturaFP: {
				required: true
			},
			idFormaPago: {
				required: true
			},
			fechaCobranzaFP: {
				required: true
			},
			idEntregableFP: {
				required: true
			},
			valPorcPago: {
				required: true,
				number: true
			}	
		},
		
		highlight: function (e) {
			$(e).closest('.control-group').removeClass('info').addClass('error');
		},

		success: function (e) {
			$(e).closest('.control-group').removeClass('error');
			$(e).remove();
		}
	});			
	
	$('#tablaFormasPago tbody').on( 'click', '#deleteFormaPago', function () {
		var indice = $(this).parents('tr').index();		
		$('#modalEliminarFormasPago').attr('data-attr-index',indice);
		$('#modalEliminarFormasPago').modal('show');
	} );	
	
	$('#modalEliminarFormasPago').on('click', '#confirmarEliminarFormasPago', function(){
		deleteFormasPago();		
	});
	
	var opcionesEliminarFormaPago= '<a id="deleteFormaPago" class="red tooltip-error" data-rel="tooltip" title="Eliminar"><i class="icon-trash bigger-130"> </i></a>';
	$('#tablaFormasPago').DataTable({
		"ajax"		 : function (data, callback, settings) {
			callback ( { data: dataSetFormaPago } );
		   },
		"ordering"   : false,
		"paging"    : false,
		"autoWidth" : true,
		"pageLength": 10,
		"searching" : false,
		"bInfo"     : false, 
		//"bLengthChange": false,
		"language"  : {
			            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
			          },
         "columns"	 : [
        	{ "data": "idFormaPagoDetal", "visible":false},
           	{ "data": "fechaFacturacion"},
           	{ "data": "descripcionFormaPago"},
           	{ "data": "fechaCobranza"},
           	{ "data": "descripcionEntregable"},
           	{ "data": "porcentajePago"},
           	{ "data": null}
       			],
	     "columnDefs" : [
	                       {        				
	         				"targets": -1,
	         				"data": function ( row, type, val, meta ) {
	         					/* var abc = type;
	         					var abcd = val; */
	         				},
	         				"defaultContent": opcionesEliminarFormaPago}	         			
	       		]
	});	
	
	/* INICIO - EJECUCION */	
	$('#formEjecucion').validate({
	errorClass: 'help-block',
	rules: {
		fechaAprobacion: {
			required: true
		}
	},
	
	highlight: function (e) {
		$(e).closest('.control-group').removeClass('info').addClass('error');
	},

	success: function (e) {
		$(e).closest('.control-group').removeClass('error');
		$(e).remove();
	}
});			
	/* FIN - EJECUCION */		
	
	/* INI - TAB RECURSOS HUMANOS  */
    var opcionesTipoRolProveedor = '<a id="deleteTipoRolProveedor" class="red tooltip-error" data-rel="tooltip" title="Eliminar"><i class="icon-trash bigger-130"> </i></a>';
    $('#tablaTipoRolProveedor').DataTable({
        "ajax"         : function (data, callback, settings) {
            callback ( { data: dataSetRolProveedor } );
           },
        "ordering"   : false,
        "paging"     : false,
        "autoWidth"  : true,
        "pageLength" : 10,
        "searching"  : false,
        "bInfo"      : false, 
        "language"   : {
                            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
                       },
        "columns"  : [       
                        { "data": "id", "visible":false},
                        { "data": "descripcion"},
                        { "data": "cantidad"},
                        { "data": null}
                ],
        "columnDefs" : [
                        {                       
                            "targets": -1,
                            "data": null,
                            "defaultContent": opcionesTipoRolProveedor}                       
                ]
    });
    
    $('#tablaTipoRolProveedor tbody').on( 'click', '#deleteTipoRolProveedor', function () {
        var indice = $(this).parents('tr').index();
        $('#modalEliminarTipoRolProveedor').attr('data-attr-index',indice);
        $('#modalEliminarTipoRolProveedor').modal('show'); 
 
    } );
    
    $('#modalEliminarTipoRolProveedor').on('click', '#confirmarEliminarTipoRolProveedor', function(){
        deleteTipoRolProveedor();       
    });
    
    var opcionesTipoRolCliente = '<a id="deleteTipoRolCliente" class="red tooltip-error" data-rel="tooltip" title="Eliminar"><i class="icon-trash bigger-130"> </i></a>';
    $('#tablaTipoRolCliente').DataTable({
        "ajax"         : function (data, callback, settings) {
            callback ( { data: dataSetRolCliente } );
           },
        "ordering"   : false,
        "paging"     : false,
        "autoWidth"  : true,
        "pageLength" : 10,
        "searching"  : false,
        "bInfo"      : false, 
        "language"   : {
                            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
                       },
        "columns"  : [
                        { "data": "id", "visible":false},
                        { "data": "descripcion"},
                        { "data": "cantidad"},
                        { "data": null}
                ],
        "columnDefs" : [
                        {                       
                            "targets": -1,
                            "data": null,
                            "defaultContent": opcionesTipoRolCliente}                     
                ]
    });
    
    $('#tablaTipoRolCliente tbody').on( 'click', '#deleteTipoRolCliente', function () {
        var indice = $(this).parents('tr').index();
        $('#modalEliminarTipoRolCliente').attr('data-attr-index',indice);
        $('#modalEliminarTipoRolCliente').modal('show'); 
 
    } );
    
    $('#modalEliminarTipoRolCliente').on('click', '#confirmarEliminarTipoRolCliente', function(){
        deleteTipoRolCliente();     
    });
    
    var opcionesRRHHResponsabilidadesProveedor = '<a id="actualizarRRHHResponsabilidadesProveedor" class="blue tooltip-error" data-rel="tooltip" title="Guardar"><i class="icon-save bigger-130"> </i></a>';
    $('#tablaRRHHResponsabilidadesProveedor').DataTable({
        "ajax"         : function (data, callback, settings) {
            callback ( { data: dataSetRRHHResponsabilidadesProveedor } );
           },
        "ordering"   : false,
        "paging"     : false,
        "autoWidth"  : true,
        "pageLength" : 10,
        "searching"  : false,
        "bInfo"      : false, 
        "language"   : {
                            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
                       },
        "columns"  : [
                        { "data": "id", "visible":false},
                        { "data": "descripcion"},
                        { "data": "descripcionDetalleRol"},
                        { "data": "cantidad"},
                        { "data": null}
                ],
        "columnDefs" : [
                        {                       
                            "targets": -1,
                            "data": null,
                            "defaultContent": opcionesRRHHResponsabilidadesProveedor}                     
                ]
    });
    
    $('#tablaRRHHResponsabilidadesProveedor tbody').on( 'click', '#actualizarRRHHResponsabilidadesProveedor', function () {
        var indice = $(this).parents('tr').index();                     
        $('#modalActualizarTipoRolProveedorResponsabilidad').attr('data-attr-index',indice);
        $('#modalActualizarTipoRolProveedorResponsabilidad').modal('show');
        var responsabilidadProveedor =dataSetRRHHResponsabilidadesProveedor[indice];
        $("#idRolProveedor").val(responsabilidadProveedor.descripcion);
        $("#idCantidadProveedor").val(responsabilidadProveedor.cantidad);
        $("#idDescripcionProveedor").val(responsabilidadProveedor.descripcionDetalleRol);
 
    } );
    
    $('#modalActualizarTipoRolProveedorResponsabilidad').on('click', '#confirmarActualizarTipoRolProveedorResponsabilidad', function(){
        
    	if($("#idDescripcionProveedor").val()!=null && $("#idDescripcionProveedor").val()!=""){
    		$('#idDescripcionProveedor').parent().parent().removeClass('error');
    		actualizarDescripcionTipoRolProveedor();    		
    	}else{
    		$('#idDescripcionProveedor').parent().parent().addClass('error');	
    		$.gritter.add({
				title: 'Advertencia!',
				text: 'Debe llenar descripción',
				sticky: false,
				time: '1200',
				class_name: 'gritter-warning'
			});
    	}
    });
    
    var opcionesRRHHResponsabilidadesCliente = '<a id="actualizarRRHHResponsabilidadesCliente" class="blue tooltip-error" data-rel="tooltip" title="Guardar"><i class="icon-save bigger-130"> </i></a>';
    $('#tablaRRHHResponsabilidadesCliente').DataTable({
        "ajax"         : function (data, callback, settings) {
            callback ( { data: dataSetRRHHResponsabilidadesCliente } );
           },
        "ordering"   : false,
        "paging"     : false,
        "autoWidth"  : true,
        "pageLength" : 10,
        "searching"  : false,
        "bInfo"      : false, 
        "language"   : {
                            "url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
                       },
        "columns"  : [
                        { "data": "id", "visible":false},
                        { "data": "descripcion"},
                        { "data": "descripcionDetalleRol"},
                        { "data": "cantidad"},
                        { "data": null}
                ],
        "columnDefs" : [
                        {                       
                            "targets": -1,
                            "data": null,
                            "defaultContent": opcionesRRHHResponsabilidadesCliente}                     
                ]
    }); 
    
    $('#tablaRRHHResponsabilidadesCliente tbody').on( 'click', '#actualizarRRHHResponsabilidadesCliente', function () {
        var indice = $(this).parents('tr').index();        
        $('#modalActualizarTipoRolClienteResponsabilidad').attr('data-attr-index',indice);
        $('#modalActualizarTipoRolClienteResponsabilidad').modal('show');
        var responsabilidadCliente =dataSetRRHHResponsabilidadesCliente[indice];
        $("#idRolCliente").val(responsabilidadCliente.descripcion);
        $("#idCantidadCliente").val(responsabilidadCliente.cantidad);
        $("#idDescripcionCliente").val(responsabilidadCliente.descripcionDetalleRol);
 
    } );
    
    $('#modalActualizarTipoRolClienteResponsabilidad').on('click', '#confirmarActualizarTipoRolClienteResponsabilidad', function(){                 
        if($("#idDescripcionCliente").val()!=null && $("#idDescripcionCliente").val()!=""){
    		$('#idDescripcionCliente').parent().parent().removeClass('error');
    		actualizarDescripcionTipoRolCliente();    		
    	}else{
    		$('#idDescripcionCliente').parent().parent().addClass('error');	
    		$.gritter.add({
				title: 'Advertencia!',
				text: 'Debe llenar descripción',
				sticky: false,
				time: '1200',
				class_name: 'gritter-warning'
			});
    	}
    });
    /* FIN - TAB RECURSOS HUMANOS  */

    /* INI - TAB COSTOS  */
    var opcionesCostoProyecto = '<a id="guardarCostoProyecto" class="blue tooltip-error" data-rel="tooltip" title="Guardar"><i class="icon-save bigger-130"> </i></a>';
	$('#tablaCostosProyecto').DataTable({
		"ajax"		 : function (data, callback, settings) {
			callback ( { data: dataSetCostosProyecto } );
		   },
		"ordering"   : false,
		"paging"     : false,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 
		//"bLengthChange": false,
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       },
        "columns"	 : [
		            	{ "data": "idDetalleCostoProyecto", "visible":false},
		            	{ "data": "descripcionRol"},
		            	{ "data": "descripcionTipo"},
		            	{ "data": "descripcionBandaSalarial"},
		            	{ "data": "costo"},
		            	{ "data": null}
		        ],
        "columnDefs" : [
                        {        				
	         				"targets": -1,
	         				"data": null,
	         				"defaultContent": opcionesCostoProyecto}	         			
        		]
	});
	
	$('#tablaCostosProyecto tbody').on( 'click', '#guardarCostoProyecto', function () {
        var indice = $(this).parents('tr').index();        
        $('#modalCostoProyecto').attr('data-attr-index',indice);
        $('#modalCostoProyecto').modal('show');
        var costoProyectoPorRol =dataSetCostosProyecto[indice];
        $("#idCostoPyRol").html(costoProyectoPorRol.descripcionRol);
        
        $("#idTipoNivel").empty();
		$("#idTipoNivel").append('<option value="">Seleccionar</option>');
		$.postJSON('${pageContext.request.contextPath}/planificacion/cboTipoNivel.htm','', function(data) {
			 $.each(data, function (key, value) {
	             $("#idTipoNivel").append("<option value=" + value.idTipoNivel + ">" + value.descripcion + "</option>");
	         });
		});
 
    } );
    
    $('#modalCostoProyecto').on('click', '#guardarCostoProyecto', function(){
    	guardarCostoProyecto();     
    });
	/* FIN - TAB COSTOS  */

    
    /* INI - TAB PRESUPUESTO  */
	/* $('#tablaPresupuestoCostoRRHH').DataTable({
		"ajax"		 : function (data, callback, settings) {
			callback ( { data: dataSetRequisitoProyecto } );
		   },
		"ordering"   : false,
		"paging"     : false,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 
		//"bLengthChange": false,
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       },
        "columns"	 : [
		            	{ "data": "PRUEBA"},
		            	{ "data": "PRUEBA"}		            	
		        ],
        "columnDefs" : [
                        {        				
	         				"targets": -1,
	         				"data": null,
	         				"defaultContent": opcionesTipoRequisito}	         			
        		]
	});	 */
	/* FIN - TAB PRESUPUESTO  */
	
    /* listarRRHHResponsabilidades(); */
	mostrarGrillas();    
});/* FIN - READY */

/* INI - DESCRIPCION DEL PRODUCTO */
function guardarDescripcion(){
	
	var objectForm = $("#formPlanDescripcion");
	var form=$('#formPlanDescripcion').serializeObject();	
	var agregarPlanificacionModel = {};
	agregarPlanificacionModel.descripcionProducto = form.descripcion;
	agregarPlanificacionModel.idProyecto = $('#codigoPy').val();
		
	if(objectForm.valid()){		
		$.postJSON('${pageContext.request.contextPath}/planificacion/guardarDescripcion.htm',agregarPlanificacionModel, function(data) {
			if(data.respuesta == 'ERROR'){
				$.gritter.add({
					title: 'Error!',
					text: 'Ocurrió un error al guardar los datos',
					sticky: false,
					time: '1200',
					class_name: 'gritter-error'
				});
			}else{
				$.gritter.add({
					title: 'Info!',
					text: 'Se guardó correctamente los datos.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-info gritter-light'
				});
			}
		});				
	}	
}	
/* FIN - DESCRIPCION DEL PRODUCTO */
/*[INI] CRONOGRAMA */
	var tablaSegTareas = $('#tablaSegTareas').DataTable({
		"ajax"		 : function (data, callback, settings) {
			callback ( { data: dataTarea } );
		   },
		"ordering"   : false,
		"paging"     : false,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 
		
		"columnDefs"		:
	    	[
		    	{	"targets": [ 8 ], "visible": false, "searchable": false, "width": "0%"},
		        {	"targets": [ 9 ], "visible": false, "searchable": false, "width": "0%"},
		        {	"targets": [ 10 ], "visible": false, "searchable": false, "width": "0%"},
		        {	"targets": [ 11 ], "visible": false, "searchable": false, "width": "0%"},
		        {	"targets": [ 12 ], "visible": false, "searchable": false, "width": "0%"}
	    	],
	    "columns"		: [
	             		   //{"data": "codigo"},
			     		   {"data": null, render: function ( data, type, row ) {
			     			   return '';
			     		   	}
			     		   },   
	             		   {"data": "descripcion"},  
					       {"data": "fechaInicio"},                      
					       {"data": "fechaFin"},                  
					       {"data": "dscComplejidad"},    
					       {"data": "horas"},  
					       {"data": "dscEstado"},  
					       {"data": "justificacion"},
					       {"data": "idEstado"},
					       {"data": "idComplejidad"},
					       {"data": "precede"},
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

	tablaSegTareas.on( 'order.dt search.dt', function () {
		tablaSegTareas.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	        cell.innerHTML = i+1;
	    } );
	}).draw();
/*[FIN] CRONOGRAMA */

/* *************************** INI - TAB ALCANCE *************************** */ 
/* INI - ALCANCE - REQUISITO PROYECTO */
function agregarPlanificacionRequisito(){	
		
		if($('#idTipoRequisito').val()!= null && $('#idTipoRequisito').val()!= "" && $('#idDescripcionAlcance').val()!= null && $('#idDescripcionAlcance').val()!= ""){
			$('#idTipoRequisito').parent().parent().removeClass('error');
			$('#idDescripcionAlcance').parent().parent().removeClass('error');
			var t = $('#tablaReqProyecto').DataTable();
			var requisitoProyecto = {};		
			requisitoProyecto.idTipoRequisito = $('#idTipoRequisito').val();		
			requisitoProyecto.descTipoRequisito = $('#idTipoRequisito option:selected').text();
			requisitoProyecto.idProyecto = $('#codigoPy').val();
			requisitoProyecto.descripcion = $('#idDescripcionAlcance').val();	
			requisitoProyecto.observacion = $('#idObservacionAlcance').val();	
			dataSetRequisitoProyecto.push(requisitoProyecto);
		
			t.ajax.reload();
		}else{
			if($('#idTipoRequisito').val()== null || $('#idTipoRequisito').val()== ""){
				$('#idTipoRequisito').parent().parent().addClass('error');				
			}else{
				$('#idTipoRequisito').parent().parent().removeClass('error');
			}
			if($('#idDescripcionAlcance').val()== null || $('#idDescripcionAlcance').val()== ""){
				$('#idDescripcionAlcance').parent().parent().addClass('error');				
			}else{
				$('#idDescripcionAlcance').parent().parent().removeClass('error');
			}
			
			$.gritter.add({
				title: 'Advertencia!',
				text: 'Debe llenar tipo/descripción de requisito del proyecto',
				sticky: false,
				time: '1200',
				class_name: 'gritter-warning'
			});
		}	
}

function deleteRequisitoProyecto(){
	var t = $('#tablaReqProyecto').DataTable();
	dataSetRequisitoProyecto.splice($('#modalEliminarRequisitoProyecto').attr('data-attr-index'),1);
	t.ajax.reload();
	$('#modalEliminarRequisitoProyecto').modal('hide'); 

}
/* FIN - ALCANCE - REQUISITO PROYECTO */
 
 /* INI - ALCANCE - EXCLUSION */
function agregarPlanificacionExclusion(){	
	if($('#idDescripcionExlclusion').val()!= null && $('#idDescripcionExlclusion').val()!= ""){
		$('#idDescripcionExlclusion').parent().parent().removeClass('error');
		var t = $('#tablaExclProyecto').DataTable();
		var exclusion = {};
		exclusion.descripcion = $('#idDescripcionExlclusion').val();			
		exclusion.idProyecto = $('#codigoPy').val();
		dataSetExclusion.push(exclusion);
	
		t.ajax.reload();
	}else{
		if($('#idDescripcionExlclusion').val()== null || $('#idDescripcionExlclusion').val()== ""){
			$('#idDescripcionExlclusion').parent().parent().addClass('error');
		}else{
			$('#idDescripcionExlclusion').parent().parent().removeClass('error');
		}
		$.gritter.add({
			title: 'Advertencia!',
			text: 'Debe llenar descripción de exclusiones',
			sticky: false,
			time: '1200',
			class_name: 'gritter-warning'
		});
	}
}

function deleteExclusion(){
	var t = $('#tablaExclProyecto').DataTable();
	dataSetExclusion.splice($('#modalEliminarExclusiones').attr('data-attr-index'),1);
	t.ajax.reload();
	$('#modalEliminarExclusiones').modal('hide'); 

}
/* FIN - ALCANCE - EXCLUSION */

/* INI - ALCANCE - SUPUESTO */
function agregarPlanificacionSupuesto(){	
	if($('#idTipoSupuesto').val()!= null && $('#idTipoSupuesto').val()!= "" && $('#idDescripcionSupuesto').val()!= null && $('#idDescripcionSupuesto').val()!= ""){
		$('#idTipoSupuesto').parent().parent().removeClass('error');
		$('#idDescripcionSupuesto').parent().parent().removeClass('error');
		var t = $('#tablaSupuestoProyecto').DataTable();
		var supuesto = {};
		supuesto.idTipoSupuesto = $('#idTipoSupuesto').val();	
		supuesto.descTipoSupuesto = $('#idTipoSupuesto option:selected').text();
		supuesto.idProyecto = $('#codigoPy').val();
		supuesto.descripcion = $('#idDescripcionSupuesto').val();	
		dataSetSupuesto.push(supuesto);
	
		t.ajax.reload();
	}else{
		if($('#idTipoSupuesto').val()== null || $('#idTipoSupuesto').val()== ""){
			$('#idTipoSupuesto').parent().parent().addClass('error');
		}else{
			$('#idTipoSupuesto').parent().parent().removeClass('error');
		}
		if($('#idDescripcionSupuesto').val()== null || $('#idDescripcionSupuesto').val()== ""){
			$('#idDescripcionSupuesto').parent().parent().addClass('error');
		}else{
			$('#idDescripcionSupuesto').parent().parent().removeClass('error');
		}
		
		$.gritter.add({
			title: 'Advertencia!',
			text: 'Debe llenar tipo/descripción de supuestos y consideraciones',
			sticky: false,
			time: '1200',
			class_name: 'gritter-warning'
		});
	}
}

function deleteSupuesto(){
	var t = $('#tablaSupuestoProyecto').DataTable();
	dataSetSupuesto.splice($('#modalEliminarSupuesto').attr('data-attr-index'),1);
	t.ajax.reload();
	$('#modalEliminarSupuesto').modal('hide'); 

}
/* FIN - ALCANCE - SUPUESTO */

/* INI - ALCANCE - DEPENDENCIA */
function agregarPlanificacionDependencia(){	
	if($('#idTipoDependencia').val()!= null && $('#idTipoDependencia').val()!= "" && $('#idDescripcionDependencia').val()!= null && $('#idDescripcionDependencia').val()!= ""){
		$('#idTipoDependencia').parent().parent().removeClass('error');
		$('#idDescripcionDependencia').parent().parent().removeClass('error');
		var t = $('#tablaDependenciaProyecto').DataTable();
		var dependencia = {};
		dependencia.idTipoDependencia = $('#idTipoDependencia').val();	
		dependencia.descTipoDepedencia = $('#idTipoDependencia option:selected').text();
		dependencia.idProyecto = $('#codigoPy').val();
		dependencia.descripcion = $('#idDescripcionDependencia').val();	
		dataSetDependencia.push(dependencia);
	
		t.ajax.reload();
	}else{
		if($('#idTipoDependencia').val()== null || $('#idTipoDependencia').val()== ""){
			$('#idTipoDependencia').parent().parent().addClass('error');
		}else{
			$('#idTipoDependencia').parent().parent().removeClass('error');
		}
		if($('#idDescripcionDependencia').val()== null || $('#idDescripcionDependencia').val()== ""){
			$('#idDescripcionDependencia').parent().parent().addClass('error');
		}else{
			$('#idDescripcionDependencia').parent().parent().removeClass('error');
		}
		
		$.gritter.add({
			title: 'Advertencia!',
			text: 'Debe llenar tipo/descripción de dependencias',
			sticky: false,
			time: '1200',
			class_name: 'gritter-warning'
		});
	}
}

function deleteDependencia(){
	var t = $('#tablaDependenciaProyecto').DataTable();
	dataSetDependencia.splice($('#modalEliminarDependencia').attr('data-attr-index'),1);
	t.ajax.reload();
	$('#modalEliminarDependencia').modal('hide'); 

}
/* FIN - ALCANCE - DEPENDENCIA */

/* INI - ALCANCE - FACTOR EXITO */
function agregarPlanificacionFactorExito(){	
	if($('#idDescripcionFactorExito').val()!= null && $('#idDescripcionFactorExito').val()!= ""){
		$('#idDescripcionFactorExito').parent().parent().removeClass('error');
		var t = $('#tablafactExitoProyecto').DataTable();
		var factorExito = {};
		factorExito.descripcion = $('#idDescripcionFactorExito').val();	
		factorExito.idProyecto = $('#codigoPy').val();
		dataSetFactorExito.push(factorExito);
	
		t.ajax.reload();
	}else{		
		if($('#idDescripcionFactorExito').val()== null || $('#idDescripcionFactorExito').val()== ""){
			$('#idDescripcionFactorExito').parent().parent().addClass('error');
		}else{
			$('#idDescripcionFactorExito').parent().parent().removeClass('error');
		}
		
		$.gritter.add({
			title: 'Advertencia!',
			text: 'Debe llenar descripción de factores críticos de éxitos',
			sticky: false,
			time: '1200',
			class_name: 'gritter-warning'
		});
	}
}

function deleteFactorExito(){
	var t = $('#tablafactExitoProyecto').DataTable();
	dataSetFactorExito.splice($('#modalEliminarFactorExito').attr('data-attr-index'),1);
	t.ajax.reload();
	$('#modalEliminarFactorExito').modal('hide'); 

}
/* FIN - ALCANCE - FACTOR EXITO */

function guardarAlcance(){
	
	$('#idTipoRequisito').parent().parent().removeClass('error');
	$('#idDescripcionAlcance').parent().parent().removeClass('error');
	$('#idObservacionAlcance').parent().parent().removeClass('error');	
	
	var form = $( "#formPlanAlcance" );
/* 	form.validate(); */
	if(form.valid()){
		
		if(dataSetRequisitoProyecto.length>0
				&& dataSetExclusion.length>0
				&& dataSetSupuesto.length>0
				&& dataSetDependencia.length>0
				&& dataSetFactorExito.length>0){
			
			var form=$('#formPlanAlcance').serializeObject();		
			form.listaTipoRequisito = dataSetRequisitoProyecto;
			form.listaExclusion = dataSetExclusion;
			form.listaSupuesto = dataSetSupuesto;
			form.listaDependencia = dataSetDependencia;
			form.listaFactorExito = dataSetFactorExito;
			form.idProyecto = $("#codigoPy").val(); 
			
			$.postJSON('${pageContext.request.contextPath}/planificacion/guardarAlcance.htm',form, function(data) {
				/* console.log("qwqw");
				alert(data); */
				if(data.respuesta == 'ERROR'){
					$.gritter.add({
						title: 'Error!',
						text: 'Ocurrio un error al guardar los datos.',
						sticky: false,
						time: '1200',
						class_name: 'gritter-error'
					});
				}else{
					$.gritter.add({
						title: 'Info!',
						text: 'Se guardó correctamente los datos.',
						sticky: false,
						time: '1200',
						class_name: 'gritter-info gritter-light'
					});
				}
				
			});			
		}else {
			$.gritter.add({
				title: 'Error!',
				text: 'Falta ingresar datos',
				sticky: false,
				time: '1200',
				class_name: 'gritter-error'
			});
		}
	}
}
/* *************************** FIN - TAB ALCANCE *************************** */

function guardarFormaPago(){
	var t = $('#tablaFormasPago').DataTable();
	var form=$('#formFormasPago').serializeObject();	
	var agregarFormaPago = {};
	agregarFormaPago.idEntregable = form.idEntregableFP;
	agregarFormaPago.descripcionEntregable = $('#idEntregableFP option:selected').text();
	agregarFormaPago.idFormaPago = form.idFormaPago;
	agregarFormaPago.descripcionFormaPago = $('#idFormaPago option:selected').text();
 	agregarFormaPago.fechaFacturacion = form.fechaFacturaFP;
	agregarFormaPago.fechaCobranza = form.fechaCobranzaFP; 
	agregarFormaPago.porcentajePago = form.valPorcPago;
	agregarFormaPago.idProyecto = $("#codigoPy").val(); 
	
	var objectForm = $("#formFormasPago");
	if(objectForm.valid()){
		$.postJSON('${pageContext.request.contextPath}/planificacion/guardarFormaPago.htm',agregarFormaPago, function(data) {
			if(data.respuesta == 'ERROR'){
				$.gritter.add({
					title: 'Error!',
					text: 'Ocurrió un error al guardar los datos',
					sticky: false,
					time: '1200',
					class_name: 'gritter-error'
				});
			}else{
				$.gritter.add({
					title: 'Info!',
					text: 'Se guardó correctamente los datos.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-info gritter-light'
				});
				
				agregarFormaPago.idFormaPagoDetal = data.idFormaPagoDetal;
				dataSetFormaPago.push(agregarFormaPago);
				t.ajax.reload();
				
			}
		});
	}	
}

function deleteFormasPago(){
	var t = $('#tablaFormasPago').DataTable();
	var id =$('#modalEliminarFormasPago').attr('data-attr-index');
	var idDetalle = t.row(id).data().idFormaPagoDetal;	
	$('#modalEliminarFormasPago').modal('hide');
	var eliminarFormaPago = {};
	eliminarFormaPago.idFormaPagoDetal = idDetalle;
	
	$.postJSON('${pageContext.request.contextPath}/planificacion/eliminarFormaPago.htm',eliminarFormaPago, function(data) {
		if(data.respuesta == 'ERROR'){
			$.gritter.add({
				title: 'Error!',
				text: 'Ocurrió un error al guardar los datos',
				sticky: false,
				time: '1200',
				class_name: 'gritter-error'
			});
		}else{
			$.gritter.add({
				title: 'Info!',
				text: 'Se elimino correctamente los datos.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light'
			});	
			
			dataSetFormaPago.splice(id,1);
			t.ajax.reload();
		}
	});
}

function guardarDetalleRiesgos(){
	var t = $('#tablaRiesgosProyecto').DataTable();
	var form=$('#formDetalleRiesgos').serializeObject();	
	var agregarDetalleRiesgo = {};
	agregarDetalleRiesgo.valRiesgo = form.valRiesgo;	
	agregarDetalleRiesgo.valResponsable = form.valResponsable;	
	agregarDetalleRiesgo.valImpacto = form.valImpacto;
	agregarDetalleRiesgo.valProbabilidad = form.valProbabilidad; 
	agregarDetalleRiesgo.valContigencia = form.valContigencia;
	agregarDetalleRiesgo.valMitigacion = form.valMitigacion;
	agregarDetalleRiesgo.idProyecto = $("#codigoPy").val(); 
	
	var objectForm = $('#formDetalleRiesgos');
	if(objectForm.valid()){
		$.postJSON('${pageContext.request.contextPath}/planificacion/guardarDetalleRiesgos.htm',agregarDetalleRiesgo, function(data) {
			if(data.respuesta == 'ERROR'){
				$.gritter.add({
					title: 'Error!',
					text: 'Ocurrió un error al guardar los datos',
					sticky: false,
					time: '1200',
					class_name: 'gritter-error'
				});
			}else{
				$.gritter.add({
					title: 'Info!',
					text: 'Se guardó correctamente los datos.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-info gritter-light'
				});
				
				agregarDetalleRiesgo.idDetalleRiesgos = data.idDetalleRiesgos;
				dataSetDetalleRiesgo.push(agregarDetalleRiesgo);
				t.ajax.reload();
				
			}
		});
	}
}

function deleteDetalleRiesgos(){
	var t = $('#tablaRiesgosProyecto').DataTable();
	var id =$('#modalEliminarDetalleRiesgo').attr('data-attr-index');
	var idDetalle = t.row(id).data().idDetalleRiesgos;	
	$('#modalEliminarDetalleRiesgo').modal('hide');
	var eliminarDetalleRiesgo = {};
	eliminarDetalleRiesgo.idDetalleRiesgos = idDetalle;
	
	$.postJSON('${pageContext.request.contextPath}/planificacion/eliminarDetalleRiesgos.htm',eliminarDetalleRiesgo, function(data) {
		if(data.respuesta == 'ERROR'){
			$.gritter.add({
				title: 'Error!',
				text: 'Ocurrió un error al guardar los datos',
				sticky: false,
				time: '1200',
				class_name: 'gritter-error'
			});
		}else{
			$.gritter.add({
				title: 'Info!',
				text: 'Se elimino correctamente los datos.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light'
			});	
			
			dataSetDetalleRiesgo.splice(id,1);
			t.ajax.reload();
		}
	});
}

function guardarDetalleAdquisicion(){
	var t = $('#tablaAdquisicionesProyecto').DataTable();
	var form=$('#formDetalleAdquisicion').serializeObject();	
	var agregarDetalleAdquisicion = {};
	agregarDetalleAdquisicion.producto = form.valProductoAD;
	agregarDetalleAdquisicion.idcatadquisicion = form.idCategoriaAD;
	agregarDetalleAdquisicion.categoriaDescripcion = $('#idCategoriaAD option:selected').text();
	agregarDetalleAdquisicion.cantidad = form.valCantidadAD;
	agregarDetalleAdquisicion.costoUnitario = form.valCostoUnitAD; 
	agregarDetalleAdquisicion.fechaAdquisicion = form.fechaAdquirirAD;
	agregarDetalleAdquisicion.idproyecto = $("#codigoPy").val(); 
	
	var objectForm = $("#formDetalleAdquisicion");
	if(objectForm.valid()){
		$.postJSON('${pageContext.request.contextPath}/planificacion/guardarDetalleAdquisicion.htm',agregarDetalleAdquisicion, function(data) {
			if(data.respuesta == 'ERROR'){
				$.gritter.add({
					title: 'Error!',
					text: 'Ocurrió un error al guardar los datos',
					sticky: false,
					time: '1200',
					class_name: 'gritter-error'
				});
			}else{
				$.gritter.add({
					title: 'Info!',
					text: 'Se guardó correctamente los datos.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-info gritter-light'
				});
				
				agregarDetalleAdquisicion.id = data.id;
				dataSetDetalleAdquisicion.push(agregarDetalleAdquisicion);
				t.ajax.reload();			
			}
		});
	}		
}

function deleteDetalleAdquisicion(){
	var t = $('#tablaAdquisicionesProyecto').DataTable();
	var id =$('#modalEliminarDetalleAdquisicion').attr('data-attr-index');
	var idDetalle = t.row(id).data().id;	
	$('#modalEliminarDetalleAdquisicion').modal('hide');
	var eliminarDetalleAdquisicion = {};
	eliminarDetalleAdquisicion.id = idDetalle;
	
	$.postJSON('${pageContext.request.contextPath}/planificacion/eliminarDetalleAdquisicion.htm',eliminarDetalleAdquisicion, function(data) {
		if(data.respuesta == 'ERROR'){
			$.gritter.add({
				title: 'Error!',
				text: 'Ocurrió un error al guardar los datos',
				sticky: false,
				time: '1200',
				class_name: 'gritter-error'
			});
		}else{
			$.gritter.add({
				title: 'Info!',
				text: 'Se elimino correctamente los datos.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light'
			});	
			
			dataSetDetalleAdquisicion.splice(id,1);
			t.ajax.reload();
		}
	});
}

function guardarDetalleCostosOperativos(){
	var t = $('#tablaCostosOperativo').DataTable();
	var form=$('#formCostoOperativo').serializeObject();	
	var agregarDetalleCostoOP = {};
	agregarDetalleCostoOP.descripcionCosto = form.valDescripcionOP;
	agregarDetalleCostoOP.idTipoCosto = form.idTipoCostoOP;
	agregarDetalleCostoOP.valTipoCosto = $('#idTipoCostoOP option:selected').text();
	agregarDetalleCostoOP.fecha = form.fechaCostoOP;
	agregarDetalleCostoOP.monto = form.valMontoOP; 	
	agregarDetalleCostoOP.idProyecto = $("#codigoPy").val(); 
	
	var objectForm = $("#formCostoOperativo");
	if(objectForm.valid()){
		$.postJSON('${pageContext.request.contextPath}/planificacion/guardarDetalleCostoOperativo.htm',agregarDetalleCostoOP, function(data) {
			if(data.respuesta == 'ERROR'){
				$.gritter.add({
					title: 'Error!',
					text: 'Ocurrió un error al guardar los datos',
					sticky: false,
					time: '1200',
					class_name: 'gritter-error'
				});
			}else{
				$.gritter.add({
					title: 'Info!',
					text: 'Se guardó correctamente los datos.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-info gritter-light'
				});
				
				agregarDetalleCostoOP.idCostoOperativo = data.idCostoOperativo;
				dataSetDetalleCostoOperativo.push(agregarDetalleCostoOP);
				t.ajax.reload();			
			}
		});
	}	
}

function deleteDetalleCostosOperativos(){
	var t = $('#tablaCostosOperativo').DataTable();
	var id =$('#modalEliminarDetalleCostoOperativo').attr('data-attr-index');
	var idDetalle = t.row(id).data().id;	
	$('#modalEliminarDetalleCostoOperativo').modal('hide');
	var eliminarDetalleCostoOP = {};
	eliminarDetalleCostoOP.idCostoOperativo = idDetalle;
	
	$.postJSON('${pageContext.request.contextPath}/planificacion/eliminarDetalleCostoOperativo.htm',eliminarDetalleCostoOP, function(data) {
		if(data.respuesta == 'ERROR'){
			$.gritter.add({
				title: 'Error!',
				text: 'Ocurrió un error al guardar los datos',
				sticky: false,
				time: '1200',
				class_name: 'gritter-error'
			});
		}else{
			$.gritter.add({
				title: 'Info!',
				text: 'Se elimino correctamente los datos.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light'
			});	
			
			dataSetDetalleCostoOperativo.splice(id,1);
			t.ajax.reload();
		}
	});
}

function showEntregableAgregar(){
	limpiarMntEntregable();
	$('#modal-Entregable').modal('show');
}

/* *************************** INI - TAB RECURSOS HUMANOS *************************** */
function guardarRolProveedor(){
    var t = $('#tablaTipoRolProveedor').DataTable();
    var form=$('#formTipoRolProveedor').serializeObject();  
    var detalleRolProyecto = {};
    detalleRolProyecto.idtiporol = form.idTipoRolProveedor;
    detalleRolProyecto.descripcion = $('#idTipoRolProveedor option:selected').text();
    detalleRolProyecto.cantidad = form.idCantidadTipoRolProveedor;
    detalleRolProyecto.idProyecto = $("#codigoPy").val(); 
     
    var objectForm = $('#formTipoRolProveedor');
    
    if(objectForm.valid()){
    	
    	for(var i=0; i<dataSetRolProveedor.length; i++){
    		if(detalleRolProyecto.descripcion == dataSetRolProveedor[i].descripcion){
    			$.gritter.add({
                    title: 'Error!',
                    text: 'Rol proveedor ya existe.',
                    sticky: false,
                    time: '1200',
                    class_name: 'gritter-error'
                });
    			return false;
    		}
    	}
    	    	
    	$.postJSON('${pageContext.request.contextPath}/planificacion/guardarRolProveedor.htm',detalleRolProyecto, function(data) {
            if(data.respuesta == 'ERROR'){
                $.gritter.add({
                    title: 'Error!',
                    text: 'Ocurrió un error al guardar los datos',
                    sticky: false,
                    time: '1200',
                    class_name: 'gritter-error'
                });
            }else{
                $.gritter.add({
                    title: 'Info!',
                    text: 'Se guardó correctamente los datos.',
                    sticky: false,
                    time: '1200',
                    class_name: 'gritter-info gritter-light'
                });
                
                detalleRolProyecto.id = data.idTipoRolProveedor;
                dataSetRolProveedor.push(detalleRolProyecto);
                t.ajax.reload();
                
                /* cargarCostosProyecto(); */
                
                actualizarRolProveedorResponsabilidad();
                
            }
        });
    }    
}
 
function deleteTipoRolProveedor(){
    var t = $('#tablaTipoRolProveedor').DataTable();
    var id =$('#modalEliminarTipoRolProveedor').attr('data-attr-index');
    var idDetalle = t.row(id).data().id;    
    $('#modalEliminarTipoRolProveedor').modal('hide');
    var eliminarTipoRolProveedor = {};
    eliminarTipoRolProveedor.id = idDetalle;
    
    $.postJSON('${pageContext.request.contextPath}/planificacion/deleteTipoRolProveedor.htm',eliminarTipoRolProveedor, function(data) {
        if(data.respuesta == 'ERROR'){
            $.gritter.add({
                title: 'Error!',
                text: 'Ocurrió un error al guardar los datos',
                sticky: false,
                time: '1200',
                class_name: 'gritter-error'
            });
        }else{
            $.gritter.add({
                title: 'Info!',
                text: 'Se elimino correctamente los datos.',
                sticky: false,
                time: '1200',
                class_name: 'gritter-info gritter-light'
            }); 
            
            dataSetRolProveedor.splice(id,1);
            t.ajax.reload();
            
            actualizarRolProveedorResponsabilidad();
            /* cargarCostosProyecto(); */
        }
    });
}
 
function guardarRolCliente(){
    var t = $('#tablaTipoRolCliente').DataTable();
    var form=$('#formTipoRolCliente').serializeObject();    
    var detalleRolProyecto = {};
    detalleRolProyecto.idtiporol = form.idTipoRolCliente;
    detalleRolProyecto.descripcion = $('#idTipoRolCliente option:selected').text();
    detalleRolProyecto.cantidad = form.idCantidadTipoRolCliente;
    detalleRolProyecto.idProyecto = $("#codigoPy").val(); 
    
    var objectForm = $('#formTipoRolCliente');
    if(objectForm.valid()){
    	
    	for(var i=0; i<dataSetRolCliente.length; i++){
    		if(detalleRolProyecto.descripcion == dataSetRolCliente[i].descripcion){
    			$.gritter.add({
                    title: 'Error!',
                    text: 'Rol cliente ya existe.',
                    sticky: false,
                    time: '1200',
                    class_name: 'gritter-error'
                });
    			return false;
    		}
    	}
    	  
    	
    	$.postJSON('${pageContext.request.contextPath}/planificacion/guardarRolProveedor.htm',detalleRolProyecto, function(data) {
            if(data.respuesta == 'ERROR'){
                $.gritter.add({
                    title: 'Error!',
                    text: 'Ocurrió un error al guardar los datos',
                    sticky: false,
                    time: '1200',
                    class_name: 'gritter-error'
                });
            }else{
                $.gritter.add({
                    title: 'Info!',
                    text: 'Se guardó correctamente los datos.',
                    sticky: false,
                    time: '1200',
                    class_name: 'gritter-info gritter-light'
                });
                
                detalleRolProyecto.id = data.idTipoRolProveedor;
                dataSetRolCliente.push(detalleRolProyecto);
                t.ajax.reload();
                
                actualizarRolClienteResponsabilidad();
            }
        });
    }    
}
 
function deleteTipoRolCliente(){
    var t = $('#tablaTipoRolCliente').DataTable();
    var id =$('#modalEliminarTipoRolCliente').attr('data-attr-index');
    var idDetalle = t.row(id).data().id;    
    $('#modalEliminarTipoRolCliente').modal('hide');
    var eliminarTipoRolProveedor = {};
    eliminarTipoRolProveedor.id = idDetalle;
    
    $.postJSON('${pageContext.request.contextPath}/planificacion/deleteTipoRolProveedor.htm',eliminarTipoRolProveedor, function(data) {
        if(data.respuesta == 'ERROR'){
            $.gritter.add({
                title: 'Error!',
                text: 'Ocurrió un error al guardar los datos',
                sticky: false,
                time: '1200',
                class_name: 'gritter-error'
            });
        }else{
            $.gritter.add({
                title: 'Info!',
                text: 'Se elimino correctamente los datos.',
                sticky: false,
                time: '1200',
                class_name: 'gritter-info gritter-light'
            }); 
            
            dataSetRolCliente.splice(id,1);
            t.ajax.reload();
            
            actualizarRolClienteResponsabilidad();
        }
    });
}

function actualizarDescripcionTipoRolProveedor(){
    var t = $('#tablaRRHHResponsabilidadesProveedor').DataTable();
    var id =$('#modalActualizarTipoRolProveedorResponsabilidad').attr('data-attr-index');
    var idDetalle = t.row(id).data().id;    
    $('#modalActualizarTipoRolProveedorResponsabilidad').modal('hide');
    var detalleRolProyecto = {};    
    detalleRolProyecto.id = idDetalle;
    detalleRolProyecto.descripcion = $("#idRolProveedor").val();
    detalleRolProyecto.cantidad = $("#idCantidadProveedor").val();
    detalleRolProyecto.descripcionDetalleRol = $("#idDescripcionProveedor").val();
    
    $.postJSON('${pageContext.request.contextPath}/planificacion/actualizarDescripcionTipoRol.htm',detalleRolProyecto, function(data) {
        if(data.respuesta == 'ERROR'){
            $.gritter.add({
                title: 'Error!',
                text: 'Ocurrió un error al guardar los datos',
                sticky: false,
                time: '1200',
                class_name: 'gritter-error'
            });
        }else{
            $.gritter.add({
                title: 'Info!',
                text: 'Se guardó correctamente la descripción.',
                sticky: false,
                time: '1200',
                class_name: 'gritter-info gritter-light'
            }); 
            
            dataSetRRHHResponsabilidadesProveedor[id]=detalleRolProyecto;
            t.ajax.reload();         
        	
        }
    });
}

function actualizarDescripcionTipoRolCliente(){
    var t = $('#tablaRRHHResponsabilidadesCliente').DataTable();
    var id =$('#modalActualizarTipoRolClienteResponsabilidad').attr('data-attr-index');
    var idDetalle = t.row(id).data().id;    
    $('#modalActualizarTipoRolClienteResponsabilidad').modal('hide');
    var detalleRolProyecto = {};
    detalleRolProyecto.id = idDetalle;
    detalleRolProyecto.descripcion = $("#idRolCliente").val();
    detalleRolProyecto.cantidad = $("#idCantidadCliente").val();
    detalleRolProyecto.descripcionDetalleRol = $("#idDescripcionCliente").val();
    
    $.postJSON('${pageContext.request.contextPath}/planificacion/actualizarDescripcionTipoRol.htm',detalleRolProyecto, function(data) {
        if(data.respuesta == 'ERROR'){
            $.gritter.add({
                title: 'Error!',
                text: 'Ocurrió un error al guardar los datos',
                sticky: false,
                time: '1200',
                class_name: 'gritter-error'
            });
        }else{
            $.gritter.add({
                title: 'Info!',
                text: 'Se guardó correctamente la descripción.',
                sticky: false,
                time: '1200',
                class_name: 'gritter-info gritter-light'
            }); 
            
            dataSetRRHHResponsabilidadesCliente[id]=detalleRolProyecto;
            t.ajax.reload();         
        	
        }
    });
}

function actualizarRolProveedorResponsabilidad(){
    var t = $('#tablaRRHHResponsabilidadesProveedor').DataTable();    
    var detalleRolProyecto = {};
    detalleRolProyecto.idProyecto =  $('#codigoPy').val();
    
    $.postJSON('${pageContext.request.contextPath}/planificacion/actualizarRolProveedorResponsabilidad.htm',detalleRolProyecto, function(data) {
        if(data == 'ERROR'){
            $.gritter.add({
                title: 'Error!',
                text: 'Ocurrió un error al cargar los datos responsabilidad proveedor',
                sticky: false,
                time: '1200',
                class_name: 'gritter-error'
            });
        }else{
            $.gritter.add({
                title: 'Info!',
                text: 'Se cargó correctamente los datos responsabilidad proveedor.',
                sticky: false,
                time: '1200',
                class_name: 'gritter-info gritter-light'
            }); 
            
            dataSetRRHHResponsabilidadesProveedor=data;
            t.ajax.reload();         
        	
        }
    });
}

function actualizarRolClienteResponsabilidad(){
    var t = $('#tablaRRHHResponsabilidadesCliente').DataTable();    
    var detalleRolProyecto = {};
    detalleRolProyecto.idProyecto =  $('#codigoPy').val();
    
    $.postJSON('${pageContext.request.contextPath}/planificacion/actualizarRolClienteResponsabilidad.htm',detalleRolProyecto, function(data) {
        if(data == 'ERROR'){
            $.gritter.add({
                title: 'Error!',
                text: 'Ocurrió un error al cargar los datos responsabilidad cliente',
                sticky: false,
                time: '1200',
                class_name: 'gritter-error'
            });
        }else{
            $.gritter.add({
                title: 'Info!',
                text: 'Se cargó correctamente los datos responsabilidad cliente.',
                sticky: false,
                time: '1200',
                class_name: 'gritter-info gritter-light'
            }); 
            
            dataSetRRHHResponsabilidadesCliente=data;
            t.ajax.reload();         
        	
        }
    });
}

/* *************************** FIN - TAB RECURSOS HUMANOS *************************** */
 
/* **************************** INI - BOTON EJECUTAR PROYECTO ****************************** */
function validacionEjecutarProyecto(){
	
	var idProyecto = $('#codigoPy').val();
	
/* 	$.postJSON('${pageContext.request.contextPath}/planificacion/validacionEjecutarProyecto.htm',idProyecto, function(data) {	
		if(data == 'ERROR'){
			$.gritter.add({
				title: 'Error!',
				text: 'Ocurrio un error al ejecutar el proyecto',
				sticky: false,
				time: '1200',
				class_name: 'gritter-error'
			});
		}else if(data != ""){
			$.gritter.add({
				title: 'Error!',
				text: data,
				sticky: false,
				time: '1200',
				class_name: 'gritter-error'
			});
			
		}else{			
			mostrarConfirmacionEjecucion();								
		}
		
	}); */
	mostrarConfirmacionEjecucion();		
} 

function mostrarConfirmacionEjecucion(){		
	$('#modalEjecutarFechaAprobacion').modal('show');	
}

function ejecutarEjecucion(){
	
	var ejecucionModel = {};
	ejecucionModel.idProyecto = $('#codigoPy').val();
	ejecucionModel.fechaAprobacion = $('#fechaAprobacion').val();
	
	var objectForm = $("#formEjecucion");
	if(objectForm.valid()){
		$.postJSON('${pageContext.request.contextPath}/planificacion/ejecutarEjecucion.htm',ejecucionModel, function(data) {	
			$('#modalEjecutarFechaAprobacion').modal('hide');	
			if(data == 'ERROR'){
				/* $("body").fadeOut(); */
				$.gritter.add({
					title: 'Error!',
					text: 'Ocurrio un error al ejecutar el proyecto',
					sticky: false,
					time: '1200',
					class_name: 'gritter-error'
				});
			}else {
				$.gritter.add({
					title: 'Info!',
					text: 'Se ejecutó correctamente el proyecto.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-info gritter-light'
				});
				setTimeout(function(){
					window.location = '${pageContext.request.contextPath}/planificacion/planificacion.htm';						
				},1500);
				
			}
		});
	}
}

/* **************************** FIN - BOTON EJECUTAR PROYECTO ****************************** */

/* INI - COSTOS DEL PROYECTO */
function cargarBandaSalarial(obj)
{
	var bandaSalarialModel = {};	
	var tipoNivel = obj.value;

	bandaSalarialModel.idTipoNivel = tipoNivel;
	
	if(tipoNivel!= null && tipoNivel != ''){
		$("#idBandaSalarial").empty();
		$("#idBandaSalarial").append('<option value="">Seleccionar</option>');
		$.postJSON('${pageContext.request.contextPath}/planificacion/cboBandaSalarial.htm',bandaSalarialModel, function(data) {
			 $.each(data, function (key, value) {
	             $("#idBandaSalarial").append("<option value=" + value.idBandaSalarial + ">" + value.descripcion + "</option>");
	         });
		});
	}
}

function guardarCostoProyecto(){
    var t = $('#tablaCostosProyecto').DataTable();
    var id =$('#modalCostoProyecto').attr('data-attr-index');
    var idDetalle = t.row(id).data().idDetalleCostoProyecto;;
    var descripcionRol = t.row(id).data().descripcionRol;    
    $('#modalCostoProyecto').modal('hide');
    var detalleCostoProyecto = {};
    detalleCostoProyecto.idDetalleCostoProyecto = idDetalle;
    detalleCostoProyecto.idBandaSalarial = $("#idBandaSalarial").val();
    detalleCostoProyecto.idTipoNivel = $("#idTipoNivel").val();
    detalleCostoProyecto.idProyecto = $('#codigoPy').val();
    detalleCostoProyecto.descripcionBandaSalarial = $('#idBandaSalarial option:selected').text();
    detalleCostoProyecto.descripcionTipo = $('#idTipoNivel option:selected').text();
    detalleCostoProyecto.descripcionRol = descripcionRol;
    
    $.postJSON('${pageContext.request.contextPath}/planificacion/guardarCostoProyecto.htm',detalleCostoProyecto, function(data) {
        if(data.respuesta == 'ERROR'){
            $.gritter.add({
                title: 'Error!',
                text: 'Ocurrió un error al guardar costo',
                sticky: false,
                time: '1200',
                class_name: 'gritter-error'
            });
        }else{
            $.gritter.add({
                title: 'Info!',
                text: 'Se guardó correctamente el costo.',
                sticky: false,
                time: '1200',
                class_name: 'gritter-info gritter-light'
            }); 
            detalleCostoProyecto.costo = data.costoPorRol;
            $("#totalCostos").html(data.costoPy);
            dataSetCostosProyecto[id]=detalleCostoProyecto;
            t.ajax.reload();         
        	
        }
    });
}

function cargarCostosProyecto(){
    var t = $('#tablaCostosProyecto').DataTable();    
    var detalleRolProyecto = {};
    detalleRolProyecto.idProyecto =  $('#codigoPy').val();
    
    $.postJSON('${pageContext.request.contextPath}/planificacion/cargarCostosProyecto.htm',detalleRolProyecto, function(data) {
        if(data.error == 'ERROR'){
            $.gritter.add({
                title: 'Error!',
                text: 'Ocurrió un error al cargar los costos del proyecto.',
                sticky: false,
                time: '1200',
                class_name: 'gritter-error'
            });
        }else{
            $.gritter.add({
                title: 'Info!',
                text: 'Se cargó correctamente los costos del proyecto.',
                sticky: false,
                time: '1200',
                class_name: 'gritter-info gritter-light'
            }); 
            
            dataSetCostosProyecto=eval(data.listaDetalleCostoProyectoBD);
            t.ajax.reload();         
            $("#totalCostos").html(data.totalCostos);
        }
    });
}

/* FIN - COSTOS DEL PROYECTO */
/* **************************** INI - TAB ENTREGABLE  ************************************** */
$('#registrarEntregables').validate({
	errorClass: 'help-block',
	rules: {
		valorET: {
			required: true
		},
		valDescripcionET: {
			required: true,
			maxlength : 100
		},

		fechaProgramadaET: {
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
		registrarEntregables();
	}
});

function registrarEntregables(){
	var data = $("#tablaProductoEntregable").DataTable().rows().data();
	var objeto = $("#registrarEntregables").serializeObject();
		objeto.idProyecto = $("#codigoPy").val();

	if (data.length > 0){
		$('#modal-Entregable').modal('hide');
		loadModalCargando();
		objeto["producto"] =  obtenerProductoJson();
		$.postJSON('${pageContext.request.contextPath}/planificacion/mnt_Entregable.htm', objeto,
			function(data) {
				listarEntregables();
				closeModalCargando();			
				
				$.gritter.add({
					title: 'Info!',
					text: 'Se realizo la operaci&oacute;n con &eacute;xito.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-info gritter-light'
				});
			}
		);
	}else{
		$.gritter.add({
			title: 'Advertencia!',
			text: 'Debe agregar al menos un detalle de producto.',
			sticky: false,
			time: '1200',
			class_name: 'gritter-warning gritter-light'
		});
	}
}

function obtenerProductoJson() {
	var jsonObjTareas = [];		
	var data = $("#tablaProductoEntregable").DataTable().rows().data();

	if (data.length > 0){
		$.each( data, function( i, l ){
			jsonObjTareas.push(l);	
		});
	}
	
	return jsonObjTareas;
}

function listarEntregables(){	
	var t = $("#tablaEntregableProyecto").DataTable();
	t.clear().draw();
	var dato = $("#codigoPy").val();
	$.postJSON('${pageContext.request.contextPath}/planificacion/listar_Entregables.htm', dato,
		function(data) {
		dataEntregable = eval(data);
		$("#tablaEntregableProyecto").DataTable().ajax.reload();	
		$('[data-rel=tooltip]').tooltip();	
	});

}

function agregarProductoEntregable(){
	var form = $("#registrarEntregables");
	 if(form.valid() && $("#valProductoET").val().length > 0)
    {
    	var t = $("#tablaProductoEntregable").DataTable();
		var objeto = $("#registrarEntregables").serializeObject();

		t.row.add({
					   "id" : objeto.idDetProductoProyecto,
			           "producto" : objeto.valProductoET
			}).draw();

		$("#valProductoET").val("");
    }else{
		$.gritter.add({
			title: 'Advertencia!',
			text: 'El campo producto debe estar lleno.',
			sticky: false,
			time: '1200',
			class_name: 'gritter-warning gritter-light'
		});

    }
}

function editarEntregable(id){
	var objeto = new Object();
	objeto.idProyecto = $("#codigoPy").val();
	objeto.identregable = id;
	loadModalCargando();
	$.postJSON('${pageContext.request.contextPath}/planificacion/obtener_Entregable.htm', objeto,
			function(data) {
				$("#idEntregableProyecto").val(data.identregable);
				$("#valorET").val(data.nombre);
				$("#valDescripcionET").val(data.descripcion);
				$("#fechaProgramadaET").val(data.fechaProgramada);
				
				$.postJSON('${pageContext.request.contextPath}/planificacion/listar_ProductoEntregable.htm', objeto,
						function(data) {
							dataProductoEntregable = eval(data);
							$("#tablaProductoEntregable").DataTable().ajax.reload();
							closeModalCargando();
							$('#modal-Entregable').modal('show');
						}
				);
			}
	);

}

function eliminarEntregable(id){
	bootbox.setLocale('es');
	bootbox.confirm("Esta seguro de eliminar la fila seleccionada?", function(result) {
				if(result) {
					loadModalCargando();
					$.postJSON('${pageContext.request.contextPath}/planificacion/eliminar_Entregable.htm',id, function(data) {
						listarEntregables();
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

function eliminarProductoEntregable(){
	var datos = $("#tablaProductoEntregable").DataTable().row('.selected').length;

	if(datos > 0){
		var objeto = $("#tablaProductoEntregable").DataTable().row('.selected').data(); //.remove().draw(false);
		console.log(objeto);
		$.postJSON('${pageContext.request.contextPath}/planificacion/eliminar_EntregableProducto.htm',objeto, function(data) {
			$("#tablaProductoEntregable").DataTable().row('.selected').remove().draw(false);
			$.gritter.add({
				title: 'Info!',
				text: 'Se realizo la operaci&oacute;n con &eacute;xito.',
				sticky: false,
				time: '1200',
				class_name: 'gritter-info gritter-light'
			});
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

function limpiarMntEntregable(){	
	$("#registrarEntregables").validate().resetForm();
	$('#registrarEntregables .control-group').removeClass('error');
	document.getElementById("registrarEntregables").reset();
	$("#idEntregableProyecto").val("");
	$("#idDetProductoProyecto").val("");
	var t = $("#tablaProductoEntregable").DataTable();
	t.clear().draw();
}
/* **************************** FIN - TAB ENTREGABLE  ************************************** */

function mostrarGrillas(){
	
	/* var t = $('#tablaInteresadoEmpresa').DataTable(); */
	if(datosGrillas.listaTipoRequisitoBD){
		dataSetRequisitoProyecto=JSON.parse(datosGrillas.listaTipoRequisitoBD);
	}	
	if(datosGrillas.listaExclusionBD){
		dataSetExclusion=JSON.parse(datosGrillas.listaExclusionBD);
	}
	if(datosGrillas.listaSupuestoBD){
		dataSetSupuesto=JSON.parse(datosGrillas.listaSupuestoBD);
	}
	if(datosGrillas.listaDependenciaBD){
		dataSetDependencia=JSON.parse(datosGrillas.listaDependenciaBD);
	}
	if(datosGrillas.listaFactorExitoBD){
		dataSetFactorExito=JSON.parse(datosGrillas.listaFactorExitoBD);
	}
	
	if(datosGrillas.listaDetalleFormaPagoBD){
		dataSetFormaPago=JSON.parse(datosGrillas.listaDetalleFormaPagoBD);
	}
	
	if(datosGrillas.listaDetalleRiesgoBD){
		dataSetDetalleRiesgo=JSON.parse(datosGrillas.listaDetalleRiesgoBD);
	}
	
	if(datosGrillas.listaDetalleAdquisicionBD){
		dataSetDetalleAdquisicion=JSON.parse(datosGrillas.listaDetalleAdquisicionBD);
	}
	
	if(datosGrillas.listaDetalleCostoOperativoBD){
		dataSetDetalleCostoOperativo=JSON.parse(datosGrillas.listaDetalleCostoOperativoBD);
	}
	
	if(datosGrillas.listaDetalleRolProyectoProveedorBD){
        dataSetRolProveedor=JSON.parse(datosGrillas.listaDetalleRolProyectoProveedorBD);
    }
    
    if(datosGrillas.listaDetalleRolProyectoClienteBD){
        dataSetRolCliente=JSON.parse(datosGrillas.listaDetalleRolProyectoClienteBD);
    }
    
    if(datosGrillas.listaDetalleRolProyectoProveedorResponsabilidadBD){
    	dataSetRRHHResponsabilidadesProveedor=JSON.parse(datosGrillas.listaDetalleRolProyectoProveedorResponsabilidadBD);
    }
    
    if(datosGrillas.listaDetalleRolProyectoClienteResponsabilidadBD){
    	dataSetRRHHResponsabilidadesCliente=JSON.parse(datosGrillas.listaDetalleRolProyectoClienteResponsabilidadBD);
    }
    
    /* if(datosGrillas.listaDetalleCostoProyectoBD){
    	dataSetCostosProyecto=JSON.parse(datosGrillas.listaDetalleCostoProyectoBD);
    } */
	/* tablaInteresado.ajax.reload(); */		
	
}

</script>
