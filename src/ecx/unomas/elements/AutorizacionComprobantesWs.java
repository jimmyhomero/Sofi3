package ecx.unomas.elements;

import ec.gob.sri.comprobantes.ws.aut.Autorizacion;
import ec.gob.sri.comprobantes.ws.aut.AutorizacionComprobantesOffline;
import ec.gob.sri.comprobantes.ws.aut.AutorizacionComprobantesOfflineService;
import ec.gob.sri.comprobantes.ws.aut.Mensaje;
import ec.gob.sri.comprobantes.ws.aut.RespuestaComprobante;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.Writer;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import ClasesAuxiliares.debug.Deb;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.Marshaller;
import javax.xml.namespace.QName;

public class AutorizacionComprobantesWs {

    private AutorizacionComprobantesOfflineService service;

    public AutorizacionComprobantesWs(String wsdlLocation) throws MalformedURLException {
        
        URL url = new URL(wsdlLocation);
        QName qname = new QName("http://ec.gob.sri.ws.autorizacion", "AutorizacionComprobantesOfflineService");
        service = new AutorizacionComprobantesOfflineService(url, qname);
    }

    public List<Autorizacion> autorizarComprobante(String claveDeAcceso, String nombreArchivo, String nombreArchivoNA) throws FileNotFoundException, Exception {
    	List<Autorizacion> listaAutorizaciones = null;
        try {
            RespuestaComprobante respuesta = null;
            AutorizacionComprobantesOffline port = service.getAutorizacionComprobantesOfflinePort();
            respuesta = port.autorizacionComprobante(claveDeAcceso);
            if (respuesta != null) {
            	listaAutorizaciones = respuesta.getAutorizaciones().getAutorizacion();
            	if (listaAutorizaciones.isEmpty()) {
                    Deb.consola("No autorizado, lista vacia.");
                } else {
                    for (Autorizacion autorizacion : listaAutorizaciones) {
                        String estado = autorizacion.getEstado();
                        if (estado.toUpperCase().compareTo("AUTORIZADO") == 0) {
                            autorizacion.setComprobante((new StringBuilder()).append("<![CDATA[").append(autorizacion.getComprobante()).append("]]>").toString());
                            JAXBContext jc = JAXBContext.newInstance(Autorizacion.class);
                            Marshaller marshaller = jc.createMarshaller();
                            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
                            marshaller.setProperty(Marshaller.JAXB_FRAGMENT, Boolean.TRUE);
                            Writer writer = new FileWriter(nombreArchivo);
                            writer.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                            marshaller.marshal(new JAXBElement<Autorizacion>(new QName("autorizacion"), Autorizacion.class, autorizacion), writer);
                            writer.close();
                        } else {
                            //Guadar comprobante no autorizado
                            List<Mensaje> mensajes = autorizacion.getMensajes().getMensaje();
                            if (mensajes.isEmpty()) {
                                Deb.consola("No autorizado, error interno.");
                            } else {
                                autorizacion.setComprobante((new StringBuilder()).append("<![CDATA[").append(autorizacion.getComprobante()).append("]]>").toString());
                                JAXBContext jc = JAXBContext.newInstance(Autorizacion.class);
                                Marshaller marshaller = jc.createMarshaller();
                                marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
                                marshaller.setProperty(Marshaller.JAXB_FRAGMENT, Boolean.TRUE);
                                Writer writer = new FileWriter(nombreArchivoNA);
                                writer.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                                marshaller.marshal(new JAXBElement<Autorizacion>(new QName("autorizacion"), Autorizacion.class, autorizacion), writer);
                                writer.close();
                            }
                        }
                    }
                }
            } else if (respuesta == null || respuesta.getAutorizaciones().getAutorizacion().isEmpty()) {
                Deb.consola("No autorizado, error interno.");
            }
        } catch (java.io.FileNotFoundException ex) {
            throw ex;
        } catch (Exception ex) {
            throw ex;
        }
        return listaAutorizaciones;
    }
    public String getAComprobanteAutorizado(String claveDeAcceso) throws FileNotFoundException, Exception {
        List<Autorizacion> listaAutorizaciones = null;
        String aut = null;
        try {
            RespuestaComprobante respuesta = null;
            AutorizacionComprobantesOffline port = service.getAutorizacionComprobantesOfflinePort();
            respuesta = port.autorizacionComprobante(claveDeAcceso);
            if (respuesta != null) {
                listaAutorizaciones = respuesta.getAutorizaciones().getAutorizacion();
                if (listaAutorizaciones.isEmpty()) {
                    Deb.consola("No autorizado, lista vacia.");
                    return "ERROR CONECCION SRI";                                        
                } else {
                    for (Autorizacion autorizacion : listaAutorizaciones) {
                        String estado = autorizacion.getEstado();
                        if (estado.toUpperCase().compareTo("AUTORIZADO") == 0) {
                            aut = autorizacion.getComprobante();
                        } else {
                            aut="NA";
                        }
                    }
                }
            } else if (respuesta == null || respuesta.getAutorizaciones().getAutorizacion().isEmpty()) {
                Deb.consola("No autorizado, error interno.");
            }
        } catch (Exception ex) {

            Deb.consola("ec.unomas.elements.AutorizacionComprobantesWs.getAComprobanteAutorizado(): " + ex);
        }
        return aut;
    }
}