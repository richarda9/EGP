package com.sigcomt.gestionProyectos.dominio.administracion;

import java.io.Serializable;
import java.util.Date;

public class Proyecto implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long idProyecto;
	private String nombreProyecto;
	private Long idTipoProyecto;
	private Integer estado;
	private Date fechaContacto;
	private String fechaContactoString;
	private Long idResponsableProyecto;
	private Long idEjecutivoCuenta;
	private String codigoProyecto;
	private Long idProyectoAsociado;
	private String alcanceInicial;
	private String ObjetivoInicial;
	private Long idEmpresa;
	private String nombreEmpresa;
	private String descripcionProductoProyecto;
	private String alcanceProyecto;
	private Date fechaCierreProyecto;
	private String comentariosCierreProyecto;
	private Date fechaCancelacion;
	private String justificacionCancelacion;
	
	private String descripcionTipoProyecto;
	private String nombreResponsable;
	private String nombreEjecutivo;
		
	public Long getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}
	public String getNombreProyecto() {
		return nombreProyecto;
	}
	public void setNombreProyecto(String nombreProyecto) {
		this.nombreProyecto = nombreProyecto;
	}
	public Long getIdTipoProyecto() {
		return idTipoProyecto;
	}
	public void setIdTipoProyecto(Long idTipoProyecto) {
		this.idTipoProyecto = idTipoProyecto;
	}
	public Integer getEstado() {
		return estado;
	}
	public void setEstado(Integer estado) {
		this.estado = estado;
	}
	public Date getFechaContacto() {
		return fechaContacto;
	}
	public void setFechaContacto(Date fechaContacto) {
		this.fechaContacto = fechaContacto;
	}
	public Long getIdResponsableProyecto() {
		return idResponsableProyecto;
	}
	public void setIdResponsableProyecto(Long idResponsableProyecto) {
		this.idResponsableProyecto = idResponsableProyecto;
	}
	public Long getIdEjecutivoCuenta() {
		return idEjecutivoCuenta;
	}
	public void setIdEjecutivoCuenta(Long idEjecutivoCuenta) {
		this.idEjecutivoCuenta = idEjecutivoCuenta;
	}
	public String getCodigoProyecto() {
		return codigoProyecto;
	}
	public void setCodigoProyecto(String codigoProyecto) {
		this.codigoProyecto = codigoProyecto;
	}
	public Long getIdProyectoAsociado() {
		return idProyectoAsociado;
	}
	public void setIdProyectoAsociado(Long idProyectoAsociado) {
		this.idProyectoAsociado = idProyectoAsociado;
	}
	public String getAlcanceInicial() {
		return alcanceInicial;
	}
	public void setAlcanceInicial(String alcanceInicial) {
		this.alcanceInicial = alcanceInicial;
	}
	public String getObjetivoInicial() {
		return ObjetivoInicial;
	}
	public void setObjetivoInicial(String objetivoInicial) {
		ObjetivoInicial = objetivoInicial;
	}
	public Long getIdEmpresa() {
		return idEmpresa;
	}
	public void setIdEmpresa(Long idEmpresa) {
		this.idEmpresa = idEmpresa;
	}
	public String getNombreEmpresa() {
		return nombreEmpresa;
	}
	public void setNombreEmpresa(String nombreEmpresa) {
		this.nombreEmpresa = nombreEmpresa;
	}
	public String getDescripcionProductoProyecto() {
		return descripcionProductoProyecto;
	}
	public void setDescripcionProductoProyecto(String descripcionProductoProyecto) {
		this.descripcionProductoProyecto = descripcionProductoProyecto;
	}
	public String getAlcanceProyecto() {
		return alcanceProyecto;
	}
	public void setAlcanceProyecto(String alcanceProyecto) {
		this.alcanceProyecto = alcanceProyecto;
	}
	public Date getFechaCierreProyecto() {
		return fechaCierreProyecto;
	}
	public void setFechaCierreProyecto(Date fechaCierreProyecto) {
		this.fechaCierreProyecto = fechaCierreProyecto;
	}
	public String getComentariosCierreProyecto() {
		return comentariosCierreProyecto;
	}
	public void setComentariosCierreProyecto(String comentariosCierreProyecto) {
		this.comentariosCierreProyecto = comentariosCierreProyecto;
	}
	public Date getFechaCancelacion() {
		return fechaCancelacion;
	}
	public void setFechaCancelacion(Date fechaCancelacion) {
		this.fechaCancelacion = fechaCancelacion;
	}
	public String getJustificacionCancelacion() {
		return justificacionCancelacion;
	}
	public void setJustificacionCancelacion(String justificacionCancelacion) {
		this.justificacionCancelacion = justificacionCancelacion;
	}
	public String getDescripcionTipoProyecto() {
		return descripcionTipoProyecto;
	}
	public void setDescripcionTipoProyecto(String descripcionTipoProyecto) {
		this.descripcionTipoProyecto = descripcionTipoProyecto;
	}
	public String getNombreResponsable() {
		return nombreResponsable;
	}
	public void setNombreResponsable(String nombreResponsable) {
		this.nombreResponsable = nombreResponsable;
	}
	public String getNombreEjecutivo() {
		return nombreEjecutivo;
	}
	public void setNombreEjecutivo(String nombreEjecutivo) {
		this.nombreEjecutivo = nombreEjecutivo;
	}
	public String getFechaContactoString() {
		return fechaContactoString;
	}
	public void setFechaContactoString(String fechaContactoString) {
		this.fechaContactoString = fechaContactoString;
	}
	
}
