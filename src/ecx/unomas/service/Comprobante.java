package ecx.unomas.service;

import ClasesAuxiliares.Leertxt;
import ClasesAuxiliares.debug.Deb;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.mail.MessagingException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import com.itextpdf.text.DocumentException;
import com.sun.jersey.api.client.ClientResponse;
import ec.gob.sri.comprobantes.ws.Mensaje;
import ec.gob.sri.comprobantes.ws.RespuestaSolicitud;
import ec.gob.sri.comprobantes.ws.aut.Autorizacion;
import ecx.unomas.elements.AmazonSES;
import ecx.unomas.elements.ArchivoUtil;
import ecx.unomas.elements.AutorizacionComprobantesWs;
import ecx.unomas.elements.CertificadosSSL;
import ecx.unomas.elements.CheckConnection;
import ecx.unomas.elements.EnvioComprobantesWs;
import ecx.unomas.elements.FileAttachment;
import ecx.unomas.elements.Mailgun;
import ecx.unomas.elements.ReadXML;
import ecx.unomas.elements.SendMail;
import ecx.unomas.elements.TagNotFoundException;
import ecx.unomas.factura.Factura;
import ecx.unomas.guiaremision.GuiaRemision;
import ecx.unomas.notacredito.NotaCredito;
import ecx.unomas.notadebito.NotaDebito;
import ecx.unomas.retencion.Retencion;
import ecx.unomas.sign.XAdESBESSignature;
import java.io.UnsupportedEncodingException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

public class Comprobante {

    static {
        System.setProperty("javax.net.ssl.trustStore", Config.CACERT);
        System.setProperty("javax.net.ssl.trustStorePassword", "changeit");
        System.setProperty("javax.net.ssl.keyStore", Config.CACERT);
        System.setProperty("javax.net.ssl.keyStorePassword", "changeit");
    }

