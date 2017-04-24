package com.sigcomt.gestionProyectos.repositorio.anteproyecto;

import java.util.List;
import java.util.Map;

public interface PersonaDao {
	
	public List<Map> listarEjecutivoResponsableByEstadoByRol(Map<String, Object> params)throws Exception;
	
	public List<Map> listarInteresadoByEstadoByEmpresa(Map<String, Object> params)throws Exception;

}
