/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.Clientes;
import Modelo.Proveedores;
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
public class ProveedoresDao extends Coneccion {

    ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    private List<Proveedores> lista = new ArrayList<Proveedores>();
    private final String tabla = "Proveedores";
    //private Conec mysql = new conexion(); //Instanciando la clase conexion
    //private Connection cn = mysql.conectar();

    public void guardar(Proveedores tarea) {
        try {
            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (Cedula, nombres, telefono, celular, mail, direccion, Provincia, Ciudad,Nacionalidad,NombreComercial,Vendedor,Observaciones,extension,PagoPredeterminado,credito,tiempoCredito) VALUES(?,?,?,?,?,?,?, ?, ?,?, ?, ?,?,?,?,?)");
            consulta.setString(1, tarea.getCedula());
            consulta.setString(2, tarea.getNombre().toUpperCase());
            consulta.setString(3, tarea.getTelefono());
            consulta.setString(4, tarea.getCelular());
            consulta.setString(5, tarea.getMail());
            consulta.setString(6, tarea.getDireccion());
            consulta.setString(7, tarea.getProvincia());
            consulta.setString(8, tarea.getCiudad());
            consulta.setString(9, tarea.getNacionalidad());
            consulta.setString(10, tarea.getNombreComercial());
            consulta.setString(11, tarea.getVendedor());
            consulta.setString(12, tarea.getObservaciones());
            consulta.setString(13, tarea.getExtension());
            consulta.setString(14, tarea.getPagoPredeterminado());
            consulta.setInt(15, tarea.getCredito());
            consulta.setString(16, tarea.getTiempoCredito());
            System.out.println("Controlador.CUsuarios.guardar()" + consulta);
            consulta.executeUpdate();
        } catch (SQLException ex) {
            msg.setProgressBar_mensajae(ex.toString());
            System.out.println("Controlador.ProveedoresDao.guardar()" + ex);
        } finally {
            this.cerrar();
        }
    }

