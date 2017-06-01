package com.sigcomt.gestionProyectos.repositorio.cierre;

import java.util.List;

import com.sigcomt.gestionProyectos.dominio.administracion.Entregable;
import com.sigcomt.gestionProyectos.dominio.administracion.Sponsor;
import com.sigcomt.gestionProyectos.model.cierre.LstActaCierreModel;
import com.sigcomt.gestionProyectos.model.cierre.LstLeccionAprendidaModel;
import com.sigcomt.gestionProyectos.model.cierre.MntActaCierreModel;
import com.sigcomt.gestionProyectos.model.cierre.MntLeccionAprendidaModel;

public interface CierreDao 
{
	public List<Entregable> listaEntregable(Integer idproyecto);
	public int mntLeccionAprendida(MntLeccionAprendidaModel dato);
	public List<LstLeccionAprendidaModel> listarLeccionesAprendidas(MntLeccionAprendidaModel bsqLeccionAprendida);
	public int eliminarLeccionesAprendidas(MntLeccionAprendidaModel bsqLeccionAprendida);
	public List<Sponsor> listaSponsor(Sponsor sponsor);
	public int mntActaCierre(MntActaCierreModel dato);
	public List<LstActaCierreModel> listarActaCierre(MntActaCierreModel bsqActaCierre);
}
