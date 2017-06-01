package com.sigcomt.gestionProyectos.model.cierre;

import java.io.Serializable;

public class LstLeccionAprendidaModel implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long idLeccionAprendida;
	private Long idProyecto;
	private Long idEntregableAfectado;
	private Long codLeccionAprendida;
	private String nombreEntregable;
	private String dscproblema;
	private String dsccausa;
	private String dsccorrelativa;
	private String dscobtenido;
	private String dscaprendida;
	
	public Long getIdEntregableAfectado() {
		return idEntregableAfectado;
	}
	
	public void setIdEntregableAfectado(Long idEntregableAfectado) {
		this.idEntregableAfectado = idEntregableAfectado;
	}
	
	public String getDscproblema() {
		return dscproblema;
	}
	
	public void setDscproblema(String dscproblema) {
		this.dscproblema = dscproblema;
	}
	
	public String getDsccausa() {
		return dsccausa;
	}
	
	public void setDsccausa(String dsccausa) {
		this.dsccausa = dsccausa;
	}
	
	public String getDsccorrelativa() {
		return dsccorrelativa;
	}
	
	public void setDsccorrelativa(String dsccorrelativa) {
		this.dsccorrelativa = dsccorrelativa;
	}
	
	public String getDscobtenido() {
		return dscobtenido;
	}
	
	public void setDscobtenido(String dscobtenido) {
		this.dscobtenido = dscobtenido;
	}
	
	public String getDscaprendida() {
		return dscaprendida;
	}
	
	public void setDscaprendida(String dscaprendida) {
		this.dscaprendida = dscaprendida;
	}

	public Long getIdProyecto() {
		return idProyecto;
	}

	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}
	
	public Long getCodLeccionAprendida() {
		return codLeccionAprendida;
	}

	public void setCodLeccionAprendida(Long codLeccionAprendida) {
		this.codLeccionAprendida = codLeccionAprendida;
	}
	
	public Long getIdLeccionAprendida() {
		return idLeccionAprendida;
	}

	public void setIdLeccionAprendida(Long idLeccionAprendida) {
		this.idLeccionAprendida = idLeccionAprendida;
	}

	public String getNombreEntregable() {
		return nombreEntregable;
	}

	public void setNombreEntregable(String nombreEntregable) {
		this.nombreEntregable = nombreEntregable;
	}

	@Override
	public String toString() {
		return "LstLeccionAprendidaModel [idLeccionAprendida="
				+ idLeccionAprendida + ", idProyecto=" + idProyecto
				+ ", idEntregableAfectado=" + idEntregableAfectado
				+ ", nombreEntregable=" + nombreEntregable
				+ ", codLeccionAprendida=" + codLeccionAprendida
				+ ", dscproblema=" + dscproblema + ", dsccausa=" + dsccausa
				+ ", dsccorrelativa=" + dsccorrelativa + ", dscobtenido="
				+ dscobtenido + ", dscaprendida=" + dscaprendida + "]";
	}
}
