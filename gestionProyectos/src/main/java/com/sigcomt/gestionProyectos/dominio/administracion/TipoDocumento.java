package com.sigcomt.gestionProyectos.dominio.administracion;

import java.io.Serializable;

public class TipoDocumento implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String descripcion;
	private String abreviatura;
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
	
	public String getAbreviatura() {
		return abreviatura;
	}
	
	public void setAbreviatura(String abreviatura) {
		this.abreviatura = abreviatura;
	}

	public Integer getEstado() {
		return estado;
	}

	public void setEstado(Integer estado) {
		this.estado = estado;
	}

	@Override
	public String toString() {
		return "TipoDocumento [id=" + id + ", descripcion=" + descripcion
				+ ", abreviatura=" + abreviatura + ", estado=" + estado + "]";
	}
}
