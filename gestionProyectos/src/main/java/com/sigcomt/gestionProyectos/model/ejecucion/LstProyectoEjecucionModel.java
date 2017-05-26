package com.sigcomt.gestionProyectos.model.ejecucion;

import java.io.Serializable;

public class LstProyectoEjecucionModel implements Serializable
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long idProyecto;
	private String dscProyecto;
	private Long idCliente;
	private String dscCliente;
	private Long idTipoProyecto;
	private String dscTipoProyecto;
	private String fechaInicio;
	private Long idResponsable;
	private String dscResponsable;
	
	public Long getIdProyecto() {
		return idProyecto;
	}
	
	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}
	
	public String getDscProyecto() {
		return dscProyecto;
	}
	
	public void setDscProyecto(String dscProyecto) {
		this.dscProyecto = dscProyecto;
	}
	
	public Long getIdCliente() {
		return idCliente;
	}
	
	public void setIdCliente(Long idCliente) {
		this.idCliente = idCliente;
	}
	
	public String getDscCliente() {
		return dscCliente;
	}
	
	public void setDscCliente(String dscCliente) {
		this.dscCliente = dscCliente;
	}
	
	public Long getIdTipoProyecto() {
		return idTipoProyecto;
	}
	
	public void setIdTipoProyecto(Long idTipoProyecto) {
		this.idTipoProyecto = idTipoProyecto;
	}
	
	public String getDscTipoProyecto() {
		return dscTipoProyecto;
	}
	
	public void setDscTipoProyecto(String dscTipoProyecto) {
		this.dscTipoProyecto = dscTipoProyecto;
	}
	
	public String getFechaInicio() {
		return fechaInicio;
	}
	
	public void setFechaInicio(String fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	
	public Long getIdResponsable() {
		return idResponsable;
	}
	
	public void setIdResponsable(Long idResponsable) {
		this.idResponsable = idResponsable;
	}
	
	public String getDscResponsable() {
		return dscResponsable;
	}
	
	public void setDscResponsable(String dscResponsable) {
		this.dscResponsable = dscResponsable;
	}
}
