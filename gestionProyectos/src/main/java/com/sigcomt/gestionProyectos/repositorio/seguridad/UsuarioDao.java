/**
 * 
 */
package com.sigcomt.gestionProyectos.repositorio.seguridad;

import java.util.List;

import com.sigcomt.gestionProyectos.dominio.SecurityUser;


/**
 * @author Fernando Ochoa
 *
 */
public interface UsuarioDao {
	
	public List<SecurityUser> getUser(String login);

}
