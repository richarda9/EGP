package com.sigcomt.gestionProyectos.model.comunes;

import java.io.Serializable;

public class EnvioCorreo implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private String correoDestino;
	private String CorreoCopia;
	private String mensaje;
	private String asunto;
	private String nombreArchivo;
	private String rutaArchivo;
	private String rutaLogo;

	public String getCorreoDestino() {
		return correoDestino;
	}
	
	public void setCorreoDestino(String correoDestino) {
		this.correoDestino = correoDestino;
	}
	
	public String getMensaje() {
		return mensaje;
	}
	
	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}
	
	public String getAsunto() {
		return asunto;
	}
	
	public void setAsunto(String asunto) {
		this.asunto = asunto;
	}
	
	public String getCorreoCopia() {
		return CorreoCopia;
	}

	public void setCorreoCopia(String correoCopia) {
		CorreoCopia = correoCopia;
	}

	public String getNombreArchivo() {
		return nombreArchivo;
	}

	public void setNombreArchivo(String nombreArchivo) {
		this.nombreArchivo = nombreArchivo;
	}

	public String getRutaArchivo() {
		return rutaArchivo;
	}

	public void setRutaArchivo(String rutaArchivo) {
		this.rutaArchivo = rutaArchivo;
	}

	public String getRutaLogo() {
		return rutaLogo;
	}

	public void setRutaLogo(String rutaLogo) {
		this.rutaLogo = rutaLogo;
	}
}
