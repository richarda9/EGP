package com.sigcomt.gestionProyectos.model.ejecucion;

import java.io.Serializable;

public class LstCtrolCambiosModel implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long idproyecto;
	private Long idCtrolCambios;
	private String descripcionCtrolCambios;
	private String fecSolCtrolCambios;
	private Long idsolicitante;
	private String dscSolicitante;
	private Long idComplejidad;
	private String dscComplejidad;
	private String horasEstimadas;
	private String comentarios;
	private Long codctrolcambios;
	
	public Long getIdproyecto() {
		return idproyecto;
	}
	
	public void setIdproyecto(Long idproyecto) {
		this.idproyecto = idproyecto;
	}
	
	public String getDescripcionCtrolCambios() {
		return descripcionCtrolCambios;
	}
	
	public void setDescripcionCtrolCambios(String descripcionCtrolCambios) {
		this.descripcionCtrolCambios = descripcionCtrolCambios;
	}
	
	public String getFecSolCtrolCambios() {
		return fecSolCtrolCambios;
	}
	
	public void setFecSolCtrolCambios(String fecSolCtrolCambios) {
		this.fecSolCtrolCambios = fecSolCtrolCambios;
	}
	
	public Long getIdsolicitante() {
		return idsolicitante;
	}
	
	public void setIdsolicitante(Long idsolicitante) {
		this.idsolicitante = idsolicitante;
	}
	
	public String getDscSolicitante() {
		return dscSolicitante;
	}
	
	public void setDscSolicitante(String dscSolicitante) {
		this.dscSolicitante = dscSolicitante;
	}
	
	public String getDscComplejidad() {
		return dscComplejidad;
	}
	
	public void setDscComplejidad(String dscComplejidad) {
		this.dscComplejidad = dscComplejidad;
	}
	
	public String getHorasEstimadas() {
		return horasEstimadas;
	}
	
	public void setHorasEstimadas(String horasEstimadas) {
		this.horasEstimadas = horasEstimadas;
	}
	
	public String getComentarios() {
		return comentarios;
	}
	
	public void setComentarios(String comentarios) {
		this.comentarios = comentarios;
	}

	public Long getIdCtrolCambios() {
		return idCtrolCambios;
	}

	public void setIdCtrolCambios(Long idCtrolCambios) {
		this.idCtrolCambios = idCtrolCambios;
	}

	public Long getCodctrolcambios() {
		return codctrolcambios;
	}

	public void setCodctrolcambios(Long codctrolcambios) {
		this.codctrolcambios = codctrolcambios;
	}

	public Long getIdComplejidad() {
		return idComplejidad;
	}

	public void setIdComplejidad(Long idComplejidad) {
		this.idComplejidad = idComplejidad;
	}
}
