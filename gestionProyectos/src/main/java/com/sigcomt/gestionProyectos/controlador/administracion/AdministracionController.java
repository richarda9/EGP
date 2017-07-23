package com.sigcomt.gestionProyectos.controlador.administracion;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

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
import com.sigcomt.gestionProyectos.dominio.administracion.CategoriaAdquisicion;
import com.sigcomt.gestionProyectos.dominio.administracion.Empresa;
import com.sigcomt.gestionProyectos.dominio.administracion.EstadoEntregable;
import com.sigcomt.gestionProyectos.dominio.administracion.EstadoProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoCostoOperativo;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoDependencia;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoFormaPago;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoRequisito;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoRol;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoSupuesto;
import com.sigcomt.gestionProyectos.dominio.ejecucion.Complejidad;
import com.sigcomt.gestionProyectos.model.administracion.MntEmpresaModel;
import com.sigcomt.gestionProyectos.model.administracion.RecursosModel;
import com.sigcomt.gestionProyectos.servicio.administracion.AdministracionService;
import com.sigcomt.gestionProyectos.servicio.administracion.PaisService;

@Controller
@RequestMapping(value = "/administracion")
public class AdministracionController 
{
	protected final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private AdministracionService administracionService;
	
	@Autowired
	private PaisService paisService;

	//----------------------------------------------------------- [INI] EMPRESA -----------------------------------------------------------
	@RequestMapping(value = "/empresa.htm")
	public ModelAndView empresa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		
		myModel.put("listaTipoRol", this.administracionService.listarTipoRolbyEstado(Constantes.ESTADO_ACTIVO));		
		myModel.put("listaPais", this.paisService.listarPais());
		myModel.put("listaEmpresa", this.administracionService.listarEmpresaByEstado(Constantes.ESTADO_ACTIVO));
		
