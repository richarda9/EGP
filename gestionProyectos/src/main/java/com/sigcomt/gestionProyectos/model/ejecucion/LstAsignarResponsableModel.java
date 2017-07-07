package com.sigcomt.gestionProyectos.model.ejecucion;

import java.io.Serializable;

public class LstAsignarResponsableModel implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private Long idtiporol;
	private String dsctiporol;
	private Long idpersona;
	private String nomcompletopersona;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Long getIdtiporol() {
		return idtiporol;
	}
	
	public void setIdtiporol(Long idtiporol) {
		this.idtiporol = idtiporol;
	}
	
	public String getDsctiporol() {
		return dsctiporol;
	}
	
	public void setDsctiporol(String dsctiporol) {
		this.dsctiporol = dsctiporol;
	}
	
	public Long getIdpersona() {
		return idpersona;
	}
	
	public void setIdpersona(Long idpersona) {
		this.idpersona = idpersona;
	}
	
	public String getNomcompletopersona() {
		return nomcompletopersona;
	}
	
	public void setNomcompletopersona(String nomcompletopersona) {
		this.nomcompletopersona = nomcompletopersona;
	}

	@Override
	public String toString() {
		return "LstAsignarResponsableModel [id=" + id + ", idtiporol="
				+ idtiporol + ", dsctiporol=" + dsctiporol + ", idpersona="
				+ idpersona + ", nomcompletopersona=" + nomcompletopersona
				+ "]";
	}
}
