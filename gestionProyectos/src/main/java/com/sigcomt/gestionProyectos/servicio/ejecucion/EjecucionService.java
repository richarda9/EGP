package com.sigcomt.gestionProyectos.servicio.ejecucion;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.sigcomt.gestionProyectos.dominio.administracion.Persona;
import com.sigcomt.gestionProyectos.dominio.administracion.Rol;
import com.sigcomt.gestionProyectos.dominio.ejecucion.Complejidad;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleAdquisicionProyecto;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleAsignacionResponsable;
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
import com.sigcomt.gestionProyectos.model.ejecucion.MntTareaCtrolCambioModel;

public interface EjecucionService {
	
	public List<Rol> listarTipoRol(HashMap<String, String> mapa);
	public List<EstadoTarea> listarEstadoTarea(int dato);
	public List<Complejidad> listarComplejidad(int dato);
	public int mntCtrolCambios(MntCtrolCambiosModel dato);
	public int eliminarCtrolCambios(MntCtrolCambiosModel dato);
	public List<LstCtrolCambiosModel> listarCtrolCambios(MntCtrolCambiosModel dato);
	public List<Persona> listaRecursos(HashMap<String, Long> mapa);
	public int mntAsignarRecursos(MntAsignarResponsableModel dato);
	public List<LstAsignarResponsableModel> listarAsignacionRecurso(MntAsignarResponsableModel bsqResponsable);
	public int eliminarAsignacionRecursos(DetalleAsignacionResponsable bsqResponsable);
	public List<Persona> listaRecursosProyecto(HashMap<String, String> objeto);
	
	public List<LstDetalleCronogramaModel> obtListaTareaProyectobyProyecto(Long idProyecto);
	public void mntTareasProyecto(MntTareaCtrolCambioModel dato);
	public void eliminarTareaCronograma(LstDetalleCronogramaModel dato);
	
	public void mntEnvioCertificacion(MultipartFile multipartFile, EnvioCertificacionModel objeto, String ruta);
	
	public List<EstadoAdquisicion> listarEstadoAdquisicion();
	
	public List<Persona> listarResponsablebyProyecto(Long id);
	
	public List<LstEnvioCertificacionModel> listarEnvioCertificacionbyProyecto(Long idproyecto);
	
	public List<LstDetalleAdquisicionesProyectoModel> listarCategAdquisicionbyProyecto(DetalleAdquisicionProyecto bsqAdquisicion);
	public int mntAdquisiciones(DetalleAdquisicionProyecto dato);
	public void eliminarAdquisiciones(Integer id);
	
	//
	public List<InformeAvance> listarInfoAvancebyProyecto(InformeAvance info);
	public int mntoInformeAvance(InformeAvance dato);
	public void eliminarInformeAvance(Integer id);
	public int enviarCorreoInformeAvance(InformeAvance dato, String ruta);
	public String descargarInformeAvance(InformeAvance dato, String ruta);
	
	//[INI] SEGUIMIENTO ENTREGABLE
	public List<LstEnvioCertificacionModel> listarSeguimientoCertificacionbyProyecto(Long idproyecto);
	public void cambioEstadoEntregable(EnvioCertificacionModel entregable);
	//[FIN] SEGUIMIENTO ENTREGABLE
	
}
