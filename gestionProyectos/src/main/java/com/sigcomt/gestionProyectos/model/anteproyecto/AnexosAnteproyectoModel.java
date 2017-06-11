package com.sigcomt.gestionProyectos.model.anteproyecto;

import java.io.Serializable;

public class AnexosAnteproyectoModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String anexo;
	private String archivo;
	private String rutaArchivo;
	private Long idProyecto;
	private Long idTipoArchivo;
	
	public String getAnexo() {
		return anexo;
	}
	public void setAnexo(String anexo) {
		this.anexo = anexo;
	}
	public String getArchivo() {
		return archivo;
	}
	public void setArchivo(String archivo) {
		this.archivo = archivo;
	}
	public String getRutaArchivo() {
		return rutaArchivo;
	}
	public void setRutaArchivo(String rutaArchivo) {
		this.rutaArchivo = rutaArchivo;
	}
	public Long getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}
	public Long getIdTipoArchivo() {
		return idTipoArchivo;
	}
	public void setIdTipoArchivo(Long idTipoArchivo) {
		this.idTipoArchivo = idTipoArchivo;
	}	
}
