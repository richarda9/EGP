package com.sigcomt.gestionProyectos.model.cierre;

import java.io.Serializable;

public class LstActaCierreModel implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long idActaCierre;
	private Long idProyecto;
	private Long idSponsor;
	private Long idResponsable;
	private int versionActa;
	private String dscSponsor;
	private String responsable;
	private String fechaElaboracion;
	private String declAceptacion;
	private int tipoLeccionEntregbale;
	private int tipoLeccionAdquisiciones;
	private int tipoLeccionLecAprendida;
	private int tipoLeccionEncuesta;
	private String vistaPrevia;
	private String observacion;
	private String firmas;
	private int envioCorreo;
	
	public Long getIdActaCierre() {
		return idActaCierre;
	}
	
	public void setIdActaCierre(Long idActaCierre) {
		this.idActaCierre = idActaCierre;
	}
		
	public String getResponsable() {
		return responsable;
	}
	
	public void setResponsable(String responsable) {
		this.responsable = responsable;
	}
	
	public String getFechaElaboracion() {
		return fechaElaboracion;
	}
	
	public void setFechaElaboracion(String fechaElaboracion) {
		this.fechaElaboracion = fechaElaboracion;
	}

	public String getDeclAceptacion() {
		return declAceptacion;
	}

	public void setDeclAceptacion(String declAceptacion) {
		this.declAceptacion = declAceptacion;
	}

	public int getTipoLeccionEntregbale() {
		return tipoLeccionEntregbale;
	}

	public void setTipoLeccionEntregbale(int tipoLeccionEntregbale) {
		this.tipoLeccionEntregbale = tipoLeccionEntregbale;
	}

	public int getTipoLeccionAdquisiciones() {
		return tipoLeccionAdquisiciones;
	}

	public void setTipoLeccionAdquisiciones(int tipoLeccionAdquisiciones) {
		this.tipoLeccionAdquisiciones = tipoLeccionAdquisiciones;
	}

	public int getTipoLeccionLecAprendida() {
		return tipoLeccionLecAprendida;
	}

	public void setTipoLeccionLecAprendida(int tipoLeccionLecAprendida) {
		this.tipoLeccionLecAprendida = tipoLeccionLecAprendida;
	}

	public int getTipoLeccionEncuesta() {
		return tipoLeccionEncuesta;
	}

	public void setTipoLeccionEncuesta(int tipoLeccionEncuesta) {
		this.tipoLeccionEncuesta = tipoLeccionEncuesta;
	}

	public String getVistaPrevia() {
		return vistaPrevia;
	}

	public void setVistaPrevia(String vistaPrevia) {
		this.vistaPrevia = vistaPrevia;
	}

	public String getObservacion() {
		return observacion;
	}

	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}

	public String getFirmas() {
		return firmas;
	}

	public void setFirmas(String firmas) {
		this.firmas = firmas;
	}

	public int getEnvioCorreo() {
		return envioCorreo;
	}

	public void setEnvioCorreo(int envioCorreo) {
		this.envioCorreo = envioCorreo;
	}

	public Long getIdResponsable() {
		return idResponsable;
	}

	public void setIdResponsable(Long idResponsable) {
		this.idResponsable = idResponsable;
	}

	public Long getIdSponsor() {
		return idSponsor;
	}

	public void setIdSponsor(Long idSponsor) {
		this.idSponsor = idSponsor;
	}

	public String getDscSponsor() {
		return dscSponsor;
	}

	public void setDscSponsor(String dscSponsor) {
		this.dscSponsor = dscSponsor;
	}

	public Long getIdProyecto() {
		return idProyecto;
	}

	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}

	public int getVersionActa() {
		return versionActa;
	}

	public void setVersionActa(int versionActa) {
		this.versionActa = versionActa;
	}
	
	
}
