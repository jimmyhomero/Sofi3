/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Sat;

import ClasesAuxiliares.debug.Deb;
import Controlador.Usuarios.*;
import Controlador.Coneccion;
import Modelo.Clientes;
import Modelo.SatAparato;
import Modelo.SatOrden;
import Modelo.Usuarios;
import Vista.Principal;
import Vlidaciones.ProgressBar;
import java.awt.Font;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
public class SatOrdenDao extends Coneccion {

    ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    private List<SatOrden> lista = new ArrayList<SatOrden>();
    private final String tabla = "SatOrden";
    //private Conec mysql = new conexion(); //Instanciando la clase conexion
    //private Connection cn = mysql.conectar();

    public Integer guardar(SatOrden tarea) {
        int codigoThisFactura = 0;
        try {

            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement("INSERT INTO SatOrden (numero,usuarios_codigo,clientes_codigo,descripcion) VALUES (?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            Deb.consola("Controlador.satAparato.guardar()" + consulta);
            consulta.setString(1, tarea.getNumero());
            consulta.setInt(2, tarea.getUsuarios_codigo());
            consulta.setInt(3, tarea.getClientes_codigo());
            consulta.setString(4, tarea.getDescripcion());
            Deb.consola("Controlador.satAparato.guardar()" + consulta);
            Deb.consola("Controlador.Sat.SatAparatoDao.guardar():  " + consulta);
            consulta.executeUpdate();
            ResultSet rs = consulta.getGeneratedKeys();
            if (rs.next()) {
                codigoThisFactura = rs.getInt(1);
                Deb.consola("Controlador.Usuarios.SatOrden.guardar()>: " + codigoThisFactura);
            }
        } catch (SQLException ex) {

            Deb.consola("Controlador.Sat.SatAparatoDao.guardar():  " + ex);
            msg.setProgressBar_mensajae(ex.toString());
            Deb.consola("Controlador.satAparato.guardar() : " + ex);
        } finally {
            this.cerrar();
        }
        return codigoThisFactura;
    }

//    public void modificar(Clientes persona)  {
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
    public List<SatOrden> listar() {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from SatOrden  order BY fecha_ingreso");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                SatOrden per = new SatOrden();
                per.setCodigo(rs.getInt("Codigo"));
                per.setNumero(rs.getString("numero"));
                per.setFecha_ingreso(rs.getDate("fecha_ingreso"));
                per.setDescripcion(rs.getString("descripcion"));
                per.setUsuarios_codigo(rs.getInt("usuarios_codigo"));
                per.setClientes_codigo(rs.getInt("clientes_codigo"));

                this.lista.add(per);
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }

    public SatOrden buscarSatOrdenConID(Integer id) {
        ResultSet rs;
        SatOrden u = new SatOrden();
        try {
            this.conectar();
            PreparedStatement st;
//            select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo
//            select usuarios.*, tipos_usuarios.codigo,tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo where usuarios.codigo = 1

            st = this.getCnx().prepareCall("select * from SatOrden where codigo= " + id + " order BY fecha_ingreso");
            //select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo

            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                SatOrden per = new SatOrden();
                per.setCodigo(rs.getInt("Codigo"));
                per.setNumero(rs.getString("numero"));
                per.setFecha_ingreso(rs.getDate("fecha_ingreso"));
                per.setDescripcion(rs.getString("descripcion"));
                per.setUsuarios_codigo(rs.getInt("usuarios_codigo"));
                per.setClientes_codigo(rs.getInt("clientes_codigo"));

                u = per;
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }

    public ArrayList<SatOrden> buscarSatOrdenLikeDescripcion(String nombre) {
        ArrayList<SatOrden> c = new ArrayList<>();
        ResultSet rs;
        SatOrden u = new SatOrden();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from SatOrden "
                    + "where descripcion like '%" + nombre + "%' order BY fecha_ingreso LIMIT 0, 50");
            rs = st.executeQuery();

            //this.lista= new ArrayList();
            while (rs.next()) {
                SatOrden per = new SatOrden();
                per.setCodigo(rs.getInt("Codigo"));
                per.setNumero(rs.getString("numero"));
                per.setFecha_ingreso(rs.getDate("fecha_ingreso"));
                per.setDescripcion(rs.getString("descripcion"));
                per.setUsuarios_codigo(rs.getInt("usuarios_codigo"));
                per.setClientes_codigo(rs.getInt("clientes_codigo"));
                u = per;
                c.add(per);
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConCedula()sss" + ex);
        } finally {
            this.cerrar();
//             if(){
//            u.setCodigo(-100);
//            }

        }

        return c;
    }

    public ArrayList<SatOrden> buscarAparatoPorIDCliente(String codigo) {
        ArrayList<SatOrden> c = new ArrayList<>();
        ResultSet rs;
        SatOrden u = new SatOrden();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from SatOrden "
                    + "where clientes_codigo = " + codigo);
            rs = st.executeQuery();

            //this.lista= new ArrayList();
            while (rs.next()) {
                SatOrden per = new SatOrden();
                per.setCodigo(rs.getInt("Codigo"));
                per.setNumero(rs.getString("numero"));
                per.setFecha_ingreso(rs.getDate("fecha_ingreso"));
                per.setDescripcion(rs.getString("descripcion"));
                per.setUsuarios_codigo(rs.getInt("usuarios_codigo"));
                per.setClientes_codigo(rs.getInt("clientes_codigo"));
                u = per;
                c.add(per);
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConCedula()sss" + ex);
        } finally {
            this.cerrar();
//             if(){
//            u.setCodigo(-100);
//            }

        }

        return c;
    }

