package com.sigcomt.gestionProyectos.controlador.ejecucion;

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

import com.sigcomt.gestionProyectos.servicio.administracion.AdministracionService;
import com.sigcomt.gestionProyectos.servicio.anteproyecto.ProyectoService;

@Controller
@RequestMapping(value = "/ejecucion")
public class EjecucionController 
{
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	private final static int ESTADO_ACTIVO = 1;
	
	@Autowired
	private AdministracionService administracionService;
	
	@Autowired
	private ProyectoService proyectoService;

	@RequestMapping(value = "/ejecucion.htm")
	public ModelAndView ejecucion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		String index = request.getParameter("idanteproyecto");
		myModel.put("listaTipoProyecto", this.administracionService.listarTipoProyectoByEsado(ESTADO_ACTIVO));
		myModel.put("listaProyecto", this.proyectoService.listarProyectoByEstado(ESTADO_ACTIVO));
		myModel.put("listaCliente", this.administracionService.listarEmpresaByEstado(ESTADO_ACTIVO));
		
		//myModel.put("listaAsociadoProyecto", this.proyectoService.listarProyectoByDetalleEstadoProyectoByEstado(ESTADO_ACTIVO, Long.parseLong(EstadoProyectoEnum.EN_PLANIFICACION.getCodigo())));
		
		return new ModelAndView("ejecucion", "model", myModel);
	}
	
	@RequestMapping(value = "/mntEjecucion.htm")
	public ModelAndView mntEjecucion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		String index = request.getParameter("idEjecucion");
//		myModel.put("listaTipoProyecto", this.administracionService.listarTipoProyecto());
//		myModel.put("listaEstadoProyecto", this.administracionService.listarEstadoProyecto());
//		myModel.put("listaTipoRequisito", this.administracionService.listarTipoRequisitoProyecto());
		
		return new ModelAndView("mntEjecucion", "model", myModel);
	}

}
