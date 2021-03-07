/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.DetalleTicket;
import Vista.Principal;
import Vlidaciones.ProgressBar;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.swing.DefaultListModel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import ClasesAuxiliares.debug.Deb;

/**
 *
 * @author USUARIO
 */
public class DetalleTicketDao extends Coneccion {

    private String tabla = "detalleticket";
ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    private List<DetalleTicket> lista = new ArrayList<DetalleTicket>();
    

    private DefaultListModel modeloListadetalle = new DefaultListModel();
    private DefaultListModel modeloListacantidad = new DefaultListModel();

    public DefaultListModel Buscar_productos(String value) {

        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select f.*, df.* from tickets f inner join detalleticket df on f.Codigo = df.Ticket_Codigo where f.codigo = "+value );
            Deb.consola("Controlador.CUsuarios.Buscar_table()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
               // modeloListacantidad.addElement(rs.getString("cantidad"));
                //modeloListadetalle.addElement(rs.getString("producto"));
                
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
            //this.lista= new ArrayList();
            while (rs.next()) {
                fecha = rs.getDate("now()");
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "kkkk");
        } finally {
            this.cerrar();
        }

        return fecha;
    }

    public String[] Buscar_registros(String columna, String value) {
        String[] registros = new String[9];

        ResultSet rs;
        String tabla = "ticketDetalle";
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select tickets.*, TicketDetalle.* from Tickets inner join TicketDetalle on tickets.Codigo=TicketsDetalle.Ticket_Codigo where tickets." + columna+ " like '%" + value + "%'");
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

                Deb.consola("Controlador.CUsuarios.Buscar_table()" + registros[1]);

            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "hhhh");
        } finally {
            this.cerrar();
        }

        return registros;
    }

    public void guardar(DetalleTicket tarea) {
        try {
            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (cantidad, detalle, iva, descuento,"
                    + " valorUnitario, valorTotal, Ticket_Codigo, "
                    + "Productos_Codigo,Observaciones) VALUES(?,?,?,?, ?, ?,?,?,?)");                      
            consulta.setString(1, tarea.getCantidad().toUpperCase());
            consulta.setString(2, tarea.getDetalle().toUpperCase());
            consulta.setString(3, tarea.getIva());
            consulta.setString(4, tarea.getDescuento());
            consulta.setString(5, tarea.getValorUnitario());
            consulta.setString(6, tarea.getValorTotal());
            consulta.setInt(7, tarea.getFactura_Codigo());
            consulta.setInt(8, tarea.getProductos_codigo());
            consulta.setString(9, tarea.getObservaciones());
            Deb.consola("Controlador.CUsuarios.guardar()" + consulta);
            consulta.executeUpdate();
        } catch (SQLException ex) {
            //msg.setProgressBar_mensajae(ex.toString());
            Deb.consola("Controlador.CUsuarios.guardar()" + ex);
        } finally {
            this.cerrar();
        }
    }
    
    

