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
	private String correoResponsable;
	private String nombreResponsable;
	private String tituloProyecto;
	private String alcanceInicialProyecto;
	private String objetivo;
	private List<InteresadoAnteproyectoModel>listaInteresados;
	private List<ObservacionesAnteproyectoModel>listaObservaciones;
	private List<AnexosAnteproyectoModel>listaAnexos;
	
	private Long idEstadoProyecto;
	private Long idProyecto;
	private int estado;	
	private String codigoPy;
	private Long tipoArchivo;//1:observacion, 2:anexo
	
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
	public List<ObservacionesAnteproyectoModel> getListaObservaciones() {
		return listaObservaciones;
	}
	public void setListaObservaciones(
			List<ObservacionesAnteproyectoModel> listaObservaciones) {
		this.listaObservaciones = listaObservaciones;
	}
	public List<AnexosAnteproyectoModel> getListaAnexos() {
		return listaAnexos;
	}
	public void setListaAnexos(List<AnexosAnteproyectoModel> listaAnexos) {
		this.listaAnexos = listaAnexos;
	}
	public Long getIdEstadoProyecto() {
		return idEstadoProyecto;
	}
	public void setIdEstadoProyecto(Long idEstadoProyecto) {
		this.idEstadoProyecto = idEstadoProyecto;
	}
	public Long getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public String getCodigoPy() {
		return codigoPy;
	}
	public void setCodigoPy(String codigoPy) {
		this.codigoPy = codigoPy;
	}
	public Long getTipoArchivo() {
		return tipoArchivo;
	}
	public void setTipoArchivo(Long tipoArchivo) {
		this.tipoArchivo = tipoArchivo;
	}
	public String getCorreoResponsable() {
		return correoResponsable;
	}
	public void setCorreoResponsable(String correoResponsable) {
		this.correoResponsable = correoResponsable;
	}
	public String getNombreResponsable() {
		return nombreResponsable;
	}
	public void setNombreResponsable(String nombreResponsable) {
		this.nombreResponsable = nombreResponsable;
	}				
}
