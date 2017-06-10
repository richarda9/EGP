package com.sigcomt.gestionProyectos.controlador.anteproyecto;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.sigcomt.gestionProyectos.common.enumerations.EstadoProyectoEnum;
import com.sigcomt.gestionProyectos.common.enumerations.RolEnum;
import com.sigcomt.gestionProyectos.dominio.administracion.Proyecto;
import com.sigcomt.gestionProyectos.model.anteproyecto.AgregarAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.BuscarAnteproyectoModel;
import com.sigcomt.gestionProyectos.servicio.administracion.AdministracionService;
import com.sigcomt.gestionProyectos.servicio.anteproyecto.AnteproyectoService;
import com.sigcomt.gestionProyectos.servicio.anteproyecto.PersonaService;
import com.sigcomt.gestionProyectos.servicio.anteproyecto.ProyectoService;

@Controller
@RequestMapping(value = "/anteproyecto")
public class AnteproyectoController 
{
	protected final Log logger = LogFactory.getLog(getClass());
	
	private final static int ESTADO_ACTIVO = 1;
	
	@Autowired
	private AdministracionService administracionService;
	
	@Autowired
	private ProyectoService proyectoService;
	
	@Autowired
	private PersonaService personaService;
	
	@Autowired
	AnteproyectoService anteproyectoService;
		
	@RequestMapping(value = "/anteproyecto.htm")
	public ModelAndView anteproyecto(HttpServletRequest request, HttpServletResponse response) 
	{
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		
		try {
			myModel.put("listaEmpresa", this.administracionService.listarEmpresaByEstado(ESTADO_ACTIVO));
			myModel.put("listaTipoProyecto", this.administracionService.listarTipoProyectoByEsado(ESTADO_ACTIVO));
			myModel.put("listaEjecutivoCuenta", this.personaService.listarEjecutivoResponsableByEstadoByRol(ESTADO_ACTIVO, Long.parseLong(RolEnum.EJECUTIVO_CUENTA.getCodigo())));
			myModel.put("listaResponsableProyecto", this.personaService.listarEjecutivoResponsableByEstadoByRol(ESTADO_ACTIVO, Long.parseLong(RolEnum.RESPONSABLE_PROYECTO.getCodigo())));		
			
		} catch (Exception e) {
			myModel.put("mensajeError", e);
			return new ModelAndView("errorGeneral", "model", myModel);
		}		
		
		return new ModelAndView("anteproyecto", "model", myModel);
	}
	
	@RequestMapping(value = "/mntAnteproyectoAgregar.htm")
	public ModelAndView mntAnteproyectoAgregar(HttpServletRequest request, HttpServletResponse response)
	{
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		
		try {
			myModel.put("modoEdicion", false);
			myModel.put("listaEmpresa", this.administracionService.listarEmpresaByEstado(ESTADO_ACTIVO));
			myModel.put("listaTipoProyecto", this.administracionService.listarTipoProyectoByEsado(ESTADO_ACTIVO));
			myModel.put("listaAsociadoProyecto", this.proyectoService.listarProyectoByDetalleEstadoProyectoByEstado(ESTADO_ACTIVO, Long.parseLong(EstadoProyectoEnum.EN_EJECUCION.getCodigo())));
			myModel.put("listaEjecutivoCuenta", this.personaService.listarEjecutivoResponsableByEstadoByRol(ESTADO_ACTIVO, Long.parseLong(RolEnum.EJECUTIVO_CUENTA.getCodigo())));
			myModel.put("listaResponsableProyecto", this.personaService.listarEjecutivoResponsableByEstadoByRol(ESTADO_ACTIVO, Long.parseLong(RolEnum.RESPONSABLE_PROYECTO.getCodigo())));
						
		} catch (Exception e) {
			myModel.put("mensajeError", e);
			return new ModelAndView("errorGeneral", "model", myModel);
		}

		return new ModelAndView("mntAnteproyecto", "model", myModel);
	}
	
	@RequestMapping(value = "/mntAnteproyecto.htm")
	public ModelAndView mntAnteproyecto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HashMap<String, Object> myModel = new HashMap<String, Object>();
//		String index = request.getParameter("idAnteproyecto");
		myModel.put("modoEdicion", true);
		myModel.put("listaEmpresa", this.administracionService.listarEmpresaByEstado(ESTADO_ACTIVO));
		myModel.put("listaTipoProyecto", this.administracionService.listarTipoProyectoByEsado(ESTADO_ACTIVO));
//		myModel.put("listaTipoProyecto", this.administracionService.listarTipoProyecto());
//		myModel.put("listaEstadoProyecto", this.administracionService.listarEstadoProyecto());
//		myModel.put("listaTipoRequisito", this.administracionService.listarTipoRequisitoProyecto());
		
		return new ModelAndView("mntAnteproyecto", "model", myModel);
	}
		
	@RequestMapping(value = "/buscarAnteproyecto.htm", method = RequestMethod.POST)
	public @ResponseBody List<Proyecto> buscarAnteproyecto(@RequestBody BuscarAnteproyectoModel buscarAnteproyectoModel) {
		
		List<Proyecto> listaProyecto = new ArrayList<Proyecto>();
		
		try {
			buscarAnteproyectoModel.setEstado(ESTADO_ACTIVO);
			buscarAnteproyectoModel.setIdEstadoProyecto(Long.parseLong(EstadoProyectoEnum.EN_ANTEPROYECTO.getCodigo()));
			listaProyecto = proyectoService.buscarProyectoByDetalleEstadoProyectoByEstado(buscarAnteproyectoModel);
		} catch (Exception e) {
			
		}
		
		return listaProyecto;
	}
	
	@RequestMapping(value = "/agregarAnteproyecto.htm", method = RequestMethod.POST)
	public @ResponseBody AgregarAnteproyectoModel agregarAnteproyecto(@RequestBody AgregarAnteproyectoModel agregarAnteproyectoModel) {
		
		logger.info("INI - AnteproyectoController.agregarAnteproyecto");
		try {
			agregarAnteproyectoModel.setIdEstadoProyecto(Long.parseLong(EstadoProyectoEnum.EN_ANTEPROYECTO.getCodigo()));
			String codigoPy = anteproyectoService.grabarAnteproyecto(agregarAnteproyectoModel);
			agregarAnteproyectoModel.setCodigoPy(codigoPy);
		} catch (Exception e) {
			logger.error("ERROR - AnteproyectoController.agregarAnteproyecto", e);
			agregarAnteproyectoModel.setCodigoPy("ERROR");
		}
		
		logger.info("FIN - AnteproyectoController.agregarAnteproyecto");
		return agregarAnteproyectoModel;	
	}
	
	@RequestMapping(value = "/listarInteresado.htm", method = RequestMethod.POST)
	public @ResponseBody List<Map> listarInteresadoByEstadoByEmpresa(@RequestBody BuscarAnteproyectoModel buscarAnteproyectoModel) {
		
		List<Map> listaInteresado = new ArrayList<Map>();
		
		try {
			buscarAnteproyectoModel.setEstado(ESTADO_ACTIVO);
			listaInteresado = personaService.listarInteresadoByEstadoByEmpresa(buscarAnteproyectoModel.getEstado(), buscarAnteproyectoModel.getIdEmpresa());
		} catch (Exception e) {
			
		}
		
		return listaInteresado;
	}

}
