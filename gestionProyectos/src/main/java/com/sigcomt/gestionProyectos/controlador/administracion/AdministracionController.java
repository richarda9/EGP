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

import com.sigcomt.gestionProyectos.dominio.administracion.EstadoProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoRequisito;
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
		myModel.put("listaEstadoProyecto", this.administracionService.listarEstadoProyecto());
		myModel.put("listaTipoRequisito", this.administracionService.listarTipoRequisitoProyecto());
		
		return new ModelAndView("asociadoProyecto", "model", myModel);
	}
	
	//[INI] TIPO PROYECTO
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
	//[FIN] TIPO PROYECTO
	
	//[INI] ESTADO PROYECTO
	@RequestMapping(value = "/registrar_estadoProyecto.htm", method = RequestMethod.POST)
	public @ResponseBody int registrarEstadoProyecto(@RequestBody EstadoProyecto dato) 
	{
		int ind = administracionService.registrarEstadoProyecto(dato); 
		return ind;
	}
	
	@RequestMapping(value = "/listar_estadoProyecto.htm", method = RequestMethod.POST)
	public @ResponseBody List<EstadoProyecto> listarEstadoProyecto(@RequestBody int dato) 
	{	
		return administracionService.listarEstadoProyecto();
	}
	
	@RequestMapping(value = "/eliminar_estadoProyecto.htm", method = RequestMethod.POST)
	public @ResponseBody int eliminarEstadoProyecto(@RequestBody Integer dato) 
	{
		administracionService.eliminarEstadoProyecto(dato); 
		return 0;
	}
	//[FIN] ESTADO PROYECTO
		
	//[INI] TIPO REQUISITO
	@RequestMapping(value = "/registrar_tipoRequisitoProyecto.htm", method = RequestMethod.POST)
	public @ResponseBody int registrarTipoRequisitoProyecto(@RequestBody TipoRequisito dato) 
	{
		int ind = administracionService.registrarTipoRequisitoProyecto(dato); 
		return ind;
	}
	
	@RequestMapping(value = "/listar_tipoRequisitoProyecto.htm", method = RequestMethod.POST)
	public @ResponseBody HashMap listarTipoRequisitoProyecto(@RequestBody int dato) 
	{	
		return administracionService.listarTipoRequisitoProyecto();
	}
	
	@RequestMapping(value = "/eliminar_tipoRequisitoProyecto.htm", method = RequestMethod.POST)
	public @ResponseBody int eliminarTipoRequisitoProyecto(@RequestBody Integer dato) 
	{
		administracionService.eliminarTipoRequisitoProyecto(dato); 
		return 0;
	}
	//[FIN] TIPO REQUISITO

	@RequestMapping(value = "/asociadoEntregable.htm")
	public ModelAndView asociadoEntregable(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("listaTipoProyecto", this.administracionService.listarTipoProyecto());
		myModel.put("listaEstadoProyecto", this.administracionService.listarEstadoProyecto());
		myModel.put("listaTipoRequisito", this.administracionService.listarTipoRequisitoProyecto());
		
		return new ModelAndView("asociadoEntregable", "model", myModel);
	}

	@RequestMapping(value = "/tipoCambio.htm")
	public ModelAndView tipoCambio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("listaTipoProyecto", this.administracionService.listarTipoProyecto());
		myModel.put("listaEstadoProyecto", this.administracionService.listarEstadoProyecto());
		myModel.put("listaTipoRequisito", this.administracionService.listarTipoRequisitoProyecto());
		
		return new ModelAndView("tipoCambio", "model", myModel);
	}
}
