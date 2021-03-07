/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package impresoras;

/**
 *
 * @author USUARIO
 */
import Vista.Principal;
import ClasesAuxiliares.debug.Deb;
import java.awt.Desktop;
import java.awt.print.PageFormat;
import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintException;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;
import javax.print.attribute.standard.MediaSize;

/**
 *
 * @author Administrador
 */
public class ServicioDeImpresion {

    boolean selecIMpresion = false;
    boolean selecIMpresiora = false;

    public static List<String> getListadeImpresoras() {
        List<String> listImpresoras = new ArrayList<String>();
        PrintService[] services = PrintServiceLookup.lookupPrintServices(null, null); //nos da el array de los servicios de impresion
        if (services.length > 0) {
            for (int i = 0; i < services.length; i++) {

                listImpresoras.add(services[i].getName());
            }
        }

        return listImpresoras;
    }

    public static void imprimirCocina(String textoAImprimir) {
        agregarLogoATicket(textoAImprimir);
        PrintService[] services = PrintServiceLookup.lookupPrintServices(null, null); //nos da el array de los servicios de impresion

        byte[] bytes = textoAImprimir.getBytes();

//Especificamos el tipo de dato a imprimir
//Tipo: bytes; Subtipo: autodetectado
        DocFlavor flavor = DocFlavor.BYTE_ARRAY.AUTOSENSE;

        Doc doc = new SimpleDoc(bytes, flavor, null);
//Creamos un trabajo de impresión
        DocPrintJob job = null;
        if (services.length > 0) {
            for (int i = 0; i < services.length; i++) {

                if (services[i].getName().equals("cocina")) {//aqui escribimos/elegimos la impresora por la que queremos imprimir
                    //manejar error en caso de que no esté conectada
                    //Desktop.getDesktop().print(null);//para imprimir un archivo ya existente  
                    job = services[i].createPrintJob();// Deb.consola(i+": "+services[i].getName());

                } else {
                    Deb.consola("No se encontró la impresora cocina");
                }
            }

            PrinterJob pj = PrinterJob.getPrinterJob();

            PageFormat mPageFormat = pj.defaultPage();
            //pj.setPrintable(cp, mPageFormat);
            if (pj.printDialog()) {
                try {
                    //PrintService service = pj.getPrintService();//PrintServiceLookup.lookupDefaultPrintService();
                    pj.print();
                    //DocPrintJob pjb;
                    // job = service.createPrintJob();
                } catch (PrinterException ex) {
                    Logger.getLogger(ServicioDeImpresion.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }

//Imprimimos dentro de un try obligatoriamente
//        try {
//            if (job != null) {
//                job.print(doc, null);
//            }
//        } catch (PrintException ex) {
//            Deb.consola(ex);
//        }
    }

    public static void imprimirCaja(String textoAImprimir) {
        agregarLogoATicket(textoAImprimir);
        PrintService[] services = PrintServiceLookup.lookupPrintServices(null, null); //nos da el array de los servicios de impresion

        byte[] bytes = textoAImprimir.getBytes();

//Especificamos el tipo de dato a imprimir
//Tipo: bytes; Subtipo: autodetectado
        DocFlavor flavor = DocFlavor.BYTE_ARRAY.AUTOSENSE;

        Doc doc = new SimpleDoc(bytes, flavor, null);
//Creamos un trabajo de impresión
        DocPrintJob job = null;
        if (services.length > 0) {
//            for (int i = 0; i < services.length; i++) {
//                if (services[i].getName().equals("caja")) {//aqui escribimos/elegimos la impresora por la que queremos imprimir
//                    job = services[i].createPrintJob();// Deb.consola(i+": "+services[i].getName());
//                }
//            }
            for (PrintService service : services) {
                if (service.getName().equals("caja")) {
                    //aqui escribimos/elegimos la impresora por la que queremos imprimir
                    job = service.createPrintJob(); // Deb.consola(i+": "+services[i].getName());
                }
            }
        }

//Imprimimos dentro de un try obligatoriamente
        try {
            job.print(doc, null);
        } catch (PrintException ex) {
            Deb.consola(ex);
        }

    }

    public  PrintService getJobPrinter(){
        PrintService[] services = PrintServiceLookup.lookupPrintServices(null, null); //nos da el array de los servicios de impresion
        int pos=0;
        DocPrintJob job = null;
        if (services.length > 0) {
            for (int i = 0; i < services.length; i++) {
                if (services[i].getName().equals(Principal.impresoraTicket)) {
        pos=i;
                    job = services[i].createPrintJob();
                    Deb.consola(i + "IMPRESORA selec : " + services[i].getName());
                }
            }
        }
        return services[pos];
    }
     public  PrintService getJobPrinterImpresoraDefinida(String impresora){
        PrintService[] services = PrintServiceLookup.lookupPrintServices(null, null); //nos da el array de los servicios de impresion
        int pos=0;
        DocPrintJob job = null;
        if (services.length > 0) {
            for (int i = 0; i < services.length; i++) {
                if (services[i].getName().equals(impresora)) {
        pos=i;
                    job = services[i].createPrintJob();
                    Deb.consola(i + "IMPRESORA selec : " + services[i].getName());
                }
            }
        }
        return services[pos];
    }
    public void imprimirGenerico(String contentTicket,PrintService printservice) {
        
    //    PrintService[] services = PrintServiceLookup.lookupPrintServices(null, null); //nos da el array de los servicios de impresion
//Creamos un arreglo de tipo byte 
//y le agregamos el string convertido (cuerpo del ticket) a bytes tal como 
//lo maneja la impresora(mas bien ticketera :p)
        contentTicket = contentTicket + "\n";
        byte[] bytes = contentTicket.getBytes(); //Especificamos el tipo de dato a imprimir 
//Tipo: bytes; Subtipo: autodetectado 
        DocFlavor flavor = DocFlavor.BYTE_ARRAY.AUTOSENSE;
        Doc doc = new SimpleDoc(bytes, flavor, null); //Creamos un trabajo de impresión
     DocPrintJob job = null;
     
        job  = printservice.createPrintJob();
//Imprimimos dentro de un try obligatoriamente 
        try {
            job.print(doc, null);
        } catch (PrintException ex) {
            Deb.consola("probel : "+ex);
        }
    }

    public String recortar(String text, int len) {
        if (text.length() > len) {
            text = text.substring(0, len);
        }
        return text;
    }

    public String centrarTexto(String text, int len) {
        String out = String.format("%" + len + "s%s%" + len + "s", "", text, "");
        float mid = (out.length() / 2);
        float start = mid - (len / 2);
        float end = start + len;
        return out.substring((int) start, (int) end);
    }

    //TODO arreglo de impresoras de caja
    //TODO arreglo de impresoras de cocina
    public static void main(String[] args) {
        ServicioDeImpresion impresion = new ServicioDeImpresion();
        //  String Cabecera = center("JC", 40);
//        ServicioDeImpresion.imprimirGenerico(Cabecera + "\n");
//        ServicioDeImpresion.imprimirGenerico("DIRECCION: Av. Quito y San Miguel\n");
//        ServicioDeImpresion.imprimirGenerico("Telef: 02265890 - 0992669329\n");
//        ServicioDeImpresion.imprimirGenerico("Facturacion Electronica \n");

    }

    private static String agregarLogoATicket(String textoAImprimir) {
        //TODO hacer pruebas de impresión de logo
        //TODO tal vez también se necesite imprimir una parte común al final
        return textoAImprimir;
    }
}
