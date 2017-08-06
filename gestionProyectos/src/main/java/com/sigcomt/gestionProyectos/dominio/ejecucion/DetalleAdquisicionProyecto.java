package com.sigcomt.gestionProyectos.dominio.ejecucion;

import java.io.Serializable;
import java.math.BigDecimal;

public class DetalleAdquisicionProyecto implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private Long idproyecto;
	private Long idcatadquisicion;
	private Long idestadoadquisicion;
	private String 	producto;
	private Integer cantidad;
	private BigDecimal costoUnitario;
	private String fechaAdquisicion;
	private Integer estado;
	private Long idresponsable;
	private String 	categoriaDescripcion;
	
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
	
	public Long getIdcatadquisicion() {
		return idcatadquisicion;
	}
	
	public void setIdcatadquisicion(Long idcatadquisicion) {
		this.idcatadquisicion = idcatadquisicion;
	}
	
	public Long getIdestadoadquisicion() {
		return idestadoadquisicion;
	}
	
	public void setIdestadoadquisicion(Long idestadoadquisicion) {
		this.idestadoadquisicion = idestadoadquisicion;
	}
	
	public String getProducto() {
		return producto;
	}
	
	public void setProducto(String producto) {
		this.producto = producto;
	}
	
	public Integer getCantidad() {
		return cantidad;
	}
	
	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}
	
	public BigDecimal getCostoUnitario() {
		return costoUnitario;
	}
	
	public void setCostoUnitario(BigDecimal costoUnitario) {
		this.costoUnitario = costoUnitario;
	}
	
	public String getFechaAdquisicion() {
		return fechaAdquisicion;
	}
	
	public void setFechaAdquisicion(String fechaAdquisicion) {
		this.fechaAdquisicion = fechaAdquisicion;
	}
	
	public Integer getEstado() {
		return estado;
	}
	
	public void setEstado(Integer estado) {
		this.estado = estado;
	}

	public Long getIdresponsable() {
		return idresponsable;
	}

	public void setIdresponsable(Long idresponsable) {
		this.idresponsable = idresponsable;
	}

	public String getCategoriaDescripcion() {
		return categoriaDescripcion;
	}

	public void setCategoriaDescripcion(String categoriaDescripcion) {
		this.categoriaDescripcion = categoriaDescripcion;
	}
	
	
	
}
