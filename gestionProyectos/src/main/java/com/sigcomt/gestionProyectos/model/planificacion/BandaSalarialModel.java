package com.sigcomt.gestionProyectos.model.planificacion;

import java.io.Serializable;

public class BandaSalarialModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long idBandaSalarial;
	private String descripcion;
	private int estado;
	private Long idTipoNivel;
	
	public Long getIdBandaSalarial() {
		return idBandaSalarial;
	}
	public void setIdBandaSalarial(Long idBandaSalarial) {
		this.idBandaSalarial = idBandaSalarial;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public Long getIdTipoNivel() {
		return idTipoNivel;
	}
	public void setIdTipoNivel(Long idTipoNivel) {
		this.idTipoNivel = idTipoNivel;
	}

}
