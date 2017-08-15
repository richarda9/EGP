package com.sigcomt.gestionProyectos.servicio.ejecucion.imp;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.sigcomt.gestionProyectos.common.Constantes;
import com.sigcomt.gestionProyectos.dominio.administracion.DetalleEmpresaPersona;
import com.sigcomt.gestionProyectos.dominio.administracion.Persona;
import com.sigcomt.gestionProyectos.dominio.administracion.Rol;
import com.sigcomt.gestionProyectos.dominio.ejecucion.Complejidad;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleAdquisicionProyecto;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleAsignacionResponsable;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleCronograma;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleRolProyecto;
import com.sigcomt.gestionProyectos.dominio.ejecucion.EstadoAdquisicion;
import com.sigcomt.gestionProyectos.dominio.ejecucion.EstadoTarea;
import com.sigcomt.gestionProyectos.dominio.ejecucion.InformeAvance;
import com.sigcomt.gestionProyectos.model.comunes.EnvioCorreo;
import com.sigcomt.gestionProyectos.model.ejecucion.EnvioCertificacionModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstAsignarResponsableModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstCtrolCambiosModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstDetalleAdquisicionesProyectoModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstDetalleCronogramaModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstEnvioCertificacionModel;
import com.sigcomt.gestionProyectos.model.ejecucion.MntAsignarResponsableModel;
import com.sigcomt.gestionProyectos.model.ejecucion.MntCtrolCambiosModel;
import com.sigcomt.gestionProyectos.model.ejecucion.MntTareaCtrolCambioModel;
import com.sigcomt.gestionProyectos.repositorio.ejecucion.EjecucionDao;
import com.sigcomt.gestionProyectos.servicio.comunes.ComunService;
import com.sigcomt.gestionProyectos.servicio.ejecucion.EjecucionService;

@Service
public class EjecucionServiceImp implements EjecucionService
{
	@Autowired
	EjecucionDao ejecucionDao;
	
	@Autowired
	ComunService comunService;
	
	 @Autowired
	 ApplicationContext ctx;
	
	public List<Rol> listarTipoRol(HashMap<String, String> mapa){
		return ejecucionDao.listarTipoRol(mapa);
	}

	public List<EstadoTarea> listarEstadoTarea(int dato) {
		return ejecucionDao.listarEstadoTarea(dato);
	}

	public List<Complejidad> listarComplejidad(int dato) {
		return ejecucionDao.listarComplejidad(dato);
	}

	public int mntCtrolCambios(MntCtrolCambiosModel dato) {
		return ejecucionDao.mntCtrolCambios(dato);
	}

	public int eliminarCtrolCambios(MntCtrolCambiosModel dato) {
		dato.setEstado(Constantes.ESTADO_INACTIVO);
		return ejecucionDao.eliminarCtrolCambios(dato);		
	}

	public List<LstCtrolCambiosModel> listarCtrolCambios(MntCtrolCambiosModel dato) {
		return ejecucionDao.listarCtrolCambios(dato);
	}

	public List<Persona> listaRecursos(HashMap<String, Long> mapa) {
		return ejecucionDao.listaRecursos(mapa);
	}

	@Transactional
	public int mntAsignarRecursos(MntAsignarResponsableModel dato) 
	{
		int resultado =  0;
		DetalleRolProyecto detalle = ejecucionDao.obtCantidadRecursobyRol(dato);
		int cantActual = ejecucionDao.obtCantidadActualRecursobyRol(detalle);
		
		if(cantActual < detalle.getCantidad()){
			DetalleAsignacionResponsable deta = new DetalleAsignacionResponsable();
			
			deta.setIddetrolproyecto(detalle.getId());
			if(dato.getTiporol().intValue() == Constantes.TIPO_ROL_PROVEEDOR)
				deta.setIdpersona(dato.getIdrecurso());
			else{
				DetalleEmpresaPersona detempper = new DetalleEmpresaPersona();
				detempper = ejecucionDao.obtDetalleEmpresaPersonabyPersona(dato);
				deta.setIddetempresa(detempper.getId());
			}
			
			deta.setEstado(Constantes.ESTADO_ACTIVO);
		
			ejecucionDao.mntAsignarRecursos(deta);
		}else
			resultado = 1; //Ya alcanzo la cantidad maxima de recursos por rol para el proyecto
				
		
		return resultado;
	}

