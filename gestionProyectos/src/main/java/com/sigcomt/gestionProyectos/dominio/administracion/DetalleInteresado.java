package com.sigcomt.gestionProyectos.dominio.administracion;

import java.io.Serializable;

public class DetalleInteresado implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long idDetalleInteresado;
	private Long idDetalleEmpresaPersona;
	private Long idProyecto;
	private String interesContacto;
	private int estado;
	
	public Long getIdDetalleInteresado() {
		return idDetalleInteresado;
	}
	public void setIdDetalleInteresado(Long idDetalleInteresado) {
		this.idDetalleInteresado = idDetalleInteresado;
	}
	public Long getIdDetalleEmpresaPersona() {
		return idDetalleEmpresaPersona;
	}
	public void setIdDetalleEmpresaPersona(Long idDetalleEmpresaPersona) {
		this.idDetalleEmpresaPersona = idDetalleEmpresaPersona;
	}
	public Long getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}
	public String getInteresContacto() {
		return interesContacto;
	}
	public void setInteresContacto(String interesContacto) {
		this.interesContacto = interesContacto;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
}
