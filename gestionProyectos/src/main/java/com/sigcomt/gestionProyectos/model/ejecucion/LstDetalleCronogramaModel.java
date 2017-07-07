package com.sigcomt.gestionProyectos.model.ejecucion;

import java.io.Serializable;
import java.util.List;

public class LstDetalleCronogramaModel implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String descripcion;
	private String fechaInicio;
	private String fechaFin;
	private String dscComplejidad;
	private Integer horas;
	private String dscEstado;
	private String justificacion;
	private Long idEstado;
	private Long idComplejidad;
	private String dscRecursos;
	private List<Long> idRecursos;
	private String dscResponsable;
	private Long idResponsable;
	private Integer precede;
	private Long codigo;
	private Integer estadoTarea;
	
	private Long idProyecto;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
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
	
	public String getDscComplejidad() {
		return dscComplejidad;
	}
	
	public void setDscComplejidad(String dscComplejidad) {
		this.dscComplejidad = dscComplejidad;
	}
	
	public Long getIdComplejidad() {
		return idComplejidad;
	}
	
	public void setIdComplejidad(Long idComplejidad) {
		this.idComplejidad = idComplejidad;
	}
	
	public Integer getHoras() {
		return horas;
	}
	
	public void setHoras(Integer horas) {
		this.horas = horas;
	}

	public String getJustificacion() {
		return justificacion;
	}
	
	public void setJustificacion(String justificacion) {
		this.justificacion = justificacion;
	}
	
	public String getDscEstado() {
		return dscEstado;
	}

	public void setDscEstado(String dscEstado) {
		this.dscEstado = dscEstado;
	}

	public String getDscRecursos() {
		return dscRecursos;
	}

	public void setDscRecursos(String dscRecursos) {
		this.dscRecursos = dscRecursos;
	}

	public List<Long> getIdRecursos() {
		return idRecursos;
	}

	public void setIdRecursos(List<Long> idRecursos) {
		this.idRecursos = idRecursos;
	}

	public String getDscResponsable() {
		return dscResponsable;
	}

	public void setDscResponsable(String dscResponsable) {
		this.dscResponsable = dscResponsable;
	}

	public Long getIdResponsable() {
		return idResponsable;
	}

	public void setIdResponsable(Long idResponsable) {
		this.idResponsable = idResponsable;
	}

	public Integer getPrecede() {
		return precede;
	}

	public void setPrecede(Integer precede) {
		this.precede = precede;
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public Long getIdEstado() {
		return idEstado;
	}

	public void setIdEstado(Long idEstado) {
		this.idEstado = idEstado;
	}

	public Integer getEstadoTarea() {
		return estadoTarea;
	}

	public void setEstadoTarea(Integer estadoTarea) {
		this.estadoTarea = estadoTarea;
	}

	@Override
	public String toString() {
		return "LstDetalleCronogramaModel [id=" + id + ", descripcion="
				+ descripcion + ", fechaInicio=" + fechaInicio + ", fechaFin="
				+ fechaFin + ", dscComplejidad=" + dscComplejidad + ", horas="
				+ horas + ", dscEstado=" + dscEstado + ", justificacion="
				+ justificacion + ", idEstado=" + idEstado + ", idComplejidad="
				+ idComplejidad + ", dscRecursos=" + dscRecursos
				+ ", idRecursos=" + idRecursos + ", dscResponsable="
				+ dscResponsable + ", idResponsable=" + idResponsable
				+ ", precede=" + precede + ", codigo=" + codigo
				+ ", estadoTarea=" + estadoTarea + "]";
	}

	public Long getIdProyecto() {
		return idProyecto;
	}

	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}
}