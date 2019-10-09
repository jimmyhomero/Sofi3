/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import Modelo.Usuarios;
import Vista.Usuarios.ConfigIp;
import Vista.Usuarios.ErrorConexion;
import java.awt.Frame;
import javax.swing.JOptionPane;

public class DaoEmpresaImpl extends Controlador.Coneccion {

    public ArrayList<String> getListEmpresa() {

        ArrayList<String> lista = new ArrayList();
        try {
            //String sql = "Select * from usuario where user='"+u+"' and password='"+p+"'"; 
            String sql = "show databases";

            if (this.conectar() != null) {
                PreparedStatement st = this.con.prepareStatement(sql);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {

                    String basename = rs.getString("database");
                    if (!basename.equals("mysql") & !basename.equals("information_schema") & !basename.equals("performance_schema") & !basename.equals("test") & !basename.equals("phpmyadmin")) {
                        lista.add(basename);
                    }
                }
            }else{
            lista=null;
            }
            
        } catch (Exception e) {
            System.out.println("ClasesAuxiliares.DaoEmpresaImpl.getListEmpresa()" + e.toString());
        } finally {
            this.cerrar();
        }
        return lista;
    }

}
