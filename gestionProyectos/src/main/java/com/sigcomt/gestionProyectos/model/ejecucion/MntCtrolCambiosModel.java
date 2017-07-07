package com.sigcomt.gestionProyectos.model.ejecucion;

import java.io.Serializable;

public class MntCtrolCambiosModel implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long idproyecto;
	private Long idCtrolCambios;
	private Long solicitanteCtrolCambios;
	private String descripcionCtrolCambios;
	private String fecSolCtrolCambios;
	private Long complejidadCtrolCambios;
	private String horasCtrolCambios;
	private String comentariosCtrolCambios;
	private Long codctrolcambios;
	private Integer estado;
	
	public Long getIdproyecto() {
		return idproyecto;
	}
	
	public void setIdproyecto(Long idproyecto) {
		this.idproyecto = idproyecto;
	}
	
	public Long getIdCtrolCambios() {
		return idCtrolCambios;
	}
	
	public void setIdCtrolCambios(Long idCtrolCambios) {
		this.idCtrolCambios = idCtrolCambios;
	}
	
	public Long getSolicitanteCtrolCambios() {
		return solicitanteCtrolCambios;
	}
	
	public void setSolicitanteCtrolCambios(Long solicitanteCtrolCambios) {
		this.solicitanteCtrolCambios = solicitanteCtrolCambios;
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

	public Long getComplejidadCtrolCambios() {
		return complejidadCtrolCambios;
	}

	public void setComplejidadCtrolCambios(Long complejidadCtrolCambios) {
		this.complejidadCtrolCambios = complejidadCtrolCambios;
	}

	public String getHorasCtrolCambios() {
		return horasCtrolCambios;
	}

	public void setHorasCtrolCambios(String horasCtrolCambios) {
		this.horasCtrolCambios = horasCtrolCambios;
	}

	public String getComentariosCtrolCambios() {
		return comentariosCtrolCambios;
	}

	public void setComentariosCtrolCambios(String comentariosCtrolCambios) {
		this.comentariosCtrolCambios = comentariosCtrolCambios;
	}

	public Integer getEstado() {
		return estado;
	}

	public void setEstado(Integer estado) {
		this.estado = estado;
	}

	public Long getCodctrolcambios() {
		return codctrolcambios;
	}

	public void setCodctrolcambios(Long codctrolcambios) {
		this.codctrolcambios = codctrolcambios;
	}
}
