/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.Cheques;
import Vlidaciones.ProgressBar;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author USUARIO
 */
public class ChequesDao extends Coneccion{
    

    ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    String tabla = "Cheques";
    private ArrayList<Cheques> lista = new ArrayList<Cheques>();

    public void guardar(Cheques tarea) {
        try {
            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement(""
                    + "INSERT INTO `cheques`(`codigo_banco`,`fecha_cobro`,`valor`,`paguese_a`,`titular_chequera`,`numero`,`referencia`,`codigo_cliente`,"
                    + "`codigo_proveedor`,`estado`) "
                    + "VALUES ( '?','?','?','?','?','?',?,'?',?,?)");
            consulta.setInt(1, tarea.getCodigo_banco());
            long d = tarea.getFecha_c().getTime();
            java.sql.Date fecha = new java.sql.Date(d);
            consulta.setDate(2, fecha);                                    
            consulta.setDouble(3, tarea.getValor());
            consulta.setString(4, tarea.getPaguesea());
            consulta.setString(5, tarea.getTitular());
            consulta.setInt(6, tarea.getNumero());
            consulta.setString(7, tarea.getReferencia());
            consulta.setInt(8, tarea.getCodigo_cliente());
            consulta.setInt(9, tarea.getCodigo_proveedor());
            consulta.setString(10, tarea.getEstado());
            
            
            consulta.executeUpdate();
        } catch (SQLException ex) {
            msg.setProgressBar_mensajae("Error..!! " + ex);

        } finally {
            this.cerrar();
        }
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

//    public DefaultTableModel Buscar_table_All() {
//        DefaultTableModel modelo = null;
//        String sql = "select * from Cheques  order BY codigo  ";
//
//        String[] titulos
//                = {"Codigo", "caja", "Descripcion", "estado", "fechaApertura", "fechaCierre", "SaldoInicial", "TotalCierre", "cajero"};
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
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//
//                registros[0] = String.valueOf(rs.getInt("Codigo"));
//                registros[1] = rs.getString("caja");
//                registros[2] = rs.getString("descripcion");
//
//                registros[3] = rs.getString("estado");
//                registros[4] = rs.getString("fechaApertura");
//                registros[5] = rs.getString("fechaCierre");
//                registros[6] = rs.getString("SaldoInicial");
//                registros[7] = rs.getString("totalCierre");
//                registros[8] = rs.getString("cajero");
//                modelo.addRow(registros);
//
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
//        return modelo;
//    }
//        public Cheques Buscar_Cheques_ID(Integer codigo) {
//        DefaultTableModel modelo = null;
//        String sql = "select * from Cheques  where codigo = "+codigo;
//Cheques caja = new Cheques();
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
//                Cheques registros = new Cheques();
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
//    public void modificar(Cheques persona) {
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
//
//    public ArrayList<Cheques> listar() {
//        ResultSet rs;
//        try {
//            this.conectar();
//            PreparedStatement st;
//            st = this.getCnx().prepareCall("Select * from " + tabla + " order BY caja");
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//                Cheques per = new Cheques();
//                per.setCodigo(rs.getInt("Codigo"));
//                per.setCaja(rs.getString("caja"));
//                per.setDescripcion(rs.getString("descripcion"));
//                per.setEstado(rs.getInt("estado"));
//                per.setFechaApertura(rs.getDate("fechaApertura"));
//                per.setFechaCierre(rs.getDate("fechaCierre"));
//                per.setSaldoInicial((rs.getDouble("saldoInicial")));
//                per.setTotalCierre(rs.getDouble("totalCierre"));
//                per.setCajer(rs.getString("cajero"));
//
//                this.lista.add(per);
//            }
//
//        } catch (Exception ex) {
//            msg.setMensaje(ex.toString());
//            Deb.consola("Controlador.CUsuarios.listar() listar cajassss " + ex);
//        } finally {
//            this.cerrar();
//        }
//
//        return lista;
//    }

}
