package com.sigcomt.gestionProyectos.model.planificacion;

import java.io.Serializable;

public class TipoNivelModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6158881790360925354L;
	
	private Long idTipoNivel;
	private String descripcion;
	private int estado;
	
	public Long getIdTipoNivel() {
		return idTipoNivel;
	}
	public void setIdTipoNivel(Long idTipoNivel) {
		this.idTipoNivel = idTipoNivel;
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
}
