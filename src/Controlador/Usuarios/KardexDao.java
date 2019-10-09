/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.Kardex;
import Vista.Principal;
import Vlidaciones.ProgressBar;
import java.awt.Font;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;

/**
 *
 * @author USUARIO
 */
public class KardexDao extends Coneccion {
ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    private ArrayList<Kardex> lista = new ArrayList<Kardex>();
    private final String tabla = "kardex";
    //private Conec mysql = new conexion(); //Instanciando la clase conexion
    //private Connection cn = mysql.conectar();

    public void guardar(Kardex tarea) {
        try {
            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (fecha, bodega,"
                    + " detalle, incantidad, incosto,"
                    + " inpvp, outcantidad, outcosto,"
                    + "outpvp,saldocantidad,saldocosto,"
                    + "saldopvp,productos_Codigo) VALUES(?,?,?,?,?,?,?, ?, ?,?,?,?,?)");            
            long d = tarea.getFecha().getTime();            
            java.sql.Date fecha = new java.sql.Date(d);
            consulta.setDate(1, fecha);
            consulta.setString(2, tarea.getBodega());
            consulta.setString(3, tarea.getDetalle());
            consulta.setString(4, tarea.getIncantidad());
            consulta.setString(5, tarea.getIncosto());
            consulta.setString(6, tarea.getInpvp());
            consulta.setString(7, tarea.getOutcantidad());
            consulta.setString(8, tarea.getOutcosto());
            consulta.setString(9, tarea.getOutpvp());
            consulta.setString(10, tarea.getSaldocantidad());
            consulta.setString(11, tarea.getSaldocosto());
            consulta.setString(12, tarea.getSaldopvp());
            consulta.setInt(13, tarea.getProductos_Codigo());            
            System.out.println("Controlador.CUsuarios.guardar()" + consulta);
            consulta.executeUpdate();
        } catch (SQLException ex) {
            msg.setProgressBar_mensajae(ex.toString());
            System.out.println("Controlador.CUsuarios.guardar()" + ex);
        } finally {
            this.cerrar();
        }
    }
    public PreparedStatement guardarReturnPreparedStatement(Kardex tarea) {
        PreparedStatement consulta=null;
        try {
            
            this.conectar();
            

            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (fecha, bodega,"
                    + " detalle, incantidad, incosto,"
                    + " inpvp, outcantidad, outcosto,"
                    + "outpvp,saldocantidad,saldocosto,"
                    + "saldopvp,productos_Codigo) VALUES(?,?,?,?,?,?,?, ?, ?,?,?,?,?)");            
            long d = tarea.getFecha().getTime();            
            java.sql.Date fecha = new java.sql.Date(d);
            consulta.setDate(1, fecha);
            consulta.setString(2, tarea.getBodega());
            consulta.setString(3, tarea.getDetalle());
            consulta.setString(4, tarea.getIncantidad());
            consulta.setString(5, tarea.getIncosto());
            consulta.setString(6, tarea.getInpvp());
            consulta.setString(7, tarea.getOutcantidad());
            consulta.setString(8, tarea.getOutcosto());
            consulta.setString(9, tarea.getOutpvp());
            consulta.setString(10, tarea.getSaldocantidad());
            consulta.setString(11, tarea.getSaldocosto());
            consulta.setString(12, tarea.getSaldopvp());
            consulta.setInt(13, tarea.getProductos_Codigo());            
            System.out.println("Controlador.CUsuarios.guardar()" + consulta);
        //    consulta.executeUpdate();
        } catch (SQLException ex) {
            msg.setProgressBar_mensajae(ex.toString());
            System.out.println("Controlador.CUsuarios.guardar()" + ex);
        } finally {
            this.cerrar();
        }
        return consulta;
    }
    

//    public void modificar(Usuarios persona)  {
//        try {
//            this.conectar();
//            PreparedStatement st = this.con.prepareStatement("UPDATE Usuarios SET "
//                    + "Cedula = ?, "
//                    + "Nombres = ?, "
//                    + "Telefono = ?, "
//                    + "Celular= ?, "
//                    + "Mail= ?, "
//                    + "Direccion = ?, "
//                    + "Usuario = ?, "
//                    + "Password = ?, "
//                    + "Estado = ?, "  
//                    + "Tipo_Usuario_codigo = ? "  
//                    + "WHERE Codigo=?");
//            st.setString(1, persona.getCedula().toUpperCase());
//            st.setString(2, persona.getNombre().toUpperCase());
//            st.setString(3, persona.getTelefono());
//            st.setString(4, persona.getCelular());
//            st.setString(5, persona.getMail().toLowerCase());
//            st.setString(6, persona.getDireccion().toUpperCase());
//            st.setString(7, persona.getUsuario().toUpperCase());
//            st.setString(8, persona.getPassword().toUpperCase());
//            st.setString(9, persona.getEstado());
//            st.setInt(10, persona.getTipo_Usuario_codigo());
//            st.setInt(11, persona.getCodigo());
//             String sql = st.toString();
//            System.out.println("Controlador.Usuarios.CUsuarios.modificar()"+ sql);
//            st.executeUpdate();
//            Principal.jProgressBar2.setString("eeeeeeeeeeeee");
//            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
//        } catch (SQLException e) {
//            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error" + e + sql, "Error al modificar Registro" + e.toString()));
//System.out.println("Controlador.CUsuarios.guardar()" + e);
//        } finally {
//            this.cerrar();
//        }
//
//    }

//    public List<Kardex> listar() {
//        ResultSet rs;
//        try {
//            this.conectar();
//            PreparedStatement st;
//            st = this.getCnx().prepareCall("select * from kardex where " );
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//                Usuarios per = new Usuarios();
//                per.setCodigo(rs.getInt("Codigo"));
//                per.setCedula(rs.getString("Cedula"));
//                per.setNombre(rs.getString("Nombres"));
//                per.setTelefono(rs.getString("telefono"));
//                per.setCelular(rs.getString("celular"));
//                per.setMail(rs.getString("Mail"));
//                per.setDireccion(rs.getString("Direccion"));
//                per.setUsuario(rs.getString("Usuario"));
//                per.setPassword(rs.getString("Password"));
//                per.setEstado(rs.getString("estado"));
//                per.setTipo_Usuario_codigo(rs.getInt("Tipo_Usuario_codigo"));
//                //per.setObservaciones(rs.getString("PersonaObservaciones"));
//                //per.setFechaN(rs.getDate("PersonaFN").toString());
//                //System.out.println("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
//                this.lista.add(per);
//            }
//
//        } catch (Exception ex) {
//            System.out.println("Controlador.CUsuarios.listar()" + ex);
//        } finally {
//            this.cerrar();
//        }
//
//        return lista;
//    }
//    public ArrayList<Usuarios> listarVendedores() {
//        ResultSet rs;
//        try {
//            this.conectar();
//            PreparedStatement st;
//            st = this.getCnx().prepareCall("select usuarios.*,tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo order BY usuarios.Nombres LIMIT 0, 50" );
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//                Usuarios per = new Usuarios();
//                per.setCodigo(rs.getInt("Codigo"));
//                per.setCedula(rs.getString("Cedula"));
//                per.setNombre(rs.getString("Nombres"));
//                per.setTelefono(rs.getString("telefono"));
//                per.setCelular(rs.getString("celular"));
//                per.setMail(rs.getString("Mail"));
//                per.setDireccion(rs.getString("Direccion"));
//                per.setUsuario(rs.getString("Usuario"));
//                per.setPassword(rs.getString("Password"));
//                per.setEstado(rs.getString("estado"));
//                per.setTipo_Usuario_codigo(rs.getInt("Tipo_Usuario_codigo"));
//                //per.setObservaciones(rs.getString("PersonaObservaciones"));
//                //per.setFechaN(rs.getDate("PersonaFN").toString());
//                //System.out.println("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
//                this.lista.add(per);
//            }
//
//        } catch (Exception ex) {
//            System.out.println("Controlador.CUsuarios.listar()" + ex);
//        } finally {
//            this.cerrar();
//        }
//
//        return lista;
//    }

//    public Usuarios buscarConID(Integer id) {
//        ResultSet rs;
//        Usuarios u = new Usuarios();
//        try {
//            this.conectar();
//            PreparedStatement st;
////            select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo
////            select usuarios.*, tipos_usuarios.codigo,tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo where usuarios.codigo = 1
//
//            st = this.getCnx().prepareCall("select usuarios.*,tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo where usuarios.codigo = "+ id+" order BY usuarios.Nombres LIMIT 0, 50");
//            //select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo
//
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//                Usuarios per = new Usuarios();
//                per.setCodigo(rs.getInt("Codigo"));
//                per.setCedula(rs.getString("Cedula"));
//                per.setNombre(rs.getString("Nombres"));
//                per.setTelefono(rs.getString("telefono"));
//                per.setCelular(rs.getString("celular"));
//                per.setMail(rs.getString("Mail"));
//                per.setDireccion(rs.getString("Direccion"));
//                per.setUsuario(rs.getString("Usuario"));
//                per.setPassword(rs.getString("Password"));
//                per.setEstado(rs.getString("estado"));
//                per.setTipo_Usuario_codigo(rs.getInt("Tipo_Usuario_codigo"));
//                
//                //per.setObservaciones(rs.getString("PersonaObservaciones"));
//                //per.setFechaN(rs.getDate("PersonaFN").toString());
//                //System.out.println("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
//                u = per;
//            }
//
//        } catch (Exception ex) {
//            System.out.println("Controlador.CUsuarios.BuscarConId()" + ex);
//        } finally {
//            this.cerrar();
//        }
//
//        return u;
//    }

//    public Usuarios buscarConCedula(String cedula) {
//        ResultSet rs;
//        Usuarios u = new Usuarios();
//        try {
//            this.conectar();
//            PreparedStatement st;
//            st = this.getCnx().prepareCall("select usuarios.*,tipos_usuarios.tipo from usuarios"
//                    + "inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo "
//                    + "where usuarios.cedula like '%"+cedula+ "%' order BY usuarios.Nombres LIMIT 0, 50");
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//                Usuarios per = new Usuarios();
//                per.setCodigo(rs.getInt("Codigo"));
//                per.setCedula(rs.getString("Cedula"));
//                per.setNombre(rs.getString("Nombres"));
//                per.setTelefono(rs.getString("telefono"));
//                per.setCelular(rs.getString("celular"));
//                per.setMail(rs.getString("Mail"));
//                per.setDireccion(rs.getString("Direccion"));
//                per.setUsuario(rs.getString("Usuario"));
//                per.setPassword(rs.getString("Password"));
//                per.setEstado(rs.getString("estado"));
//                per.setTipo_Usuario_codigo(rs.getInt("Tipo_Usuario_codigo"));
//                
//                //per.setObservaciones(rs.getString("PersonaObservaciones"));
//                //per.setFechaN(rs.getDate("PersonaFN").toString());
//                //System.out.println("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
//                u = per;
//            }
//
//        } catch (Exception ex) {
//            System.out.println("Controlador.CUsuarios.BuscarConCedula()" + ex);
//        } finally {
//            this.cerrar();
//        }
//
//        return u;
//    }

//    public void eliminar(Usuarios persona) throws Exception {
//        try {             
//            this.conectar();
//            PreparedStatement st =this.con.prepareStatement("DELETE from Usuarios "
//				+ "WHERE Codigo=?");			            
//            st.setDouble(1,persona.getCodigo());
//            st.executeUpdate();
//        } catch (SQLException e) {
//      msg.setProgressBar_mensajae("Error..!! "+ e);            
//        } finally {
//            this.cerrar();
//        }
//        
//    }   
//
//    
//    public DefaultTableModel Buscar_table(String columna, String value) {
//        DefaultTableModel modelo = null;
//  String[] titulos
//                = {"Codigo", "Cedula", "Nombres",
//                    "Usuario", "Telefono",
//                    "E-Mail", "Direccion", "Estado", "Tipo" };
//        String[] registros = new String[9];
//        modelo = new DefaultTableModel(null, titulos) {
//            @Override
//            public boolean isCellEditable(int row, int column) {
//                // make read only fields except column 0,13,14
//                //  return column == 0 || column == 13 || column == 14;
//                return false;
//            }
//        };
//
//        ResultSet rs;
//        try {
//            this.conectar();
//            PreparedStatement st;
//            st = this.getCnx().prepareCall("select usuarios.*,tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo where usuarios."+columna+"  like '%"+value+ "%' order BY usuarios.Nombres LIMIT 0, 50" );
//
//          //  st = this.getCnx().prepareCall("Select * from " + tabla + " where " + columna + " like '%" + value + "%'");
//            System.out.println("Controlador.CUsuarios.Buscar_table()" + st.toString());
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//
//                registros[0] = String.valueOf(rs.getInt("Codigo"));
//                registros[1] = String.valueOf(rs.getDouble("Cedula"));
//                registros[2] = rs.getString("Nombres");
//                registros[3] = rs.getString("Usuario");
//                registros[4] = rs.getString("telefono");
//                registros[5] = rs.getString("Mail");
//                registros[6] = rs.getString("Direccion");
//                registros[7] = rs.getString("Estado");
//                registros[8] = rs.getString("Tipo");
//                modelo.addRow(registros);
//                System.out.println("Controlador.CUsuarios.Buscar_table()" + registros[1]);
//
//                //per.setObservaciones(rs.getString("PersonaObservaciones"));
//                //per.setFechaN(rs.getDate("PersonaFN").toString());
//                //System.out.println("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
//            }
//
//        } catch (Exception ex) {
//            JOptionPane.showMessageDialog(null, ex+"hhhh");
//        } finally {
//            this.cerrar();
//        }
//
//        return modelo;
//    }
//    
//    public DefaultTableModel Buscar_table_only_Activos(String sql) {
//        DefaultTableModel modelo = null;
//
//        String[] titulos
//                = {"Codigo", "Cedula", "Nombres",
//                    "Usuario", "Telefono",
//                    "E-Mail", "Direccion", "Estado", "Tipo" };
//        String[] registros = new String[9];
//        modelo = new DefaultTableModel(null, titulos) {
//            @Override
//            public boolean isCellEditable(int row, int column) {
//                // make read only fields except column 0,13,14
//                //  return column == 0 || column == 13 || column == 14;
//                return false;
//            }
//        };
//
//        ResultSet rs;
//        try {
//            this.conectar();
//            PreparedStatement st;
//
//            st = this.getCnx().prepareCall(sql);
//            System.out.println("Controlador.CUsuarios.Buscar_table_Only()" + st.toString());
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//
//                registros[0] = String.valueOf(rs.getInt("Codigo"));
//                registros[1] = String.valueOf(rs.getDouble("Cedula"));
//                registros[2] = rs.getString("Nombres");
//                registros[3] = rs.getString("Usuario");
//                registros[4] = rs.getString("telefono");
//                registros[5] = rs.getString("Mail");
//                registros[6] = rs.getString("Direccion");
//                registros[7] = rs.getString("Estado");
//                registros[8] = rs.getString("Tipo");
//                modelo.addRow(registros);
//                System.out.println("Controlador.CUsuarios.Buscar_table_only()" + registros[1]);
//
//            }
//
//        } catch (Exception ex) {
//            JOptionPane.showMessageDialog(null, ex+"rrrrrrrrrrrrrr");
//        } finally {
//            this.cerrar();
//        }
//
//        return modelo;
//    }
//    
//    public ArrayList <Usuarios> GetLoginOk(String u, String p) throws Exception {
//        //Usuario us = new Usuario();
//        ArrayList<Usuarios> lista = new ArrayList();        
//          try {
//            String sql = "Select * from usuarios where usuario='"+u+"' and password='"+p+"'"; 
//            //String sql = "insert into persona  values (?,?,?,?,?)";            
//            this.conectar();              
//            PreparedStatement st = this.con.prepareStatement(sql);
//            
//            ResultSet rs = st.executeQuery();
//              while (rs.next()) {
//                  Usuarios per = new Usuarios();
//                  per.setCodigo(rs.getInt("codigo"));
//                  per.setNombre(rs.getString("nombres"));
//                  per.setUsuario(rs.getString("usuario"));
//                  per.setPassword(rs.getString("password"));
//                  per.setEstado(rs.getString("estado"));                  
//                  lista.add(per);
//              //    us=per;
//              }                 
//        } catch (Exception e) {
//     System.out.print(e+"fffff");
//            throw e;
//        } finally {
//            this.cerrar();
//        }    
//          return lista;
//    }
}
