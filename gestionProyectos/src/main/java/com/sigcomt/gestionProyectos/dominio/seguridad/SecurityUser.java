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
	
	private Long id_user;
	
	private String username;
	
	private String password;

	/**
	 * @return the id_user
	 */
	public Long getId_user() {
		return id_user;
	}

	/**
	 * @param id_user the id_user to set
	 */
	public void setId_user(Long id_user) {
		this.id_user = id_user;
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "SecurityUser [id_user=" + id_user + ", username=" + username
				+ ", password=" + password + "]";
	}
	
	
}
