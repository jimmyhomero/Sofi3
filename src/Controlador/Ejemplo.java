/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

/**
 *
 * @author USUARIO
 */
import ClasesAuxiliares.debug.Deb;
import java.io.*;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;


public class Ejemplo {
   // public static String dirConfig="c:"+dir+"sofi"+dir+"config"+dir+"config.properties";
//public static String dirConfig2=dir+"sofi"+dir+"config"+dir+"config.properties";
 static char dir= File.separatorChar;
public static String configFile = null;
public static String productosFileExample = null;
public static String listaComprasFilepdf = null;
public static String listaVentasFilepdf = null;
public static String factura1 = null;
public static String facturaA5_preimpreso = null;
public static String factura2 = null;
public static String ticket1 = null;
public static String proforma1 = null;
public static String jarExec = null;
public static String fileForamtoProductosexcel = null;
public static String fileTEMPForamtoProductosexcel = null;
public static String fileForamtoClientesExcel = null;
public static String fileTEMPForamtoClientesExcel = null;
public static String dirIMGtempgoogleSearch = null;




    public static String getSistemaOerativo() {
        String os = null;
        String osName = System.getProperty("os.name");
        String osNameMatch = osName.toLowerCase();
        if (osNameMatch.contains("linux")) {
            os = "l";
            configFile=dir+"sofi"+dir+"config"+dir+"config.properties";
            productosFileExample=dir+"sofi"+dir+"temp"+dir+"productos.xlsx";
            listaComprasFilepdf=dir+"sofi"+dir+"reportes"+dir+"report1.jasper";
            ///productos
            fileForamtoProductosexcel=dir+"sofi"+dir+"config"+dir+"formatos"+dir+"Formato_productos.xlsx";
            fileTEMPForamtoProductosexcel=dir+"sofi"+dir+"temp"+dir+"Formato_productos.xlsx";
            ////clientes
            fileForamtoClientesExcel=dir+"sofi"+dir+"config"+dir+"formatos"+dir+"Formato_clientes.xlsx";
            fileTEMPForamtoClientesExcel=dir+"sofi"+dir+"temp"+dir+"Formato_clientes.xlsx";
            //facturaA5_preimpreso
            facturaA5_preimpreso=dir+"sofi"+dir+"reportes"+dir+"facturaA5_preimpreso.jasper";
            factura1=dir+"sofi"+dir+"reportes"+dir+"FACTURA.jasper";
            factura2=dir+"sofi"+dir+"reportes"+dir+"facturaA5.jasper";
            ticket1=dir+"sofi"+dir+"reportes"+dir+"ticket.jasper";
            proforma1=dir+"sofi"+dir+"reportes"+dir+"proforma.jasper";
            ///IMG GOOGLE
            dirIMGtempgoogleSearch=dir+"sofi"+dir+"temp"+dir+"img"+dir;
            
               ///
            jarExec="java -jar \""+dir+"Sofi"+dir+"Sofi3.jar\"";
        } else if (osNameMatch.contains("windows")) {
            os = "w";
            jarExec="java -jar \"C:"+dir+"Sofi"+dir+"Sofi3.jar\"";
            configFile="c:"+dir+"sofi"+dir+"config"+dir+"config.properties";
           productosFileExample="c:"+dir+"sofi"+dir+"temp"+dir+"productos.xlsx";
           listaComprasFilepdf="c:"+dir+"sofi"+dir+"reportes"+dir+"report1.jasper";
           ///productos
           fileForamtoProductosexcel="c:"+dir+"sofi"+dir+"config"+dir+"formatos"+dir+"Formato_productos.xlsx";
           fileTEMPForamtoProductosexcel="c:"+dir+"sofi"+dir+"temp"+dir+"Formato_productos.xlsx";
           ////clientes
            fileForamtoClientesExcel="c:"+dir+"sofi"+dir+"config"+dir+"formatos"+dir+"Formato_clientes.xlsx";
            fileTEMPForamtoClientesExcel="c:"+dir+"sofi"+dir+"temp"+dir+"Formato_clientes.xlsx";
            
           factura1="c:"+dir+"sofi"+dir+"reportes"+dir+"FACTURA.jasper";
           factura2="c:"+dir+"sofi"+dir+"reportes"+dir+"facturaA5.jasper";
           facturaA5_preimpreso="c:"+dir+"sofi"+dir+"reportes"+dir+"facturaA5_preimpreso.jasper";
            ticket1="c:"+dir+"sofi"+dir+"reportes"+dir+"ticket.jasper";
            proforma1="c:"+dir+"sofi"+dir+"reportes"+dir+"proforma.jasper";
            ///IMG GOOGLE
            dirIMGtempgoogleSearch=dir+"sofi"+dir+"temp"+dir+"img"+dir;
            
               ///
        } else if (osNameMatch.contains("solaris") || osNameMatch.contains("sunos")) {
            os = "s";
        } else if (osNameMatch.contains("mac os") || osNameMatch.contains("macos") || osNameMatch.contains("darwin")) {
            os = "m";
        } else {
        }
        return os;
    }
    ///String dir = System.getProperty("user.dir");
    public static String getPrpertyValue(String property) {
        //  String dir = System.getProperty("user.dir");

        Properties prop = new Properties();
        String val = "error";
        if (val.equals("error")) {
            try {
                prop.load(new FileInputStream(configFile));
                val = prop.getProperty(property);
            } catch (Exception e) {
                Deb.consola(e.toString());
                val = "error";
            }

        }
        

        return val;
    }

    public static String setPrpertyValue(String key, String property) {
        Properties prop = new Properties();
        String dir = System.getProperty("user.dir");
        String val = null;
        try {
            prop.load(new FileInputStream(configFile));
            prop.setProperty(key, property);
            URL url = ClassLoader.getSystemResource(configFile);
            //prop.store(new FileOutputStream(new File(url.toURI())), null);
            prop.store(new FileWriter(configFile), "Actualizado At");
        } catch (IOException e) {
            Deb.consola(e.toString());
        }
        return val;
    }

    public static void main(String[] args) throws IOException {
        Properties prop = new Properties();
        //System.getProperty("path.separator");
        String dir = System.getProperty("user.dir");
        String dir2 = System.getProperty("user.home");
        Deb.consola("Controlador.Ejemplo.main()" + System.getProperties());
        JOptionPane.showMessageDialog(null, dir);
        JOptionPane.showMessageDialog(null, dir2);
        try {
            InputStream propertiesStream = ClassLoader.getSystemResourceAsStream(dir + "\\src\\Controlador\\config.properties");
            prop.load(propertiesStream);
            propertiesStream.close();
        } catch (IOException e) {
            Deb.consola(e.toString());
        }

        // Acceder a las propiedades por su nombre
        Deb.consola("Propiedades por nombre:");
        Deb.consola("-----------------------");
        Deb.consola(prop.getProperty("servidor.nombre"));
        Deb.consola(prop.getProperty("servidor.password"));
        Deb.consola(prop.getProperty("servidor.usuario"));
        prop.setProperty("servidor.nombre", "192.168.1.5");
        Deb.consola(prop.getProperty("servidor.nombre"));
        // Recorrer todas sin conocer los nombres de las propiedades
        Deb.consola("Recorrer todas las propiedades:");
        Deb.consola("-------------------------------");
        prop.store(new FileWriter("C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Controlador\\config.properties"), "Actualizado At");

        for (Enumeration e = prop.keys(); e.hasMoreElements();) {
            // Obtenemos el objeto
            Object obj = e.nextElement();
            Deb.consola(obj + ": " + prop.getProperty(obj.toString()));
        }
    }
}
