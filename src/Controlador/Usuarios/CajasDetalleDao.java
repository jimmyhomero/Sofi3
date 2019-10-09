/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.CajasDetalle;
import Vlidaciones.ProgressBar;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author USUARIO
 */
public class CajasDetalleDao extends Coneccion {

    ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    String tabla = "CajasDetalle";
    private ArrayList<CajasDetalle> lista = new ArrayList<CajasDetalle>();

    public void guardar(CajasDetalle tarea) {
        try {
            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (detalle,valor,tipo,documento,descripcion,codigoDocumento,cajas_codigo) VALUES(?,?,?,?,?,?,?)");
            consulta.setString(1, tarea.getDetalle().toUpperCase());
            consulta.setDouble(2, tarea.getValor());
            consulta.setString(3, tarea.getTipo());            
            consulta.setString(4, tarea.getDocumento());
            consulta.setString(5, tarea.getDescripcion());
//            long d = tarea.getFecha().getDate();
//            java.sql.Date fecha = new java.sql.Date(d);
//            consulta.setDate(6, fecha);
            consulta.setInt(6, tarea.getCodigoDocuemnto());
            consulta.setInt(7, tarea.getCajas_Codigo());
            consulta.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex+" seeee");
            msg.setProgressBar_mensajae("Error..!! " + ex);

        } finally {
            this.cerrar();
        }
    }
      public PreparedStatement guardarReturnPreparedStatemen(CajasDetalle tarea) {
          PreparedStatement consulta =null;
        try {
            this.conectar();
            

            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (detalle,valor,tipo,documento,descripcion,codigoDocumento,cajas_codigo) VALUES(?,?,?,?,?,?,?)");
            consulta.setString(1, tarea.getDetalle().toUpperCase());
            consulta.setDouble(2, tarea.getValor());
            consulta.setString(3, tarea.getTipo());            
            consulta.setString(4, tarea.getDocumento());
            consulta.setString(5, tarea.getDescripcion());
//            long d = tarea.getFecha().getDate();
//            java.sql.Date fecha = new java.sql.Date(d);
//            consulta.setDate(6, fecha);
            consulta.setInt(6, tarea.getCodigoDocuemnto());
            consulta.setInt(7, tarea.getCajas_Codigo());
            //consulta.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex+" seeee");
            msg.setProgressBar_mensajae("Error..!! " + ex);

        } finally {
            this.cerrar();
        }
        return consulta;
    }

//    public DefaultTableModel Buscar_table_like(String columna, String value) {
//        DefaultTableModel modelo = null;
//
//        String[] titulos
//                = {"Codigo", "Nombre Real", "Nombre Soft", "Usuario", "Responsable", "Ip", "Ubicacion", "Descripcion"};
//        String[] registros = new String[8];
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
//            st = this.getCnx().prepareCall("Select * from " + tabla + " where " + columna + " like '%" + value + "%'");
//            rs = st.executeQuery();
//            while (rs.next()) {
//                registros[0] = String.valueOf(rs.getInt("Codigo"));
//                registros[1] = rs.getString("NombreReal");
//                registros[2] = rs.getString("NombreSof");
//                registros[3] = rs.getString("Usuario");
//                registros[4] = rs.getString("responsable");
//                registros[5] = rs.getString("Ip");
//                registros[6] = rs.getString("Ubicacion");
//                registros[7] = rs.getString("Descripcion");
//
//                modelo.addRow(registros);
//
//            }
//
//        } catch (Exception ex) {
//            msg.setProgressBar_mensajae(ex.toString());
//        } finally {
//            this.cerrar();
//        }
//
//        return modelo;
//    }

    public DefaultTableModel Buscar_table_All() {
        DefaultTableModel modelo = null;
        String sql = "select * from Cajas  order BY codigo  ";

        String[] titulos
                = {"Codigo", "caja", "Descripcion", "estado", "fechaApertura", "fechaCierre", "SaldoInicial", "TotalCierre", "cajero"};
        String[] registros = new String[9];
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
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {

                registros[0] = String.valueOf(rs.getInt("Codigo"));
                registros[1] = rs.getString("caja");
                registros[2] = rs.getString("descripcion");

                registros[3] = rs.getString("estado");
                registros[4] = rs.getString("fechaApertura");
                registros[5] = rs.getString("fechaCierre");
                registros[6] = rs.getString("SaldoInicial");
                registros[7] = rs.getString("totalCierre");
                registros[8] = rs.getString("cajero");
                modelo.addRow(registros);

            }

        } catch (Exception ex) {

            msg.setProgressBar_mensajae("Error..!! " + ex);

        } finally {
            this.cerrar();
        }

        return modelo;
    }