	public List<LstAsignarResponsableModel> listarAsignacionRecurso(MntAsignarResponsableModel bsqResponsable) 
	{
		bsqResponsable.setEstado(Constantes.ESTADO_ACTIVO);
		return ejecucionDao.listarAsignacionRecurso(bsqResponsable);
	}

	public int eliminarAsignacionRecursos(DetalleAsignacionResponsable bsqResponsable) 
	{
		bsqResponsable.setEstado(Constantes.ESTADO_INACTIVO);
		return ejecucionDao.eliminarAsignacionRecursos(bsqResponsable);
	}

	public List<Persona> listaRecursosProyecto(HashMap<String, String> objeto) {
		String tipo = objeto.get("tipo");
		if(tipo == null || tipo.length() == 0){
			objeto.remove("tipo");
			objeto.put("tipo", null);
		}
		return ejecucionDao.listaRecursosProyecto(objeto);
	}
	
	public List<LstDetalleCronogramaModel> obtListaTareaProyectobyProyecto(Long idProyecto){
		return ejecucionDao.obtListaTareaProyectobyProyecto(idProyecto);
	}
	
	@Transactional
	public void mntTareasProyecto(MntTareaCtrolCambioModel dato) 
	{
		List<LstDetalleCronogramaModel> lista = dato.getLista();
		List<LstDetalleCronogramaModel> listaAux = dato.getLista();
		List<LstDetalleCronogramaModel> listaBD = ejecucionDao.obtListaTareaProyectobyProyecto(dato.getIdProyecto());
		List<LstDetalleCronogramaModel> listaEliminar = new ArrayList<LstDetalleCronogramaModel>();
				
		//Actualiza y elimina Tareas
		for(int i = 0; i < listaBD.size(); i++){
			for (LstDetalleCronogramaModel lstDetalleCronogramaModel : lista) {
				DetalleCronograma detalle = new DetalleCronograma();
				detalle.setId(lstDetalleCronogramaModel.getId());
				detalle.setCoddetallecronograma(lstDetalleCronogramaModel.getCodigo());
				detalle.setDuracion(lstDetalleCronogramaModel.getHoras());
				detalle.setEstado(lstDetalleCronogramaModel.getEstadoTarea()); //estado del registro
				detalle.setFechaFin(lstDetalleCronogramaModel.getFechaFin());
				detalle.setFechaInicio(lstDetalleCronogramaModel.getFechaInicio());
				detalle.setIdcomplejidad(lstDetalleCronogramaModel.getIdComplejidad());
				detalle.setIdcontrolcambios(dato.getIdCtrolCambioTarea());
				detalle.setIdestado(lstDetalleCronogramaModel.getIdEstado());
				detalle.setIdpersona(lstDetalleCronogramaModel.getIdResponsable());
				detalle.setIdproyecto(dato.getIdProyecto());
				detalle.setJustificacion(lstDetalleCronogramaModel.getJustificacion());
				detalle.setNombre(lstDetalleCronogramaModel.getDescripcion());
				detalle.setPrecede(lstDetalleCronogramaModel.getPrecede());
				detalle.setRecursos(lstDetalleCronogramaModel.getDscRecursos());
				
				if(listaBD.get(i).getId().intValue() == detalle.getId().intValue()){
					ejecucionDao.actualizaTareaProyecto(detalle);
					lista.remove(lstDetalleCronogramaModel);
					break;
				}else{
					listaBD.get(i).setEstadoTarea(Constantes.ESTADO_INACTIVO);
					listaEliminar.add(listaBD.get(i));
					}
				}
			}
		
		for (LstDetalleCronogramaModel objEliminar : listaEliminar) {
			ejecucionDao.eliminarTareasProyecto(objEliminar);
		}
		
		//Agregar Tareas
		for(int i = 0; i < listaAux.size(); i++){
			DetalleCronograma detalle = new DetalleCronograma();
			detalle.setId(lista.get(i).getId());
			detalle.setCoddetallecronograma(lista.get(i).getCodigo());
			detalle.setDuracion(lista.get(i).getHoras());
			detalle.setEstado(lista.get(i).getEstadoTarea()); //estado del registro
			detalle.setFechaFin(lista.get(i).getFechaFin());
			detalle.setFechaInicio(lista.get(i).getFechaInicio());
			detalle.setIdcomplejidad(lista.get(i).getIdComplejidad());
			detalle.setIdcontrolcambios(dato.getIdCtrolCambioTarea());
			detalle.setIdestado(lista.get(i).getIdEstado());
			detalle.setIdpersona(lista.get(i).getIdResponsable());
			detalle.setIdproyecto(dato.getIdProyecto());
			detalle.setJustificacion(lista.get(i).getJustificacion());
			detalle.setNombre(lista.get(i).getDescripcion());
			detalle.setPrecede(lista.get(i).getPrecede());
			detalle.setRecursos(lista.get(i).getDscRecursos());
			
			if(lista.get(i).getId() == null)
				ejecucionDao.agregarTareaProyecto(detalle);
		}
	}

