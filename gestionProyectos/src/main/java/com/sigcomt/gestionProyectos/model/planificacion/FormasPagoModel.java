package com.sigcomt.gestionProyectos.model.planificacion;

import java.io.Serializable;
import java.sql.Date;

public class FormasPagoModel implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Long idFormaPagoDetal;
	private Long idEntregable;
	private String descripcionEntregable;
	private Long idFormaPago;
	private String descripcionFormaPago;
	private int nroCuota;
	private String fechaFacturacion;
	private String fechaCobranza;
	private int porcentajePago;
	private int estado;
	private Long idProyecto;
	
	
	public Long getIdFormaPagoDetal() {
		return idFormaPagoDetal;
	}
	public void setIdFormaPagoDetal(Long idFormaPagoDetal) {
		this.idFormaPagoDetal = idFormaPagoDetal;
	}
	public Long getIdEntregable() {
		return idEntregable;
	}
	public void setIdEntregable(Long idEntregable) {
		this.idEntregable = idEntregable;
	}
	public Long getIdFormaPago() {
		return idFormaPago;
	}
	public void setIdFormaPago(Long idFormaPago) {
		this.idFormaPago = idFormaPago;
	}
	public int getNroCuota() {
		return nroCuota;
	}
	public void setNroCuota(int nroCuota) {
		this.nroCuota = nroCuota;
	}
	
	public int getPorcentajePago() {
		return porcentajePago;
	}
	public void setPorcentajePago(int porcentajePago) {
		this.porcentajePago = porcentajePago;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public String getFechaFacturacion() {
		return fechaFacturacion;
	}
	public void setFechaFacturacion(String fechaFacturacion) {
		this.fechaFacturacion = fechaFacturacion;
	}
	public String getFechaCobranza() {
		return fechaCobranza;
	}
	public void setFechaCobranza(String fechaCobranza) {
		this.fechaCobranza = fechaCobranza;
	}
	public String getDescripcionFormaPago() {
		return descripcionFormaPago;
	}
	public void setDescripcionFormaPago(String descripcionFormaPago) {
		this.descripcionFormaPago = descripcionFormaPago;
	}
	public String getDescripcionEntregable() {
		return descripcionEntregable;
	}
	public void setDescripcionEntregable(String descripcionEntregable) {
		this.descripcionEntregable = descripcionEntregable;
	}
	public Long getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}
	
	
}
