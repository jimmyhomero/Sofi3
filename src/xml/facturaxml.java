/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package xml;

import java.io.FileNotFoundException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;
import org.jespxml.JespXML;
import org.jespxml.modelo.Atributo;
import org.jespxml.modelo.Tag;

/**
 *
 * @author USUARIO
 */
public class facturaxml {

    public void Newfacturaxml() {

        Tag factura = new Tag("factura");
        Atributo a = new Atributo("id", "comprobante");
        Atributo b = new Atributo("version", "1.0.0");
        factura.addAtributo(a);
        factura.addAtributo(b);

        Tag infoTributaria = new Tag("infoTributaria");
        Tag ambiente = new Tag("ambiente");
        ambiente.addContenido("1");
        infoTributaria.addTagHijo(ambiente);
        ////-----****-----
        Tag tipoEmision = new Tag("tipoEmision");
        tipoEmision.addContenido("1");
        infoTributaria.addTagHijo(tipoEmision);
        ////-----****-----
        Tag razonSocial = new Tag("razonSocial");
        razonSocial.addContenido("JImmy Carrion");
        infoTributaria.addTagHijo(razonSocial);
        ////-----****-----
        Tag nombreComercial = new Tag("nombreComercial");
        nombreComercial.addContenido("compueconomia");
        infoTributaria.addTagHijo(nombreComercial);
        ////-----****-----
        Tag ruc = new Tag("ruc");
        ruc.addContenido("1722239967001");
        infoTributaria.addTagHijo(ruc);
        factura.addTagHijo(infoTributaria);
        try {
            try {
                JespXML.escribirXML(factura, "D:\\comprobantes\\generados\\facd.xml");
            } catch (FileNotFoundException | TransformerException ex) {
                Logger.getLogger(facturaxml.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ParserConfigurationException ex) {
     
    }
}
}
