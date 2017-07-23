package com.sigcomt.gestionProyectos.repositorio.administracion;

import java.util.List;

import com.sigcomt.gestionProyectos.dominio.administracion.CategoriaAdquisicion;
import com.sigcomt.gestionProyectos.dominio.administracion.DetalleEmpresaPersona;
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
import com.sigcomt.gestionProyectos.model.administracion.RecursosModel;
import com.sigcomt.gestionProyectos.model.administracion.TipoDependenciaProyectoModel;
import com.sigcomt.gestionProyectos.model.administracion.TipoRequisitoProyectoModel;
import com.sigcomt.gestionProyectos.model.administracion.TipoSupuestoProyectoModel;

public interface AdministracionDao 
{
	//[INI] TIPO PROYECTO
	public void registrarTipoProyecto(TipoProyecto param);
	public List<TipoProyecto> listarTipoProyecto();
	public List<TipoProyecto> listarTipoProyectoByEsado(int estado);
	public void eliminarTipoProyecto(Integer id);
	public int buscarTipoProyecto(TipoProyecto param);
	//[FIN] TIPO PROYECTO
	
	//[INI] ESTADO PROYECTO
	public void registrarEstadoProyecto(EstadoProyecto param);
	public List<EstadoProyecto> listarEstadoProyecto();
	public void eliminarEstadoProyecto(Integer id);
	public int buscarEstadoProyecto(EstadoProyecto param);
	//[FIN] ESTADO PROYECTO
		
	//[INI] TIPO REQUISITO
	public void registrarTipoRequisitoProyecto(TipoRequisito param);
	public List<TipoRequisitoProyectoModel> listarTipoRequisitoProyecto();	
	public void eliminarTipoRequisitoProyecto(Integer id);
	public int buscarTipoRequisitoProyecto(TipoRequisito param);
	//[FIN] TIPO REQUISITO
	
	//[INI] TIPO SUPUESTO
	public void registrarTipoSupuestoProyecto(TipoSupuesto param);
	public List<TipoSupuestoProyectoModel> listarTipoSupuestoProyecto();	
	public void eliminarTipoSupuestoProyecto(Integer id);
	public int buscarTipoSupuestoProyecto(TipoSupuesto param);
	//[FIN] TIPO SUPUESTO
	
	//[INI] TIPO DEPENDENCIA
	public void registrarTipoDependenciaProyecto(TipoDependencia param);
	public List<TipoDependenciaProyectoModel> listarTipoDependenciaProyecto();	
	public void eliminarTipoDependenciaProyecto(Integer id);
	public int buscarTipoDependenciaProyecto(TipoDependencia param);
	//[FIN] TIPO DEPENDENCIA
	//[INI] CATEGORIA ADQUISICIONES 
	public void registrarCategAdquisicion(CategoriaAdquisicion param);
	public List<CategoriaAdquisicion> listarCategAdquisicion();
	public void eliminarCategAdquisicion(Integer id);
	public int buscarCategAdquisicion(CategoriaAdquisicion param);
	//[FIN] CATEGORIA ADQUISICIONES
	//[INI] COSTO OPERATIVO 
	public void registrarCostoOperativo(TipoCostoOperativo param);
	public List<TipoCostoOperativo> listarCostoOperativo();
	public void eliminarCostoOperativo(Integer id);
	public int buscarCostoOperativo(TipoCostoOperativo param);
	//[FIN] COSTO OPERATIVO
	//[INI] FORMA PAGO 
	public void registrarFormaPago(TipoFormaPago param);
	public List<TipoFormaPago> listarFormaPago();
	public void eliminarFormaPago(Integer id);
	public int buscarFormaPago(TipoFormaPago param);
	//[FIN] FORMA PAGO
	
//	INI - EMPRESA
	public List<Empresa> listarEmpresaByEstado(int estado);
	public List<TipoRol> listarTipoRolbyEstado(int estado);
	public void registrarEmpresa(Empresa empresa);
	public void registrarDetEmpresaPersona(DetalleEmpresaPersona dato);
	public Empresa listarEmpresaById(Long idempresa);
	public List<ContactoEmpresaModel> listarContactoEmpresaByEmpresa(Long idempresa);
	public int eliminarEmpresa(Long idempresa);
	public void editarEmpresa(Empresa empresa);
	public void editarDetEmpresaPersona(DetalleEmpresaPersona dato);
//	FIN - EMPRESA
	
//	INI - RECURSOS
	public List<RecursosModel> listarRecursos(RecursosModel recurso);
//	FIN - RECURSOS
	
//  INI - ENTREGABLE
	public int registrarComplejidadEntregable(Complejidad dato);
	public void eliminarComplejidadEntregable(Integer id);
	public List<Complejidad> listarComplejidadEntregable(int dato);
	
	public int registrarEstadoEntregable(EstadoEntregable dato); 
	public List<EstadoEntregable> listarEstadoEntregable(int dato);
	public void eliminarEstadoEntregable(Integer id);
//  FIN - ENTREGABLE
	
	public List<TipoDocumento> listarTipoDocumento();
	public List<TipoRol> listarTipoRolbyTipoRol(int tipo);
	
//	INI - ORGANIGRAMA
	public List<TipoRol> listarTipoRol(TipoRol rol);
	public int buscarOrganigrama(TipoRol rol);
	public void registrarOrganigrama(TipoRol rol);
	public void eliminarOrganigrama(Integer id);
	public void actualizarOrganigrama(TipoRol rol);
//  FIN - ORGANIGRAMA
}