    public String getNextNueroDeOrden() {

        ResultSet rs;
        String maxnumeroOrden = "1";
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("SELECT max(satOrden.numero) as numero from satOrden");
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
            Deb.consola("Controlador.CUsuarios.BuscarConCedula()sss" + ex);
        } finally {
            this.cerrar();
        }

        return maxnumeroOrden;
    }

    public void eliminar(SatAparato persona) throws Exception {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("DELETE from SatOrden "
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
                = {"CODIGO", "CLIENTE", "APARATO", "MARCA", "MODELO", "SERIE",};
        String[] registros = new String[6];
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
            st = this.getCnx().prepareCall("select * from SatAparato where " + columna + "  like '%" + value + "%' order BY descripcion");

            //  st = this.getCnx().prepareCall("Select * from " + tabla + " where " + columna + " like '%" + value + "%'");
            Deb.consola("Controlador.CUsuarios.Buscar_table()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {

                registros[0] = String.valueOf(rs.getInt("Codigo"));
                registros[0] = rs.getString("descripcion");
                registros[0] = rs.getString("color");
                registros[0] = rs.getString("serie");
                registros[0] = rs.getString("parte");
                registros[0] = rs.getString("categoria");
                registros[0] = rs.getString("marca");
                registros[0] = rs.getString("modelo");
                registros[0] = String.valueOf(rs.getDate("fechacompra"));
                registros[0] = String.valueOf(rs.getDate("fingarantia"));
                registros[0] = String.valueOf(rs.getDate("fechaIngreso"));
                registros[0] = String.valueOf(rs.getInt("satorden_codigo"));
                registros[0] = String.valueOf(rs.getInt("usuarios_codigo"));
                registros[0] = String.valueOf(rs.getInt("clientes_codigo"));
                modelo.addRow(registros);
                Deb.consola("Controlador.CUsuarios.Buscar_table()" + registros[1]);

                //per.setObservaciones(rs.getString("PersonaObservaciones"));
                //per.setFechaN(rs.getDate("PersonaFN").toString());
                //Deb.consola("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "wehhhh");
        } finally {
            this.cerrar();
        }

        return modelo;
    }

}