//    public void modificar(Deta persona)  {
//        try {
//            this.conectar();
//            PreparedStatement st = this.con.prepareStatement("UPDATE Clientes SET "
//                    + "Cedula = ?, "
//                    + "Nombres = ?, "
//                    + "Telefono = ?, "
//                    + "Celular= ?, "
//                    + "Mail= ?, "
//                    + "Direccion = ?, "
//                    + "Provincia = ?, "
//                    + "Ciudad = ?, "
//                    + "Nacionalidad = ?, "  
//                    + "PagoPredeterminado = ?, " 
//                    + "TipoCliente = ?, "
//                    + "VendedorPredeterminado = ?, " 
//                    + "Observaciones = ? " 
//                    + "WHERE Codigo=?");
//            st.setString(1, persona.getCedula().toUpperCase());
//            st.setString(2, persona.getNombre().toUpperCase());
//            st.setString(3, persona.getTelefono());
//            st.setString(4, persona.getCelular());
//            st.setString(5, persona.getMail().toLowerCase());
//            st.setString(6, persona.getDireccion().toUpperCase());
//            st.setString(7, persona.getProvincia().toUpperCase());
//            st.setString(8, persona.getCiudad().toUpperCase());
//            st.setString(9, persona.getNacionalidad().toUpperCase());
//            st.setInt(10, 1);
//            st.setInt(11, 1);
//            st.setInt(12, 1);
//            st.setString(13, "obsercvaciones");
//            st.setInt(14, persona.getCodigo());
//             String sql = st.toString();
//            Deb.consola("Controlador.Usuarios.CUsuarios.modificar()"+ sql);
//            st.executeUpdate();
//            Principal.jProgressBar2.setString("eeeeeeeeeeeee");
//            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
//        } catch (SQLException e) {
//            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error" + e + sql, "Error al modificar Registro" + e.toString()));
//Deb.consola("Controlador.CUsuarios.guardar()" + e);
//        } finally {
//            this.cerrar();
//        }
//
//    }
//
//    public List<DetalleTicket> listar() {
//        ResultSet rs;
//        try {
//            this.conectar();
//            PreparedStatement st;
//            st = this.getCnx().prepareCall("select f.*, df.* from tickets f inner join detalleticket df on f.Codigo = df.Ticket_Codigo where f.codigo = 3" );
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//                Clientes per = new Clientes();
//                per.setCodigo(rs.getInt("Codigo"));
//                per.setCedula(rs.getString("Cedula"));
//                per.setNombre(rs.getString("Nombres"));
//                per.setTelefono(rs.getString("telefono"));
//                per.setCelular(rs.getString("celular"));
//                per.setMail(rs.getString("Mail"));
//                per.setDireccion(rs.getString("Direccion"));
//                per.setProvincia(rs.getString("Provinvia"));
//                per.setCiudad(rs.getString("Ciudad"));
//                per.setNacionalidad(rs.getString("Nacionalidad"));
//                per.setPagoPredeterminado(rs.getInt("PagoPredeterminado"));
//                per.setTipoCliente(rs.getInt("TipoCliente"));
//                per.setVendedorPredeterminado(rs.getInt("VendedorPredeterminado"));
//                per.setObservaciones(rs.getString("Observaciones"));
//                //per.setObservaciones(rs.getString("PersonaObservaciones"));
//                //per.setFechaN(rs.getDate("PersonaFN").toString());
//                //Deb.consola("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
//                this.lista.add(per);
//            }
//
//        } catch (Exception ex) {
//            Deb.consola("Controlador.CUsuarios.listar()" + ex);
//        } finally {
//            this.cerrar();
//        }
//
//        return lista;
//    }

    public DetalleTicket buscarConIDFact(Integer id) {
        ResultSet rs;
                DetalleTicket u = new DetalleTicket();
        try {
            this.conectar();
            PreparedStatement st;
//            select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo
//            select usuarios.*, tipos_usuarios.codigo,tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo where usuarios.codigo = 1

            st = this.getCnx().prepareCall("select * from DetalleTicket where Ticket_codigo= "+ id);
            //select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo

            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                DetalleTicket per = new DetalleTicket();
                per.setCodigo(rs.getInt("Codigo"));
                per.setIva(rs.getString("iva"));
                per.setDescuento(rs.getString("Descuento"));
                per.setValorUnitario(rs.getString("valorUnitario"));
                per.setValorTotal(rs.getString("valorTotal"));
                per.setFactura_Codigo(rs.getInt("Ticket_Codigo"));
                per.setProductos_codigo(rs.getInt("Productos_Codigo"));
                u = per;
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }

    
    public DetalleTicket buscarConColumayValorLike(String columna,String value) {
        ResultSet rs;
        DetalleTicket u = new DetalleTicket();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select tickets.*, TicketDetalle.* from Tickets inner join TicketDetalle on tickets.Codigo=TicketsDetalle.Ticket_Codigo where tickets." + columna+ " like '%" + value + "%'");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                DetalleTicket per = new DetalleTicket();
                per.setCodigo(rs.getInt("Codigo"));
                per.setIva(rs.getString("iva"));
                per.setDescuento(rs.getString("Descuento"));
                per.setValorUnitario(rs.getString("valorUnitario"));
                per.setValorTotal(rs.getString("valorTotal"));
                per.setFactura_Codigo(rs.getInt("Ticket_Codigo"));
                per.setProductos_codigo(rs.getInt("Productos_Codigo"));
                u = per;
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConCedula()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }
    
    public void eliminar(String ticketCodigo) throws Exception {
        try {             
            this.conectar();
            PreparedStatement st =this.con.prepareStatement("DELETE from DetalleTicket "
				+ "WHERE Ticket_Codigo=?");			            
            st.setString(1,ticketCodigo);
            st.executeUpdate();
        } catch (SQLException e) {
      msg.setProgressBar_mensajae("Error..!! "+ e);            
        } finally {
            this.cerrar();
        }
        
    }   

    
    public DefaultTableModel Buscar_table(String columna, String value) {
        DefaultTableModel modelo = null;
  String[] titulos
                = {"Codigo", "Secuencia", "Fecha Fac.",
                    "Cantida", "Telefono",
                    "E-Mail", "Direccion", "Provincia", "Ciudad" };
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
            st = this.getCnx().prepareCall("select tickets.*, TicketDetalle.* from Tickets inner join TicketDetalle on tickets.Codigo=TicketsDetalle.Ticket_Codigo where tickets." + columna+ " like '%" + value + "%'" );

          //  st = this.getCnx().prepareCall("Select * from " + tabla + " where " + columna + " like '%" + value + "%'");
            Deb.consola("Controlador.CUsuarios.Buscar_table()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {

                registros[0] = String.valueOf(rs.getInt("Codigo"));
                registros[1] = String.valueOf(rs.getDouble("secuencia"));
                registros[2] = rs.getString("fecha");
                registros[3] = rs.getString("iva");
                registros[4] = rs.getString("Total");
                registros[5] = rs.getString("Cantidad");
                registros[6] = rs.getString("detalle");
                registros[7] = rs.getString("ValorUnitario");
                registros[8] = rs.getString("ValorTotal");
                modelo.addRow(registros);
                Deb.consola("Controlador.CUsuarios.Buscar_table()" + registros[1]);

                //per.setObservaciones(rs.getString("PersonaObservaciones"));
                //per.setFechaN(rs.getDate("PersonaFN").toString());
                //Deb.consola("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex+"hhhhm");
        } finally {
            this.cerrar();
        }

        return modelo;
    }
    
    public DefaultTableModel Buscar_table_only_Activos(String sql) {
        DefaultTableModel modelo = null;

        String[] titulos
                = {"Codigo", "Cedula", "Nombres",
                    "Celular", "Telefono",
                    "E-Mail", "Direccion", "Provincia", "Ciudad" };
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
//sql="select tickets.*, TicketDetalle.* from Tickets inner join TicketDetalle on tickets.Codigo=TicketsDetalle.Ticket_Codigo where tickets.codigo" + columna+ " like '%" + value + "%'";
            st = this.getCnx().prepareCall(sql);
            Deb.consola("");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {

                registros[0] = String.valueOf(rs.getInt("Codigo"));
                registros[1] = String.valueOf(rs.getDouble("Cedula"));
                registros[2] = rs.getString("Nombres");
                registros[3] = rs.getString("Celular");
                registros[4] = rs.getString("telefono");
                registros[5] = rs.getString("Mail");
                registros[6] = rs.getString("Direccion");
                registros[7] = rs.getString("Provincia");
                registros[8] = rs.getString("Ciudad");
                modelo.addRow(registros);
                Deb.consola("Controlador.CUsuarios.Buscar_table_only()" + registros[1]);

            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex+"rrrrrrrrrrrrrraqqq");
        } finally {
            this.cerrar();
        }

        return modelo;
    }

}
