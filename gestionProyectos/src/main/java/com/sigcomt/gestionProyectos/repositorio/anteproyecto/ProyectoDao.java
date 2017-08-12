package com.sigcomt.gestionProyectos.repositorio.anteproyecto;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.sigcomt.gestionProyectos.dominio.administracion.DetalleEstadoProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.DetalleProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.Entregable;
import com.sigcomt.gestionProyectos.dominio.administracion.Proyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoFormaPago;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoRol;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleAdquisicionProyecto;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleRolProyecto;
import com.sigcomt.gestionProyectos.model.administracion.TipoDependenciaProyectoModel;
import com.sigcomt.gestionProyectos.model.administracion.TipoRequisitoProyectoModel;
import com.sigcomt.gestionProyectos.model.administracion.TipoSupuestoProyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.AgregarAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.AnexosAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.BuscarAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.DetProyectoUserRolModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.InteresadoAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.ObservacionesAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.cierre.BuscarCierreModel;
import com.sigcomt.gestionProyectos.model.cierre.LstProyectoCierreModel;
import com.sigcomt.gestionProyectos.model.ejecucion.BuscarEjecucionModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstProyectoEjecucionModel;
import com.sigcomt.gestionProyectos.model.planificacion.AgregarPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.DependenciaPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.DetalleRiesgosModel;
import com.sigcomt.gestionProyectos.model.planificacion.ExclusionPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.FactorExitoPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.FormasPagoModel;
import com.sigcomt.gestionProyectos.model.planificacion.RequisitoProyectoPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.SupuestoPlanificacionModel;

public interface ProyectoDao {
	
	public List<Proyecto> listarProyectoByDetalleEstadoProyectoByEstado(Map<String, Object> params);
	public List<Proyecto> listarProyectoByEstado(int estado);
	public List<Proyecto> buscarProyectoByDetalleEstadoProyectoByEstado(BuscarAnteproyectoModel buscarAnteproyectoModel) ;
	public List<LstProyectoEjecucionModel> listaProyectoByEstadoEjecucion(BuscarEjecucionModel bqsProyecto);
	public List<LstProyectoCierreModel> listaProyectoByEstadoCierre(BuscarCierreModel bqsProyecto);
	
	public void actualizarProyecto(Proyecto proyecto);
	public void registrarDetallleProyecto(DetalleProyecto detalle);
	public void actualizarDetalleProyecto(DetalleProyecto detalle);
	
	public void grabarProyectoByEstado(Proyecto proyecto);
    public void grabarDetalleEstadoProyectoByEstado(DetalleEstadoProyecto detalleEstadoProyecto);
    public DetalleEstadoProyecto buscarByIdPyByEstPyByEst (AgregarAnteproyectoModel agregarAnteproyectoModel);
    public void actualizarDetalleEstadoProyecto(DetalleEstadoProyecto detalleEstadoProyecto);
    public Proyecto buscarPyByCodPy(String codigoPy);
    public void actualizarProyectoByEstado(Proyecto proyecto);
    public Proyecto buscarPyByIdPy(Long idPy);
    public void eliminarDetalleInteresado(AgregarAnteproyectoModel agregarAnteproyectoModel);
    public void insertarListaDetalleInteresado(@Param("interesados") List<InteresadoAnteproyectoModel> interesadoAnteproyectoModel);
    public void eliminarDetalleArchivoByTipoArchivoByIdPy(AgregarAnteproyectoModel agregarAnteproyectoModel);
    public void insertarListaDetalleObservaciones(@Param("observaciones") List<ObservacionesAnteproyectoModel> observacionesAnteproyectoModel);
    public void insertarListaDetalleAnexo(@Param("anexos") List<AnexosAnteproyectoModel> anexosAnteproyectoModel);
    public AgregarAnteproyectoModel buscarProyectoById(Long idPy);
    
    public List<InteresadoAnteproyectoModel> listarInteresadosByIdProyecto(Long idPy);
    public List<ObservacionesAnteproyectoModel> listarObservacionesByIdProyecto(Map<String, Object> params);
    public List<AnexosAnteproyectoModel> listarAnexosByIdProyecto(Map<String, Object> params);
    
