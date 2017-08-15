package com.sigcomt.gestionProyectos.model.reporte;

import java.io.Serializable;

public class ReporteTareaProyectoModel implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long idProyecto;
	private Long idEstadoTarea;
	private String fechaInicio;
	private String fechaFin;
	
	public Long getIdProyecto() {
		return idProyecto;
	}
	
	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}
	
	public Long getIdEstadoTarea() {
		return idEstadoTarea;
	}
	
	public void setIdEstadoTarea(Long idEstadoTarea) {
		this.idEstadoTarea = idEstadoTarea;
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
	
	@Override
	public String toString() {
		return "ReporteTareaProyectoModel [idProyecto=" + idProyecto
				+ ", idEstadoTarea=" + idEstadoTarea + ", fechaInicio="
				+ fechaInicio + ", fechaFin=" + fechaFin + "]";
	}
}
