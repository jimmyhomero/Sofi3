/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.Productos;
import Vista.Principal;
import Vlidaciones.ProgressBar;
import Vlidaciones.ValidaNUmeros;
import java.awt.Font;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;

/**
 *
 * @author USUARIO
 */
public class ProductosDao extends Coneccion {

    ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    private List<Productos> lista = new ArrayList<Productos>();
    private final String tabla = "productos";
    //private Conec mysql = new conexion(); //Instanciando la clase conexion
    //private Connection cn = mysql.conectar();

    public Integer guardar(Productos tarea) {
        Integer codigoThisProducto = 0;
        try {

            this.conectar();
            PreparedStatement consulta;
            FileInputStream fis = null;

            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (Producto, codigoAlterno, codigoBarras, costo, utilidad, pvp, cantidad, "
                    + "unidades,ubicacion,observacion, minimo, maximo, garantia, Modelos_Codigo, Modelos_Marcas_Codigo,"
                    + "impuesto,iva12,iva0,ProductoOServicio,p1,p2,p3,base) VALUES(?,?,?,?,?,?,?,?, ?, ?,?,?,?, ?, ?,?, ?,?,?,?, ?, ?,?)", Statement.RETURN_GENERATED_KEYS);

            consulta.setString(1, tarea.getProducto().toUpperCase());
            consulta.setString(2, tarea.getCodigoAlterno().toUpperCase());
            consulta.setString(3, tarea.getCodigoBarras().toUpperCase());

            consulta.setString(4, tarea.getCosto());
            consulta.setString(5, tarea.getUtilidad());
            consulta.setString(6, tarea.getPvp());
            consulta.setInt(7, 0);
            consulta.setString(8, tarea.getUnidades());
            consulta.setString(9, tarea.getUbicacion());
            consulta.setString(10, tarea.getObservacion());
            consulta.setString(11, tarea.getMinimo());
            consulta.setString(12, tarea.getMaximo());
            consulta.setString(13, tarea.getGarantia());
//            try {
//                fis = new FileInputStream(img);
//            } catch (FileNotFoundException ex) {
//                Logger.getLogger(ProductosDao.class.getName()).log(Level.SEVERE, null, ex);
//            }
//            consulta.setBinaryStream(14,fis,(int)img.length());
            consulta.setInt(14, tarea.getModelo_codigo());
            consulta.setInt(15, tarea.getModelos_marcas_codigo());
            consulta.setString(16, tarea.getImpuesto());
            if (ValidaNUmeros.isOnlyDouble(tarea.getIva12().toString())) {
                consulta.setDouble(17, tarea.getIva12());
            }
            if (ValidaNUmeros.isOnlyDouble(tarea.getIva0().toString())) {
                consulta.setDouble(18, tarea.getIva0());
            }
            consulta.setInt(19, tarea.getProductoOServicio());
            consulta.setDouble(20, tarea.getP1());
            consulta.setDouble(21, tarea.getP2());
            consulta.setDouble(22, tarea.getP3());
            consulta.setDouble(23, tarea.getBase());
            System.out.println("Controlador.CUsuarios.guardar()" + consulta);
            consulta.executeUpdate();
            ResultSet rs = consulta.getGeneratedKeys();
            if (rs.next()) {
                codigoThisProducto = rs.getInt(1);
            }
        } catch (SQLException ex) {
            msg.setProgressBar_mensajae(ex.toString());
            System.out.println("Controlador.CUsuarios.guardar()" + ex);
        } finally {
            this.cerrar();
        }
        return codigoThisProducto;
    }

