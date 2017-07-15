package com.sigcomt.gestionProyectos.common.enumerations;

public enum EstadoProyectoEnum {
	
	EN_ANTEPROYECTO ("1", "EN_ANTEPROYECTO"),
	EN_PLANIFICACION ("2", "EN_PLANIFICACION"),
	EN_EJECUCION ("3", "EN_EJECUCION"),
	EN_CIERRE ("4", "EN_CIERRE"),
	CANCELADO ("5", "CANCELADO"),
	CERRADO ("6", "CERRADO");
	
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
