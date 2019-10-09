/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.Color;
import Vista.Principal;
import Vlidaciones.ProgressBar;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author USUARIO
 */
public class ColorDao extends Coneccion {

    ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    String tabla = "color";
    private ArrayList<Color> lista = new ArrayList<Color>();

    public Integer guardar(Color tarea) {
        Integer CodigoThisInsert = null;
        try {
            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (color ) VALUES(?)", Statement.RETURN_GENERATED_KEYS);
            consulta.setString(1, tarea.getColor().toUpperCase());
            consulta.executeUpdate();
            ResultSet rs = consulta.getGeneratedKeys();
            if (rs.next()) {
                CodigoThisInsert = rs.getInt(1);
            }
        } catch (SQLException ex) {
            msg.setProgressBar_mensajae("Error..!! " + ex);

        } finally {
            this.cerrar();
        }
        return CodigoThisInsert;
    }

    public ArrayList<Color> listarBuscarConCodigo(Integer cod) {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla + " where codigo = " + cod + " order BY color");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Color per = new Color();
                per.setCodigo(rs.getInt("Codigo"));
                per.setColor(rs.getString("color"));
                

                this.lista.add(per);
            }

        } catch (Exception ex) {
            msg.setMensaje(ex.toString());
            //System.out.println("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }

    public ArrayList<Color> listar() {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla + " order BY color");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Color per = new Color();
                per.setCodigo(rs.getInt("Codigo"));
                per.setColor(rs.getString("color"));                

                this.lista.add(per);
            }

        } catch (Exception ex) {
            msg.setMensaje(ex.toString());
            //System.out.println("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }

    public Color buscarConID(Integer id) {
        ResultSet rs;
        Color u = new Color();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla + " where codigo = " + id);
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Color per = new Color();
                per.setCodigo(rs.getInt("Codigo"));
                per.setColor(rs.getString("color"));                
                u = per;
            }

        } catch (Exception ex) {
            msg.setProgressBar_mensajae(ex.toString());
        } finally {
            this.cerrar();
        }

        return u;
    }
    public Color buscarConMarca(String marca) {
        ResultSet rs;
        Color u = new Color();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla + " where color = '" + marca+"'");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Color per = new Color();
                per.setCodigo(rs.getInt("Codigo"));
                per.setColor(rs.getString("color"));
                
                u = per;
            }

        } catch (Exception ex) {
            msg.setProgressBar_mensajae(ex.toString());
            u=null;
        } finally {
            this.cerrar();
        }

        return u;
    }

    public ResultSet listar_table(String sql) {
        //
        ResultSet rs = null;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall(sql);
            rs = st.executeQuery();
        } catch (Exception ex) {
            msg.setProgressBar_mensajae(ex.toString());
        } finally {
            //  this.cerrar();
        }

        return rs;

    }

    public void eliminar(Color persona) throws Exception {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("DELETE from " + tabla
                    + " WHERE Codigo=?");
            st.setInt(1, persona.getCodigo());
            st.executeUpdate();
        } catch (SQLException e) {
            msg.setProgressBar_mensajae("Error..!! " + e);
        } finally {
            this.cerrar();
        }

    }

}
