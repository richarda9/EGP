package com.sigcomt.gestionProyectos.servicio.administracion;

import java.util.HashMap;
import java.util.List;

import com.sigcomt.gestionProyectos.dominio.administracion.EstadoProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoRequisito;


public interface AdministracionService 
{
	//[INI] TIPO PROYECTO
	public int registrarTipoProyecto(TipoProyecto param);
	public List<TipoProyecto> listarTipoProyecto();
	public void eliminarTipoProyecto(Integer id);
	//[FIN] TIPO PROYECTO
	
	//[INI] ESTADO PROYECTO
	public int registrarEstadoProyecto(EstadoProyecto param);
	public List<EstadoProyecto> listarEstadoProyecto();
	public void eliminarEstadoProyecto(Integer id);
	//[FIN] ESTADO PROYECTO
		
	//[INI] TIPO REQUISITO PROYECTO
	public int registrarTipoRequisitoProyecto(TipoRequisito param);
	public List<HashMap> listarTipoRequisitoProyecto();
	public void eliminarTipoRequisitoProyecto(Integer id);
	//[FIN] TIPO REQUISITO PROYECTO

}
