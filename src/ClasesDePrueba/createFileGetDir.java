/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesDePrueba;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class createFileGetDir {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
              String ruta = "Reportes/archivo.txt";
        File archivo = new File(ruta);
        BufferedWriter bw = null;
        if(archivo.exists()) {
                  try {
                      bw = new BufferedWriter(new FileWriter(archivo));
                      bw.write("El fichero de texto ya estaba creado.");
                  } catch (IOException ex) {
                      Logger.getLogger(createFileGetDir.class.getName()).log(Level.SEVERE, null, ex);
                  }
        } else {
            try {
                bw = new BufferedWriter(new FileWriter(archivo));
            bw.write("Acabo de crear el fichero de texto.");
            } catch (Exception e) {
                Logger.getLogger(createFileGetDir.class.getName()).log(Level.SEVERE, null, e);
            }
            
        }
        try {
            bw.close();
        } catch (IOException ex) {
            Logger.getLogger(createFileGetDir.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
