package com.sigcomt.gestionProyectos.model.ejecucion;

import java.io.Serializable;

public class LstDetalleAdquisicionesProyectoModel implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private Long idproyecto;
	private Long idCategAdquisicion;
	private String dscCategoria;
	private String descripcion;
	private String fechaCompra;
	private String dscResponsable;
	private Long idResponsable;
	private Integer cantidad;
	private String costoUnitario;
	private Integer estado;
	private Long idEstadoAdquisicion;
	private String dscEstadoAdquisicion;
	
	public Long getIdproyecto() {
		return idproyecto;
	}
	
	public void setIdproyecto(Long idproyecto) {
		this.idproyecto = idproyecto;
	}
	
	public Long getIdCategAdquisicion() {
		return idCategAdquisicion;
	}
	
	public void setIdCategAdquisicion(Long idCategAdquisicion) {
		this.idCategAdquisicion = idCategAdquisicion;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public String getFechaCompra() {
		return fechaCompra;
	}
	
	public void setFechaCompra(String fechaCompra) {
		this.fechaCompra = fechaCompra;
	}
	
	public String getDscResponsable() {
		return dscResponsable;
	}
	
	public void setDscResponsable(String dscResponsable) {
		this.dscResponsable = dscResponsable;
	}
	
	public Long getIdResponsable() {
		return idResponsable;
	}
	
	public void setIdResponsable(Long idResponsable) {
		this.idResponsable = idResponsable;
	}
	
	public Integer getCantidad() {
		return cantidad;
	}
	
	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}
	
	public String getCostoUnitario() {
		return costoUnitario;
	}
	
	public void setCostoUnitario(String costoUnitario) {
		this.costoUnitario = costoUnitario;
	}
	
	@Override
	public String toString() {
		return "LstDetalleAdquisicionesProyectoModel [idproyecto=" + idproyecto
				+ ", idCategAdquisicion=" + idCategAdquisicion
				+ ", descripcion=" + descripcion + ", fechaCompra="
				+ fechaCompra + ", dscResponsable=" + dscResponsable
				+ ", idResponsable=" + idResponsable + ", cantidad=" + cantidad
				+ ", costoUnitario=" + costoUnitario + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getEstado() {
		return estado;
	}

	public void setEstado(Integer estado) {
		this.estado = estado;
	}

	public String getDscCategoria() {
		return dscCategoria;
	}

	public void setDscCategoria(String dscCategoria) {
		this.dscCategoria = dscCategoria;
	}

	public Long getIdEstadoAdquisicion() {
		return idEstadoAdquisicion;
	}

	public void setIdEstadoAdquisicion(Long idEstadoAdquisicion) {
		this.idEstadoAdquisicion = idEstadoAdquisicion;
	}

	public String getDscEstadoAdquisicion() {
		return dscEstadoAdquisicion;
	}

	public void setDscEstadoAdquisicion(String dscEstadoAdquisicion) {
		this.dscEstadoAdquisicion = dscEstadoAdquisicion;
	}
}
