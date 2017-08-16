package com.sigcomt.gestionProyectos.model.planificacion;

import java.io.Serializable;
import java.util.List;

import com.sigcomt.gestionProyectos.dominio.planificacion.DetalleEntregableProyecto;

public class EntregableModel implements Serializable 
{
	private static final long serialVersionUID = 1L;
	
	private String valorET;
	private String valDescripcionET;
	private String fechaProgramadaET;
	private String valProductoET;
	private Long idDetProductoProyecto;
	private Long idEntregableProyecto;
	private Long idEstadoEntregable;
	private Long idProyecto;
	private List<DetalleEntregableProyecto> producto;
	private String tablaProductoEntregable_length;
		
	public String getValorET() {
		return valorET;
	}
	
	public void setValorET(String valorET) {
		this.valorET = valorET;
	}
	
	public String getValDescripcionET() {
		return valDescripcionET;
	}
	
	public void setValDescripcionET(String valDescripcionET) {
		this.valDescripcionET = valDescripcionET;
	}
	
	public String getFechaProgramadaET() {
		return fechaProgramadaET;
	}
	
	public void setFechaProgramadaET(String fechaProgramadaET) {
		this.fechaProgramadaET = fechaProgramadaET;
	}
	
	public String getValProductoET() {
		return valProductoET;
	}
	
	public void setValProductoET(String valProductoET) {
		this.valProductoET = valProductoET;
	}
	
	@Override
	public String toString() {
		return "EntregableModel [valorET=" + valorET + ", valDescripcionET="
				+ valDescripcionET + ", fechaProgramadaET=" + fechaProgramadaET
				+ ", valProductoET=" + valProductoET + "]";
	}
	
	public Long getIdDetProductoProyecto() {
		return idDetProductoProyecto;
	}
	
	public void setIdDetProductoProyecto(Long idDetProductoProyecto) {
		this.idDetProductoProyecto = idDetProductoProyecto;
	}
	
	public Long getIdEntregableProyecto() {
		return idEntregableProyecto;
	}
	
	public void setIdEntregableProyecto(Long idEntregableProyecto) {
		this.idEntregableProyecto = idEntregableProyecto;
	}
	
	public List<DetalleEntregableProyecto> getProducto() {
		return producto;
	}
	
	public void setProducto(List<DetalleEntregableProyecto> producto) {
		this.producto = producto;
	}

	public Long getIdEstadoEntregable() {
		return idEstadoEntregable;
	}

	public void setIdEstadoEntregable(Long idEstadoEntregable) {
		this.idEstadoEntregable = idEstadoEntregable;
	}

	public Long getIdProyecto() {
		return idProyecto;
	}

	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}

	public String getTablaProductoEntregable_length() {
		return tablaProductoEntregable_length;
	}

	public void setTablaProductoEntregable_length(
			String tablaProductoEntregable_length) {
		this.tablaProductoEntregable_length = tablaProductoEntregable_length;
	}
}
