package com.sigcomt.gestionProyectos.servicio.planificacion.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sigcomt.gestionProyectos.model.planificacion.AgregarPlanificacionModel;
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
		proyectoDao.insertarListaDetalleTipoRequisito(agregarPlanificacionModel.getListaTipoRequisito());
		proyectoDao.insertarListaDetalleExclusion(agregarPlanificacionModel.getListaExclusion());
		proyectoDao.insertarListaDetalleSupuesto(agregarPlanificacionModel.getListaSupuesto());
		proyectoDao.insertarListaDetalleDependencia(agregarPlanificacionModel.getListaDependencia());
		proyectoDao.insertarListaDetalleFactorExito(agregarPlanificacionModel.getListaFactorExito());
				
		respuesta = "OK";
		return respuesta;
	}

}
