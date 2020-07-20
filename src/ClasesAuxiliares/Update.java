/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares;

import Controlador.Ejemplo;
import Vista.Dialogs.dialogPrgressBar;
import Vista.Principal;
import Vlidaciones.ProgressBar;
import java.awt.Frame;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;

import java.net.URLConnection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import org.codehaus.groovy.ast.Variable;
import org.codehaus.groovy.ast.stmt.TryCatchStatement;

/**
 *
 * @author USUARIO
 */
public class Update {

    String url = Variables._URL_UPDATE;
    String name = Variables._FILE_UPDATE; //nombre del archivo destino
//Directorio destino para las descargas
    String folder = Variables._DIR_DESTINO;

    public void updatenow() {
//
////Crea el directorio de destino en caso de que no exista
//        File dir = new File(folder);
//
//        if (!dir.exists()) {
//            if (!dir.mkdir()) {
//                return; // n
//            }
//        }
////////

        try {
            File file = new File(folder + name);
            URLConnection conn = new URL(url + name).openConnection();
            conn.connect();
            System.out.println("\nempezando descarga: \n");
            System.out.println(">> URL: " + url + name);
            System.out.println(">> Nombre: " + name);
            System.out.println(">> tamaño: " + (conn.getContentLength()) + " bytes");

//            Principal.jProgressBar2.setMaximum(conn.getContentLength());
//            Principal.jProgressBar2.setStringPainted(true);
            InputStream in = conn.getInputStream();
            OutputStream out = new FileOutputStream(file);
            int b = 0;
            while (b != -1) {
                b = in.read();
                if (b != -1) {
                    out.write(b);
                }
            }
            out.close();
            in.close();
            JOptionPane.showMessageDialog(null, "ACTUALIZACION CORRECTA..");
            String cmd = Ejemplo.jarExec; //Comando de apagado en linux
            Runtime.getRuntime().exec(cmd);
            System.exit(0);
        } catch (MalformedURLException e) {
            System.out.println("la url: " + url + " no es valida!");

        } catch (IOException ex) {
            System.out.println("Error: " + ex + " - !");
        } finally {

        }

    }

}
