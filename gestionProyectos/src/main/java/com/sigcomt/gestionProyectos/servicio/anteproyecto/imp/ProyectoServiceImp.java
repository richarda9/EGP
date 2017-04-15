package com.sigcomt.gestionProyectos.servicio.anteproyecto.imp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sigcomt.gestionProyectos.dominio.administracion.Proyecto;
import com.sigcomt.gestionProyectos.repositorio.anteproyecto.ProyectoDao;
import com.sigcomt.gestionProyectos.servicio.anteproyecto.ProyectoService;

@Service
public class ProyectoServiceImp implements ProyectoService {
	
	@Autowired
	ProyectoDao proyectoDao;

	public List<Proyecto> listarProyectoByDetalleEstadoProyectoByEstado(
			int estado, Long idEstadoProyecto) throws Exception {
		Map params = new HashMap<String, Object>();
		params.put("estado", estado);
		params.put("idEstadoProyecto", idEstadoProyecto);
		
		return proyectoDao.listarProyectoByDetalleEstadoProyectoByEstado(params);
	}

}
