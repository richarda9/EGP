package com.sigcomt.gestionProyectos.model.anteproyecto;

import java.io.Serializable;
import java.util.List;

public class AgregarAnteproyectoModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long idAsociadoProyecto;
	private String fechaContacto;
	private Long idTipoProyecto;
	private Long idEjecutivoCuenta;
	private Long idResponsable;
	private String tituloProyecto;
	private String alcanceInicialProyecto;
	private String objetivo;
	private List<InteresadoAnteproyectoModel>listaInteresados;
	
	public Long getIdAsociadoProyecto() {
		return idAsociadoProyecto;
	}
	public void setIdAsociadoProyecto(Long idAsociadoProyecto) {
		this.idAsociadoProyecto = idAsociadoProyecto;
	}
	public String getFechaContacto() {
		return fechaContacto;
	}
	public void setFechaContacto(String fechaContacto) {
		this.fechaContacto = fechaContacto;
	}
	public Long getIdTipoProyecto() {
		return idTipoProyecto;
	}
	public void setIdTipoProyecto(Long idTipoProyecto) {
		this.idTipoProyecto = idTipoProyecto;
	}
	public Long getIdEjecutivoCuenta() {
		return idEjecutivoCuenta;
	}
	public void setIdEjecutivoCuenta(Long idEjecutivoCuenta) {
		this.idEjecutivoCuenta = idEjecutivoCuenta;
	}
	public Long getIdResponsable() {
		return idResponsable;
	}
	public void setIdResponsable(Long idResponsable) {
		this.idResponsable = idResponsable;
	}
	public String getTituloProyecto() {
		return tituloProyecto;
	}
	public void setTituloProyecto(String tituloProyecto) {
		this.tituloProyecto = tituloProyecto;
	}
	public String getAlcanceInicialProyecto() {
		return alcanceInicialProyecto;
	}
	public void setAlcanceInicialProyecto(String alcanceInicialProyecto) {
		this.alcanceInicialProyecto = alcanceInicialProyecto;
	}
	public String getObjetivo() {
		return objetivo;
	}
	public void setObjetivo(String objetivo) {
		this.objetivo = objetivo;
	}
	public List<InteresadoAnteproyectoModel> getListaInteresados() {
		return listaInteresados;
	}
	public void setListaInteresados(
			List<InteresadoAnteproyectoModel> listaInteresados) {
		this.listaInteresados = listaInteresados;
	}
}
