package com.sigcomt.gestionProyectos.servicio.administracion;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.sigcomt.gestionProyectos.dominio.administracion.CategoriaAdquisicion;
import com.sigcomt.gestionProyectos.dominio.administracion.Empresa;
import com.sigcomt.gestionProyectos.dominio.administracion.EstadoEntregable;
import com.sigcomt.gestionProyectos.dominio.administracion.EstadoProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoCostoOperativo;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoDependencia;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoDocumento;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoFormaPago;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoRequisito;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoRol;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoSupuesto;
import com.sigcomt.gestionProyectos.dominio.ejecucion.Complejidad;
import com.sigcomt.gestionProyectos.model.administracion.ContactoEmpresaModel;
import com.sigcomt.gestionProyectos.model.administracion.MntEmpresaModel;
import com.sigcomt.gestionProyectos.model.administracion.RecursosModel;
import com.sigcomt.gestionProyectos.model.administracion.TipoDependenciaProyectoModel;
import com.sigcomt.gestionProyectos.model.administracion.TipoRequisitoProyectoModel;
import com.sigcomt.gestionProyectos.model.administracion.TipoSupuestoProyectoModel;


public interface AdministracionService 
{
	//[INI] TIPO PROYECTO
	public int registrarTipoProyecto(TipoProyecto param);
	public List<TipoProyecto> listarTipoProyecto();
	public List<TipoProyecto> listarTipoProyectoByEsado(int estado);
	public void eliminarTipoProyecto(Integer id);
	//[FIN] TIPO PROYECTO
	
	//[INI] ESTADO PROYECTO
	public int registrarEstadoProyecto(EstadoProyecto param);
	public List<EstadoProyecto> listarEstadoProyecto();
	public void eliminarEstadoProyecto(Integer id);
	//[FIN] ESTADO PROYECTO
		
	//[INI] TIPO REQUISITO PROYECTO
	public int registrarTipoRequisitoProyecto(TipoRequisito param);	
	public List<TipoRequisitoProyectoModel> listarTipoRequisitoProyecto();	
	public void eliminarTipoRequisitoProyecto(Integer id);
	//[FIN] TIPO REQUISITO PROYECTO
	
	//[INI] TIPO SUPUESTO PROYECTO
	public int registrarTipoSupuestoProyecto(TipoSupuesto param);	
	public List<TipoSupuestoProyectoModel> listarTipoSupuestoProyecto();	
	public void eliminarTipoSupuestoProyecto(Integer id);
	//[FIN] TIPO SUPUESTO PROYECTO
	
	//[INI] TIPO DEPENDENCIA PROYECTO
	public int registrarTipoDependenciaProyecto(TipoDependencia param);	
	public List<TipoDependenciaProyectoModel> listarTipoDependenciaProyecto();	
	public void eliminarTipoDependenciaProyecto(Integer id);
	//[FIN] TIPO DEPENDENCIA PROYECTO
	
	//[INI] CATEGORIA ADQUISICIONES
	public int registrarCategAdquisicion(CategoriaAdquisicion param);
	public List<CategoriaAdquisicion> listarCategAdquisicion();
	public void eliminarCategAdquisicion(Integer id);
	//[FIN] CATEGORIA ADQUISICIONES
	
	//[INI] COSTO OPERATIVO
	public int registrarCostoOperativo(TipoCostoOperativo param);
	public List<TipoCostoOperativo> listarCostoOperativo();
	public void eliminarCostoOperativo(Integer id);
	//[FIN] COSTO OPERATIVO
	
	//[INI] FORMA PAGO
	public int registrarFormaPago(TipoFormaPago param);
	public List<TipoFormaPago> listarFormaPago();
	public void eliminarFormaPago(Integer id);
	//[FIN] FORMA PAGO
	
//	INI - EMPRESA
	public List<Empresa> listarEmpresaByEstado(int estado);
	public List<TipoRol> listarTipoRolbyEstado(int estado);
	public void mntEmpresa(MultipartFile logoEmpresa, MultipartFile formatoEmpresa, MntEmpresaModel empresa, String ruta);
	public Empresa listarEmpresaById(Long idempresa);
	public List<ContactoEmpresaModel> listarContactoEmpresaByEmpresa(Long idempresa);
	public int eliminarEmpresa(Long idempresa);
//	FIN - EMPRESA
	
//	INI - RECURSOS
	public List<RecursosModel> listarRecursos(RecursosModel recurso);
	public int mntoRecurso(RecursosModel dato);
	public void eliminarRecursos(Integer id);
//	FIN - RECURSOS
	
//  INI - ENTREGABLE
	public int registrarComplejidadEntregable(Complejidad dato);
	public List<Complejidad> listarComplejidadEntregable(int dato);
	public void eliminarComplejidadEntregable(Integer id);
	
	public int registrarEstadoEntregable(EstadoEntregable dato); 
	public List<EstadoEntregable> listarEstadoEntregable(int dato);
	public void eliminarEstadoEntregable(Integer id);
//  FIN - ENTREGABLE
	
	public List<TipoDocumento> listarTipoDocumento();
	public List<TipoRol> listarTipoRolbyTipoRol(int tipo);

//	INI - ORGANIGRAMA
	public List<TipoRol> listarTipoRol(TipoRol rol);
	public int mntoOrganigrama(TipoRol dato);
	public void eliminarOrganigrama(Integer id);
//  FIN - ORGANIGRAMA

}
