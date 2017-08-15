package com.sigcomt.gestionProyectos.controlador.planificacion;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.sigcomt.gestionProyectos.dominio.administracion.CategoriaAdquisicion;
import com.sigcomt.gestionProyectos.dominio.administracion.Entregable;
import com.sigcomt.gestionProyectos.dominio.administracion.Proyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoCostoOperativo;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoFormaPago;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoRol;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleAdquisicionProyecto;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleRolProyecto;
import com.sigcomt.gestionProyectos.model.administracion.TipoDependenciaProyectoModel;
import com.sigcomt.gestionProyectos.model.administracion.TipoRequisitoProyectoModel;
import com.sigcomt.gestionProyectos.model.administracion.TipoSupuestoProyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.AgregarAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.BuscarAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.planificacion.AgregarPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.DependenciaPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.DetalleCostoOperativoModel;
import com.sigcomt.gestionProyectos.model.planificacion.DetalleRiesgosModel;
import com.sigcomt.gestionProyectos.model.planificacion.ExclusionPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.FactorExitoPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.FormasPagoModel;
import com.sigcomt.gestionProyectos.model.planificacion.RequisitoProyectoPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.SupuestoPlanificacionModel;
import com.sigcomt.gestionProyectos.servicio.administracion.AdministracionService;
import com.sigcomt.gestionProyectos.servicio.anteproyecto.PersonaService;
import com.sigcomt.gestionProyectos.servicio.anteproyecto.ProyectoService;
import com.sigcomt.gestionProyectos.servicio.ejecucion.EjecucionService;
import com.sigcomt.gestionProyectos.servicio.planificacion.PlanificacionService;

@Controller
@RequestMapping(value = "/planificacion")
public class PlanificacionController 
{
	protected final Log logger = LogFactory.getLog(getClass());
	
	private final static int ESTADO_ACTIVO = 1;
	private final static Long ESTADO_ADQUISICION_PENDIENTE = 1L;
	private final static int TIPO_ROL_PROVEEDOR = 1;    
    private final static int TIPO_ROL_CLIENTE = 2;
    
	@Autowired
	private PlanificacionService planificacionService;
	
	@Autowired
	private AdministracionService administracionService;
	
	@Autowired
	private ProyectoService proyectoService;
	
	@Autowired
	private PersonaService personaService;
	
	@Autowired
	private EjecucionService ejecucionService;
	
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
		myModel.put("codigoProyecto", py.getCodigoProyecto());
        myModel.put("nombreProyecto", py.getNombreProyecto());
        myModel.put("codigoPy", index); 
		List<TipoRequisitoProyectoModel> tipoReqPy = proyectoService.listarTipoRequisitoProyectoByIdTipoPy(py.getIdTipoProyecto());
		List<TipoSupuestoProyectoModel> tipoSupuesto = proyectoService.listarTipoSupuestoProyectoByIdTipoPy(py.getIdTipoProyecto());
		List<TipoDependenciaProyectoModel> tipoDependencia = proyectoService.listarTipoDependenciaProyectoByIdTipoPy(py.getIdTipoProyecto());
		List<TipoFormaPago> formaPagoList = planificacionService.listarFormasPago();
		Long idProyecto = Long.parseLong(index);
		List<Entregable> entregableList = planificacionService.listarEntregablesProyectoId(idProyecto);
		List<FormasPagoModel> formaPagoDetalleList = planificacionService.listarFormaPagoIdProyecto(idProyecto);
		List<DetalleRiesgosModel> riesgoDetalleList = planificacionService.listarDetalleRiesgosIdProyecto(idProyecto);
		List<CategoriaAdquisicion> categoriaAdquisicionList = administracionService.listarCategAdquisicion();		
		List<DetalleAdquisicionProyecto> detalleAdquisicionList = planificacionService.listarDetalleAdquisicionIdProyecto(idProyecto);
		List<TipoRol> listTipoRolProveedor = proyectoService.listarTipoRolByTipoRol(TIPO_ROL_PROVEEDOR);
        List<TipoRol> listTipoRolCliente= proyectoService.listarTipoRolByTipoRol(TIPO_ROL_CLIENTE);               
		List<TipoCostoOperativo> tipoCostoOperativoList = administracionService.listarCostoOperativo();
		List<DetalleCostoOperativoModel> detalleCostoOperativoList = planificacionService.listarDetalleCostoOperativoIdProyecto(idProyecto);
		
