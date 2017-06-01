package com.sigcomt.gestionProyectos.dominio.administracion;

import java.io.Serializable;

public class Entregable implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long identregable;
	private String nombre;
	private String descripcion;
	private String fechaProgramada;
	private int estado;
	private Long idestadoEntregable;
	private String fechaEnvio;
	private String fechaAprobacion;
	private int asignado;
	
	public Long getIdentregable() {
		return identregable;
	}
	
	public void setIdentregable(Long identregable) {
		this.identregable = identregable;
	}
	
	public String getNombre() {
		return nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public String getFechaProgramada() {
		return fechaProgramada;
	}
	
	public void setFechaProgramada(String fechaProgramada) {
		this.fechaProgramada = fechaProgramada;
	}
	
	public int getEstado() {
		return estado;
	}
	
	public void setEstado(int estado) {
		this.estado = estado;
	}
	
	public Long getIdestadoEntregable() {
		return idestadoEntregable;
	}
	
	public void setIdestadoEntregable(Long idestadoEntregable) {
		this.idestadoEntregable = idestadoEntregable;
	}
	
	public String getFechaEnvio() {
		return fechaEnvio;
	}
	
	public void setFechaEnvio(String fechaEnvio) {
		this.fechaEnvio = fechaEnvio;
	}
	
	public String getFechaAprobacion() {
		return fechaAprobacion;
	}
	
	public void setFechaAprobacion(String fechaAprobacion) {
		this.fechaAprobacion = fechaAprobacion;
	}
	
	public int getAsignado() {
		return asignado;
	}
	
	public void setAsignado(int asignado) {
		this.asignado = asignado;
	}
	
	@Override
	public String toString() {
		return "Entregable [identregable=" + identregable + ", nombre="
				+ nombre + ", descripcion=" + descripcion
				+ ", fechaProgramada=" + fechaProgramada + ", estado=" + estado
				+ ", idestadoEntregable=" + idestadoEntregable
				+ ", fechaEnvio=" + fechaEnvio + ", fechaAprobacion="
				+ fechaAprobacion + ", asignado=" + asignado + "]";
	}
}
