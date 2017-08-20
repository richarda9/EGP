package com.sigcomt.gestionProyectos.model.cancelar;

import java.io.Serializable;

public class CancelarProyectoModel implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long idproyecto;
	private String fecCancelacion;
	private String cancelarJustificacionProyecto;
	
	public String getFecCancelacion() {
		return fecCancelacion;
	}
	
	public void setFecCancelacion(String fecCancelacion) {
		this.fecCancelacion = fecCancelacion;
	}
	
	public Long getIdproyecto() {
		return idproyecto;
	}

	public void setIdproyecto(Long idproyecto) {
		this.idproyecto = idproyecto;
	}

	public String getCancelarJustificacionProyecto() {
		return cancelarJustificacionProyecto;
	}

	public void setCancelarJustificacionProyecto(
			String cancelarJustificacionProyecto) {
		this.cancelarJustificacionProyecto = cancelarJustificacionProyecto;
	}
}
