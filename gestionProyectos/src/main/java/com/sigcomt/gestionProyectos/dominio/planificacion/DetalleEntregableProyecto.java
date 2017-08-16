package com.sigcomt.gestionProyectos.dominio.planificacion;

import java.io.Serializable;

public class DetalleEntregableProyecto implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private Long idproyecto;
	private Long identregable;
	private String producto;
	private Integer estado;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Long getIdproyecto() {
		return idproyecto;
	}
	
	public void setIdproyecto(Long idproyecto) {
		this.idproyecto = idproyecto;
	}
	
	public Long getIdentregable() {
		return identregable;
	}
	
	public void setIdentregable(Long identregable) {
		this.identregable = identregable;
	}
	
	public String getProducto() {
		return producto;
	}
	
	public void setProducto(String producto) {
		this.producto = producto;
	}
	
	public Integer getEstado() {
		return estado;
	}
	
	public void setEstado(Integer estado) {
		this.estado = estado;
	}
	
	@Override
	public String toString() {
		return "DetalleEntregableProyecto [id=" + id + ", idproyecto="
				+ idproyecto + ", identregable=" + identregable + ", producto="
				+ producto + ", estado=" + estado + "]";
	}
}
