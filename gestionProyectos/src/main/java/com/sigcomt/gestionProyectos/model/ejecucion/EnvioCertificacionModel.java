package com.sigcomt.gestionProyectos.model.ejecucion;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class EnvioCertificacionModel implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private String destinoCertificacion;
	private String ccdestinoCertificacion;
	private String asuntoDestinoCertificacion;
	private String observacionCertificacion;
//	private MultipartFile fichero;
	
	public String getDestinoCertificacion() {
		return destinoCertificacion;
	}
	
	public void setDestinoCertificacion(String destinoCertificacion) {
		this.destinoCertificacion = destinoCertificacion;
	}
	
	public String getCcdestinoCertificacion() {
		return ccdestinoCertificacion;
	}
	
	public void setCcdestinoCertificacion(String ccdestinoCertificacion) {
		this.ccdestinoCertificacion = ccdestinoCertificacion;
	}
	
	public String getAsuntoDestinoCertificacion() {
		return asuntoDestinoCertificacion;
	}
	
	public void setAsuntoDestinoCertificacion(String asuntoDestinoCertificacion) {
		this.asuntoDestinoCertificacion = asuntoDestinoCertificacion;
	}
	
	public String getObservacionCertificacion() {
		return observacionCertificacion;
	}
	
	public void setObservacionCertificacion(String observacionCertificacion) {
		this.observacionCertificacion = observacionCertificacion;
	}

	@Override
	public String toString() {
		return "EnvioCertificacionModel [destinoCertificacion="
				+ destinoCertificacion + ", ccdestinoCertificacion="
				+ ccdestinoCertificacion + ", asuntoDestinoCertificacion="
				+ asuntoDestinoCertificacion + ", observacionCertificacion="
				+ observacionCertificacion + "]";
	}

//	public MultipartFile getFichero() {
//		return fichero;
//	}
//
//	public void setFichero(MultipartFile fichero) {
//		this.fichero = fichero;
//	}
	
}