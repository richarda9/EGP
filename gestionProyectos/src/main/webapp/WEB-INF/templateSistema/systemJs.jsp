
<!--[if !IE]>-->
<script src="../assets/js/jquery.min.js"></script>
<!--<![endif]-->

<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

<!--[if !IE]>-->
<script type="text/javascript">
	window.jQuery
			|| document.write("<script src='../assets/js/jquery-2.0.3.min.js'>"
					+ "<"+"/script>");
</script>
<!--<![endif]-->

<!--[if IE]>
<script type="text/javascript">
window.jQuery || document.write("<script src='../assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

<script type="text/javascript">
	if ("ontouchend" in document)
		document
				.write("<script src='../assets/js/jquery.mobile.custom.min.js'>"
						+ "<"+"/script>");
</script>
<script src="../assets/js/bootstrap.min.js"></script>

<!--[if lte IE 8]>
<script src="../assets/js/excanvas.min.js"></script>
<![endif]-->
<!-- AJAX -->
<script src="../assets/json/json.min.js"></script>
<!-- AJAX FIN -->
<script src="../assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="../assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="../assets/js/chosen.jquery.min.js"></script>
<script src="../assets/js/jquery.slimscroll.min.js"></script>
<!-- <script src="../assets/js/validarCampos.js"></script> -->
<script src="../assets/js/menu.js"></script>

<!--ace scripts-->

<script src="../assets/js/ace-elements.min.js"></script>
<script src="../assets/js/ace.min.js"></script>
<script src="../assets/plugins/DataTables-1.10.12/media/js/jquery.dataTables.min.js"></script>
<script src="../assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="../assets/js/jquery.gritter.min.js"></script>
<script src="../assets/js/jquery.validate.min.js"></script>
<script src="../assets/plugins/validate/localization/messages_es.js"></script>
<script src="../assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="../assets/js/date-time/bootstrap-datepicker.es.js"></script>

<script type="text/javascript">
$(document).on("ready", function() {
	$('#Agregar').modal({
		show : true,
		keyboard : false,
	});		
	
	$('[data-rel=tooltip]').tooltip();
	regresar();
	
	$.fn.modal.Constructor.prototype.enforceFocus = function () {};
});

// 	$(function() {
// 		//Para escribir solo letras
// 		$('#miCampo1').validCampoFranz(' abcdefghijklmnñopqrstuvwxyzáéiou');

// 		//Para escribir solo numeros    
// 		$('.numeros').validCampoFranz('0123456789');

// 	});

function regresar()
{
	var url2 = $(location).attr('pathname').split('/');

	switch (url2[$(url2).size() - 1]) {
	// INICIO
	case "bienvenida.htm": {
		//$("#btnRegresar").attr("href", "/"+url2[1]+"/"+url2[2]+"/"+url2[3]);
		$("#divBtnRegresar").hide();
		break;
	}
	case "perfil.htm": {
		$("#divBtnRegresar").hide();
		break;
	}
	case "editarperfil.htm": {
		$("#btnRegresar").attr("href", "/"+url2[1]+"/"+url2[2]+"/perfil.htm");
		break;
	}
	case "configuracion.htm": {
		$("#divBtnRegresar").hide();
		break;
	}

	// GESTION DE PROYECTOS
	case "anteproyecto.htm": {
		$("#divBtnRegresar").hide();
		break;
	}
		
	case "mntAnteproyectoAgregar.htm": {
		$("#btnRegresar").attr("href", "/"+url2[1]+"/"+url2[2]+"/anteproyecto.htm");
		break;
	}
	
	case "mntAnteproyecto.htm": {
		$("#btnRegresar").attr("href", "/"+url2[1]+"/"+url2[2]+"/anteproyecto.htm");
		break;
	}
	
	case "planificacion.htm": {
		$("#divBtnRegresar").hide();
		break;
	}
	
	case "mntPlanificacion.htm": {
		$("#btnRegresar").attr("href", "/"+url2[1]+"/"+url2[2]+"/planificacion.htm");
		break;
	}
	
	case "ejecucion.htm": {
		$("#divBtnRegresar").hide();
		break;
	}
	
	case "mntEjecucion.htm": {
		$("#btnRegresar").attr("href", "/"+url2[1]+"/"+url2[2]+"/ejecucion.htm");
		break;
	}
		
	case "cierre.htm": {
		$("#divBtnRegresar").hide();
		break;
	}
		
	case "mntCierre.htm": {
		$("#btnRegresar").attr("href", "/"+url2[1]+"/"+url2[2]+"/cierre.htm");
		break;
	}
		
	//ADMINISTRACION DE PROYECTOS
	case "empresa.htm": {
		$("#divBtnRegresar").hide();
		break;
	}
	
	case "recursos.htm": {
		$("#divBtnRegresar").hide();
		break;
	}
	
	case "organigrama.htm":{
		$("#divBtnRegresar").hide();
		break;
	}
	
	case "asociadoProyecto.htm": {
		$("#divBtnRegresar").hide();
		break;
	}
	
	case "asociadoEntregable.htm": {
		$("#divBtnRegresar").hide();
		break;
	}
	
	case "tipoCambio.htm": {
		$("#divBtnRegresar").hide();
		break;
	}
	
	case "reportesProyecto.htm": {
		$("#divBtnRegresar").hide();
		break;
	}
	
	default:
		break;
	}
}

function loadModalCargando(){
	$("#content-cargando").modal('show');
}

function closeModalCargando(){
	$("#content-cargando").modal('hide');
}

</script>

