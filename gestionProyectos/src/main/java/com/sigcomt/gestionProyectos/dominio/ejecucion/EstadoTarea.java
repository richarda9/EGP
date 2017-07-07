package com.sigcomt.gestionProyectos.dominio.ejecucion;

import java.io.Serializable;

public class EstadoTarea implements Serializable
{

	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String descripcion;
	private Integer estado;
	
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
	
	@Override
	public String toString() {
		return "EstadoTarea [id=" + id + ", descripcion=" + descripcion
				+ ", estado=" + estado + "]";
	}
}
