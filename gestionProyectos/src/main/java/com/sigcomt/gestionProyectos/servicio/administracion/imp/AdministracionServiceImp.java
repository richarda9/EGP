package com.sigcomt.gestionProyectos.servicio.administracion.imp;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sigcomt.gestionProyectos.dominio.administracion.EstadoProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoRequisito;
import com.sigcomt.gestionProyectos.repositorio.administracion.AdministracionDao;
import com.sigcomt.gestionProyectos.servicio.administracion.AdministracionService;

@Service
public class AdministracionServiceImp implements AdministracionService
{
	@Autowired
	AdministracionDao administracionDao;

	//[INI] TIPO PROYECTO
	public int registrarTipoProyecto(TipoProyecto param) {
		
		int ind = administracionDao.buscarTipoProyecto(param);
		
		if(ind == 0){
			administracionDao.registrarTipoProyecto(param);
		}
		
		return ind;
	}

	public List<TipoProyecto> listarTipoProyecto() {
		return administracionDao.listarTipoProyecto();
	}
	
	public void eliminarTipoProyecto(Integer param) {
		administracionDao.eliminarTipoProyecto(param);
	}
	//[FIN] TIPO PROYECTO

	//[INI] ESTADO PROYECTO
	public int registrarEstadoProyecto(EstadoProyecto param) {
		
		int ind = administracionDao.buscarEstadoProyecto(param);
		
		if(ind == 0){
			administracionDao.registrarEstadoProyecto(param);
		}
		
		return ind;
	}

	public List<EstadoProyecto> listarEstadoProyecto() {
		return administracionDao.listarEstadoProyecto();
	}
	
	public void eliminarEstadoProyecto(Integer param) {
		administracionDao.eliminarEstadoProyecto(param);
	}
	//[FIN] ESTADO PROYECTO

	//[INI] TIPO REQUISITO
	public int registrarTipoRequisitoProyecto(TipoRequisito param) {
		int ind = administracionDao.buscarTipoRequisitoProyecto(param);
		
		if(ind == 0){
			administracionDao.registrarTipoRequisitoProyecto(param);
		}
		
		return ind;
	}

	public List<HashMap> listarTipoRequisitoProyecto() {
		return administracionDao.listarTipoRequisitoProyecto();
	}

	public void eliminarTipoRequisitoProyecto(Integer id) {
		administracionDao.eliminarTipoRequisitoProyecto(id);
	}
	//[FIN] TIPO REQUISITO

}
