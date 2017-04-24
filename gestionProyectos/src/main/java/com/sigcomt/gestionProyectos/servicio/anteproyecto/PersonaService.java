package com.sigcomt.gestionProyectos.servicio.anteproyecto;

import java.util.List;
import java.util.Map;

public interface PersonaService {
	
	public List<Map> listarEjecutivoResponsableByEstadoByRol(int estado, Long idRol)throws Exception;
	
	public List<Map> listarInteresadoByEstadoByEmpresa(int estado, Long idEmpresa)throws Exception;

}
