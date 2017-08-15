package com.sigcomt.gestionProyectos.model.reporte;

import java.io.Serializable;

public class ReporteProyectoModel implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long idCliente;
	private Long idTipoProyecto;
	private Long idEstadoProyecto;
	private Integer estadoRegistro;
	private String fechaInicioProyecto;
	private String fechafinProyecto;
	
	public Long getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(Long idCliente) {
		this.idCliente = idCliente;
	}
	public Long getIdTipoProyecto() {
		return idTipoProyecto;
	}
	public void setIdTipoProyecto(Long idTipoProyecto) {
		this.idTipoProyecto = idTipoProyecto;
	}
	public Long getIdEstadoProyecto() {
		return idEstadoProyecto;
	}
	public void setIdEstadoProyecto(Long idEstadoProyecto) {
		this.idEstadoProyecto = idEstadoProyecto;
	}
	public Integer getEstadoRegistro() {
		return estadoRegistro;
	}
	public void setEstadoRegistro(Integer estadoRegistro) {
		this.estadoRegistro = estadoRegistro;
	}
	public String getFechaInicioProyecto() {
		return fechaInicioProyecto;
	}
	public void setFechaInicioProyecto(String fechaInicioProyecto) {
		this.fechaInicioProyecto = fechaInicioProyecto;
	}
	public String getFechafinProyecto() {
		return fechafinProyecto;
	}
	public void setFechafinProyecto(String fechafinProyecto) {
		this.fechafinProyecto = fechafinProyecto;
	}
	
	

}
