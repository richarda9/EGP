package com.sigcomt.gestionProyectos.model.planificacion;

import java.io.Serializable;

public class DetalleCostoProyecto implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long idDetalleCostoProyecto;
	private Long idDetalleRolProyecto;
	private Long idBandaSalarial;
	private Long costo;
	private Long idTipoNivel;
	private int estado;
	private Long idProyecto;
	
	private String descripcionRol;
	private String descripcionBandaSalarial;
	private String descripcionTipo;
	
	public Long getIdDetalleCostoProyecto() {
		return idDetalleCostoProyecto;
	}
	public void setIdDetalleCostoProyecto(Long idDetalleCostoProyecto) {
		this.idDetalleCostoProyecto = idDetalleCostoProyecto;
	}
	public Long getIdDetalleRolProyecto() {
		return idDetalleRolProyecto;
	}
	public void setIdDetalleRolProyecto(Long idDetalleRolProyecto) {
		this.idDetalleRolProyecto = idDetalleRolProyecto;
	}
	public Long getIdBandaSalarial() {
		return idBandaSalarial;
	}
	public void setIdBandaSalarial(Long idBandaSalarial) {
		this.idBandaSalarial = idBandaSalarial;
	}
	public Long getCosto() {
		return costo;
	}
	public void setCosto(Long costo) {
		this.costo = costo;
	}
	public Long getIdTipoNivel() {
		return idTipoNivel;
	}
	public void setIdTipoNivel(Long idTipoNivel) {
		this.idTipoNivel = idTipoNivel;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public Long getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}
	public String getDescripcionRol() {
		return descripcionRol;
	}
	public void setDescripcionRol(String descripcionRol) {
		this.descripcionRol = descripcionRol;
	}
	public String getDescripcionBandaSalarial() {
		return descripcionBandaSalarial;
	}
	public void setDescripcionBandaSalarial(String descripcionBandaSalarial) {
		this.descripcionBandaSalarial = descripcionBandaSalarial;
	}
	public String getDescripcionTipo() {
		return descripcionTipo;
	}
	public void setDescripcionTipo(String descripcionTipo) {
		this.descripcionTipo = descripcionTipo;
	}
	
}
