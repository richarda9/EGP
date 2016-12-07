package com.sigcomt.gestionProyectos.repositorio.administracion;

import java.util.List;

import com.sigcomt.gestionProyectos.dominio.administracion.TipoProyecto;

public interface AdministracionDao 
{
	public void registrarTipoProyecto(TipoProyecto param);
	public List<TipoProyecto> listarTipoProyecto();
	public void eliminarTipoProyecto(Integer id);
	public int buscarTipoProyecto(TipoProyecto param);

}
