package com.sigcomt.gestionProyectos.model.anteproyecto;

import java.io.Serializable;
import java.util.Map;

public class ObservacionesAnteproyectoModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String observacion;
	private String archivo;
	private Map<String, Object> archivosContenido;
	private String rutaArchivo;
	private Long idProyecto;
	private Long idTipoArchivo;
	
	public String getObservacion() {
		return observacion;
	}
	public void setObservacion(String observacion) {
		this.observacion = observacion;
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
	public Map<String, Object> getArchivosContenido() {
		return archivosContenido;
	}
	public void setArchivosContenido(Map<String, Object> archivosContenido) {
		this.archivosContenido = archivosContenido;
	}	
}
