package com.sigcomt.gestionProyectos.servicio.planificacion.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sigcomt.gestionProyectos.dominio.administracion.Entregable;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoFormaPago;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleAdquisicionProyecto;
import com.sigcomt.gestionProyectos.model.planificacion.AgregarPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.DependenciaPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.DetalleRiesgosModel;
import com.sigcomt.gestionProyectos.model.planificacion.ExclusionPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.FactorExitoPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.FormasPagoModel;
import com.sigcomt.gestionProyectos.model.planificacion.RequisitoProyectoPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.SupuestoPlanificacionModel;
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

	public void guardarFormaPago(FormasPagoModel formasPagoModel) {
		proyectoDao.guardarFormaPago(formasPagoModel);		
	}
	
	public void eliminarFormaPago(FormasPagoModel formasPagoModel) {
		proyectoDao.eliminarFormaPago(formasPagoModel);		
	}

	public List<FormasPagoModel> listarFormaPagoIdProyecto(Long idProyecto) {		
		return proyectoDao.listarFormaPagoIdProyecto(idProyecto);
	}

	public void guardarDetalleRiesgos(DetalleRiesgosModel detalleRiesgosModel) {
		proyectoDao.guardarDetalleRiesgos(detalleRiesgosModel);			
	}

	public void eliminarDetalleRiesgos(DetalleRiesgosModel detalleRiesgosModel) {
		proyectoDao.eliminarDetalleRiesgos(detalleRiesgosModel);			
	}

	public List<DetalleRiesgosModel> listarDetalleRiesgosIdProyecto(Long idProyecto) {
		return proyectoDao.listarDetalleRiesgosIdProyecto(idProyecto);
	}

	public List<DetalleAdquisicionProyecto> listarDetalleAdquisicionIdProyecto(Long idProyecto) {		
		return proyectoDao.listarDetalleAdquisicionIdProyecto(idProyecto);
	}
	
	
	
	

}
