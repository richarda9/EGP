package com.sigcomt.gestionProyectos.model.planificacion;

import java.io.Serializable;

public class DetalleRiesgosModel implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Long idDetalleRiesgos;
	private Long idProyecto;
	private String valRiesgo;
	private String valResponsable;
	private String valImpacto;
	private Long valProbabilidad;
	private String valContigencia;
	private String valMitigacion;
	private int estado;
	
	public Long getIdDetalleRiesgos() {
		return idDetalleRiesgos;
	}
	public void setIdDetalleRiesgos(Long idDetalleRiesgos) {
		this.idDetalleRiesgos = idDetalleRiesgos;
	}
	public Long getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}
	public String getValRiesgo() {
		return valRiesgo;
	}
	public void setValRiesgo(String valRiesgo) {
		this.valRiesgo = valRiesgo;
	}
	public String getValResponsable() {
		return valResponsable;
	}
	public void setValResponsable(String valResponsable) {
		this.valResponsable = valResponsable;
	}
	public String getValImpacto() {
		return valImpacto;
	}
	public void setValImpacto(String valImpacto) {
		this.valImpacto = valImpacto;
	}
	public Long getValProbabilidad() {
		return valProbabilidad;
	}
	public void setValProbabilidad(Long valProbabilidad) {
		this.valProbabilidad = valProbabilidad;
	}
	public String getValContigencia() {
		return valContigencia;
	}
	public void setValContigencia(String valContigencia) {
		this.valContigencia = valContigencia;
	}
	public String getValMitigacion() {
		return valMitigacion;
	}
	public void setValMitigacion(String valMitigacion) {
		this.valMitigacion = valMitigacion;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	
	

}