		return new ModelAndView("empresa", "model", myModel);
	}
	
	@RequestMapping(value = "/mnt_Empresa.htm", method = RequestMethod.POST)
	public @ResponseBody String mntEmpresa(@RequestParam(value ="logoEmpresa", required = false) MultipartFile logoEmpresa, 
										   @RequestParam(value ="formatoEmpresa", required = false) MultipartFile formatoEmpresa,							   
										   HttpServletRequest request)  
	{		
		try{
			String ruta = "";
			
			ruta = request.getSession().getServletContext().getRealPath("/")+System.getProperty("file.separator");
				
			String[] aux1 = (String[])request.getParameterMap().get("objeto");
			System.out.println("aux1: " + aux1[0]);  
			
			MntEmpresaModel empresa = new ObjectMapper().readValue(aux1[0], MntEmpresaModel.class);
			System.out.println("map: " + empresa.toString());
			
			administracionService.mntEmpresa(logoEmpresa, formatoEmpresa, empresa, ruta);
		
		}catch(Exception e){
			System.out.println(e.getMessage());
			return "0";
		}
		
		return "1";	
	}	
	
	@RequestMapping(value = "/listar_Empresa.htm", method = RequestMethod.POST)
	public @ResponseBody List<Empresa> listarEmpresa(@RequestBody Integer dato) 
	{
		return this.administracionService.listarEmpresaByEstado(Constantes.ESTADO_ACTIVO);
	}		
	
	@RequestMapping(value = "/obtener_Empresa.htm", method = RequestMethod.POST)
	public @ResponseBody Empresa obtenerEmpresa(@RequestBody Integer dato) 
	{
		return this.administracionService.listarEmpresaById(new Long(dato));
	}	
		
	@RequestMapping(value = "/listar_ContactoEmpresa.htm", method = RequestMethod.POST)
	public @ResponseBody String listarContactoEmpresa(@RequestBody Integer dato) throws JsonGenerationException, JsonMappingException, IOException 
	{
		ObjectMapper mapper = new ObjectMapper();
		return  mapper.writeValueAsString(this.administracionService.listarContactoEmpresaByEmpresa(new Long(dato)));
	}
	
	@RequestMapping(value = "/eliminar_Empresa.htm", method = RequestMethod.POST)
	public @ResponseBody int eliminarEmpresa(@RequestBody Integer dato) 
	{
		return this.administracionService.eliminarEmpresa(new Long(dato));
	}	
	
	//----------------------------------------------------------- [FIN] EMPRESA -----------------------------------------------------------
	//----------------------------------------------------------- [INI] RECURSOS -----------------------------------------------------------
	@RequestMapping(value = "/recursos.htm")
	public ModelAndView recursos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		RecursosModel recursos = new RecursosModel();
		
		recursos.setTipoRol(Constantes.TIPO_ROL_PROVEEDOR);
		
		myModel.put("listaTipoDocumento", this.administracionService.listarTipoDocumento());
		myModel.put("listaTipoCargo", this.administracionService.listarTipoRolbyTipoRol(Constantes.TIPO_ROL_PROVEEDOR));
		myModel.put("listaRecursos", mapper.writeValueAsString(this.administracionService.listarRecursos(recursos)));
		
		return new ModelAndView("recursos", "model", myModel);
	}
	
	@RequestMapping(value = "/mnto_Recurso.htm", method = RequestMethod.POST)
	public @ResponseBody int mntoRecurso(@RequestBody RecursosModel dato) 
	{
		int ind = administracionService.mntoRecurso(dato); 
		return ind;
	}	
	
	@RequestMapping(value = "/listar_Recurso.htm", method = RequestMethod.POST)
	public @ResponseBody String listarRecursos(@RequestBody int dato) throws JsonGenerationException, JsonMappingException, IOException 
	{	
		RecursosModel recursos = new RecursosModel();
		recursos.setTipoRol(Constantes.TIPO_ROL_PROVEEDOR);
		
		return new ObjectMapper().writeValueAsString(administracionService.listarRecursos(recursos));
	}
	
	@RequestMapping(value = "/obtener_Recurso.htm", method = RequestMethod.POST)
	public @ResponseBody String obtenerRecurso(@RequestBody int dato) throws JsonGenerationException, JsonMappingException, IOException 
	{	
		RecursosModel recursos = new RecursosModel();
		recursos.setTipoRol(Constantes.TIPO_ROL_PROVEEDOR);
		recursos.setId(new Long(dato));
		
		return new ObjectMapper().writeValueAsString(administracionService.listarRecursos(recursos));
	}
	
	@RequestMapping(value = "/eliminar_Recurso.htm", method = RequestMethod.POST)
	public @ResponseBody int eliminarRecursos(@RequestBody Integer dato) 
	{
		administracionService.eliminarRecursos(dato); 
		return 0;
	}
	//----------------------------------------------------------- [FIN] RECURSOS -----------------------------------------------------------	
	//----------------------------------------------------------- [INI] ORGANIGRAMA -----------------------------------------------------------
	@RequestMapping(value = "/organigrama.htm")
	public ModelAndView organigrama(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		TipoRol rol = new TipoRol();
		
		myModel.put("listaOrganigrama", mapper.writeValueAsString(administracionService.listarTipoRol(rol)));
		
		return new ModelAndView("organigrama", "model", myModel);
	}
	
	@RequestMapping(value = "/mnto_Organigrama.htm", method = RequestMethod.POST)
	public @ResponseBody int mntoOrganigrama(@RequestBody TipoRol dato) 
	{
		int ind = administracionService.mntoOrganigrama(dato); 
		return ind;
	}	
	
	@RequestMapping(value = "/listar_Organigrama.htm", method = RequestMethod.POST)
	public @ResponseBody String listarOrganigrama(@RequestBody int dato) throws JsonGenerationException, JsonMappingException, IOException 
	{
		TipoRol rol = new TipoRol();
		return new ObjectMapper().writeValueAsString(administracionService.listarTipoRol(rol));
	}
	
	@RequestMapping(value = "/obtener_Organigrama.htm", method = RequestMethod.POST)
	public @ResponseBody String obtenerOrganigrama(@RequestBody int dato) throws JsonGenerationException, JsonMappingException, IOException 
	{	
		TipoRol rol = new TipoRol();
		rol.setId(new Long(dato));
		
		return new ObjectMapper().writeValueAsString(administracionService.listarTipoRol(rol));
	}
	
	@RequestMapping(value = "/eliminar_Organigrama.htm", method = RequestMethod.POST)
	public @ResponseBody int eliminarOrganigrama(@RequestBody Integer dato) 
	{
		administracionService.eliminarOrganigrama(dato); 
		return 0;
	}
	//----------------------------------------------------------- [FIN] ORGANIGRAMA -----------------------------------------------------------
	//----------------------------------------------------------- [INI] ASOCIADO A PROYECTO -----------------------------------------------------------
	@RequestMapping(value = "/asociadoProyecto.htm")
	public ModelAndView asociadoProyecto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		
		myModel.put("listaTipoProyecto", mapper.writeValueAsString(administracionService.listarTipoProyecto()));
		myModel.put("listaEstadoProyecto", mapper.writeValueAsString(administracionService.listarEstadoProyecto()));
		myModel.put("listaTipoRequisito", mapper.writeValueAsString(administracionService.listarTipoRequisitoProyecto()));
		myModel.put("listaTipoSupuesto", mapper.writeValueAsString(administracionService.listarTipoSupuestoProyecto()));
		myModel.put("listaTipoDependencia", mapper.writeValueAsString(administracionService.listarTipoDependenciaProyecto()));
		myModel.put("listaAdquisiciones", mapper.writeValueAsString(administracionService.listarCategAdquisicion()));
		myModel.put("listaCostoOperativo", mapper.writeValueAsString(administracionService.listarCostoOperativo()));
		myModel.put("listaFormaPago", mapper.writeValueAsString(administracionService.listarFormaPago()));
		
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
	public @ResponseBody String listarTipoProyecto(@RequestBody int dato) throws JsonGenerationException, JsonMappingException, IOException 
	{	
		return new ObjectMapper().writeValueAsString(administracionService.listarTipoProyecto());
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
	public @ResponseBody String listarEstadoProyecto(@RequestBody int dato) throws JsonGenerationException, JsonMappingException, IOException 
	{	
		return new ObjectMapper().writeValueAsString(administracionService.listarEstadoProyecto());
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
	public @ResponseBody String listarTipoRequisitoProyecto(@RequestBody int dato) throws JsonGenerationException, JsonMappingException, IOException 
	{	
		return new ObjectMapper().writeValueAsString(administracionService.listarTipoRequisitoProyecto());
	}
	
	@RequestMapping(value = "/eliminar_tipoRequisitoProyecto.htm", method = RequestMethod.POST)
	public @ResponseBody int eliminarTipoRequisitoProyecto(@RequestBody Integer dato) 
	{
		administracionService.eliminarTipoRequisitoProyecto(dato); 
		return 0;
	}
	//[FIN] TIPO REQUISITO
	//[INI] TIPO SUPUESTO
	@RequestMapping(value = "/registrar_tipoSupuestoProyecto.htm", method = RequestMethod.POST)
	public @ResponseBody int registrarTipoSupuestoProyecto(@RequestBody TipoSupuesto dato) 
	{
		int ind = administracionService.registrarTipoSupuestoProyecto(dato); 
		return ind;
	}	
	
	@RequestMapping(value = "/listar_tipoSupuestoProyecto.htm", method = RequestMethod.POST)
	public @ResponseBody String listarTipoSupuestoProyecto(@RequestBody int dato) throws JsonGenerationException, JsonMappingException, IOException 
	{	
		return new ObjectMapper().writeValueAsString(administracionService.listarTipoSupuestoProyecto());
	}
	
	@RequestMapping(value = "/eliminar_tipoSupuestoProyecto.htm", method = RequestMethod.POST)
	public @ResponseBody int eliminarTipoSupuestoProyecto(@RequestBody Integer dato) 
	{
		administracionService.eliminarTipoSupuestoProyecto(dato); 
		return 0;
	}
	//[FIN] TIPO SUPUESTO
	//[INI] TIPO DEPENDENCIA
	@RequestMapping(value = "/registrar_tipoDependenciaProyecto.htm", method = RequestMethod.POST)
	public @ResponseBody int registrarTipoDependenciaProyecto(@RequestBody TipoDependencia dato) 
	{
		int ind = administracionService.registrarTipoDependenciaProyecto(dato); 
		return ind;
	}	
	
	@RequestMapping(value = "/listar_tipoDependenciaProyecto.htm", method = RequestMethod.POST)
	public @ResponseBody String listarTipoDependenciaProyecto(@RequestBody int dato) throws JsonGenerationException, JsonMappingException, IOException 
	{	
		return new ObjectMapper().writeValueAsString(administracionService.listarTipoDependenciaProyecto());
	}
	
	@RequestMapping(value = "/eliminar_tipoDependenciaProyecto.htm", method = RequestMethod.POST)
	public @ResponseBody int eliminarTipoDependenciaProyecto(@RequestBody Integer dato) 
	{
		administracionService.eliminarTipoDependenciaProyecto(dato); 
		return 0;
	}
	//[FIN] TIPO DEPENDENCIA	
	//[INI] CATEGORIA ADQUISICION
	@RequestMapping(value = "/registrar_CategAdquisicion.htm", method = RequestMethod.POST)
	public @ResponseBody int registrarCategAdquisicion(@RequestBody CategoriaAdquisicion dato) 
	{
		int ind = administracionService.registrarCategAdquisicion(dato); 
		return ind;
	}	
	
	@RequestMapping(value = "/listar_CategAdquisicion.htm", method = RequestMethod.POST)
	public @ResponseBody String listarCategAdquisicion(@RequestBody int dato) throws JsonGenerationException, JsonMappingException, IOException 
	{	
		return new ObjectMapper().writeValueAsString(administracionService.listarCategAdquisicion());
	}
	
	@RequestMapping(value = "/eliminar_CatgAdquisicion.htm", method = RequestMethod.POST)
	public @ResponseBody int eliminarCategAdquisicion(@RequestBody Integer dato) 
	{
		administracionService.eliminarCategAdquisicion(dato); 
		return 0;
	}
	//[FIN] CATEGORIA ADQUISICION	
	//[INI] COSTO OPERATIVO
	@RequestMapping(value = "/registrar_CostoOperativo.htm", method = RequestMethod.POST)
	public @ResponseBody int registrarCostoOperativo(@RequestBody TipoCostoOperativo dato) 
	{
		int ind = administracionService.registrarCostoOperativo(dato); 
		return ind;
	}	
	
	@RequestMapping(value = "/listar_CostoOperativo.htm", method = RequestMethod.POST)
	public @ResponseBody String listarCostoOperativo(@RequestBody int dato) throws JsonGenerationException, JsonMappingException, IOException 
	{	
		return new ObjectMapper().writeValueAsString(administracionService.listarCostoOperativo());
	}
	
	@RequestMapping(value = "/eliminar_CostoOperativo.htm", method = RequestMethod.POST)
	public @ResponseBody int eliminarCostoOperativo(@RequestBody Integer dato) 
	{
		administracionService.eliminarCostoOperativo(dato); 
		return 0;
	}
	//[FIN] COSTO OPERATIVO
	//[INI] FORMA PAGO
	@RequestMapping(value = "/registrar_FormaPago.htm", method = RequestMethod.POST)
	public @ResponseBody int registrarFormaPago(@RequestBody TipoFormaPago dato) 
	{
		int ind = administracionService.registrarFormaPago(dato); 
		return ind;
	}	
	
	@RequestMapping(value = "/listar_FormaPago.htm", method = RequestMethod.POST)
	public @ResponseBody String listarFormaPago(@RequestBody int dato) throws JsonGenerationException, JsonMappingException, IOException 
	{	
		return new ObjectMapper().writeValueAsString(administracionService.listarFormaPago());
	}
	
	@RequestMapping(value = "/eliminar_FormaPago.htm", method = RequestMethod.POST)
	public @ResponseBody int eliminarFormaPago(@RequestBody Integer dato) 
	{
		administracionService.eliminarFormaPago(dato); 
		return 0;
	}
	//[FIN] FORMA PAGO
	//----------------------------------------------------------- [FIN] ASOCIADO A PROYECTO -----------------------------------------------------------
	//----------------------------------------------------------- [INI] ASOCIADO ENTREGABLE -----------------------------------------------------------
	@RequestMapping(value = "/asociadoEntregable.htm")
	public ModelAndView asociadoEntregable(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		
		String resultado = "[{\"COLUMNAS\":"+ mapper.writeValueAsString(administracionService.listarComplejidadEntregable(Constantes.ESTADO_ACTIVO))+"}]";
		myModel.put("listaCompEntregable",  resultado); // mapper.writeValueAsString(administracionService.listarComplejidadEntregable(Constantes.ESTADO_ACTIVO)));		
		myModel.put("listaEstadoEntregable", mapper.writeValueAsString(administracionService.listarEstadoEntregable(Constantes.ESTADO_ACTIVO)));
		
		return new ModelAndView("asociadoEntregable", "model", myModel);
	}
	
	@RequestMapping(value = "/registrar_ComplejidadEntregable.htm", method = RequestMethod.POST)
	public @ResponseBody int registrarComplejidadEntregable(@RequestBody Complejidad dato) 
	{
		int ind = administracionService.registrarComplejidadEntregable(dato); 
		return ind;
	}
	
	@RequestMapping(value = "/listar_ComplejidadEntregable.htm", method = RequestMethod.POST)
	public @ResponseBody String listarComplejidadEntregable(@RequestBody int dato) throws JsonGenerationException, JsonMappingException, IOException
	{	
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(administracionService.listarComplejidadEntregable(dato));
	}
	
	@RequestMapping(value = "/eliminar_ComplejidadEntregable.htm", method = RequestMethod.POST)
	public @ResponseBody String eliminarComplejidadEntregable(@RequestBody int dato) throws JsonGenerationException, JsonMappingException, IOException
	{	
		ObjectMapper mapper = new ObjectMapper();
		administracionService.eliminarComplejidadEntregable(dato);
		return mapper.writeValueAsString(administracionService.listarComplejidadEntregable(dato));
	}
	
	@RequestMapping(value = "/registrar_EstadoEntregable.htm", method = RequestMethod.POST)
	public @ResponseBody int registrarEstadoEntregable(@RequestBody EstadoEntregable dato) 
	{
		int ind = administracionService.registrarEstadoEntregable(dato); 
		return ind;
	}
	
	@RequestMapping(value = "/listar_EstadoEntregable.htm", method = RequestMethod.POST)
	public @ResponseBody String listarEstadoEntregable(@RequestBody int dato) throws JsonGenerationException, JsonMappingException, IOException
	{	
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(administracionService.listarEstadoEntregable(dato));
	}
	
	@RequestMapping(value = "/eliminar_EstadoEntregable.htm", method = RequestMethod.POST)
	public @ResponseBody String eliminarEstadoEntregable(@RequestBody int dato) throws JsonGenerationException, JsonMappingException, IOException
	{	
		ObjectMapper mapper = new ObjectMapper();
		administracionService.eliminarEstadoEntregable(dato);
		return mapper.writeValueAsString(administracionService.listarEstadoEntregable(dato));
	}
	//----------------------------------------------------------- [FIN] ASOCIADO ENTREGABLE -----------------------------------------------------------
	//----------------------------------------------------------- [INI] TIPO DE CAMBIO -----------------------------------------------------------

	@RequestMapping(value = "/tipoCambio.htm")
	public ModelAndView tipoCambio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("listaTipoProyecto", this.administracionService.listarTipoProyecto());
		myModel.put("listaEstadoProyecto", this.administracionService.listarEstadoProyecto());
		myModel.put("listaTipoRequisito", this.administracionService.listarTipoRequisitoProyecto());
		
		return new ModelAndView("tipoCambio", "model", myModel);
	}
	//----------------------------------------------------------- [FIN] TIPO DE CAMBIO -----------------------------------------------------------
}
