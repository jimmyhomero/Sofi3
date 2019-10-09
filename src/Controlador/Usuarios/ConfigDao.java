/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.ConfigSofia;
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
public class ConfigDao extends Coneccion {
    
    
    ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    String tabla = "Config";
    private ArrayList<ConfigSofia> lista = new ArrayList<ConfigSofia>();

    public void guardar(ConfigSofia tarea) {
        try {
            this.conectar();
            PreparedStatement consulta;
            
            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (nombre,valor1,valor2,valor3,valor4,valor5,valor6) VALUES(?,?,?,?,?,?,?)");
            consulta.setString(1, tarea.getNombre().toUpperCase());
            consulta.setString(2, tarea.getValor1().toUpperCase());
            consulta.setString(3, tarea.getValor2().toUpperCase());
            consulta.setString(4, tarea.getValor3().toUpperCase());
            consulta.setString(5, tarea.getValor4().toUpperCase());
            consulta.setString(6, tarea.getValor5().toUpperCase());
            consulta.setString(7, tarea.getValor6().toUpperCase());
            
            

            consulta.executeUpdate();
        } catch (SQLException ex) {
            msg.setProgressBar_mensajae("Error..!! " + ex);
            
        } finally {
            this.cerrar();
        }
    }
 
    public DefaultTableModel Buscar_table_like(String columna, String value) {
        DefaultTableModel modelo = null;

        String[] titulos
                = {"Codigo", "Nombre de Config", "Valor1", "Valor2", "Valor3", "Valor4", "Valor5", "Valor6"};
        String[] registros = new String[8];
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
                registros[1] = rs.getString("Nombre");
                registros[2] = rs.getString("valor1");
                registros[3] = rs.getString("valor2");
                registros[4] = rs.getString("valor3");
                registros[5] = rs.getString("valor4");
                registros[6] = rs.getString("valor5");
                registros[7] = rs.getString("valor6");
                
                
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
        String sql="select * from Config  order BY nombre";
        
        String[] titulos
                = {"Codigo", "Nombre de Config", "Valor1", "Valor2", "Valor3", "Valor4", "Valor5", "Valor6"};
        String[] registros = new String[8];
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
                registros[1] = rs.getString("Nombre");
                registros[2] = rs.getString("valor1");
                registros[3] = rs.getString("valor2");
                registros[4] = rs.getString("valor3");
                registros[5] = rs.getString("valor4");
                registros[6] = rs.getString("valor5");
                registros[7] = rs.getString("valor6");
                modelo.addRow(registros);
                
            }
            
        } catch (Exception ex) {
            
            msg.setProgressBar_mensajae("Error..!! " + ex);
            
        } finally {
            this.cerrar();
        }
        
        return modelo;
    }
    
    public void modificar(ConfigSofia persona) {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("UPDATE " + tabla + " SET "
                    + "valor1 = ?, "
                    + "valor2 = ?, "
                    + "valor3 = ?, "
                    + "valor4 = ?, "
                    + "valor6 = ?, "
                    + "valor5 = ? "
                    + "where nombre = ?");
            st.setString(1, persona.getValor1());
            st.setString(2, persona.getValor2());
            st.setString(3, persona.getValor3());
            st.setString(4, persona.getValor4());
            st.setString(5, persona.getValor5());
            st.setString(6, persona.getValor6());
            st.setString(7, persona.getNombre());
            String sql = st.toString();
            
            st.executeUpdate();

            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
        } catch (SQLException e) {
            System.out.println("Controlador.Usuarios.ConfigDao.modificar(): "+e);
            //msg.setProgressBar_mensajae(e.toString());
        } finally {
            this.cerrar();
        }
        
    }
   
     public ArrayList<ConfigSofia> listarBuscarConCodigo(Integer cod) {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla+" where codigo = "+cod+" order BY nombre LIMIT 0, 50");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                ConfigSofia per = new ConfigSofia();
                per.setCodigo(rs.getInt("Codigo"));
                per.setNombre(rs.getString("nombre"));
                per.setValor1(rs.getString("valor1"));
                per.setValor2(rs.getString("valor2"));
                per.setValor3(rs.getString("valor3"));
                per.setValor4(rs.getString("valor4"));
                per.setValor5(rs.getString("valor5"));
                per.setValor6(rs.getString("valor6"));
                
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
    public ArrayList<ConfigSofia> listar() {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla+" order BY nombre LIMIT 0, 50");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                ConfigSofia per = new ConfigSofia();
                per.setCodigo(rs.getInt("Codigo"));
                per.setNombre(rs.getString("nombre"));
                per.setValor1(rs.getString("valor1"));
                per.setValor2(rs.getString("valor2"));
                per.setValor3(rs.getString("valor3"));
                per.setValor4(rs.getString("valor4"));
                per.setValor5(rs.getString("valor5"));
                per.setValor6(rs.getString("valor6"));
                
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
    
    public ConfigSofia buscarConID(Integer id) {
        ResultSet rs;
        ConfigSofia u = new ConfigSofia();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla + " where codigo = " + id );
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                ConfigSofia per = new ConfigSofia();
                per.setCodigo(rs.getInt("Codigo"));
                per.setNombre(rs.getString("nombre"));
                per.setValor1(rs.getString("valor1"));
                per.setValor2(rs.getString("valor2"));
                per.setValor3(rs.getString("valor3"));
                per.setValor4(rs.getString("valor4"));
                per.setValor5(rs.getString("valor5"));
                per.setValor6(rs.getString("valor6"));
                u = per;
            }
            
        } catch (Exception ex) {
            msg.setProgressBar_mensajae(ex.toString());            
        } finally {
            this.cerrar();
        }
        
        return u;
    }
//     public ResultSet listar_table(String sql) {
//        //
//        ResultSet rs = null;
//        try {
//            this.conectar();
//            PreparedStatement st;
//            st = this.getCnx().prepareCall(sql  );
//            rs = st.executeQuery();
//        } catch (Exception ex) {
//          msg.setProgressBar_mensajae(ex.toString());
//        } finally {
//          //  this.cerrar();
//        }
//
//        return rs;
//        
//    }
    public void eliminar(ConfigSofia persona) throws Exception {
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
