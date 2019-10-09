/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.Bodegas;
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
public class BodegasDao extends Coneccion {

    ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    private ArrayList<Bodegas> lista = new ArrayList<Bodegas>();
    private final String tabla = "bodegas";
    //private Conec mysql = new conexion(); //Instanciando la clase conexion
    //private Connection cn = mysql.conectar();

//    public Integer  guardar(Productos tarea) {
//        Integer codigoThisProducto=0;
//        try {
//
//            this.conectar();
//            PreparedStatement consulta;
//
//            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (Producto, codigoAlterno, codigoBarras, costo, utilidad, pvp, cantidad, "
//                    + "unidades,ubicacion,observacion, minimo, maximo, garantia, Modelos_Codigo, Modelos_Marcas_Codigo) VALUES(?,?,?,?,?,?,?, ?, ?,?,?,?, ?, ?,?)", Statement.RETURN_GENERATED_KEYS);
//            consulta.setString(1, tarea.getProducto().toUpperCase());
//            consulta.setString(2, tarea.getCodigoAlterno().toUpperCase());
//            consulta.setString(3, tarea.getCodigoBarras().toUpperCase());
//            consulta.setString(4, tarea.getCosto());
//            consulta.setString(5, tarea.getUtilidad());
//            consulta.setString(6, tarea.getPvp());
//            consulta.setInt(7, 0);
//            consulta.setString(8, tarea.getUnidades());
//            consulta.setString(9, tarea.getUbicacion());
//            consulta.setString(10, tarea.getObservacion());
//            consulta.setString(11, tarea.getMinimo());
//            consulta.setString(12, tarea.getMaximo());
//            consulta.setString(13, tarea.getGarantia());
//            consulta.setInt(14, tarea.getModelo_codigo());
//            consulta.setInt(15, tarea.getModelos_marcas_codigo());
//            System.out.println("Controlador.CUsuarios.guardar()" + consulta);
//            consulta.executeUpdate();
//            ResultSet rs = consulta.getGeneratedKeys();
//            if (rs.next()) {
//                codigoThisProducto = rs.getInt(1);                
//            }
//        } catch (SQLException ex) {
//            msg.setProgressBar_mensajae(ex.toString());
//            System.out.println("Controlador.CUsuarios.guardar()" + ex);
//        } finally {
//            this.cerrar();
//        }
//      return codigoThisProducto; 
//    }

    public void modificar(Bodegas persona) {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("UPDATE Productos SET "
                    + "Bodega = ?, "
                    + "descripcion = ? "
                    + "WHERE Codigo=?");
            st.setString(1, persona.getBodega().toUpperCase());
            st.setString(2, persona.getBodegaID());
            st.setInt(3, persona.getCodigo());
            String sql = st.toString();
            System.out.println("Controlador.Bodegas.Bodegas.modificar()" + sql);
            st.executeUpdate();
            
            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
        } catch (SQLException e) {
            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error" + e + sql, "Error al modificar Registro" + e.toString()));
            System.out.println("Controlador.Bodegass.guardar()" + e);
        } finally {
            this.cerrar();
        }

    }

    public ArrayList<Bodegas> listar() {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from Bodegas");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Bodegas per = new Bodegas();
                per.setCodigo(rs.getInt("Codigo"));
                per.setBodega(rs.getString("bodega"));
                per.setBodegaID(rs.getString("bodegaID"));
                per.setDescripcion(rs.getString("descripcion"));
                this.lista.add(per);
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }
//
//    public Productos buscarConID(Integer id) {
//        ResultSet rs;
//        Productos u = new Productos();
//        try {
//            this.conectar();
//            PreparedStatement st;
////            select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo
////            select usuarios.*, tipos_usuarios.codigo,tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo where usuarios.codigo = 1
//
//            st = this.getCnx().prepareCall("select Productos.*, modelos.Modelo from productos inner join modelos on modelos.Codigo=productos.Modelos_Codigo where productos.codigo ="+id+" order BY productos.producto LIMIT 0, 50");
//            //select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo
//
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//                Productos per = new Productos();
//                per.setCodigo(rs.getInt("Codigo"));
//                per.setProducto(rs.getString("producto"));
//                per.setCodigoAlterno(rs.getString("codigoAlterno"));
//                per.setCodigoBarras(rs.getString("codigoBarras"));
//                per.setCosto(rs.getString("costo"));
//                per.setUtilidad(rs.getString("utilidad"));
//                per.setPvp(rs.getString("pvp"));
//                per.setCantidad(rs.getInt("Cantidad"));
//                per.setUnidades(rs.getString("unidades"));
//                per.setUbicacion(rs.getString("ubicacion"));
//                per.setObservacion(rs.getString("observacion"));
//                per.setMinimo(rs.getString("minimo"));
//                per.setMaximo(rs.getString("maximo"));
//                per.setGarantia(rs.getString("garantia"));
//                per.setModelo_codigo(rs.getInt("Modelos_Codigo"));
//                per.setModelos_marcas_codigo(rs.getInt("Modelos_Marcas_Codigo"));                
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

