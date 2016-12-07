package com.sigcomt.gestionProyectos.controlador.administracion;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sigcomt.gestionProyectos.dominio.administracion.TipoProyecto;
import com.sigcomt.gestionProyectos.servicio.administracion.AdministracionService;

@Controller
@RequestMapping(value = "/administracion")
public class AdministracionController 
{
	protected final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private AdministracionService administracionService;

	@RequestMapping(value = "/asociadoProyecto.htm")
	public ModelAndView asociadoProyecto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("listaTipoProyecto", this.administracionService.listarTipoProyecto());
		
		return new ModelAndView("asociadoProyecto", "model", myModel);
	}
	
	@RequestMapping(value = "/registrar_tipoProyecto.htm", method = RequestMethod.POST)
	public @ResponseBody int registrarTipoProyecto(@RequestBody TipoProyecto dato) 
	{
		int ind = administracionService.registrarTipoProyecto(dato); 
		return ind;
	}
	
	
	@RequestMapping(value = "/listar_tipoProyecto.htm", method = RequestMethod.POST)
	public @ResponseBody List<TipoProyecto> listarTipoProyecto(@RequestBody int dato) 
	{	
		return administracionService.listarTipoProyecto();
	}
	
	@RequestMapping(value = "/eliminar_tipoProyecto.htm", method = RequestMethod.POST)
	public @ResponseBody int eliminarTipoProyecto(@RequestBody Integer dato) 
	{
		administracionService.eliminarTipoProyecto(dato); 
		return 0;
	}
	

}
