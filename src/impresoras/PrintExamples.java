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
import javax.print.PrintService;
import ClasesAuxiliares.debug.Deb;
import javax.print.PrintServiceLookup;
import javax.print.attribute.Attribute;
import javax.print.attribute.AttributeSet;
import javax.print.attribute.HashAttributeSet;
import javax.print.attribute.PrintServiceAttributeSet;
import javax.print.attribute.standard.Destination;
import javax.print.attribute.standard.PrinterInfo;
import javax.print.attribute.standard.PrinterIsAcceptingJobs;
import javax.print.attribute.standard.PrinterLocation;
import javax.print.attribute.standard.PrinterMakeAndModel;
import javax.print.attribute.standard.PrinterName;
import javax.print.attribute.standard.PrinterState;
 
/**
 * Ejemplos para ver tus impresoras
 * @author Peiretti
 */
public class PrintExamples {
 
    /**
     * @param args
     */
    public static void main(String[] args) {
 
        printAvailable();
        printDefault();
        printByName("MiImpresora");
    }
 
    public static void printAvailable() {
 
        // busca los servicios de impresion...
        PrintService[] services = PrintServiceLookup.lookupPrintServices(null, null);
 
        // -- ver los atributos de las impresoras...
        for (PrintService printService : services) {
 
            Deb.consola(" ---- IMPRESORA: " + printService.getName());
 
            PrintServiceAttributeSet printServiceAttributeSet = printService.getAttributes();
 
            Deb.consola("--- atributos");
 
            // todos los atributos de la impresora
            Attribute[] a = printServiceAttributeSet.toArray();
            for (Attribute unAtribute : a) {
                Deb.consola("atributo: " + unAtribute.getName());
            }
 
            Deb.consola("--- viendo valores especificos de los atributos ");
 
            // valor especifico de un determinado atributo de la impresora
            Deb.consola("PrinterLocation: " + printServiceAttributeSet.get(PrinterLocation.class));
            Deb.consola("PrinterInfo: " + printServiceAttributeSet.get(PrinterInfo.class));
            Deb.consola("PrinterState: " + printServiceAttributeSet.get(PrinterState.class));
            Deb.consola("Destination: " + printServiceAttributeSet.get(Destination.class));
            Deb.consola("PrinterMakeAndModel: " + printServiceAttributeSet.get(PrinterMakeAndModel.class));
            Deb.consola("PrinterIsAcceptingJobs: " + printServiceAttributeSet.get(PrinterIsAcceptingJobs.class));
 
        }
 
    }
 
    public static void printDefault() {
 
        // tu impresora por default
        PrintService service = PrintServiceLookup.lookupDefaultPrintService();
        Deb.consola("Tu impresora por default es: " + service.getName());
 
    }
 
    public static void printByName(String printName) {
 
    	PrintService[] services = PrintServiceLookup.lookupPrintServices(null, null);
 
        // buscar por el nombre de la impresora (nombre que le diste en tu S.O.)
        // en "aset" puedes agregar mas atributos de busqueda
        AttributeSet aset = new HashAttributeSet();
        aset.add(new PrinterName(printName, null));
        //aset.add(ColorSupported.SUPPORTED); // si quisieras buscar ademas las que soporten color
 
        services = PrintServiceLookup.lookupPrintServices(null, aset);
        if(services.length == 0){
        	Deb.consola("No se encontro impresora con nombre " + printName);
        }
        for (PrintService printService : services) {
        	Deb.consola(printService.getName());
		}
    }
}