//    public Productos buscarObjeto(String columna, String value) {
//        ResultSet rs;
//        Productos u = new Productos();
//        try {
//            this.conectar();
//            PreparedStatement st;
//            
//            st = this.getCnx().prepareCall("select Productos.*, modelos.Modelo from productos inner join modelos on modelos.Codigo=productos.Modelos_Codigo where "+tabla+"."+columna+" like '%" + value + "%' order BY productos.producto LIMIT 0, 50");
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//                Productos per = new Productos();
//                per.setCodigo(rs.getInt("Codigo"));
//                per.setProducto(rs.getString("producto"));
//                per.setCodigoAlterno(rs.getString("codigoAlterno"));
//                per.setCodigoBarras(rs.getString("codigoBarras"));
//                per.setCosto(rs.getString("costo"));
//                per.setUtilidad(rs.getString("utilidad"));
//                per.setPvp(rs.getString("pvp"));
//                per.setCantidad(rs.getInt("Cantidad"));
//                per.setUnidades(rs.getString("unidades"));
//                per.setUbicacion(rs.getString("ubicacion"));
//                per.setObservacion(rs.getString("observacion"));
//                per.setMinimo(rs.getString("minimo"));
//                per.setMaximo(rs.getString("maximo"));
//                per.setGarantia(rs.getString("garantia"));
//                per.setModelo_codigo(rs.getInt("Modelos_Codigo"));
//                per.setModelos_marcas_codigo(rs.getInt("Modelos_Marcas_Codigo"));                
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

//    public void eliminar(Productos obj) throws Exception {
//        try {
//            this.conectar();
//            PreparedStatement st = this.con.prepareStatement("DELETE from "+tabla+" "
//                    + "WHERE Codigo=?");
//            st.setDouble(1, obj.getCodigo());
//            st.executeUpdate();
//        } catch (SQLException e) {
//            msg.setProgressBar_mensajae("Error..!! " + e);
//        } finally {
//            this.cerrar();
//        }
//
//    }

    public DefaultTableModel Buscar_Llenar_table() {
        DefaultTableModel modelo = null;
        String[] titulos
                = {"CODIGO","BODEGA ID", "BODEGA", "DESCRIPCION"};
        
        String[] registros = new String[4];
    modelo = new DefaultTableModel(null, titulos) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // make read only fields except column 0,13,14
                return column == 2 || column == 3;
                //  return false;
            }
        };

        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("SELECT * FROM bodegas");                       
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {

                registros[0] = String.valueOf(rs.getInt("CODIGO"));
                registros[1] = rs.getString("bodegaID");
                registros[2] = rs.getString("bodega");
                registros[3] = rs.getString("descripcion");
                
                modelo.addRow(registros);
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "hhhh");
        } finally {
            this.cerrar();
        }

        return modelo;
    }
public DefaultTableModel Buscar_table_only_Activos() {
       DefaultTableModel modelo = null;
        String[] titulos
                = {"Codigo", "Codigo de Barras", "NOMBRE DEL PRODUCTOS", "COSTO",
                    "Utilidad", "pvp",
                    "Cantidad", "Maximos", "Minimos"};
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
            st = this.getCnx().prepareCall("select Productos.*, modelos.Modelo from productos inner join modelos on modelos.Codigo=productos.Modelos_Codigo  order BY productos.producto LIMIT 0, 50");           
            System.out.println("Controlador.CUsuarios.Buscar_table()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {

                registros[0] = String.valueOf(rs.getInt("Codigo"));
                registros[1] = rs.getString("codigoBarras");
                registros[2] = rs.getString("Producto");
                registros[3] = rs.getString("costo");
                registros[4] = rs.getString("utilidad");
                registros[5] = rs.getString("pvp");
                registros[6] = rs.getString("cantidad");
                registros[7] = rs.getString("maximo");
                registros[8] = rs.getString("minimo");
                
                modelo.addRow(registros);
                System.out.println("Controlador.CUsuarios.Buscar_table()" + registros[1]);

                //per.setObservaciones(rs.getString("PersonaObservaciones"));
                //per.setFechaN(rs.getDate("PersonaFN").toString());
                //System.out.println("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "hhhh");
        } finally {
            this.cerrar();
        }
        return modelo;
    }
}
