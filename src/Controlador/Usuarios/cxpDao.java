/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.Cxp;
import Vista.Principal;
import Vlidaciones.ProgressBar;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import ClasesAuxiliares.debug.Deb;

/**
 *
 * @author USUARIO
 */
public class cxpDao extends Coneccion {

    ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    String tabla = "cxp";
    private ArrayList<Cxp> lista = new ArrayList<Cxp>();

    public Integer guardar(Cxp tarea) {
        Integer CodigoThisInsert = null;
        try {
            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (tipo,"
                    + " descripcion,fechaVencimiento,total,abono,saldo,compras_codigo,formasPagoc_codigo,diasCredito,diasAtrazo,proveedores_codigo)"
                    + " VALUES(?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            
            
            consulta.setString(1, tarea.getTipo().toUpperCase());
            consulta.setString(2, tarea.getDescripcion().toUpperCase());
             long d = tarea.getFechaVencimiento().getTime();
            java.sql.Date fecha = new java.sql.Date(d);
            consulta.setDate(3, fecha);
            consulta.setString(4, tarea.getTotal());
            consulta.setString(5, tarea.getAbono());
            consulta.setString(6, tarea.getSaldo());
            consulta.setInt(7, tarea.getCompras_codigo());
            consulta.setInt(8, tarea.getFormasPagoc_codigo());
            consulta.setString(9, tarea.getDiasCredito());
            consulta.setString(10, tarea.getDiasAtrazo());
            consulta.setInt(11, tarea.getProveedores_Codigo());
            Deb.consola("Controlador.Usuarios.PagosDao.guardar()consulta: "+consulta.toString());
            consulta.executeUpdate();
            ResultSet rs = consulta.getGeneratedKeys();
            if (rs.next()) {
                CodigoThisInsert = rs.getInt(1);
                //Deb.consola("Controlador.Usuarios.FacturasDao.guardar()>: " + codigoThisFactura);
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex+"ssssssss");
            msg.setProgressBar_mensajae("Error..!! " + ex);

        } finally {
            this.cerrar();
        }
        return CodigoThisInsert;
    }

//    public DefaultTableModel Buscar_table(String columna, String value) {
//        DefaultTableModel modelo = null;
//
//        String[] titulos
//                = {"Codigo", "Marcas", "Descripcion"};
//        String[] registros = new String[3];
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
//            //Deb.consola("Controlador.CUsuarios.Buscar_table()" + st.toString());
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//
//                registros[0] = String.valueOf(rs.getInt("Codigo"));
//                registros[1] = rs.getString("Marca");
//                registros[2] = rs.getString("Descripcion");
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
//
//    public DefaultTableModel Buscar_table_only_Activos() {
//        DefaultTableModel modelo = null;
//        String sql = "select * from Marcas  order BY Marca LIMIT 0, 50";
//        String[] titulos
//                = {"Codigo", "Marcas", "Descripcion"};
//        String[] registros = new String[3];
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
//            Deb.consola("Controlador.CUsuarios.Buscar_table()" + st.toString());
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//
//                registros[0] = String.valueOf(rs.getInt("Codigo"));
//                registros[1] = rs.getString("Marca");
//                registros[2] = rs.getString("Descripcion");
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
//
//    public void modificar(Pagos persona) {
//        try {
//            this.conectar();
//            PreparedStatement st = this.con.prepareStatement("UPDATE " + tabla + " SET "
//                    + "Marca = ?, "
//                    + "Descripcion = ? "
//                    + "where codigo = ?");
//            st.setString(1, persona.getMarca().toUpperCase());
//            st.setString(2, persona.getDescripcion().toUpperCase());
//            st.setDouble(3, persona.getCodigo());
//            String sql = st.toString();
//
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

    public ArrayList<Cxp> listarBuscarConCodigo(Integer cod) {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla + " where codigo = " + cod + "");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Cxp per = new Cxp();
                per.setCodigo(rs.getInt("Codigo"));
                per.setTipo(rs.getString("tipo"));
                per.setDescripcion(rs.getString("Descripcion"));
                per.setFechaVencimiento(rs.getDate("fechaVencimiento")); 
                per.setTotal(rs.getString("total"));
                per.setAbono(rs.getString("abono"));
                per.setSaldo(rs.getString("saldo"));
                per.setCompras_codigo(rs.getInt("compras_codigo"));
                per.setFormasPagoc_codigo(rs.getInt("formasPagoc_codigo"));

                this.lista.add(per);
            }

        } catch (Exception ex) {
            msg.setMensaje(ex.toString());
            //Deb.consola("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }

    public ArrayList<Cxp> listar() {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla + "" );
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Cxp per = new Cxp();
                per.setCodigo(rs.getInt("Codigo"));
                per.setTipo(rs.getString("tipo"));
                per.setDescripcion(rs.getString("Descripcion"));
                per.setFechaVencimiento(rs.getDate("fechaVencimiento")); 
                per.setTotal(rs.getString("total"));
                per.setAbono(rs.getString("abono"));
                per.setSaldo(rs.getString("saldo"));
                per.setCompras_codigo(rs.getInt("compras_codigo"));
                per.setFormasPagoc_codigo(rs.getInt("formasPagoc_codigo"));

                this.lista.add(per);
            }

        } catch (Exception ex) {
            msg.setMensaje(ex.toString());
            //Deb.consola("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }

//    public Marcas buscarConID(Integer id) {
//        ResultSet rs;
//        Marcas u = new Marcas();
//        try {
//            this.conectar();
//            PreparedStatement st;
//            st = this.getCnx().prepareCall("Select * from " + tabla + " where codigo = " + id);
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//                Marcas per = new Marcas();
//                per.setCodigo(rs.getInt("Codigo"));
//                per.setMarca(rs.getString("Marca"));
//                per.setDescripcion(rs.getString("Descripcion"));
//                u = per;
//            }
//
//        } catch (Exception ex) {
//            msg.setProgressBar_mensajae(ex.toString());
//        } finally {
//            this.cerrar();
//        }
//
//        return u;
//    }

    public ResultSet listar_table(String sql) {
        //
        ResultSet rs = null;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall(sql);
            rs = st.executeQuery();
        } catch (Exception ex) {
            msg.setProgressBar_mensajae(ex.toString());
        } finally {
            //  this.cerrar();
        }

        return rs;

    }

    public void eliminar(Cxp persona) throws Exception {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("DELETE from " + tabla
                    + " WHERE Codigo=?");
            st.setInt(1, persona.getCodigo());
            st.executeUpdate();
        } catch (SQLException e) {
            msg.setProgressBar_mensajae("Error..!! " + e);
        } finally {
            this.cerrar();
        }

    }

}
