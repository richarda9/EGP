package com.sigcomt.gestionProyectos.servicio.anteproyecto.imp;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.sigcomt.gestionProyectos.common.Constantes;
import com.sigcomt.gestionProyectos.common.enumerations.EstadoProyectoEnum;
import com.sigcomt.gestionProyectos.dominio.administracion.DetalleEstadoProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.DetalleInteresado;
import com.sigcomt.gestionProyectos.dominio.administracion.Proyecto;
import com.sigcomt.gestionProyectos.dominio.seguridad.CustomerUser;
import com.sigcomt.gestionProyectos.model.anteproyecto.AgregarAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.AnexosAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.DetProyectoUserRolModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.InteresadoAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.ObservacionesAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.comunes.EnvioCorreo;
import com.sigcomt.gestionProyectos.repositorio.anteproyecto.ProyectoDao;
import com.sigcomt.gestionProyectos.servicio.anteproyecto.AnteproyectoService;
import com.sigcomt.gestionProyectos.servicio.comunes.ComunService;

@Service
public class AnteproyectoServiceImp implements AnteproyectoService{
	
	@Autowired
	ProyectoDao proyectoDao;
	
	@Autowired
	ComunService comunService;

	@Transactional
	public String grabarAnteproyecto(AgregarAnteproyectoModel agregarAnteproyectoModel, String ruta) throws Exception {
		Proyecto proyecto = new Proyecto();
		String codigoPy = null;
//		INI - GRABAR EN TABLA PROYECTO		
		if(agregarAnteproyectoModel.getCodigoPy()!= null && agregarAnteproyectoModel.getCodigoPy()!= ""){
			proyecto = proyectoDao.buscarPyByCodPy(agregarAnteproyectoModel.getCodigoPy());
			establecerProyecto(agregarAnteproyectoModel, proyecto);	
			proyectoDao.actualizarProyectoByEstado(proyecto);
		}else{			
			establecerProyecto(agregarAnteproyectoModel, proyecto);	
			proyectoDao.grabarProyectoByEstado(proyecto);
		}					
		codigoPy = proyectoDao.buscarPyByIdPy(proyecto.getIdProyecto()).getCodigoProyecto();
//		FIN - GRABAR EN TABLA PROYECTO

//		INI - GRABAR EN TABLA DETALLE ESTADO PROYECTO			
		DetalleEstadoProyecto detalleEstadoProyecto = null;
		agregarAnteproyectoModel.setIdProyecto(proyecto.getIdProyecto());
		agregarAnteproyectoModel.setEstado(1);
		detalleEstadoProyecto = proyectoDao.buscarByIdPyByEstPyByEst(agregarAnteproyectoModel);
		
		if(detalleEstadoProyecto != null){// ACTUALIZAR ESTADO
			detalleEstadoProyecto.setFechaCreacion(new Date());
			proyectoDao.actualizarDetalleEstadoProyecto(detalleEstadoProyecto);
		}else{//GRABAR NUEVO ESTADO
			detalleEstadoProyecto = new DetalleEstadoProyecto();
			detalleEstadoProyecto.setIdEstadoProyecto(agregarAnteproyectoModel.getIdEstadoProyecto());
			detalleEstadoProyecto.setIdProyecto(proyecto.getIdProyecto());
			detalleEstadoProyecto.setFechaCreacion(new Date());
			detalleEstadoProyecto.setEstado(1);
			proyectoDao.grabarDetalleEstadoProyectoByEstado(detalleEstadoProyecto);
		}						
//		FIN - GRABAR EN TABLA DETALLE ESTADO PROYECTO
		
//		INI - GRABAR EN TABLA DETALLE INTERESADO
		proyectoDao.eliminarDetalleInteresado(agregarAnteproyectoModel);
		if(agregarAnteproyectoModel.getListaInteresados()!= null && agregarAnteproyectoModel.getListaInteresados().size()>0){
			for (int i = 0; i < agregarAnteproyectoModel.getListaInteresados().size(); i++) {
				InteresadoAnteproyectoModel interesadoAnteproyectoModel = agregarAnteproyectoModel.getListaInteresados().get(i);
				interesadoAnteproyectoModel.setIdProyecto(proyecto.getIdProyecto());
			}
			proyectoDao.insertarListaDetalleInteresado(agregarAnteproyectoModel.getListaInteresados());
		}				
//		FIN - GRABAR EN TABLA DETALLE INTERESADO
		
//		INI - GRABAR EN TABLA DETALLE ARCHIVO(LISTA OBSERVACIONES Y ANEXOS)
//		OBSERVACIONES
		agregarAnteproyectoModel.setTipoArchivo(new Long(1));
		proyectoDao.eliminarDetalleArchivoByTipoArchivoByIdPy(agregarAnteproyectoModel);
		if(agregarAnteproyectoModel.getListaObservaciones()!= null && agregarAnteproyectoModel.getListaObservaciones().size()>0){
			for (int i = 0; i < agregarAnteproyectoModel.getListaObservaciones().size(); i++) {
				ObservacionesAnteproyectoModel observacionesAnteproyectoModel = agregarAnteproyectoModel.getListaObservaciones().get(i);
				observacionesAnteproyectoModel.setIdProyecto(proyecto.getIdProyecto());
				observacionesAnteproyectoModel.setIdTipoArchivo(new Long(1));
			}
			proyectoDao.insertarListaDetalleObservaciones(agregarAnteproyectoModel.getListaObservaciones());
		}
		
//		ANEXOS
		agregarAnteproyectoModel.setTipoArchivo(new Long(2));
		proyectoDao.eliminarDetalleArchivoByTipoArchivoByIdPy(agregarAnteproyectoModel);
		if(agregarAnteproyectoModel.getListaAnexos()!= null && agregarAnteproyectoModel.getListaAnexos().size()>0){
			for (int i = 0; i < agregarAnteproyectoModel.getListaAnexos().size(); i++) {
				AnexosAnteproyectoModel anexosAnteproyectoModel = agregarAnteproyectoModel.getListaAnexos().get(i);
				anexosAnteproyectoModel.setIdProyecto(proyecto.getIdProyecto());
				anexosAnteproyectoModel.setIdTipoArchivo(new Long(2));
			}
			proyectoDao.insertarListaDetalleAnexo(agregarAnteproyectoModel.getListaAnexos());
		}
//		FIN - GRABAR EN TABLA DETALLE ARCHIVO(LISTA OBSERVACIONES Y ANEXOS)
		
//		INI - GRABAR TABLA DETALLE_PROYECTO_USER_ROL
		CustomerUser auth = (CustomerUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		DetProyectoUserRolModel detProyectoUserRolModel = new DetProyectoUserRolModel();
		detProyectoUserRolModel.setIdUserRol(auth.getIdRolUser());
		detProyectoUserRolModel.setIdProyecto(proyecto.getIdProyecto());
		DetProyectoUserRolModel detProyectoUserRolModelRpta = proyectoDao.listarDetPyUserRolByPyByUserRol(detProyectoUserRolModel);
		if(detProyectoUserRolModelRpta == null){
			detProyectoUserRolModel.setEstado(1);
			proyectoDao.grabarDetPyUserRol(detProyectoUserRolModel);
		}
//		FIN - GRABAR TABLA DETALLE_PROYECTO_USER_ROL
		
//		INI - GRABANDO ARCHIVOS
//		if(agregarAnteproyectoModel.getListaObservaciones()!= null && agregarAnteproyectoModel.getListaObservaciones().size()>0){
//			for (int i = 0; i < agregarAnteproyectoModel.getListaObservaciones().size(); i++) {
//				ObservacionesAnteproyectoModel observacionesAnteproyectoModel = agregarAnteproyectoModel.getListaObservaciones().get(i);
//				File inFile = new File(observacionesAnteproyectoModel.getRutaArchivo());
//				File outFile = new File("C:\\SIGCOMT_SERVIDOR");
//
//				FileInputStream in = new FileInputStream(inFile);
//				FileOutputStream out = new FileOutputStream(outFile);
//
//				int c;
//				while( (c = in.read() ) != -1)
//					out.write(c);
//
//				in.close();
//				out.close();
//			}
//		}
		
//		FIN - GRABANDO ARCHIVOS
		
//		INI - ENVIO DE CORREOS
		String rutaLogo = ruta + "WEB-INF\\temp\\" + Constantes.LOGO_FIRMA_SIGCOMT;
		EnvioCorreo envioCorreo = new EnvioCorreo();
		envioCorreo.setCorreoDestino(agregarAnteproyectoModel.getCorreoResponsable());
		envioCorreo.setAsunto("Proyecto Asignado - "+agregarAnteproyectoModel.getTituloProyecto());
		String mensaje = "Estimado " + agregarAnteproyectoModel.getNombreResponsable()+
							" \nTienes asignado el proyecto "+ agregarAnteproyectoModel.getTituloProyecto();
		envioCorreo.setMensaje(mensaje);
		envioCorreo.setCorreoCopia("rargomedoc89@gmail.com");
		envioCorreo.setRutaLogo(rutaLogo);
		comunService.envioCorreo(envioCorreo);
//		FIN - ENVIO DE CORREOS
				
		return codigoPy;
	}
	
	@Transactional
	public String planificarAnteproyecto(AgregarAnteproyectoModel agregarAnteproyectoModel, String ruta) throws Exception {
		Proyecto proyecto = new Proyecto();
		String codigoPy = null;
//		INI - GRABAR EN TABLA PROYECTO		
		if(agregarAnteproyectoModel.getCodigoPy()!= null && agregarAnteproyectoModel.getCodigoPy()!= ""){
			proyecto = proyectoDao.buscarPyByCodPy(agregarAnteproyectoModel.getCodigoPy());
			establecerProyecto(agregarAnteproyectoModel, proyecto);	
			proyectoDao.actualizarProyectoByEstado(proyecto);
		}else{			
			establecerProyecto(agregarAnteproyectoModel, proyecto);	
			proyectoDao.grabarProyectoByEstado(proyecto);
		}					
		codigoPy = proyectoDao.buscarPyByIdPy(proyecto.getIdProyecto()).getCodigoProyecto();
//		FIN - GRABAR EN TABLA PROYECTO

//		INI - GRABAR EN TABLA DETALLE ESTADO PROYECTO		
		
//		BUSCA PY EN ESTADO EN_ANTEPROYECTO		
		agregarAnteproyectoModel.setIdEstadoProyecto(Long.parseLong(EstadoProyectoEnum.EN_ANTEPROYECTO.getCodigo()));
		agregarAnteproyectoModel.setIdProyecto(proyecto.getIdProyecto());
		agregarAnteproyectoModel.setEstado(1);
		
		DetalleEstadoProyecto detalleEstadoProyectoAntepy = null;
		detalleEstadoProyectoAntepy = proyectoDao.buscarByIdPyByEstPyByEst(agregarAnteproyectoModel);	
		if(detalleEstadoProyectoAntepy != null){// ACTUALIZAR CON ESTADO 0 LOS PY EN ESTADO EN_ANTEPROYECTO
			detalleEstadoProyectoAntepy.setEstado(0);	
			detalleEstadoProyectoAntepy.setFechaCreacion(new Date());
			proyectoDao.actualizarDetalleEstadoProyecto(detalleEstadoProyectoAntepy);
			}else{
//				GRABA PY EN ESTADO ANTEPROYECTO		
				DetalleEstadoProyecto detalleEstadoProyectoAnt = null;
				detalleEstadoProyectoAnt = new DetalleEstadoProyecto();
				detalleEstadoProyectoAnt.setFechaCreacion(new Date());
				detalleEstadoProyectoAnt.setIdEstadoProyecto(agregarAnteproyectoModel.getIdEstadoProyecto());
				detalleEstadoProyectoAnt.setIdProyecto(proyecto.getIdProyecto());
				detalleEstadoProyectoAnt.setFechaCreacion(new Date());
				detalleEstadoProyectoAnt.setEstado(0);
				proyectoDao.grabarDetalleEstadoProyectoByEstado(detalleEstadoProyectoAnt);
			}
		
//		GRABA PY EN ESTADO EN_PLANIFICACION
		agregarAnteproyectoModel.setIdEstadoProyecto(Long.parseLong(EstadoProyectoEnum.EN_PLANIFICACION.getCodigo()));
		DetalleEstadoProyecto detalleEstadoProyecto = null;
		detalleEstadoProyecto = new DetalleEstadoProyecto();
		detalleEstadoProyecto.setIdEstadoProyecto(agregarAnteproyectoModel.getIdEstadoProyecto());
		detalleEstadoProyecto.setIdProyecto(proyecto.getIdProyecto());
		detalleEstadoProyecto.setFechaCreacion(new Date());
		detalleEstadoProyecto.setEstado(1);
		proyectoDao.grabarDetalleEstadoProyectoByEstado(detalleEstadoProyecto);
		

//		FIN - GRABAR EN TABLA DETALLE ESTADO PROYECTO
		
//		INI - GRABAR EN TABLA DETALLE INTERESADO
		proyectoDao.eliminarDetalleInteresado(agregarAnteproyectoModel);
		if(agregarAnteproyectoModel.getListaInteresados()!= null && agregarAnteproyectoModel.getListaInteresados().size()>0){
			for (int i = 0; i < agregarAnteproyectoModel.getListaInteresados().size(); i++) {
				InteresadoAnteproyectoModel interesadoAnteproyectoModel = agregarAnteproyectoModel.getListaInteresados().get(i);
				interesadoAnteproyectoModel.setIdProyecto(proyecto.getIdProyecto());
			}
			proyectoDao.insertarListaDetalleInteresado(agregarAnteproyectoModel.getListaInteresados());
		}				
//		FIN - GRABAR EN TABLA DETALLE INTERESADO
		
//		INI - GRABAR EN TABLA DETALLE ARCHIVO(LISTA OBSERVACIONES Y ANEXOS)
//		OBSERVACIONES
		agregarAnteproyectoModel.setTipoArchivo(new Long(1));
		proyectoDao.eliminarDetalleArchivoByTipoArchivoByIdPy(agregarAnteproyectoModel);
		if(agregarAnteproyectoModel.getListaObservaciones()!= null && agregarAnteproyectoModel.getListaObservaciones().size()>0){
			for (int i = 0; i < agregarAnteproyectoModel.getListaObservaciones().size(); i++) {
				ObservacionesAnteproyectoModel observacionesAnteproyectoModel = agregarAnteproyectoModel.getListaObservaciones().get(i);
				observacionesAnteproyectoModel.setIdProyecto(proyecto.getIdProyecto());
				observacionesAnteproyectoModel.setIdTipoArchivo(new Long(1));
			}
			proyectoDao.insertarListaDetalleObservaciones(agregarAnteproyectoModel.getListaObservaciones());
		}
		
//		ANEXOS
		agregarAnteproyectoModel.setTipoArchivo(new Long(2));
		proyectoDao.eliminarDetalleArchivoByTipoArchivoByIdPy(agregarAnteproyectoModel);
		if(agregarAnteproyectoModel.getListaAnexos()!= null && agregarAnteproyectoModel.getListaAnexos().size()>0){
			for (int i = 0; i < agregarAnteproyectoModel.getListaAnexos().size(); i++) {
				AnexosAnteproyectoModel anexosAnteproyectoModel = agregarAnteproyectoModel.getListaAnexos().get(i);
				anexosAnteproyectoModel.setIdProyecto(proyecto.getIdProyecto());
				anexosAnteproyectoModel.setIdTipoArchivo(new Long(2));
			}
			proyectoDao.insertarListaDetalleAnexo(agregarAnteproyectoModel.getListaAnexos());
		}
//		FIN - GRABAR EN TABLA DETALLE ARCHIVO(LISTA OBSERVACIONES Y ANEXOS)
		
//		INI - GRABAR TABLA DETALLE_PROYECTO_USER_ROL
		CustomerUser auth = (CustomerUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		DetProyectoUserRolModel detProyectoUserRolModel = new DetProyectoUserRolModel();
		detProyectoUserRolModel.setIdUserRol(auth.getIdRolUser());
		detProyectoUserRolModel.setIdProyecto(proyecto.getIdProyecto());
		DetProyectoUserRolModel detProyectoUserRolModelRpta = proyectoDao.listarDetPyUserRolByPyByUserRol(detProyectoUserRolModel);
		if(detProyectoUserRolModelRpta == null){
			detProyectoUserRolModel.setEstado(1);
			proyectoDao.grabarDetPyUserRol(detProyectoUserRolModel);
		}
//		FIN - GRABAR TABLA DETALLE_PROYECTO_USER_ROL
		
//		INI - GRABANDO ARCHIVOS
//		if(agregarAnteproyectoModel.getListaObservaciones()!= null && agregarAnteproyectoModel.getListaObservaciones().size()>0){
//			for (int i = 0; i < agregarAnteproyectoModel.getListaObservaciones().size(); i++) {
//				ObservacionesAnteproyectoModel observacionesAnteproyectoModel = agregarAnteproyectoModel.getListaObservaciones().get(i);
//				File inFile = new File(observacionesAnteproyectoModel.getRutaArchivo());
//				File outFile = new File("C:\\SIGCOMT_SERVIDOR");
//
//				FileInputStream in = new FileInputStream(inFile);
//				FileOutputStream out = new FileOutputStream(outFile);
//
//				int c;
//				while( (c = in.read() ) != -1)
//					out.write(c);
//
//				in.close();
//				out.close();
//			}
//		}
		
//		FIN - GRABANDO ARCHIVOS		
		
//		INI - ENVIO DE CORREOS
		String rutaLogo = ruta + "WEB-INF\\temp\\" + Constantes.LOGO_FIRMA_SIGCOMT;
		EnvioCorreo envioCorreo = new EnvioCorreo();
		envioCorreo.setCorreoDestino(agregarAnteproyectoModel.getCorreoResponsable());
		envioCorreo.setAsunto("Proyecto Asignado - "+agregarAnteproyectoModel.getTituloProyecto());
		String mensaje = "Estimado " + agregarAnteproyectoModel.getNombreResponsable()+
							" \n tienes asignado el proyecto "+ agregarAnteproyectoModel.getTituloProyecto();
		envioCorreo.setMensaje(mensaje);
		envioCorreo.setCorreoCopia("rargomedoc89@gmail.com");
		envioCorreo.setRutaLogo(rutaLogo);
		comunService.envioCorreo(envioCorreo);
//		FIN - ENVIO DE CORREOS
		return codigoPy;
		
		
		//
		
		
	}

	private void establecerProyecto(
			AgregarAnteproyectoModel agregarAnteproyectoModel, Proyecto proyecto)
			throws ParseException {
		proyecto.setIdProyectoAsociado(agregarAnteproyectoModel.getIdAsociadoProyecto());
		if(agregarAnteproyectoModel.getFechaContacto()!= null && agregarAnteproyectoModel.getFechaContacto()!=""){
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			Date fechaContacto = formatter.parse(agregarAnteproyectoModel.getFechaContacto());
			proyecto.setFechaContacto(fechaContacto);
			proyecto.setFechaContactoString(agregarAnteproyectoModel.getFechaContacto());
		}
		proyecto.setIdTipoProyecto(agregarAnteproyectoModel.getIdTipoProyecto());
		proyecto.setIdEjecutivoCuenta(agregarAnteproyectoModel.getIdEjecutivoCuenta());
		proyecto.setIdResponsableProyecto(agregarAnteproyectoModel.getIdResponsable());
		proyecto.setNombreProyecto(agregarAnteproyectoModel.getTituloProyecto());
		proyecto.setAlcanceInicial(agregarAnteproyectoModel.getAlcanceInicialProyecto());
		proyecto.setObjetivoInicial(agregarAnteproyectoModel.getObjetivo());
		proyecto.setEstado(1);
		proyecto.setIdEmpresa(agregarAnteproyectoModel.getIdEmpresa());
	}

	public AgregarAnteproyectoModel buscarProyectoById(Long idPy)
			throws Exception {
		return proyectoDao.buscarProyectoById(idPy);
	}

}
