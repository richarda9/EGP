package com.sigcomt.gestionProyectos.model.anteproyecto;

import java.io.Serializable;

public class DetProyectoUserRolModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long idProyecto;
	private Long idUserRol;
	private Long idDetProyectoUser;
	private int estado;
	
	public Long getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}
	public Long getIdUserRol() {
		return idUserRol;
	}
	public void setIdUserRol(Long idUserRol) {
		this.idUserRol = idUserRol;
	}
	public Long getIdDetProyectoUser() {
		return idDetProyectoUser;
	}
	public void setIdDetProyectoUser(Long idDetProyectoUser) {
		this.idDetProyectoUser = idDetProyectoUser;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}	
}
