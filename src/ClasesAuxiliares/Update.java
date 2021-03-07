/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares;

import ClasesAuxiliares.debug.Deb;
import Controlador.Ejemplo;
import Vista.Dialogs.dialogPrgressBar;
import Vista.Principal;
import Vlidaciones.ProgressBar;
import java.awt.Frame;
import java.io.File;
import java.io.FileNotFoundException;
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

    public void updatenow() throws IOException {

        File file = new File(folder + name);
        //JOptionPane.showMessageDialog(null, folder + name);
        Deb.consola("Ruta> : " + folder + name);
        URLConnection conn = new URL(url + name).openConnection();
        conn.connect();
        Deb.consola("\nempezando descarga: \n");
        Deb.consola(">> URL: " + url + name);
        Deb.consola(">> Nombre: " + name);
        Deb.consola(">> tamaño: " + (conn.getContentLengthLong()) + " bytes");
        

        Thread t = new Thread() {
            public void run() {

                try {
                    Principal.jProgressBar2.setValue(0);
                    Principal.jProgressBar2.setMinimum(0);
                    
                    Principal.jProgressBar2.setBorderPainted(true);
                    Principal.jProgressBar2.setStringPainted(true);
                   // Integer avance = 0;
                    Integer max = conn.getContentLength();;
                    OutputStream out = null;
                    InputStream in = conn.getInputStream();
                    out = new FileOutputStream(file);
                    int b = 0;
                    int x = 0;
                    Principal.jProgressBar2.setMaximum(max);
                    while (b != -1) {
                        Principal.jProgressBar2.setString("Procesando...");
//                        System.out.println("MAXIOMO : " + ( max));
                     //   System.out.println("DISPOBIBLE  : " + ( in.available()));
//                        System.out.println("DIEFECNIA : " + ( max-in.available()));
                        Principal.jProgressBar2.setValue(x);
                        x++;
                        b = in.read();
                        if (b != -1) {
                            out.write(b);                           
                        }
                    }
                    System.out.println("ClasesAuxiliares.Update.updatenow()ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
                    out.close();
                    in.close();
                    Principal.jProgressBar2.setString("Al fin!, hemos finalizado..");
                    Thread.sleep(500);
                    Principal.jProgressBar2.setValue(0);
                    Principal.jProgressBar2.setString("");
                } catch (FileNotFoundException ex) {
                    Logger.getLogger(Update.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(Update.class.getName()).log(Level.SEVERE, null, ex);
                } catch (InterruptedException ex) {
                    Logger.getLogger(Update.class.getName()).log(Level.SEVERE, null, ex);
                } finally {
                    
                }
            }
        ;

        };
        t.start();

        //JOptionPane.showMessageDialog(null, "ACTUALIZACION CORRECTA..");
        //String cmd = Ejemplo.jarExec; //Comando de apagado en linux
        // Runtime.getRuntime().exec(cmd);
        //System.exit(0);
    }

}
