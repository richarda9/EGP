package com.sigcomt.gestionProyectos.dominio.administracion;

import java.io.Serializable;

public class DetalleEmpresaPersona implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private Long idEmpresa;
	private Long idPersona;
	private Integer estado;
	private String area;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Long getIdEmpresa() {
		return idEmpresa;
	}
	
	public void setIdEmpresa(Long idEmpresa) {
		this.idEmpresa = idEmpresa;
	}
	
	public Long getIdPersona() {
		return idPersona;
	}
	
	public void setIdPersona(Long idPersona) {
		this.idPersona = idPersona;
	}
	
	public Integer getEstado() {
		return estado;
	}
	
	public void setEstado(Integer estado) {
		this.estado = estado;
	}
	
	public String getArea() {
		return area;
	}
	
	public void setArea(String area) {
		this.area = area;
	}

	@Override
	public String toString() {
		return "DetalleEmpresaPersona [id=" + id + ", idEmpresa=" + idEmpresa
				+ ", idPersona=" + idPersona + ", estado=" + estado + ", area="
				+ area + "]";
	}
}