    public String upload(String claveAcceso, byte[] xmlBytes) {
        String debug = "";
        String respuesta = "{\"status\":\"OK\"}";
        try {
            CertificadosSSL.instalarCertificados();

            // GUARDAR ARCHIVO XML EN EL EQUIPO
            FileOutputStream fos = new FileOutputStream(Config.SUBIDOS_DIR  + claveAcceso + ".xml");
            BufferedOutputStream outputStream = new BufferedOutputStream(fos);
            outputStream.write(xmlBytes);
            outputStream.close();

            // LEER EL XML SUBIDO
            File uploaded_file = new File(Config.SUBIDOS_DIR + claveAcceso + ".xml");
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = dbf.newDocumentBuilder();
            Document doc = db.parse(uploaded_file);
            doc.getDocumentElement().normalize();

            NodeList firstTag = doc.getElementsByTagName(doc.getDocumentElement().getNodeName());
            Element firstElement = (Element) firstTag.item(0);
            Element firstElements = (Element) firstElement;

            NodeList infoTributariaTag = firstElements.getElementsByTagName("infoTributaria");
            Element infoTributariaElement = (Element) infoTributariaTag.item(0);
            Element infoTributariaElements = (Element) infoTributariaElement;

            NodeList ambienteTag = infoTributariaElements.getElementsByTagName("ambiente");
            Element ambienteElement = (Element) ambienteTag.item(0);
            NodeList ambiente = ambienteElement.getChildNodes();
            String ambienteValue = ((Node) ambiente.item(0)).getNodeValue();
            // ESTABLECER SI SE VA A PRUEBAS O A PRODUCCION
            String RECEPCION_WSDL;
            if (ambienteValue.equals("1")) {
                RECEPCION_WSDL = Config.RECEPCION_WSDL_PRUEBAS;
            } else {
                RECEPCION_WSDL = Config.RECEPCION_WSDL_PRODUCCION;
            }
            // FIRMAR XML
            if (Config.FE_SOLO_FIRMA_DOC) {
                //// SOLO FIRMA EL XML GENERADO PREVIAMENE SOLO PARA SHEYLA 
              Config.FE_DOCUMENTO_FIRMADO=  XAdESBESSignature.sign(Config.SUBIDOS_DIR  + claveAcceso + ".xml", claveAcceso);
            } else {
                // FIRMA ENVIA AUTORIZA, DESCARGA, GENERA PDF Y ENVIA AL EMAIL
                 Config.FE_DOCUMENTO_FIRMADO=XAdESBESSignature.sign(Config.SUBIDOS_DIR   + claveAcceso + ".xml", claveAcceso);
                // VERIFICAR SI EXISTE CONEXION
                boolean a = CheckConnection.existeConexion(RECEPCION_WSDL);
                // System.err.println(a);
                if (CheckConnection.existeConexion(RECEPCION_WSDL)) {

                    File xml_file = new File(Config.FIRMADOS_DIR + claveAcceso + ".xml");
                    // Validate XML with the SRI WebService
                    EnvioComprobantesWs ec = new EnvioComprobantesWs(RECEPCION_WSDL);
                    RespuestaSolicitud response = ec.enviarComprobante(xml_file);
                    //JOptionPane.showMessageDialog(null, response.getEstado() + " -- " + response.getComprobantes().toString());
                    if (response.getEstado().equals("RECIBIDA")) {
                        Config.FE_DOCUMENTO_AUTORIZADO=true;
                        // SE BORRA SI ES QUE ANTES NO FUE AUTORIZADO, PARA QUE COJA LA VERIFICACION
                        File aut_file = new File(Config.NO_AUTORIZADOS_DIR   + claveAcceso + ".xml");
                        if (aut_file.exists()) {
                            aut_file.delete();
                        }
                        // GENERAR RIDE
                        boolean hasEmail = false;
                        String email = "";
                        String cc = "";
                        String name = "";
                        String asunto = "";
                        Date date = new Date();
                        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss.SSS");
                        formatter.setTimeZone(TimeZone.getTimeZone("America/Guayaquil"));
                        String fecha = formatter.format(date);
                        ReadXML reader = new ReadXML();
                        File pdf_file = new File(Config.AUTORIZADOS_DIR  + claveAcceso + ".pdf");
                        if (doc.getDocumentElement().getNodeName().equals("factura")) {
                            Factura factura = reader.readFactura(doc);
                            factura.setNroAutorizacion(claveAcceso);
                            factura.setFechaAutorizacion(fecha);
                            if (!pdf_file.exists()) {
                                ecx.unomas.pdf.Factura factura_pdf = new ecx.unomas.pdf.Factura();
                                factura_pdf.generatePDF(factura, null);
                            }
                            if (factura.hasEmail()) {
                                hasEmail = true;
                                email = factura.getInfoAdicionalEmail();
                                cc = factura.getInfoAdicionalEmailCC();
                                name = factura.getRazonSocialComprador();
                                asunto = "FACTURA ELECTRONICA";
                            }
                        } else if (doc.getDocumentElement().getNodeName().equals("notaDebito")) {
                            NotaDebito notaDebito = reader.readNotaDebito(doc);
                            notaDebito.setAuthNumber(claveAcceso);
                            notaDebito.setAuthDate(fecha);
                            if (!pdf_file.exists()) {
                                ecx.unomas.pdf.NotaDebito notaDebito_pdf = new ecx.unomas.pdf.NotaDebito();
                                notaDebito_pdf.generatePDF(notaDebito, null);
                            }
                            if (notaDebito.hasEmail()) {
                                hasEmail = true;
                                email = notaDebito.getInfoAdicionalEmail();
                                cc = notaDebito.getInfoAdicionalEmailCC();
                                name = notaDebito.getRazonSocialComprador();
                                asunto = "NOTA DE DEBITO";
                            }
                        } else if (doc.getDocumentElement().getNodeName().equals("notaCredito")) {
                            NotaCredito notaCredito = reader.readNotaCredito(doc);
                            notaCredito.setAuthNumber(claveAcceso);
                            notaCredito.setAuthDate(fecha);
                            if (!pdf_file.exists()) {
                                ecx.unomas.pdf.NotaCredito notaCredito_pdf = new ecx.unomas.pdf.NotaCredito();
                                notaCredito_pdf.generatePDF(notaCredito, null);
                            }
                            if (notaCredito.hasEmail()) {
                                hasEmail = true;
                                email = notaCredito.getInfoAdicionalEmail();
                                cc = notaCredito.getInfoAdicionalEmailCC();
                                name = notaCredito.getRazonSocialComprador();
                                asunto = "NOTA DE CREDITO";
                            }
                        } else if (doc.getDocumentElement().getNodeName().equals("guiaRemision")) {
                            GuiaRemision guiaRemision = reader.readGuiaRemision(doc);
                            guiaRemision.setAuthNumber(claveAcceso);
                            guiaRemision.setAuthDate(fecha);
                            if (!pdf_file.exists()) {
                                ecx.unomas.pdf.GuiaRemision guiaRemision_pdf = new ecx.unomas.pdf.GuiaRemision();
                                guiaRemision_pdf.generatePDF(guiaRemision, null);
                            }
                            if (guiaRemision.hasEmail()) {
                                hasEmail = true;
                                email = guiaRemision.getInfoAdicionalEmail();
                                cc = guiaRemision.getInfoAdicionalEmailCC();
                                name = guiaRemision.getRazonSocialTransportista();
                                asunto = "GUIA DE REMISION";
                            }
                        } else if (doc.getDocumentElement().getNodeName().equals("comprobanteRetencion")) {
                            Retencion retencion = reader.readRetencion(doc);
                            retencion.setAuthNumber(claveAcceso);
                            retencion.setAuthDate(fecha);
                            if (!pdf_file.exists()) {
                                ecx.unomas.pdf.Retencion retencion_pdf = new ecx.unomas.pdf.Retencion();
                                retencion_pdf.generatePDF(retencion, null);
                            }
                            if (retencion.hasEmail()) {
                                hasEmail = true;
                                email = retencion.getInfoAdicionalEmail();
                                cc = retencion.getInfoAdicionalEmailCC();
                                name = retencion.getRazonSocialSujetoRetenido();
                                asunto = "RETENCION";
                            }
                        }
                        // ENVIAR POR CORREO
                        if (hasEmail) {
                            if (!pdf_file.exists()) {
                                pdf_file = new File(Config.AUTORIZADOS_DIR  + claveAcceso + ".pdf");
                            }
                            //if (Mailgun.send(email, cc, name, asunto, xml_file, pdf_file, false)) {}
                            SendMail mail = new SendMail();
                                if (mail.send(email, cc, name, asunto, xml_file, pdf_file)) {
                                 Config.FE_DOCUMENTO_ENVIADO=true;
                                respuesta = "{\"status\":\"OK\", \"emailed\":\"SI\"}";
                            } else {
                                respuesta = "{\"status\":\"OK\", \"emailed\":\"NO\"}";
                            }
                        } else {
                            respuesta = "{\"status\":\"OK\", \"emailed\":\"NO\"}";
                        }
                    } else if (response.getEstado().equals("DEVUELTA")) {
                        String error = "";
                        List<ec.gob.sri.comprobantes.ws.Comprobante> lstComprobantes = response.getComprobantes().getComprobante();
                        for (ec.gob.sri.comprobantes.ws.Comprobante comprobante : lstComprobantes) {
                            List<Mensaje> lstMensajes = comprobante.getMensajes().getMensaje();
                            for (Mensaje mensaje : lstMensajes) {
                                error += mensaje.getMensaje().replace("\"", "");
                                if (mensaje.getInformacionAdicional() != null) {
                                    error += ": " + mensaje.getInformacionAdicional().replace("\"", "") + " | ";
                                } else {
                                    error += " | ";
                                }
                            }
                        }
                        if (error.length() > 3) {
                            error = error.substring(0, error.length() - 3);
                        }
                        error = error.replace("\t", " ").replace("\n", "");
                        respuesta = "{\"status\":\"fail\", \"error\":\"" + error + "\"}";
                    } else {
                        respuesta = "{\"status\":\"fail\", \"error\":\"" + response.getEstado() + "\"}" + "ENVIO Y AUTORIZACION AL SRI DESHABILITADO";
                    }
                } else {
                    respuesta = "{\"status\":\"fail\", \"error\":\"No hay conexion con el SRI\"}";
                }
            }
        } catch (IOException e) {
            respuesta = "{\"status\":\"fail\", \"error\":\"" + String.valueOf(e.getMessage()).replace("\"", "") + "\", \"debug\":\"" + debug + "\"}";
            e.printStackTrace();
        } catch (ParserConfigurationException e) {
            respuesta = "{\"status\":\"fail\", \"error\":\"" + String.valueOf(e.getMessage()).replace("\"", "") + "\", \"debug\":\"" + debug + "\"}";
            e.printStackTrace();
        } catch (SAXException e) {
            respuesta = "{\"status\":\"fail\", \"error\":\"" + String.valueOf(e.getMessage()).replace("\"", "") + "\", \"debug\":\"" + debug + "\"}";
            e.printStackTrace();
        } catch (Exception e) {
            respuesta = "{\"status\":\"fail\", \"error\":\"" + String.valueOf(e.getMessage()).replace("\"", "") + "\", \"debug\":\"" + debug + "\"}";
            e.printStackTrace();
        } catch (Throwable e) {
            respuesta = "{\"status\":\"fail\", \"error\":\"" + String.valueOf(e.getMessage()).replace("\"", "") + "\", \"debug\":\"" + debug + "\"}";
            e.printStackTrace();
        }
        return respuesta;
    }
    
