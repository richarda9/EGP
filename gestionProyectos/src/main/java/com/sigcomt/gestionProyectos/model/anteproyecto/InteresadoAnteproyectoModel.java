package com.sigcomt.gestionProyectos.model.anteproyecto;

import java.io.Serializable;

public class InteresadoAnteproyectoModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long idInteresado;
	private String interes;
	
	public Long getIdInteresado() {
		return idInteresado;
	}
	public void setIdInteresado(Long idInteresado) {
		this.idInteresado = idInteresado;
	}
	public String getInteres() {
		return interes;
	}
	public void setInteres(String interes) {
		this.interes = interes;
	}	
}
