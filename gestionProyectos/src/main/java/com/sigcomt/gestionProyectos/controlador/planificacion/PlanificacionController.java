package com.sigcomt.gestionProyectos.controlador.planificacion;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sigcomt.gestionProyectos.common.Constantes;
import com.sigcomt.gestionProyectos.common.enumerations.RolEnum;
import com.sigcomt.gestionProyectos.servicio.administracion.AdministracionService;
import com.sigcomt.gestionProyectos.servicio.anteproyecto.PersonaService;
import com.sigcomt.gestionProyectos.servicio.anteproyecto.ProyectoService;

@Controller
@RequestMapping(value = "/planificacion")
public class PlanificacionController 
{
	protected final Log logger = LogFactory.getLog(getClass());
	
	private final static int ESTADO_ACTIVO = 1;
	
	@Autowired
	private AdministracionService administracionService;
	
	@Autowired
	private ProyectoService proyectoService;
	
	@Autowired
	private PersonaService personaService;
	
	@RequestMapping(value = "/planificacion.htm")
	public ModelAndView planificacion(HttpServletRequest request, HttpServletResponse response) 
	{
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		
		try {
			myModel.put("listaEmpresa", this.administracionService.listarEmpresaByEstado(ESTADO_ACTIVO));
			myModel.put("listaProyecto", this.proyectoService.listarProyectoByEstado(Constantes.ESTADO_ACTIVO));
			myModel.put("listaTipoProyecto", this.administracionService.listarTipoProyectoByEsado(ESTADO_ACTIVO));
			myModel.put("listaResponsableProyecto", this.personaService.listarEjecutivoResponsableByEstadoByRol(ESTADO_ACTIVO, Long.parseLong(RolEnum.RESPONSABLE_PROYECTO.getCodigo())));
			
		} catch (Exception e) {
			myModel.put("mensajeError", e);
			return new ModelAndView("errorGeneral", "model", myModel);
		}			
		
		return new ModelAndView("planificacion", "model", myModel);
	}
	
	@RequestMapping(value = "/mntPlanificacion.htm")
	public ModelAndView mntPlanificacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		String index = request.getParameter("idPlanificacion");
//		myModel.put("listaTipoProyecto", this.administracionService.listarTipoProyecto());
//		myModel.put("listaEstadoProyecto", this.administracionService.listarEstadoProyecto());
//		myModel.put("listaTipoRequisito", this.administracionService.listarTipoRequisitoProyecto());
		
		return new ModelAndView("mntPlanificacion", "model", myModel);
	}

}