//        public Cajas Buscar_Cajas_ID(Integer codigo) {
//        DefaultTableModel modelo = null;
//        String sql = "select * from Cajas  where codigo = "+codigo;
//Cajas caja = new Cajas();
//
//        ResultSet rs;
//        try {
//            this.conectar();
//            PreparedStatement st;
//
//            st = this.getCnx().prepareCall(sql);           
//            rs = st.executeQuery();
//            
//            while (rs.next()) {
//                Cajas registros = new Cajas();
//                registros.setCodigo(rs.getInt("Codigo"));
//                registros.setCaja( rs.getString("caja"));
//                registros.setDescripcion(rs.getString("descripcion"));
//
//                registros.setEstado(rs.getInt("estado"));
//                registros.setFechaApertura(rs.getDate("fechaApertura"));
//                registros.setFechaCierre(rs.getDate("fechaCierre"));
//                registros.setSaldoInicial( rs.getDouble("SaldoInicial"));
//                registros.setTotalCierre(rs.getDouble("totalCierre"));
//                registros.setCajer( rs.getString("cajero"));               
//            caja=registros;
//            }
//
//        } catch (Exception ex) {
//
//            msg.setProgressBar_mensajae("Error..!! " + ex);
//
//        } finally {
//            this.cerrar();
//        }
//
//        return caja;
//    }
//
//    public void modificar(Cajas persona) {
//        try {
//            this.conectar();
//            PreparedStatement st = this.con.prepareStatement("UPDATE " + tabla + " SET "
//                    + "caja = ?, "
//                    + "descripcion = ?, "
//                    + "estado = ?, "
//                    + "fechaApertura = ?, "
//                    + "fechaCierre = ?, "
//                    + "saldoInicial = ? "
//                    + "TotalCierre = ? "
//                    + "Cajero = ? "                    
//                    + "where codigo = ?");
//            st.setString(1, persona.getCaja().toUpperCase());
//            st.setString(2, persona.getDescripcion().toUpperCase());
//            st.setInt(3, persona.getEstado());
//            long d = persona.getFechaApertura().getTime();
//            java.sql.Date fecha = new java.sql.Date(d);
//            st.setDate(4, fecha);
//            long d2 = persona.getFechaCierre().getTime();
//            java.sql.Date fecha2 = new java.sql.Date(d2);
//            st.setDate(5, fecha2);
//            st.setDouble(6, persona.getSaldoInicial());
//            st.setDouble(7, persona.getTotalCierre());
//            st.setString(8, persona.getCajer().toUpperCase());            
//            st.setInt(9, persona.getCodigo());
//            String sql = st.toString();
//            st.executeUpdate();
//
//            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
//        } catch (SQLException e) {
//            msg.setProgressBar_mensajae(e.toString());
//        } finally {
//            this.cerrar();
//        }
//
//    }

    public ArrayList<CajasDetalle> listar() {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla + " order BY tipo");
            rs = st.executeQuery();
            
            while (rs.next()) {
                CajasDetalle per = new CajasDetalle();
                per.setCodigo(rs.getInt("Codigo"));
                per.setDetalle(rs.getString("detalle"));
                per.setValor(rs.getDouble("valor"));
                per.setTipo(rs.getString("tipo"));
                per.setDocumento(rs.getString("documento"));                
                per.setDescripcion((rs.getString("descripcion")));
                per.setFecha(rs.getDate("fecha"));
                per.setCodigoDocuemnto(rs.getInt("codigoDocumento"));

                this.lista.add(per);
            }

        } catch (Exception ex) {
            msg.setMensaje(ex.toString());
            System.out.println("Controlador.CUsuarios.listar() listar cajassss " + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }

}
