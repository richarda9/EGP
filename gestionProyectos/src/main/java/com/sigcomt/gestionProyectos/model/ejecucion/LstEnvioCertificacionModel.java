package com.sigcomt.gestionProyectos.model.ejecucion;

import java.io.Serializable;

public class LstEnvioCertificacionModel implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private Long identregable;
	private Long idproyecto;
	private Long idestadoentregable;
	private String dscestadoentregable;
	private String dscentregable;
	private String fechaEnvio;
	private Long idresponentregable;
	private String nombreresponentregable;
	private String fechaAprobacion;
	private Long idcertificadorasignado;
	private String dsccertificador;
	private Integer indcertificacion;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Long getIdentregable() {
		return identregable;
	}
	
	public void setIdentregable(Long identregable) {
		this.identregable = identregable;
	}
	
	public Long getIdproyecto() {
		return idproyecto;
	}
	
	public void setIdproyecto(Long idproyecto) {
		this.idproyecto = idproyecto;
	}
	
	public Long getIdestadoentregable() {
		return idestadoentregable;
	}
	
	public void setIdestadoentregable(Long idestadoentregable) {
		this.idestadoentregable = idestadoentregable;
	}
	
	public String getDscestadoentregable() {
		return dscestadoentregable;
	}
	
	public void setDscestadoentregable(String dscestadoentregable) {
		this.dscestadoentregable = dscestadoentregable;
	}
	
	public String getDscentregable() {
		return dscentregable;
	}
	
	public void setDscentregable(String dscentregable) {
		this.dscentregable = dscentregable;
	}
	
	public String getFechaEnvio() {
		return fechaEnvio;
	}
	
	public void setFechaEnvio(String fechaEnvio) {
		this.fechaEnvio = fechaEnvio;
	}
	
	public Long getIdresponentregable() {
		return idresponentregable;
	}
	
	public void setIdresponentregable(Long idresponentregable) {
		this.idresponentregable = idresponentregable;
	}
	
	public String getNombreresponentregable() {
		return nombreresponentregable;
	}
	
	public void setNombreresponentregable(String nombreresponentregable) {
		this.nombreresponentregable = nombreresponentregable;
	}
	
	public String getFechaAprobacion() {
		return fechaAprobacion;
	}
	
	public void setFechaAprobacion(String fechaAprobacion) {
		this.fechaAprobacion = fechaAprobacion;
	}
	
	public Long getIdcertificadorasignado() {
		return idcertificadorasignado;
	}
	
	public void setIdcertificadorasignado(Long idcertificadorasignado) {
		this.idcertificadorasignado = idcertificadorasignado;
	}
	
	public String getDsccertificador() {
		return dsccertificador;
	}
	
	public void setDsccertificador(String dsccertificador) {
		this.dsccertificador = dsccertificador;
	}
	
	public Integer getIndcertificacion() {
		return indcertificacion;
	}
	
	public void setIndcertificacion(Integer indcertificacion) {
		this.indcertificacion = indcertificacion;
	}
	
	@Override
	public String toString() {
		return "LstEnvioCertificacionModel [id=" + id + ", identregable="
				+ identregable + ", idproyecto=" + idproyecto
				+ ", idestadoentregable=" + idestadoentregable
				+ ", dscestadoentregable=" + dscestadoentregable
				+ ", dscentregable=" + dscentregable + ", fechaEnvio="
				+ fechaEnvio + ", idresponentregable=" + idresponentregable
				+ ", nombreresponentregable=" + nombreresponentregable
				+ ", fechaAprobacion=" + fechaAprobacion
				+ ", idcertificadorasignado=" + idcertificadorasignado
				+ ", dsccertificador=" + dsccertificador
				+ ", indcertificacion=" + indcertificacion + "]";
	}
}
