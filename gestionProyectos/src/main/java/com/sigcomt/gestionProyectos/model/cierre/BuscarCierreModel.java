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
	private int estado;
	private String fechaInicio;
	private String fechaFin;
	
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
	
	public int getEstado() {
		return estado;
	}
	
	public void setEstado(int estado) {
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
}
