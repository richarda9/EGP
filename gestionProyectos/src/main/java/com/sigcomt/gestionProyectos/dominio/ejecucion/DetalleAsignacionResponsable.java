package com.sigcomt.gestionProyectos.dominio.ejecucion;

import java.io.Serializable;

public class DetalleAsignacionResponsable implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private Long iddetrolproyecto;
	private Long idpersona;
	private Long iddetempresa;
	private Integer estado;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Long getIddetrolproyecto() {
		return iddetrolproyecto;
	}
	
	public void setIddetrolproyecto(Long iddetrolproyecto) {
		this.iddetrolproyecto = iddetrolproyecto;
	}
	
	public Long getIdpersona() {
		return idpersona;
	}
	
	public void setIdpersona(Long idpersona) {
		this.idpersona = idpersona;
	}
	
	public Long getIddetempresa() {
		return iddetempresa;
	}
	
	public void setIddetempresa(Long iddetempresa) {
		this.iddetempresa = iddetempresa;
	}
	
	public Integer getEstado() {
		return estado;
	}
	
	public void setEstado(Integer estado) {
		this.estado = estado;
	}
	
	@Override
	public String toString() {
		return "DetalleAsginacionResponsable [id=" + id + ", iddetrolproyecto="
				+ iddetrolproyecto + ", idpersona=" + idpersona
				+ ", iddetempresa=" + iddetempresa + ", estado=" + estado + "]";
	}
}
