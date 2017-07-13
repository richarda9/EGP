/**
 * 
 */
package com.sigcomt.gestionProyectos.dominio.seguridad;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

/**
 * @author Fernando Ochoa
 *
 */

@SuppressWarnings("serial")
public class CustomerUser extends User {
	
	private Long idRolUser;
	private String nombres;

	public CustomerUser(String username, String password, boolean enabled,
			boolean accountNonExpired, boolean credentialsNonExpired,
			boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities, Long idRolUser, String nombres) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired,
				accountNonLocked, authorities);
		
		this.idRolUser = idRolUser;
		this.nombres = nombres;
	}

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
}
