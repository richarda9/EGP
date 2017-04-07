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
		break;
	}
	case "perfil.htm": {
		module = "#inicio";
		item = "#inicio_perfil";
		break;
	}
	case "editarperfil.htm": {
		module = "#inicio";
		item = "#inicio_perfil";
		break;
	}
	case "configuracion.htm": {
		module = "#inicio";
		item = "#inicio_configuracion";
		break;
	}

	// GESTION DE PROYECTOS
	case "anteproyecto.htm": {
		module = "#gestionProyectos";
		item = "#idAnteproyecto";
		break;
	}
	
	case "mntAnteproyecto.htm": {
		module = "#gestionProyectos";
		item = "#idAnteproyecto";
		break;
	}
	
	case "planificacion.htm": {
		module = "#gestionProyectos";
		item = "#idPlanificacion";
		break;
	}
	
	case "mntPlanificacion.htm": {
		module = "#gestionProyectos";
		item = "#idPlanificacion";
		break;
	}
	
	case "ejecucion.htm": {
		module = "#gestionProyectos";
		item = "#idEjecucion";
		break;
	}
	
	case "mntEjecucion.htm": {
		module = "#gestionProyectos";
		item = "#idEjecucion";
		break;
	}
		
	case "cierre.htm": {
		module = "#gestionProyectos";
		item = "#idCierre";
		break;
	}
		
	case "mntCierre.htm": {
		module = "#gestionProyectos";
		item = "#idCierre";
		break;
	}
		
	//ADMINISTRACION DE PROYECTOS
	case "empresa.htm": {
		module = "#administracionProyectos";
		item = "#bienestar_verificarPadron";
		break;
	}
	
	case "recursos.htm": {
		module = "#administracionProyectos";
		item = "#idRecursos";
		break;
	}
	
	case "organigrama.htm":{
		module = "#administracionProyectos";
		item = "#idOrganigrama";
		break;
	}
	
	case "asociadoProyecto.htm": {
		module = "#administracionProyectos";
		item = "#idAsociadoProyecto";
		break;
	}
	
	case "asociadoEntregable.htm": {
		module = "#administracionProyectos";
		item = "#idAsociadoEntregable";
		break;
	}
	
	case "tipoCambio.htm": {
		module = "#administracionProyectos";
		item = "#idTipoCambio";
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