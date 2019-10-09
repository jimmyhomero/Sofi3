/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.Tipo_Usuario;
import Modelo.Usuarios;
import Vista.Principal;
import Vlidaciones.ProgressBar;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author USUARIO
 */
public class Tipo_UsuariosDao extends Coneccion {
    
    ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    String tabla = "tipos_Usuarios";
    private ArrayList<Tipo_Usuario> lista = new ArrayList<Tipo_Usuario>();

    public void guardar(Tipo_Usuario tarea) {
        try {
            this.conectar();
            PreparedStatement consulta;
            
            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (tipo, descripcion) VALUES(?,?)");
            consulta.setString(1, tarea.getTipo().toUpperCase());
            consulta.setString(2, tarea.getDescripcion().toUpperCase());
            //msg.setProgressBar_mensajae(consulta.toString());

            consulta.executeUpdate();
        } catch (SQLException ex) {
            msg.setProgressBar_mensajae("Error..!! " + ex);
            
        } finally {
            this.cerrar();
        }
    }
 
    public DefaultTableModel Buscar_table(String columna, String value) {
        DefaultTableModel modelo = null;

        String[] titulos
                = {"Codigo", "Tipo", "Descripcion"};
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
                registros[1] = String.valueOf(rs.getString("tipo"));
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
        String sql="select * from tipos_usuarios order by tipo LIMIT 0, 25";
        String[] titulos
                = {"Codigo", "Tipos", "Descripcion"};
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
                registros[1] = String.valueOf(rs.getString("Tipo"));
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
    
    public void modificar(Tipo_Usuario persona) {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("UPDATE " + tabla + " SET "
                    + "Tipo = ?, "
                    + "Descripcion = ?"
                    + "where codigo = ? ");
            st.setString(1, persona.getTipo().toUpperCase());
            st.setString(2, persona.getDescripcion().toUpperCase());
            st.setInt(3, persona.getCodigo());
            String sql = st.toString();
            System.out.println("Controlador.Usuarios.Tipo_UsuariosDao.modificar()"+sql);
            st.executeUpdate();

            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
        } catch (SQLException e) {
            System.out.println("Controlador.Usuarios.Tipo_UsuariosDao.modificar()"+e.toString());
            msg.setProgressBar_mensajae(e.toString());
        } finally {
            this.cerrar();
        }
        
    }
    
    public ArrayList<Tipo_Usuario> listar() {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla);
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Tipo_Usuario per = new Tipo_Usuario();
                per.setCodigo(rs.getInt("Codigo"));
                per.setTipo(rs.getString("Tipo"));
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
    
    public Tipo_Usuario buscarConID(Integer id) {
        ResultSet rs;
        Tipo_Usuario u = new Tipo_Usuario();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla + " where codigo = " + id);
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Tipo_Usuario per = new Tipo_Usuario();
                per.setCodigo(rs.getInt("Codigo"));
                per.setTipo(rs.getString("Tipo"));
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
     public ResultSet listar_table(String sql) {
        //
        ResultSet rs = null;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall(sql  );
            rs = st.executeQuery();
        } catch (Exception ex) {
          msg.setProgressBar_mensajae(ex.toString());
        } finally {
          //  this.cerrar();
        }

        return rs;
        
    }
    public void eliminar(Tipo_Usuario persona) throws Exception {
        try {             
            this.conectar();
            PreparedStatement st =this.con.prepareStatement("DELETE from "+tabla 
				+ " WHERE Codigo=?");			            
            st.setInt(1,persona.getCodigo());
            st.executeUpdate();
        } catch (SQLException e) {
      msg.setProgressBar_mensajae("Error..!! "+ e);            
        } finally {
            this.cerrar();
        }
        
    }   
    
}
