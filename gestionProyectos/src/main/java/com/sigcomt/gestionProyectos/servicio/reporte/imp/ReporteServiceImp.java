package com.sigcomt.gestionProyectos.servicio.reporte.imp;

import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Service;
import com.sigcomt.gestionProyectos.model.reporte.ReporteProyectoModel;
import com.sigcomt.gestionProyectos.servicio.reporte.ReporteService;


@Service
public class ReporteServiceImp implements ReporteService
{

	
	 @Autowired
	 ApplicationContext ctx;
	 
	 
	public String generarRptProyectos(String ruta, ReporteProyectoModel reporte)
	{
		String resultado = "";
		try{
		DateFormat parser = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		DriverManagerDataSource dataSource =(DriverManagerDataSource)ctx.getBean("dataSource");
        Connection cnn = dataSource.getConnection();
        JasperPrint jasperPrint;
        String rutaCompleta = ruta + "WEB-INF\\views\\jasper\\" + "rptProyectos.jasper";
        String fileName = "infoProyectos-" + parser.format(new Date())+".pdf";
        System.out.println("Ruta completa: " + rutaCompleta);
        
      //Generacion PDF        
        Map<String,Object> parameterMap = new HashMap<String,Object>();		        
        parameterMap.put("idempresa", reporte.getIdCliente() == null ? new Long("0") : reporte.getIdCliente());
        parameterMap.put("idtipoproyecto", reporte.getIdTipoProyecto() == null ? new Long("0") : reporte.getIdTipoProyecto());
        parameterMap.put("idestadoproyecto", reporte.getIdEstadoProyecto() == null ? new Long("0") : reporte.getIdEstadoProyecto());
        parameterMap.put("estadoregistro", reporte.getEstadoRegistro());
        parameterMap.put("ROOT_DIR", ruta + "WEB-INF\\views\\jasper\\");
                
        jasperPrint  = JasperFillManager.fillReport(rutaCompleta, parameterMap, cnn);
        JasperExportManager.exportReportToPdfFile(jasperPrint, ruta + "WEB-INF\\temp\\"+ fileName);
        
        //Ruta del archivo generado
//        resultado = ruta + "WEB-INF\\temp\\"+ fileName;
        resultado = "temp\\\\"+ fileName;
        System.out.println("resultado: " + resultado);
		}catch(Exception e){
			throw new RuntimeException(e);
		}
		
		return resultado;		
	}
}
