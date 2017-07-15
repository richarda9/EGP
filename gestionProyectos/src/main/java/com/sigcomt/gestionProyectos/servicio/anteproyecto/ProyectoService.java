package com.sigcomt.gestionProyectos.servicio.anteproyecto;

import java.util.List;

import com.sigcomt.gestionProyectos.dominio.administracion.Proyecto;
import com.sigcomt.gestionProyectos.model.anteproyecto.AnexosAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.BuscarAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.InteresadoAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.ObservacionesAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.cierre.BuscarCierreModel;
import com.sigcomt.gestionProyectos.model.cierre.LstProyectoCierreModel;
import com.sigcomt.gestionProyectos.model.ejecucion.BuscarEjecucionModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstProyectoEjecucionModel;

public interface ProyectoService {
	
	public List<Proyecto> listarProyectoByDetalleEstadoProyectoByEstado(int estado, Long idEstadoProyecto) throws Exception;	
	public List<Proyecto> buscarProyectoByDetalleEstadoProyectoByEstado(BuscarAnteproyectoModel buscarAnteproyectoModel) throws Exception;
	public List<Proyecto> listarProyectoByEstado(int estado);
	public List<LstProyectoEjecucionModel> listaProyectoByEstadoEjecucion(BuscarEjecucionModel bqsProyecto);
	public List<LstProyectoCierreModel> listaProyectoByEstadoCierre(BuscarCierreModel bqsProyecto);
	public List<InteresadoAnteproyectoModel> listarInteresadosByIdProyecto(Long idProyecto);
	public List<ObservacionesAnteproyectoModel> listarObservacionesByIdProyecto(Long idProyecto, Long idTipoArch);
	public List<AnexosAnteproyectoModel> listarAnexosByIdProyecto(Long idProyecto, Long idTipoArch);	
	
}
