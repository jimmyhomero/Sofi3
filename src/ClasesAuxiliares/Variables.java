/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares;

import Controlador.Ejemplo;
import login.login;
//import sun.util.logging.resources.logging;
import java.io.File;
import static java.lang.System.exit;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author USUARIO
 */
public class Variables {

    /**
     * VARIABLES FACTURACION ELECTRONICA
     */
    public static String user = "";
    public static String pass = "";
    public static String nombre = "";
    public static Integer ok = 0;
    public static String FE_TIPO_AMBIENTE = "1";//PREUBAS 1, PRIDUCCION2
    public static String FE_FACTURA = "01";
    public static String FE_NOTA_CREDITO = "04";
    public static String FE_NOTA_DEBITO = "05";
    public static String FE_GUIA_REMISION = "06";
    public static String FE_RETENCION = "07";
    public static String FE_TIPO_EMISION = "1";
    public static String FE_TIPO_IDENTIFICACION_RUC = "04";
    public static String FE_TIPO_IDENTIFICACION_CEDULA = "05";
    public static String FE_TIPO_IDENTIFICACION_PASAPORTE = "06";
    public static String FE_TIPO_IDENTIFICACION_CONSUMIDOR_FINAL = "07";
    public static String FE_TIPO_IDENTIFICACION_IDENTIFICACION_DEL_EXTERIOR = "08";
    public static String FE_TIPO_IDENTIFICACION_CONSUMIDOR_PLACA = "09";
    public static String FE_CODIGO_NUMERICO = "00187941";
    public static String FE_DIGITO_VERIFICADOR = "";
    public static String FE_OBLIGADO_CONTABILIDAD = "SI";
    public static String FE_ACTIVO = "NO";

        /**
     *VARIABLES DE ESTADO FACTURACION ELECTRONICA
     * 
     */
public static String FE_ESTADO1 = " ";
public static String FE_ESTADO2 = "";
public static String FE_ESTADO3 = "";
    
    /**
     * FIN VARIABLES DIRECTAS DEL SISTEMA
     */
    public static String CAJA_TIPO_INGRESO = "INGRESO ";
    public static String CAJA_TIPO_INGRESO_CXC = "INGRESO CXC";
    public static String CAJA_TIPO_EGRESO = "EGRESO ";
    public static String CAJA_INGRESO_FACTURA = "INGRESO POR FACURA ";
    public static String CAJA_INGRESO_TICKET = "INGRESO POR TICKET ";
    public static String CAJA_INGRESO_TRASLADO_CAJA = "INGRESO POR TRASLADO DE GAJA ";
    public static String CAJA_INGRESO_MANUAL = "INGRESO MANUAL DE CAJA ";

    public static String CAJA_EGRESO_FACTURA_ANULADA = " EGRESO POR FACURA ANULADA ";
    public static String CAJA_EGRESO_TICKET = " AGRESO POR TICKET ANULADO ";
    public static String CAJA_EGRESO_TRASLADO_CAJA = " INGRESO POR TRASLADO DE GAJA ";
    public static String CAJA_EGRESO_MANUAL = " EGRESO MANUAL DE CAJA ";
    public static String CAJA_EGRESO_NC = " EGRESO POR NOTA DE CREDITO ";

    //public static  String =etiqueta_caja
    
//    public static String DIR_REPORTE_DETALLE_CAJA = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\Cajas1.jasper";
//    public static String DIR_REPORTE_FACTURA = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\facturaA5_preimpreso.jasper";
//    public static String DIR_REPORTE_TICKET = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\ticket.jasper";
//    public static String DIR_REPORTE_PROFORMA = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\proforma.jasper";
//    public static String DIR_REPORTE_COMPROBANTE_INGRESO_CAJA = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\FACTURA.jasper";
//    public static String DIR_REPORTE_COMPROBANTE_EGRESO_CAJA = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\FACTURA.jasper";
//    public static String DIR_REPORTE_COMPROBANTE_REGSITRO_PAGO_CXC = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\FACTURA.jasper";
//    public static String DIR_REPORTE_COMPROBANTE_REGSITRO_PAGO_CXP = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\FACTURA.jasper";
//    public static String DIR_REPORTE_COMPROBANTE_CHEQUE_BP = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\FACTURA.jasper";
//    public static String DIR_REPORTE_COMPROBANTE_CHEQUE_BG = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\FACTURA.jasper";
//    public static String DIR_REPORTE_COMPROBANTE_CHEQUE_BPACIFICO = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\FACTURA.jasper";
//    public static String DIR_REPORTE_COMPROBANTE_CHEQUE_BB = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\FACTURA.jasper";
//    public static String DIR_REPORTE_COMPROBANTE_CHEQUE_BAUSTR = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\FACTURA.jasper";
//    
    
