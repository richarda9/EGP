package com.sigcomt.gestionProyectos.servicio.anteproyecto;

import java.util.List;

import com.sigcomt.gestionProyectos.dominio.administracion.Proyecto;
import com.sigcomt.gestionProyectos.model.anteproyecto.BuscarAnteproyectoModel;

public interface ProyectoService {
	
	public List<Proyecto> listarProyectoByDetalleEstadoProyectoByEstado(int estado, Long idEstadoProyecto) throws Exception;
	
	public List<Proyecto> buscarProyectoByDetalleEstadoProyectoByEstado(BuscarAnteproyectoModel buscarAnteproyectoModel) throws Exception;

	public List<Proyecto> listarProyectoByEstado(int estado);
}
