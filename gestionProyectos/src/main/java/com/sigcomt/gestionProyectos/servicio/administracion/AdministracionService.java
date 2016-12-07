package com.sigcomt.gestionProyectos.servicio.administracion;

import java.util.List;

import com.sigcomt.gestionProyectos.dominio.administracion.TipoProyecto;


public interface AdministracionService 
{
	public int registrarTipoProyecto(TipoProyecto param);
	public List<TipoProyecto> listarTipoProyecto();
	public void eliminarTipoProyecto(Integer id);

}
