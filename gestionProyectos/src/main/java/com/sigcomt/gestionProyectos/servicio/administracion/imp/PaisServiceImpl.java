package com.sigcomt.gestionProyectos.servicio.administracion.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sigcomt.gestionProyectos.dominio.administracion.Pais;
import com.sigcomt.gestionProyectos.repositorio.administracion.PaisDao;
import com.sigcomt.gestionProyectos.servicio.administracion.PaisService;

@Service
public class PaisServiceImpl implements PaisService {
	
	@Autowired
	PaisDao paisDao;

	public List<Pais> listarPais() {
		return paisDao.listarPais();
	}
}
