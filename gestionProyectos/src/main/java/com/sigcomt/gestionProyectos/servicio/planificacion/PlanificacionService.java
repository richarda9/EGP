package com.sigcomt.gestionProyectos.servicio.planificacion;

import java.util.List;

import com.sigcomt.gestionProyectos.dominio.administracion.Entregable;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoFormaPago;
import com.sigcomt.gestionProyectos.model.planificacion.AgregarPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.FormasPagoModel;

public interface PlanificacionService {
	
	public String guardarAlcance (AgregarPlanificacionModel agregarPlanificacionModel) throws Exception;
	public List<TipoFormaPago> listarFormasPago();
    public List<Entregable> listarEntregablesProyectoId(Long idProyecto);
    public void guardarFormaPago(FormasPagoModel formasPagoModel);
    public void eliminarFormaPago(FormasPagoModel formasPagoModel);
    public List<FormasPagoModel> listarFormaPagoIdProyecto(Long idProyecto);
    

}
