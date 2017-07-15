package com.sigcomt.gestionProyectos.dominio.administracion;

import java.io.Serializable;

public class TipoRol implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String descripcion;
	private Integer estado;
	private Integer tipoRol;
	private String nombreRol;
	
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
	
	public Integer getTipoRol() {
		return tipoRol;
	}
	
	public void setTipoRol(Integer tipoRol) {
		this.tipoRol = tipoRol;
	}
	
	public String getNombreRol() {
		return nombreRol;
	}
	
	public void setNombreRol(String nombreRol) {
		this.nombreRol = nombreRol;
	}
	
	@Override
	public String toString() {
		return "TipoRol [id=" + id + ", descripcion=" + descripcion
				+ ", estado=" + estado + ", tipoRol=" + tipoRol
				+ ", nombreRol=" + nombreRol + "]";
	}
}
