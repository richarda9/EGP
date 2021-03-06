package com.sigcomt.gestionProyectos.servicio.planificacion.imp;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sigcomt.gestionProyectos.common.Constantes;
import com.sigcomt.gestionProyectos.common.enumerations.EstadoEntregableEnum;
import com.sigcomt.gestionProyectos.common.enumerations.EstadoProyectoEnum;
import com.sigcomt.gestionProyectos.dominio.administracion.DetalleEstadoProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.Entregable;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoFormaPago;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleAdquisicionProyecto;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleRolProyecto;
import com.sigcomt.gestionProyectos.dominio.planificacion.DetalleEntregableProyecto;
import com.sigcomt.gestionProyectos.model.planificacion.AgregarPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.BandaSalarialModel;
import com.sigcomt.gestionProyectos.model.planificacion.DependenciaPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.DetalleBandaSalarialModel;
import com.sigcomt.gestionProyectos.model.planificacion.DetalleCostoOperativoModel;
import com.sigcomt.gestionProyectos.model.planificacion.DetalleCostoProyecto;
import com.sigcomt.gestionProyectos.model.planificacion.DetalleRiesgosModel;
import com.sigcomt.gestionProyectos.model.planificacion.EntregableModel;
import com.sigcomt.gestionProyectos.model.planificacion.ExclusionPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.FactorExitoPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.FormasPagoModel;
import com.sigcomt.gestionProyectos.model.planificacion.RequisitoProyectoPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.SupuestoPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.TipoNivelModel;
import com.sigcomt.gestionProyectos.repositorio.anteproyecto.ProyectoDao;
import com.sigcomt.gestionProyectos.servicio.planificacion.PlanificacionService;

@Service
public class PlanificacionServiceImp implements PlanificacionService{

	@Autowired
	ProyectoDao proyectoDao;
	
	@Transactional
	public String guardarAlcance(
			AgregarPlanificacionModel agregarPlanificacionModel)
			throws Exception {
		String respuesta = "ERROR";
		
		proyectoDao.actualizarProyectoByIdPy(agregarPlanificacionModel);
		
		proyectoDao.eliminarDetalleTipoRequisitoByIdPy(agregarPlanificacionModel.getIdProyecto());
        for (int i = 0; i < agregarPlanificacionModel.getListaTipoRequisito().size(); i++) {
            RequisitoProyectoPlanificacionModel requisitoProyectoPlanificacionModel = agregarPlanificacionModel.getListaTipoRequisito().get(i);
            requisitoProyectoPlanificacionModel.setIdProyecto(agregarPlanificacionModel.getIdProyecto());
        }
        proyectoDao.insertarListaDetalleTipoRequisito(agregarPlanificacionModel.getListaTipoRequisito());
        
        proyectoDao.eliminarDetalleExclusionByIdPy(agregarPlanificacionModel.getIdProyecto());
        for (int i = 0; i < agregarPlanificacionModel.getListaExclusion().size(); i++) {
            ExclusionPlanificacionModel exclusionPlanificacionModel = agregarPlanificacionModel.getListaExclusion().get(i);
            exclusionPlanificacionModel.setIdProyecto(agregarPlanificacionModel.getIdProyecto());
        }
        proyectoDao.insertarListaDetalleExclusion(agregarPlanificacionModel.getListaExclusion());
        
        proyectoDao.eliminarDetalleSupuestoByIdPy(agregarPlanificacionModel.getIdProyecto());
        for (int i = 0; i < agregarPlanificacionModel.getListaSupuesto().size(); i++) {
            SupuestoPlanificacionModel supuestoPlanificacionModel = agregarPlanificacionModel.getListaSupuesto().get(i);
            supuestoPlanificacionModel.setIdProyecto(agregarPlanificacionModel.getIdProyecto());
        }
        proyectoDao.insertarListaDetalleSupuesto(agregarPlanificacionModel.getListaSupuesto());
        
        proyectoDao.eliminarDetalleDependenciaByIdPy(agregarPlanificacionModel.getIdProyecto());
        for (int i = 0; i < agregarPlanificacionModel.getListaDependencia().size(); i++) {
            DependenciaPlanificacionModel dependenciaPlanificacionModel = agregarPlanificacionModel.getListaDependencia().get(i);
            dependenciaPlanificacionModel.setIdProyecto(agregarPlanificacionModel.getIdProyecto());
        }
        proyectoDao.insertarListaDetalleDependencia(agregarPlanificacionModel.getListaDependencia());
        
        proyectoDao.eliminarDetalleFactorCriticoByIdPy(agregarPlanificacionModel.getIdProyecto());
        for (int i = 0; i < agregarPlanificacionModel.getListaFactorExito().size(); i++) {
            FactorExitoPlanificacionModel factorExitoPlanificacionModel = agregarPlanificacionModel.getListaFactorExito().get(i);
            factorExitoPlanificacionModel.setIdProyecto(agregarPlanificacionModel.getIdProyecto());
        }
        proyectoDao.insertarListaDetalleFactorExito(agregarPlanificacionModel.getListaFactorExito());
                
        respuesta = "OK";
        return respuesta;
	}
	
