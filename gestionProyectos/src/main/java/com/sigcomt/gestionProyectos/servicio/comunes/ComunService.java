package com.sigcomt.gestionProyectos.servicio.comunes;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import com.sigcomt.gestionProyectos.model.comunes.EnvioCorreo;

public interface ComunService {
	public void envioCorreo(EnvioCorreo correo) throws AddressException, MessagingException;

}
