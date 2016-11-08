/**
 * 
 */
package com.sigcomt.gestionProyectos.controlador.home;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
		return new ModelAndView("bienvenida");
	}

}
