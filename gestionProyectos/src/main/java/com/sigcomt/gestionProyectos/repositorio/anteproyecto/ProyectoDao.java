package com.sigcomt.gestionProyectos.repositorio.anteproyecto;

import java.util.List;
import java.util.Map;

import com.sigcomt.gestionProyectos.dominio.administracion.Proyecto;
import com.sigcomt.gestionProyectos.model.anteproyecto.BuscarAnteproyectoModel;

public interface ProyectoDao {
	
	public List<Proyecto> listarProyectoByDetalleEstadoProyectoByEstado(Map<String, Object> params);
	public List<Proyecto> listarProyectoByEstado(int estado);
	

	public List<Proyecto> buscarProyectoByDetalleEstadoProyectoByEstado(BuscarAnteproyectoModel buscarAnteproyectoModel) ;
}
