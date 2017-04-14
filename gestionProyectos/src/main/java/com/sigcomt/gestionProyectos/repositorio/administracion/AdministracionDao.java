package com.sigcomt.gestionProyectos.repositorio.administracion;

import java.util.HashMap;
import java.util.List;

import com.sigcomt.gestionProyectos.dominio.administracion.Empresa;
import com.sigcomt.gestionProyectos.dominio.administracion.EstadoProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoRequisito;

public interface AdministracionDao 
{
	//[INI] TIPO PROYECTO
	public void registrarTipoProyecto(TipoProyecto param);
	public List<TipoProyecto> listarTipoProyecto();
	public List<TipoProyecto> listarTipoProyectoByEsado(int estado);
	public void eliminarTipoProyecto(Integer id);
	public int buscarTipoProyecto(TipoProyecto param);
	//[FIN] TIPO PROYECTO
	
	//[INI] ESTADO PROYECTO
	public void registrarEstadoProyecto(EstadoProyecto param);
	public List<EstadoProyecto> listarEstadoProyecto();
	public void eliminarEstadoProyecto(Integer id);
	public int buscarEstadoProyecto(EstadoProyecto param);
	//[FIN] ESTADO PROYECTO
		
	//[INI] ESTADO PROYECTO
	public void registrarTipoRequisitoProyecto(TipoRequisito param);
	public List<HashMap> listarTipoRequisitoProyecto();
	public void eliminarTipoRequisitoProyecto(Integer id);
	public int buscarTipoRequisitoProyecto(TipoRequisito param);
	//[FIN] ESTADO PROYECTO
	
//	INI - EMPRESA
	public List<Empresa> listarEmpresaByEstado(int estado);
//	FIN - EMPRESA

}
