//Codigo para nuevos modulos y activar los stylos
$(document).ready(function() {

	var url2 = $(location).attr('pathname').split('/');
	var module = "";
	var item = "";
	var proceso = "";

	switch (url2[$(url2).size() - 1]) {

	// INICIO
	case "bienvenida.htm": {
		module = "#inicio";
		item = "#inicio_bienvenida";
		document.getElementById("moduloSistema").innerHTML = " Inicio";
		document.getElementById("itemSistema").innerHTML = "Bienvenido";
		break;
	}
	case "perfil.htm": {
		module = "#inicio";
		item = "#inicio_perfil";
		document.getElementById("moduloSistema").innerHTML = " Inicio";
		document.getElementById("itemSistema").innerHTML = "Perfil";
		break;
	}
	case "editarperfil.htm": {
		module = "#inicio";
		item = "#inicio_perfil";
		document.getElementById("moduloSistema").innerHTML = " Inicio";
		document.getElementById("itemSistema").innerHTML = "Perfil";
		break;
	}
	case "configuracion.htm": {
		module = "#inicio";
		item = "#inicio_configuracion";
		document.getElementById("moduloSistema").innerHTML = " Inicio";
		document.getElementById("itemSistema").innerHTML = "Configuraci&oacute;n";
		break;
	}

	// GESTION DE PROYECTOS
	case "anteproyecto.htm": {
		module = "#gestionProyectos";
		item = "#idAnteproyecto";
		document.getElementById("moduloSistema").innerHTML = " Gesti&oacute;n de Proyectos";
		document.getElementById("itemSistema").innerHTML = "Anteproyectos";
		break;
	}
	
	case "mntAnteproyecto.htm": {
		module = "#gestionProyectos";
		item = "#idAnteproyecto";
		document.getElementById("moduloSistema").innerHTML = " Gesti&oacute;n de Proyectos";
		document.getElementById("itemSistema").innerHTML = "Anteproyectos";
		break;
	}
	
	case "mntAnteproyectoAgregar.htm": {
		module = "#gestionProyectos";
		item = "#idAnteproyecto";
		document.getElementById("moduloSistema").innerHTML = " Gesti&oacute;n de Proyectos";
		document.getElementById("itemSistema").innerHTML = "Anteproyectos";
		break;
	}
	
	case "mntAnteproyectoEdit.htm": {
		module = "#gestionProyectos";
		item = "#idAnteproyecto";
		document.getElementById("moduloSistema").innerHTML = " Gesti&oacute;n de Proyectos";
		document.getElementById("itemSistema").innerHTML = "Anteproyectos";
		break;
	}
	
	case "planificacion.htm": {
		module = "#gestionProyectos";
		item = "#idPlanificacion";
		document.getElementById("moduloSistema").innerHTML = " Gesti&oacute;n de Proyectos";
		document.getElementById("itemSistema").innerHTML = "Planificaci&oacute;n";
		break;
	}
	
	case "mntPlanificacion.htm": {
		module = "#gestionProyectos";
		item = "#idPlanificacion";
		document.getElementById("moduloSistema").innerHTML = " Gesti&oacute;n de Proyectos";
		document.getElementById("itemSistema").innerHTML = "Planificaci&oacute;n";
		break;
	}
	
	case "ejecucion.htm": {
		module = "#gestionProyectos";
		item = "#idEjecucion";
		document.getElementById("moduloSistema").innerHTML = " Gesti&oacute;n de Proyectos";
		document.getElementById("itemSistema").innerHTML = "Ejecuci&oacute;n";
		break;
	}
	
	case "mntEjecucion.htm": {
		module = "#gestionProyectos";
		item = "#idEjecucion";
		document.getElementById("moduloSistema").innerHTML = " Gesti&oacute;n de Proyectos";
		document.getElementById("itemSistema").innerHTML = "Ejecuci&oacute;n";
		break;
	}
		
	case "cierre.htm": {
		module = "#gestionProyectos";
		item = "#idCierre";
		document.getElementById("moduloSistema").innerHTML = " Gesti&oacute;n de Proyectos";
		document.getElementById("itemSistema").innerHTML = "Cierre";
		break;
	}
		
	case "mntCierre.htm": {
		module = "#gestionProyectos";
		item = "#idCierre";
		document.getElementById("moduloSistema").innerHTML = " Gesti&oacute;n de Proyectos";
		document.getElementById("itemSistema").innerHTML = "Cierre";
		break;
	}
		
	//ADMINISTRACION DE PROYECTOS
	case "empresa.htm": {
		module = "#administracionProyectos";
		item = "#idEmpresa";
		document.getElementById("moduloSistema").innerHTML = " Administraci&oacute;n";
		document.getElementById("itemSistema").innerHTML = "Empresa";
		break;
	}
	
	case "recursos.htm": {
		module = "#administracionProyectos";
		item = "#idRecursos";
		document.getElementById("moduloSistema").innerHTML = " Administraci&oacute;n";
		document.getElementById("itemSistema").innerHTML = "Recursos";
		break;
	}
	
	case "organigrama.htm":{
		module = "#administracionProyectos";
		item = "#idOrganigrama";
		document.getElementById("moduloSistema").innerHTML = " Administraci&oacute;n";
		document.getElementById("itemSistema").innerHTML = "Organigrama";
		break;
	}
	
	case "asociadoProyecto.htm": {
		module = "#administracionProyectos";
		item = "#idAsociadoProyecto";
		document.getElementById("moduloSistema").innerHTML = " Administraci&oacute;n";
		document.getElementById("itemSistema").innerHTML = "Asociado al Proyecto";
		break;
	}
	
	case "asociadoEntregable.htm": {
		module = "#administracionProyectos";
		item = "#idAsociadoEntregable";
		document.getElementById("moduloSistema").innerHTML = " Administraci&oacute;n";
		document.getElementById("itemSistema").innerHTML = "Asociado a Entregables";
		break;
	}
	
	case "tipoCambio.htm": {
		module = "#administracionProyectos";
		item = "#idTipoCambio";
		document.getElementById("moduloSistema").innerHTML = " Administraci&oacute;n";
		document.getElementById("itemSistema").innerHTML = "Tipo de Cambio";
		break;
	}
	
	case "reportesProyecto.htm": {
		module = "#gestionReportes";
		item = "#idReportesProyecto";
		document.getElementById("moduloSistema").innerHTML = " Gesti&oacute;n de Reportes";
		document.getElementById("itemSistema").innerHTML = "Reportes";
		break;
	}
	
	default:
		break;
	}

	$(module).addClass("active open");
	if (proceso != "")
		$(proceso).addClass("active open");
	$(item).addClass("active");
});