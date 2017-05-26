package com.sigcomt.gestionProyectos.controlador.cierre;

import java.io.IOException;
import java.util.ArrayList;
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

import com.sigcomt.gestionProyectos.common.Constantes;
import com.sigcomt.gestionProyectos.dominio.administracion.EstadoProyecto;
import com.sigcomt.gestionProyectos.model.cierre.BuscarCierreModel;
import com.sigcomt.gestionProyectos.model.cierre.LstProyectoCierreModel;
import com.sigcomt.gestionProyectos.servicio.administracion.AdministracionService;
import com.sigcomt.gestionProyectos.servicio.anteproyecto.ProyectoService;

@Controller
@RequestMapping(value = "/cierre")
public class CierreController 
{
	protected final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private AdministracionService administracionService;
	
	@Autowired
	private ProyectoService proyectoService;
	
	@RequestMapping(value = "/cierre.htm")
	public ModelAndView cierre(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		List<EstadoProyecto> lista = new ArrayList<EstadoProyecto>();
		List<EstadoProyecto> listaAux = this.administracionService.listarEstadoProyecto();
		if(listaAux != null && listaAux.size() > 0)
			for (EstadoProyecto estadoProyecto : listaAux) {
				if(estadoProyecto.getDescripcion().equalsIgnoreCase("Ejecucion")  || 
						estadoProyecto.getDescripcion().equalsIgnoreCase("Cierre"))
					lista.add(estadoProyecto);
			}
		
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("listaTipoProyecto", this.administracionService.listarTipoProyectoByEsado(Constantes.ESTADO_ACTIVO));
		myModel.put("listaEstadoProyecto", lista);
		myModel.put("listaCliente", this.administracionService.listarEmpresaByEstado(Constantes.ESTADO_ACTIVO));
		
		return new ModelAndView("cierre", "model", myModel);
	}
	
	@RequestMapping(value = "/mntCierre.htm")
	public ModelAndView mntCierre(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		String index = request.getParameter("idcierre");
//		myModel.put("listaTipoProyecto", this.administracionService.listarTipoProyecto());
//		myModel.put("listaEstadoProyecto", this.administracionService.listarEstadoProyecto());
//		myModel.put("listaTipoRequisito", this.administracionService.listarTipoRequisitoProyecto());
		
		return new ModelAndView("mntCierre", "model", myModel);
	}
	
	@RequestMapping(value = "/listar_proyectoCierre.htm", method = RequestMethod.POST)
	public @ResponseBody List<LstProyectoCierreModel> listarProyectoCierre(@RequestBody BuscarCierreModel bsqProyectoCierre)  
	{
		return proyectoService.listaProyectoByEstadoCierre(bsqProyectoCierre);
	}
}
