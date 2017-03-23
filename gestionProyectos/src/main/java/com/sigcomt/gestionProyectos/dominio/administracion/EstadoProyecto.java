package com.sigcomt.gestionProyectos.dominio.administracion;

import java.io.Serializable;

public class EstadoProyecto implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String descripcion;
	private int estado;
	
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
	
	public int getEstado() {
		return estado;
	}
	
	public void setEstado(int estado) {
		this.estado = estado;
	}
	
	@Override
	public String toString() {
		return "EstadoProyecto [id=" + id + ", descripcion=" + descripcion
				+ ", estado=" + estado + "]";
	}
}
