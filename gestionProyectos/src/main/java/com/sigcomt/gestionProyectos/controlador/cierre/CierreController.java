package com.sigcomt.gestionProyectos.controlador.cierre;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sigcomt.gestionProyectos.common.Constantes;
import com.sigcomt.gestionProyectos.dominio.administracion.EstadoProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.Proyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.Sponsor;
import com.sigcomt.gestionProyectos.model.cierre.BuscarCierreModel;
import com.sigcomt.gestionProyectos.model.cierre.LstActaCierreModel;
import com.sigcomt.gestionProyectos.model.cierre.LstLeccionAprendidaModel;
import com.sigcomt.gestionProyectos.model.cierre.LstProyectoCierreModel;
import com.sigcomt.gestionProyectos.model.cierre.MntActaCierreModel;
import com.sigcomt.gestionProyectos.model.cierre.MntLeccionAprendidaModel;
import com.sigcomt.gestionProyectos.servicio.administracion.AdministracionService;
import com.sigcomt.gestionProyectos.servicio.anteproyecto.ProyectoService;
import com.sigcomt.gestionProyectos.servicio.cierre.CierreService;

@Controller
@RequestMapping(value = "/cierre")
public class CierreController 
{
	protected final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private AdministracionService administracionService;
	
	@Autowired
	private ProyectoService proyectoService;
	
	@Autowired
	private CierreService cierreService;
	
	@ModelAttribute("registrarProyectoCierre")
	public Proyecto registrarProyectoCierre()
	{
		return new Proyecto();
	}
	
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
	
	@RequestMapping(value = "/listar_proyectoCierre.htm", method = RequestMethod.POST)
	public @ResponseBody List<LstProyectoCierreModel> listarProyectoCierre(@RequestBody BuscarCierreModel bsqProyectoCierre)  
	{
		return proyectoService.listaProyectoByEstadoCierre(bsqProyectoCierre);
	}
	
	@RequestMapping(value = "/mntCierre.htm")
	public ModelAndView mntCierre(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		MntLeccionAprendidaModel bsqLeccionAprendida = new MntLeccionAprendidaModel();
		MntActaCierreModel bsqActaCierre = new MntActaCierreModel();
		Sponsor sponsor = new Sponsor();
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		Integer index = new Integer(request.getParameter("idcierre") != null && request.getParameter("idcierre").length() > 0 ?request.getParameter("idcierre"):"0");
		bsqLeccionAprendida.setIdProyecto(new Long(index)); 	
		sponsor.setEstado(Constantes.ESTADO_ACTIVO);
		bsqActaCierre.setIdProyecto(new Long(index));
		
		myModel.put("listaEntregable", this.cierreService.listaEntregable(index));
		myModel.put("idProyecto", index);
		myModel.put("listaLeccionesAprendidas", cierreService.listarLeccionesAprendidas(bsqLeccionAprendida));
		myModel.put("listaSponsor", cierreService.listaSponsor(sponsor));
		myModel.put("listaActaCierre", cierreService.listarActaCierre(bsqActaCierre));
		
		return new ModelAndView("mntCierre", "model", myModel);
	}
	
	//--------------------------------- [INI] LECCIONES APRENDIDAS ---------------------------------
	@RequestMapping(value = "/mantenimiento_leccionAprendida.htm", method = RequestMethod.POST)
	public @ResponseBody int mntLeccionAprendida(@RequestBody MntLeccionAprendidaModel dato) 
	{
		try{
			int resultado = cierreService.mntLeccionAprendida(dato);
			return resultado;
		}catch(Exception e){
			logger.error(e.getMessage());
			return 0;
		}		
	}
	
	@RequestMapping(value = "/listar_LeccionesAprendidas.htm", method = RequestMethod.POST)
	public @ResponseBody List<LstLeccionAprendidaModel> listarLeccionesAprendidas(@RequestBody MntLeccionAprendidaModel bsqLeccionAprendida)  
	{
		return cierreService.listarLeccionesAprendidas(bsqLeccionAprendida);
	}
	
	@RequestMapping(value = "/eliminar_LeccionesAprendidas.htm", method = RequestMethod.POST)
	public @ResponseBody int eliminarLeccionesAprendidas(@RequestBody MntLeccionAprendidaModel bsqLeccionAprendida)  
	{
		return cierreService.eliminarLeccionesAprendidas(bsqLeccionAprendida);
	}
	//--------------------------------- [FIN] LECCIONES APRENDIDAS ---------------------------------
	//--------------------------------- [INI] ACTA DE CIERRE ---------------------------------------
	//--------------------------------- [INI] ACTA DE CIERRE ---------------------------------------
	@RequestMapping(value = "/mantenimiento_actaCierre.htm", method = RequestMethod.POST)
	public @ResponseBody int mntActaCierre(@RequestBody MntActaCierreModel dato) 
	{
		try{
			int resultado = cierreService.mntActaCierre(dato);
			return resultado;
		}catch(Exception e){
			logger.error(e.getMessage());
			return 0;
		}		
	}
	
	@RequestMapping(value = "/listar_ActaCierre.htm", method = RequestMethod.POST)
	public @ResponseBody List<LstActaCierreModel> listarActaCierre(@RequestBody MntActaCierreModel bsqActaCierre)  
	{
		return cierreService.listarActaCierre(bsqActaCierre);
	}
	//--------------------------------- [FIN] ACTA DE CIERRE ---------------------------------------
	//--------------------------------- [FIN] CIERRE PROYECTO --------------------------------------
	@RequestMapping(value="/registrar_cierreProyecto.htm",method=RequestMethod.POST)
	public ModelAndView registrarVoucherModal(@ModelAttribute("registrarProyectoCierre") Proyecto proyecto)  
	{
		cierreService.registrarCierreProyecto(proyecto);
				
		return new ModelAndView("redirect:/cierre/cierre.htm");
	}
	
	@InitBinder 
	protected void initBinder(HttpServletRequest request,ServletRequestDataBinder binder) throws Exception
	{ 
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
		binder.registerCustomEditor(Date.class, editor);
	}
	//--------------------------------- [FIN] CIERRE PROYECTO --------------------------------------
}