		Gson gSon = new Gson();
		String listaDetalleFormaPagoString = gSon.toJson(formaPagoDetalleList);
		String listaDetalleRiesgoString = gSon.toJson(riesgoDetalleList);
		String listaDetalleAdquisicionString = gSon.toJson(detalleAdquisicionList);
		String listaDetalleCostoOperativoString = gSon.toJson(detalleCostoOperativoList);
		 
		myModel.put("codigoPy", index);		
		myModel.put("listaTipoRequisito", tipoReqPy);
		myModel.put("listaTipoSupuesto", tipoSupuesto);
		myModel.put("listaTipoDependencia", tipoDependencia);
		myModel.put("listaFormaPago", formaPagoList);
		myModel.put("listaEntregable", entregableList);
		myModel.put("listaTipoRolProveedor", listTipoRolProveedor);
        myModel.put("listaTipoRolCliente", listTipoRolCliente);
		myModel.put("listaDetalleFormaPagoBD", listaDetalleFormaPagoString);
		myModel.put("listaDetalleRiesgoBD", listaDetalleRiesgoString);
		myModel.put("listaCategoriaAdquisicion", categoriaAdquisicionList);
		myModel.put("listaDetalleAdquisicionBD", listaDetalleAdquisicionString);
		myModel.put("listaTipoCostoOperativo", tipoCostoOperativoList);
		myModel.put("listaDetalleCostoOperativoBD", listaDetalleCostoOperativoString);
		myModel.put("listaTipoRolProveedor", listTipoRolProveedor);
        myModel.put("listaTipoRolCliente", listTipoRolCliente);
				
//      INI - ALCANCE - CARGA DATA
        List<RequisitoProyectoPlanificacionModel> listaTipoRequisito = new ArrayList<RequisitoProyectoPlanificacionModel>();
        listaTipoRequisito = this.proyectoService.listarTipoRequisitoByIdProyecto(Long.parseLong(index));
        List<ExclusionPlanificacionModel> listaExclusion = new ArrayList<ExclusionPlanificacionModel>();
        listaExclusion = this.proyectoService.listarExclusionByIdProyecto(Long.parseLong(index));
        List<SupuestoPlanificacionModel> listaSupuesto = new ArrayList<SupuestoPlanificacionModel>();
        listaSupuesto = this.proyectoService.listarSupuestoByIdProyecto(Long.parseLong(index));
        List<DependenciaPlanificacionModel> listaDependencia = new ArrayList<DependenciaPlanificacionModel>();
        listaDependencia = this.proyectoService.listarDependenciaByIdProyecto(Long.parseLong(index));
        List<FactorExitoPlanificacionModel> listaFactorExito = new ArrayList<FactorExitoPlanificacionModel>();
        listaFactorExito = this.proyectoService.listarFactorCriticoByIdProyecto(Long.parseLong(index));
        String listaTipoRequisitoString = gSon.toJson(listaTipoRequisito);
        String listaExclusionString = gSon.toJson(listaExclusion);
        String listaSupuestoString = gSon.toJson(listaSupuesto);
        String listaDependenciaString = gSon.toJson(listaDependencia);
        String listaFactorExitoString = gSon.toJson(listaFactorExito);
        myModel.put("listaTipoRequisitoBD", listaTipoRequisitoString);
        myModel.put("listaExclusionBD", listaExclusionString);
        myModel.put("listaSupuestoBD", listaSupuestoString);
        myModel.put("listaDependenciaBD", listaDependenciaString);
        myModel.put("listaFactorExitoBD", listaFactorExitoString);
 
