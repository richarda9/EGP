package com.sigcomt.gestionProyectos.servicio.reporte;

import com.sigcomt.gestionProyectos.model.reporte.ReporteProyectoModel;


public interface ReporteService {

	public String generarRptProyectos(String ruta, ReporteProyectoModel reporte);
}
