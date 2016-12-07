package com.sigcomt.gestionProyectos.servicio.administracion.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sigcomt.gestionProyectos.dominio.administracion.TipoProyecto;
import com.sigcomt.gestionProyectos.repositorio.administracion.AdministracionDao;
import com.sigcomt.gestionProyectos.servicio.administracion.AdministracionService;

@Service
public class AdministracionServiceImp implements AdministracionService
{
	@Autowired
	AdministracionDao administracionDao;

	public void registrarTipoProyecto(TipoProyecto param) {
		
		int ind = administracionDao.buscarTipoProyecto(param);
		
		if(ind == 0){
			administracionDao.registrarTipoProyecto(param);
		}
	}

	public List<TipoProyecto> listarTipoProyecto() {
		return administracionDao.listarTipoProyecto();
	}
	
	public void eliminarTipoProyecto(Integer param) {
		administracionDao.eliminarTipoProyecto(param);
	}

}
