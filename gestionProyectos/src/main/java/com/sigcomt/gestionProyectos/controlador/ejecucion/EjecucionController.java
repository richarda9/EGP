package com.sigcomt.gestionProyectos.controlador.ejecucion;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sigcomt.gestionProyectos.common.Constantes;
import com.sigcomt.gestionProyectos.common.enumerations.EstadoProyectoEnum;
import com.sigcomt.gestionProyectos.dominio.administracion.Persona;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleAsignacionResponsable;
import com.sigcomt.gestionProyectos.model.ejecucion.BuscarEjecucionModel;
import com.sigcomt.gestionProyectos.model.ejecucion.EnvioCertificacionModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstAsignarResponsableModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstCtrolCambiosModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstProyectoEjecucionModel;
import com.sigcomt.gestionProyectos.model.ejecucion.MntAsignarResponsableModel;
import com.sigcomt.gestionProyectos.model.ejecucion.MntCtrolCambiosModel;
import com.sigcomt.gestionProyectos.model.ejecucion.MntTareaCtrolCambioModel;
import com.sigcomt.gestionProyectos.servicio.administracion.AdministracionService;
import com.sigcomt.gestionProyectos.servicio.anteproyecto.ProyectoService;
import com.sigcomt.gestionProyectos.servicio.ejecucion.EjecucionService;

@Controller
@RequestMapping(value = "/ejecucion")
public class EjecucionController 
{
	
	protected final Log logger = LogFactory.getLog(getClass());
		
	@Autowired
	private AdministracionService administracionService;
	
	@Autowired
	private ProyectoService proyectoService;
	
	@Autowired
	private EjecucionService ejecucionService;

	@RequestMapping(value = "/ejecucion.htm")
	public ModelAndView ejecucion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		//String index = request.getParameter("idanteproyecto");
		myModel.put("listaTipoProyecto", this.administracionService.listarTipoProyectoByEsado(Constantes.ESTADO_ACTIVO));
		myModel.put("listaProyecto", this.proyectoService.listarProyectoByEstado(Constantes.ESTADO_ACTIVO));
		myModel.put("listaCliente", this.administracionService.listarEmpresaByEstado(Constantes.ESTADO_ACTIVO));
		
		//myModel.put("listaAsociadoProyecto", this.proyectoService.listarProyectoByDetalleEstadoProyectoByEstado(ESTADO_ACTIVO, Long.parseLong(EstadoProyectoEnum.EN_PLANIFICACION.getCodigo())));
		