    public static String DIR_REPORTE_DETALLE_CAJA = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\Cajas1.jasper";
    public static String DIR_REPORTE_FACTURA = "C:\\Sofi\\reportes\\facturaA5_preimpreso.jasper";
    public static String DIR_REPORTE_TICKET = "C:\\Sofi\\reportes\\ticket.jasper";
    public static String DIR_REPORTE_PROFORMA = "C:\\Sofi\\reportes\\proforma.jasper";
    public static String DIR_REPORTE_COMPROBANTE_INGRESO_CAJA = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\FACTURA.jasper";
    public static String DIR_REPORTE_COMPROBANTE_EGRESO_CAJA = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\FACTURA.jasper";
    public static String DIR_REPORTE_COMPROBANTE_REGSITRO_PAGO_CXC = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\FACTURA.jasper";
    public static String DIR_REPORTE_COMPROBANTE_REGSITRO_PAGO_CXP = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\FACTURA.jasper";
    public static String DIR_REPORTE_COMPROBANTE_CHEQUE_BP = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\FACTURA.jasper";
    public static String DIR_REPORTE_COMPROBANTE_CHEQUE_BG = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\FACTURA.jasper";
    public static String DIR_REPORTE_COMPROBANTE_CHEQUE_BPACIFICO = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\FACTURA.jasper";
    public static String DIR_REPORTE_COMPROBANTE_CHEQUE_BB = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\FACTURA.jasper";
    public static String DIR_REPORTE_COMPROBANTE_CHEQUE_BAUSTR = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\FACTURA.jasper";
    
    public static String DIR_IP_SERVER = "";
    public static String _URL_UPDATE = "http://compueconomia.com.ec/UPDATES/"; //dirección url del recurso a descargar
    public static String _FILE_UPDATE = "Sofi3.jar"; //nombre del archivo destino
//Directorio destino para las descargas
    public static String _DIR_DESTINO = "Sofi/";
    ////////////fina ctualizaciones

    public Variables() {
        String ip = "";
        if (DIR_IP_SERVER.equalsIgnoreCase("localhost")) {
            ip = "**";
        } else {
            ip = DIR_IP_SERVER;
        }

        String c = "";
        char dir = File.separatorChar;
        if (login.os.equalsIgnoreCase("w")) {
            if (ip.equals("**")) {
                c = "c:";
            } else {
                c = DIR_IP_SERVER;
            }

        } else {
            if (ip.equals("**")) {
                c = "";
            } else {
                c = DIR_IP_SERVER;
            }
        }

        System.err.println("dir IP: " + c);

//        DIR_REPORTE_FACTURA = c + dir + "Sofi" + dir + "reportes" + dir + "facturaA5_preimpreso.jasper";
//        DIR_REPORTE_TICKET = c + dir + "Sofi" + dir + "reportes" + dir + "ticket.jasper";
//        DIR_REPORTE_PROFORMA = c + dir + "Sofi" + dir + "reportes" + dir + "proforma.jasper";
//        DIR_REPORTE_COMPROBANTE_INGRESO_CAJA = c + dir + "Sofi" + dir + "reportes" + dir + "FACTURA.jasper";
//        DIR_REPORTE_COMPROBANTE_EGRESO_CAJA = c + dir + "Sofi" + dir + "reportes" + dir + "FACTURA.jasper";
//        DIR_REPORTE_COMPROBANTE_REGSITRO_PAGO_CXC = c + dir + "Sofi" + dir + "reportes" + dir + "FACTURA.jasper";
//        DIR_REPORTE_COMPROBANTE_REGSITRO_PAGO_CXP = c + dir + "Sofi" + dir + "reportes" + dir + "FACTURA.jasper";
//        DIR_REPORTE_COMPROBANTE_CHEQUE_BP = c + dir + "Sofi" + dir + "reportes" + dir + "FACTURA.jasper";
//        DIR_REPORTE_COMPROBANTE_CHEQUE_BG = c + dir + "Sofi" + dir + "reportes" + dir + "FACTURA.jasper";
//        DIR_REPORTE_COMPROBANTE_CHEQUE_BPACIFICO = c + dir + "Sofi" + dir + "reportes" + dir + "FACTURA.jasper";
//        DIR_REPORTE_COMPROBANTE_CHEQUE_BB = c + dir + "Sofi" + dir + "reportes" + dir + "FACTURA.jasper";
//        DIR_REPORTE_COMPROBANTE_CHEQUE_BAUSTR = c + dir   + "Sofi" + dir + "reportes" + dir + "FACTURA.jasper";

        ////////////actuzlaciones 
        _URL_UPDATE = "http://compueconomia.com.ec/UPDATES/"; //dirección url del recurso a descargar
        _FILE_UPDATE = "Sofi3.jar"; //nombre del archivo destino
//Directorio destino para las descargas
        _DIR_DESTINO = c + dir + "Sofi/";
        ////////////fina ctualizaciones

    }

    public static void trial() {
        java.util.Date fecha = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //Para declarar valores en nuevos objetos date, usa el mismo formato date que usaste al crear las fechas 
        Date date1 = null;// = ObtenerFecha.getNTPDate();

        try {
            date1 = sdf.parse("2022-12-28"); //date1 es el 23 de febrero de 1995
            if (fecha.after(date1)) {
                JOptionPane.showMessageDialog(null, "Ha vencido el periodo de prueba contactarse al: 0992669329 -02 2765821 ");
                exit(0);
            } else {
             //   JOptionPane.showMessageDialog(null, "Se esta usando la aplicacion en modo prueba..!!! (contactarse al: 0992669329 -02 2765821)");
            }
        } catch (ParseException ex) {
            Logger.getLogger(Variables.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
