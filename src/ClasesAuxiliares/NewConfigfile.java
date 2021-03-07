/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares;

/**
 *
 * @author USUARIO
 */
import ClasesAuxiliares.debug.Deb;
import Controlador.Usuarios.ConfigDao;
import Modelo.ConfigSofia;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.filechooser.FileNameExtensionFilter;

public class NewConfigfile {
    
    public static String selectDirectorio() {
        String ruta = null;
        JFileChooser explorador = new JFileChooser("\\home\\");
        FileNameExtensionFilter filter = new FileNameExtensionFilter("Config FIles", "properties");
        explorador.setFileFilter(filter);
        explorador.setFileSelectionMode(JFileChooser.FILES_AND_DIRECTORIES);
        explorador.setSelectedFile(new File("C:\\config.properties"));
        
        int seleccion = explorador.showSaveDialog(null);
//analizamos la respuesta
        switch (seleccion) {
            case JFileChooser.APPROVE_OPTION:
                File archivo = explorador.getSelectedFile();
                ruta = archivo.getAbsolutePath();
                Deb.consola("Ruta:  " + ruta);
                //seleccionó abrir
                break;
            
            case JFileChooser.CANCEL_OPTION:
                //dio click en cancelar o cerro la ventana
                ruta = "";
                break;
            
            case JFileChooser.ERROR_OPTION:
                //llega aqui si sucede un error
                ruta = "";
                JOptionPane.showMessageDialog(null, "Error al Seleccionar Direcctorio");
                break;
        }
        return ruta;
    }
    
    public static void EscribieConfigIp(String ruta, String Ip) {
        
        String os = System.getProperty("os.name");
        //Deb.consola("ClasesAuxiliares.NewArchivo.EscribieConfigIP()  : "+os);

//        if( os.contains("Windows")){
//        //ruta="C://config.properties";
//        ruta="D://config.properties";
//        }
//        if( os.contains("Linux")){
//        ruta="//opt//config.properties";
//        }
        File archivo = new File(ruta);
        BufferedWriter bw = null;
        if (archivo.exists()) {
            try {
                bw = new BufferedWriter(new FileWriter(archivo));
                bw.write("servidor=" + Ip);
                bw.newLine();
                bw.write("ruta=" + ruta);
                
                bw.close();
                
            } catch (IOException ex) {
                Logger.getLogger(NewConfigfile.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                
            }
            
        } else {
            
            try {
                bw = new BufferedWriter(new FileWriter(archivo));
                bw.write("servidor=" + Ip);
                bw.newLine();
                bw.write("ruta=" + ruta);
                
                bw.close();
            } catch (IOException ex) {
                Logger.getLogger(NewConfigfile.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
    
    public static void crearArchivo(String ruta, String ip) {
        //Deb.consola("ClasesAuxiliares.NewConfigfile.crearArchivo()ruta>:  " + ruta);
        
        if (ruta.contains(".properties")) {
            ruta = ruta;// + "\\config.porperties";
        } else {
            ruta = ruta + "\\config.porperties";
        }
        
        String servidor = null;
        String dirAchivo = null;
        ConfigSofia config = new ConfigSofia();
        ConfigDao configDao = new ConfigDao();
        File archivo = new File(ruta);
        BufferedWriter bw = null;
        if (archivo.exists()) {
            try {
                bw = new BufferedWriter(new FileWriter(archivo));
                bw.write("servidor=" + ip);
                bw.newLine();
                bw.write("ruta=" + ruta);
//                configDao.modificar(config);
                bw.close();
                
            } catch (IOException ex) {
                Logger.getLogger(NewConfigfile.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                
            }
            
        } else {
            
            try {
                bw = new BufferedWriter(new FileWriter(archivo));
                bw.write("servidor=" + ip);
                bw.newLine();
                bw.write("ruta=" + ruta);
                bw.close();
            } catch (IOException ex) {
                Logger.getLogger(NewConfigfile.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
    
    public static void main(String[] args) throws IOException {
        String a = selectDirectorio();
        crearArchivo(a, "192.168.56.1");
        //  EscribieConfigIP("192.168.56.1");

        JFileChooser explorador = new JFileChooser("\\home\\");
        explorador.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
        //     int seleccion  = explorador.showSaveDialog(this);
////analizamos la respuesta
//        switch (seleccion) {
//            case JFileChooser.APPROVE_OPTION:
//                File archivo = explorador.getCurrentDirectory();
//                String ruta = archivo.getPath();
//                Deb.consola("llllllClasesAuxiliares.NewArchivo.main()ryta:"+ruta);
//                //seleccionó abrir
//                break;
//
//            case JFileChooser.CANCEL_OPTION:
//                //dio click en cancelar o cerro la ventana
//                break;
//
//            case JFileChooser.ERROR_OPTION:
//                //llega aqui si sucede un error
//                break;
//        }
//        String ruta = "/home/mario/archivo.txt";
//        File archivo = new File(ruta);
//        BufferedWriter bw;
//        if (archivo.exists()) {
//            bw = new BufferedWriter(new FileWriter(archivo));
//            bw.write("El fichero de texto ya estaba creado.");
//        } else {
//            bw = new BufferedWriter(new FileWriter(archivo));
//            bw.write("Acabo de crear el fichero de texto.");
//        }
//        bw.close();
    }
    
}