	public void mntEnvioCertificacion(MultipartFile multipartFile, EnvioCertificacionModel objeto, String ruta) 
	{
		try{
			byte[] data = multipartFile.getBytes();
			String nombreArch = multipartFile.getOriginalFilename();
			String rutaArch = ruta + "WEB-INF\\temp\\" + nombreArch;
			String rutaLogo = ruta + "WEB-INF\\temp\\" + Constantes.LOGO_FIRMA_SIGCOMT;
						
			OutputStream out = new FileOutputStream(rutaArch);
	        out.write(data);    
	        out.flush();
	        out.close();
	        
	        EnvioCorreo correo = new EnvioCorreo();
	        correo.setCorreoDestino(objeto.getDestinoCertificacion());
	        correo.setCorreoCopia(objeto.getCcdestinoCertificacion());
	        correo.setAsunto(objeto.getAsuntoDestinoCertificacion());
	        correo.setMensaje(objeto.getObservacionCertificacion());
	        correo.setRutaArchivo(rutaArch);
	        correo.setNombreArchivo(nombreArch);
	        correo.setRutaLogo(rutaLogo);
	        
	        comunService.envioCorreo(correo);
	        
	        objeto.setIdestadoEntregable(new Long("2"));
	        ejecucionDao.actualizarEnvioCorreo(objeto);
	        
	        File fichero = new File(rutaArch);
	        fichero.delete();
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
	
	public List<EstadoAdquisicion> listarEstadoAdquisicion(){
		return ejecucionDao.listarEstadoAdquisicion();
	}
	
	public List<Persona> listarResponsablebyProyecto(Long id){
		return ejecucionDao.listarResponsablebyProyecto(id);
	}
	
	public List<LstDetalleAdquisicionesProyectoModel> listarCategAdquisicionbyProyecto(DetalleAdquisicionProyecto bsqAdquisicion){
		return ejecucionDao.listarCategAdquisicionbyProyecto(bsqAdquisicion);
	}
	
	public int mntAdquisiciones(DetalleAdquisicionProyecto dato){
		if(dato.getId() == null)
			return ejecucionDao.mntAdquisiciones(dato);
		else{
			ejecucionDao.actualizarAdquisiciones(dato);
			return 1;
		}
	}
	
	public void eliminarAdquisiciones(Integer id){
		ejecucionDao.eliminarAdquisiciones(id);
	}
	
	public List<LstEnvioCertificacionModel> listarEnvioCertificacionbyProyecto(Long idproyecto)
	{
		return ejecucionDao.listarEnvioCertificacionbyProyecto(idproyecto);
	}
	
	//
	public List<InformeAvance> listarInfoAvancebyProyecto(InformeAvance info){
		return ejecucionDao.listarInfoAvancebyProyecto(info);
	}
	
	public int mntoInformeAvance(InformeAvance dato){
		if(dato.getId() == null)
			return ejecucionDao.mntoInformeAvance(dato);
		else{
			ejecucionDao.actualizarInformeAvance(dato);
			return 1;
		}
	}
	
	public void eliminarInformeAvance(Integer id){
		InformeAvance info = new InformeAvance();
		info.setId(new Long(id));
		info.setEstado(Constantes.ESTADO_INACTIVO);
		
		ejecucionDao.eliminarInformeAvance(info);
	}
	
	public String enviarCorreoInformeAvance(InformeAvance dato, String ruta){
		try{        
        //ApplicationContext context = new ClassPathXmlApplicationContext("classpath*:/spring/applicationContext.xml");
       // SqlSessionFactoryBean dataSource1 =(SqlSessionFactoryBean)context.getBean("sqlSessionFactory");
		DateFormat parser = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        DriverManagerDataSource dataSource =(DriverManagerDataSource)ctx.getBean("dataSource");
        Connection cnn = dataSource.getConnection();
        JasperPrint jasperPrint;
        String rutaCompleta = ruta + "WEB-INF\\views\\jasper\\" + "InformeAvance.jasper";
        String fileName = "InformeAvance-" + parser.format(new Date())+".pdf";
		
        dato.setEnvioCorreo(Constantes.ESTADO_ACTIVO);
        ejecucionDao.actualizarInformeAvance(dato);
        
        //Generacion PDF
        Map<String,Object> parameterMap = new HashMap<String,Object>();		 
        parameterMap.put("idproyecto", dato.getIdProyecto());
        parameterMap.put("idinformeavance", dato.getId());
        parameterMap.put("ROOT_DIR", ruta + "WEB-INF\\views\\jasper\\");
        
        jasperPrint  = JasperFillManager.fillReport(rutaCompleta, parameterMap, cnn);
        JasperExportManager.exportReportToPdfFile(jasperPrint, ruta + "WEB-INF\\temp\\"+ fileName);
        
        //Envio Correo
        String rutaLogo = ruta + "WEB-INF\\temp\\" + Constantes.LOGO_FIRMA_SIGCOMT;
        
        EnvioCorreo correo = new EnvioCorreo();
        correo.setCorreoDestino(dato.getCorreoDirigido());
        correo.setAsunto("INFORME DE AVANCE - " + new SimpleDateFormat("yyyyMMdd").format(new Date()));
        correo.setMensaje(dato.getDescripcion());
        correo.setRutaArchivo(ruta + "WEB-INF\\temp\\"+ fileName);
        correo.setNombreArchivo(fileName);
        correo.setRutaLogo(rutaLogo);
        
        comunService.envioCorreo(correo);
			
		}catch(Exception e){
			throw new RuntimeException(e);
		}
		
		return "";
	}
	
	public String descargarInformeAvance(InformeAvance dato, String ruta){
		
		String rutaLogo = "temp\\" + "copiaDNI.pdf";
		return rutaLogo;
	}
	
	//[INI] SEGUIMIENTO ENTREGABLE
	public List<LstEnvioCertificacionModel> listarSeguimientoCertificacionbyProyecto(Long idproyecto){
		return ejecucionDao.listarSeguimientoCertificacionbyProyecto(idproyecto);
	}
	
	public void cambioEstadoEntregable(EnvioCertificacionModel entregable){
		ejecucionDao.cambioEstadoEntregable(entregable);
	}
	//[FIN] SEGUIMIENTO ENTREGABLE
}
