package com.sigcomt.gestionProyectos.model.planificacion;

import java.io.Serializable;

public class DependenciaPlanificacionModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long idTipoDependencia;
	private String descTipoDepedencia;
	private Long idProyecto;
	private String codigo;
	private String descripcion;
	
	public Long getIdTipoDependencia() {
		return idTipoDependencia;
	}
	public void setIdTipoDependencia(Long idTipoDependencia) {
		this.idTipoDependencia = idTipoDependencia;
	}
	public String getDescTipoDepedencia() {
		return descTipoDepedencia;
	}
	public void setDescTipoDepedencia(String descTipoDepedencia) {
		this.descTipoDepedencia = descTipoDepedencia;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Long getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}	
}
