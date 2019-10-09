/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login;

import ClasesAuxiliares.Variables;
import Controlador.Usuarios.FacturasDao;
import Modelo.Facturas;
import Vista.Usuarios.Buscar_electronicas;
import com.sun.glass.events.KeyEvent;
import com.ws.electro.cliente.Response;
import com.ws.electro.cliente.WSElectro_Service;
import java.awt.AWTException;
import java.awt.Robot;
import java.io.IOException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;
import org.xml.sax.SAXException;

/**
 *
 * @author USUARIO
 */
public class Main {

    public static boolean iniciarfacturacioELectronica = false;
    public static boolean estaenviandofacturasactuamentealws = false;
    public static String s ="<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n" +
"<factura id=\"comprobante\" version=\"1.0.0\">\n" +
"    <infoTributaria>\n" +
"        <ambiente>2</ambiente>\n" +
"        <tipoEmision>1</tipoEmision>\n" +
"        <razonSocial>LEON GANDARA DANIEL ARTURO</razonSocial>\n" +
"        <nombreComercial>GRANJA SANTA CATALINA</nombreComercial>\n" +
"        <ruc>1704889987001</ruc>\n" +
"        <claveAcceso>2312201801170488998700120010010000000031234567818</claveAcceso>\n" +
"        <codDoc>01</codDoc>\n" +
"        <estab>001</estab>\n" +
"        <ptoEmi>001</ptoEmi>\n" +
"        <secuencial>000000003</secuencial>\n" +
"        <dirMatriz>KM3 VIA VILLEGAS MARGEN DERECHO</dirMatriz>\n" +
"    </infoTributaria>\n" +
"    <infoFactura>\n" +
"        <fechaEmision>23/12/2018</fechaEmision>\n" +
"        <dirEstablecimiento>KM3 VIA VILLEGAS MARGEN DERECHO</dirEstablecimiento>\n" +
"        <obligadoContabilidad>SI</obligadoContabilidad>\n" +
"        <tipoIdentificacionComprador>04</tipoIdentificacionComprador>\n" +
"        <razonSocialComprador>SAN DANIEL CIA. LTDA.</razonSocialComprador>\n" +
"        <identificacionComprador>1791413032001</identificacionComprador>\n" +
"        <direccionComprador>VIA MONTERREY KM 5, LA CONCORDIA </direccionComprador>\n" +
"        <totalSinImpuestos>242.06</totalSinImpuestos>\n" +
"        <totalDescuento>0.00</totalDescuento>\n" +
"        <totalConImpuestos>\n" +
"            <totalImpuesto>\n" +
"                <codigo>2</codigo>\n" +
"                <codigoPorcentaje>0</codigoPorcentaje>\n" +
"                <baseImponible>242.06</baseImponible>\n" +
"                <tarifa>0</tarifa>\n" +
"                <valor>0.00</valor>\n" +
"            </totalImpuesto>\n" +
"        </totalConImpuestos>\n" +
"        <propina>0.00</propina>\n" +
"        <importeTotal>242.06</importeTotal>\n" +
"        <moneda>DOLAR</moneda>\n" +
"        <pagos>\n" +
"            <pago>\n" +
"                <formaPago>01</formaPago>\n" +
"                <total>242.06</total>\n" +
"            </pago>\n" +
"        </pagos>\n" +
"    </infoFactura>\n" +
"    <detalles>\n" +
"        <detalle>\n" +
"            <codigoPrincipal>fruta</codigoPrincipal>\n" +
"            <codigoAuxiliar>FRUTAPALMA</codigoAuxiliar>\n" +
"            <descripcion>TONELADAS FRUTA DE PALMA</descripcion>\n" +
"            <cantidad>2.47</cantidad>\n" +
"            <precioUnitario>98</precioUnitario>\n" +
"            <descuento>0</descuento>\n" +
"            <precioTotalSinImpuesto>242.06</precioTotalSinImpuesto>\n" +
"            <impuestos>\n" +
"                <impuesto>\n" +
"                    <codigo>2</codigo>\n" +
"                    <codigoPorcentaje>0</codigoPorcentaje>\n" +
"                    <tarifa>0</tarifa>\n" +
"                    <baseImponible>242.06</baseImponible>\n" +
"                    <valor>0.00</valor>\n" +
"                </impuesto>\n" +
"            </impuestos>\n" +
"        </detalle>\n" +
"    </detalles>\n" +
"    <infoAdicional>\n" +
"        <campoAdicional nombre=\"DirecciÃ³n\">VIA MONTERREY KM 5, LA CONCORDIA </campoAdicional>\n" +
"        <campoAdicional nombre=\"TelÃ©fono\">062749185</campoAdicional>\n" +
"        <campoAdicional nombre=\"Email\">homer_loading@hotmail.com</campoAdicional>\n" +
"    </infoAdicional>\n" +
"</factura>";

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws InterruptedException {
        try {
//            FacturasDao d = new FacturasDao();
//            String a = d.xmltoStringFormat(s);
//            WSElectro_Service Ws = new WSElectro_Service();
//            Response rc = new Response();
//            JOptionPane.showMessageDialog(null, rc = Ws.getWSElectroPort().receiptXMLIn(a, "admin", "admin", ""));
            // TODO code application logic here
            new login().setVisible(true);
            Robot r;
            //  r.createScreenCapture(screenRect)
            try {
                Thread.sleep(25);
                r = new Robot();
                r.keyPress(KeyEvent.VK_TAB);
                Thread.sleep(20);
                r.keyPress(KeyEvent.VK_TAB);
                Thread.sleep(20);
                r.keyPress(KeyEvent.VK_TAB);
                Thread.sleep(20);
                r.keyPress(KeyEvent.VK_ENTER);
                Thread.sleep(20);
                r.keyRelease(KeyEvent.VK_ENTER);
                Thread.sleep(20);
                System.out.println("login.Main.main() ---->>>>>>  inciando eentronica");
                Thread.sleep(2000);

                System.out.println("INICIO DEMONIO FACTURACION ELECTRONICA.............");
                Variables.FE_ESTADO1 = "ESTADO FACTURACION ELECTRONICA DESACTIVADO";
////                while (iniciarfacturacioELectronica) {
////                    Variables.FE_ESTADO1 = "ESTADO FACTURACION ELECTRONICA ACTVIVO";
////                    System.out.println("factura electronica iniciada");
////
////                    if (estaenviandofacturasactuamentealws) {
////
////                        Variables.FE_ESTADO2 = "ENVIANDO ACTUALEMNTE DOCUMENTOS AL SRI";
////                        System.out.println("EnviandoActualmeten siiiii");
////                        FacturasDao fac1 = new FacturasDao();
////                        for (Facturas ff : fac1.buscarFacturasNoAutorizadas()) {
////                            FacturasDao fac101 = new FacturasDao();
////                            fac101.creaxmlFacturaElectronica(ff);
////                            Variables.FE_ESTADO3 = "ENVIADNDO " + ff.getTipo_documento() + " " + ff.getSecuencia();
////                            Thread.sleep(1000);
////
////                        }
////
////                        Thread.sleep(5000);
////                        FacturasDao fac2 = new FacturasDao();
////                        for (Facturas ff : fac2.ListaFacturasEnviadasalWS_SinEstadoAutorizado()) {
////                            FacturasDao fac201 = new FacturasDao();
////                            fac201.cabiaestadoFacturasDeEnviadastoAutorizadasEtado2(ff);
////                            Variables.FE_ESTADO3 = "RECIBIENDO " + ff.getTipo_documento() + " " + ff.getSecuencia();
////                            Thread.sleep(1000);
////                        }
////                    } else {
////                        Variables.FE_ESTADO2 = "DETENIDO  ACTUALEMNTE EL ENVIO DE DOCUMENTOS AL SRI";
////                    }
////                    Thread.sleep(2000);
////                }
////                System.out.println("login.Main.main()xxxxxxxxxxxxxxxxxxxxxxxxxx facturacion main ");

            } catch (AWTException ex) {
                Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
            }

        } catch (ParseException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
