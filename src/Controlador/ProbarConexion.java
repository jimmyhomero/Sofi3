/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author USUARIO
 */
public class ProbarConexion  {

    public Connection con;
    public final String JDBC_RIVER = "com.mysql.jdbc.Driver";
    public static String bdd = "mysql";
    public static String host = null;
    public static String user = "root";
    public static String pass = "homerito2012";
   

    public  boolean testConeccion(String ip){
        
        this.host = ip;
        boolean exito = false;
        if (con==null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                try {
                    con = DriverManager.getConnection("jdbc:mysql://" + host + "/" + bdd, "root", "miguel66677710101418/2=golosos");
                    exito = true;
                } catch (SQLException ex) {
                    exito=false;
                }
                
            } catch (ClassNotFoundException ex) {
               // Logger.getLogger(ProbarConexion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return exito;
    }
    
}
