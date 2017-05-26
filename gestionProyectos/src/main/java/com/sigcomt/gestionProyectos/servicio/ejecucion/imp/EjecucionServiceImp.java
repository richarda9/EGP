package com.sigcomt.gestionProyectos.servicio.ejecucion.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sigcomt.gestionProyectos.dominio.administracion.Rol;
import com.sigcomt.gestionProyectos.repositorio.ejecucion.EjecucionDao;
import com.sigcomt.gestionProyectos.servicio.ejecucion.EjecucionService;

@Service
public class EjecucionServiceImp implements EjecucionService
{
	@Autowired
	EjecucionDao ejecucionDao;
	
	public List<Rol> listarTipoRol(int tiporol){
		return ejecucionDao.listarTipoRol(tiporol);
	}
}
