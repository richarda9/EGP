package com.sigcomt.gestionProyectos.servicio.planificacion;

import java.util.List;

import com.sigcomt.gestionProyectos.dominio.administracion.Entregable;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoFormaPago;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleAdquisicionProyecto;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleRolProyecto;
import com.sigcomt.gestionProyectos.model.planificacion.AgregarPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.DetalleRiesgosModel;
import com.sigcomt.gestionProyectos.model.planificacion.FormasPagoModel;

public interface PlanificacionService {
	
	public String guardarAlcance (AgregarPlanificacionModel agregarPlanificacionModel) throws Exception;
	public List<TipoFormaPago> listarFormasPago();
    public List<Entregable> listarEntregablesProyectoId(Long idProyecto);
    
    public void guardarFormaPago(FormasPagoModel formasPagoModel);
    public void eliminarFormaPago(FormasPagoModel formasPagoModel);
    public List<FormasPagoModel> listarFormaPagoIdProyecto(Long idProyecto);
    
    public void guardarDetalleRiesgos(DetalleRiesgosModel detalleRiesgosModel);
    public void eliminarDetalleRiesgos(DetalleRiesgosModel detalleRiesgosModel);
    public List<DetalleRiesgosModel> listarDetalleRiesgosIdProyecto(Long idProyecto);
    
    public List<DetalleAdquisicionProyecto> listarDetalleAdquisicionIdProyecto(Long idProyecto);
    
//  INI - RECURSOS HUMANOS
    public void guardarDetalleRolProyecto(DetalleRolProyecto detalleRolProyecto);
    public void eliminarDetalleRolProyecto(DetalleRolProyecto detalleRolProyecto);    
    public List<DetalleRolProyecto> listarDetalleRolProyectoByIdProyectoByTipoRol(Long idProyecto, Long tipoRol);   
    public List<DetalleRolProyecto> listarDetalleRolProyectoByIdProyectoByTipoRolResponsabilidad(Long idProyecto, Long tipoRol);   
    public void actualizarDescripcionTipoRol(DetalleRolProyecto detalleRolProyecto);
//  FIN - RECURSOS HUMANOS
}
