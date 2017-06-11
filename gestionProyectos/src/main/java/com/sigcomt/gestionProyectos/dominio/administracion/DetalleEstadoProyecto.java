package com.sigcomt.gestionProyectos.dominio.administracion;

import java.io.Serializable;
import java.util.Date;

public class DetalleEstadoProyecto implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long idDetalleEstadoProyecto;
	private Long idEstadoProyecto;
	private Long idProyecto;
	private Date fechaCreacion;
	private Date fechaAprobacion;
	private int estado;
	
	public Long getIdDetalleEstadoProyecto() {
		return idDetalleEstadoProyecto;
	}
	public void setIdDetalleEstadoProyecto(Long idDetalleEstadoProyecto) {
		this.idDetalleEstadoProyecto = idDetalleEstadoProyecto;
	}
	public Long getIdEstadoProyecto() {
		return idEstadoProyecto;
	}
	public void setIdEstadoProyecto(Long idEstadoProyecto) {
		this.idEstadoProyecto = idEstadoProyecto;
	}
	public Long getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}
	public Date getFechaCreacion() {
		return fechaCreacion;
	}
	public void setFechaCreacion(Date fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}
	public Date getFechaAprobacion() {
		return fechaAprobacion;
	}
	public void setFechaAprobacion(Date fechaAprobacion) {
		this.fechaAprobacion = fechaAprobacion;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
}