		return new ModelAndView("ejecucion", "model", myModel);
	}
	
	@RequestMapping(value = "/mntEjecucion.htm")
	public ModelAndView mntEjecucion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		MntCtrolCambiosModel bsqCtrolCambios = new MntCtrolCambiosModel();
		bsqCtrolCambios.setEstado(Constantes.ESTADO_ACTIVO);		
		String idProyecto = request.getParameter("idEjecucion");
		
		MntAsignarResponsableModel bsqResponsable = new MntAsignarResponsableModel();
		bsqResponsable.setIdproyecto(new Long(idProyecto));
		bsqResponsable.setTiporol(Constantes.TIPO_ROL_PROVEEDOR);
		
		HashMap<String, String> mapa = new HashMap<String, String>();
		mapa.put("idproyecto", idProyecto);
		mapa.put("tipoRol", String.valueOf(Constantes.TIPO_ROL_PROVEEDOR));
		
		myModel.put("listaRolProveedor", this.ejecucionService.listarTipoRol(mapa));
		
		mapa.remove("tipoRol");
		mapa.put("tipoRol", String.valueOf(Constantes.TIPO_ROL_CLIENTE));
		
		myModel.put("listaRolCliente", this.ejecucionService.listarTipoRol(mapa));
		myModel.put("listaEstadoTarea", this.ejecucionService.listarEstadoTarea(Constantes.ESTADO_ACTIVO));
		myModel.put("listaComplejidad", this.ejecucionService.listarComplejidad(Constantes.ESTADO_ACTIVO));
		myModel.put("listaCtrolCambios", this.ejecucionService.listarCtrolCambios(bsqCtrolCambios));
		myModel.put("idProyecto", idProyecto);
		myModel.put("listaProveedores", this.ejecucionService.listarAsignacionRecurso(bsqResponsable));
		bsqResponsable.setTiporol(Constantes.TIPO_ROL_CLIENTE);
		myModel.put("listaCliente", this.ejecucionService.listarAsignacionRecurso(bsqResponsable));
		myModel.put("listaEstadoAdquisicion", this.ejecucionService.listarEstadoAdquisicion());
		myModel.put("listaCategoriaAdquisicion", this.administracionService.listarCategAdquisicion());
		//listarEntregableCertificacion()
				
		ObjectMapper mapper = new ObjectMapper();
		myModel.put("listaTareas", mapper.writeValueAsString(ejecucionService.obtListaTareaProyectobyProyecto(new Long(idProyecto))));
				
		return new ModelAndView("mntEjecucion", "model", myModel);
	}
	
	@RequestMapping(value = "/listar_proyectoEjecucion.htm", method = RequestMethod.POST)
	public @ResponseBody List<LstProyectoEjecucionModel> listarProyectoEjecucion(@RequestBody BuscarEjecucionModel bsqProyectoEjecucion)  
	{
		return proyectoService.listaProyectoByEstadoEjecucion(bsqProyectoEjecucion);
	}
	
	//--------------------------------- [INI] ASIGNACION RESPONSABLE -----------------------------------
	@RequestMapping(value = "/listar_Recursos.htm", method = RequestMethod.POST, consumes = {"application/json"})//headers = "Accept=application/json" )
	public @ResponseBody List<Persona> listarRecursos(@RequestBody Integer idrol)
	{
		HashMap<String, Long> mapa = new HashMap<String, Long>();
		mapa.put("iderol", new Long(idrol));
		mapa.put("estadoProyecto", new Long(EstadoProyectoEnum.EN_EJECUCION.getCodigo()));
		
		List<Persona>  lista = ejecucionService.listaRecursos(mapa);
		
		return lista;
	}
	
	
	@RequestMapping(value = "/mnt_AsignarRecursos.htm", method = RequestMethod.POST)
	public @ResponseBody int mntAsignarRecursos(@RequestBody MntAsignarResponsableModel dato) 
	{
		try{
			int resultado = ejecucionService.mntAsignarRecursos(dato);
			return resultado;
		}catch(Exception e){
			logger.error(e.getMessage());
			return 2;
		}		
	}
	
	
	@RequestMapping(value = "/listar_AsignacionRecursos.htm", method = RequestMethod.POST)
	public @ResponseBody List<LstAsignarResponsableModel> listarAsignacionRecurso(@RequestBody MntAsignarResponsableModel bsqResponsable)  
	{
		return ejecucionService.listarAsignacionRecurso(bsqResponsable);
	}
	
	@RequestMapping(value = "/eliminar_AsignacionRecursos.htm", method = RequestMethod.POST)
	public @ResponseBody int eliminarAsignacionRecursos(@RequestBody DetalleAsignacionResponsable bsqResponsable)  
	{
		return ejecucionService.eliminarAsignacionRecursos(bsqResponsable);
	}
	//--------------------------------- [FIN] ASIGNACION RESPONSABLE -----------------------------------
	//--------------------------------- [INI] CONTROL DE CAMBIOS ---------------------------------------
	@RequestMapping(value = "/mantenimiento_ctrolCambios.htm", method = RequestMethod.POST)
	public @ResponseBody int mntCtrolCambios(@RequestBody MntCtrolCambiosModel dato) 
	{
		try{
			int resultado = ejecucionService.mntCtrolCambios(dato);
			return resultado;
		}catch(Exception e){
			logger.error(e.getMessage());
			return 0;
		}		
	}
	
	@RequestMapping(value = "/listar_CtrolCambios.htm", method = RequestMethod.POST)
	public @ResponseBody List<LstCtrolCambiosModel> listarCtrolCambios(@RequestBody MntCtrolCambiosModel bsqCtrolCambios)  
	{
		return ejecucionService.listarCtrolCambios(bsqCtrolCambios);
	}
		
	@RequestMapping(value = "/eliminar_ctrolCambios.htm", method = RequestMethod.POST)
	public @ResponseBody int eliminarCtrolCambios(@RequestBody MntCtrolCambiosModel bsqCtrolCambios)  
	{
		return ejecucionService.eliminarCtrolCambios(bsqCtrolCambios);
	}
	//--------------------------------- [FIN] CONTROL DE CAMBIOS ---------------------------------------
	//--------------------------------- [INI] SEGUIMIENTO DE TAREAS ------------------------------------
	@RequestMapping(value = "/listar_RecursosProyecto.htm", method = RequestMethod.POST, consumes = {"application/json"})//headers = "Accept=application/json" )
	public @ResponseBody List<Persona> listarRecursosProyecto(@RequestBody HashMap<String, String> objeto)
	{
		objeto.put("estado", String.valueOf(Constantes.ESTADO_ACTIVO));
		objeto.put("tiporol", String.valueOf(Constantes.TIPO_ROL_PROVEEDOR));
		
		List<Persona>  lista = ejecucionService.listaRecursosProyecto(objeto);
		
		return lista;
	}
	
	@RequestMapping(value = "/mantenimiento_TareasctrolCambio.htm", method = RequestMethod.POST)
	public @ResponseBody String mntTareasProyecto(@RequestBody MntTareaCtrolCambioModel dato) throws JsonGenerationException, JsonMappingException, IOException 
	{
		ObjectMapper mapper = new ObjectMapper();
					
		ejecucionService.mntTareasProyecto(dato);
		System.out.println("DATO:      " +dato.toString());			
					
		return mapper.writeValueAsString(ejecucionService.obtListaTareaProyectobyProyecto(dato.getIdProyecto()));
			
	}
	//--------------------------------- [FIN] SEGUIMIENTO DE TAREAS ------------------------------------
	//--------------------------------- [INI] ENVIO CERTIFICACION ------------------------------------
	@RequestMapping(value = "/mnt_EnvioCertificacion.htm", method = RequestMethod.POST)
	public @ResponseBody int mntEnvioCertificacion( /*@RequestParam("destinoCertificacion") String dato,
			 										@RequestParam("ccdestinoCertificacion") String dato1,
			 										@RequestParam("asuntoDestinoCertificacion") String dato2,*/
												   @RequestParam("file") MultipartFile multipartFile
												   /*@RequestParam("observacionCertificacion") String dato3*/
												   //@RequestParam("objeto") EnvioCertificacionModel dato
												   , HttpServletRequest request)  
	{		
		try{
			String ruta = "";
			
			ruta = request.getSession().getServletContext().getRealPath("/")+System.getProperty("file.separator");
				
			String[] aux1 = (String[])request.getParameterMap().get("objeto");
			System.out.println(aux1[0]);  
			
			EnvioCertificacionModel map = new ObjectMapper().readValue(aux1[0], EnvioCertificacionModel.class);
			System.out.println(map.toString());
			
			ejecucionService.mntEnvioCertificacion(multipartFile, map, ruta);
		
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		return 0;	
	}
	//--------------------------------- [FIN] ENVIO CERTIFICACION ------------------------------------
	
}
