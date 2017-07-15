package com.sigcomt.gestionProyectos.dominio.administracion;

import java.io.Serializable;

public class TipoRequisito implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private Long idTipoProyecto;
	private String descripcion;
	private Integer estado;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Long getIdTipoProyecto() {
		return idTipoProyecto;
	}
	
	public void setIdTipoProyecto(Long idTipoProyecto) {
		this.idTipoProyecto = idTipoProyecto;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public Integer getEstado() {
		return estado;
	}
	
	public void setEstado(Integer estado) {
		this.estado = estado;
	}

	@Override
	public String toString() {
		return "TipoRequisito [id=" + id + ", idTipoProyecto=" + idTipoProyecto
				+ ", descripcion=" + descripcion + ", estado=" + estado + "]";
	}
}