	public List<TipoFormaPago> listarFormasPago(){
		return proyectoDao.listarFormasPago();
	}
	
    public List<Entregable> listarEntregablesProyectoId(Long idProyecto){
    	return proyectoDao.listarEntregablesProyectoId(idProyecto);
    }

    @Transactional
	public void guardarFormaPago(FormasPagoModel formasPagoModel) {
		proyectoDao.guardarFormaPago(formasPagoModel);		
	}
	
    @Transactional
	public void eliminarFormaPago(FormasPagoModel formasPagoModel) {
		proyectoDao.eliminarFormaPago(formasPagoModel);		
	}

	public List<FormasPagoModel> listarFormaPagoIdProyecto(Long idProyecto) {		
		return proyectoDao.listarFormaPagoIdProyecto(idProyecto);
	}

	@Transactional
	public void guardarDetalleRiesgos(DetalleRiesgosModel detalleRiesgosModel) {
		proyectoDao.guardarDetalleRiesgos(detalleRiesgosModel);			
	}

	@Transactional
	public void eliminarDetalleRiesgos(DetalleRiesgosModel detalleRiesgosModel) {
		proyectoDao.eliminarDetalleRiesgos(detalleRiesgosModel);			
	}

	public List<DetalleRiesgosModel> listarDetalleRiesgosIdProyecto(Long idProyecto) {
		return proyectoDao.listarDetalleRiesgosIdProyecto(idProyecto);
	}

	public List<DetalleAdquisicionProyecto> listarDetalleAdquisicionIdProyecto(Long idProyecto) {		
		return proyectoDao.listarDetalleAdquisicionIdProyecto(idProyecto);
	}
	
	@Transactional
    public void guardarDetalleRolProyecto(DetalleRolProyecto detalleRolProyecto) {
        proyectoDao.guardarDetalleRolProyecto(detalleRolProyecto);  
        
//      INI - GRABAR DETALLE_COSTO_PROYECTO, ROL UNO POR UNO
        for (int i = 0; i < detalleRolProyecto.getCantidad(); i++) {
        	DetalleCostoProyecto detalleCostoProyecto = new DetalleCostoProyecto();
        	detalleCostoProyecto.setIdDetalleRolProyecto(detalleRolProyecto.getId());
        	detalleCostoProyecto.setIdProyecto(detalleRolProyecto.getIdProyecto());
        	detalleCostoProyecto.setEstado(1);
        	proyectoDao.guardarDetalleCostoProyecto(detalleCostoProyecto);
		}
//      FIN - GRABAR DETALLE_COSTO_PROYECTO, ROL UNO POR UNO
        
    }
 
