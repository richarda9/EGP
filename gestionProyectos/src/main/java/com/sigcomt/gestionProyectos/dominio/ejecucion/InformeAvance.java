package com.sigcomt.gestionProyectos.dominio.ejecucion;

import java.io.Serializable;

public class InformeAvance implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private Long idProyecto;
	private String descripcion;
	private String fechaEnvio;
	private Long idTipoAvance;
	private String dscTipoAvance;
	private String fechaInicio;
	private String fechaFin;
	private Long dirigido;
	private Integer incluirAdquisiciones;
	private Integer incluirCtrolCambios;
	private Integer incluirTareaTerminada;
	private Integer incluirTareaAtrasada;
	private Integer incluirReuniones;
	private Integer envioCorreo;
	private Integer estado;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Long getIdProyecto() {
		return idProyecto;
	}
	
	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public String getFechaEnvio() {
		return fechaEnvio;
	}
	
	public void setFechaEnvio(String fechaEnvio) {
		this.fechaEnvio = fechaEnvio;
	}
	
	public Long getIdTipoAvance() {
		return idTipoAvance;
	}
	
	public void setIdTipoAvance(Long idTipoAvance) {
		this.idTipoAvance = idTipoAvance;
	}
	
	public String getFechaInicio() {
		return fechaInicio;
	}
	
	public void setFechaInicio(String fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	
	public String getFechaFin() {
		return fechaFin;
	}
	
	public void setFechaFin(String fechaFin) {
		this.fechaFin = fechaFin;
	}
	
	public Long getDirigido() {
		return dirigido;
	}
	
	public void setDirigido(Long dirigido) {
		this.dirigido = dirigido;
	}
	
	public Integer getIncluirAdquisiciones() {
		return incluirAdquisiciones;
	}
	
	public void setIncluirAdquisiciones(Integer incluirAdquisiciones) {
		this.incluirAdquisiciones = incluirAdquisiciones;
	}
	
	public Integer getIncluirCtrolCambios() {
		return incluirCtrolCambios;
	}
	
	public void setIncluirCtrolCambios(Integer incluirCtrolCambios) {
		this.incluirCtrolCambios = incluirCtrolCambios;
	}
	
	public Integer getIncluirTareaTerminada() {
		return incluirTareaTerminada;
	}
	
	public void setIncluirTareaTerminada(Integer incluirTareaTerminada) {
		this.incluirTareaTerminada = incluirTareaTerminada;
	}
	
	public Integer getIncluirTareaAtrasada() {
		return incluirTareaAtrasada;
	}
	
	public void setIncluirTareaAtrasada(Integer incluirTareaAtrasada) {
		this.incluirTareaAtrasada = incluirTareaAtrasada;
	}
	
	public Integer getIncluirReuniones() {
		return incluirReuniones;
	}
	
	public void setIncluirReuniones(Integer incluirReuniones) {
		this.incluirReuniones = incluirReuniones;
	}
	
	@Override
	public String toString() {
		return "InformeAvance [id=" + id + ", idProyecto=" + idProyecto
				+ ", descripcion=" + descripcion + ", fechaEnvio=" + fechaEnvio
				+ ", idTipoAvance=" + idTipoAvance + ", fechaInicio="
				+ fechaInicio + ", fechaFin=" + fechaFin + ", dirigido="
				+ dirigido + ", incluirAdquisiciones=" + incluirAdquisiciones
				+ ", incluirCtrolCambios=" + incluirCtrolCambios
				+ ", incluirTareaTerminada=" + incluirTareaTerminada
				+ ", incluirTareaAtrasada=" + incluirTareaAtrasada
				+ ", incluirReuniones=" + incluirReuniones + "]";
	}

	public String getDscTipoAvance() {
		return dscTipoAvance;
	}

	public void setDscTipoAvance(String dscTipoAvance) {
		this.dscTipoAvance = dscTipoAvance;
	}

	public Integer getEnvioCorreo() {
		return envioCorreo;
	}

	public void setEnvioCorreo(Integer envioCorreo) {
		this.envioCorreo = envioCorreo;
	}

	public Integer getEstado() {
		return estado;
	}

	public void setEstado(Integer estado) {
		this.estado = estado;
	}
}
