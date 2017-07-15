package com.sigcomt.gestionProyectos.model.administracion;

import java.io.Serializable;
import java.util.List;

public class MntEmpresaModel implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long idEmpresa;
	private Long idPersona;
	private Long idDetEmpPersona;
	private String razonSocialEmpresa;
	private String rucEmpresa;
	private Long paisEmpresa;
	private String paginawebEmpresa;
	private String direccionEmpresa;
	private String twitterEmpresa;
	private String fecebookEmpresa;
	private String linkedinEmpresa;
	private String gmailEmpresa;
	private String teleEmpresa;
	private String anexoEmpresa;
	private String correoEmpresa;
	private String contactoEmpresa;
	private String nomContEmpresa;
	private String apeContEmpresa;
	private String teleContEmpresa;
	private String anexoContEmpresa;
	private String emailContEmpresa;
	private Long cargoContEmpresa;
	private String areaContEmpresa;
	private String tablaContEmpresaProyecto_length;
	
	private List<ContactoEmpresaModel> lista;

	public Long getIdDetEmpPersona() {
		return idDetEmpPersona;
	}

	public void setIdDetEmpPersona(Long idDetEmpPersona) {
		this.idDetEmpPersona = idDetEmpPersona;
	}

	public String getRazonSocialEmpresa() {
		return razonSocialEmpresa;
	}

	public void setRazonSocialEmpresa(String razonSocialEmpresa) {
		this.razonSocialEmpresa = razonSocialEmpresa;
	}

	public String getRucEmpresa() {
		return rucEmpresa;
	}

	public void setRucEmpresa(String rucEmpresa) {
		this.rucEmpresa = rucEmpresa;
	}

	public Long getPaisEmpresa() {
		return paisEmpresa;
	}

	public void setPaisEmpresa(Long paisEmpresa) {
		this.paisEmpresa = paisEmpresa;
	}

	public String getPaginawebEmpresa() {
		return paginawebEmpresa;
	}

	public void setPaginawebEmpresa(String paginawebEmpresa) {
		this.paginawebEmpresa = paginawebEmpresa;
	}

	public String getDireccionEmpresa() {
		return direccionEmpresa;
	}

	public void setDireccionEmpresa(String direccionEmpresa) {
		this.direccionEmpresa = direccionEmpresa;
	}

	public String getTwitterEmpresa() {
		return twitterEmpresa;
	}

	public void setTwitterEmpresa(String twitterEmpresa) {
		this.twitterEmpresa = twitterEmpresa;
	}

	public String getFecebookEmpresa() {
		return fecebookEmpresa;
	}

	public void setFecebookEmpresa(String fecebookEmpresa) {
		this.fecebookEmpresa = fecebookEmpresa;
	}

	public String getLinkedinEmpresa() {
		return linkedinEmpresa;
	}

	public void setLinkedinEmpresa(String linkedinEmpresa) {
		this.linkedinEmpresa = linkedinEmpresa;
	}

	public String getGmailEmpresa() {
		return gmailEmpresa;
	}

	public void setGmailEmpresa(String gmailEmpresa) {
		this.gmailEmpresa = gmailEmpresa;
	}

	public String getTeleEmpresa() {
		return teleEmpresa;
	}

	public void setTeleEmpresa(String teleEmpresa) {
		this.teleEmpresa = teleEmpresa;
	}

	public String getAnexoEmpresa() {
		return anexoEmpresa;
	}

	public void setAnexoEmpresa(String anexoEmpresa) {
		this.anexoEmpresa = anexoEmpresa;
	}

	public String getCorreoEmpresa() {
		return correoEmpresa;
	}

	public void setCorreoEmpresa(String correoEmpresa) {
		this.correoEmpresa = correoEmpresa;
	}

	public String getContactoEmpresa() {
		return contactoEmpresa;
	}

	public void setContactoEmpresa(String contactoEmpresa) {
		this.contactoEmpresa = contactoEmpresa;
	}

	public String getNomContEmpresa() {
		return nomContEmpresa;
	}

	public void setNomContEmpresa(String nomContEmpresa) {
		this.nomContEmpresa = nomContEmpresa;
	}

	public String getApeContEmpresa() {
		return apeContEmpresa;
	}

	public void setApeContEmpresa(String apeContEmpresa) {
		this.apeContEmpresa = apeContEmpresa;
	}

	public String getTeleContEmpresa() {
		return teleContEmpresa;
	}

	public void setTeleContEmpresa(String teleContEmpresa) {
		this.teleContEmpresa = teleContEmpresa;
	}

	public String getAnexoContEmpresa() {
		return anexoContEmpresa;
	}

	public void setAnexoContEmpresa(String anexoContEmpresa) {
		this.anexoContEmpresa = anexoContEmpresa;
	}

	public String getEmailContEmpresa() {
		return emailContEmpresa;
	}

	public void setEmailContEmpresa(String emailContEmpresa) {
		this.emailContEmpresa = emailContEmpresa;
	}

	public Long getCargoContEmpresa() {
		return cargoContEmpresa;
	}

	public void setCargoContEmpresa(Long cargoContEmpresa) {
		this.cargoContEmpresa = cargoContEmpresa;
	}

	public String getAreaContEmpresa() {
		return areaContEmpresa;
	}

	public void setAreaContEmpresa(String areaContEmpresa) {
		this.areaContEmpresa = areaContEmpresa;
	}

	public List<ContactoEmpresaModel> getLista() {
		return lista;
	}

	public void setLista(List<ContactoEmpresaModel> lista) {
		this.lista = lista;
	}

	@Override
	public String toString() {
		return "MntEmpresaModel [idDetEmpPersona=" + idDetEmpPersona
				+ ", razonSocialEmpresa=" + razonSocialEmpresa
				+ ", rucEmpresa=" + rucEmpresa + ", paisEmpresa=" + paisEmpresa
				+ ", paginawebEmpresa=" + paginawebEmpresa
				+ ", direccionEmpresa=" + direccionEmpresa
				+ ", twitterEmpresa=" + twitterEmpresa + ", fecebookEmpresa="
				+ fecebookEmpresa + ", linkedinEmpresa=" + linkedinEmpresa
				+ ", gmailEmpresa=" + gmailEmpresa + ", teleEmpresa="
				+ teleEmpresa + ", anexoEmpresa=" + anexoEmpresa
				+ ", correoEmpresa=" + correoEmpresa + ", contactoEmpresa="
				+ contactoEmpresa + ", nomContEmpresa=" + nomContEmpresa
				+ ", apeContEmpresa=" + apeContEmpresa + ", teleContEmpresa="
				+ teleContEmpresa + ", anexoContEmpresa=" + anexoContEmpresa
				+ ", emailContEmpresa=" + emailContEmpresa
				+ ", cargoContEmpresa=" + cargoContEmpresa
				+ ", areaContEmpresa=" + areaContEmpresa + ", lista=" + lista
				+ "]";
	}

	public String getTablaContEmpresaProyecto_length() {
		return tablaContEmpresaProyecto_length;
	}

	public void setTablaContEmpresaProyecto_length(
			String tablaContEmpresaProyecto_length) {
		this.tablaContEmpresaProyecto_length = tablaContEmpresaProyecto_length;
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
	
}
