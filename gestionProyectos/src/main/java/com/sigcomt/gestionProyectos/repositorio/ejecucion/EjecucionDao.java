package com.sigcomt.gestionProyectos.repositorio.ejecucion;

import java.util.HashMap;
import java.util.List;

import com.sigcomt.gestionProyectos.dominio.administracion.DetalleEmpresaPersona;
import com.sigcomt.gestionProyectos.dominio.administracion.Persona;
import com.sigcomt.gestionProyectos.dominio.administracion.Rol;
import com.sigcomt.gestionProyectos.dominio.ejecucion.Complejidad;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleAdquisicionProyecto;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleAsignacionResponsable;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleCronograma;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleRolProyecto;
import com.sigcomt.gestionProyectos.dominio.ejecucion.EstadoAdquisicion;
import com.sigcomt.gestionProyectos.dominio.ejecucion.EstadoTarea;
import com.sigcomt.gestionProyectos.dominio.ejecucion.InformeAvance;
import com.sigcomt.gestionProyectos.model.ejecucion.EnvioCertificacionModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstAsignarResponsableModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstCtrolCambiosModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstDetalleAdquisicionesProyectoModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstDetalleCronogramaModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstEnvioCertificacionModel;
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
	
	public List<Persona> listarResponsablebyProyecto(Long id);
	public List<LstEnvioCertificacionModel> listarEnvioCertificacionbyProyecto(Long idproyecto);
	public void actualizarEnvioCorreo(EnvioCertificacionModel objeto);
	public List<LstDetalleAdquisicionesProyectoModel> listarCategAdquisicionbyProyecto(DetalleAdquisicionProyecto bsqAdquisicion);
	
	public int mntAdquisiciones(DetalleAdquisicionProyecto dato);
	public int actualizarAdquisiciones(DetalleAdquisicionProyecto dato);
	public void eliminarAdquisiciones(Integer id);
	
	public int mntoInformeAvance(InformeAvance dato);
	public int actualizarInformeAvance(InformeAvance dato);	
	public List<InformeAvance> listarInfoAvancebyProyecto(InformeAvance info);
	public void eliminarInformeAvance(InformeAvance Info);
}
