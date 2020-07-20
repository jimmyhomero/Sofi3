package ecx.unomas.elements;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.util.ByteArrayDataSource;
import ecx.unomas.service.Config;

public class AmazonSES {
	static final String FROM = "agroeden@1mas.ec";
    static final String SMTP_USERNAME = "AKIAIGGWAPI2AVITQXTA";
    static final String SMTP_PASSWORD = "AnAJs5gHl3tCjnIqH6/X+7+FMSepcxG2OVlxUTQ+ovmQ";
    static final String HOST = "email-smtp.us-west-2.amazonaws.com";    
    static final int PORT = 25;

    public boolean send(String email, String cc, String name, String asunto, FileAttachment xml, FileAttachment pdf) throws UnsupportedEncodingException, MessagingException{
        Properties props = System.getProperties();
    	props.put("mail.transport.protocol", "smtps");
    	props.put("mail.smtp.port", PORT); 
    	props.put("mail.smtp.auth", "true");
    	props.put("mail.smtp.starttls.enable", "true");
    	props.put("mail.smtp.starttls.required", "true");

        SecurityManager security = System.getSecurityManager();
        
        Session session = Session.getInstance(props);
    	
    	String html = "<!DOCTYPE html>"+
			"<html lang=\"es-ES\">"+
				"<head>"+
					"<meta charset=\"utf-8\">"+
				"</head>"+
				"<body>"+
					"<div style=\"width:560px; margin:0 auto; font-family:Arial; background:"+Config.color+"; padding:10px;\">"+
					"<h1 style=\"font-family:Arial; color:#FFF;\">"+asunto+"</h1>"+
					"<div style=\"background:#FFF; padding:10px; font-size:14px;\">"+
						"<p>Estimado Cliente</p>"+
						"<h2 style=\"color:#000; font-size:14px;\">"+name+"</h2>"+
						"<p>El archivo adjunto corresponde al comprobante tributaria legalmente valido para las declaraciones de impuestos ante el SRI.</p>"+
						"<div style=\"border-top:#DDD solid 1px; border-bottom:#DDD solid 1px; padding:10px;\">"+
							"<span style=\"color:#999; font-style:italic; \">Att.</span><br>"+
							"<span style=\"color:"+Config.color+";\">El equipo de <a style=\"color:"+Config.color+";\" href=\"http://"+Config.web+"\">"+Config.name+"</a></span>"+
						"</div>"+
					"</div>"+
				"</div>"+
			"</body>"+
		"</html>";

        BodyPart messageBodyPart1 = new MimeBodyPart();     
        messageBodyPart1.setContent(html, "text/html");
        
        MimeBodyPart messageBodyPart2 = new MimeBodyPart();
        DataSource xml_dataSource = new ByteArrayDataSource(xml.getData(), xml.getContentType());
        messageBodyPart2.setDataHandler(new DataHandler(xml_dataSource));
        messageBodyPart2.setFileName(xml.getFileName());
        
        MimeBodyPart messageBodyPart3 = new MimeBodyPart();
        DataSource pdf_dataSource = new ByteArrayDataSource(pdf.getData(), pdf.getContentType());
        messageBodyPart3.setDataHandler(new DataHandler(pdf_dataSource));
        messageBodyPart3.setFileName(pdf.getFileName());
        
        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart1);     
        multipart.addBodyPart(messageBodyPart2);
        multipart.addBodyPart(messageBodyPart3);
        
    	MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(FROM, Config.name));
        message.setSubject(asunto);
        message.setContent(multipart);
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            
        Transport transport = session.getTransport();
                    
        boolean enviado = true;
        try {
            transport.connect(HOST, SMTP_USERNAME, SMTP_PASSWORD);
        	transport.sendMessage(message, message.getAllRecipients());
        } catch (Exception ex) {
            enviado = false;
        } finally {
            transport.close();        	
        }
        return enviado;
    }
}
