/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.Tickets;
import Vlidaciones.ProgressBar;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import javax.swing.DefaultListModel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import ClasesAuxiliares.debug.Deb;

/**
 *
 * @author USUARIO
 */
public class TicketsDao extends Coneccion {

    private String tabla = "Tickets";
    ProgressBar msg = new ProgressBar(3000, "");
    private DefaultListModel modeloListadetalle = new DefaultListModel();
    private DefaultListModel modeloListacantidad = new DefaultListModel();

    public String getNextumeroDeTicket() {

        ResultSet rs;
        String maxnumeroOrden = "1";
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("SELECT max(secuencia) as numero from tickets");
            rs = st.executeQuery();

            //this.lista= new ArrayList();
            while (rs.next()) {
                if (rs.getString("numero").equals("")) {
                    maxnumeroOrden = "1";
                } else {
                    maxnumeroOrden = rs.getString("numero");
                    Integer numero = Integer.valueOf(maxnumeroOrden);
                    numero++;
                    maxnumeroOrden = String.valueOf(numero);
                }

            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConCedula()ssssfs" + ex);
        } finally {
            this.cerrar();
        }

        return maxnumeroOrden;
    }
    public DefaultListModel Buscar_productos(String value) {

        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select canTidad, producto from productos where producto like '%" + value + "%' order BY productos.producto LIMIT 0, 50");
            Deb.consola("Controlador.CUsuarios.Buscar_table()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                modeloListacantidad.addElement(rs.getString("cantidad"));
                modeloListadetalle.addElement(rs.getString("producto"));
                //lista.setModel(modeloLista);
                // modelo.addRow(registros);

            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "hhhh");
        } finally {
            this.cerrar();
        }

