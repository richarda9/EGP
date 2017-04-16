package com.sigcomt.gestionProyectos.model.anteproyecto;

import java.io.Serializable;
import java.util.Date;

public class BuscarAnteproyectoModel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int estado;
	private Long idEstadoProyecto;
	private Long idEmpresa;
	private String fechaInicio;
	private String fechaFin;
	private Long idTipoProyecto;
	private Long idResponsableProyecto;
	private Long idEjecutivoCuenta;
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public Long getIdEstadoProyecto() {
		return idEstadoProyecto;
	}
	public void setIdEstadoProyecto(Long idEstadoProyecto) {
		this.idEstadoProyecto = idEstadoProyecto;
	}
	public Long getIdEmpresa() {
		return idEmpresa;
	}
	public void setIdEmpresa(Long idEmpresa) {
		this.idEmpresa = idEmpresa;
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
	public Long getIdTipoProyecto() {
		return idTipoProyecto;
	}
	public void setIdTipoProyecto(Long idTipoProyecto) {
		this.idTipoProyecto = idTipoProyecto;
	}
	public Long getIdResponsableProyecto() {
		return idResponsableProyecto;
	}
	public void setIdResponsableProyecto(Long idResponsableProyecto) {
		this.idResponsableProyecto = idResponsableProyecto;
	}
	public Long getIdEjecutivoCuenta() {
		return idEjecutivoCuenta;
	}
	public void setIdEjecutivoCuenta(Long idEjecutivoCuenta) {
		this.idEjecutivoCuenta = idEjecutivoCuenta;
	}
}
