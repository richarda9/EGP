package com.sigcomt.gestionProyectos.dominio.ejecucion;

import java.io.Serializable;

public class DetalleRolProyecto implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private Long idProyecto;
	private Long idtiporol;
	private String descripcion;
	private int cantidad;
	private int estado;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Long getIdProyecto() {
		return idProyecto;
	}
	
	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}
	
	public Long getIdtiporol() {
		return idtiporol;
	}
	
	public void setIdtiporol(Long idtiporol) {
		this.idtiporol = idtiporol;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public int getCantidad() {
		return cantidad;
	}
	
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	
	public Integer getEstado() {
		return estado;
	}
	
	public void setEstado(Integer estado) {
		this.estado = estado;
	}

	@Override
	public String toString() {
		return "DetalleRolProyecto [id=" + id + ", idproyecto=" + idProyecto
				+ ", idtiporol=" + idtiporol + ", descripcion=" + descripcion
				+ ", cantidad=" + cantidad + ", estado=" + estado + "]";
	}
}