    public Integer guardarConImagen(Productos tarea, File img) {
        Integer codigoThisProducto = 0;
        try {

            this.conectar();
            PreparedStatement consulta;
            FileInputStream fis = null;

            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (Producto, codigoAlterno, codigoBarras, costo, utilidad, pvp, cantidad, "
                    + "unidades,ubicacion,observacion, minimo, maximo, garantia,imagen, Modelos_Codigo, Modelos_Marcas_Codigo,"
                    + "impuesto,iva12,iva0,ProductoOServicio,p1,p2,p3,base) VALUES(?,?,?,?,?,?,?,?, ?, ?,?,?,?, ?, ?,?, ?,?,?,?, ?, ?,?,?)", Statement.RETURN_GENERATED_KEYS);
            consulta.setString(1, tarea.getProducto().toUpperCase());
            consulta.setString(2, tarea.getCodigoAlterno().toUpperCase());
            consulta.setString(3, tarea.getCodigoBarras().toUpperCase());
            consulta.setString(4, tarea.getCosto());
            consulta.setString(5, tarea.getUtilidad());
            consulta.setString(6, tarea.getPvp());
            consulta.setInt(7, 0);
            consulta.setString(8, tarea.getUnidades());
            consulta.setString(9, tarea.getUbicacion());
            consulta.setString(10, tarea.getObservacion());
            consulta.setString(11, tarea.getMinimo());
            consulta.setString(12, tarea.getMaximo());
            consulta.setString(13, tarea.getGarantia());
            try {
                fis = new FileInputStream(img);
            } catch (FileNotFoundException ex) {
                Logger.getLogger(ProductosDao.class.getName()).log(Level.SEVERE, null, ex);
            }
            consulta.setBinaryStream(14, fis, (int) img.length());
            consulta.setInt(15, tarea.getModelo_codigo());
            consulta.setInt(16, tarea.getModelos_marcas_codigo());

            consulta.setString(17, tarea.getImpuesto());
            if (ValidaNUmeros.isOnlyDouble(tarea.getIva12().toString())) {
                consulta.setDouble(18, tarea.getIva12());
            }
            if (ValidaNUmeros.isOnlyDouble(tarea.getIva0().toString())) {
                consulta.setDouble(19, tarea.getIva0());
            }
            consulta.setInt(20, tarea.getProductoOServicio());
            consulta.setDouble(21, tarea.getP1());
            consulta.setDouble(22, tarea.getP2());
            consulta.setDouble(23, tarea.getP3());
            consulta.setDouble(24, tarea.getBase());
            System.out.println("Controlador.CUsuarios.guardar()" + consulta);
            consulta.executeUpdate();
            ResultSet rs = consulta.getGeneratedKeys();
            if (rs.next()) {
                codigoThisProducto = rs.getInt(1);
            }
        } catch (SQLException ex) {
            msg.setProgressBar_mensajae(ex.toString());
            System.out.println("Controlador.CUsuarios.guardar()" + ex);
        } finally {
            this.cerrar();
        }
        return codigoThisProducto;
    }