        myModel.put("descripcionProductoProyecto", py.getDescripcionProductoProyecto());
        myModel.put("alcanceInicial", py.getAlcanceProyecto());
//      FIN - ALCANCE - CARGA DATA
        
//      INI - RECURSOS HUMANOS - CARGA DATA
        List<DetalleRolProyecto> listaDetalleRolProyectoProveedor = planificacionService.listarDetalleRolProyectoByIdProyectoByTipoRol(idProyecto, new Long(TIPO_ROL_PROVEEDOR));
        String listaDetalleRolProyectoProveedorBDString = gSon.toJson(listaDetalleRolProyectoProveedor);
        myModel.put("listaDetalleRolProyectoProveedorBD", listaDetalleRolProyectoProveedorBDString);
        
        List<DetalleRolProyecto> listaDetalleRolProyectoCliente = planificacionService.listarDetalleRolProyectoByIdProyectoByTipoRol(idProyecto, new Long(TIPO_ROL_CLIENTE));
        String listaDetalleRolProyectoClienteBDString = gSon.toJson(listaDetalleRolProyectoCliente);
        myModel.put("listaDetalleRolProyectoClienteBD", listaDetalleRolProyectoClienteBDString);
        
        List<DetalleRolProyecto> listaDetalleRolProyectoProveedorResponsabilidad = planificacionService.listarDetalleRolProyectoByIdProyectoByTipoRolResponsabilidad(idProyecto, new Long(TIPO_ROL_PROVEEDOR));
        String listaDetalleRolProyectoProveedorResponsabilidadString = gSon.toJson(listaDetalleRolProyectoProveedorResponsabilidad);
        myModel.put("listaDetalleRolProyectoProveedorResponsabilidadBD", listaDetalleRolProyectoProveedorResponsabilidadString);
        List<DetalleRolProyecto> listaDetalleRolProyectoClienteResponsabilidad = planificacionService.listarDetalleRolProyectoByIdProyectoByTipoRolResponsabilidad(idProyecto, new Long(TIPO_ROL_CLIENTE));
        String listaDetalleRolProyectoClienteResponsabilidadString = gSon.toJson(listaDetalleRolProyectoClienteResponsabilidad);
        myModel.put("listaDetalleRolProyectoClienteResponsabilidadBD", listaDetalleRolProyectoClienteResponsabilidadString);        
//      FIN - RECURSOS HUMANOS - CARGA DATA   
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
	
