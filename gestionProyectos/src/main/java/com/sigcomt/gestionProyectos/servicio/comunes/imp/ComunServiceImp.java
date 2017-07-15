package com.sigcomt.gestionProyectos.servicio.comunes.imp;

import java.util.Properties;
import java.util.ResourceBundle;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.stereotype.Service;

import com.sigcomt.gestionProyectos.common.Constantes;
import com.sigcomt.gestionProyectos.model.comunes.EnvioCorreo;
import com.sigcomt.gestionProyectos.servicio.comunes.ComunService;

@Service
public class ComunServiceImp implements ComunService
{
	private static final ResourceBundle smtp = ResourceBundle.getBundle("smtp");
	
	
	public void envioCorreo(EnvioCorreo correo) throws AddressException, MessagingException {
		Properties props = new Properties();

		// Nombre del host de correo, es smtp.gmail.com
		props.setProperty("mail.smtp.host", smtp.getString(Constantes.HOST_CORREO));

		// TLS si está disponible
		props.setProperty("mail.smtp.starttls.enable", smtp.getString(Constantes.START_ENABLE_CORREO));

		// Puerto de gmail para envio de correos
		props.setProperty("mail.smtp.port", smtp.getString(Constantes.PUERTO_CORREO));

		// Nombre del usuario
		props.setProperty("mail.smtp.user", smtp.getString(Constantes.USUARIO_CORREO));

		// Si requiere o no usuario y password para conectarse.
		props.setProperty("mail.smtp.auth", smtp.getString(Constantes.AUTORIZACION_CORREO));

		Session session = Session.getDefaultInstance(props);

		// Para obtener un log de salida más extenso
		session.setDebug(true); 
				
		 // Se compone la parte del texto
        BodyPart texto = new MimeBodyPart();
        texto.setText(correo.getMensaje());
        
        BodyPart adjunto = new MimeBodyPart();
        
        // Se compone el adjunto con la imagen
        if(correo.getNombreArchivo() != null && correo.getNombreArchivo().length() > 0
        	&& correo.getRutaArchivo() != null && correo.getRutaArchivo().length() > 0){        	
        	adjunto.setDataHandler(new DataHandler(new FileDataSource(correo.getRutaArchivo())));
        	adjunto.setFileName(correo.getNombreArchivo());
        }
        
        // Una MultiParte para agrupar texto e imagen.
        MimeMultipart multiParte = new MimeMultipart();
        multiParte.addBodyPart(texto);
        if(correo.getNombreArchivo() != null && correo.getNombreArchivo().length() > 0
            	&& correo.getRutaArchivo() != null && correo.getRutaArchivo().length() > 0)
        	multiParte.addBodyPart(adjunto);
        
        //Agregamos firma
        BodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setContent(Constantes.FIRMA_SIGCOMT, "text/html");
        multiParte.addBodyPart(messageBodyPart);
        
        try {
			addCID("logofirma", correo.getRutaLogo(), multiParte);
		} catch (Exception e) {
			e.printStackTrace();
		}

        // Se compone el correo, dando to, from, subject y el contenido.
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(smtp.getString(Constantes.USUARIO_CORREO)));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(correo.getCorreoDestino()));
        if(correo.getCorreoCopia() != null && correo.getCorreoCopia().length() > 0)
        	message.addRecipient(Message.RecipientType.CC, new InternetAddress(correo.getCorreoCopia()));
        message.setSubject(correo.getAsunto());
        message.setContent(multiParte);
		
		Transport t = session.getTransport(smtp.getString(Constantes.SMTP_CORREO));

		// Aqui usuario y password de gmail
		t.connect(smtp.getString(Constantes.USUARIO_CORREO),smtp.getString(Constantes.PASSWORD_CORREO));
		t.sendMessage(message,message.getAllRecipients());
		t.close();
	}
	
	public void addCID(String cidname,String pathname, MimeMultipart multiParte) throws Exception
    {
        DataSource fds = new FileDataSource(pathname);
        BodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setDataHandler(new DataHandler(fds));
        messageBodyPart.setHeader("Content-ID","<"+cidname+">");
        multiParte.addBodyPart(messageBodyPart);
    }
}