    public DetProyectoUserRolModel listarDetPyUserRolByPyByUserRol(DetProyectoUserRolModel detProyectoUserRolModel);
    public void grabarDetPyUserRol(DetProyectoUserRolModel detProyectoUserRolModel);
    
//  INI - PLANIFICACION
    public void actualizarProyectoByIdPy(AgregarPlanificacionModel agregarPlanificacionModel);
    public List<TipoRequisitoProyectoModel> listarTipoRequisitoProyectoByIdTipoPy(Long idTipoPy);
    public List<TipoSupuestoProyectoModel> listarTipoSupuestoProyectoByIdTipoPy(Long idTipoPy);
    public List<TipoDependenciaProyectoModel> listarTipoDependenciaProyectoByIdTipoPy(Long idTipoPy);
    public void insertarListaDetalleTipoRequisito(@Param("tipoRequisitos") List<RequisitoProyectoPlanificacionModel> requisitoProyectoPlanificacionModel);
    public void insertarListaDetalleExclusion(@Param("exclusion") List<ExclusionPlanificacionModel> exclusionPlanificacionModel);
    public void insertarListaDetalleSupuesto(@Param("supuesto") List<SupuestoPlanificacionModel> supuestoPlanificacionModel);
    public void insertarListaDetalleDependencia(@Param("dependencia") List<DependenciaPlanificacionModel> dependenciaPlanificacionModel);
    public void insertarListaDetalleFactorExito(@Param("factorExito") List<FactorExitoPlanificacionModel> factorExitoPlanificacionModel);
    
    public List<RequisitoProyectoPlanificacionModel> listarTipoRequisitoByIdProyecto(Long idPy);
    public List<ExclusionPlanificacionModel> listarExclusionByIdProyecto(Long idPy);
    public List<SupuestoPlanificacionModel> listarSupuestoByIdProyecto(Long idPy);
    public List<DependenciaPlanificacionModel> listarDependenciaByIdProyecto(Long idPy);
    public List<FactorExitoPlanificacionModel> listarFactorCriticoByIdProyecto(Long idPy);
    
    public void eliminarDetalleTipoRequisitoByIdPy(Long idPy);
    public void eliminarDetalleExclusionByIdPy(Long idPy);
    public void eliminarDetalleSupuestoByIdPy(Long idPy);
    public void eliminarDetalleDependenciaByIdPy(Long idPy);
    public void eliminarDetalleFactorCriticoByIdPy(Long idPy);
    
    public List<TipoFormaPago> listarFormasPago();
    public List<Entregable> listarEntregablesProyectoId(Long idProyecto);
    public void guardarFormaPago(FormasPagoModel formasPagoModel);
    public void eliminarFormaPago(FormasPagoModel formasPagoModel);
    public List<FormasPagoModel> listarFormaPagoIdProyecto(Long idProyecto);
    
    public void guardarDetalleRiesgos(DetalleRiesgosModel detalleRiesgosModel);
    public void eliminarDetalleRiesgos(DetalleRiesgosModel detalleRiesgosModel);
    public List<DetalleRiesgosModel> listarDetalleRiesgosIdProyecto(Long idProyecto);
    
    public List<DetalleAdquisicionProyecto> listarDetalleAdquisicionIdProyecto(Long idProyecto);
    
    public List<TipoRol> listarTipoRolByTipoRol(int tipoRol);
    
    public void guardarDetalleRolProyecto(DetalleRolProyecto detalleRolProyecto);
    public void eliminarDetalleRolProyecto(DetalleRolProyecto detalleRolProyecto);    
    public List<DetalleRolProyecto> listarDetalleRolProyectoByIdProyectoByTipoRol(Map<String, Object> params);
    public List<DetalleRolProyecto> listarDetalleRolProyectoByIdProyectoByTipoRolResponsabilidad(Map<String, Object> params);   
    public void actualizarDescripcionTipoRol(DetalleRolProyecto detalleRolProyecto);
//  FIN - PLANIFICACION
    
}