    @Transactional
    public void eliminarDetalleRolProyecto(DetalleRolProyecto detalleRolProyecto) {
        
//    	INI - ELIMINAR DETALLE COSTO PROYECTO, POR ID ROL
    	DetalleCostoProyecto detalleCostoProyecto = new DetalleCostoProyecto();
        detalleCostoProyecto.setIdDetalleRolProyecto(detalleRolProyecto.getId());
        proyectoDao.eliminarDetalleCostoProyecto(detalleCostoProyecto);
//    	FIN - ELIMINAR DETALLE COSTO PROYECTO, POR ID ROL
        
    	proyectoDao.eliminarDetalleRolProyecto(detalleRolProyecto); 
        
    }
 
    @SuppressWarnings({ "rawtypes", "unchecked" })
	public List<DetalleRolProyecto> listarDetalleRolProyectoByIdProyectoByTipoRol(
            Long idProyecto, Long tipoRol) {
        
        Map params = new HashMap<String, Object>();
        params.put("idProyecto", idProyecto);
        params.put("tipoRol", tipoRol);
        
        return proyectoDao.listarDetalleRolProyectoByIdProyectoByTipoRol(params);
        
    }

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<DetalleRolProyecto> listarDetalleRolProyectoByIdProyectoByTipoRolResponsabilidad(
			Long idProyecto, Long tipoRol) {
		
		Map params = new HashMap<String, Object>();
        params.put("idProyecto", idProyecto);
        params.put("tipoRol", tipoRol);
		return proyectoDao.listarDetalleRolProyectoByIdProyectoByTipoRolResponsabilidad(params);
	}

	public void actualizarDescripcionTipoRol(
			DetalleRolProyecto detalleRolProyecto) {
		proyectoDao.actualizarDescripcionTipoRol(detalleRolProyecto);
	}

