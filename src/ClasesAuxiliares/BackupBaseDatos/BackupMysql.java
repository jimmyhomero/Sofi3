/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares.BackupBaseDatos;

import ClasesAuxiliares.Variables;
import ClasesAuxiliares.debug.Deb;
import Controlador.Coneccion;
import Controlador.Usuarios.HoraFecha;
import Vista.Backup.Crear_Backup;
import Vista.Backup.Crear_Backup.HiloLector;
import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Date;

/**
 *
 * @author USUARIO
 */
public class BackupMysql extends Coneccion {

    public static void respaldar(String ruta, String gestorBd) {
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
            String command2 = gestorBd + " --host " + dbServer + " -u " + dbUser + " -p" + dbPass + " " + dbName + " -r " + sqlFile;
            String command="mysqldump " + " -u " + dbUser + " -p" + dbPass + " " + dbName + " -r " + sqlFile;
            Deb.consola("ClasesAuxiliares.BackupBaseDatos.BackupMysql.respaldar(): " + command);
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
                Deb.consola(line);
                Crear_Backup.jtex1.append(line);
            }
            brCleanUp.close();

            if (resultado == 0) {
                Deb.consola("Respaldo exitoso");
            } else {
                Deb.consola("Error al respaldar");
            }
        } catch (IOException | InterruptedException ex) {
            Deb.consola("Exception: " + ex.getMessage());
        }
    }

    public class HiloLector extends Thread {

        private InputStream is;

        public HiloLector(InputStream is) {
            this.is = is;
        }

        @Override
        public void run() {
            try {
                byte[] buffer = new byte[1000];
                int leido = is.read(buffer);
                while (leido > 0) {
                    String texto = new String(buffer, 0, leido);
                    System.out.print(texto);
                    leido = is.read(buffer);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private void backup() {
        try {
            String cad = "mysqldump --all-databases -uroot -pmiguel66677710101418/2=golosos";
            Deb.consola(cad);
            Process p = Runtime
                    .getRuntime()
                    .exec(cad);

            new HiloLector(p.getErrorStream()).start();
            // .exec("C:/Aplicaciones/wamp/bin/mysql/mysql5.1.36/bin/mysqldump -u root -ppassword database");

            InputStream is = p.getInputStream();
            FileOutputStream fos = new FileOutputStream(Variables._DIR_DESTINO_RESPALDO_BDD + "RESPALDOS_AAA_.sql");
            byte[] buffer = new byte[1000];

            int leido = is.read(buffer);
            while (leido > 0) {
                fos.write(buffer, 0, leido);
                leido = is.read(buffer);
            }

            fos.close();

        } catch (Exception e) {
            e.printStackTrace();
            Deb.consola(e);
        }
    }
}
