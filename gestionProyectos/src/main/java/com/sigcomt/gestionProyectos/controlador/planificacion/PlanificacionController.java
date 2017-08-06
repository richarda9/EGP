package com.sigcomt.gestionProyectos.controlador.planificacion;

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

import com.google.gson.Gson;
import com.sigcomt.gestionProyectos.common.Constantes;
import com.sigcomt.gestionProyectos.common.enumerations.EstadoProyectoEnum;
import com.sigcomt.gestionProyectos.common.enumerations.RolEnum;
import com.sigcomt.gestionProyectos.dominio.administracion.Entregable;
import com.sigcomt.gestionProyectos.dominio.administracion.Proyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoFormaPago;
import com.sigcomt.gestionProyectos.model.administracion.TipoDependenciaProyectoModel;
import com.sigcomt.gestionProyectos.model.administracion.TipoRequisitoProyectoModel;
import com.sigcomt.gestionProyectos.model.administracion.TipoSupuestoProyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.AgregarAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.BuscarAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.planificacion.AgregarPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.FormasPagoModel;
import com.sigcomt.gestionProyectos.servicio.administracion.AdministracionService;
import com.sigcomt.gestionProyectos.servicio.anteproyecto.PersonaService;
import com.sigcomt.gestionProyectos.servicio.anteproyecto.ProyectoService;
import com.sigcomt.gestionProyectos.servicio.planificacion.PlanificacionService;

@Controller
@RequestMapping(value = "/planificacion")
public class PlanificacionController 
{
	protected final Log logger = LogFactory.getLog(getClass());
	
	private final static int ESTADO_ACTIVO = 1;
	
	@Autowired
	private PlanificacionService planificacionService;
	
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
			myModel.put("listaProyecto", this.proyectoService.listarProyectoByEstado(ESTADO_ACTIVO));
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
		Proyecto py = proyectoService.buscarPyByIdPy(Long.parseLong(index));
		List<TipoRequisitoProyectoModel> tipoReqPy = proyectoService.listarTipoRequisitoProyectoByIdTipoPy(py.getIdTipoProyecto());
		List<TipoSupuestoProyectoModel> tipoSupuesto = proyectoService.listarTipoSupuestoProyectoByIdTipoPy(py.getIdTipoProyecto());
		List<TipoDependenciaProyectoModel> tipoDependencia = proyectoService.listarTipoDependenciaProyectoByIdTipoPy(py.getIdTipoProyecto());
		List<TipoFormaPago> formaPagoList = planificacionService.listarFormasPago();
		Long idProyecto = Long.parseLong(index);
		List<Entregable> entregableList = planificacionService.listarEntregablesProyectoId(idProyecto);
		List<FormasPagoModel> formaPagoDetalleList = planificacionService.listarFormaPagoIdProyecto(idProyecto);
		Gson gson = new Gson();
		String listaDetalleFormaPagoString = gson.toJson(formaPagoDetalleList);
		myModel.put("codigoPy", index);		
		myModel.put("listaTipoRequisito", tipoReqPy);
		myModel.put("listaTipoSupuesto", tipoSupuesto);
		myModel.put("listaTipoDependencia", tipoDependencia);
		myModel.put("listaFormaPago", formaPagoList);
		myModel.put("listaEntregable", entregableList);
		myModel.put("listaDetalleFormaPagoBD", listaDetalleFormaPagoString);
				
		myModel.put("descripcionProductoProyecto", py.getDescripcionProductoProyecto());
		myModel.put("alcanceInicial", py.getAlcanceInicial());
		return new ModelAndView("mntPlanificacion", "model", myModel);
	}
	
	@RequestMapping(value = "/buscarPlanificacion.htm", method = RequestMethod.POST)
	public @ResponseBody List<Proyecto> buscarAnteproyecto(@RequestBody BuscarAnteproyectoModel buscarAnteproyectoModel) {
		
		List<Proyecto> listaProyecto = new ArrayList<Proyecto>();
		
		try {
			buscarAnteproyectoModel.setEstado(ESTADO_ACTIVO);
			buscarAnteproyectoModel.setIdEstadoProyecto(Long.parseLong(EstadoProyectoEnum.EN_PLANIFICACION.getCodigo()));
			listaProyecto = proyectoService.buscarProyectoByDetalleEstadoProyectoByEstado(buscarAnteproyectoModel);
		} catch (Exception e) {
			
		}
		
		return listaProyecto;
	}
	