    public String getxmlFromSriWS2(String claveAcceso) throws MalformedURLException, Exception {
        String c = "";
        CertificadosSSL.instalarCertificados();
        String respuesta = "{\"status\":\"fail\", \"error\":\"UNKNOW\"}";
        String ambienteValue = "0";
        String AUTORIZACION_WSDL;
        if (ambienteValue.equals("1")) {
            AUTORIZACION_WSDL = Config.AUTORIZACION_WSDL_PRUEBAS;
            System.out.println("PRUEBAS");
        } else {
            AUTORIZACION_WSDL = Config.AUTORIZACION_WSDL_PRODUCCION;
            System.out.println("PRODUCCION=");
        }
        System.out.println("AUTORIZACION_WSDL: "+AUTORIZACION_WSDL);
        boolean is_autorize = false;
        String nroAuth = "";
        Date fechaAuth = null;
        String fecha = "";
        String xxmmll = "";
        AutorizacionComprobantesWs auto;
        auto = new AutorizacionComprobantesWs(AUTORIZACION_WSDL);
        xxmmll = auto.getAComprobanteAutorizado(claveAcceso);
          System.out.println("Clave Accesox:" + claveAcceso);
          System.out.println("*****\n\n\n" + xxmmll);
        return xxmmll;
    }
    
    public String getxmlFromSriWSx(String claveAcceso) throws MalformedURLException, Exception {
        String c = "";
        CertificadosSSL.instalarCertificados();
        String respuesta = "{\"status\":\"fail\", \"error\":\"UNKNOW\"}";
        String ambienteValue = "0";
        String AUTORIZACION_WSDL;
        if (ambienteValue.equals("1")) {
            AUTORIZACION_WSDL = Config.AUTORIZACION_WSDL_PRUEBAS;
        } else {
            AUTORIZACION_WSDL = Config.AUTORIZACION_WSDL_PRODUCCION;
        }

        boolean is_autorize = false;
        String nroAuth = "";
        Date fechaAuth = null;
        String fecha = "";
        // Authorize document
        ///////jcjc
        AutorizacionComprobantesWs auto;
        auto = new AutorizacionComprobantesWs(AUTORIZACION_WSDL);
        ////aqui verifica si esta o no autorizado, y escribe al final del archvo "AUTORIZADO" O "NO AUTORIZADO"
        List<Autorizacion> listaAutorizaciones = auto.autorizarComprobante(claveAcceso, Config.GENERADOS_DIR + claveAcceso + ".xml", Config.GENERADOS_DIR  + claveAcceso + ".xml");

        if (listaAutorizaciones.isEmpty()) {
            respuesta = "{\"status\":\"fail\", \"error\":\"DOCUMENTO AUN NO AUTORIZADO\"}";
        } else {
            for (Autorizacion autorizacion : listaAutorizaciones) {
                autorizacion.getComprobante();
                String estado = autorizacion.getEstado();
                String fechax = autorizacion.getFechaAutorizacion().toGregorianCalendar().getTime().toString();
                String NumAutx = autorizacion.getNumeroAutorizacion();
           //     JOptionPane.showMessageDialog(null, "estado: " + estado + " fechaautor: " + fechax + " numAutoriza: " + NumAutx);

                System.out.println("@###############3: " + "estado: " + estado + " fechaautor: " + fechax + " numAutoriza: " + NumAutx);
                //  String estadox = autorizacion.getNumeroAutorizacion();
                if (estado.toUpperCase().compareTo("AUTORIZADO") == 0) {
                    is_autorize = true;
//                    leerarchivosGenerados.NumAutorizacionFromSRI = autorizacion.getNumeroAutorizacion();
//                    fechaAuth = autorizacion.getFechaAutorizacion().toGregorianCalendar().getTime();
//                    leerarchivosGenerados.fechaFromSRI = fechaAuth.toString();

                    c = autorizacion.getComprobante();
                }
            }
        }
        return c;
    }

