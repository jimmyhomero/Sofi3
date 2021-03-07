/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.Config2;
import Modelo.ConfigSofia;
import Vista.alertas.alerta;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author USUARIO
 */
public class Config2Dao extends Coneccion {
 
    ArrayList<Config2> lista= new ArrayList<>();
     public void guardar(Config2 tarea) {
        try {
            this.conectar();
            PreparedStatement consulta;
            
            consulta = this.con.prepareStatement("INSERT INTO Config2 (nombre,valor1) VALUES(?,?)");
            consulta.setString(1, tarea.getNombre().toUpperCase());
            consulta.setString(2, tarea.getValor1().toUpperCase());
                        

            consulta.executeUpdate();
        } catch (SQLException ex) {
            alerta.menajes(ex.toString());
            
        } finally {
            this.cerrar();
        }
    }
 public void modificar(ConfigSofia persona) {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("UPDATE config2 SET "
                    + "valor1 = ?, "                  
                    + "where nombre = ?");
            st.setString(1, persona.getValor1());                        
            st.setString(2, persona.getNombre());
            String sql = st.toString();
            
            st.executeUpdate();

            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
        } catch (SQLException e) {
            alerta.menajes(e.toString());
            //msg.setProgressBar_mensajae(e.toString());
        } finally {
            this.cerrar();
        }
        
    }
   
    public ArrayList<Config2> listar() {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from config2 order BY nombre");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Config2 per = new Config2();
                per.setCodigo(rs.getInt("Codigo"));
                per.setNombre(rs.getString("nombre"));
                per.setValor1(rs.getString("valor1"));
                
                this.lista.add(per);
            }
            
        } catch (Exception ex) {
            alerta.menajes(ex.toString());
            //Deb.consola("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }
        
        return lista;
    }
     
}
