package com.sigcomt.gestionProyectos.model.comunes;

import java.io.Serializable;

public class EnvioCorreo implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private String correoOrigen;
	private String correoDestino;
	private String CorreoCopia;
	private String mensaje;
	private String asunto;
	private String host;
	private String puerto;
	private String usuario;
	private String password;
	private String nombreArchivo;
	private String rutaArchivo;
	
	
	public String getCorreoOrigen() {
		return correoOrigen;
	}
	
	public void setCorreoOrigen(String correoOrigen) {
		this.correoOrigen = correoOrigen;
	}
	
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
	
	public String getHost() {
		return host;
	}
	
	public void setHost(String host) {
		this.host = host;
	}
	
	public String getPuerto() {
		return puerto;
	}
	
	public void setPuerto(String puerto) {
		this.puerto = puerto;
	}
	
	public String getUsuario() {
		return usuario;
	}
	
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
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
}
