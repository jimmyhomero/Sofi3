/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares;

import ClasesAuxiliares.debug.Deb;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;

/**
 *
 * @author usuario
 */
public class FtpUpload {

    private static void check(FTPClient ftp, String cmd, boolean succeeded) throws IOException {
        if (!succeeded) {
            throw new IOException("FTP error: " + ftp.getReplyString());
        }
    }

    private static String today() {
        return new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    }

    public void uploadfile(String server, String username, String Password, String sourcePath, String destDir) {

        try {

            FTPClient ftp = new FTPClient();
            ftp.connect(server);
            try {
                check(ftp, "login", ftp.login(username, Password));

                System.out.println("Connected to " + server + ".");

                InputStream input = new FileInputStream(sourcePath);
                try {
                    String destination = destDir;
                    if (destination.endsWith("/")) {
                        for ( FTPFile o : ftp.listFiles()) {
                            Deb.consola(o.getName().toString());
                        }
                       
                        destination += new File(sourcePath).getName();// += today() + "-" + new File(sourcePath).getName();
                    }
                    
                    boolean exist = ftp.deleteFile(destination);
                    if(exist){
                        System.out.println("Deleted:  " + destination + ".");
                    }else{
                    System.out.println("Fail Dont exist File: " + destination + ".");
                    }
                    
                    check(ftp, "store", ftp.storeFile(destination, input));
                    System.out.println("Stored " + sourcePath + " to " + destination + ".");
                } finally {
                    input.close();
                }

                check(ftp, "logout", ftp.logout());

            } finally {
                ftp.disconnect();
            }
            //
        } catch (IOException ex) {
            System.err.println("ssssxzxs" + ex);
        }
        //
    }

    public static void main(String[] args) throws IOException {
        FtpUpload upload = new FtpUpload();
        //upload.uploadfile("update1.compueconomia.com.ec", "operador", "t1c$$2015.**+", "C:/Users/usuario/Dropbox/Sofi3.1/dist/Sofi3.jar", "/var/www/html/update/");
        upload.uploadfile("update1.compueconomia.com.ec", "operador", "t1c$$2015.**+", "C:/Users/USUARIO/Desktop/Dropbox/Dropbox/Sofi3.1/dist/Sofi3.jar", "/var/www/html/update/");
        
    }

}
