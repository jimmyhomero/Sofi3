/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vlidaciones;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

public class Importar2 {
    
    ///http://masdejava.blogspot.com/2016/08/obtener-id-de-un-jcombobox-java.html#.WbHhUcjyhPZ
    
    private static void Exportar(){
        try {
            Process p = 
            Runtime.getRuntime().exec("C:\\xampp\\mysql\\bin\\mysqldump --opt -uroot -p -B sofi");

            InputStream is = p.getInputStream();
            FileOutputStream fos = new FileOutputStream("D:\\backus.sql");
            byte[] buffer = new byte[1000];

            int leido = is.read(buffer);
            while (leido > 0) {
               fos.write(buffer, 0, leido);
               leido = is.read(buffer);
            }
            
            fos.close();
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    private static void restaurar() {
        try {
            Process p = 
            Runtime.getRuntime().exec("C:\\xampp\\mysql\\bin\\mysql -uroot -pcontraseña basededatos");

            OutputStream os = p.getOutputStream();
            FileInputStream fis = new FileInputStream("C:\\Users\\David\\Desktop\\backus.sql");
            byte[] buffer = new byte[1000];

            int leido = fis.read(buffer);
            while (leido > 0) {
               os.write(buffer, 0, leido);
               leido = fis.read(buffer);
            }

            os.flush();
            os.close();
            fis.close();
            
        }catch(Exception e){
            e.printStackTrace();
        }
}
    
    public static void main(String[]args){
        Importar2.Exportar();
        Importar2.restaurar();
    }
    
}