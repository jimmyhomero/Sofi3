package Controlador;

import ClasesAuxiliares.NewConfigfile;
import Vista.Usuarios.ErrorConexion;
import static login.login.cerrar;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author USUARIO
 */
public class Coneccion {

    public  Connection con, conN;
    public final String JDBC_RIVER = "com.mysql.jdbc.Driver";
    public static String bdd = "mysql";
    //public static String bdd = "aaaaa";
    public static String host = null;
    //private final String URL = "jdbc:mysql://localhost/mysql";     
    public static String user = "root";
    public static String pass = "miguel66677710101418/2=golosos";
    public static String usuarioApp = "";
    public static String passwordAPp = "";
    public static String equipo = "";
    public static String rutaConfig = null;
    public static boolean sesionok = false;
    public static boolean sesionokN = false;

    public Connection getCnx() {
        return con;
    }

    public void setCnx(Connection cnx) {
        con = cnx;
    }
    public Connection getCnxNube() {
        return conN;
    }

    public void setCnxNube(Connection cnxNube) {
        conN = cnxNube;
    }

//    public static String getUsuarioApp() {
//        return usuarioApp;
//    }
//
//    public static void setUsuarioApp(String usuarioApp) {
//        Coneccion.usuarioApp = usuarioApp;
//    }

    public  Connection conectar() {
        if (con == null) {
            try {
//             configuracionInicial ci = new configuracionInicial();
                if (sesionok == false) {
                    host = Ejemplo.getPrpertyValue("servidor");
                    rutaConfig = Ejemplo.getPrpertyValue("ruta");
                }

                if (!host.equals("error")) {                  
                    System.out.println("Controlador.Coneccion.conectar()hostttt: " + host);
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://" + host + "/" + bdd, "root", "miguel66677710101418/2=golosos");
                    System.out.println("Controlador.Coneccion.conectar()con: "+con);
                    if (con != null) {
                        sesionok = true;
                    }
                    
                } else {
                    con = null;                    
                }
            } catch (SQLException ex) {

            } catch (ClassNotFoundException ex) {
                throw new ClassCastException(ex.getMessage());
            }
        }
        return con;
    }
    public  Connection conectarNube() {
        if (conN == null) {
            try {                                    
                    Class.forName("com.mysql.jdbc.Driver");
                    conN = DriverManager.getConnection("jdbc:mysql://compueconomia.com.ec/clientes" , "root", "miguel66677710101418/2=golosos");
                    
                    
            } catch (SQLException ex) {

            } catch (ClassNotFoundException ex) {
                throw new ClassCastException(ex.getMessage());
            }
        }
        return conN;
    }

    public  void cerrar() {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println("Controlador.Coneccion.cerrar()" + ex);
                //  Logger.getLogger(Coneccion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public  void cerrarNube() {
        if (conN != null) {
            try {
                conN.close();
            } catch (SQLException ex) {
                
            }
        }
    }
}