        return modeloListadetalle;
    }

    public DefaultListModel Buscar_productos_stock() {
        return modeloListacantidad;
    }

    public Date obtenerFecha() {
        Date fecha = null;
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select now()");
            rs = st.executeQuery();
          
            while (rs.next()) {
                fecha = rs.getDate("now()");
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "ddkkk");
        } finally {
            this.cerrar();
        }

        return fecha;
    }

    public String[] Buscar_registros(String columna, String value) {
        String[] registros = new String[10];

        ResultSet rs;
        String tabla = "productos";
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select Productos.*, modelos.Modelo from productos inner join modelos on modelos.Codigo=productos.Modelos_Codigo where " + tabla + "." + columna + " like '%" + value + "%' order BY productos.producto LIMIT 0, 50");
            Deb.consola("Controlador.CUsuarios.Buscar_table()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                registros[0] = rs.getString("costo");
                registros[1] = String.valueOf(1);
                registros[2] = String.valueOf(rs.getInt("Codigo"));
                registros[3] = rs.getString("Producto");
                registros[4] = "1";
                registros[5] = "0";
                registros[6] = "1";
                registros[7] = rs.getString("pvp");
                registros[8] = "0";
                registros[9] = rs.getString("cantidad");                

                Deb.consola("Controlador.CUsuarios.Buscar_table()" + registros[1]);

            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "hhhh");
        } finally {
            this.cerrar();
        }

        return registros;
    }

    public Integer guardar(Tickets tarea) {
        int codigoThisTicket = 0;
        try {
            this.conectar();
            PreparedStatement consulta;
            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (fecha, iva, subtotaI_con_iva, subtotal_sin_iva,"
                    + " total, utilidad, tipo_documento, "
                    + "descuento,Clientes_codigo,Usuarios_Codigo, Equipo, secuencia,fechain,iva_valor,formaPago,efectivo,cambio,equipos_codigo) VALUES(?,?,?,?, ?, ?,?,?,?, ?, ?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            //           java.sql.Timestamp sqlTimeStamp = new java.sql.Timestamp(tarea.getFecha());
            long d = tarea.getFecha().getTime();
            java.sql.Date fecha = new java.sql.Date(d);
            consulta.setDate(1, fecha);
            consulta.setString(2, tarea.getIva().toUpperCase());
            consulta.setString(3, tarea.getSubtotaI_con_iva().toUpperCase());
            consulta.setString(4, tarea.getSubtotal_sin_iva());
            consulta.setString(5, tarea.getTotal());
            consulta.setString(6, tarea.getUtilidad());
            consulta.setString(7, tarea.getTipo_documento());
            consulta.setString(8, tarea.getDescuento().toUpperCase());
            consulta.setInt(9, tarea.getClientes_codigo());
            consulta.setInt(10, tarea.getUsuarios_Codigo());
            consulta.setString(11, tarea.getEquipo());
            consulta.setString(12, tarea.getSecuencia());
            consulta.setString(13, tarea.getFechain());
            consulta.setString(14, tarea.getIva_valor());
                consulta.setString(15, tarea.getFormaPago());
                consulta.setDouble(16, tarea.getEfectivo());
                consulta.setDouble(17, tarea.getCambio());
                consulta.setDouble(18, tarea.getEquipos_codigo());
                
            Deb.consola("Controlador.CUsuarios.guardar()" + consulta);
            consulta.executeUpdate();
            ResultSet rs = consulta.getGeneratedKeys();
            if (rs.next()) {
                codigoThisTicket = rs.getInt(1);
                Deb.consola("Controlador.Usuarios.TicketsDao.guardar()>: " + codigoThisTicket);
            }
        } catch (SQLException ex) {
            //msg.setProgressBar_mensajae(ex.toString());
            Deb.consola("Controlador.CUsuarios.guardar()" + ex);
        } finally {
            this.cerrar();
        }
        return codigoThisTicket;
    }
//SELECT * FROM tickets t INNER JOIN detalleticket dt ON( t.Codigo=dt.ticket_Codigo ) WHERE t.secuencia=18
    public Tickets buscarConID(Integer id) {
        ResultSet rs;
        Tickets u = new Tickets();
        try {
            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall("select * from Ttickets where codigo =" + id);
            rs = st.executeQuery();
            while (rs.next()) {
                Tickets per = new Tickets();
                per.setCodigo(rs.getInt("Codigo"));
                per.setAnulada(rs.getBoolean("anulada"));
                per.setClientes_codigo(rs.getInt("Clientes_codigo"));
                per.setDescuento(rs.getString("descuento"));
                per.setEquipo(rs.getString("equipo"));
                per.setUtilidad(rs.getString("utilidad"));
                per.setFecha(rs.getDate("fecha"));
                per.setHora(rs.getTimestamp("Hora"));
                per.setIva(rs.getString("iva"));
                per.setSecuencia(rs.getString("secuencia"));
                per.setSubtotaI_con_iva(rs.getString("subtotaI_con_iva"));
                per.setSubtotal_sin_iva(rs.getString("subtotal_sin_iva"));
                per.setTipo_documento(rs.getString("tipo_documento"));
                per.setTotal(rs.getString("total"));
                per.setUsuarios_Codigo(rs.getInt("Usuarios_Codigo"));
                u = per;
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }

    public DefaultTableModel listarTicketsTbModel(String fecha1, String fecha2) {
        DefaultTableModel modelo = null;

        String[] titulos
                = {"Codigo", "Fecha", "Numero de Ticket", "Total",
                    "Vendedor", "Terminal",
                    "Cliente", "Ruc", "Estado"};
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
        String sql = "SELECT Ttickets.* ,usuarios.Nombres as usuario, clientes.Nombres as cliente, clientes.Cedula as ruc from Ttickets inner join clientes on clientes.Codigo=Ttickets.Clientes_codigo inner JOIN usuarios on usuarios.codigo= Ttickets.Usuarios_Codigo where hora BETWEEN '" + fecha1 + "' and '" + fecha2 + "' order BY Ttickets.secuencia ";
        //String sql="SELECT Ttickets.* ,usuarios.Nombres as usuario, clientes.Nombres as cliente, clientes.Cedula as ruc from Ttickets inner join clientes on clientes.Codigo=Ttickets.Clientes_codigo inner JOIN usuarios on usuarios.codigo= Ttickets.Usuarios_Codigo order BY Ttickets.secuencia LIMIT 0, 50";
        try {
            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall(sql);
            Deb.consola("Controlador.CUsuarios.Buscar_table_Only()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {

                registros[0] = String.valueOf(rs.getInt("Codigo"));
                registros[1] = rs.getString("fecha");
                registros[2] = rs.getString("secuencia");
                registros[3] = rs.getString("total");
                registros[4] = rs.getString("usuario");
                registros[5] = rs.getString("equipo");
                registros[6] = rs.getString("cliente");
                registros[7] = rs.getString("ruc");
                if (rs.getString("anulada").equals("0")) {
                    registros[8] = "OK";
                } else {
                    registros[8] = "ANULADA";
                }

                modelo.addRow(registros);
                Deb.consola("Controlador.CUsuarios.Buscar_table_only()" + registros[1]);

            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "rrrrddrrrrrrrrrr");
        } finally {
            this.cerrar();
        }

        return modelo;
    }

    public void eliminar(Tickets obj) throws Exception {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("DELETE from  Ttickets WHERE Codigo = ? ");
            st.setInt(1, obj.getCodigo());
            st.executeUpdate();
        } catch (SQLException e) {
            msg.setProgressBar_mensajae("Error..!! " + e);
        } finally {
            this.cerrar();
        }

    }

}