	@RequestMapping(value = "/guardarDetalleRiesgos.htm", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> guardarDetalleRiesgos(@RequestBody DetalleRiesgosModel detalleRiesgosModel, HttpServletRequest request) {
		logger.info("INI - PlanificacionController.guardarDetalleRiesgos");
		Map<String, String> respuesta =  new HashMap<String, String>();
		respuesta.put("respuesta", "OK");
		detalleRiesgosModel.setEstado(ESTADO_ACTIVO);
		
		try {
			planificacionService.guardarDetalleRiesgos(detalleRiesgosModel);
			respuesta.put("idDetalleRiesgos", detalleRiesgosModel.getIdDetalleRiesgos().toString());			
		} catch (Exception e) {
			logger.error("ERROR - PlanificacionController.guardarFormaPago", e);
			respuesta.put("respuesta", "ERROR");
		}
		
		logger.info("FIN - PlanificacionController.guardarDetalleRiesgos");
		return respuesta;	
	}
	
	@RequestMapping(value = "/eliminarDetalleRiesgos.htm", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> eliminarDetalleRiesgos(@RequestBody DetalleRiesgosModel detalleRiesgosModel, HttpServletRequest request) {		
		logger.info("INI - PlanificacionController.eliminarDetalleRiesgos");
		Map<String, String> respuesta =  new HashMap<String, String>();
		respuesta.put("respuesta", "OK");
		
		try {
			planificacionService.eliminarDetalleRiesgos(detalleRiesgosModel);			
			
		} catch (Exception e) {
			logger.error("ERROR - PlanificacionController.guardarFormaPago", e);
			respuesta.put("respuesta", "ERROR");
		}
		
		logger.info("FIN - PlanificacionController.eliminarDetalleRiesgos");
		return respuesta;	
	}
	
	@RequestMapping(value = "/guardarDetalleAdquisicion.htm", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> guardarDetalleAdquisicion(@RequestBody DetalleAdquisicionProyecto detalleAdquisicionProyecto, HttpServletRequest request) {
		logger.info("INI - PlanificacionController.guardarDetalleAdquisicion");
		Map<String, String> respuesta =  new HashMap<String, String>();
		respuesta.put("respuesta", "OK");
		
		detalleAdquisicionProyecto.setIdestadoadquisicion(ESTADO_ADQUISICION_PENDIENTE);
		detalleAdquisicionProyecto.setEstado(ESTADO_ACTIVO);
		detalleAdquisicionProyecto.setIdresponsable(null);
		try {
			ejecucionService.mntAdquisiciones(detalleAdquisicionProyecto);			
			respuesta.put("id", detalleAdquisicionProyecto.getId().toString());			
		} catch (Exception e) {
			logger.error("ERROR - PlanificacionController.guardarFormaPago", e);
			respuesta.put("respuesta", "ERROR");
		}
		
		logger.info("FIN - PlanificacionController.guardarDetalleAdquisicion");
		return respuesta;	
	}
	
	@RequestMapping(value = "/eliminarDetalleAdquisicion.htm", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> eliminarDetalleAdquisicion(@RequestBody DetalleAdquisicionProyecto detalleAdquisicionProyecto, HttpServletRequest request) {		
		logger.info("INI - PlanificacionController.eliminarDetalleAdquisicion");
		Map<String, String> respuesta =  new HashMap<String, String>();
		respuesta.put("respuesta", "OK");
		int id = Integer.parseInt(detalleAdquisicionProyecto.getId().toString());
		try {
			ejecucionService.eliminarAdquisiciones(id);						
		} catch (Exception e) {
			logger.error("ERROR - PlanificacionController.eliminarDetalleAdquisicion", e);
			respuesta.put("respuesta", "ERROR");
		}
		
		logger.info("FIN - PlanificacionController.eliminarDetalleAdquisicion");
		return respuesta;	
	}
	
//  INI - RECURSOS HUMANOS
    @RequestMapping(value = "/guardarRolProveedor.htm", method = RequestMethod.POST)
    public @ResponseBody Map<String, String> guardarRolProveedor(@RequestBody DetalleRolProyecto detalleRolProyecto, HttpServletRequest request) {
        logger.info("INI - PlanificacionController.guardarRolProveedor");
        Map<String, String> respuesta =  new HashMap<String, String>();
        respuesta.put("respuesta", "OK");
        detalleRolProyecto.setEstado(ESTADO_ACTIVO);
         
        try {
            planificacionService.guardarDetalleRolProyecto(detalleRolProyecto);
            respuesta.put("idTipoRolProveedor", detalleRolProyecto.getId().toString());           
        } catch (Exception e) {
            logger.error("ERROR - PlanificacionController.guardarRolProveedor", e);
            respuesta.put("respuesta", "ERROR");
        }
        
        logger.info("FIN - PlanificacionController.guardarRolProveedor");
        return respuesta;   
    }
    
    @RequestMapping(value = "/deleteTipoRolProveedor.htm", method = RequestMethod.POST)
    public @ResponseBody Map<String, String> deleteTipoRolProveedor(@RequestBody DetalleRolProyecto detalleRolProyecto, HttpServletRequest request) {     
        logger.info("INI - PlanificacionController.deleteTipoRolProveedor");
        Map<String, String> respuesta =  new HashMap<String, String>();
        respuesta.put("respuesta", "OK");   
        
        try {
            planificacionService.eliminarDetalleRolProyecto(detalleRolProyecto);            
            
        } catch (Exception e) {
            logger.error("ERROR - PlanificacionController.deleteTipoRolProveedor", e);
            respuesta.put("respuesta", "ERROR");
        }
        
        logger.info("FIN - PlanificacionController.deleteTipoRolProveedor");
        return respuesta;   
    }
    
    @RequestMapping(value = "/actualizarDescripcionTipoRol.htm", method = RequestMethod.POST)
    public @ResponseBody Map<String, String> actualizarDescripcionTipoRol(@RequestBody DetalleRolProyecto detalleRolProyecto, HttpServletRequest request) {
        logger.info("INI - PlanificacionController.actualizarDescripcionTipoRol");
        Map<String, String> respuesta =  new HashMap<String, String>();
        respuesta.put("respuesta", "OK");
        detalleRolProyecto.setEstado(ESTADO_ACTIVO);
         
        try {
            planificacionService.actualizarDescripcionTipoRol(detalleRolProyecto);
//            respuesta.put("idTipoRolProveedor", detalleRolProyecto.getId().toString());           
        } catch (Exception e) {
            logger.error("ERROR - PlanificacionController.actualizarDescripcionTipoRol", e);
            respuesta.put("respuesta", "ERROR");
        }
        
        logger.info("FIN - PlanificacionController.actualizarDescripcionTipoRol");
        return respuesta;   
    }
    
    @RequestMapping(value = "/actualizarRolProveedorResponsabilidad.htm", method = RequestMethod.POST)
    public @ResponseBody String actualizarRolProveedorResponsabilidad(@RequestBody DetalleRolProyecto detalleRolProyecto, HttpServletRequest request) {
        logger.info("INI - PlanificacionController.actualizarRolProveedorResponsabilidad");
        String respuesta = "ERROR";
         
        try {
        	List<DetalleRolProyecto> listaDetalleRolProyectoProveedorResponsabilidad = planificacionService.listarDetalleRolProyectoByIdProyectoByTipoRolResponsabilidad(detalleRolProyecto.getIdProyecto(), new Long(TIPO_ROL_PROVEEDOR));
        	Gson gSon = new Gson();
            String listaDetalleRolProyectoProveedorResponsabilidadString = gSon.toJson(listaDetalleRolProyectoProveedorResponsabilidad);
            respuesta = listaDetalleRolProyectoProveedorResponsabilidadString;          
        } catch (Exception e) {
            logger.error("ERROR - PlanificacionController.actualizarRolProveedorResponsabilidad", e);
            respuesta = "ERROR";
        }
        
        logger.info("FIN - PlanificacionController.actualizarRolProveedorResponsabilidad");
        return respuesta;   
    }  
    
    @RequestMapping(value = "/actualizarRolClienteResponsabilidad.htm", method = RequestMethod.POST)
    public @ResponseBody String actualizarRolClienteResponsabilidad(@RequestBody DetalleRolProyecto detalleRolProyecto, HttpServletRequest request) {
        logger.info("INI - PlanificacionController.actualizarRolClienteResponsabilidad");
        String respuesta = "ERROR";
         
        try {
        	List<DetalleRolProyecto> listaDetalleRolProyectoClienteResponsabilidad = planificacionService.listarDetalleRolProyectoByIdProyectoByTipoRolResponsabilidad(detalleRolProyecto.getIdProyecto(), new Long(TIPO_ROL_CLIENTE));
        	Gson gSon = new Gson();
            String listaDetalleRolProyectoClienteResponsabilidadString = gSon.toJson(listaDetalleRolProyectoClienteResponsabilidad);
            respuesta = listaDetalleRolProyectoClienteResponsabilidadString;          
        } catch (Exception e) {
            logger.error("ERROR - PlanificacionController.actualizarRolClienteResponsabilidad", e);
            respuesta = "ERROR";
        }
        
        logger.info("FIN - PlanificacionController.actualizarRolClienteResponsabilidad");
        return respuesta;   
    } 
//  FIN - RECURSOS HUMANOS
    
//  INI - BTN EJECUTAR
    @RequestMapping(value = "/validacionEjecutarProyecto.htm", method = RequestMethod.POST)
    public @ResponseBody String validacionEjecutarProyecto(@RequestBody Long idProyecto, HttpServletRequest request) {
        logger.info("INI - PlanificacionController.validacionEjecutarProyecto");
        String respuesta = "";
        Gson gSon = new Gson();
         
        try {
        	String respuestaString = planificacionService.validacionejecutarproyecto(idProyecto);        	
            respuesta = gSon.toJson(respuestaString);            
        	
        } catch (Exception e) {
            logger.error("ERROR - PlanificacionController.validacionEjecutarProyecto", e);            
            respuesta = gSon.toJson("ERROR");
        }
        
        logger.info("FIN - PlanificacionController.validacionEjecutarProyecto");
        return respuesta;   
    }    
    
    @RequestMapping(value = "/ejecutarEjecucion.htm", method = RequestMethod.POST)
    public @ResponseBody String ejecutarEjecucion(@RequestBody Map ejecucionModel, HttpServletRequest request) {
        logger.info("INI - PlanificacionController.ejecutarEjecucion");
        String respuesta = "ERROR";
        Gson gSon = new Gson();
        
        try {
        	Long idProyecto = Long.parseLong(ejecucionModel.get("idProyecto").toString());        	        	
        	SimpleDateFormat formatter = new SimpleDateFormat("dd/mm/yyyy");
			Date fechaAprobacion = formatter.parse(ejecucionModel.get("fechaAprobacion").toString());			
        	planificacionService.ejecutarEjecucion(idProyecto, fechaAprobacion);        	
            respuesta = gSon.toJson("OK");
        	
        } catch (Exception e) {
            logger.error("ERROR - PlanificacionController.ejecutarEjecucion", e);
            respuesta = gSon.toJson("ERROR");
        }
        
        logger.info("FIN - PlanificacionController.ejecutarEjecucion");
        return respuesta;   
    }         
    
//  FIN - BTN EJECUTAR

@RequestMapping(value = "/guardarDetalleCostoOperativo.htm", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> guardarDetalleCostoOperativo(@RequestBody DetalleCostoOperativoModel detalleCostoOperativoModel, HttpServletRequest request) {
		logger.info("INI - PlanificacionController.guardarDetalleCostoOperativo");
		Map<String, String> respuesta =  new HashMap<String, String>();
		respuesta.put("respuesta", "OK");			
		detalleCostoOperativoModel.setEstado(ESTADO_ACTIVO);
		
		try {
			planificacionService.guardarDetalleCostoOperativo(detalleCostoOperativoModel);			
			respuesta.put("idCostoOperativo", detalleCostoOperativoModel.getIdCostoOperativo().toString());			
		} catch (Exception e) {
			logger.error("ERROR - PlanificacionController.guardarDetalleCostoOperativo", e);
			respuesta.put("respuesta", "ERROR");
		}
		
		logger.info("FIN - PlanificacionController.guardarDetalleCostoOperativo");
		return respuesta;	
	}
	
	@RequestMapping(value = "/eliminarDetalleCostoOperativo.htm", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> eliminarDetalleCostoOperativo(@RequestBody DetalleCostoOperativoModel detalleCostoOperativoModel, HttpServletRequest request) {		
		logger.info("INI - PlanificacionController.eliminarDetalleCostoOperativo");
		Map<String, String> respuesta =  new HashMap<String, String>();
		respuesta.put("respuesta", "OK");
		
		try {
			planificacionService.eliminarDetalleCostoOperativo(detalleCostoOperativoModel);						
		} catch (Exception e) {
			logger.error("ERROR - PlanificacionController.eliminarDetalleCostoOperativo", e);
			respuesta.put("respuesta", "ERROR");
		}
		
		logger.info("FIN - PlanificacionController.eliminarDetalleCostoOperativo");
		return respuesta;	
	}
	
}