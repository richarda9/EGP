package com.sigcomt.gestionProyectos.repositorio.ejecucion;

import java.util.HashMap;
import java.util.List;

import com.sigcomt.gestionProyectos.dominio.administracion.DetalleEmpresaPersona;
import com.sigcomt.gestionProyectos.dominio.administracion.Persona;
import com.sigcomt.gestionProyectos.dominio.administracion.Rol;
import com.sigcomt.gestionProyectos.dominio.ejecucion.Complejidad;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleAsignacionResponsable;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleCronograma;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleRolProyecto;
import com.sigcomt.gestionProyectos.dominio.ejecucion.EstadoAdquisicion;
import com.sigcomt.gestionProyectos.dominio.ejecucion.EstadoTarea;
import com.sigcomt.gestionProyectos.model.ejecucion.LstAsignarResponsableModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstCtrolCambiosModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstDetalleCronogramaModel;
import com.sigcomt.gestionProyectos.model.ejecucion.MntAsignarResponsableModel;
import com.sigcomt.gestionProyectos.model.ejecucion.MntCtrolCambiosModel;


public interface EjecucionDao 
{
	public List<Rol> listarTipoRol(HashMap<String, String> mapa);
	public List<EstadoTarea> listarEstadoTarea(int dato);
	public List<Complejidad> listarComplejidad(int dato);
	public int mntCtrolCambios(MntCtrolCambiosModel dato);
	public int eliminarCtrolCambios(MntCtrolCambiosModel dato);
	public List<LstCtrolCambiosModel> listarCtrolCambios(MntCtrolCambiosModel dato);
	public List<Persona> listaRecursos(HashMap<String, Long> mapa);
	public DetalleRolProyecto obtCantidadRecursobyRol(MntAsignarResponsableModel dato);
	public int obtCantidadActualRecursobyRol(DetalleRolProyecto dato);
	public void mntAsignarRecursos(DetalleAsignacionResponsable dato);	
	public List<LstAsignarResponsableModel> listarAsignacionRecurso(MntAsignarResponsableModel bsqResponsable);
	public int eliminarAsignacionRecursos(DetalleAsignacionResponsable bsqResponsable);
	public DetalleEmpresaPersona obtDetalleEmpresaPersonabyPersona(MntAsignarResponsableModel dato);
	public List<Persona> listaRecursosProyecto(HashMap<String, String> objeto);
	
	public void agregarTareaProyecto(DetalleCronograma detalle);
	public void actualizaTareaProyecto(DetalleCronograma detalle);
	public void eliminarTareasProyecto(LstDetalleCronogramaModel dato);
	public List<LstDetalleCronogramaModel> obtListaTareaProyectobyProyecto(Long idProyecto);
	
	//
	public List<EstadoAdquisicion> listarEstadoAdquisicion();
}
