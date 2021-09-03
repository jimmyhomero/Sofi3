/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista.downloadActulizacion;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import javax.swing.JOptionPane;

/**
 *
 * @author Rolando
 */
public class Gestor implements Runnable {

    private String direccion;
    private String rutaDescarga;
    private VentanaPrincipal parent;

    public Gestor(String direccion, String rutaDescarga, VentanaPrincipal parent) {
        this.direccion = direccion;
        this.rutaDescarga = rutaDescarga;
        this.parent = parent;
    }

    @Override
    public void run() {
        try {
            URL url = new URL(direccion);
            // establecemos conexion
            URLConnection conexion = url.openConnection();
            InputStream stream = conexion.getInputStream();
            int length = conexion.getContentLength();
            parent.getPgrAvance().setString("");
            parent.getPgrAvance().setMinimum(0);
            parent.getPgrAvance().setMaximum(length);
            parent.getPgrAvance().setValue(0);
            FileOutputStream fichero = new FileOutputStream(rutaDescarga);
            // Lectura de la foto de la web y escritura en fichero local
            byte[] buffer = new byte[1024]; // buffer temporal de lectura.
            int readed = stream.read(buffer);
            int current = 0;
            while (readed > 0) {
                fichero.write(buffer, 0, readed);
                readed = stream.read(buffer);
                parent.getPgrAvance().setValue(current);
                current += readed;
            }
            parent.getPgrAvance().setValue(length);
            parent.getPgrAvance().setString("Descarga completa");
            // cierre de conexion y fichero.
            stream.close();
            fichero.close();
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(parent, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
}