    public void modificar(Proveedores persona) {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("UPDATE Proveedores SET "
                    + "Cedula = ?, "
                    + "Nombres = ?, "
                    + "Telefono = ?, "
                    + "Celular= ?, "
                    + "Mail= ?, "
                    + "Direccion = ?, "
                    + "Provincia = ?, "
                    + "Ciudad = ?, "
                    + "Nacionalidad = ?, "
                    + "NombreComercial = ?, "
                    + "Vendedor = ?, "
                    + "Observaciones = ?, "
                    + "extension = ?, "
                    + "PagoPredeterminado = ?, "
                    + "credito = ?, "
                    + "tiempoCredito = ? "                    
                    + "WHERE Codigo=?");
            st.setString(1, persona.getCedula().toUpperCase());
            st.setString(2, persona.getNombre().toUpperCase());
            st.setString(3, persona.getTelefono());
            st.setString(4, persona.getCelular());
            st.setString(5, persona.getMail());
            st.setString(6, persona.getDireccion());
            st.setString(7, persona.getProvincia());
            st.setString(8, persona.getCiudad());
            st.setString(9, persona.getNacionalidad());
            st.setString(10,  persona.getNombreComercial());
            st.setString(11, persona.getVendedor());
            st.setString(12, persona.getObservaciones());
            st.setString(13, persona.getExtension());
            st.setString(14, persona.getPagoPredeterminado());
            st.setInt(15, persona.getCredito());
            st.setString(16, persona.getTiempoCredito());
            st.setInt(17, persona.getCodigo());
            String sql = st.toString();
            System.out.println("Controlador.Provvedores.CUsuarios.modificar()" + sql);
            st.executeUpdate();
            Principal.jProgressBar2.setString("eeeeeeeeproveedoreseeeee");
            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
        } catch (SQLException e) {
            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error" + e + sql, "Error al modificar Registro" + e.toString()));
            System.out.println("Controlador.Proveedores.guardar()" + e);
        } finally {
            this.cerrar();
        }

    }

    public List<Proveedores> listar() {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from Proveedores  order BY Nombres");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Proveedores per = new Proveedores();
                per.setCodigo(rs.getInt("Codigo"));
                per.setCedula(rs.getString("Cedula"));
                per.setNombre(rs.getString("Nombres"));
                per.setTelefono(rs.getString("telefono"));
                per.setCelular(rs.getString("celular"));
                per.setMail(rs.getString("Mail"));
                per.setDireccion(rs.getString("Direccion"));
                per.setProvincia(rs.getString("Provinvia"));
                per.setCiudad(rs.getString("Ciudad"));
                per.setNacionalidad(rs.getString("Nacionalidad"));
                per.setObservaciones(rs.getString("Observaciones"));
                per.setTiempoCredito(rs.getString("tiempoCredito"));
                per.setCredito(rs.getInt("credito"));
                per.setExtension(rs.getString("extension"));
                per.setNombreComercial(rs.getString("NombreComercial"));
                per.setVendedor(rs.getString("vendedor"));
//                per.setPagoPredeterminado(rs.getInt("PagoPredeterminado"));
//                per.setTipoCliente(rs.getInt("TipoCliente"));
//                per.setVendedorPredeterminado(rs.getInt("VendedorPredeterminado"));
                
                //per.setObservaciones(rs.getString("PersonaObservaciones"));
                //per.setFechaN(rs.getDate("PersonaFN").toString());
                //System.out.println("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
                this.lista.add(per);
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }

    public List<Proveedores> listarlike(String val) {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from Proveedores where nombres like '%"+val+"%' order BY Nombres");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Proveedores per = new Proveedores();
                per.setCodigo(rs.getInt("Codigo"));
                per.setCedula(rs.getString("Cedula"));
                per.setNombre(rs.getString("Nombres"));
                per.setTelefono(rs.getString("telefono"));
                per.setCelular(rs.getString("celular"));
                per.setMail(rs.getString("Mail"));
                per.setDireccion(rs.getString("Direccion"));
                per.setProvincia(rs.getString("Provincia"));
                per.setCiudad(rs.getString("Ciudad"));
                per.setNacionalidad(rs.getString("Nacionalidad"));
                per.setObservaciones(rs.getString("Observaciones"));
                per.setTiempoCredito(rs.getString("tiempoCredito"));
                per.setCredito(rs.getInt("credito"));
                per.setExtension(rs.getString("extension"));
                per.setNombreComercial(rs.getString("NombreComercial"));
                per.setVendedor(rs.getString("vendedor"));
//                per.setPagoPredeterminado(rs.getInt("PagoPredeterminado"));
//                per.setTipoCliente(rs.getInt("TipoCliente"));
//                per.setVendedorPredeterminado(rs.getInt("VendedorPredeterminado"));
                
                //per.setObservaciones(rs.getString("PersonaObservaciones"));
                //per.setFechaN(rs.getDate("PersonaFN").toString());
                //System.out.println("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
                this.lista.add(per);
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }

    public Proveedores buscarConID(Integer id) {
        ResultSet rs;
        Proveedores u = new Proveedores();
        try {
            this.conectar();
            PreparedStatement st;
//            select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo
//            select usuarios.*, tipos_usuarios.codigo,tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo where usuarios.codigo = 1

            st = this.getCnx().prepareCall("select * from Proveedores where codigo= " + id + " order BY Nombres");
            //select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo

            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Proveedores per = new Proveedores();
                per.setCodigo(rs.getInt("Codigo"));
                per.setCedula(rs.getString("Cedula"));
                per.setNombre(rs.getString("Nombres"));
                per.setTelefono(rs.getString("telefono"));
                per.setCelular(rs.getString("celular"));
                per.setMail(rs.getString("Mail"));
                per.setDireccion(rs.getString("Direccion"));
                per.setProvincia(rs.getString("Provincia"));
                per.setCiudad(rs.getString("Ciudad"));
                per.setNacionalidad(rs.getString("Nacionalidad"));

                per.setNombreComercial(rs.getString("NombreComercial"));
                per.setVendedor(rs.getString("Vendedor"));
                per.setObservaciones(rs.getString("Observaciones"));
                per.setExtension(rs.getString("extension"));
                per.setPagoPredeterminado(rs.getString("PagoPredeterminado"));
                per.setCredito(rs.getInt("credito"));
                per.setTiempoCredito(rs.getString("tiempoCredito"));

                u = per;
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }

    public Proveedores buscarConCedula(String cedula) {
        ResultSet rs;
        Proveedores u = new Proveedores();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from Proveedores "
                    + "where cedula like '%" + cedula + "%' order BY Nombres ");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Proveedores per = new Proveedores();
                per.setCodigo(rs.getInt("Codigo"));
                per.setCedula(rs.getString("Cedula"));
                per.setNombre(rs.getString("Nombres"));
                per.setTelefono(rs.getString("telefono"));
                per.setCelular(rs.getString("celular"));
                per.setMail(rs.getString("Mail"));
                per.setDireccion(rs.getString("Direccion"));
                per.setProvincia(rs.getString("Provinvia"));
                per.setCiudad(rs.getString("Ciudad"));
                per.setNacionalidad(rs.getString("Nacionalidad"));

                per.setNombreComercial(rs.getString("NombreComercial"));
                per.setVendedor(rs.getString("Vendedor"));
                per.setObservaciones(rs.getString("Observaciones"));
                per.setExtension(rs.getString("extension"));
                per.setPagoPredeterminado(rs.getString("PagoPredeterminado"));
                per.setCredito(rs.getInt("credito"));
                per.setTiempoCredito(rs.getString("tiempoCredito"));
                u = per;
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConCedula()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }

    public Proveedores buscarConCedulaLike(String cedula) {
           
        ResultSet rs;
        Proveedores u = new Proveedores();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from Proveedores "
                    + "where cedula = " + cedula + " order BY Nombres ");
            rs = st.executeQuery();

            //this.lista= new ArrayList();
            while (rs.next()) {
                Proveedores per = new Proveedores();
                per.setCodigo(rs.getInt("Codigo"));
                per.setCedula(rs.getString("Cedula"));
                per.setNombre(rs.getString("Nombres"));
                per.setTelefono(rs.getString("telefono"));
                per.setCelular(rs.getString("celular"));
                per.setMail(rs.getString("Mail"));
                per.setDireccion(rs.getString("Direccion"));
                per.setProvincia(rs.getString("Provincia"));
                per.setCiudad(rs.getString("Ciudad"));
                per.setNacionalidad(rs.getString("Nacionalidad"));

                                per.setNombreComercial(rs.getString("NombreComercial"));
                per.setVendedor(rs.getString("Vendedor"));
                per.setObservaciones(rs.getString("Observaciones"));
                per.setExtension(rs.getString("extension"));
                per.setPagoPredeterminado(rs.getString("PagoPredeterminado"));
                per.setCredito(rs.getInt("credito"));
                per.setTiempoCredito(rs.getString("tiempoCredito"));

                u = per;
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConCedula()" + ex);
        } finally {
            this.cerrar();
//             if(){
//            u.setCodigo(-100);
//            }

        }

        return u;
    }
    
    public Proveedores buscarConCedulaList(String nombre) {
           
        ResultSet rs;
        Proveedores u = new Proveedores();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from Proveedores "
                    + "where Nombres = " + nombre + " order BY Nombres ");
            rs = st.executeQuery();

            //this.lista= new ArrayList();
            while (rs.next()) {
                Proveedores per = new Proveedores();
                per.setCodigo(rs.getInt("Codigo"));
                per.setCedula(rs.getString("Cedula"));
                per.setNombre(rs.getString("Nombres"));
                per.setTelefono(rs.getString("telefono"));
                per.setCelular(rs.getString("celular"));
                per.setMail(rs.getString("Mail"));
                per.setDireccion(rs.getString("Direccion"));
                per.setProvincia(rs.getString("Provincia"));
                per.setCiudad(rs.getString("Ciudad"));
                per.setNacionalidad(rs.getString("Nacionalidad"));

                                per.setNombreComercial(rs.getString("NombreComercial"));
                per.setVendedor(rs.getString("Vendedor"));
                per.setObservaciones(rs.getString("Observaciones"));
                per.setExtension(rs.getString("extension"));
                per.setPagoPredeterminado(rs.getString("PagoPredeterminado"));
                per.setCredito(rs.getInt("credito"));
                per.setTiempoCredito(rs.getString("tiempoCredito"));

                u = per;
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConCedula()" + ex);
        } finally {
            this.cerrar();
//             if(){
//            u.setCodigo(-100);
//            }

        }

        return u;
    }

    public void eliminar(Proveedores persona) throws Exception {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("DELETE from Proveedores "
                    + "WHERE Codigo=?");
            st.setDouble(1, persona.getCodigo());
            st.executeUpdate();
        } catch (SQLException e) {
            msg.setProgressBar_mensajae("Error..!! " + e);
        } finally {
            this.cerrar();
        }

    }

    public DefaultTableModel Buscar_table(String columna, String value) {
        DefaultTableModel modelo = null;
        String[] titulos
                = {"Codigo", "Cedula", "Nombres",
                    "Usuario", "Telefono",
                    "E-Mail", "Direccion", "Provincia", "Ciudad"};
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
            st = this.getCnx().prepareCall("select * from Proveedores where " + columna + "  like '%" + value + "%' order BY Nombres");

            //  st = this.getCnx().prepareCall("Select * from " + tabla + " where " + columna + " like '%" + value + "%'");
            System.out.println("Controlador.CUsuarios.Buscar_table()" + st.toString());
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
                System.out.println("Controlador.CUsuarios.Buscar_table()" + registros[1]);

                //per.setObservaciones(rs.getString("PersonaObservaciones"));
                //per.setFechaN(rs.getDate("PersonaFN").toString());
                //System.out.println("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "wehhhh");
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
                    "E-Mail", "Direccion", "Provincia", "Ciudad"};
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
            System.out.println("Controlador.CUsuarios.Buscar_table_Only()" + st.toString());
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
                System.out.println("Controlador.CUsuarios.Buscar_table_only()" + registros[1]);

            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "rrrrrrrrrrrrrraqqq");
        } finally {
            this.cerrar();
        }

        return modelo;
    }
}
