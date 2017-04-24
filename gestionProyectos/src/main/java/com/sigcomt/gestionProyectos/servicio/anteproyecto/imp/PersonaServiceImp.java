package com.sigcomt.gestionProyectos.servicio.anteproyecto.imp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sigcomt.gestionProyectos.repositorio.anteproyecto.PersonaDao;
import com.sigcomt.gestionProyectos.servicio.anteproyecto.PersonaService;

@Service
public class PersonaServiceImp implements PersonaService{

	@Autowired
	PersonaDao personaDao;
	
	public List<Map> listarEjecutivoResponsableByEstadoByRol(int estado,
			Long idRol) throws Exception {
		Map params = new HashMap<String, Object>();
		params.put("estado", estado);
		params.put("idRol", idRol);
		return personaDao.listarEjecutivoResponsableByEstadoByRol(params);
	}

	public List<Map> listarInteresadoByEstadoByEmpresa(int estado,
			Long idEmpresa) throws Exception {
		Map params = new HashMap<String, Object>();
		params.put("estado", estado);
		params.put("idEmpresa", idEmpresa);
		return personaDao.listarInteresadoByEstadoByEmpresa(params);
	}

}
