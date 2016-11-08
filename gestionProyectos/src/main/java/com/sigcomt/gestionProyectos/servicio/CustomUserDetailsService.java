/**
 * 
 */
package com.sigcomt.gestionProyectos.servicio;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sigcomt.gestionProyectos.dominio.CustomerUser;
import com.sigcomt.gestionProyectos.dominio.SecurityUser;
import com.sigcomt.gestionProyectos.repositorio.seguridad.UsuarioDao;

/**
 * @author Fernando Ochoa
 *
 */

@Service
@Transactional (readOnly=true)
public class CustomUserDetailsService  implements UserDetailsService{
	
	@Autowired
	private UsuarioDao userDAO;

	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		List<SecurityUser> domainUser = (List<SecurityUser>) userDAO.getUser(username);
		
		Collection<GrantedAuthority> listaPrueba = new ArrayList<GrantedAuthority>();
		listaPrueba.add(new SimpleGrantedAuthority("ROL_ADMIN"));
		if(listaPrueba.size() > 0) System.out.println("entro: " + listaPrueba.toString());
		else System.out.println("NO ENTROOOOOOOOOOOOOOOOO");
			
		return new CustomerUser(domainUser.get(0).getUsername(), domainUser.get(0).getPassword(), true, true, true, true, listaPrueba);
	}

}
