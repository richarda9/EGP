package com.sigcomt.gestionProyectos.model.planificacion;

import java.io.Serializable;

public class DetalleBandaSalarialModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long idDetalleBandaSalarial;
	private Long costoBandaSalarial;
	private int estado;
	private Long idTipoRol;
	private Long idBandaSalarial;
	
	public Long getIdDetalleBandaSalarial() {
		return idDetalleBandaSalarial;
	}
	public void setIdDetalleBandaSalarial(Long idDetalleBandaSalarial) {
		this.idDetalleBandaSalarial = idDetalleBandaSalarial;
	}
	public Long getCostoBandaSalarial() {
		return costoBandaSalarial;
	}
	public void setCostoBandaSalarial(Long costoBandaSalarial) {
		this.costoBandaSalarial = costoBandaSalarial;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public Long getIdTipoRol() {
		return idTipoRol;
	}
	public void setIdTipoRol(Long idTipoRol) {
		this.idTipoRol = idTipoRol;
	}
	public Long getIdBandaSalarial() {
		return idBandaSalarial;
	}
	public void setIdBandaSalarial(Long idBandaSalarial) {
		this.idBandaSalarial = idBandaSalarial;
	}		
}
