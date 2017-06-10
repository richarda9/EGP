package com.sigcomt.gestionProyectos.servicio.anteproyecto.imp;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.sigcomt.gestionProyectos.dominio.administracion.DetalleEstadoProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.DetalleInteresado;
import com.sigcomt.gestionProyectos.dominio.administracion.Proyecto;
import com.sigcomt.gestionProyectos.model.anteproyecto.AgregarAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.AnexosAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.InteresadoAnteproyectoModel;
import com.sigcomt.gestionProyectos.model.anteproyecto.ObservacionesAnteproyectoModel;
import com.sigcomt.gestionProyectos.repositorio.anteproyecto.ProyectoDao;
import com.sigcomt.gestionProyectos.servicio.anteproyecto.AnteproyectoService;

@Service
public class AnteproyectoServiceImp implements AnteproyectoService{
	
	@Autowired
	ProyectoDao proyectoDao;

	@Transactional
	public String grabarAnteproyecto(AgregarAnteproyectoModel agregarAnteproyectoModel) throws Exception {
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
		
		return codigoPy;
	}

	private void establecerProyecto(
			AgregarAnteproyectoModel agregarAnteproyectoModel, Proyecto proyecto)
			throws ParseException {
		proyecto.setIdProyectoAsociado(agregarAnteproyectoModel.getIdAsociadoProyecto());
		if(agregarAnteproyectoModel.getFechaContacto()!= null && agregarAnteproyectoModel.getFechaContacto()!=""){
			SimpleDateFormat formatter = new SimpleDateFormat("dd/mm/yyyy");
			Date fechaContacto = formatter.parse(agregarAnteproyectoModel.getFechaContacto());
			proyecto.setFechaContacto(fechaContacto);
		}
		proyecto.setIdTipoProyecto(agregarAnteproyectoModel.getIdTipoProyecto());
		proyecto.setIdEjecutivoCuenta(agregarAnteproyectoModel.getIdEjecutivoCuenta());
		proyecto.setIdResponsableProyecto(agregarAnteproyectoModel.getIdResponsable());
		proyecto.setNombreProyecto(agregarAnteproyectoModel.getTituloProyecto());
		proyecto.setAlcanceInicial(agregarAnteproyectoModel.getAlcanceInicialProyecto());
		proyecto.setObjetivoInicial(agregarAnteproyectoModel.getObjetivo());
		proyecto.setEstado(1);
	}

}
