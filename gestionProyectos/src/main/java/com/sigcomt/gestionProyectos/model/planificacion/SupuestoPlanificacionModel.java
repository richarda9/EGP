package com.sigcomt.gestionProyectos.model.planificacion;

import java.io.Serializable;

public class SupuestoPlanificacionModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long idTipoSupuesto;
	private String descTipoSupuesto;
	private Long idProyecto;
	private String codigo;
	private String descripcion;
	
	public Long getIdTipoSupuesto() {
		return idTipoSupuesto;
	}
	public void setIdTipoSupuesto(Long idTipoSupuesto) {
		this.idTipoSupuesto = idTipoSupuesto;
	}
	public String getDescTipoSupuesto() {
		return descTipoSupuesto;
	}
	public void setDescTipoSupuesto(String descTipoSupuesto) {
		this.descTipoSupuesto = descTipoSupuesto;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Long getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}	
}
