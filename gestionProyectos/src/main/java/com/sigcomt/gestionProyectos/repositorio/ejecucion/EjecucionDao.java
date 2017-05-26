package com.sigcomt.gestionProyectos.repositorio.ejecucion;

import java.util.List;

import com.sigcomt.gestionProyectos.dominio.administracion.Rol;


public interface EjecucionDao 
{
	public List<Rol> listarTipoRol(int tiporol);
}