    public static boolean VerificasiExisteConecionconWSdelSRI(String claveAcceso) {
         
        CertificadosSSL.instalarCertificados();
        String RECEPCION_WSDL;
        
        String ambienteValue=claveAcceso.substring(23, 24);
         System.out.println("ec.unomas.service.Comprobante.VerificasiExisteConecionconWSdelSRI()kkkkkkkkkkkkkkkkkkkkk"+ambienteValue);
            if (ambienteValue.equals("1")) {
                RECEPCION_WSDL = Config.RECEPCION_WSDL_PRUEBAS;
            } else {
                RECEPCION_WSDL = Config.RECEPCION_WSDL_PRODUCCION;
            }
               if (CheckConnection.existeConexion(RECEPCION_WSDL)) {
                   return true; 
               }else{
               return false;
               }
         
     }
    public String xmlToPDF(String claveAcceso, byte[] xmlBytes,String dirXML,String dirPDF) {
        String debug = "";
        String respuesta = "{\"status\":\"OK\"}";
        try {
    
            // LEER EL XML SUBIDO
            File uploaded_file = new File(dirXML +claveAcceso + ".xml");
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = dbf.newDocumentBuilder();
            Document doc = db.parse(uploaded_file);
            doc.getDocumentElement().normalize();

            NodeList firstTag = doc.getElementsByTagName(doc.getDocumentElement().getNodeName());
            Element firstElement = (Element) firstTag.item(0);
            Element firstElements = (Element) firstElement;
            NodeList infoTributariaTag = firstElements.getElementsByTagName("infoTributaria");
            Element infoTributariaElement = (Element) infoTributariaTag.item(0);
            Element infoTributariaElements = (Element) infoTributariaElement;

//            NodeList ambienteTag = infoTributariaElements.getElementsByTagName("ambiente");
//            Element ambienteElement = (Element) ambienteTag.item(0);
//            NodeList ambiente = ambienteElement.getChildNodes();
//            String ambienteValue = ((Node) ambiente.item(0)).getNodeValue();
            // ESTABLECER SI SE VA A PRUEBAS O A PRODUCCION
            String RECEPCION_WSDL;
//            if (ambienteValue.equals("1")) {
//                RECEPCION_WSDL = Config.RECEPCION_WSDL_PRUEBAS;
//            } else {
//                RECEPCION_WSDL = Config.RECEPCION_WSDL_PRODUCCION;
//            }
//            // FIRMAR XML
            if (1==1){
                // FIRMA ENVIA AUTORIZA, DESCARGA, GENERA PDF Y ENVIA AL EMAIL
              //   Config.FE_DOCUMENTO_FIRMADO=XAdESBESSignature.sign(Config.SUBIDOS_DIR   + claveAcceso + ".xml", claveAcceso);
                // VERIFICAR SI EXISTE CONEXION
   //             boolean a = CheckConnection.existeConexion(RECEPCION_WSDL);
                // System.err.println(a);
             //   if (CheckConnection.existeConexion(true)) {
             if(1==1){

//                    File xml_file = new File(Config.FIRMADOS_DIR + claveAcceso + ".xml");
//                    // Validate XML with the SRI WebService
//                    EnvioComprobantesWs ec = new EnvioComprobantesWs(RECEPCION_WSDL);
//                    RespuestaSolicitud response = ec.enviarComprobante(xml_file);
                    //JOptionPane.showMessageDialog(null, response.getEstado() + " -- " + response.getComprobantes().toString());
                    if (0==0) {
//                        Config.FE_DOCUMENTO_AUTORIZADO=true;
                        // SE BORRA SI ES QUE ANTES NO FUE AUTORIZADO, PARA QUE COJA LA VERIFICACION
//                        File aut_file = new File(Config.NO_AUTORIZADOS_DIR   + claveAcceso + ".xml");
//                        if (aut_file.exists()) {
//                            aut_file.delete();
//                        }
                        // GENERAR RIDE
                        boolean hasEmail = false;
                        String email = "";
                        String cc = "";
                        String name = "";
                        String asunto = "";
                        Date date = new Date();
                        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss.SSS");
                        formatter.setTimeZone(TimeZone.getTimeZone("America/Guayaquil"));
                        String fecha = formatter.format(date);
                        ReadXML reader = new ReadXML();
                        File pdf_file = new File(dirPDF + claveAcceso + ".pdf");
                        if (doc.getDocumentElement().getNodeName().equals("factura")) {
                            System.out.println("DucumentoDescargado es: "+doc.getDocumentElement().getNodeName());
                            Factura factura = reader.readFactura(doc);
                            factura.setNroAutorizacion(claveAcceso);
                            factura.setFechaAutorizacion(fecha);
                            Leertxt.listaFacturasGenaradas.add(factura);
                            if (!pdf_file.exists()) {
                                ecx.unomas.pdf.Factura factura_pdf = new ecx.unomas.pdf.Factura();
                                factura_pdf.generatePDF(factura, null);
                            }
                            if (factura.hasEmail()) {
                                hasEmail = true;
                                email = factura.getInfoAdicionalEmail();
                                cc = factura.getInfoAdicionalEmailCC();
                                name = factura.getRazonSocialComprador();
                                asunto = "FACTURA ELECTRONICA";
                            }
                        } else if (doc.getDocumentElement().getNodeName().equals("notaDebito")) {
                            System.out.println("DucumentoDescargado es: "+doc.getDocumentElement().getNodeName());
                            NotaDebito notaDebito = reader.readNotaDebito(doc);
                            notaDebito.setAuthNumber(claveAcceso);
                            notaDebito.setAuthDate(fecha);
                            Leertxt.listaNotaDebitoGenaradas.add(notaDebito);
                            if (!pdf_file.exists()) {
                                ecx.unomas.pdf.NotaDebito notaDebito_pdf = new ecx.unomas.pdf.NotaDebito();
                                notaDebito_pdf.generatePDF(notaDebito, null);
                            }
                            if (notaDebito.hasEmail()) {
                                hasEmail = true;
                                email = notaDebito.getInfoAdicionalEmail();
                                cc = notaDebito.getInfoAdicionalEmailCC();
                                name = notaDebito.getRazonSocialComprador();
                                asunto = "NOTA DE DEBITO";
                            }
                        } else if (doc.getDocumentElement().getNodeName().equals("notaCredito")) {
                            System.out.println("DucumentoDescargado es: "+doc.getDocumentElement().getNodeName());
                            NotaCredito notaCredito = reader.readNotaCredito(doc);
                            notaCredito.setAuthNumber(claveAcceso);
                            notaCredito.setAuthDate(fecha);
                           Leertxt.listaNotaCreditoGenaradas.add(notaCredito);
                            if (!pdf_file.exists()) {
                                ecx.unomas.pdf.NotaCredito notaCredito_pdf = new ecx.unomas.pdf.NotaCredito();
                                notaCredito_pdf.generatePDF(notaCredito, null);
                            }
                            if (notaCredito.hasEmail()) {
                                hasEmail = true;
                                email = notaCredito.getInfoAdicionalEmail();
                                cc = notaCredito.getInfoAdicionalEmailCC();
                                name = notaCredito.getRazonSocialComprador();
                                asunto = "NOTA DE CREDITO";
                            }
                        } else if (doc.getDocumentElement().getNodeName().equals("guiaRemision")) {
                            System.out.println("DucumentoDescargado es: "+doc.getDocumentElement().getNodeName());
                            GuiaRemision guiaRemision = reader.readGuiaRemision(doc);
                            guiaRemision.setAuthNumber(claveAcceso);
                            guiaRemision.setAuthDate(fecha);
                            if (!pdf_file.exists()) {
                                ecx.unomas.pdf.GuiaRemision guiaRemision_pdf = new ecx.unomas.pdf.GuiaRemision();
                                guiaRemision_pdf.generatePDF(guiaRemision, null);
                            }
                            if (guiaRemision.hasEmail()) {
                                hasEmail = true;
                                email = guiaRemision.getInfoAdicionalEmail();
                                cc = guiaRemision.getInfoAdicionalEmailCC();
                                name = guiaRemision.getRazonSocialTransportista();
                                asunto = "GUIA DE REMISION";
                            }
                        } else if (doc.getDocumentElement().getNodeName().equals("comprobanteRetencion")) {
                            System.out.println("DucumentoDescargado es: "+doc.getDocumentElement().getNodeName());
                            Retencion retencion = reader.readRetencion(doc);
                            retencion.setAuthNumber(claveAcceso);
                            retencion.setAuthDate(fecha);
                            Leertxt.listaRetencionesGenaradas.add(retencion);
                            if (!pdf_file.exists()) {
                                ecx.unomas.pdf.Retencion retencion_pdf = new ecx.unomas.pdf.Retencion();
                                retencion_pdf.generatePDF(retencion, null);
                            }
                            if (retencion.hasEmail()) {
                                hasEmail = true;
                                email = retencion.getInfoAdicionalEmail();
                                cc = retencion.getInfoAdicionalEmailCC();
                                name = retencion.getRazonSocialSujetoRetenido();
                                asunto = "RETENCION";
                            }
                        }
                        // ENVIAR POR CORREO
//                        if (hasEmail) {
//                            if (!pdf_file.exists()) {
//                                pdf_file = new File(Config.AUTORIZADOS_DIR  + claveAcceso + ".pdf");
//                            }
//                            //if (Mailgun.send(email, cc, name, asunto, xml_file, pdf_file, false)) {}
//                            SendMail mail = new SendMail();
//                                if (mail.send(email, cc, name, asunto, xml_file, pdf_file)) {
//                                 Config.FE_DOCUMENTO_ENVIADO=true;
//                                respuesta = "{\"status\":\"OK\", \"emailed\":\"SI\"}";
//                            } else {
//                                respuesta = "{\"status\":\"OK\", \"emailed\":\"NO\"}";
//                            }
//                        } else {
//                            respuesta = "{\"status\":\"OK\", \"emailed\":\"NO\"}";
//                        }
                    }
                
            }
            }
        } catch (IOException e) {
            respuesta = "{\"status\":\"fail\", \"error\":\"" + String.valueOf(e.getMessage()).replace("\"", "") + "\", \"debug\":\"" + debug + "\"}";
            e.printStackTrace();
        } catch (ParserConfigurationException e) {
            respuesta = "{\"status\":\"fail\", \"error\":\"" + String.valueOf(e.getMessage()).replace("\"", "") + "\", \"debug\":\"" + debug + "\"}";
            e.printStackTrace();
        } catch (SAXException e) {
            respuesta = "{\"status\":\"fail\", \"error\":\"" + String.valueOf(e.getMessage()).replace("\"", "") + "\", \"debug\":\"" + debug + "\"}";
            e.printStackTrace();
        } catch (Exception e) {
            respuesta = "{\"status\":\"fail\", \"error\":\"" + String.valueOf(e.getMessage()).replace("\"", "") + "\", \"debug\":\"" + debug + "\"}";
            e.printStackTrace();
        } catch (Throwable e) {
            respuesta = "{\"status\":\"fail\", \"error\":\"" + String.valueOf(e.getMessage()).replace("\"", "") + "\", \"debug\":\"" + debug + "\"}";
            e.printStackTrace();
        }
        return respuesta;
    }

