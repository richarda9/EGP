package com.sigcomt.gestionProyectos.common.enumerations;

public enum CargoContactoClienteEnum {
	
	CARGO_ANALISTA_PROGRAMADOR("1","ANALISTA PROGRAMADOR"),
	CARGO_ANALISTA_QAS("2","ANALISTA QA"),
	CARGO_JEFE_PROYECTO("3","JEFE PROYECTO");
	
	private String codigo;
	private String descripcion;
	
	private CargoContactoClienteEnum(String codigo, String descripcion){
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
