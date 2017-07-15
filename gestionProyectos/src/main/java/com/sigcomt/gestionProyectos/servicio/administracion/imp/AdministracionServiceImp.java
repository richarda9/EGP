package com.sigcomt.gestionProyectos.servicio.administracion.imp;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.sigcomt.gestionProyectos.common.Constantes;
import com.sigcomt.gestionProyectos.dominio.administracion.CategoriaAdquisicion;
import com.sigcomt.gestionProyectos.dominio.administracion.DetalleEmpresaPersona;
import com.sigcomt.gestionProyectos.dominio.administracion.Empresa;
import com.sigcomt.gestionProyectos.dominio.administracion.EstadoEntregable;
import com.sigcomt.gestionProyectos.dominio.administracion.EstadoProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.Persona;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoCostoOperativo;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoDependencia;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoFormaPago;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoProyecto;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoRequisito;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoRol;
import com.sigcomt.gestionProyectos.dominio.administracion.TipoSupuesto;
import com.sigcomt.gestionProyectos.dominio.ejecucion.Complejidad;
import com.sigcomt.gestionProyectos.model.administracion.ContactoEmpresaModel;
import com.sigcomt.gestionProyectos.model.administracion.MntEmpresaModel;
import com.sigcomt.gestionProyectos.model.administracion.TipoDependenciaProyectoModel;
import com.sigcomt.gestionProyectos.model.administracion.TipoRequisitoProyectoModel;
import com.sigcomt.gestionProyectos.model.administracion.TipoSupuestoProyectoModel;
import com.sigcomt.gestionProyectos.repositorio.administracion.AdministracionDao;
import com.sigcomt.gestionProyectos.repositorio.anteproyecto.PersonaDao;
import com.sigcomt.gestionProyectos.servicio.administracion.AdministracionService;

@Service
public class AdministracionServiceImp implements AdministracionService
{
	@Autowired
	AdministracionDao administracionDao;
	
	@Autowired
	PersonaDao personaDao;

	//[INI] TIPO PROYECTO
	public int registrarTipoProyecto(TipoProyecto param) {
		
		int ind = administracionDao.buscarTipoProyecto(param);
		
		if(ind == 0){
			administracionDao.registrarTipoProyecto(param);
		}
		
		return ind;
	}

	public List<TipoProyecto> listarTipoProyecto() {
		return administracionDao.listarTipoProyecto();
	}
	
	public List<TipoProyecto> listarTipoProyectoByEsado(int estado) {
		return administracionDao.listarTipoProyectoByEsado(estado);
	}
	
	public void eliminarTipoProyecto(Integer param) {
		administracionDao.eliminarTipoProyecto(param);
	}
	//[FIN] TIPO PROYECTO

	//[INI] ESTADO PROYECTO
	public int registrarEstadoProyecto(EstadoProyecto param) {
		
		int ind = administracionDao.buscarEstadoProyecto(param);
		
		if(ind == 0){
			administracionDao.registrarEstadoProyecto(param);
		}
		
		return ind;
	}

	public List<EstadoProyecto> listarEstadoProyecto() {
		return administracionDao.listarEstadoProyecto();
	}
	
	public void eliminarEstadoProyecto(Integer param) {
		administracionDao.eliminarEstadoProyecto(param);
	}
	//[FIN] ESTADO PROYECTO

	//[INI] TIPO REQUISITO
	public int registrarTipoRequisitoProyecto(TipoRequisito param) {
		int ind = administracionDao.buscarTipoRequisitoProyecto(param);
		
		if(ind == 0){
			administracionDao.registrarTipoRequisitoProyecto(param);
		}
		
		return ind;
	}

	public List<TipoRequisitoProyectoModel> listarTipoRequisitoProyecto() {
		return administracionDao.listarTipoRequisitoProyecto();
	}

	public void eliminarTipoRequisitoProyecto(Integer id) {
		administracionDao.eliminarTipoRequisitoProyecto(id);
	}
	//[FIN] TIPO REQUISITO

	//[INI] TIPO SUPUESTO
	public int registrarTipoSupuestoProyecto(TipoSupuesto param) {
		int ind = administracionDao.buscarTipoSupuestoProyecto(param);
		
		if(ind == 0){
			administracionDao.registrarTipoSupuestoProyecto(param);
		}
		
		return ind;
	}

	public List<TipoSupuestoProyectoModel> listarTipoSupuestoProyecto() {
		return administracionDao.listarTipoSupuestoProyecto();
	}

