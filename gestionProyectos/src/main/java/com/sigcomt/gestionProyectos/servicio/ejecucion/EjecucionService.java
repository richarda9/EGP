package com.sigcomt.gestionProyectos.servicio.ejecucion;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.sigcomt.gestionProyectos.dominio.administracion.Persona;
import com.sigcomt.gestionProyectos.dominio.administracion.Rol;
import com.sigcomt.gestionProyectos.dominio.ejecucion.Complejidad;
import com.sigcomt.gestionProyectos.dominio.ejecucion.DetalleAsignacionResponsable;
import com.sigcomt.gestionProyectos.dominio.ejecucion.EstadoTarea;
import com.sigcomt.gestionProyectos.model.ejecucion.EnvioCertificacionModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstAsignarResponsableModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstCtrolCambiosModel;
import com.sigcomt.gestionProyectos.model.ejecucion.LstDetalleCronogramaModel;
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
	
	public void mntEnvioCertificacion(MultipartFile multipartFile, EnvioCertificacionModel objeto, String ruta);
}
