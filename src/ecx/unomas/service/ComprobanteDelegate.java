package ecx.unomas.service;

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


@javax.jws.WebService (targetNamespace="http://service.unomas.ec/", serviceName="ComprobanteService", portName="ComprobantePort", wsdlLocation="WEB-INF/wsdl/ComprobanteService.wsdl")
public class ComprobanteDelegate{

    ecx.unomas.service.Comprobante _comprobante = null;

    public String upload(String claveAcceso, byte[] xmlBytes) {
        return _comprobante.upload(claveAcceso,xmlBytes);
    }

    public byte[] download(String claveAcceso, String ext) {
        return _comprobante.download(claveAcceso,ext);
    }

    public String changeKey(String clave) {
        return _comprobante.changeKey(clave);
    }

    public String changeSignature(byte[] firma) {
        return _comprobante.changeSignature(firma);
    }

    public String sendDoc(String claveAcceso, String email, String name) {
        return _comprobante.sendDoc(claveAcceso,email,name);
    }

    public String validate(String claveAcceso) {
        return _comprobante.validate(claveAcceso);
    }

    public ComprobanteDelegate() {
        _comprobante = new ecx.unomas.service.Comprobante(); }

}