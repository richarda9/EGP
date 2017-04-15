package com.sigcomt.gestionProyectos.servicio.anteproyecto;

import java.util.List;

import com.sigcomt.gestionProyectos.dominio.administracion.Proyecto;

public interface ProyectoService {
	
	public List<Proyecto> listarProyectoByDetalleEstadoProyectoByEstado(int estado, Long idEstadoProyecto) throws Exception;

}
