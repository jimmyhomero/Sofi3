/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares;

import it.sauronsoftware.ftp4j.FTPAbortedException;
import it.sauronsoftware.ftp4j.FTPClient;
import it.sauronsoftware.ftp4j.FTPDataTransferException;
import it.sauronsoftware.ftp4j.FTPDataTransferListener;
import it.sauronsoftware.ftp4j.FTPException;
import it.sauronsoftware.ftp4j.FTPFile;
import it.sauronsoftware.ftp4j.FTPIllegalReplyException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import javax.swing.SwingWorker;
import jdk.nashorn.internal.runtime.regexp.joni.Config;

public class FtpCliente {

    FTPClient client;
    public void conect() {

        try {
            client = new FTPClient();
            client.connect("update1.compueconomia.com.ec");
            client.login("operador", "t1c$$2015.**+");
            client.setPassive(true);
            client.setType(FTPClient.TYPE_BINARY);
            client.changeDirectory("/var/www/html/update/");
        } catch (Exception err) {
            System.out.println("ERROR: " + err.getLocalizedMessage());
        }

        //////////////
        new SwingWorker<Double, String>() {
            String nombre = "Sofi3.jar";

            @Override
            protected Double doInBackground() throws Exception {
                try {
                    File archivo = new File("C:/Users/usuario/Dropbox/Sofi3.1/dist/Sofi3.jar");
                    InputStream is = new FileInputStream(archivo);
                    client.upload(nombre, is, 0, 0, new FTPDataTransferListener() {
                        @Override
                        public void started() {
                            System.out.println("El archivo ha iniciado su subida " + nombre);
                        }

                        @Override
                        public void transferred(int i) {
                            System.out.println("El archivo ha transferido su subida " + nombre);
                        }

                        @Override
                        public void completed() {
                            System.out.println("El archivo ha completado su subida " + nombre);
                        }

                        @Override
                        public void aborted() {
                            System.out.println("El archivo ha abortado su subida " + nombre);
                        }

                        @Override
                        public void failed() {
                            System.out.println("El archivo ha fallado su subida " + nombre);
                        }
                    });
                } catch (FTPAbortedException | FTPDataTransferException | FTPException | FTPIllegalReplyException | IOException | IllegalStateException e) {
                    System.out.println(".doInBackground()xxxx " + e);
                } finally {
                    client.disconnect(true);
                }
                System.out.println("xxxxx" + 111111.0);
                return 111111.0;
            }

            @Override
            protected void done() {
            }
        }.execute();
    }
}
