/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import ClasesAuxiliares.debug.Deb;
import Controlador.Coneccion;
import Modelo.Cajas;
import Modelo.Precios;
import Modelo.Productos;
import Vlidaciones.ProgressBar;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author USUARIO
 */
public class PreciosDao extends Coneccion {

    //ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    String tabla = "Precios";
    private ArrayList<Precios> lista = new ArrayList<Precios>();

    public void guardar(Precios tarea) {
        try {
            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement("INSERT INTO `precios`(`nombre`,`valor`,`utilidad`,`codigo_centrocosto`,`codigo_tipo_usuario`,`eliminaDescuentos`,`cantidadMinima`,`utilidadRespectoAlcosto`,`utilidadRespectoAlPvp`,`actualizaalcostoOalpvp`,requiereClavaAdministrador) VALUES ( ?,?,?,?,?,?,?,?,?,?,?)");
            consulta.setString(1, tarea.getNombre().toUpperCase());
            consulta.setDouble(2, tarea.getValor());
            consulta.setDouble(3, tarea.getUtilidad());
            consulta.setInt(4, tarea.getCodigo_centrocosto());
            consulta.setInt(5, tarea.getCodigo_tipo_usuario());
            consulta.setInt(6, tarea.getEliminaDescuentos());
            consulta.setDouble(7, tarea.getCantidadMinima());
            consulta.setDouble(8, tarea.getUtilidadRespectoAlcosto());
            consulta.setDouble(9, tarea.getUtilidadRespectoAlPvp());
            consulta.setInt(10, tarea.getActualizaPrecioRespectoalCOSTOalPVP());
            consulta.setInt(11, tarea.getRequiereClavaAdministrador());
            consulta.executeUpdate();
        } catch (SQLException ex) {            
            ProgressBar.mostrarMensajeAzul("Error..!! " + ex);

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
    public DefaultTableModel getAllPreciosParaFacturar(Integer codigoP) {
        DefaultTableModel modelo = null;
        String sql = "select * from Precios  order BY valor  ";

        String[] titulos
                = { "Precio", "Valor","UTIL"};
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
            Productos p = new Productos();
            ProductosDao pdao = new ProductosDao();
            p = pdao.buscarConID(codigoP);
            Double costo;
            Double pvp = null;
            if (p.getCosto() != null) {
                costo = Double.parseDouble(p.getCosto());
                pvp = Double.parseDouble(p.getPvp());
            } else {
                costo = 0.0;
            }

            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall(sql);
            rs = st.executeQuery();

            //this.lista= new ArrayList();
            //registros[0] = "0";
            registros[0] = "P.V.P";           
            registros[1] = String.format("%.2f", pvp);
            registros[2] = String.format("%.0f", pvp-costo);
            modelo.addRow(registros);
            while (rs.next()) {
                
                registros[0] = rs.getString("Nombre");
                Double porcentaje = rs.getDouble("Valor");
                pvp = (costo + (costo * porcentaje) / 100);
                registros[1] = String.format("%.2f", pvp);
                registros[2] = String.format("%.2f", pvp-costo);
                modelo.addRow(registros);
            }

        } catch (Exception ex) {
            ProgressBar.mostrarMensajeAzul("Error..!! " + ex);
            //msg.setProgressBar_mensajae("Error..!! " + ex);

        } finally {
            this.cerrar();
        }

        return modelo;
    }

    public Cajas Buscar_Cajas_ID(Integer codigo) {
        DefaultTableModel modelo = null;
        String sql = "select * from Cajas  where codigo = " + codigo;
        Cajas caja = new Cajas();

        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                Cajas registros = new Cajas();
                registros.setCodigo(rs.getInt("Codigo"));
                registros.setCaja(rs.getString("caja"));
                registros.setDescripcion(rs.getString("descripcion"));

                registros.setEstado(rs.getInt("estado"));
                registros.setFechaApertura(rs.getDate("fechaApertura"));
                registros.setFechaCierre(rs.getDate("fechaCierre"));
                registros.setSaldoInicial(rs.getDouble("SaldoInicial"));
                registros.setTotalCierre(rs.getDouble("totalCierre"));
                registros.setCajer(rs.getString("cajero"));
                caja = registros;
            }

        } catch (Exception ex) {
        ProgressBar.mostrarMensajeAzul("Error..!! " + ex);
            

        } finally {
            this.cerrar();
        }

        return caja;
    }

    public void modificar(Cajas persona) {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("UPDATE " + tabla + " SET "
                    + "caja = ?, "
                    + "descripcion = ?, "
                    + "estado = ?, "
                    + "fechaApertura = ?, "
                    + "fechaCierre = ?, "
                    + "saldoInicial = ? "
                    + "TotalCierre = ? "
                    + "Cajero = ? "
                    + "where codigo = ?");
            st.setString(1, persona.getCaja().toUpperCase());
            st.setString(2, persona.getDescripcion().toUpperCase());
            st.setInt(3, persona.getEstado());
            long d = persona.getFechaApertura().getTime();
            java.sql.Date fecha = new java.sql.Date(d);
            st.setDate(4, fecha);
            long d2 = persona.getFechaCierre().getTime();
            java.sql.Date fecha2 = new java.sql.Date(d2);
            st.setDate(5, fecha2);
            st.setDouble(6, persona.getSaldoInicial());
            st.setDouble(7, persona.getTotalCierre());
            st.setString(8, persona.getCajer().toUpperCase());
            st.setInt(9, persona.getCodigo());
            String sql = st.toString();
            st.executeUpdate();

            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
        } catch (SQLException e) {
            ProgressBar.mostrarMensajeAzul("Error..!! " + e.toString());
            
        } finally {
            this.cerrar();
        }

    }

    public ArrayList<Precios> listar() {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from precios order BY nombre");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Precios per = new Precios();
                per.setCodigo(rs.getInt("Codigo"));
                per.setNombre(rs.getString("nombre"));
                per.setValor(rs.getDouble("valor"));
                per.setUtilidad(rs.getDouble("utilidad"));
                per.setCodigo_centrocosto(rs.getInt("codigo_centrocosto"));
                per.setCodigo_tipo_usuario(rs.getInt("codigo_tipo_usuario"));
                per.setEliminaDescuentos((rs.getInt("eliminaDescuentos")));
                per.setCantidadMinima(rs.getDouble("cantidadMinima"));
                per.setUtilidadRespectoAlcosto(rs.getDouble("utilidadRespectoAlcosto"));
                per.setUtilidadRespectoAlPvp(rs.getDouble("utilidadRespectoAlPvp"));
                per.setActualizaPrecioRespectoalCOSTOalPVP(rs.getInt("actualizaalcostoOalpvp"));
                per.setRequiereClavaAdministrador(rs.getInt("requiereClavaAdministrador"));
                this.lista.add(per);
            }

        } catch (Exception ex) {
            ProgressBar.mostrarMensajeAzul("Error..!! " + ex);
            Deb.consola("Controlador.CUsuarios.listar() listar cajassss " + ex);            
        } finally {
            this.cerrar();
        }

        return lista;
    }

}
