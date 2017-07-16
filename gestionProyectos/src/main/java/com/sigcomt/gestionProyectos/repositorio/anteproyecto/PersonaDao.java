package com.sigcomt.gestionProyectos.repositorio.anteproyecto;

import java.util.List;
import java.util.Map;

import com.sigcomt.gestionProyectos.dominio.administracion.Persona;

public interface PersonaDao {
	
	@SuppressWarnings("rawtypes")
	public List<Map> listarEjecutivoResponsableByEstadoByRol(Map<String, Object> params)throws Exception;
	
	@SuppressWarnings("rawtypes")
	public List<Map> listarInteresadoByEstadoByEmpresa(Map<String, Object> params)throws Exception;
	
	public void registrarPersona(Persona persona);
	public void editarPersona(Persona persona);
	public int buscarPersonabyTipobyNroDocumento(Persona persona);
	public void eliminarPersona(Integer id);
}
