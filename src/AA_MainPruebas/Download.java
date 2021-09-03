/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AA_MainPruebas;

import ClasesAuxiliares.Variables;
import Controlador.Ejemplo;
import Vista.Principal;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JProgressBar;

/**
 * @author leyer
 */
public class Download extends Thread {

    private URL url = null;
    private String location = null;

    private FileOutputStream fileOutputStream = null;
    private InputStream inputStream = null;

    static int len = 0;
    static int off = 0;

    public Download(final URL url, String location) {
        this.url = url;
        this.location = location;
        try {
            URLConnection urlConnection = this.url.openConnection();
            inputStream = urlConnection.getInputStream();
            Principal.jProgressBar2.setMinimum(0);
            Principal.jProgressBar2.setMaximum(urlConnection.getContentLength());
            String p = url.getFile();
            String name = p.substring(p.lastIndexOf("/") + 1, p.length());
            System.out.println("Nombre del archivo: " + name);
            fileOutputStream = new FileOutputStream(new File(this.location + name));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    static byte[] buffer = new byte[1024];

    public static void descargar() {
        try {
            ;
            new Download(new URL("http://update1.compueconomia.com.ec/update/Sofi3.jar"), "c:/Sofi/").start();
        } catch (MalformedURLException malformedURLException) {
            malformedURLException.printStackTrace();
        }
    }

    public static void main(String[] args) {
        try {
            new Download(new URL("http://update1.compueconomia.com.ec/update/Sofi3.jar"), Variables._DIR_DESTINO).start();
        } catch (MalformedURLException malformedURLException) {
            malformedURLException.printStackTrace();
        }
    }

    @Override
    public void run() {
        int con = 0;
        Principal.jProgressBar2.setStringPainted(true);
        try {
            System.out.println("Descargando...");
            while ((len = inputStream.read(buffer)) >= 0) {
                con = con + len;
                Principal.jProgressBar2.setValue(con);
                Principal.jProgressBar2.setString("Descargando,Desde: " +Variables._URL_UPDATE);
                fileOutputStream.write(buffer, off, len);
                fileOutputStream.flush();

            }
            try {
                Principal.jProgressBar2.setString("Finalizado..");
                sleep(2000);
                Principal.jProgressBar2.setValue(0);
                Principal.jProgressBar2.setString("");
                String cmd = Ejemplo.jarExec; //Comando de apagado en linux
                Runtime.getRuntime().exec(cmd);
                System.exit(0);
            } catch (InterruptedException ex) {
                Logger.getLogger(Download.class.getName()).log(Level.SEVERE, null, ex);
            }

            System.out.println("Descarga completada: " + location + this);
        } catch (IOException ioException) {
            ioException.printStackTrace();
        } finally {
            try {
                fileOutputStream.close();
            } catch (IOException ioException2) {
                ioException2.printStackTrace();
            }
        }
    }
}
