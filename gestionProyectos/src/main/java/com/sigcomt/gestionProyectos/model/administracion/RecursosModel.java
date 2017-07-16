package com.sigcomt.gestionProyectos.model.administracion;

import java.io.Serializable;

public class RecursosModel implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private Long idTipoDocumento;
	private String nroDocumento;
	private String nombres;
	private String apellidos;
	private String nombreCompletos;
	private String celular;
	private Long idTipoCargo;
	private String dscTipoCargo;
	private String direccion;
	private String twitterRecurso;
	private String facebookRecurso;
	private String linkedinRecurso;
	private String gmailRecurso;
	private String correo;
	private String dscperfil;
	private Integer estado;
	private Integer tipoRol;
	
	public Long getIdTipoDocumento() {
		return idTipoDocumento;
	}
	
	public void setIdTipoDocumento(Long idTipoDocumento) {
		this.idTipoDocumento = idTipoDocumento;
	}
	
	public String getNroDocumento() {
		return nroDocumento;
	}
	
	public void setNroDocumento(String nroDocumento) {
		this.nroDocumento = nroDocumento;
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
	
	public String getNombreCompletos() {
		return nombreCompletos;
	}
	
	public void setNombreCompletos(String nombreCompletos) {
		this.nombreCompletos = nombreCompletos;
	}
	
	public String getCelular() {
		return celular;
	}
	
	public void setCelular(String celular) {
		this.celular = celular;
	}
	
	public Long getIdTipoCargo() {
		return idTipoCargo;
	}
	
	public void setIdTipoCargo(Long idTipoCargo) {
		this.idTipoCargo = idTipoCargo;
	}
	
	public String getDireccion() {
		return direccion;
	}
	
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	
	public String getTwitterRecurso() {
		return twitterRecurso;
	}
	
	public void setTwitterRecurso(String twitterRecurso) {
		this.twitterRecurso = twitterRecurso;
	}
	
	public String getFacebookRecurso() {
		return facebookRecurso;
	}
	
	public void setFacebookRecurso(String facebookRecurso) {
		this.facebookRecurso = facebookRecurso;
	}
	
	public String getLinkedinRecurso() {
		return linkedinRecurso;
	}
	
	public void setLinkedinRecurso(String linkedinRecurso) {
		this.linkedinRecurso = linkedinRecurso;
	}
	
	public String getGmailRecurso() {
		return gmailRecurso;
	}
	
	public void setGmailRecurso(String gmailRecurso) {
		this.gmailRecurso = gmailRecurso;
	}
	
	public String getCorreo() {
		return correo;
	}
	
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	
	public String getDscperfil() {
		return dscperfil;
	}
	
	public void setDscperfil(String dscperfil) {
		this.dscperfil = dscperfil;
	}

	public String getDscTipoCargo() {
		return dscTipoCargo;
	}

	public void setDscTipoCargo(String dscTipoCargo) {
		this.dscTipoCargo = dscTipoCargo;
	}

	@Override
	public String toString() {
		return "RecursosModel [idTipoDocumento=" + idTipoDocumento
				+ ", nroDocumento=" + nroDocumento + ", nombres=" + nombres
				+ ", apellidos=" + apellidos + ", nombreCompletos="
				+ nombreCompletos + ", celular=" + celular + ", idTipoCargo="
				+ idTipoCargo + ", dscTipoCargo=" + dscTipoCargo
				+ ", direccion=" + direccion + ", twitterRecurso="
				+ twitterRecurso + ", facebookRecurso=" + facebookRecurso
				+ ", linkedinRecurso=" + linkedinRecurso + ", gmailRecurso="
				+ gmailRecurso + ", correo=" + correo + ", dscperfil="
				+ dscperfil + "]";
	}

	public Integer getEstado() {
		return estado;
	}

	public void setEstado(Integer estado) {
		this.estado = estado;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getTipoRol() {
		return tipoRol;
	}

	public void setTipoRol(Integer tipoRol) {
		this.tipoRol = tipoRol;
	}
}
