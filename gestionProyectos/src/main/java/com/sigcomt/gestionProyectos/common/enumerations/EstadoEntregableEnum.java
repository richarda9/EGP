package com.sigcomt.gestionProyectos.common.enumerations;

public enum EstadoEntregableEnum 
{
	PENDIENTE ("1","PENDIENTE"),
	EN_CERTIFICACION ("2", "EN CERTIFICACION"),
	OBSERVADO ("5", "OBSERVADO"),
	APROBADO ("6", "APROBADO");
	
	private String codigo;
	private String descripcion;

	private EstadoEntregableEnum(String codigo, String descripcion) {
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
