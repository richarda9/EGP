package com.sigcomt.gestionProyectos.model.administracion;

import java.io.Serializable;

public class TipoRequisitoProyectoModel implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String descripcion;
	private Integer estado;
	private Long idTipoProyecto;
	private String dscTipoProyecto;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
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
	
	@Override
	public String toString() {
		return "TipoRequisitoProyectoModel [id=" + id + ", descripcion="
				+ descripcion + ", estado=" + estado + ", idTipoProyecto="
				+ idTipoProyecto + ", dscTipoProyecto=" + dscTipoProyecto + "]";
	}
}
