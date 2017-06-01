package com.sigcomt.gestionProyectos.model.cierre;

import java.io.Serializable;

public class MntActaCierreModel implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long idActaCierre;
	private Long idSponsor;
	private Long idProyecto;
	private String declAceptacion;
	private int tipoLeccionEntregbale;
	private int tipoLeccionAdquisiciones;
	private int tipoLeccionLecAprendida;
	private int tipoLeccionEncuesta;
	private String vistaPrevia;
	private String observacion;
	private String firmas;
	private int envioCorreo;
	
	public Long getIdProyecto() {
		return idProyecto;
	}
	
	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
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

	public Long getIdActaCierre() {
		return idActaCierre;
	}

	public void setIdActaCierre(Long idActaCierre) {
		this.idActaCierre = idActaCierre;
	}

	public Long getIdSponsor() {
		return idSponsor;
	}

	public void setIdSponsor(Long idSponsor) {
		this.idSponsor = idSponsor;
	}

	public int getEnvioCorreo() {
		return envioCorreo;
	}

	public void setEnvioCorreo(int envioCorreo) {
		this.envioCorreo = envioCorreo;
	}

	@Override
	public String toString() {
		return "MntActaCierreModel [idActaCierre=" + idActaCierre
				+ ", idSponsor=" + idSponsor + ", idProyecto=" + idProyecto
				+ ", declAceptacion=" + declAceptacion
				+ ", tipoLeccionEntregbale=" + tipoLeccionEntregbale
				+ ", tipoLeccionAdquisiciones=" + tipoLeccionAdquisiciones
				+ ", tipoLeccionLecAprendida=" + tipoLeccionLecAprendida
				+ ", tipoLeccionEncuesta=" + tipoLeccionEncuesta
				+ ", vistaPrevia=" + vistaPrevia + ", observacion="
				+ observacion + ", firmas=" + firmas + ", envioCorreo="
				+ envioCorreo + "]";
	}	
}
