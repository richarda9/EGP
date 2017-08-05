package com.sigcomt.gestionProyectos.common.enumerations;

public enum RolEnum {
	
	EJECUTIVO_CUENTA ("1", "EJECUTIVO DE CUENTA"),
	RESPONSABLE_PROYECTO ("2", "RESPONSABLE DEL PROYECTO"),
	CERTIFICADOR("3", "CERTIFICADOR");
	
	private String codigo;
	private String descripcion;
	
	private RolEnum(String codigo, String descripcion){
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
