package com.sigcomt.gestionProyectos.dominio.administracion;

import java.io.Serializable;
import java.util.Date;

public class Empresa implements Serializable
{
	private static final long serialVersionUID = 1L;
	private Long idEmpresa;
	private String razonSocial;
	private Integer estado;
	private String dscpais;
	private Long idpais;
	private String fechaRegistro;
	private String telefono;
	private String ruc;
	private String paginaWeb;
	private String redSocialFacebook;
	private String redSocialGmail;
	private String redSocialTwitter;
	private String redSocialLinkedin;
	private String anexo;
	private String correo;
	private String comoContacto;
	private String logo;
	private String formato;
	private String direccion;
	
	public Long getIdEmpresa() {
		return idEmpresa;
	}
	
	public void setIdEmpresa(Long idEmpresa) {
		this.idEmpresa = idEmpresa;
	}
	
	public String getRazonSocial() {
		return razonSocial;
	}
	
	public void setRazonSocial(String razonSocial) {
		this.razonSocial = razonSocial;
	}
	
	public Integer getEstado() {
		return estado;
	}
	public void setEstado(Integer estado) {
		this.estado = estado;
	}

	public String getFechaRegistro() {
		return fechaRegistro;
	}
	
	public void setFechaRegistro(String fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}
	
	public String getTelefono() {
		return telefono;
	}
	
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	
	public String getRuc() {
		return ruc;
	}
	
	public void setRuc(String ruc) {
		this.ruc = ruc;
	}
	
	public String getPaginaWeb() {
		return paginaWeb;
	}
	
	public void setPaginaWeb(String paginaWeb) {
		this.paginaWeb = paginaWeb;
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
	
	public String getComoContacto() {
		return comoContacto;
	}
	public void setComoContacto(String comoContacto) {
		this.comoContacto = comoContacto;
	}
	
	public String getLogo() {
		return logo;
	}
	
	public void setLogo(String logo) {
		this.logo = logo;
	}
	
	public String getFormato() {
		return formato;
	}
	
	public void setFormato(String formato) {
		this.formato = formato;
	}
	
	public Long getIdpais() {
		return idpais;
	}
	
	public void setIdpais(Long idpais) {
		this.idpais = idpais;
	}
	
	public String getRedSocialFacebook() {
		return redSocialFacebook;
	}

	public void setRedSocialFacebook(String redSocialFacebook) {
		this.redSocialFacebook = redSocialFacebook;
	}

	public String getRedSocialGmail() {
		return redSocialGmail;
	}

	public void setRedSocialGmail(String redSocialGmail) {
		this.redSocialGmail = redSocialGmail;
	}

	public String getRedSocialTwitter() {
		return redSocialTwitter;
	}

	public void setRedSocialTwitter(String redSocialTwitter) {
		this.redSocialTwitter = redSocialTwitter;
	}

	public String getRedSocialLinkedin() {
		return redSocialLinkedin;
	}

	public void setRedSocialLinkedin(String redSocialLinkedin) {
		this.redSocialLinkedin = redSocialLinkedin;
	}

	@Override
	public String toString() {
		return "Empresa [idEmpresa=" + idEmpresa + ", razonSocial="
				+ razonSocial + ", estado=" + estado + ", idpais=" + idpais
				+ ", fechaRegistro=" + fechaRegistro + ", telefono=" + telefono
				+ ", ruc=" + ruc + ", paginaWeb=" + paginaWeb
				+ ", redSocialFacebook=" + redSocialFacebook
				+ ", redSocialGmail=" + redSocialGmail + ", redSocialTwitter="
				+ redSocialTwitter + ", redSocialLinkedin=" + redSocialLinkedin
				+ ", anexo=" + anexo + ", correo=" + correo + ", comoContacto="
				+ comoContacto + ", logo=" + logo + ", formato=" + formato
				+ "]";
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getDscpais() {
		return dscpais;
	}

	public void setDscpais(String dscpais) {
		this.dscpais = dscpais;
	}
	
}
