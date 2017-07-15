package com.sigcomt.gestionProyectos.model.administracion;

import java.io.Serializable;

public class ContactoEmpresaModel implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private String contacto;  
	private String dscarea;
	private String telefono;                      
	private String correo;                    
	private Long idDetEmpPersona;  
	private String nombre;
	private String apellido;
	private String anexo;
	private Long idcargo;
	private Long idPersona;
	
	public String getContacto() {
		return contacto;
	}
	public void setContacto(String contacto) {
		this.contacto = contacto;
	}
	public String getDscarea() {
		return dscarea;
	}
	public void setDscarea(String dscarea) {
		this.dscarea = dscarea;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	public Long getIdDetEmpPersona() {
		return idDetEmpPersona;
	}
	public void setIdDetEmpPersona(Long idDetEmpPersona) {
		this.idDetEmpPersona = idDetEmpPersona;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getAnexo() {
		return anexo;
	}
	public void setAnexo(String anexo) {
		this.anexo = anexo;
	}
	public Long getIdcargo() {
		return idcargo;
	}
	public void setIdcargo(Long idcargo) {
		this.idcargo = idcargo;
	}
	@Override
	public String toString() {
		return "ContactoEmpresaModel [contacto=" + contacto + ", dscarea="
				+ dscarea + ", telefono=" + telefono + ", correo=" + correo
				+ ", idDetEmpPersona=" + idDetEmpPersona + ", nombre=" + nombre
				+ ", apellido=" + apellido + ", anexo=" + anexo + ", idcargo="
				+ idcargo + "]";
	}
	public Long getIdPersona() {
		return idPersona;
	}
	public void setIdPersona(Long idPersona) {
		this.idPersona = idPersona;
	}
	
	
}
