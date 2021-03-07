package ecx.unomas.elements;

import ec.gob.sri.comprobantes.ws.Comprobante;
import ec.gob.sri.comprobantes.ws.RecepcionComprobantesOffline;
import ec.gob.sri.comprobantes.ws.RecepcionComprobantesOfflineService;
import ec.gob.sri.comprobantes.ws.RespuestaSolicitud;
import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import ClasesAuxiliares.debug.Deb;

public class EnvioComprobantesWs {

    private static RecepcionComprobantesOfflineService service;

    public EnvioComprobantesWs(String wsdlLocation) throws MalformedURLException {
        URL url = new URL(wsdlLocation);
        QName qname = new QName("http://ec.gob.sri.ws.recepcion", "RecepcionComprobantesOfflineService");
        service = new RecepcionComprobantesOfflineService(url, qname);
    }

    public RespuestaSolicitud enviarComprobante(File xmlFile) throws Throwable {
        RespuestaSolicitud response = null;
        try {
            RecepcionComprobantesOffline port = service.getRecepcionComprobantesOfflinePort();
            byte[] archivoBytes = ArchivoUtil.convertirArchivoAByteArray(xmlFile);
            if (archivoBytes != null) {
                response = port.validarComprobante(archivoBytes);
                Deb.consola("Msaje del SRI : "+response.getEstado());
               // Comprobante a = new Comprobante();
                for(Comprobante a : response.getComprobantes().getComprobante()){
                  Deb.consola("Clave de Acceso: "+a.getClaveAcceso());
                Deb.consola("Mensajes SRi: "+a.getMensajes().getMensaje().get(0).getMensaje());
                Deb.consola("Mensajes SRi: "+a.getMensajes().getMensaje().get(0).getIdentificador());
                Deb.consola("Mensajes SRi: "+a.getMensajes().getMensaje().get(0).getTipo());
                Deb.consola("Mensajes SRi: "+a.getMensajes().getMensaje().get(0).getInformacionAdicional());
                //Deb.consola("Mensajes msg1: "+a.getMensajes().getMensaje().get(1));
                //Deb.consola("Mensajes msg 2: "+a.getMensajes().getMensaje().get(3));
                    
                Deb.consola("Msaje del SRI : "+response.getComprobantes().getComprobante().toString());
                Deb.consola("Msaje del SRI : "+response.getEstado());
                }
              
              
            } else {
                throw new Throwable("El archivo es nulo o vacio.");
            }
        } catch (Exception e) {
            throw e;
        }
        return response;
    }
}