    public byte[] download(String claveAcceso, String ext) {
        File file = new File(Config.AUTORIZADOS_DIR + claveAcceso + "." + ext.toLowerCase());
        byte[] file_bytes = null;
        if (file.exists()) {
            try {
                file_bytes = ArchivoUtil.convertirArchivoAByteArray(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            file = new File(Config.NO_AUTORIZADOS_DIR  + claveAcceso + "." + ext.toLowerCase());
            if (file.exists()) {
                try {
                    file_bytes = ArchivoUtil.convertirArchivoAByteArray(file);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return file_bytes;
    }

    public String changeKey(String clave) {
        String respuesta = "{\"status\":\"OK\"}";
        Writer writer = null;
        try {
            writer = new BufferedWriter(new OutputStreamWriter(
                    new FileOutputStream(Config.PKCS12_PASSWORD_DIR), "utf-8"));
            writer.write(clave);
        } catch (IOException ex) {
            respuesta = "{\"status\":\"fail\", \"error\":\"" + ex.getMessage().replace("\"", "") + "\"}";
        } finally {
            try {
                writer.close();
            } catch (Exception ex) {
                respuesta = "{\"status\":\"fail\", \"error\":\"" + ex.getMessage().replace("\"", "") + "\"}";
            }
        }
        return respuesta;
    }

    public String changeSignature(byte[] firma) {
        String respuesta = "{\"status\":\"OK\"}";
        FileOutputStream fos;
        try {
            fos = new FileOutputStream(Config.PKCS12_RESOURCE);
            BufferedOutputStream outputStream = new BufferedOutputStream(fos);
            outputStream.write(firma);
            outputStream.close();
        } catch (FileNotFoundException e) {
            respuesta = "{\"status\":\"fail\", \"error\":\"" + e.getMessage().replace("\"", "") + "\"}";
            e.printStackTrace();
        } catch (IOException e) {
            respuesta = "{\"status\":\"fail\", \"error\":\"" + e.getMessage().replace("\"", "") + "\"}";
            e.printStackTrace();
        }
        return respuesta;
    }

    
   
    /**/
    public String sendDoc(String claveAcceso, String email, String name) {
        String respuesta = "{\"status\":\"OK\", \"emailed\":\"NO\"}";
        File xml_file = new File(Config.AUTORIZADOS_DIR + claveAcceso + ".xml");
        File pdf_file = new File(Config.AUTORIZADOS_DIR  + claveAcceso + ".pdf");
        if (xml_file.exists() && pdf_file.exists()) {
           // if (Mailgun.send(email, "", name, "COMPROBANTE ELECTRONICO", xml_file, pdf_file, true)) {
             SendMail mail = new SendMail();
            try {
                if (mail.send(email, "", name, "COMPROBANTE ELECTRONICO", xml_file, pdf_file)) {
                    
                    respuesta = "{\"status\":\"OK\", \"emailed\":\"SI\"}";
                } else {
                    respuesta = "{\"status\":\"OK\", \"emailed\":\"NO\"}";
                }
            } catch (UnsupportedEncodingException ex) {
                Logger.getLogger(Comprobante.class.getName()).log(Level.SEVERE, null, ex);
            } catch (MessagingException ex) {
                Logger.getLogger(Comprobante.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            respuesta = "{\"status\":\"fail\", \"error\":\"Comprobante no encontrado\"}";
        }
        return respuesta;
    }

    /**
     * /
     * public String sendDoc(String claveAcceso, String email, String name){
     * String respuesta = "{\"status\":\"OK\"}"; File xml_file = new
     * File(Config.AUTORIZADOS_DIR+claveAcceso+".xml"); File pdf_file = new
     * File(Config.AUTORIZADOS_DIR+claveAcceso+".pdf"); if (xml_file.exists() &&
     * pdf_file.exists()){ try { byte[] xml_bytes =
     * ArchivoUtil.convertirArchivoAByteArray(xml_file);
     *
     * FileAttachment xml = new FileAttachment(); xml.setData(xml_bytes);
     * xml.setFileName(claveAcceso+".xml"); xml.setContentType("text/xml");
     *
     * byte[] pdf_bytes = ArchivoUtil.convertirArchivoAByteArray(pdf_file);
     *
     * FileAttachment pdf = new FileAttachment(); pdf.setData(pdf_bytes);
     * pdf.setFileName(claveAcceso+".pdf");
     * pdf.setContentType("application/pdf");
     *
     * AmazonSES sendMail = new AmazonSES(); //SendMail sendMail = new
     * SendMail(); if (sendMail.send(email, "", name, "COMPROBANTE ELECTRONICO",
     * xml, pdf)){ respuesta = "{\"status\":\"OK\", \"emailed\":\"SI\"}"; }else{
     * respuesta = "{\"status\":\"OK\", \"emailed\":\"NO\"}"; } } catch
     * (IOException e) { respuesta = "{\"status\":\"fail\",
     * \"error\":\""+e.getMessage()+"\"}"; } catch (MessagingException e) {
     * respuesta = "{\"status\":\"fail\", \"error\":\""+e.getMessage()+"\"}"; }
     * }else{ respuesta = "{\"status\":\"fail\", \"error\":\"Comprobante no
     * encontrado\"}"; } return respuesta; } /*
     */
    public String validate(String claveAcceso) {
        CertificadosSSL.instalarCertificados();
        String respuesta = "{\"status\":\"fail\", \"error\":\"UNKNOW\"}";
        // LEER EL XML
        File xml_file = new File(Config.AUTORIZADOS_DIR  + claveAcceso + ".xml");
        if (xml_file.exists()) {
            respuesta = "{\"status\":\"OK\", \"emailed\":\"NO\"}";
        } else {
            xml_file = new File(Config.NO_AUTORIZADOS_DIR + claveAcceso + ".xml");
            if (xml_file.exists()) {
                try {
                    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
                    DocumentBuilder db;
                    db = dbf.newDocumentBuilder();
                    Document doc = db.parse(xml_file);
                    doc.getDocumentElement().normalize();

                    NodeList autorizacionTag = doc.getElementsByTagName("autorizacion");
                    Element autorizacion = (Element) autorizacionTag.item(0);
                    Element autorizacionElements = (Element) autorizacion;

                    NodeList mensajesTag = autorizacionElements.getElementsByTagName("mensajes");
                    Element mensajes = (Element) mensajesTag.item(0);
                    Element mensajesElements = (Element) mensajes;
                    NodeList mensajeTags = mensajesElements.getElementsByTagName("mensaje");
                    String error = "";
                    for (int i = 0; i < mensajeTags.getLength(); i++) {
                        Node mensaje = mensajeTags.item(i);
                        if (mensaje.getNodeType() == Node.ELEMENT_NODE) {
                            Element mensajeElement = (Element) mensaje;

                            NodeList mensajeErrorTag = mensajeElement.getElementsByTagName("mensaje");
                            if (mensajeErrorTag.getLength() > 0) {
                                Element mensajeErrorElement = (Element) mensajeErrorTag.item(0);
                                NodeList mensajeError = mensajeErrorElement.getChildNodes();
                                String mensajeError_str = ((Node) mensajeError.item(0)).getNodeValue();

                                NodeList informacionTag = mensajeElement.getElementsByTagName("informacionAdicional");
                                Element informacionElement = (Element) informacionTag.item(0);
                                NodeList informacion = informacionElement.getChildNodes();
                                String info = ((Node) informacion.item(0)).getNodeValue();

                                error += mensajeError_str.replace("\"", "") + ": " + info.replace("\"", "") + " | ";
                            }
                        }
                    }
                    if (error.length() > 3) {
                        error = error.substring(0, error.length() - 3);
                    }
                    error = error.replace("--- Inventario de errores ---", "").replace("\t", " ").replace("\n", "");
                    respuesta = "{\"status\":\"fail\", \"error\":\"" + error + "\"}";
                } catch (ParserConfigurationException e) {
                    respuesta = "{\"status\":\"fail\", \"error\":\"" + e.getMessage().replace("\"", "") + "\"}";
                    e.printStackTrace();
                } catch (SAXException e) {
                    respuesta = "{\"status\":\"fail\", \"error\":\"" + e.getMessage().replace("\"", "") + "\"}";
                    e.printStackTrace();
                } catch (IOException e) {
                    respuesta = "{\"status\":\"fail\", \"error\":\"" + e.getMessage().replace("\"", "") + "\"}";
                    e.printStackTrace();
                }
            } else {
                try {
                    ////jc// LEER EL XML
                    xml_file = new File(Config.FIRMADOS_DIR  + claveAcceso + ".xml");
                    System.out.println("leeerxml:  " + Config.FIRMADOS_DIR  + claveAcceso + ".xml");
                    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
                    DocumentBuilder db = dbf.newDocumentBuilder();
                    Document doc = db.parse(xml_file);
                    doc.getDocumentElement().normalize();

                    NodeList firstTag = doc.getElementsByTagName(doc.getDocumentElement().getNodeName());
                    Element firstElement = (Element) firstTag.item(0);
                    Element firstElements = (Element) firstElement;

                    NodeList infoTributariaTag = firstElements.getElementsByTagName("infoTributaria");
                    Element infoTributariaElement = (Element) infoTributariaTag.item(0);
                    Element infoTributariaElements = (Element) infoTributariaElement;

                    NodeList ambienteTag = infoTributariaElements.getElementsByTagName("ambiente");
                    Element ambienteElement = (Element) ambienteTag.item(0);
                    NodeList ambiente = ambienteElement.getChildNodes();
                    String ambienteValue = ((Node) ambiente.item(0)).getNodeValue();
                    // ESTABLECER SI SE VA A PRUEBAS O A PRODUCCION
                    String AUTORIZACION_WSDL;
                    if (ambienteValue.equals("1")) {
                        AUTORIZACION_WSDL = Config.AUTORIZACION_WSDL_PRUEBAS;
                    } else {
                        AUTORIZACION_WSDL = Config.AUTORIZACION_WSDL_PRODUCCION;
                    }

                    boolean is_autorize = false;
                    String nroAuth = "";
                    Date fechaAuth = null;
                    String fecha = "";
                    // Authorize document
                    ///////jcjc
                    AutorizacionComprobantesWs auto;
                    auto = new AutorizacionComprobantesWs(AUTORIZACION_WSDL);
                  List<Autorizacion> listaAutorizaciones = auto.autorizarComprobante(claveAcceso, Config.AUTORIZADOS_DIR + claveAcceso + ".xml", Config.NO_AUTORIZADOS_DIR + claveAcceso + ".xml");
                    if (listaAutorizaciones.isEmpty()) {
                        respuesta = "{\"status\":\"fail\", \"error\":\"DOCUMENTO AUN NO AUTORIZADO\"}";
                    } else {
                        for (Autorizacion autorizacion : listaAutorizaciones) {
                            String estado = autorizacion.getEstado();
                            if (estado.toUpperCase().compareTo("AUTORIZADO") == 0) {
                                is_autorize = true;
                                nroAuth = autorizacion.getNumeroAutorizacion();
                                fechaAuth = autorizacion.getFechaAutorizacion().toGregorianCalendar().getTime();
                            }
                        }
                        if (is_autorize) {
                            fecha = (1900 + fechaAuth.getYear()) + "-" + pad(String.valueOf(fechaAuth.getMonth() + 1), 2) + "-" + pad(String.valueOf(fechaAuth.getDate()), 2) + " " + fechaAuth.getHours() + ":" + fechaAuth.getMinutes() + ":" + fechaAuth.getSeconds();
                            boolean hasEmail = false;
                            String email = "";
                            String cc = "";
                            String name = "";
                            String asunto = "";
                            File pdf_file = new File(Config.AUTORIZADOS_DIR  + claveAcceso + ".pdf");

                            ReadXML reader = new ReadXML();
                            if (doc.getDocumentElement().getNodeName().equals("factura")) {
                                Factura factura;
                                factura = reader.readFactura(doc);
                                factura.setNroAutorizacion(nroAuth);
                                factura.setFechaAutorizacion(fecha);
                                if (!pdf_file.exists()) {
                                    ecx.unomas.pdf.Factura factura_pdf = new ecx.unomas.pdf.Factura();
                                    factura_pdf.generatePDF(factura, null);
                                }
                                if (factura.hasEmail()) {
                                    hasEmail = true;
                                    email = factura.getInfoAdicionalEmail();
                                    cc = factura.getInfoAdicionalEmailCC();
                                    name = factura.getRazonSocialComprador();
                                    asunto = "FACTURA ELECTRONICA VERIFICADA";
                                }
                            } else if (doc.getDocumentElement().getNodeName().equals("notaDebito")) {
                                NotaDebito notaDebito = reader.readNotaDebito(doc);
                                notaDebito.setAuthNumber(nroAuth);
                                notaDebito.setAuthDate(fecha);
                                if (!pdf_file.exists()) {
                                    ecx.unomas.pdf.NotaDebito notaDebito_pdf = new ecx.unomas.pdf.NotaDebito();
                                    notaDebito_pdf.generatePDF(notaDebito, null);
                                }
                                if (notaDebito.hasEmail()) {
                                    hasEmail = true;
                                    email = notaDebito.getInfoAdicionalEmail();
                                    cc = notaDebito.getInfoAdicionalEmailCC();
                                    name = notaDebito.getRazonSocialComprador();
                                    asunto = "NOTA DE DEBITO VERIFICADA";
                                }
                            } else if (doc.getDocumentElement().getNodeName().equals("notaCredito")) {
                                NotaCredito notaCredito = reader.readNotaCredito(doc);
                                notaCredito.setAuthNumber(nroAuth);
                                notaCredito.setAuthDate(fecha);
                                if (!pdf_file.exists()) {
                                    ecx.unomas.pdf.NotaCredito notaCredito_pdf = new ecx.unomas.pdf.NotaCredito();
                                    notaCredito_pdf.generatePDF(notaCredito, null);
                                }
                                if (notaCredito.hasEmail()) {
                                    hasEmail = true;
                                    email = notaCredito.getInfoAdicionalEmail();
                                    cc = notaCredito.getInfoAdicionalEmailCC();
                                    name = notaCredito.getRazonSocialComprador();
                                    asunto = "NOTA DE CREDITO VERIFICADA";
                                }
                            } else if (doc.getDocumentElement().getNodeName().equals("guiaRemision")) {
                                GuiaRemision guiaRemision = reader.readGuiaRemision(doc);
                                guiaRemision.setAuthNumber(nroAuth);
                                guiaRemision.setAuthDate(fecha);
                                if (!pdf_file.exists()) {
                                    ecx.unomas.pdf.GuiaRemision guiaRemision_pdf = new ecx.unomas.pdf.GuiaRemision();
                                    guiaRemision_pdf.generatePDF(guiaRemision, null);
                                }
                                if (guiaRemision.hasEmail()) {
                                    hasEmail = true;
                                    email = guiaRemision.getInfoAdicionalEmail();
                                    cc = guiaRemision.getInfoAdicionalEmailCC();
                                    name = guiaRemision.getRazonSocialTransportista();
                                    asunto = "GUIA DE REMISION VERIFICADA";
                                }
                            } else if (doc.getDocumentElement().getNodeName().equals("comprobanteRetencion")) {
                                Retencion retencion = reader.readRetencion(doc);
                                retencion.setAuthNumber(nroAuth);
                                retencion.setAuthDate(fecha);
                                if (!pdf_file.exists()) {
                                    ecx.unomas.pdf.Retencion retencion_pdf = new ecx.unomas.pdf.Retencion();
                                    retencion_pdf.generatePDF(retencion, null);
                                }
                                if (retencion.hasEmail()) {
                                    hasEmail = true;
                                    email = retencion.getInfoAdicionalEmail();
                                    cc = retencion.getInfoAdicionalEmailCC();
                                    name = retencion.getRazonSocialSujetoRetenido();
                                    asunto = "RETENCION VERIFICADA";
                                }
                            }
                            // ENVIAR AL CLIENTE EL COMPROBANTE AUTORIZADO
                            if (hasEmail) {
                                if (!pdf_file.exists()) {
                                    pdf_file = new File(Config.AUTORIZADOS_DIR  + claveAcceso + ".pdf");
                                }
                               // if (Mailgun.send(email, cc, name, asunto, xml_file, pdf_file, true)) {
                                 SendMail mail = new SendMail();
                                if (mail.send(email, cc, name, asunto, xml_file, pdf_file)) {
                          
                                    respuesta = "{\"status\":\"OK\", \"emailed\":\"SI\"}";
                                } else {
                                    respuesta = "{\"status\":\"OK\", \"emailed\":\"NO\"}";
                                }
                            } else {
                                respuesta = "{\"status\":\"OK\", \"emailed\":\"NO\"}";
                            }
                        } else {
                            String error = "";
                            for (Autorizacion autorizacion : listaAutorizaciones) {
                                String estado = autorizacion.getEstado();
                                if (estado.toUpperCase().compareTo("NO AUTORIZADO") == 0) {
                                    List<ec.gob.sri.comprobantes.ws.aut.Mensaje> mensajes = autorizacion.getMensajes().getMensaje();
                                    for (ec.gob.sri.comprobantes.ws.aut.Mensaje mensaje : mensajes) {
                                        error += mensaje.getMensaje().replace("\"", "") + ":" + mensaje.getInformacionAdicional().replace("\"", "") + " | ";
                                    }
                                }
                            }
                            if (error.length() > 0) {
                                error = error.substring(0, error.length() - 3);
                            }
                            error = error.replace("--- Inventario de errores ---", "").replace("\t", " ").replace("\n", "");
                            respuesta = "{\"status\":\"fail\", \"error\":\"" + error + "\"}";
                        }
                    }
                } catch (MalformedURLException e) {
                    respuesta = "{\"status\":\"fail\", \"error\":\"" + e.getMessage().replace("\"", "") + "\"}";
                    e.printStackTrace();
                } catch (FileNotFoundException e) {
                    respuesta = "{\"status\":\"fail\", \"error\":\"" + e.getMessage().replace("\"", "") + "\"}";
                    e.printStackTrace();
                } catch (Exception e) {
                    respuesta = "{\"status\":\"fail\", \"error\":\"" + e.getMessage().replace("\"", "") + "\"}";
                    e.printStackTrace();
                }
            }
        }
        return respuesta;
    }

    private String pad(String number, int len) {
        String str = "" + number;
        while (str.length() < len) {
            str = '0' + str;
        }
        return str;
    }

}
