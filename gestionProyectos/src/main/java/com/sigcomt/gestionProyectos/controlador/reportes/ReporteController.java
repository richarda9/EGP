package com.sigcomt.gestionProyectos.controlador.reportes;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sigcomt.gestionProyectos.common.Constantes;
import com.sigcomt.gestionProyectos.common.enumerations.EstadoProyectoEnum;
import com.sigcomt.gestionProyectos.model.reporte.ReporteProyectoModel;
import com.sigcomt.gestionProyectos.servicio.administracion.AdministracionService;
import com.sigcomt.gestionProyectos.servicio.anteproyecto.AnteproyectoService;
import com.sigcomt.gestionProyectos.servicio.anteproyecto.ProyectoService;
import com.sigcomt.gestionProyectos.servicio.ejecucion.EjecucionService;
import com.sigcomt.gestionProyectos.servicio.reporte.ReporteService;


@Controller
@RequestMapping(value = "/reportes")
public class ReporteController {
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private AdministracionService administracionService;
	
	@Autowired
	private ReporteService reporteService;
	
	@Autowired
	private ProyectoService proyectoService;
	
	@Autowired
	AnteproyectoService anteproyectoService;
	
	@Autowired
	private EjecucionService ejecucionService;
	
	@RequestMapping(value = "/reportesProyecto.htm")
	public ModelAndView ejecucion(HttpServletRequest request, HttpServletResponse response) throws NumberFormatException, Exception 
	{
		HashMap<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("listaEstadoProyecto", administracionService.listarEstadoProyecto());
		myModel.put("listaEmpresa", administracionService.listarEmpresaByEstado(Constantes.ESTADO_ACTIVO));
		myModel.put("listaEstadoTarea", this.ejecucionService.listarEstadoTarea(Constantes.ESTADO_ACTIVO));
		myModel.put("listaTipoProyecto", this.administracionService.listarTipoProyectoByEsado(Constantes.ESTADO_ACTIVO));
		myModel.put("listaProyecto", this.proyectoService.listarProyectoByDetalleEstadoProyectoByEstado(Constantes.ESTADO_ACTIVO, Long.parseLong(EstadoProyectoEnum.EN_EJECUCION.getCodigo())));
		
		return new ModelAndView("reportesProyecto", "model", myModel);
	}
		
	/*@RequestMapping(value="/emitirRptPdfProyecto.htm" , method = RequestMethod.POST)
	  public @ResponseBody String generarDataSourceReport(@RequestBody ReporteProyectoModel reporte,
			  											  HttpServletRequest request)  
	{
		String ruta = request.getSession().getServletContext().getRealPath("/")+System.getProperty("file.separator");
              
        String resultado = reporteService.generarRptProyectos(ruta, reporte);
        
        return "{\"ruta\":\""+ resultado +"\"}";
	  }*/
	
	
	@RequestMapping(value="/emitirRptPdfProyecto.htm" , method = RequestMethod.GET)
	  public ModelAndView emitirRptPdfProyecto(@RequestParam Long idparam1, @RequestParam Long idparam2, 
	  										   @RequestParam Long idparam3, @RequestParam Integer idparam4,
	  										   @RequestParam String idparam5, @RequestParam String idparam6,
	                                           HttpServletRequest request)  
	{		
		String path = request.getSession().getServletContext().getRealPath("/WEB-INF/views/jasper/");
        Map<String,Object> parameterMap = new HashMap<String,Object>();		        
        parameterMap.put("idempresa", idparam1 != null ? idparam1 : new Long(0));
        parameterMap.put("idtipoproyecto", idparam2 != null ? idparam2 : new Long(0));
        parameterMap.put("idestadoproyecto", idparam3 != null ? idparam3 : new Long(0));
        parameterMap.put("estadoregistro", idparam4);
        parameterMap.put("fechainicio", idparam5);
        parameterMap.put("fechafin", idparam6);
        parameterMap.put("dscempresa", idparam1 != null ? 
        			this.administracionService.listarEmpresaById(idparam1).getRazonSocial() : "TODOS");
        parameterMap.put("dsctipoproyecto", idparam2 != null ? 
        			this.administracionService.buscarTipoProyectoById(idparam2).getDescripcion() : "TODOS");
        parameterMap.put("dscestadoproyecto", idparam3 != null ? 
        			this.administracionService.buscarEstadoProyectoById(idparam3).getDescripcion() : "TODOS");
        parameterMap.put("dscestadoregistro", idparam4.intValue() == 1 ? "ACTIVO": idparam4.intValue() == 0 ? "INACTIVO" : "TODOS");
        parameterMap.put("usuario", "TODOS");        
        parameterMap.put("ROOT_DIR", path + "/");
        
        return new ModelAndView("rptProyectosPDF",parameterMap);
	}
	
	@RequestMapping(value="/emitirRptPdfTareasxProyecto.htm" , method = RequestMethod.GET)
	  public ModelAndView emitirRptPdfTareasxProyecto(@RequestParam Long idparam1, @RequestParam Long idparam2,
		  											  @RequestParam String idparam3, @RequestParam String idparam4,
		                                              HttpServletRequest request) throws Exception  
	{		
		String path = request.getSession().getServletContext().getRealPath("/WEB-INF/views/jasper/");
      Map<String,Object> parameterMap = new HashMap<String,Object>();		        
      parameterMap.put("idproyecto", idparam1 != null ? idparam1 : new Long(0));
      parameterMap.put("idestadotarea", idparam2 != null ? idparam2 : new Long(0));
      parameterMap.put("fechainicio", idparam3);
      parameterMap.put("fechafin", idparam4);
      parameterMap.put("dscproyecto", idparam1 != null ? this.anteproyectoService.buscarProyectoById(idparam1).getTituloProyecto() : "TODOS");
      parameterMap.put("dscestadotarea", idparam2 != null ? this.administracionService.buscarEstadoTareaByID(idparam2).getDescripcion() : "TODOS");
      parameterMap.put("usuario", "TODOS");        
      parameterMap.put("ROOT_DIR", path + "/");
      
      return new ModelAndView("rptTareasxProyectoPDF",parameterMap);
	}
}
