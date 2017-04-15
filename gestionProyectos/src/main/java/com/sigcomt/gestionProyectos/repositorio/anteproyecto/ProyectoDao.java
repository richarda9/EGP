package com.sigcomt.gestionProyectos.repositorio.anteproyecto;

import java.util.List;
import java.util.Map;

import com.sigcomt.gestionProyectos.dominio.administracion.Proyecto;

public interface ProyectoDao {
	
	public List<Proyecto> listarProyectoByDetalleEstadoProyectoByEstado(Map<String, Object> params);

}
