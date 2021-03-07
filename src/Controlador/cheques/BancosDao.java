/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.cheques;

import Controlador.Coneccion;
import Modelo.Bancos;
import Vlidaciones.ProgressBar;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.table.DefaultTableModel;
import ClasesAuxiliares.debug.Deb;

/**
 *
 * @author USUARIO
 */
public class BancosDao extends Coneccion {

    ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    String tabla = "Bancos";
    private ArrayList<Bancos> lista = new ArrayList<Bancos>();

    public void guardar(Bancos tarea) {
        try {
            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (nombre,sucursal,cuenta,"
                    + "tipo,documento,documento2,valor,saldo) VALUES(?,?,?,?,?,?)");
            consulta.setString(1, tarea.getNombre().toUpperCase());
            consulta.setString(2, tarea.getSucursal());
            consulta.setString(3, tarea.getCuenta());
//            long d = tarea.getFechaApertura().getTime();
//            java.sql.Date fecha = new java.sql.Date(d);
            consulta.setString(4, tarea.getTipo());
            consulta.setString(5, tarea.getDoc());
            consulta.setString(6, tarea.getDoc2());
            consulta.setDouble(7, tarea.getValor());
            consulta.setDouble(8, tarea.getSaldo());
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

    public DefaultTableModel Buscar_table_All() {
        DefaultTableModel modelo = null;
        String sql = "select * from Bancos  order BY codigo  ";

        String[] titulos
                = {"Codigo", "NOmbre", "Sucursal", "Tipo", "Documento", "Referencia","Valor", "Saldo"};
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
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {

                registros[0] = String.valueOf(rs.getInt("Codigo"));
                registros[1] = rs.getString("nombre");
                registros[2] = rs.getString("sucursal");
                registros[3] = rs.getString("cuenta");
                registros[4] = rs.getString("tipo");
                registros[5] = rs.getString("documento");
                registros[6] = rs.getString("documento2");
                registros[7] = rs.getString("Valor");
                registros[8] = rs.getString("Saldo");
                modelo.addRow(registros);

            }

        } catch (Exception ex) {

            msg.setProgressBar_mensajae("Error..!! " + ex);

        } finally {
            this.cerrar();
        }

        return modelo;
   }

//        public Bancos Buscar_Bancos_ID(Integer codigo) {
//        DefaultTableModel modelo = null;
//        String sql = "select * from Bancos  where codigo = "+codigo;
//Bancos caja = new Bancos();
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
//                Bancos registros = new Bancos();
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

    public void modificar(Bancos persona) {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("UPDATE " + tabla + " SET "
                    + "nombre = ?, "
                    + "sucursal = ?, "
                    + "cuenta = ?, "
                    + "tipo = ?, "
                    + "Docuemnto = ?, "
                    + "Docuemnto2 = ?, "
                    + "Valor = ?, "
                    + "saldo = ? "                    
                    + "where codigo = ?");
            st.setString(1, persona.getNombre().toUpperCase());
            st.setString(2, persona.getSucursal());
            st.setString(3, persona.getCuenta());
//            long d = persona.getFechaApertura().getTime();
//            java.sql.Date fecha = new java.sql.Date(d);
            st.setString(4, persona.getTipo());
//            long d2 = persona.getFechaCierre().getTime();
//            java.sql.Date fecha2 = new java.sql.Date(d2);
            st.setString(5, persona.getDoc());
            st.setString(6, persona.getDoc2());
            st.setDouble(7, persona.getValor());
            st.setDouble(8, persona.getSaldo());
            st.setInt(9, persona.getCodigo());
            String sql = st.toString();
            st.executeUpdate();

            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
        } catch (SQLException e) {
            msg.setProgressBar_mensajae(e.toString());
        } finally {
            this.cerrar();
        }

    }

    public ArrayList<Bancos> listar() {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla + " order BY NOMBRE");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Bancos per = new Bancos();
                per.setCodigo(rs.getInt("Codigo"));
                per.setNombre(rs.getString("nombre"));
                per.setSucursal(rs.getString("sucursal"));
                per.setCuenta(rs.getString("cuenta"));
                per.setTipo(rs.getString("TIPO"));
                per.setDoc(rs.getString("DOCUMENTO"));
                per.setDoc2((rs.getString("DOCUMENTO2")));                
                per.setValor((rs.getDouble("valor")));                
                per.setSaldo((rs.getDouble("saldo")));                
                this.lista.add(per);
            }

        } catch (Exception ex) {
            msg.setMensaje(ex.toString());
            Deb.consola("Controlador.CUsuarios.listar() listar cajassss " + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }

}
