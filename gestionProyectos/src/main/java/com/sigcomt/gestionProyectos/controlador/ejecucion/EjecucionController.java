package com.sigcomt.gestionProyectos.controlador.ejecucion;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sigcomt.gestionProyectos.common.Constantes;
import com.sigcomt.gestionProyectos.model.ejecucion.BuscarEjecucionModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstProyectoEjecucionModel;
import com.sigcomt.gestionProyectos.servicio.administracion.AdministracionService;
import com.sigcomt.gestionProyectos.servicio.anteproyecto.ProyectoService;
import com.sigcomt.gestionProyectos.servicio.ejecucion.EjecucionService;

@Controller
@RequestMapping(value = "/ejecucion")
public class EjecucionController 
{
	
	protected final Log logger = LogFactory.getLog(getClass());
		
	@Autowired
	private AdministracionService administracionService;
	
	@Autowired
	private ProyectoService proyectoService;
	
	@Autowired
	private EjecucionService ejecucionService;

	@RequestMapping(value = "/ejecucion.htm")
	public ModelAndView ejecucion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		String index = request.getParameter("idanteproyecto");
		myModel.put("listaTipoProyecto", this.administracionService.listarTipoProyectoByEsado(Constantes.ESTADO_ACTIVO));
		myModel.put("listaProyecto", this.proyectoService.listarProyectoByEstado(Constantes.ESTADO_ACTIVO));
		myModel.put("listaCliente", this.administracionService.listarEmpresaByEstado(Constantes.ESTADO_ACTIVO));
		
		//myModel.put("listaAsociadoProyecto", this.proyectoService.listarProyectoByDetalleEstadoProyectoByEstado(ESTADO_ACTIVO, Long.parseLong(EstadoProyectoEnum.EN_PLANIFICACION.getCodigo())));
		
		return new ModelAndView("ejecucion", "model", myModel);
	}
	
	@RequestMapping(value = "/mntEjecucion.htm")
	public ModelAndView mntEjecucion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		String idProyecto = request.getParameter("idEjecucion");
		myModel.put("listaRolProveedor", this.ejecucionService.listarTipoRol(Constantes.TIPO_ROL_PROVEEDOR));
		myModel.put("listaRolCliente", this.ejecucionService.listarTipoRol(Constantes.TIPO_ROL_CLIENTE));
		
		
		
//		myModel.put("listaTipoProyecto", this.administracionService.listarTipoProyecto());
//		myModel.put("listaEstadoProyecto", this.administracionService.listarEstadoProyecto());
//		myModel.put("listaTipoRequisito", this.administracionService.listarTipoRequisitoProyecto());
		
		return new ModelAndView("mntEjecucion", "model", myModel);
	}
	
	
	@RequestMapping(value = "/listar_proyectoEjecucion.htm", method = RequestMethod.POST)
	public @ResponseBody List<LstProyectoEjecucionModel> listarProyectoEjecucion(@RequestBody BuscarEjecucionModel bsqProyectoEjecucion)  
	{
		return proyectoService.listaProyectoByEstadoEjecucion(bsqProyectoEjecucion);
	}
}
