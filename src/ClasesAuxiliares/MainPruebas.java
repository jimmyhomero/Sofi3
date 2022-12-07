/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares;

import ClasesAuxiliares.BackupBaseDatos.BackupMysql;
import ClasesAuxiliares.BackupBaseDatos.Comprimir;
import ClasesAuxiliares.BackupBaseDatos.SendadjuntosbyEmail;
import ClasesAuxiliares.http.getUrlFromGoogle;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;

/**
 *
 * @author USUARIO
 */
public class MainPruebas {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        // TODO code application logic here
        //  CodigodeBarras.CrearCodigoBarrasAutomaticamente();
        //codigoBarrasPDF.newcodigoBarrasPDF();
////      Fowiz f = new Fowiz();
////      f.sms();
//getUrlFromGoogle.getImagesFromGoogle("casa");
//        FtpCliente ftp = new FtpCliente();
//        ftp.conect();
        
        File f = new File("C://Sofi/temp/respaldos/resp-" + ObtenerFecha.getFechaNow() + ".zip");
        BackupMysql resp = new BackupMysql();
        String file = "C://Sofi/temp/respaldos/resp-" + ObtenerFecha.getFechaNow() + ".zip";
        BackupMysql.respaldar(file.replace("zip", "sql"), "mysql");
        Comprimir.comprimir("C://Sofi/temp/respaldos/");
        SendadjuntosbyEmail send = new SendadjuntosbyEmail();
        try {
            send.send("homer_loading@hotmail.com", "", "Respaldos", "Respaldos baseDatos", f, f);
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(MainPruebas.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(MainPruebas.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
