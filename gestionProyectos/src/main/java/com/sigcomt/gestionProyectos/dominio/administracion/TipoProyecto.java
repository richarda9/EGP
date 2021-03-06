package com.sigcomt.gestionProyectos.dominio.administracion;

import java.io.Serializable;

public class TipoProyecto implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1540007663686836339L;
	
	private Long id;
	private String descripcion;
	private Integer estado;
	
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

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "TipoProyecto [id=" + id + ", descripcion=" + descripcion
				+ ", estado=" + estado + "]";
	}
}
