<!-- <script src="../assets/js/cancelarProyecto/cancelarProyecto.js"> -->
<script type="text/javascript">

var dataSetInteresados = [];
var dataSetObservacion = [];
var dataSetAnexos = [];

var tablaInteresado;

$(document).ready(function() {/* INI - READY */
		
	$('#formAgregarAnteproyecto').validate({
		errorClass: 'help-block',
		rules: {
			fechaContacto: {
				required: true
			},
			idTipoProyecto: {
				required: true
			},
			idEjecutivoCuenta: {
				required: true
			},
			idResponsable: {
				required: true
			},
			tituloProyecto: {
				required: true
			},
			alcanceInicialProyecto: {
				required: true
			},
			objetivo: {
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
	tablaInteresado = $('#tablaInteresadoEmpresa').DataTable({
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
	$('#tablaObservacion').DataTable({
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
		            	/* { "data": "archivo" }, */
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
	$('#tablaAnexo').DataTable({
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
		            	/* { "data": "archivo" }, */
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
		
	mostrarGrillas(datosGrillas.modoEdicion);
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
				$('#empresa').attr('disabled', 'disabled');
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
	if(dataSetInteresados == null || dataSetInteresados.length == 0 ){
		$('#empresa').removeAttr('disabled', 'disabled');
	}
	t.ajax.reload();
	$('#modalEliminarInteresado').modal('hide'); 

}

/* FIN - TAB EMPRESA */

/* INI - TAB OBSERVACION */
function agregarObservacion(){
	/* if($('#dscObservacion').val()!= null && $('#dscObservacion').val()!= "" && $('#archObservacion').val()!= null && $('#archObservacion').val()!= ""){ */
		if($('#dscObservacion').val()!= null && $('#dscObservacion').val()!= ""){
		$('#dscObservacion').parent().parent().removeClass('error');
		/* $('#archObservacion').parent().parent().parent().removeClass('error'); */
		var t = $('#tablaObservacion').DataTable();
		var observaciones = {};
		observaciones.observacion = $('#dscObservacion').val();
		/* observaciones.archivo = document.getElementById('archObservacion').files[0].name; */
		/* var archivos = $('#archObservacion').data('ace_input_files'); //document.getElementById('archObservacion').files[0]; */
		/* var oMyForm = new FormData();
		oMyForm.append("file", archivos[0]);
		observaciones.archivosContenido =  oMyForm;
		observaciones.rutaArchivo = document.getElementById('archObservacion').value; */
		dataSetObservacion.push(observaciones);	
		/* var reader = new FileReader();
		
		reader.onload = function(e) { 
		      var contents = e.target.result;
	        alert( "Got the file.n" 
	              +"name: " + document.getElementById('archObservacion').files[0].name + "n"
	              +"type: " + document.getElementById('archObservacion').files[0].type + "n"
	              +"size: " + document.getElementById('archObservacion').files[0].size + " bytesn"
	        );  
	      };
		
		reader.readAsText(document.getElementById('archObservacion').files[0]); */
		t.ajax.reload();
	}else{
		if($('#dscObservacion').val()== null || $('#dscObservacion').val()== ""){
			$('#dscObservacion').parent().parent().addClass('error');
		}else{
			$('#dscObservacion').parent().parent().removeClass('error');
		}
		/* if($('#archObservacion').val()== null || $('#archObservacion').val()== ""){
			$('#archObservacion').parent().parent().parent().addClass('error');
		}else{
			$('#archObservacion').parent().parent().parent().removeClass('error');
		} */
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
	/* if($('#dscAnexo').val()!= null && $('#dscAnexo').val()!= "" && $('#archAnexo').val()!= null && $('#archAnexo').val()!= ""){ */
		if($('#dscAnexo').val()!= null && $('#dscAnexo').val()!= ""){
		$('#dscAnexo').parent().parent().removeClass('error');
		/* $('#archAnexo').parent().parent().parent().removeClass('error'); */
		var t = $('#tablaAnexo').DataTable();
		var anexos = {};
		anexos.anexo = $('#dscAnexo').val();
		/* anexos.archivo = document.getElementById('archAnexo').files[0].name;
		anexos.rutaArchivo = document.getElementById('archAnexo').value; */
		dataSetAnexos.push(anexos);	
		t.ajax.reload();
	}else{		
		if($('#dscAnexo').val()== null || $('#dscAnexo').val()== ""){
			$('#dscAnexo').parent().parent().addClass('error');
		}else{
			$('#dscAnexo').parent().parent().removeClass('error');
		}
		/* if($('#archAnexo').val()== null || $('#archAnexo').val()== ""){
			$('#archAnexo').parent().parent().parent().addClass('error');
		}else{
			$('#archAnexo').parent().parent().parent().removeClass('error');
		} */
				
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
	
	var form = $( "#formAgregarAnteproyecto" );
/* 	form.validate(); */
	
	if(form.valid()){
		loadModalCargando();
		var form=$('#formAgregarAnteproyecto').serializeObject();		
		form.listaInteresados = dataSetInteresados;
		form.listaObservaciones = dataSetObservacion;
		form.listaAnexos = dataSetAnexos;
		form.idEmpresa = $('#empresa').val();
		form.correoResponsable = $("#idResponsableProyecto option:selected").attr("data-correo");
		form.nombreResponsable = $("#idResponsableProyecto option:selected").attr("data-nombre");
		
		$.postJSON('${pageContext.request.contextPath}/anteproyecto/agregarAnteproyecto.htm',form, function(data) {
			/* console.log("qwqw");
			alert(data); */
			closeModalCargando();
			if(data.codigoPy == 'ERROR'){
				$.gritter.add({
					title: 'Error!',
					text: 'Ocurrio un error al guardar el proyecto',
					sticky: false,
					time: '1200',
					class_name: 'gritter-error'
				});
			}else{
				$("#idHeaderCodigoPy").html(data.codigoPy+' - '+data.tituloProyecto);
				$("#idCodigoPy").val(data.codigoPy);
				$.gritter.add({
					title: 'Info!',
					text: 'Se guardó correctamente el proyecto.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-info gritter-light'
				});
			}
			
		});
	}
}

function planificarAnteproyecto(){
	
	var form = $( "#formAgregarAnteproyecto" );
/* 	form.validate(); */
	
	if(form.valid() && dataSetInteresados!= null && dataSetInteresados.length >0){
		loadModalCargando();
		
		var form=$('#formAgregarAnteproyecto').serializeObject();
		form.correoResponsable = $("#idResponsableProyecto option:selected").attr("data-correo");
		form.nombreResponsable = $("#idResponsableProyecto option:selected").attr("data-nombre");
		form.listaInteresados = dataSetInteresados;
		form.listaObservaciones = dataSetObservacion;
		form.listaAnexos = dataSetAnexos;
		form.idEmpresa = $('#empresa').val();
		
		$.postJSON('${pageContext.request.contextPath}/anteproyecto/planificarAnteproyecto.htm',form, function(data) {
			
			if(data.codigoPy == 'ERROR'){
				closeModalCargando();
				$.gritter.add({
					title: 'Error!',
					text: 'Ocurrio un error al planificar el proyecto',
					sticky: false,
					time: '1200',
					class_name: 'gritter-error'
				});
			}else{
				$("#idCodigoPy").val(data.codigoPy);
				closeModalCargando();
				/* AL SER CORRECTO DEBE REDIRECCIONAR A LA PANTALLA DE BUSQUEDA DE ANTEPROYECTO */
				$.gritter.add({
					title: 'Info!',
					text: 'Se guardó correctamente el proyecto.',
					sticky: false,
					time: '1200',
					class_name: 'gritter-info gritter-light'
				});				
				window.location = '${pageContext.request.contextPath}/anteproyecto/anteproyecto.htm';
			}
			
		});
	}else{
		closeModalCargando();
		if(dataSetInteresados == null || dataSetInteresados.length == 0){
			$.gritter.add({
				title: 'Error!',
				text: 'Ingrese al menos un interesado',
				sticky: false,
				time: '1200',
				class_name: 'gritter-error'
			});
		}		
	}
}

function cleanCbm(idCombo){
	$(idCombo+" option").remove();
	var selectOption = '<option value="">Seleccionar</option>';
	$(idCombo).append(selectOption);
}

function mostrarGrillas(modoEdicion){
	
	if(modoEdicion){
		/* var t = $('#tablaInteresadoEmpresa').DataTable(); */
		if(datosGrillas.listaInteresado){
			dataSetInteresados=JSON.parse(datosGrillas.listaInteresado);
		}	
		if(datosGrillas.listaObservaciones){
			dataSetObservacion=JSON.parse(datosGrillas.listaObservaciones);
		}
		if(datosGrillas.listaAnexo){
			dataSetAnexos=JSON.parse(datosGrillas.listaAnexo);
		}
		/* tablaInteresado.ajax.reload(); */
		
		if(datosGrillas.idEmpresa){
			$('#empresa').val(datosGrillas.idEmpresa);
			$('#empresa').attr('disabled', 'disabled');						
			var buscarAnteproyectoModel = {};
			buscarAnteproyectoModel.idEmpresa = datosGrillas.idEmpresa;
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
	}	
}
</script>