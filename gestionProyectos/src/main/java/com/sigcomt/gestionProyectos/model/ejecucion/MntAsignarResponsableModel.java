package com.sigcomt.gestionProyectos.model.ejecucion;

import java.io.Serializable;

public class MntAsignarResponsableModel implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long idproyecto;
	private Long idrol;
	private Long idrecurso;
	private Integer tiporol;
	private Integer estado;
		
	public Long getIdproyecto() {
		return idproyecto;
	}
	
	public void setIdproyecto(Long idproyecto) {
		this.idproyecto = idproyecto;
	}
	
	public Long getIdrol() {
		return idrol;
	}
	
	public void setIdrol(Long idrol) {
		this.idrol = idrol;
	}
	
	public Long getIdrecurso() {
		return idrecurso;
	}
	
	public void setIdrecurso(Long idrecurso) {
		this.idrecurso = idrecurso;
	}

	public Integer getTiporol() {
		return tiporol;
	}

	public void setTiporol(Integer tiporol) {
		this.tiporol = tiporol;
	}

	public Integer getEstado() {
		return estado;
	}

	public void setEstado(Integer estado) {
		this.estado = estado;
	}
}
