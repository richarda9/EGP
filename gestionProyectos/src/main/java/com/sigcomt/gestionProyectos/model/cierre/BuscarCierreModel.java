package com.sigcomt.gestionProyectos.model.cierre;

import java.io.Serializable;

public class BuscarCierreModel implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long idCliente;
	private Long idTipoProyecto;
	private Long estado;
	private String fechaInicio;
	private String fechaFin;
	private Long estado1;
	private Long estado2;
	
	public Long getIdCliente() {
		return idCliente;
	}
	
	public void setIdCliente(Long idCliente) {
		this.idCliente = idCliente;
	}
	
	public Long getIdTipoProyecto() {
		return idTipoProyecto;
	}
	
	public void setIdTipoProyecto(Long idTipoProyecto) {
		this.idTipoProyecto = idTipoProyecto;
	}
	
	public Long getEstado() {
		return estado;
	}
	
	public void setEstado(Long estado) {
		this.estado = estado;
	}
	
	public String getFechaInicio() {
		return fechaInicio;
	}
	
	public void setFechaInicio(String fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	
	public String getFechaFin() {
		return fechaFin;
	}
	
	public void setFechaFin(String fechaFin) {
		this.fechaFin = fechaFin;
	}

	@Override
	public String toString() {
		return "BuscarCierreModel [idCliente=" + idCliente
				+ ", idTipoProyecto=" + idTipoProyecto + ", estado=" + estado
				+ ", fechaInicio=" + fechaInicio + ", fechaFin=" + fechaFin
				+ "]";
	}

	public Long getEstado1() {
		return estado1;
	}

	public void setEstado1(Long estado1) {
		this.estado1 = estado1;
	}

	public Long getEstado2() {
		return estado2;
	}

	public void setEstado2(Long estado2) {
		this.estado2 = estado2;
	}
}
