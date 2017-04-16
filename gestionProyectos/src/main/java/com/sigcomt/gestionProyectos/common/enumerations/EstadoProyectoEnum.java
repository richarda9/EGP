package com.sigcomt.gestionProyectos.common.enumerations;

public enum EstadoProyectoEnum {
	
	EN_ANTEPROYECTO ("12", "EN_ANTEPROYECTO"),
	EN_PLANIFICACION ("13", "EN_PLANIFICACION"),
	EN_EJECUCION ("14", "EN_EJECUCION"),
	EN_CIERRE ("15", "EN_CIERRE");
	
	private String codigo;
	private String descripcion;
	
	private EstadoProyectoEnum(String codigo, String descripcion){
		this.codigo = codigo;
		this.descripcion = descripcion;
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
}
