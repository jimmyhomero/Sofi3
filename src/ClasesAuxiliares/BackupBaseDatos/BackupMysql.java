/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares.BackupBaseDatos;

import Controlador.Coneccion;
import Controlador.Usuarios.HoraFecha;
import Vista.Backup.Crear_Backup;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Date;

/**
 *
 * @author USUARIO
 */
public class BackupMysql extends Coneccion{
    

public static void respaldar(String ruta,String gestorBd) {
        try {
            /* - Datos de acceso a nuestra base de datos */
            /* Usa localhost si el servidor corre en la misma maquina, de lo 
            contrario utiliza la IP o dirección del sevidor*/
          
            String dbServer = Coneccion.host;
            /* El usuario de tu base de datos*/
            String dbName = Coneccion.bdd;
            /* El usuario de tu base de datos*/
            String dbUser = Coneccion.user;
            /* La contraseña de la base de datos (dejarla en texto plano puede 
            ser un problema)*/
            String dbPass = Coneccion.pass;
            
            /*El nombre o ruta a donde se guardara el archivo de volcado .sql*/
            String sqlFile = ruta;
            //String sqlFile = "C:\\Sofi\\respaldos\\respaldo.sql";

            /* La linea de comando completa que ejecutara el programa*/
            //String command = "C:\\xampp\\mysql\\bin\\mysqldump --host " + dbServer + " -u " + dbUser + " -p" + dbPass + " " + dbName + " -r " + sqlFile;
            String command = gestorBd+" --host " + dbServer + " -u " + dbUser + " -p" + dbPass + " " + dbName + " -r " + sqlFile;
            System.out.println("ClasesAuxiliares.BackupBaseDatos.BackupMysql.respaldar(): "+command);
            /*Se crea un proceso que ejecuta el comando dado*/
            Process bck = Runtime.getRuntime().exec(command);
            
            /* Obtiene el flujo de datos del proceso, esto se hace para obtener 
            el texto del proceso*/
            InputStream stdout = bck.getErrorStream();
            
            /* Se obtiene el resultado de finalizacion del proceso*/
            int resultado = bck.waitFor();
            
            String line;

            /* Se crea un buffer de lectura con el flujo de datos outstd y ese mismo
            sera leido e impreso, esto mostrara el texto que muestre el programa
            mysqldump, de esta forma sabra cual es el error en su comando*/
            BufferedReader brCleanUp = new BufferedReader(new InputStreamReader(stdout));
            
            while ((line = brCleanUp.readLine()) != null) {
                System.out.println(line);
                Crear_Backup.jtex1.append(line);
            }                       
            brCleanUp.close();
            
            if (resultado == 0) {
                System.out.println("Respaldo exitoso");
            } else {
                System.out.println("Error al respaldar");
            }
        } catch (IOException | InterruptedException ex) {
            System.out.println("Exception: " + ex.getMessage());
        }
    }
 
}