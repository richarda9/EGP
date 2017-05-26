package com.sigcomt.gestionProyectos.model.anteproyecto;

import java.io.Serializable;

public class InteresadoAnteproyectoModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long idInteresado;
	private String interes;
	private String nombreInteresado;
	private String cargo;
	
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
	public String getNombreInteresado() {
		return nombreInteresado;
	}
	public void setNombreInteresado(String nombreInteresado) {
		this.nombreInteresado = nombreInteresado;
	}
	public String getCargo() {
		return cargo;
	}
	public void setCargo(String cargo) {
		this.cargo = cargo;
	}
}
