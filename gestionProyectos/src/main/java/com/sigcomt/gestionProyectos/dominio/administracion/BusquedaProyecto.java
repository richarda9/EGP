package com.sigcomt.gestionProyectos.dominio.administracion;

import java.io.Serializable;

public class BusquedaProyecto implements Serializable
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long idProyecto;
	private Long idCliente;
	private Long idTipoProyecto;
	private Long idResponsableProyecto;
	private String fechaInicio;
	private String fechaFin;
	
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

}
