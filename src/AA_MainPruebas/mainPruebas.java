/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AA_MainPruebas;

import ClasesAuxiliares.debug.Deb;
import Controlador.Usuarios.ImpresionDao;
import impresoras.ServicioDeImpresion;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintException;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;
import login.login;

/**
 *
 * @author USUARIO
 */
public class mainPruebas {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        String zplCommand = "^XA\n"
                + "^FO10,0^ARN,8,7^FD SOME TEXT ^FS\n"
                + "^FO300,0^ARN,8,7^FD impresion xxx ^FS\n"
                + "^FO10,35^ARN,11,7^FD SOME TEXT ^FS\n"
                + "^FO300,35^ARN,11,7^FD mas que nadad ^FS\n"
                + "^FO10,70^ARN,11,7^FD SOME CODE ^FS\n"
                + "^FO250,115^ARN,11,7^BCN,60,Y,Y,N^FD 123456789 ^FS\n"
                + "^XZ";

        // convertimos el comando a bytes  
        byte[] by = zplCommand.getBytes();
        DocFlavor flavor = DocFlavor.BYTE_ARRAY.AUTOSENSE;
        Doc doc = new SimpleDoc(by, flavor, null);

        ////////////////fin codigo para zebra
        try {
            PrintService printService = PrintServiceLookup.lookupDefaultPrintService();
           // ServicioDeImpresion imprime = new ServicioDeImpresion();
            //PrintService jb = imprime.getJobPrinter();
            
            DocPrintJob job = printService.createPrintJob();
            job.print(doc, null);
        } catch (PrintException ex) {
            Logger.getLogger(ImpresionDao.class.getName()).log(Level.SEVERE, null, ex);
            Deb.consola("Controlador.Usuarios.ImpresionDao.impresionzZebra(): " + ex);
        }

    }

}