	public void eliminarTipoSupuestoProyecto(Integer id) {
		administracionDao.eliminarTipoSupuestoProyecto(id);
	}
	//[FIN] TIPO SUPUESTO

	//[INI] TIPO DEPENDENCIA
	public int registrarTipoDependenciaProyecto(TipoDependencia param) {
		int ind = administracionDao.buscarTipoDependenciaProyecto(param);
		
		if(ind == 0){
			administracionDao.registrarTipoDependenciaProyecto(param);
		}
		
		return ind;
	}

	public List<TipoDependenciaProyectoModel> listarTipoDependenciaProyecto() {
		return administracionDao.listarTipoDependenciaProyecto();
	}

	public void eliminarTipoDependenciaProyecto(Integer id) {
		administracionDao.eliminarTipoDependenciaProyecto(id);
	}
	//[FIN] TIPO DEPENDENCIA

	//[INI] CATEGORIA ADQUISICIONES
	public int registrarCategAdquisicion(CategoriaAdquisicion param) {
		
		int ind = administracionDao.buscarCategAdquisicion(param);
		
		if(ind == 0){
			administracionDao.registrarCategAdquisicion(param);
		}
		
		return ind;
	}

	public List<CategoriaAdquisicion> listarCategAdquisicion() {
		return administracionDao.listarCategAdquisicion();
	}
	
	public void eliminarCategAdquisicion(Integer param) {
		administracionDao.eliminarCategAdquisicion(param);
	}
	//[FIN] CATEGORIA ADQUISICIONES

	//[INI] COSTOS OPERATIVOS
	public int registrarCostoOperativo(TipoCostoOperativo param) {
		
		int ind = administracionDao.buscarCostoOperativo(param);
		
		if(ind == 0){
			administracionDao.registrarCostoOperativo(param);
		}
		
		return ind;
	}

	public List<TipoCostoOperativo> listarCostoOperativo() {
		return administracionDao.listarCostoOperativo();
	}
	
	public void eliminarCostoOperativo(Integer param) {
		administracionDao.eliminarCostoOperativo(param);
	}
	//[FIN] COSTOS OPERATIVOS

	//[INI] FORMA PAGO
	public int registrarFormaPago(TipoFormaPago param) {
		
		int ind = administracionDao.buscarFormaPago(param);
		
		if(ind == 0){
			administracionDao.registrarFormaPago(param);
		}
		
		return ind;
	}

	public List<TipoFormaPago> listarFormaPago() {
		return administracionDao.listarFormaPago();
	}
	
	public void eliminarFormaPago(Integer param) {
		administracionDao.eliminarFormaPago(param);
	}
	//[FIN] FORMA PAGO

//	INI - EMPRESA
	public List<Empresa> listarEmpresaByEstado(int estado) {
		return administracionDao.listarEmpresaByEstado(estado);
	}

	public List<TipoRol> listarTipoRolbyEstado(int estado) {
		return administracionDao.listarTipoRolbyEstado(estado);
	}

