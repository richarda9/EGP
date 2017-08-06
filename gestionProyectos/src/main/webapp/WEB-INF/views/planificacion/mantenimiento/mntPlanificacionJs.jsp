<script src="../assets/js/bootstrap-wysiwyg.min.js"></script>
<script src="../assets/js/jquery.hotkeys.min.js"></script>
<script src="../assets/js/fuelux/data/fuelux.tree-sampledata.js"></script>
<script src="../assets/js/fuelux/fuelux.tree.min.js"></script>

<script>
var dataSetRequisitoProyecto = [];
var dataSetExclusion = [];
var dataSetSupuesto = [];
var dataSetDependencia = [];
var dataSetFactorExito = [];
var dataSetFormaPago = [];
$(document).ready(function() {/* INI - READY */
	
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
	
	$('#tablaRiesgosProyecto').DataTable({
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
	
	$('#tablaAdquisicionesProyecto').DataTable({
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
	
	$('#tablaCostosProyecto').DataTable({
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
	
	/* INI - DESCRIPCION DEL PRODUCTO */
	$('#formPlanDescripcion').validate({
		errorClass: 'help-block',
		rules: {
			editor1: {
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
	
	/* INICIO - FORMAS DE PAGO */
	$('#tablaFormasPago tbody').on( 'click', '#deleteFormaPago', function () {
		var indice = $(this).parents('tr').index();
		var indice01 = $(this).parents('tr').data();
		var indice011 = $(this).parents('tr');
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
	         					var abc = type;
	         					var abcd = val;
	         				},
	         				"defaultContent": opcionesEliminarFormaPago}	         			
	       		]
	});	
	
	
	mostrarGrillas();
	
		
});

/* INI - DESCRIPCION DEL PRODUCTO */
function guardarDescripcion(){
	
	var form=$('#formPlanDescripcion').serializeObject();	
	var agregarPlanificacionModel = {};
	agregarPlanificacionModel.descripcionProducto = form.descripcion;
	agregarPlanificacionModel.idProyecto = $('#codigoPy').val();
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
/* FIN - DESCRIPCION DEL PRODUCTO */

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
	/* tablaInteresado.ajax.reload(); */		
	
}

/* *************************** FIN - TAB ALCANCE *************************** */
</script>