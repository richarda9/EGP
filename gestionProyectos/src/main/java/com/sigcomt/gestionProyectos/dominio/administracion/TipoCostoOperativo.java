package com.sigcomt.gestionProyectos.dominio.administracion;

import java.io.Serializable;

public class TipoCostoOperativo implements Serializable 
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
		return "CategoriaAdquisicion [id=" + id + ", descripcion="
				+ descripcion + ", estado=" + estado + "]";
	}
}
