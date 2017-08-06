package com.sigcomt.gestionProyectos.model.planificacion;

import java.io.Serializable;
import java.util.List;

public class AgregarPlanificacionModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long idProyecto;
	private String descripcionProducto;
	private String definicionAlcance;	
//	private Long tipoRequisito;	
//	private String descripcionAlcance;
//	private String observacionAlcance;
	private List<RequisitoProyectoPlanificacionModel> listaTipoRequisito;
	private List<ExclusionPlanificacionModel> listaExclusion;
	private List<SupuestoPlanificacionModel> listaSupuesto;
	private List<DependenciaPlanificacionModel> listaDependencia;	
	private List<FactorExitoPlanificacionModel> listaFactorExito;	
		
	public Long getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}
	public String getDescripcionProducto() {
		return descripcionProducto;
	}
	public void setDescripcionProducto(String descripcionProducto) {
		this.descripcionProducto = descripcionProducto;
	}
	public String getDefinicionAlcance() {
		return definicionAlcance;
	}
	public void setDefinicionAlcance(String definicionAlcance) {
		this.definicionAlcance = definicionAlcance;
	}
//	public Long getTipoRequisito() {
//		return tipoRequisito;
//	}
//	public void setTipoRequisito(Long tipoRequisito) {
//		this.tipoRequisito = tipoRequisito;
//	}
//	public String getDescripcionAlcance() {
//		return descripcionAlcance;
//	}
//	public void setDescripcionAlcance(String descripcionAlcance) {
//		this.descripcionAlcance = descripcionAlcance;
//	}
//	public String getObservacionAlcance() {
//		return observacionAlcance;
//	}
//	public void setObservacionAlcance(String observacionAlcance) {
//		this.observacionAlcance = observacionAlcance;
//	}
	public List<RequisitoProyectoPlanificacionModel> getListaTipoRequisito() {
		return listaTipoRequisito;
	}
	public void setListaTipoRequisito(
			List<RequisitoProyectoPlanificacionModel> listaTipoRequisito) {
		this.listaTipoRequisito = listaTipoRequisito;
	}
	public List<ExclusionPlanificacionModel> getListaExclusion() {
		return listaExclusion;
	}
	public void setListaExclusion(List<ExclusionPlanificacionModel> listaExclusion) {
		this.listaExclusion = listaExclusion;
	}
	public List<SupuestoPlanificacionModel> getListaSupuesto() {
		return listaSupuesto;
	}
	public void setListaSupuesto(List<SupuestoPlanificacionModel> listaSupuesto) {
		this.listaSupuesto = listaSupuesto;
	}
	public List<DependenciaPlanificacionModel> getListaDependencia() {
		return listaDependencia;
	}
	public void setListaDependencia(
			List<DependenciaPlanificacionModel> listaDependencia) {
		this.listaDependencia = listaDependencia;
	}
	public List<FactorExitoPlanificacionModel> getListaFactorExito() {
		return listaFactorExito;
	}
	public void setListaFactorExito(
			List<FactorExitoPlanificacionModel> listaFactorExito) {
		this.listaFactorExito = listaFactorExito;
	}		
}
