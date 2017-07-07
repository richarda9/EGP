package com.sigcomt.gestionProyectos.model.ejecucion;

import java.io.Serializable;
import java.util.List;

public class MntTareaCtrolCambioModel implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long idCtrolCambioTarea;
	private Long idProyecto;
	private List<LstDetalleCronogramaModel> lista;
	private Integer estado;
		
	public Long getIdProyecto() {
		return idProyecto;
	}
	
	public void setIdProyecto(Long idProyecto) {
		this.idProyecto = idProyecto;
	}
	
	public List<LstDetalleCronogramaModel> getLista() {
		return lista;
	}
	
	public void setLista(List<LstDetalleCronogramaModel> lista) {
		this.lista = lista;
	}
	
	public Integer getEstado() {
		return estado;
	}
	
	public void setEstado(Integer estado) {
		this.estado = estado;
	}

	public Long getIdCtrolCambioTarea() {
		return idCtrolCambioTarea;
	}

	public void setIdCtrolCambioTarea(Long idCtrolCambioTarea) {
		this.idCtrolCambioTarea = idCtrolCambioTarea;
	}

	@Override
	public String toString() {
		return "MntTareaCtrolCambioModel [idCtrolCambioTarea="
				+ idCtrolCambioTarea + ", idProyecto=" + idProyecto
				+ ", lista=" + lista + ", estado=" + estado + "]";
	}
}
