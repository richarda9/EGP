package com.sigcomt.gestionProyectos.dominio.administracion;

import java.io.Serializable;
import java.sql.Date;

public class DetalleProyecto implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long idDetalleProyecto;
	private Long idProyecto;
	private Long idEstado;
	private Date fechaCreacion;
	private Date fechaAprobacion;
	private Integer estado;
	
	public Long getIdDetalleProyecto() {
		return idDetalleProyecto;
	}
	
	public void setIdDetalleProyecto(Long idDetalleProyecto) {
		this.idDetalleProyecto = idDetalleProyecto;
	}
	
	public Long getIdProyecto() {
		return idProyecto;
	}
	
	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}
	
	public Long getIdEstado() {
		return idEstado;
	}
	
	public void setIdEstado(Long idEstado) {
		this.idEstado = idEstado;
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

	@Override
	public String toString() {
		return "DetalleProyecto [idDetalleProyecto=" + idDetalleProyecto
				+ ", idProyecto=" + idProyecto + ", idEstado=" + idEstado
				+ ", fechaCreacion=" + fechaCreacion + ", fechaAprobacion="
				+ fechaAprobacion + "]";
	}

	public Integer getEstado() {
		return estado;
	}

	public void setEstado(Integer estado) {
		this.estado = estado;
	}
}
