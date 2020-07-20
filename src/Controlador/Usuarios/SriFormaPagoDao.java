/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.SriFormaPago;
import Vlidaciones.ProgressBar;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author USUARIO
 */
public class SriFormaPagoDao extends Coneccion {

    ArrayList<SriFormaPago> lista = new ArrayList<>() ;

    public void guardar(SriFormaPago tarea) {
        try {
            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement("INSERT INTO `sri_formas_pago`(`id`,`formaPago`) VALUES ( ?,?);");
            consulta.setString(1, tarea.getFormaPago().toUpperCase());
            consulta.setString(2, tarea.getId());
            consulta.executeUpdate();
        } catch (SQLException ex) {
            ProgressBar.mostrarMensajeAzul("Error..!! " + ex);
        } finally {
            this.cerrar();
        }
    }

    public ArrayList<SriFormaPago> listar() {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from sri_formas_pago order BY id");
            rs = st.executeQuery();

            while (rs.next()) {
                SriFormaPago per = new SriFormaPago();
                per.setCodigo(rs.getInt("Codigo"));
                per.setId(rs.getString("id"));
                per.setFormaPago(rs.getString("formaPago"));

                lista.add(per);
            }
        } catch (Exception ex) {
            ProgressBar.mostrarMensajeAzul("Error..!! " + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }

    public SriFormaPago findFormaPagoByNombre(String nombre) {
        ResultSet rs;
        SriFormaPago per = new SriFormaPago();
        try {
                
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from sri_formas_pago  where formaPago = "+nombre+" order BY id");
            rs = st.executeQuery();

            while (rs.next()) {
            
                per.setCodigo(rs.getInt("Codigo"));
                per.setId(rs.getString("id"));
                per.setFormaPago(rs.getString("formaPago"));

                
            }
        } catch (Exception ex) {
            ProgressBar.mostrarMensajeAzul("Error..!! " + ex);
        } finally {
            this.cerrar();
        }

        return per;
    }

}
