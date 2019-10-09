package ec.unomas.elements;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.util.ByteArrayDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.NoSuchProviderException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import ec.unomas.elements.FileAttachment;
import ec.unomas.service.Config;
import java.io.File;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import javax.activation.FileDataSource;

public class SendMail {

    private static final String SMTP_HOST_NAME = "smtp.gmail.com";
    private static final String SMTP_AUTH_USER = "homer.loading@gmail.com";
    private static final String SMTP_AUTH_PWD = "t1c$$2015.**+";
    private static final String SMTP_PORT = "587";

    public  boolean send(String email, String cc, String name, String asunto, File xml, File pdf) throws UnsupportedEncodingException, MessagingException {

        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_HOST_NAME);
        props.put("mail.smtp.user", SMTP_AUTH_USER);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", SMTP_PORT);
      //  props.put("mail.smtp.socketFactory.port", SMTP_PORT);
      //  props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        SecurityManager security = System.getSecurityManager();

        String html = "<!DOCTYPE html>"
                + "<html lang=\"es-ES\">"
                + "<head>"
                + "<meta charset=\"utf-8\">"
                + "</head>"
                + "<body>"
                + "<div style=\"width:560px; margin:0 auto; font-family:Arial; background:" + Config.color + "; padding:10px;\">"
                + "<h1 style=\"font-family:Arial; color:#FFF;\">" + asunto + "</h1>"
                + "<div style=\"background:#FFF; padding:10px; font-size:14px;\">"
                + "<p>Estimado Cliente</p>"
                + "<h2 style=\"color:#000; font-size:14px;\">" + name + "</h2>"
                + "<p>El archivo adjunto corresponde al comprobante tributaria legalmente valido para las declaraciones de impuestos ante el SRI.</p>"
                + "<div style=\"border-top:#DDD solid 1px; border-bottom:#DDD solid 1px; padding:10px;\">"
                + "<span style=\"color:#999; font-style:italic; \">Att.</span><br>"
                + "<span style=\"color:" + Config.color + ";\">El equipo de <a style=\"color:" + Config.color + ";\" href=\"http://" + Config.web + "\">" + Config.name + "</a></span>"
                + "</div>"
                + "</div>"
                + "</div>"
                + "</body>"
                + "</html>";

        Authenticator auth = new SMTPAuthenticator();
        //Session mailSession = Session.getDefaultInstance(props, auth);
        Session mailSession = Session.getDefaultInstance(props, null);
        mailSession.setDebug(false);
        Transport transport = mailSession.getTransport("smtp");

        BodyPart messageBodyPart1 = new MimeBodyPart();
        messageBodyPart1.setContent(html, "text/html");

        MimeBodyPart messageBodyPart2 = new MimeBodyPart();
        //DataSource xml_dataSource = new ByteArrayDataSource(xml.getData(), xml.getContentType());
        DataSource xml_dataSource = new FileDataSource(xml);
        messageBodyPart2.setDataHandler(new DataHandler(xml_dataSource));
        messageBodyPart2.setFileName(xml_dataSource.getName());

        MimeBodyPart messageBodyPart3 = new MimeBodyPart();
        //DataSource pdf_dataSource = new ByteArrayDataSource(pdf.getData(), pdf.getContentType());
        DataSource pdf_dataSource= new FileDataSource(pdf);
        messageBodyPart3.setDataHandler(new DataHandler(pdf_dataSource));
        messageBodyPart3.setFileName(pdf_dataSource.getName());

        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart1);
        multipart.addBodyPart(messageBodyPart2);
        multipart.addBodyPart(messageBodyPart3);

        MimeMessage message = new MimeMessage(mailSession);
        message.setFrom(new InternetAddress(SMTP_AUTH_USER, Config.name));
        message.setSubject(asunto);
        message.setContent(multipart);
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

        
        transport.connect(SMTP_HOST_NAME, SMTP_AUTH_USER, SMTP_AUTH_PWD);
        transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
        transport.close();

        return true;
    }

    private class SMTPAuthenticator extends javax.mail.Authenticator {

        public PasswordAuthentication getPasswordAuthentication() {
            String username = SMTP_AUTH_USER;
            String password = SMTP_AUTH_PWD;
            return new PasswordAuthentication(username, password);
        }
    }
}
