package com.sigcomt.gestionProyectos.repositorio.anteproyecto;

import java.util.List;
import java.util.Map;

import com.sigcomt.gestionProyectos.dominio.administracion.DetalleProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.Proyecto;
import com.sigcomt.gestionProyectos.model.anteproyecto.BuscarAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.cierre.BuscarCierreModel;
import com.sigcomt.gestionProyectos.model.cierre.LstProyectoCierreModel;
import com.sigcomt.gestionProyectos.model.ejecucion.BuscarEjecucionModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstProyectoEjecucionModel;

public interface ProyectoDao {
	
	public List<Proyecto> listarProyectoByDetalleEstadoProyectoByEstado(Map<String, Object> params);
	public List<Proyecto> listarProyectoByEstado(int estado);
	public List<Proyecto> buscarProyectoByDetalleEstadoProyectoByEstado(BuscarAnteproyectoModel buscarAnteproyectoModel) ;
	public List<LstProyectoEjecucionModel> listaProyectoByEstadoEjecucion(BuscarEjecucionModel bqsProyecto);
	public List<LstProyectoCierreModel> listaProyectoByEstadoCierre(BuscarCierreModel bqsProyecto);
	
	public void actualizarProyecto(Proyecto proyecto);
	public void registrarDetallleProyecto(DetalleProyecto detalle);
	public void actualizarDetalleProyecto(DetalleProyecto detalle);
}
