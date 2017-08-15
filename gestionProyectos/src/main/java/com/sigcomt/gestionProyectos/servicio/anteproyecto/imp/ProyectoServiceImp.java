package com.sigcomt.gestionProyectos.servicio.anteproyecto.imp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import com.sigcomt.gestionProyectos.repositorio.anteproyecto.ProyectoDao;
import com.sigcomt.gestionProyectos.servicio.anteproyecto.ProyectoService;

@Service
public class ProyectoServiceImp implements ProyectoService {
	
	@Autowired
	ProyectoDao proyectoDao;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Proyecto> listarProyectoByDetalleEstadoProyectoByEstado(
			int estado, Long idEstadoProyecto) throws Exception {
		Map params = new HashMap<String, Object>();
		params.put("estado", estado);
		params.put("idEstadoProyecto", idEstadoProyecto);
		
		return proyectoDao.listarProyectoByDetalleEstadoProyectoByEstado(params);
	}

	public List<Proyecto> buscarProyectoByDetalleEstadoProyectoByEstado(
			BuscarAnteproyectoModel buscarAnteproyectoModel) throws Exception {
		return proyectoDao.buscarProyectoByDetalleEstadoProyectoByEstado(buscarAnteproyectoModel);
	}
	
	public List<Proyecto> listarProyectoByEstado(int estado)
	{
		return proyectoDao.listarProyectoByEstado(estado);
	}

	public List<LstProyectoEjecucionModel> listaProyectoByEstadoEjecucion(BuscarEjecucionModel bqsProyecto) 
	{
		return proyectoDao.listaProyectoByEstadoEjecucion(bqsProyecto);
	}

	public List<LstProyectoCierreModel> listaProyectoByEstadoCierre(BuscarCierreModel bqsProyecto) 
	{
		return proyectoDao.listaProyectoByEstadoCierre(bqsProyecto);
	}

	public List<InteresadoAnteproyectoModel> listarInteresadosByIdProyecto(
			Long idProyecto) {
		
		return proyectoDao.listarInteresadosByIdProyecto(idProyecto);
	}

	public List<ObservacionesAnteproyectoModel> listarObservacionesByIdProyecto(
			Long idProyecto, Long idTipoArch) {
		Map params = new HashMap<String, Object>();
		params.put("idPy", idProyecto);
		params.put("idTipoArch", idTipoArch);
		
		return proyectoDao.listarObservacionesByIdProyecto(params);
	}

	public List<AnexosAnteproyectoModel> listarAnexosByIdProyecto(
			Long idProyecto, Long idTipoArch) {
		Map params = new HashMap<String, Object>();
		params.put("idPy", idProyecto);
		params.put("idTipoArch", idTipoArch);
		
		return proyectoDao.listarAnexosByIdProyecto(params);
	}

	public void actualizarProyectoByIdPy(
			AgregarPlanificacionModel agregarPlanificacionModel) {
		proyectoDao.actualizarProyectoByIdPy(agregarPlanificacionModel);		
	}

	public Proyecto buscarPyByIdPy(Long idPy) {
		
		return proyectoDao.buscarPyByIdPy(idPy);
	}

	public List<TipoRequisitoProyectoModel> listarTipoRequisitoProyectoByIdTipoPy(
			Long idTipoPy) {
		return proyectoDao.listarTipoRequisitoProyectoByIdTipoPy(idTipoPy);
	}

	public List<TipoSupuestoProyectoModel> listarTipoSupuestoProyectoByIdTipoPy(
			Long idTipoPy) {
		return proyectoDao.listarTipoSupuestoProyectoByIdTipoPy(idTipoPy);
	}

	public List<TipoDependenciaProyectoModel> listarTipoDependenciaProyectoByIdTipoPy(
			Long idTipoPy) {
		return proyectoDao.listarTipoDependenciaProyectoByIdTipoPy(idTipoPy);
	}

	public List<RequisitoProyectoPlanificacionModel> listarTipoRequisitoByIdProyecto(
			Long idPy) {
		return proyectoDao.listarTipoRequisitoByIdProyecto(idPy);
	}

	public List<ExclusionPlanificacionModel> listarExclusionByIdProyecto(
			Long idPy) {
		return proyectoDao.listarExclusionByIdProyecto(idPy);
	}

	public List<SupuestoPlanificacionModel> listarSupuestoByIdProyecto(Long idPy) {
		return proyectoDao.listarSupuestoByIdProyecto(idPy);
	}

	public List<DependenciaPlanificacionModel> listarDependenciaByIdProyecto(
			Long idPy) {
		return proyectoDao.listarDependenciaByIdProyecto(idPy);
	}

	public List<FactorExitoPlanificacionModel> listarFactorCriticoByIdProyecto(
			Long idPy) {
		return proyectoDao.listarFactorCriticoByIdProyecto(idPy);
	}

	public List<TipoRol> listarTipoRolByTipoRol(int tipoRol) {
		return proyectoDao.listarTipoRolByTipoRol(tipoRol);
	}

}
