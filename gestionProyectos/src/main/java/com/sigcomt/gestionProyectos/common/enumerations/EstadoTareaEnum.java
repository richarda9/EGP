package com.sigcomt.gestionProyectos.common.enumerations;

public enum EstadoTareaEnum 
{
	PENDIENTE ("1","PENDIENTE"),
	ATRASADO ("2", "ATRASADO"),
	APROBADO ("3", "APROBADO"),
	EN_REVISION ("4", "EN REVISION"),
	OBSERVADO ("5", "OBSERVADO");
	
	private String codigo;
	private String descripcion;

	private EstadoTareaEnum(String codigo, String descripcion) {
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
