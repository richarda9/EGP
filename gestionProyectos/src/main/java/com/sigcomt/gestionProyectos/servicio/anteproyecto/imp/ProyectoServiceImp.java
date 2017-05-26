package com.sigcomt.gestionProyectos.servicio.anteproyecto.imp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sigcomt.gestionProyectos.dominio.administracion.Proyecto;
import com.sigcomt.gestionProyectos.model.anteproyecto.BuscarAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.cierre.BuscarCierreModel;
import com.sigcomt.gestionProyectos.model.cierre.LstProyectoCierreModel;
import com.sigcomt.gestionProyectos.model.ejecucion.BuscarEjecucionModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstProyectoEjecucionModel;
import com.sigcomt.gestionProyectos.repositorio.anteproyecto.ProyectoDao;
import com.sigcomt.gestionProyectos.servicio.anteproyecto.ProyectoService;

@Service
public class ProyectoServiceImp implements ProyectoService {
	
	@Autowired
	ProyectoDao proyectoDao;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Proyecto> listarProyectoByDetalleEstadoProyectoByEstado(
			int estado, Long idEstadoProyecto) throws Exception {
		Map params = new HashMap<String, Object>();
		params.put("estado", estado);
		params.put("idEstadoProyecto", idEstadoProyecto);
		
		return proyectoDao.listarProyectoByDetalleEstadoProyectoByEstado(params);
	}

	public List<Proyecto> buscarProyectoByDetalleEstadoProyectoByEstado(
			BuscarAnteproyectoModel buscarAnteproyectoModel) throws Exception {
		return proyectoDao.buscarProyectoByDetalleEstadoProyectoByEstado(buscarAnteproyectoModel);
	}
	
	public List<Proyecto> listarProyectoByEstado(int estado)
	{
		return proyectoDao.listarProyectoByEstado(estado);
	}

	public List<LstProyectoEjecucionModel> listaProyectoByEstadoEjecucion(BuscarEjecucionModel bqsProyecto) 
	{
		return proyectoDao.listaProyectoByEstadoEjecucion(bqsProyecto);
	}

	public List<LstProyectoCierreModel> listaProyectoByEstadoCierre(BuscarCierreModel bqsProyecto) 
	{
		return proyectoDao.listaProyectoByEstadoCierre(bqsProyecto);
	}

}
