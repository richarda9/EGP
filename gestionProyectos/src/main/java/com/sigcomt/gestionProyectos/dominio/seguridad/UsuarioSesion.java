package com.sigcomt.gestionProyectos.dominio.seguridad;

import java.io.Serializable;

public class UsuarioSesion implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long idRolUser;
	private String nombres;
	private String username;
	
	public Long getIdRolUser() {
		return idRolUser;
	}
	public void setIdRolUser(Long idRolUser) {
		this.idRolUser = idRolUser;
	}
	public String getNombres() {
		return nombres;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
}
