/**
 * 
 */
package com.sigcomt.gestionProyectos.controlador.home;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sigcomt.gestionProyectos.dominio.seguridad.CustomerUser;
import com.sigcomt.gestionProyectos.dominio.seguridad.UsuarioSesion;

/**
 * @author Fernando Ochoa
 *
 */

@Controller
@RequestMapping(value = "/home")
public class HomeController {
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	@RequestMapping(value = "/bienvenida.htm")
	public ModelAndView bienvenida(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		logger.debug("bienvenida.htm");
		
//		INI - VERIFICAR PARA UTILIZAR LA SESION DEL USUARIO
		CustomerUser auth = (CustomerUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UsuarioSesion usuarioSesion = new UsuarioSesion();
		usuarioSesion.setIdRolUser(auth.getIdRolUser());
		usuarioSesion.setNombres(auth.getNombres());
		usuarioSesion.setUsername(auth.getUsername());
//		FIN - VERIFICAR PARA UTILIZAR LA SESION DEL USUARIO		
		
		return new ModelAndView("bienvenida");
	}

}
