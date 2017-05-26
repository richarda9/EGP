<!-- <script src="../assets/js/cancelarProyecto/cancelarProyecto.js"> -->
<script type="text/javascript">

var dataSetInteresados = [];
var dataSetObservacion = [];
var dataSetAnexos = [];

$(document).ready(function() {/* INI - READY */
		
	$('#fechaContacto').datepicker({
		language: 'es',
		format: 'dd/mm/yyyy'
	});
	$('#fechaContacto').datepicker().next().on('click', function(){ 
		$(this).prev().focus();
	});
	
	$('#archObservacion , #archAnexo').ace_file_input({
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
	
	/* INI - TAB EMPRESA  */
	var opcionesInteresado = '<a id="deleteInteresado" class="red tooltip-error" data-rel="tooltip" title="Eliminar"><i class="icon-trash bigger-130"> </i></a>';	
	$('#tablaInteresadoEmpresa').dataTable({
		"ajax"		 : function (data, callback, settings) {
			callback ( { data: dataSetInteresados } );
		   },
		"ordering"	 : false,
		"paging"     : false,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       },        
	   	"columns"	 : [
		            	{ "data": "nombreInteresado"},
		            	{ "data": "cargo"},
		            	{ "data": "interes" },
		            	{ "data": null }
		        ],
        "columnDefs" : [
                        {        				
	         				"targets": -1,
	         				"data": null,
	         				"defaultContent": opcionesInteresado}	         			
        		]
	});	
	
	$('#tablaInteresadoEmpresa tbody').on( 'click', '#deleteInteresado', function () {
		var indice = $(this).parents('tr').index();
		$('#modalEliminarInteresado').attr('data-attr-index',indice);
		$('#modalEliminarInteresado').modal('show'); 

	} );
	
	$('#modalEliminarInteresado').on('click', '#confirmarEliminarInteresado', function(){
		deleteInteresado();		
	});
	/* FIN - TAB EMPRESA  */
	
	/* INI - TAB OBSERVACION */
	var opcionesObservacion = '<a id="deleteObservacion" class="red tooltip-error" data-rel="tooltip" title="Eliminar"><i class="icon-trash bigger-130"> </i></a>';
	$('#tablaObservacion').dataTable({
		"ajax"		 : function (data, callback, settings) {
			callback ( { data: dataSetObservacion } );
		   },
		"ordering"	 : false,
		"paging"     : false,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       },
       	"columns"	 : [
		            	{ "data": "observacion" },
		            	{ "data": "archivo" },
		            	{ "data": null }
		        ],
        "columnDefs" : [{
	         			"targets": -1,
	         			"data": null,
	         			"defaultContent": opcionesObservacion

	        }]
	});
		
	$('#tablaObservacion tbody').on( 'click', '#deleteObservacion', function () {
		var indice = $(this).parents('tr').index();
		$('#modalEliminarObservacion').attr('data-attr-index',indice);
		$('#modalEliminarObservacion').modal('show'); 

	} );
	
	$('#modalEliminarObservacion').on('click', '#confirmarEliminarObservacion', function(){
		deleteObservacion();		
	});	
	/* FIN - TAB OBSERVACION */
	
	/* INI - TAB ANEXO */
	var opcionesAnexo = '<a id="deleteAnexo" class="red tooltip-error" data-rel="tooltip" title="Eliminar"><i class="icon-trash bigger-130"> </i></a>';	
	$('#tablaAnexo').dataTable({
		"ajax"		 : function (data, callback, settings) {
			callback ( { data: dataSetAnexos } );
		   },
		"ordering"	 : false,
		"paging"     : false,
		"autoWidth"  : true,
		"pageLength" : 10,
		"searching"  : false,
		"bInfo"      : false, 
		"language"   : {
							"url": "../assets/plugins/DataTables-1.10.12/extensions/internalization/spanish.txt" 
				       },
        "columns"	 : [
		            	{ "data": "anexo" },
		            	{ "data": "archivo" },
		            	{ "data": null }
		        ],
        "columnDefs" : [{
	         			"targets": -1,
	         			"data": null,
	         			"defaultContent": opcionesAnexo

	        }]
	});	

	$('#tablaAnexo tbody').on( 'click', '#deleteAnexo', function () {
		var indice = $(this).parents('tr').index();
		$('#modalEliminarAnexo').attr('data-attr-index',indice);
		$('#modalEliminarAnexo').modal('show'); 

	} );
	
	$('#modalEliminarAnexo').on('click', '#confirmarEliminarAnexo', function(){
		deleteAnexo();		
	});	
	/* FIN - TAB ANEXO */
		
});/* FIN - READY */


/* INI - TAB EMPRESA */
function listarInteresado(empresa){
		var buscarAnteproyectoModel = {};
		buscarAnteproyectoModel.idEmpresa = empresa.value;
		cleanCbm("#idContacto");
		$.postJSON('${pageContext.request.contextPath}/anteproyecto/listarInteresado.htm',buscarAnteproyectoModel, function(data) { 
			if (data != null) {				
				var $selectElement = $("#idContacto");
				$(data).each(function() {
					newOption = '<option value="' + this.iddet + '" data-cargo ="'+this.cargo+'">' + this.nombreinteresado + '</option>';
					$selectElement.append(newOption);
				});
			}
		});
}
	
