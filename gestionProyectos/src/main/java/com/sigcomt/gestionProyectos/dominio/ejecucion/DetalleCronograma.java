package com.sigcomt.gestionProyectos.dominio.ejecucion;

import java.io.Serializable;

public class DetalleCronograma implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String nombre;
	private Integer duracion;
	private String fechaInicio;
	private String fechaFin;
	private Integer precede;
	private String recursos;
	private Long idproyecto;
	private Integer estado;
	private Long idcomplejidad;
	private Long idestado;
	private String justificacion;
	private Long idcontrolcambios;
	private Long idpersona;
	private Long coddetallecronograma;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getNombre() {
		return nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public Integer getDuracion() {
		return duracion;
	}
	
	public void setDuracion(Integer duracion) {
		this.duracion = duracion;
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
	
	public Integer getPrecede() {
		return precede;
	}
	
	public void setPrecede(Integer precede) {
		this.precede = precede;
	}
	
	public String getRecursos() {
		return recursos;
	}
	
	public void setRecursos(String recursos) {
		this.recursos = recursos;
	}
	
	public Long getIdproyecto() {
		return idproyecto;
	}
	
	public void setIdproyecto(Long idproyecto) {
		this.idproyecto = idproyecto;
	}
	
	public Integer getEstado() {
		return estado;
	}
	
	public void setEstado(Integer estado) {
		this.estado = estado;
	}
	
	public Long getIdcomplejidad() {
		return idcomplejidad;
	}
	
	public void setIdcomplejidad(Long idcomplejidad) {
		this.idcomplejidad = idcomplejidad;
	}
	
	public Long getIdestado() {
		return idestado;
	}
	
	public void setIdestado(Long idestado) {
		this.idestado = idestado;
	}
	
	public String getJustificacion() {
		return justificacion;
	}
	
	public void setJustificacion(String justificacion) {
		this.justificacion = justificacion;
	}
	
	public Long getIdcontrolcambios() {
		return idcontrolcambios;
	}
	
	public void setIdcontrolcambios(Long idcontrolcambios) {
		this.idcontrolcambios = idcontrolcambios;
	}
	
	public Long getIdpersona() {
		return idpersona;
	}
	
	public void setIdpersona(Long idpersona) {
		this.idpersona = idpersona;
	}
	
	public Long getCoddetallecronograma() {
		return coddetallecronograma;
	}
	
	public void setCoddetallecronograma(Long coddetallecronograma) {
		this.coddetallecronograma = coddetallecronograma;
	}
	
	@Override
	public String toString() {
		return "DetalleCronograma [id=" + id + ", nombre=" + nombre
				+ ", duracion=" + duracion + ", fechaInicio=" + fechaInicio
				+ ", fechaFin=" + fechaFin + ", precede=" + precede
				+ ", recursos=" + recursos + ", idproyecto=" + idproyecto
				+ ", estado=" + estado + ", idcomplejidad=" + idcomplejidad
				+ ", idestado=" + idestado + ", justificacion=" + justificacion
				+ ", idcontrolcambios=" + idcontrolcambios + ", idpersona="
				+ idpersona + ", coddetallecronograma=" + coddetallecronograma
				+ "]";
	}
}
