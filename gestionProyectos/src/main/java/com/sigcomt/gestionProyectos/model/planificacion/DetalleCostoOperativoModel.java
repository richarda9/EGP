package com.sigcomt.gestionProyectos.model.planificacion;

import java.io.Serializable;
import java.math.BigDecimal;

public class DetalleCostoOperativoModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long idCostoOperativo;
	private Long idProyecto;
	private Long idTipoCosto;
	private String valTipoCosto;
	private String descripcionCosto;
	private String fecha;
	private BigDecimal monto;
	private int estado;
	public Long getIdCostoOperativo() {
		return idCostoOperativo;
	}
	public void setIdCostoOperativo(Long idCostoOperativo) {
		this.idCostoOperativo = idCostoOperativo;
	}
	public Long getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}
	public Long getIdTipoCosto() {
		return idTipoCosto;
	}
	public void setIdTipoCosto(Long idTipoCosto) {
		this.idTipoCosto = idTipoCosto;
	}
	public String getValTipoCosto() {
		return valTipoCosto;
	}
	public void setValTipoCosto(String valTipoCosto) {
		this.valTipoCosto = valTipoCosto;
	}
	public String getDescripcionCosto() {
		return descripcionCosto;
	}
	public void setDescripcionCosto(String descripcionCosto) {
		this.descripcionCosto = descripcionCosto;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public BigDecimal getMonto() {
		return monto;
	}
	public void setMonto(BigDecimal monto) {
		this.monto = monto;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}			

}
