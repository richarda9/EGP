package com.sigcomt.gestionProyectos.servicio.anteproyecto;

import java.util.List;
import com.sigcomt.gestionProyectos.dominio.administracion.Proyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoRol;
import com.sigcomt.gestionProyectos.model.administracion.TipoDependenciaProyectoModel;
import com.sigcomt.gestionProyectos.model.administracion.TipoRequisitoProyectoModel;
import com.sigcomt.gestionProyectos.model.administracion.TipoSupuestoProyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.AnexosAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.BuscarAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.InteresadoAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.ObservacionesAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.cierre.BuscarCierreModel;
import com.sigcomt.gestionProyectos.model.cierre.LstProyectoCierreModel;
import com.sigcomt.gestionProyectos.model.ejecucion.BuscarEjecucionModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstProyectoEjecucionModel;
import com.sigcomt.gestionProyectos.model.planificacion.AgregarPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.DependenciaPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.ExclusionPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.FactorExitoPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.RequisitoProyectoPlanificacionModel;
import com.sigcomt.gestionProyectos.model.planificacion.SupuestoPlanificacionModel;

public interface ProyectoService {
	
	public List<Proyecto> listarProyectoByDetalleEstadoProyectoByEstado(int estado, Long idEstadoProyecto) throws Exception;	
	public List<Proyecto> buscarProyectoByDetalleEstadoProyectoByEstado(BuscarAnteproyectoModel buscarAnteproyectoModel) throws Exception;
	public List<Proyecto> listarProyectoByEstado(int estado);
	public List<LstProyectoEjecucionModel> listaProyectoByEstadoEjecucion(BuscarEjecucionModel bqsProyecto);
	public List<LstProyectoCierreModel> listaProyectoByEstadoCierre(BuscarCierreModel bqsProyecto);
	public List<InteresadoAnteproyectoModel> listarInteresadosByIdProyecto(Long idProyecto);
	public List<ObservacionesAnteproyectoModel> listarObservacionesByIdProyecto(Long idProyecto, Long idTipoArch);
	public List<AnexosAnteproyectoModel> listarAnexosByIdProyecto(Long idProyecto, Long idTipoArch);	
	
//	INI - PLANIFICACION
	public void actualizarProyectoByIdPy(AgregarPlanificacionModel agregarPlanificacionModel);
	public Proyecto buscarPyByIdPy(Long idPy);
	public List<TipoRequisitoProyectoModel> listarTipoRequisitoProyectoByIdTipoPy(Long idTipoPy);
	public List<TipoSupuestoProyectoModel> listarTipoSupuestoProyectoByIdTipoPy(Long idTipoPy);
	public List<TipoDependenciaProyectoModel> listarTipoDependenciaProyectoByIdTipoPy(Long idTipoPy);
	
	public List<RequisitoProyectoPlanificacionModel> listarTipoRequisitoByIdProyecto(Long idPy);
    public List<ExclusionPlanificacionModel> listarExclusionByIdProyecto(Long idPy);
    public List<SupuestoPlanificacionModel> listarSupuestoByIdProyecto(Long idPy);
    public List<DependenciaPlanificacionModel> listarDependenciaByIdProyecto(Long idPy);
    public List<FactorExitoPlanificacionModel> listarFactorCriticoByIdProyecto(Long idPy);
    
    public List<TipoRol> listarTipoRolByTipoRol(int tipoRol);
//	FIN - PLANIFICACION
	
}