	@Transactional
	public void mntEmpresa(MultipartFile logoEmpresa, MultipartFile formatoEmpresa, MntEmpresaModel empresa, String ruta) 
	{
		try {
			String ruta1 = Constantes.URL_PROYECTO + Constantes.SEPARADOR + empresa.getRazonSocialEmpresa().replace(' ', '_');
			File directorio = new File(ruta1);
			
			if(logoEmpresa != null || formatoEmpresa != null)
				eliminarArchivos(directorio);
			
			directorio.mkdir();
			if (directorio.isDirectory()) {
				if(logoEmpresa != null){
					OutputStream logo = new FileOutputStream(directorio + Constantes.SEPARADOR + logoEmpresa.getOriginalFilename());		
					logo.write(logoEmpresa.getBytes());   
					logo.flush();
					logo.close();
				}
				
				if(formatoEmpresa != null){
					OutputStream formato = new FileOutputStream(directorio + Constantes.SEPARADOR + formatoEmpresa.getOriginalFilename());		
					formato.write(formatoEmpresa.getBytes());   
					formato.flush();
					formato.close();
				}
			}
	        
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		//[INI]		
			Empresa modelo = new Empresa();
			modelo.setIdEmpresa(empresa.getIdEmpresa());
			modelo.setAnexo(empresa.getAnexoEmpresa());
			modelo.setComoContacto(empresa.getContactoEmpresa());
			modelo.setCorreo(empresa.getCorreoEmpresa());
			modelo.setEstado(Constantes.ESTADO_ACTIVO);
	//		modelo.setFormato(empresa.get);
			modelo.setIdpais(empresa.getPaisEmpresa());
	//		modelo.setLogo(logo);
			modelo.setPaginaWeb(empresa.getPaginawebEmpresa());
			modelo.setRazonSocial(empresa.getRazonSocialEmpresa());
			modelo.setRedSocialFacebook(empresa.getFecebookEmpresa());
			modelo.setRedSocialGmail(empresa.getGmailEmpresa());
			modelo.setRedSocialLinkedin(empresa.getLinkedinEmpresa());
			modelo.setRedSocialTwitter(empresa.getTwitterEmpresa());
			modelo.setRuc(empresa.getRucEmpresa());
			modelo.setTelefono(empresa.getTeleEmpresa());
			modelo.setDireccion(empresa.getDireccionEmpresa());
			
			if(empresa.getIdEmpresa() == null)
				administracionDao.registrarEmpresa(modelo);
			else
				administracionDao.editarEmpresa(modelo);
			
			
			List<ContactoEmpresaModel> contEmpresa = empresa.getLista();
			for (ContactoEmpresaModel contactoEmpresaModel : contEmpresa) {
				Persona persona = new Persona();
				persona.setId(contactoEmpresaModel.getIdPersona());
				persona.setAnexo(contactoEmpresaModel.getAnexo());
				persona.setApellidos(contactoEmpresaModel.getApellido());
				persona.setNombres(contactoEmpresaModel.getNombre());
				persona.setCorreo(contactoEmpresaModel.getCorreo());
				persona.setEstado(Constantes.ESTADO_ACTIVO);
				persona.setIdTipoRol(contactoEmpresaModel.getIdcargo());
				persona.setTelefono(contactoEmpresaModel.getTelefono());			
				
				if(contactoEmpresaModel.getIdPersona() == null)
					personaDao.registrarPersona(persona);
				else
					personaDao.editarPersona(persona);
				
				DetalleEmpresaPersona dep = new DetalleEmpresaPersona();
				dep.setId(contactoEmpresaModel.getIdDetEmpPersona());
				dep.setIdEmpresa(modelo.getIdEmpresa());
				dep.setIdPersona(persona.getId());
				dep.setEstado(Constantes.ESTADO_ACTIVO);
				dep.setArea(contactoEmpresaModel.getDscarea());
				
				if(contactoEmpresaModel.getIdDetEmpPersona() == null)
					administracionDao.registrarDetEmpresaPersona(dep);
				else
					administracionDao.editarDetEmpresaPersona(dep);
			}
		//[FIN]
	}
	
	private void eliminarArchivos(File pArchivo) 
	{ 
	    if (!pArchivo.exists()) return; 

	    if (pArchivo.isDirectory()) { 
	        for (File f : pArchivo.listFiles()) { 
	        	eliminarArchivos(f);  } 
	    } 
	    pArchivo.delete(); 
	}

	public Empresa listarEmpresaById(Long idempresa) {		
		return administracionDao.listarEmpresaById(idempresa);
	}

	public List<ContactoEmpresaModel> listarContactoEmpresaByEmpresa(Long idempresa) {
		return administracionDao.listarContactoEmpresaByEmpresa(idempresa);
	}
	
	public int eliminarEmpresa(Long idempresa){
		return administracionDao.eliminarEmpresa(idempresa);
	}
//	FIN - EMPRESA

//  INI - ENTREGABLE
	public int registrarComplejidadEntregable(Complejidad dato) {
		return administracionDao.registrarComplejidadEntregable(dato);
	}
	
	public List<Complejidad> listarComplejidadEntregable(int dato){
		return administracionDao.listarComplejidadEntregable(dato);
	}
	
	public void eliminarComplejidadEntregable(Integer id){
		administracionDao.eliminarComplejidadEntregable(id);
	}
//  FIN - ENTREGABLE

	public int registrarEstadoEntregable(EstadoEntregable dato) {
		return administracionDao.registrarEstadoEntregable(dato);
	}

	public List<EstadoEntregable> listarEstadoEntregable(int dato) {
		return administracionDao.listarEstadoEntregable(dato);
	}

	public void eliminarEstadoEntregable(Integer id) {
		administracionDao.eliminarEstadoEntregable(id);
	}
}