	public String validacionejecutarproyecto(Long idProyecto) {
		String respuesta = "";
		respuesta = proyectoDao.validacionejecutarproyecto(idProyecto); 
		return respuesta;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Transactional
	public void ejecutarEjecucion(Long idProyecto, Date fechaAprobacion) {
		
		DetalleEstadoProyecto detalleEstadoProyectoAntepy = new DetalleEstadoProyecto();
		detalleEstadoProyectoAntepy.setEstado(0);
		detalleEstadoProyectoAntepy.setIdProyecto(idProyecto);	
//		detalleEstadoProyectoAntepy.setFechaCreacion(new Date());
		proyectoDao.actualizarDetalleEstadoProyectoByIdProyecto(detalleEstadoProyectoAntepy);
		
		Map params = new HashMap<String, Object>();
        params.put("idProyecto", idProyecto);
        params.put("idEstadoProyecto", Long.parseLong(EstadoProyectoEnum.EN_EJECUCION.getCodigo()));
        params.put("fechaCreacion", new Date());
        params.put("fechaAprobacion", fechaAprobacion);
        params.put("estado", 1);
		proyectoDao.ejecutarEjecucion(params);
		
	}

    @Transactional
	public void guardarDetalleCostoOperativo(DetalleCostoOperativoModel detalleCostoOperativoModel) {
		proyectoDao.guardarDetalleCostoOperativo(detalleCostoOperativoModel);		
	}
    
    @Transactional
	public void eliminarDetalleCostoOperativo(DetalleCostoOperativoModel detalleCostoOperativoModel) {
		proyectoDao.eliminarDetalleCostoOperativo(detalleCostoOperativoModel);		
	}
    
    @Transactional
	public List<DetalleCostoOperativoModel> listarDetalleCostoOperativoIdProyecto(Long idProyecto) {	
		return proyectoDao.listarDetalleCostoOperativoIdProyecto(idProyecto);
	}

    @Transactional
	public List<DetalleCostoProyecto> listarDetalleCostoProyectoByIdProyecto(
			Long idProyecto) {
		return proyectoDao.listarDetalleCostoProyectoByIdProyecto(idProyecto);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<TipoNivelModel> listarTipoNivel() {
		Map params = new HashMap<String, Object>();
        params.put("estado", 1);
		        
		return proyectoDao.listarTipoNivel(params);
	}

	public List<BandaSalarialModel> listarBandaSalarial(
			BandaSalarialModel bandaSalarialModel) {
		return proyectoDao.listarBandaSalarial(bandaSalarialModel);
	}

        @Transactional
	public Map<String, Object> guardarCostoProyecto(DetalleCostoProyecto detalleCostoProyecto) {

		Map<String, Object> respuesta = new HashMap<String, Object>();
		DetalleBandaSalarialModel detalleBandaSalarialModel = new DetalleBandaSalarialModel();
		detalleBandaSalarialModel.setEstado(1);
		detalleBandaSalarialModel.setIdDetalleBandaSalarial(detalleCostoProyecto.getIdBandaSalarial());
		detalleBandaSalarialModel = proyectoDao.obtenerDetalleBandaSalarialByIdBandaSalarial(detalleBandaSalarialModel);
		
		detalleCostoProyecto.setCosto(detalleBandaSalarialModel.getCostoBandaSalarial());
		detalleCostoProyecto.setIdBandaSalarial(detalleBandaSalarialModel.getIdDetalleBandaSalarial());
		proyectoDao.actualizarCostoProyectoByIdDetalleCostoProyecto(detalleCostoProyecto);
		
		Long costoPy = proyectoDao.obtenerCostosProyectoByIdProyecto(detalleCostoProyecto.getIdProyecto());
		String costoPorRol = String.valueOf(detalleBandaSalarialModel.getCostoBandaSalarial());
		
		respuesta.put("costoPy", costoPy);
		respuesta.put("costoPorRol", costoPorRol);
		return respuesta;
	}

	public Long obtenerCostosProyectoByIdProyecto(Long idProyecto) {
		
		Long costoPy = proyectoDao.obtenerCostosProyectoByIdProyecto(idProyecto);
		return costoPy;
	}

    //[INI] ENTREGABLE
    @Transactional
    public void mntEntregable(EntregableModel dato){
    	if(dato.getIdEntregableProyecto() == null){
    		dato.setIdEstadoEntregable(new Long(EstadoEntregableEnum.PENDIENTE.getCodigo()));
    		proyectoDao.insertarEntregable(dato);
    		
    		for (DetalleEntregableProyecto detalle : dato.getProducto()) {
    			detalle.setEstado(Constantes.ESTADO_ACTIVO);
    			detalle.setIdentregable(dato.getIdEntregableProyecto());
    			detalle.setIdproyecto(dato.getIdProyecto());
    			proyectoDao.insertarDetalleEntregableProducto(detalle);				
			}    		
    	}else{
    		proyectoDao.actualizarEntregable(dato);
    		
    		for (DetalleEntregableProyecto detalle : dato.getProducto()) {
    			detalle.setIdentregable(dato.getIdEntregableProyecto());
    			detalle.setIdproyecto(dato.getIdProyecto());
    			
    			if(detalle.getId() == null){
    				detalle.setEstado(Constantes.ESTADO_ACTIVO);
    				proyectoDao.insertarDetalleEntregableProducto(detalle);
    			}else
    				proyectoDao.actualizarDetalleEntregableProducto(detalle);				
			}     		
    	}
    }
    
    public void eliminarEntregable(Integer dato){
    	List<DetalleEntregableProyecto> lista = proyectoDao.listardetalleEntregableProyecto(dato);
    	
    	if(lista != null && lista.size() > 0){
    		for (DetalleEntregableProyecto objeto : lista) {
    			proyectoDao.eliminarDetalleEntregableProducto(objeto);				
			}
    		
    		proyectoDao.eliminarEntregable(dato);
    	}else{
    		proyectoDao.eliminarEntregable(dato);
    	}
    }
    
    public Entregable buscarEntregableProyecto(Entregable objeto){
    	return proyectoDao.buscarEntregableProyecto(objeto);
    }
    
    public List<DetalleEntregableProyecto> listarProductoEntregable(Entregable objeto){
    	return proyectoDao.listarProductoEntregable(objeto);
    }
    
    public void eliminarDetalleEntregableProducto(DetalleEntregableProyecto objeto){
    	proyectoDao.eliminarDetalleEntregableProducto(objeto);
    }
    //[INI] ENTREGABLE
		
}
