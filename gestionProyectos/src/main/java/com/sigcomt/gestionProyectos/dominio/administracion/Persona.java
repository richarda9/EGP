package com.sigcomt.gestionProyectos.dominio.administracion;

import java.io.Serializable;

public class Persona implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String codpersona;
	private String nombres;
	private String apellidos;
	private String nombreCompleto;
	private String tipdocumento;
	private String nrodocumento;
	private Integer estado;
	private String telefono;
	private String anexo;
	private String correo;
	private Long idTipoRol;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getNombres() {
		return nombres;
	}
	
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	
	public String getApellidos() {
		return apellidos;
	}
	
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	
	public String getNombreCompleto() {
		return nombreCompleto;
	}
	
	public void setNombreCompleto(String nombreCompleto) {
		this.nombreCompleto = nombreCompleto;
	}
	
	public String getTipdocumento() {
		return tipdocumento;
	}
	
	public void setTipdocumento(String tipdocumento) {
		this.tipdocumento = tipdocumento;
	}
	
	public String getNrodocumento() {
		return nrodocumento;
	}
	
	public void setNrodocumento(String nrodocumento) {
		this.nrodocumento = nrodocumento;
	}
	
	public Integer getEstado() {
		return estado;
	}
	
	public void setEstado(Integer estado) {
		this.estado = estado;
	}
	
	public String getTelefono() {
		return telefono;
	}
	
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	
	public String getAnexo() {
		return anexo;
	}
	
	public void setAnexo(String anexo) {
		this.anexo = anexo;
	}
	
	public String getCorreo() {
		return correo;
	}
	
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	
	public Long getIdTipoRol() {
		return idTipoRol;
	}
	
	public void setIdTipoRol(Long idTipoRol) {
		this.idTipoRol = idTipoRol;
	}

	@Override
	public String toString() {
		return "Persona [id=" + id + ", nombres=" + nombres + ", apellidos="
				+ apellidos + ", nombreCompleto=" + nombreCompleto
				+ ", tipdocumento=" + tipdocumento + ", nrodocumento="
				+ nrodocumento + ", estado=" + estado + ", telefono="
				+ telefono + ", anexo=" + anexo + ", correo=" + correo
				+ ", idTipoRol=" + idTipoRol + "]";
	}

	public String getCodpersona() {
		return codpersona;
	}

	public void setCodpersona(String codpersona) {
		this.codpersona = codpersona;
	}
}
