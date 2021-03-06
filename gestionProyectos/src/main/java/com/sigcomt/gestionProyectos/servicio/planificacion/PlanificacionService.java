package com.sigcomt.gestionProyectos.servicio.planificacion;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.sigcomt.gestionProyectos.dominio.administracion.Entregable;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoFormaPago;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleAdquisicionProyecto;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleRolProyecto;
import com.sigcomt.gestionProyectos.dominio.planificacion.DetalleEntregableProyecto;
import com.sigcomt.gestionProyectos.model.planificacion.AgregarPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.BandaSalarialModel;
import com.sigcomt.gestionProyectos.model.planificacion.DetalleCostoOperativoModel;
import com.sigcomt.gestionProyectos.model.planificacion.DetalleCostoProyecto;
import com.sigcomt.gestionProyectos.model.planificacion.DetalleRiesgosModel;
import com.sigcomt.gestionProyectos.model.planificacion.EntregableModel;
import com.sigcomt.gestionProyectos.model.planificacion.FormasPagoModel;
import com.sigcomt.gestionProyectos.model.planificacion.TipoNivelModel;

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
    
    public void guardarDetalleCostoOperativo(DetalleCostoOperativoModel detalleCostoOperativoModel);
    public void eliminarDetalleCostoOperativo(DetalleCostoOperativoModel detalleCostoOperativoModel);
    public List<DetalleCostoOperativoModel> listarDetalleCostoOperativoIdProyecto(Long idProyecto);
    
//  INI - RECURSOS HUMANOS
    public void guardarDetalleRolProyecto(DetalleRolProyecto detalleRolProyecto);
    public void eliminarDetalleRolProyecto(DetalleRolProyecto detalleRolProyecto);    
    public List<DetalleRolProyecto> listarDetalleRolProyectoByIdProyectoByTipoRol(Long idProyecto, Long tipoRol);   
    public List<DetalleRolProyecto> listarDetalleRolProyectoByIdProyectoByTipoRolResponsabilidad(Long idProyecto, Long tipoRol);   
    public void actualizarDescripcionTipoRol(DetalleRolProyecto detalleRolProyecto);
//  FIN - RECURSOS HUMANOS
    
    public String validacionejecutarproyecto(Long idProyecto);
    public void ejecutarEjecucion(Long idProyecto, Date fechaAprobacion);
    
//  INI - COSTOS DEL PROYECTO
    public List<DetalleCostoProyecto> listarDetalleCostoProyectoByIdProyecto(Long idProyecto);   
    public List<TipoNivelModel> listarTipoNivel();
    public List<BandaSalarialModel> listarBandaSalarial(BandaSalarialModel bandaSalarialModel);  
    public Map<String, Object> guardarCostoProyecto(DetalleCostoProyecto detalleCostoProyecto);    
    public Long obtenerCostosProyectoByIdProyecto(Long idProyecto);
//  FIN - COSTOS DEL PROYECTO
    
   //[INI] ENTREGABLES
   public void mntEntregable(EntregableModel dato);
   public void eliminarEntregable(Integer dato);
   public Entregable buscarEntregableProyecto(Entregable objeto);
   public List<DetalleEntregableProyecto> listarProductoEntregable(Entregable objeto);
   public void eliminarDetalleEntregableProducto(DetalleEntregableProyecto objeto);
   //[FIN] ENTREGABLES
    
}
