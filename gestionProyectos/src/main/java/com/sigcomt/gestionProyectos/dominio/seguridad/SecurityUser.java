/**
 * 
 */
package com.sigcomt.gestionProyectos.dominio.seguridad;

import java.io.Serializable;

/**
 * @author Fernando Ochoa
 *
 */
public class SecurityUser  implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Long idRolUser;	
	private String rol;
	private String username;
	private String password;
	private String nombres;
	
	public Long getIdRolUser() {
		return idRolUser;
	}
	public void setIdRolUser(Long idRolUser) {
		this.idRolUser = idRolUser;
	}
	public String getRol() {
		return rol;
	}
	public void setRol(String rol) {
		this.rol = rol;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNombres() {
		return nombres;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}	
}
