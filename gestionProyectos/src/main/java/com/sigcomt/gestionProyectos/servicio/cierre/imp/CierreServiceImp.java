package com.sigcomt.gestionProyectos.servicio.cierre.imp;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sigcomt.gestionProyectos.common.Constantes;
import com.sigcomt.gestionProyectos.common.enumerations.EstadoProyectoEnum;
import com.sigcomt.gestionProyectos.dominio.administracion.DetalleEstadoProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.DetalleProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.Entregable;
import com.sigcomt.gestionProyectos.dominio.administracion.Proyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.Sponsor;
import com.sigcomt.gestionProyectos.model.cancelar.CancelarProyectoModel;
import com.sigcomt.gestionProyectos.model.cierre.LstActaCierreModel;
import com.sigcomt.gestionProyectos.model.cierre.LstLeccionAprendidaModel;
import com.sigcomt.gestionProyectos.model.cierre.MntActaCierreModel;
import com.sigcomt.gestionProyectos.model.cierre.MntLeccionAprendidaModel;
import com.sigcomt.gestionProyectos.repositorio.anteproyecto.ProyectoDao;
import com.sigcomt.gestionProyectos.repositorio.cierre.CierreDao;
import com.sigcomt.gestionProyectos.servicio.cierre.CierreService;

@Service
public class CierreServiceImp implements CierreService
{

	@Autowired
	CierreDao cierreDao;
	
	@Autowired
	ProyectoDao proyectoDao;
	
	public List<Entregable> listaEntregable(Integer idproyecto) {
		return cierreDao.listaEntregable(idproyecto);
	}

	public int mntLeccionAprendida(MntLeccionAprendidaModel dato) {
		return cierreDao.mntLeccionAprendida(dato);
	}

	public List<LstLeccionAprendidaModel> listarLeccionesAprendidas(
			MntLeccionAprendidaModel bsqLeccionAprendida) {
		return cierreDao.listarLeccionesAprendidas(bsqLeccionAprendida);
	}

	public int eliminarLeccionesAprendidas(MntLeccionAprendidaModel bsqLeccionAprendida) {
		return cierreDao.eliminarLeccionesAprendidas(bsqLeccionAprendida);
	}

	public List<Sponsor> listaSponsor(Sponsor sponsor) {
		return cierreDao.listaSponsor(sponsor);
	}

	public int mntActaCierre(MntActaCierreModel dato) {
		return cierreDao.mntActaCierre(dato);
	}

	public List<LstActaCierreModel> listarActaCierre(MntActaCierreModel bsqActaCierre) {
		return cierreDao.listarActaCierre(bsqActaCierre);
	}

	@Transactional
	public void registrarCierreProyecto(Proyecto proyecto) 
	{
		proyectoDao.actualizarProyecto(proyecto);
		DetalleProyecto detalle = new DetalleProyecto();
		
		detalle.setIdProyecto(proyecto.getIdProyecto());
		detalle.setIdEstado(new Long(EstadoProyectoEnum.CERRADO.getCodigo()));
		detalle.setEstado(Constantes.ESTADO_INACTIVO);
		proyectoDao.actualizarDetalleProyecto(detalle);
		
		detalle.setEstado(Constantes.ESTADO_ACTIVO);
		proyectoDao.registrarDetallleProyecto(detalle);
	}
	
	public void cancelarProyecto(CancelarProyectoModel dato){
		Proyecto proyecto = new Proyecto();
		DetalleEstadoProyecto detalleEstadoProyecto = new DetalleEstadoProyecto();
		SimpleDateFormat formato = new SimpleDateFormat("DD/MM/YYYY HH:mm:ss");
		
		proyecto.setIdProyecto(dato.getIdproyecto());
		proyecto.setJustificacionCancelacion(dato.getCancelarJustificacionProyecto());
		try {
			proyecto.setFechaCancelacion(formato.parse(dato.getFecCancelacion()));
		} catch (ParseException e) {
			proyecto.setFechaCancelacion(new Date());
		}
		
		detalleEstadoProyecto.setIdProyecto(dato.getIdproyecto());
		detalleEstadoProyecto.setIdEstadoProyecto(new Long(EstadoProyectoEnum.CANCELADO.getCodigo()));
		detalleEstadoProyecto.setEstado(Constantes.ESTADO_ACTIVO);
		detalleEstadoProyecto.setFechaCreacion(proyecto.getFechaCancelacion());		
		
		proyectoDao.grabarDetalleEstadoProyectoByEstado(detalleEstadoProyecto);
		
		DetalleProyecto detalle = new DetalleProyecto();
		detalle.setIdProyecto(dato.getIdproyecto());
		detalle.setEstado(Constantes.ESTADO_INACTIVO);
		
		proyectoDao.actualizarDetalleProyecto(detalle);
		proyectoDao.actualizarProyecto(proyecto);		
	}
	
}
