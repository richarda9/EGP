package com.sigcomt.gestionProyectos.servicio.anteproyecto;

import com.sigcomt.gestionProyectos.model.anteproyecto.AgregarAnteproyectoModel;

public interface AnteproyectoService {
	
	public String grabarAnteproyecto (AgregarAnteproyectoModel agregarAnteproyectoModel) throws Exception;
	public String planificarAnteproyecto (AgregarAnteproyectoModel agregarAnteproyectoModel) throws Exception;
	public AgregarAnteproyectoModel buscarProyectoById(Long idPy) throws Exception;

}
