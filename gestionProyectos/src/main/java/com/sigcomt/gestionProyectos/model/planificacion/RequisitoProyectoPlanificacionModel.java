package com.sigcomt.gestionProyectos.model.planificacion;

import java.io.Serializable;

public class RequisitoProyectoPlanificacionModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long idTipoRequisito;	
	private String descTipoRequisito;
	private Long idProyecto;
	private String codigo;
	private String descripcion;
	private String observacion;
	
	public Long getIdTipoRequisito() {
		return idTipoRequisito;
	}
	public void setIdTipoRequisito(Long idTipoRequisito) {
		this.idTipoRequisito = idTipoRequisito;
	}
	public String getDescTipoRequisito() {
		return descTipoRequisito;
	}
	public void setDescTipoRequisito(String descTipoRequisito) {
		this.descTipoRequisito = descTipoRequisito;
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
	public String getObservacion() {
		return observacion;
	}
	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}
	public Long getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}	
}
