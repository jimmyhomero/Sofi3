package ecx.unomas.elements;

import Vista.Principal;
import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.WebServiceException;
import ec.gob.sri.comprobantes.ws.RecepcionComprobantesOfflineService;
import javafx.scene.control.ProgressBar;

public class CheckConnection {
	
	public static Object getWebService(String wsdlLocation) {
	    try {
	        QName qname = new QName("http://ec.gob.sri.ws.recepcion", "RecepcionComprobantesOfflineService");
	        URL url = new URL(wsdlLocation);
	        RecepcionComprobantesOfflineService service = new RecepcionComprobantesOfflineService(url, qname);
	        return null;
	    } catch (MalformedURLException ex) {
	        return ex;
	    } catch (WebServiceException ws) {
	        return ws;
	    }
	}
	
	public static boolean existeConexion(String url) {
	    int i = 0;
	    boolean respuesta = false;
	    while (i < 3) {
	        Object obj = getWebService(url);
	        if (obj  == null) {
	            return true;
	        }
	        if ((obj  instanceof WebServiceException)) {
	            respuesta = false;
	        }
	        i++;
	    }
            if(respuesta=false){
                Vlidaciones.ProgressBar.mostrarMensajeRojo("NO EXISTE CONECCION CON EL SERVICO DE RENTAS INTERNAS (SRI)");
                
            }
            
            Principal.existeConeccionSRI=respuesta;
	    return respuesta;
	}
}
