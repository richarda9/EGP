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
	private Long idTipoDocumento;
	private String nrodocumento;
	private Integer estado;
	private String telefono;
	private String anexo;
	private String correo;
	private Long idTipoRol;
	private String direccion;
	private String rsfacebook;
	private String rstwitter;
	private String rslinkedin;
	private String rsgmail;
	private String perfilProfesional;
	
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

	public String getCodpersona() {
		return codpersona;
	}

	public void setCodpersona(String codpersona) {
		this.codpersona = codpersona;
	}

	public Long getIdTipoDocumento() {
		return idTipoDocumento;
	}

	public void setIdTipoDocumento(Long idTipoDocumento) {
		this.idTipoDocumento = idTipoDocumento;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getRsfacebook() {
		return rsfacebook;
	}

	public void setRsfacebook(String rsfacebook) {
		this.rsfacebook = rsfacebook;
	}

	public String getRstwitter() {
		return rstwitter;
	}

	public void setRstwitter(String rstwitter) {
		this.rstwitter = rstwitter;
	}

	public String getRslinkedin() {
		return rslinkedin;
	}

	public void setRslinkedin(String rslinkedin) {
		this.rslinkedin = rslinkedin;
	}

	public String getRsgmail() {
		return rsgmail;
	}

	public void setRsgmail(String rsgmail) {
		this.rsgmail = rsgmail;
	}

	public String getPerfilProfesional() {
		return perfilProfesional;
	}

	public void setPerfilProfesional(String perfilProfesional) {
		this.perfilProfesional = perfilProfesional;
	}

	@Override
	public String toString() {
		return "Persona [id=" + id + ", codpersona=" + codpersona
				+ ", nombres=" + nombres + ", apellidos=" + apellidos
				+ ", nombreCompleto=" + nombreCompleto + ", idTipoDocumento="
				+ idTipoDocumento + ", nrodocumento=" + nrodocumento
				+ ", estado=" + estado + ", telefono=" + telefono + ", anexo="
				+ anexo + ", correo=" + correo + ", idTipoRol=" + idTipoRol
				+ ", direccion=" + direccion + ", rsfacebook=" + rsfacebook
				+ ", rstwitter=" + rstwitter + ", rslinkedin=" + rslinkedin
				+ ", rsgmail=" + rsgmail + ", perfilProfesional="
				+ perfilProfesional + "]";
	}
}
