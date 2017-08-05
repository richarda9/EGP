package com.sigcomt.gestionProyectos.servicio.planificacion;

import com.sigcomt.gestionProyectos.model.planificacion.AgregarPlanificacionModel;

public interface PlanificacionService {
	
	public String guardarAlcance (AgregarPlanificacionModel agregarPlanificacionModel) throws Exception;

}