//	INI - DESCRIPCION DEL PRODUCTO
	@RequestMapping(value = "/guardarDescripcion.htm", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> guardarDescripcion(@RequestBody AgregarPlanificacionModel agregarPlanificacionModel, HttpServletRequest request) {
		
		logger.info("INI - PlanificacionController.guardarDescripcion");
		Map<String, String> respuesta =  new HashMap<String, String>();
		respuesta.put("respuesta", "OK");
		try {
			proyectoService.actualizarProyectoByIdPy(agregarPlanificacionModel);
		} catch (Exception e) {
			logger.error("ERROR - PlanificacionController.guardarDescripcion", e);
			respuesta.put("respuesta", "ERROR");
		}
		
		logger.info("FIN - PlanificacionController.guardarDescripcion");
		return respuesta;	
	}
//	FIN - DESCRIPCION DEL PRODUCTO

//	INI - ALCANCE
	@RequestMapping(value = "/guardarAlcance.htm", method = RequestMethod.POST)
	public @ResponseBody Map<String, String>  guardarAlcance(@RequestBody AgregarPlanificacionModel agregarPlanificacionModel) {
		
		logger.info("INI - PlanificacionController.guardarAlcance");
		Map<String, String> respuesta =  new HashMap<String, String>();
		respuesta.put("respuesta", "OK");
		try {
			String rpta = planificacionService.guardarAlcance(agregarPlanificacionModel);
			respuesta.put("respuesta", rpta);
		} catch (Exception e) {
			logger.error("ERROR - PlanificacionController.guardarAlcance", e);
			respuesta.put("respuesta", "ERROR");
		}
		
		logger.info("FIN - PlanificacionController.guardarAlcance");
		return respuesta;	
	}
//	FIN - ALCANCE
	
	@RequestMapping(value = "/guardarFormaPago.htm", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> guardarFormaPago(@RequestBody FormasPagoModel formasPagoModel, HttpServletRequest request) {
		
		logger.info("INI - PlanificacionController.guardarFormaPago");
		Map<String, String> respuesta =  new HashMap<String, String>();
		respuesta.put("respuesta", "OK");
		formasPagoModel.setEstado(ESTADO_ACTIVO);
		
		try {
			planificacionService.guardarFormaPago(formasPagoModel);
			respuesta.put("idFormaPagoDetal", formasPagoModel.getIdFormaPagoDetal().toString());
			
		} catch (Exception e) {
			logger.error("ERROR - PlanificacionController.guardarFormaPago", e);
			respuesta.put("respuesta", "ERROR");
		}
		
		logger.info("FIN - PlanificacionController.guardarFormaPago");
		return respuesta;	
	}
	
	@RequestMapping(value = "/eliminarFormaPago.htm", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> eliminarFormaPago(@RequestBody FormasPagoModel formasPagoModel, HttpServletRequest request) {		
		logger.info("INI - PlanificacionController.eliminarFormaPago");
		Map<String, String> respuesta =  new HashMap<String, String>();
		respuesta.put("respuesta", "OK");
		
		
		try {
			planificacionService.eliminarFormaPago(formasPagoModel);
			
			
		} catch (Exception e) {
			logger.error("ERROR - PlanificacionController.guardarFormaPago", e);
			respuesta.put("respuesta", "ERROR");
		}
		
		logger.info("FIN - PlanificacionController.guardarFormaPago");
		return respuesta;	
	}
	
}
