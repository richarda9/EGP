package com.sigcomt.gestionProyectos.model.ejecucion;

import java.io.Serializable;

public class BuscarEjecucionModel implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long idProyecto;
	private Long idCliente;
	private Long idTipoProyecto;
	private Long idResponsableProyecto;
	private String fechaInicio;
	private String fechaFin;
	private int estado;
	
	public Long getIdProyecto() {
		return idProyecto;
	}
	
	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}
	
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
	
	public Long getIdResponsableProyecto() {
		return idResponsableProyecto;
	}
	
	public void setIdResponsableProyecto(Long idResponsableProyecto) {
		this.idResponsableProyecto = idResponsableProyecto;
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

	public int getEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}

	@Override
	public String toString() {
		return "BuscarEjecucionModel [idProyecto=" + idProyecto
				+ ", idCliente=" + idCliente + ", idTipoProyecto="
				+ idTipoProyecto + ", idResponsableProyecto="
				+ idResponsableProyecto + ", fechaInicio=" + fechaInicio
				+ ", fechaFin=" + fechaFin + ", estado=" + estado + "]";
	}	
}