    public void modificar(Productos persona, File img) {
        FileInputStream fis = null;
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("UPDATE Productos SET "
                    + "Producto = ?, "
                    + "codigoAlterno = ?, "
                    + "codigoBarras = ?, "
                    + "costo= ?, "
                    + "utilidad= ?, "
                    + "pvp = ?, "
                    + "unidades = ?, "
                    + "ubicacion = ?, "
                    + "observacion = ?, "
                    + "minimo = ?, "
                    + "maximo = ?, "
                    + "garantia = ?, "
                    + "Modelos_Codigo = ?, "
                    + "Modelos_Marcas_Codigo = ?, "
                    + "imagen=?,"
                    + "impuesto=?,"
                    + "iva12=?,"
                    + "iva0=?,"
                    + "ProductoOServicio=?,"
                    + "p1=?,"
                    + "p2=?,"
                    + "p3=?,"
                    + "base=?"
                    + "WHERE Codigo=?");
            st.setString(1, persona.getProducto().toUpperCase());
            st.setString(2, persona.getCodigoAlterno().toUpperCase());
            st.setString(3, persona.getCodigoBarras());
            st.setString(4, persona.getCosto());
            st.setString(5, persona.getUtilidad());
            st.setString(6, persona.getPvp());
            st.setString(7, persona.getUnidades().toUpperCase());
            st.setString(8, persona.getUbicacion().toUpperCase());
            st.setString(9, persona.getObservacion().toUpperCase());
            st.setString(10, persona.getMinimo());
            st.setString(11, persona.getMaximo());
            st.setString(12, persona.getGarantia().toUpperCase());
            st.setInt(13, persona.getModelo_codigo());
            st.setInt(14, persona.getModelos_marcas_codigo());

            try {
                Image a;
                fis = new FileInputStream(img);
                 st.setBinaryStream(15, fis, (int) img.length());
            } catch (FileNotFoundException ex) {
                Logger.getLogger(ProductosDao.class.getName()).log(Level.SEVERE, null, ex);
            }
           

            st.setString(16, persona.getImpuesto());
            if (ValidaNUmeros.isOnlyDouble(persona.getIva12().toString())) {
                st.setDouble(17, persona.getIva12());
            }
            if (ValidaNUmeros.isOnlyDouble(persona.getIva0().toString())) {
                st.setDouble(18, persona.getIva0());
            }
            st.setInt(19, persona.getProductoOServicio());
            st.setDouble(20, persona.getP1());
            st.setDouble(21, persona.getP2());
            st.setDouble(22, persona.getP3());
            st.setDouble(23, persona.getBase());
            st.setInt(24, persona.getCodigo());
            String sql = st.toString();
            System.out.println("Controlador.Usuarios.CUsuarios.modificar()" + sql);
            st.executeUpdate();
            Principal.jProgressBar2.setString("eeeeeeeeeeeee");
            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
        } catch (SQLException e) {
            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error" + e + sql, "Error al modificar Registro" + e.toString()));
            System.out.println("Controlador.CUsuarios.guardar()" + e);
        } finally {
            this.cerrar();
        }

    }

    public void modificarSinImagen(Productos persona) {
        FileInputStream fis = null;
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("UPDATE Productos SET "
                    + "Producto = ?, "
                    + "codigoAlterno = ?, "
                    + "codigoBarras = ?, "
                    + "costo= ?, "
                    + "utilidad= ?, "
                    + "pvp = ?, "
                    + "unidades = ?, "
                    + "ubicacion = ?, "
                    + "observacion = ?, "
                    + "minimo = ?, "
                    + "maximo = ?, "
                    + "garantia = ?, "
                    + "Modelos_Codigo = ?, "
                    + "Modelos_Marcas_Codigo = ?, "
                    + "impuesto=?,"
                    + "iva12=?,"
                    + "iva0=?,"
                    + "ProductoOServicio=?,"
                    + "p1=?,"
                    + "p2=?,"
                    + "p3=?,"
                    + "base=?"
                    + "WHERE Codigo=?");
            st.setString(1, persona.getProducto().toUpperCase());
            st.setString(2, persona.getCodigoAlterno().toUpperCase());
            st.setString(3, persona.getCodigoBarras());
            st.setString(4, persona.getCosto());
            st.setString(5, persona.getUtilidad());
            st.setString(6, persona.getPvp());
            st.setString(7, persona.getUnidades().toUpperCase());
            st.setString(8, persona.getUbicacion().toUpperCase());
            st.setString(9, persona.getObservacion().toUpperCase());
            st.setString(10, persona.getMinimo());
            st.setString(11, persona.getMaximo());
            st.setString(12, persona.getGarantia().toUpperCase());
            st.setInt(13, persona.getModelo_codigo());
            st.setInt(14, persona.getModelos_marcas_codigo());
//            
//            try {
//                fis = new FileInputStream(img);
//            } catch (FileNotFoundException ex) {
//                Logger.getLogger(ProductosDao.class.getName()).log(Level.SEVERE, null, ex);
//            }
//            st.setBinaryStream(15, fis, (int) img.length());

            st.setString(15, persona.getImpuesto());
            if (ValidaNUmeros.isOnlyDouble(persona.getIva12().toString())) {
                st.setDouble(16, persona.getIva12());
            }
            if (ValidaNUmeros.isOnlyDouble(persona.getIva0().toString())) {
                st.setDouble(17, persona.getIva0());
            }
            st.setInt(18, persona.getProductoOServicio());
            st.setDouble(19, persona.getP1());
            st.setDouble(20, persona.getP2());
            st.setDouble(21, persona.getP3());
            st.setDouble(22, persona.getBase());
            st.setInt(23, persona.getCodigo());
            String sql = st.toString();
            System.out.println("Controlador.Usuarios.CUsuarios.modificar()" + sql);
            st.executeUpdate();
            Principal.jProgressBar2.setString("eeeeeeeeeeeee");
            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
        } catch (SQLException e) {
            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error" + e + sql, "Error al modificar Registro" + e.toString()));
            System.out.println("Controlador.CUsuarios.guardar()" + e);
        } finally {
            this.cerrar();
        }

    }

    
    public void modificarPreciosAlRegistrarCompra(Productos persona) {
        FileInputStream fis = null;
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("UPDATE Productos SET "
                    + "costo= ?, "                    
                    + "pvp= ?, "            
                    + "p1=?,"
                    + "p2=?,"
                    + "p3=?,"
                    + "base=?"
                    + "WHERE Codigo=?");
            st.setString(1, persona.getCosto());            
            st.setString(2, persona.getPvp());
            st.setDouble(3, persona.getP1());
            st.setDouble(4, persona.getP2());
            st.setDouble(5, persona.getP3());
            st.setDouble(6, persona.getBase());
            st.setInt(7, persona.getCodigo());
            String sql = st.toString();
            System.out.println("Controlador.Usuarios.CUsuarios.modificar()" + sql);
            st.executeUpdate();
          //  Principal.jProgressBar2.setString("eeeeeeeeeeeee");
            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
        } catch (SQLException e) {
            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error" + e + sql, "Error al modificar Registro" + e.toString()));
            System.out.println("Controlador.CUsuarios.guardar()" + e);
        } finally {
            this.cerrar();
        }

    }
    
    public List<Productos> listar() {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            //   st = this.getCnx().prepareCall("select Productos.*, modelos.Modelo from productos inner join modelos on modelos.Codigo=productos.Modelos_Codigo order BY productos.producto");
            st = this.getCnx().prepareCall("select * from productos order BY producto");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Productos per = new Productos();
                per.setCodigo(rs.getInt("Codigo"));
                per.setProducto(rs.getString("producto"));
                per.setCodigoAlterno(rs.getString("codigoAlterno"));
                per.setCodigoBarras(rs.getString("codigoBarras"));
                per.setCosto(rs.getString("costo"));
                per.setUtilidad(rs.getString("utilidad"));
                per.setPvp(rs.getString("pvp"));
                per.setCantidad(rs.getInt("Cantidad"));
                per.setUnidades(rs.getString("unidades"));
                per.setUbicacion(rs.getString("ubicacion"));
                per.setObservacion(rs.getString("observacion"));
                per.setMinimo(rs.getString("minimo"));
                if (rs.getBlob("imagen") != null) {
                    Blob blob = rs.getBlob("imagen");

                    byte[] data = blob.getBytes(1, (int) blob.length());
                    BufferedImage img = null;
                    try {
                        img = ImageIO.read(new ByteArrayInputStream(data));
                    } catch (IOException ex) {
                        Logger.getLogger(ProductosDao.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    per.setImagen(img);
                }
                per.setMaximo(rs.getString("maximo"));
                per.setGarantia(rs.getString("garantia"));
                per.setModelo_codigo(rs.getInt("Modelos_Codigo"));
                per.setModelos_marcas_codigo(rs.getInt("Modelos_Marcas_Codigo"));
    //            JOptionPane.showMessageDialog(null, "--  "+rs.getString("b" + Principal.bodegaPredeterminadaenVenta.substring(0, 1))+"  --");
                per.setBodegaPredVenta(rs.getString("b" + Principal.bodegaPredeterminadaenVenta.substring(0, 1)));
                this.lista.add(per);
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }
    
    public List<Productos> listarLikeok( String [] cad) {
        String sql="";
           switch (cad.length) {
                    case 1:
                        sql="SELECT * FROM `productos` WHERE `producto` LIKE '%"+cad[0]+"%'";
                        break;
                    case 2:
                        sql="SELECT * FROM `productos` WHERE `producto` LIKE '%"+cad[0]+"%' and `producto` LIKE '%"+cad[1]+"%'";
                        break;
                    case 3:
                        sql="SELECT * FROM `productos` WHERE `producto` LIKE '%"+cad[0]+"%' and `producto` LIKE '%"+cad[1]+"%' and `producto` LIKE '%"+cad[2]+"%'";
                        break;
                    case 4:
                        sql="SELECT * FROM `productos` WHERE `producto` LIKE '%"+cad[0]+"%' and `producto` LIKE '%"+cad[1]+"%' and `producto` LIKE '%"+cad[2]+"%' and `producto` LIKE '%"+cad[3]+"%'";
                        break;
                    case 5:
                        sql="SELECT * FROM `productos` WHERE `producto` LIKE '%"+cad[0]+"%' and `producto` LIKE '%"+cad[1]+"%' and `producto` LIKE '%"+cad[2]+"%' and `producto` LIKE '%"+cad[3]+"%' and `producto` LIKE '%"+cad[4]+"%'";
                        break;   
                        
                }
           System.out.println("SQLxL: "+sql);
        ResultSet rs;
        
        
        try {
            this.conectar();
            PreparedStatement st;
            //   st = this.getCnx().prepareCall("select Productos.*, modelos.Modelo from productos inner join modelos on modelos.Codigo=productos.Modelos_Codigo order BY productos.producto");
            st = this.getCnx().prepareCall(sql);
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Productos per = new Productos();
                per.setCodigo(rs.getInt("Codigo"));
                per.setProducto(rs.getString("producto"));
                per.setCodigoAlterno(rs.getString("codigoAlterno"));
                per.setCodigoBarras(rs.getString("codigoBarras"));
                per.setCosto(rs.getString("costo"));
                per.setUtilidad(rs.getString("utilidad"));
                per.setPvp(rs.getString("pvp"));
                per.setCantidad(rs.getInt("Cantidad"));
                per.setUnidades(rs.getString("unidades"));
                per.setUbicacion(rs.getString("ubicacion"));
                per.setObservacion(rs.getString("observacion"));
                per.setMinimo(rs.getString("minimo"));
                if (rs.getBlob("imagen") != null) {
                    Blob blob = rs.getBlob("imagen");

                    byte[] data = blob.getBytes(1, (int) blob.length());
                    BufferedImage img = null;
                    try {
                        img = ImageIO.read(new ByteArrayInputStream(data));
                    } catch (IOException ex) {
                        Logger.getLogger(ProductosDao.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    per.setImagen(img);
                }
                per.setMaximo(rs.getString("maximo"));
                per.setGarantia(rs.getString("garantia"));
                per.setModelo_codigo(rs.getInt("Modelos_Codigo"));
                per.setModelos_marcas_codigo(rs.getInt("Modelos_Marcas_Codigo"));
    //            JOptionPane.showMessageDialog(null, "--  "+rs.getString("b" + Principal.bodegaPredeterminadaenVenta.substring(0, 1))+"  --");
                per.setBodegaPredVenta(rs.getString("b" + Principal.bodegaPredeterminadaenVenta.substring(0, 1)));
                this.lista.add(per);
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }
    
    public List<Productos> listarlike(String val) {
        ResultSet rs;
        
        
        
        try {
            this.conectar();
            PreparedStatement st;
            
            //   st = this.getCnx().prepareCall("select Productos.*, modelos.Modelo from productos inner join modelos on modelos.Codigo=productos.Modelos_Codigo order BY productos.producto");            
            st = this.getCnx().prepareCall("select * from productos where producto like '%"+val+"%' order BY producto");            
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Productos per = new Productos();
                per.setCodigo(rs.getInt("Codigo"));
                per.setProducto(rs.getString("producto"));
                per.setCodigoAlterno(rs.getString("codigoAlterno"));
                per.setCodigoBarras(rs.getString("codigoBarras"));
                per.setCosto(rs.getString("costo"));
                per.setUtilidad(rs.getString("utilidad"));
                per.setPvp(rs.getString("pvp"));
                per.setCantidad(rs.getInt("Cantidad"));
                per.setUnidades(rs.getString("unidades"));
                per.setUbicacion(rs.getString("ubicacion"));
                per.setObservacion(rs.getString("observacion"));
                per.setMinimo(rs.getString("minimo"));
                if (rs.getBlob("imagen") != null) {
                    Blob blob = rs.getBlob("imagen");

                    byte[] data = blob.getBytes(1, (int) blob.length());
                    BufferedImage img = null;
                    try {
                        img = ImageIO.read(new ByteArrayInputStream(data));
                    } catch (IOException ex) {
                        Logger.getLogger(ProductosDao.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    per.setImagen(img);
                }
                per.setMaximo(rs.getString("maximo"));
                per.setGarantia(rs.getString("garantia"));
                per.setModelo_codigo(rs.getInt("Modelos_Codigo"));
                per.setModelos_marcas_codigo(rs.getInt("Modelos_Marcas_Codigo"));
    //            JOptionPane.showMessageDialog(null, "--  "+rs.getString("b" + Principal.bodegaPredeterminadaenVenta.substring(0, 1))+"  --");
                per.setBodegaPredVenta(rs.getString("b" + Principal.bodegaPredeterminadaenVenta.substring(0, 1)));
                this.lista.add(per);
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }

    public Productos buscarConID(Integer id) {
        ResultSet rs;
        Productos u = new Productos();
        try {
            this.conectar();
            PreparedStatement st;
//            select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo
//            select usuarios.*, tipos_usuarios.codigo,tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo where usuarios.codigo = 1

            st = this.getCnx().prepareCall("select Productos.*, modelos.Modelo from productos inner join modelos on modelos.Codigo=productos.Modelos_Codigo where productos.codigo =" + id + " order BY productos.producto");
            //select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo

            rs = st.executeQuery();
            System.out.println("Controlador.Usuarios.ProductosDao.buscarConID() : " + st);
            System.out.println("Controlador.Usuarios.ProductosDao.buscarConID()222 : " + rs);
            //this.lista= new ArrayList();
            while (rs.next()) {
                Productos per = new Productos();
                per.setCodigo(rs.getInt("Codigo"));
                per.setProducto(rs.getString("producto"));
                per.setCodigoAlterno(rs.getString("codigoAlterno"));
                per.setCodigoBarras(rs.getString("codigoBarras"));
                per.setCosto(rs.getString("costo"));
                per.setUtilidad(rs.getString("utilidad"));
                per.setPvp(rs.getString("pvp"));
                per.setCantidad(rs.getInt("Cantidad"));
                per.setUnidades(rs.getString("unidades"));
                per.setUbicacion(rs.getString("ubicacion"));
                per.setObservacion(rs.getString("observacion"));
                per.setMinimo(rs.getString("minimo"));
                per.setMaximo(rs.getString("maximo"));
                per.setGarantia(rs.getString("garantia"));
                if (rs.getBlob("imagen") != null) {
                    Blob blob = rs.getBlob("imagen");

                    byte[] data = blob.getBytes(1, (int) blob.length());
                    BufferedImage img = null;
                    try {
                        img = ImageIO.read(new ByteArrayInputStream(data));
                    } catch (IOException ex) {
                        Logger.getLogger(ProductosDao.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    per.setImagen(img);
                }

                per.setModelo_codigo(rs.getInt("Modelos_Codigo"));
                per.setModelos_marcas_codigo(rs.getInt("Modelos_Marcas_Codigo"));
                per.setP1(rs.getDouble("p1"));
                per.setP2(rs.getDouble("p2"));
                per.setP3(rs.getDouble("p3"));
                per.setBase(rs.getDouble("base"));
                per.setImpuesto(rs.getString("impuesto"));
                per.setIva12(rs.getDouble("iva12"));
                //per.setIva0(rs.getDouble("iva0"));
                per.setProductoOServicio(rs.getInt("ProductoOServicio"));
                per.setCostoconIVA(rs.getDouble("costoConIVA"));

                //per.setObservaciones(rs.getString("PersonaObservaciones"));
                //per.setFechaN(rs.getDate("PersonaFN").toString());
                //System.out.println("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
                u = per;
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }
    public Productos buscarPorNombre(String producto) {
        ResultSet rs;
        Productos u = new Productos();
        try {
            this.conectar();
            PreparedStatement st;
//            select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo
//            select usuarios.*, tipos_usuarios.codigo,tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo where usuarios.codigo = 1

            st = this.getCnx().prepareCall("select Productos.*, modelos.Modelo from productos inner join modelos on modelos.Codigo=productos.Modelos_Codigo where productos.producto ='"+ producto +"' order BY productos.producto");
            //select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo

            rs = st.executeQuery();
            System.out.println("Controlador.Usuarios.ProductosDao.buscarConID() : " + st);
            System.out.println("Controlador.Usuarios.ProductosDao.buscarConID()222 : " + rs);
            //this.lista= new ArrayList();
            while (rs.next()) {
                Productos per = new Productos();
                per.setCodigo(rs.getInt("Codigo"));
                per.setProducto(rs.getString("producto"));
                per.setCodigoAlterno(rs.getString("codigoAlterno"));
                per.setCodigoBarras(rs.getString("codigoBarras"));
                per.setCosto(rs.getString("costo"));
                per.setUtilidad(rs.getString("utilidad"));
                per.setPvp(rs.getString("pvp"));
                per.setCantidad(rs.getInt("Cantidad"));
                per.setUnidades(rs.getString("unidades"));
                per.setUbicacion(rs.getString("ubicacion"));
                per.setObservacion(rs.getString("observacion"));
                per.setMinimo(rs.getString("minimo"));
                per.setMaximo(rs.getString("maximo"));
                per.setGarantia(rs.getString("garantia"));
                if (rs.getBlob("imagen") != null) {
                    Blob blob = rs.getBlob("imagen");

                    byte[] data = blob.getBytes(1, (int) blob.length());
                    BufferedImage img = null;
                    try {
                        img = ImageIO.read(new ByteArrayInputStream(data));
                    } catch (IOException ex) {
                        Logger.getLogger(ProductosDao.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    per.setImagen(img);
                }

                per.setModelo_codigo(rs.getInt("Modelos_Codigo"));
                per.setModelos_marcas_codigo(rs.getInt("Modelos_Marcas_Codigo"));
                per.setP1(rs.getDouble("p1"));
                per.setP2(rs.getDouble("p2"));
                per.setP3(rs.getDouble("p3"));
                per.setBase(rs.getDouble("base"));
                per.setImpuesto(rs.getString("impuesto"));
                per.setIva12(rs.getDouble("iva12"));
                //per.setIva0(rs.getDouble("iva0"));
                per.setProductoOServicio(rs.getInt("ProductoOServicio"));
                per.setCostoconIVA(rs.getDouble("costoConIVA"));

                //per.setObservaciones(rs.getString("PersonaObservaciones"));
                //per.setFechaN(rs.getDate("PersonaFN").toString());
                //System.out.println("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
                u = per;
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }

    public Productos buscarObjeto(String columna, String value) {
        ResultSet rs;
        Productos u = new Productos();
        try {
            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall("select Productos.*, modelos.Modelo from productos inner join modelos on modelos.Codigo=productos.Modelos_Codigo where " + tabla + "." + columna + " like '%" + value + "%' order BY productos.producto");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Productos per = new Productos();
                per.setCodigo(rs.getInt("Codigo"));
                per.setProducto(rs.getString("producto"));
                per.setCodigoAlterno(rs.getString("codigoAlterno"));
                per.setCodigoBarras(rs.getString("codigoBarras"));
                per.setCosto(rs.getString("costo"));
                per.setUtilidad(rs.getString("utilidad"));
                per.setPvp(rs.getString("pvp"));
                per.setCantidad(rs.getInt("Cantidad"));
                per.setUnidades(rs.getString("unidades"));
                per.setUbicacion(rs.getString("ubicacion"));
                per.setObservacion(rs.getString("observacion"));
                per.setMinimo(rs.getString("minimo"));
                per.setMaximo(rs.getString("maximo"));
                per.setGarantia(rs.getString("garantia"));
                per.setModelo_codigo(rs.getInt("Modelos_Codigo"));
                per.setModelos_marcas_codigo(rs.getInt("Modelos_Marcas_Codigo"));
                u = per;
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConCedula()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }

    public void eliminar(Productos obj) throws Exception {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("DELETE from " + tabla + " "
                    + "WHERE Codigo=?");
            st.setDouble(1, obj.getCodigo());
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
                = {"Codigo", "Codigo de Barras", "NOMBRE DEL PRODUCTO", "COSTO",
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
//            {Class[] types = new Class [] {java.lang.Double.class, java.lang.String.class};
//            public Class getColumnClass(int columnIndex)
//            {
//                return types [columnIndex];
//            }
//        }
        };

        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select Productos.*, modelos.Modelo from productos inner join modelos on modelos.Codigo=productos.Modelos_Codigo where " + tabla + "." + columna + " like '%" + value + "%' order BY productos.producto ");
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
            st = this.getCnx().prepareCall("select Productos.*, modelos.Modelo from productos inner join modelos on modelos.Codigo=productos.Modelos_Codigo  order BY productos.producto ");
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
                //       System.out.println("Controlador.CUsuarios.Buscar_table()" + registros[1]);

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

    public Integer getMaxCodigoProsucto(String sql) {
        ResultSet rs;
        Integer codigo = null;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall(sql);
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                codigo = rs.getInt("Codigo");
            }

        } catch (Exception ex) {
            msg.setMensaje(ex.toString());
            //System.out.println("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }
        return codigo;
    }
}
