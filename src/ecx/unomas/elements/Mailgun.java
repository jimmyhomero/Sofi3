package ecx.unomas.elements;

import java.io.File;
import javax.ws.rs.core.MediaType;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;
import com.sun.jersey.multipart.FormDataMultiPart;
import com.sun.jersey.multipart.file.FileDataBodyPart;
import ecx.unomas.service.Config;

public class Mailgun {
	
	public static boolean send(String email, String cc, String name, String asunto, File xml, File pdf, Boolean validating){
		Client client = Client.create();
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
						"<h2 style=\"color:#000; font-size:14px;\">"+name+"</h2>";
						if (validating){
							html += "<p>Se adjunta el comprobante electronico ya autorizado por el SRI, valido para sus declaraciones de impuestos.</p>";
						}else{
							html += "<p>Se adjunta el comprobante electronico que se envio al SRI, pronto le volveremos a enviar el ya autorizado.</p>";
						}
						html+="<div style=\"border-top:#DDD solid 1px; border-bottom:#DDD solid 1px; padding:10px;\">"+
							"<span style=\"color:#999; font-style:italic; \">Att.</span><br>"+
							"<span style=\"color:"+Config.color+";\">El equipo de <a style=\"color:"+Config.color+";\" href=\"http://"+Config.web+"\">"+Config.name+"</a></span>"+
						"</div>"+
					"</div>"+
				"</div>"+
			"</body>"+
		"</html>";
		client.addFilter(new HTTPBasicAuthFilter("api",Config.api));
		WebResource webResource = client.resource(Config.domain + "messages");
		FormDataMultiPart form = new FormDataMultiPart();
		form.field("from", Config.from);
		form.field("to", email);
		if (!cc.equals("")){
			form.field("cc", cc);
		}
		form.field("subject", asunto);
		form.field("html", html);
		form.bodyPart(new FileDataBodyPart("attachment",xml,MediaType.TEXT_PLAIN_TYPE));
		form.bodyPart(new FileDataBodyPart("attachment",pdf,MediaType.APPLICATION_OCTET_STREAM_TYPE));
		ClientResponse clientResponse = webResource.type(MediaType.MULTIPART_FORM_DATA_TYPE).post(ClientResponse.class, form);
		String output = clientResponse.getEntity(String.class);
		System.out.println(output);
		return true;
	}
}
