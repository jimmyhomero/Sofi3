/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.Marcas;
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
public class MarcasDao extends Coneccion {

    ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    String tabla = "Marcas";
    private ArrayList<Marcas> lista = new ArrayList<Marcas>();

    public Integer guardar(Marcas tarea) {
        Integer CodigoThisInsert = null;
        try {
            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (marca , descripcion) VALUES(?,?)", Statement.RETURN_GENERATED_KEYS);
            consulta.setString(1, tarea.getMarca().toUpperCase());
            consulta.setString(2, tarea.getDescripcion().toUpperCase());
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

    public DefaultTableModel Buscar_table(String columna, String value) {
        DefaultTableModel modelo = null;

        String[] titulos
                = {"Codigo", "Marcas", "Descripcion"};
        String[] registros = new String[3];
        modelo = new DefaultTableModel(null, titulos) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // make read only fields except column 0,13,14
                //  return column == 0 || column == 13 || column == 14;
                return false;
            }
        };

        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall("Select * from " + tabla + " where " + columna + " like '%" + value + "%'");
            //System.out.println("Controlador.CUsuarios.Buscar_table()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {

                registros[0] = String.valueOf(rs.getInt("Codigo"));
                registros[1] = rs.getString("Marca");
                registros[2] = rs.getString("Descripcion");
                modelo.addRow(registros);

            }

        } catch (Exception ex) {
            msg.setProgressBar_mensajae(ex.toString());
        } finally {
            this.cerrar();
        }

        return modelo;
    }

    public DefaultTableModel Buscar_table_only_Activos() {
        DefaultTableModel modelo = null;
        String sql = "select * from Marcas  order BY Marca";
        String[] titulos
                = {"Codigo", "Marcas", "Descripcion"};
        String[] registros = new String[3];
        modelo = new DefaultTableModel(null, titulos) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // make read only fields except column 0,13,14
                //  return column == 0 || column == 13 || column == 14;
                return false;
            }
        };

        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall(sql);
            System.out.println("Controlador.CUsuarios.Buscar_table()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {

                registros[0] = String.valueOf(rs.getInt("Codigo"));
                registros[1] = rs.getString("Marca");
                registros[2] = rs.getString("Descripcion");
                modelo.addRow(registros);

            }

        } catch (Exception ex) {

            msg.setProgressBar_mensajae("Error..!! " + ex);

        } finally {
            this.cerrar();
        }

        return modelo;
    }

    public void modificar(Marcas persona) {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("UPDATE " + tabla + " SET "
                    + "Marca = ?, "
                    + "Descripcion = ? "
                    + "where codigo = ?");
            st.setString(1, persona.getMarca().toUpperCase());
            st.setString(2, persona.getDescripcion().toUpperCase());
            st.setDouble(3, persona.getCodigo());
            String sql = st.toString();

            st.executeUpdate();

            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
        } catch (SQLException e) {
            msg.setProgressBar_mensajae(e.toString());
        } finally {
            this.cerrar();
        }

    }

    public ArrayList<Marcas> listarBuscarConCodigo(Integer cod) {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla + " where codigo = " + cod + " order BY Marca");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Marcas per = new Marcas();
                per.setCodigo(rs.getInt("Codigo"));
                per.setMarca(rs.getString("Marca"));
                per.setDescripcion(rs.getString("Descripcion"));

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

    public ArrayList<Marcas> listar() {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla + " order BY Marca");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Marcas per = new Marcas();
                per.setCodigo(rs.getInt("Codigo"));
                per.setMarca(rs.getString("Marca"));
                per.setDescripcion(rs.getString("Descripcion"));

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

    public Marcas buscarConID(Integer id) {
        ResultSet rs;
        Marcas u = new Marcas();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla + " where codigo = " + id);
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Marcas per = new Marcas();
                per.setCodigo(rs.getInt("Codigo"));
                per.setMarca(rs.getString("Marca"));
                per.setDescripcion(rs.getString("Descripcion"));
                u = per;
            }

        } catch (Exception ex) {
            msg.setProgressBar_mensajae(ex.toString());
        } finally {
            this.cerrar();
        }

        return u;
    }
    public Marcas buscarConMarca(String marca) {
        ResultSet rs;
        Marcas u = new Marcas();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla + " where marca = '" + marca+"'");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Marcas per = new Marcas();
                per.setCodigo(rs.getInt("Codigo"));
                per.setMarca(rs.getString("Marca"));
                per.setDescripcion(rs.getString("Descripcion"));
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

    public void eliminar(Marcas persona) throws Exception {
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