function agregarInteresados(){	
	if($('#idContacto').val()!= null && $('#idContacto').val()!= "" && $('#idInteres').val()!= null && $('#idInteres').val()!= ""){
		$('#idContacto').parent().parent().removeClass('error');
		$('#idInteres').parent().parent().removeClass('error');
		var t = $('#tablaInteresadoEmpresa').DataTable();
		var interesados = {};
		interesados.idInteresado = $('#idContacto').val();	
		interesados.interes = $('#idInteres').val();
		interesados.nombreInteresado = $('#idContacto option:selected').text();
		interesados.cargo = $('#idContacto  option:selected').attr('data-cargo');	
		dataSetInteresados.push(interesados);
		t.ajax.reload();
	}else{
		if($('#idContacto').val()== null || $('#idContacto').val()== ""){
			$('#idContacto').parent().parent().addClass('error');
		}else{
			$('#idContacto').parent().parent().removeClass('error');
		}
		if($('#idInteres').val()== null || $('#idInteres').val()== ""){
			$('#idInteres').parent().parent().addClass('error');
		}else{
			$('#idInteres').parent().parent().removeClass('error');
		}
	}
}

function deleteInteresado(){
	var t = $('#tablaInteresadoEmpresa').DataTable();
	dataSetInteresados.splice($('#modalEliminarInteresado').attr('data-attr-index'),1);
	t.ajax.reload();
	$('#modalEliminarInteresado').modal('hide'); 

}

/* FIN - TAB EMPRESA */

/* INI - TAB OBSERVACION */
function agregarObservacion(){
	if($('#dscObservacion').val()!= null && $('#dscObservacion').val()!= "" && $('#archObservacion').val()!= null && $('#archObservacion').val()!= ""){
		$('#dscObservacion').parent().parent().removeClass('error');
		$('#archObservacion').parent().parent().parent().removeClass('error');
		var t = $('#tablaObservacion').DataTable();
		var observaciones = {};
		observaciones.observacion = $('#dscObservacion').val();
		observaciones.archivo = document.getElementById('archObservacion').files[0].name;
		observaciones.rutaArchivo = document.getElementById('archObservacion').value;
		dataSetObservacion.push(observaciones);	
		t.ajax.reload();
	}else{
		if($('#dscObservacion').val()== null || $('#dscObservacion').val()== ""){
			$('#dscObservacion').parent().parent().addClass('error');
		}else{
			$('#dscObservacion').parent().parent().removeClass('error');
		}
		if($('#archObservacion').val()== null || $('#archObservacion').val()== ""){
			$('#archObservacion').parent().parent().parent().addClass('error');
		}else{
			$('#archObservacion').parent().parent().parent().removeClass('error');
		}
	}	 
}

function deleteObservacion(){
	var t = $('#tablaObservacion').DataTable();
	dataSetObservacion.splice($('#modalEliminarObservacion').attr('data-attr-index'),1);
	t.ajax.reload();
	$('#modalEliminarObservacion').modal('hide'); 

}

/* FIN - TAB OBSERVACION */

/* INI - TAB ANEXO */
function agregarAnexos(){
	if($('#dscAnexo').val()!= null && $('#dscAnexo').val()!= "" && $('#archAnexo').val()!= null && $('#archAnexo').val()!= ""){
		$('#dscAnexo').parent().parent().removeClass('error');
		$('#archAnexo').parent().parent().parent().removeClass('error');
		var t = $('#tablaAnexo').DataTable();
		var anexos = {};
		anexos.anexo = $('#dscAnexo').val();
		anexos.archivo = document.getElementById('archAnexo').files[0].name;
		anexos.rutaArchivo = document.getElementById('archAnexo').value;
		dataSetAnexos.push(anexos);	
		t.ajax.reload();
	}else{		
		if($('#dscAnexo').val()== null || $('#dscAnexo').val()== ""){
			$('#dscAnexo').parent().parent().addClass('error');
		}else{
			$('#dscAnexo').parent().parent().removeClass('error');
		}
		if($('#archAnexo').val()== null || $('#archAnexo').val()== ""){
			$('#archAnexo').parent().parent().parent().addClass('error');
		}else{
			$('#archAnexo').parent().parent().parent().removeClass('error');
		}
				
		/* $.gritter.add({
			title: 'Advertencia!',
			text: 'Existe un registro con los mismos datos.',
			sticky: false,
			time: '1200',
			class_name: 'gritter-warning gritter-light'
		}); */
	}	
}

function deleteAnexo(){
	var t = $('#tablaAnexo').DataTable();
	dataSetAnexos.splice($('#modalEliminarAnexo').attr('data-attr-index'),1);
	t.ajax.reload();
	$('#modalEliminarAnexo').modal('hide'); 

}

/* FIN - TAB ANEXO */

function guardarAnteproyecto(){
	
	var form=$('#formAgregarAnteproyecto').serializeObject();
	var agregarAnteproyectoModel = {};
	form.listaInteresados = dataSetInteresados;
	form.listaObservaciones = dataSetObservacion;
	form.listaAnexos = dataSetAnexos;
	
	/* agregarAnteproyectoModel.idAsociadoProyecto = "qwwe";
	agregarAnteproyectoModel.fechaContacto = "22";
	agregarAnteproyectoModel.idTipoProyecto = "22";
	agregarAnteproyectoModel.idEjecutivoCuenta = "22";
	agregarAnteproyectoModel.idResponsable = "22";
	agregarAnteproyectoModel.tituloProyecto = "22";
	agregarAnteproyectoModel.alcanceInicialProyecto = "22";
	agregarAnteproyectoModel.objetivo = "22"; */
	
	$.postJSON('${pageContext.request.contextPath}/anteproyecto/agregarAnteproyecto.htm',form, function(data) { 
		
		alert(data);
		
	});
}

function cleanCbm(idCombo){
	$(idCombo+" option").remove();
	var selectOption = '<option value="">Seleccionar</option>';
	$(idCombo).append(selectOption);
}
</script>