/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
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
import ClasesAuxiliares.debug.Deb;
import Modelo.ProductosTemp;

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
public class ProductosTempDao extends Coneccion {

    ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    private List<ProductosTemp> lista = new ArrayList<ProductosTemp>();
    private final String tabla = "productos";

//
    private int procedimientoParaInsertarDatos(ProductosTemp tarea, PreparedStatement consulta) {
        Integer codigoThisProducto = 0;
        try {
            
            consulta.setString(1, tarea.getNombreI());
            consulta.setString(2, tarea.getNombreE());
            consulta.setString(3, tarea.getCodigoProductoI());

            consulta.setString(4, tarea.getCodigoProductoE());
            consulta.setInt(5, tarea.getCodigoProveedor());
            consulta.setDouble(6, tarea.getCosto());
            consulta.setString(7, tarea.getFechaCompra());
            consulta.setString(8, tarea.getNumeroFactura());
            Deb.consola("Controlador.ProductosTemp.guardar()" + consulta);
            consulta.executeUpdate();
            ResultSet rs = consulta.getGeneratedKeys();
            if (rs.next()) {
                codigoThisProducto = rs.getInt(1);
            }
        } catch (SQLException ex) {
            msg.setProgressBar_mensajae(ex.toString());
            Deb.consola("Controlador.ProductosTemp.guardar()" + ex);
        } finally {
            this.cerrar();
        }
        return codigoThisProducto;
    }

    public Integer guardar(ProductosTemp tarea) {
        Integer codigoThisProducto = 0;
        PreparedStatement consulta = null;
        try {
          this.conectar();
            consulta = this.con.prepareStatement("INSERT INTO ProductosTemp (NombreI, NombreE, CodigoProductoI, CodigoProductoE,CodigoProveedor, costo, fechaCompra, "
                    + "NumeroFactura) VALUES(?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
              codigoThisProducto = procedimientoParaInsertarDatos(tarea, consulta);
        } catch (SQLException ex) {
            Logger.getLogger(ProductosTempDao.class.getName()).log(Level.SEVERE, null, ex);
            Deb.consola(ex);
        }

      

        return codigoThisProducto;
    }

    public void modificar(ProductosTemp persona) {
        FileInputStream fis = null;
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("UPDATE ProductosTemp SET "
                    + "NombreI = ?, "
                    + "NombreE = ?, "
                    + "CodigoProductoI = ?, "
                    + "CodigoProductoE= ?, "
                    + "CodigoProveedor= ?, "
                    + "costo = ?, "
                    + "fechaCompra = ?, "
                    + "NumeroFactura = ? "
                    + "WHERE Codigo=?");
            st.setString(1, persona.getNombreI());
            st.setString(2, persona.getNombreE());
            st.setString(3, persona.getCodigoProductoI());
            st.setString(4, persona.getCodigoProductoE());
            st.setInt(5, persona.getCodigoProveedor());
            st.setDouble(6, persona.getCosto());
            st.setString(7, persona.getFechaCompra());
            st.setString(8, persona.getNumeroFactura());

            st.setInt(9, persona.getCodigo());
            String sql = st.toString();
            Deb.consola("Controlador.Usuarios.CUsuarios.modificar()" + sql);
            st.executeUpdate();
            Principal.jProgressBar2.setString("eeeeeeeeeeeee");
            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
        } catch (SQLException e) {
            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error" + e + sql, "Error al modificar Registro" + e.toString()));
            Deb.consola("Controlador.CUsuarios.guardar()" + e);
        } finally {
            this.cerrar();
        }

    }

//    
//    public void modificarPreciosAlRegistrarCompra(ProductosTemp persona) {
//        FileInputStream fis = null;
//        try {
//            this.conectar();
//            PreparedStatement st = this.con.prepareStatement("UPDATE ProductosTemp SET "
//                    + "costo= ?, "                    
//                    + "pvp= ?, "            
//                    + "p1=?,"
//                    + "p2=?,"
//                    + "p3=?,"
//                    + "base=?"
//                    + "WHERE Codigo=?");
//            st.setString(1, persona.getCosto());            
//            st.setString(2, persona.getPvp());
//            st.setDouble(3, persona.getP1());
//            st.setDouble(4, persona.getP2());
//            st.setDouble(5, persona.getP3());
//            st.setDouble(6, persona.getBase());
//            st.setInt(7, persona.getCodigo());
//            String sql = st.toString();
//            Deb.consola("Controlador.Usuarios.CUsuarios.modificar()" + sql);
//            st.executeUpdate();
//          //  Principal.jProgressBar2.setString("eeeeeeeeeeeee");
//            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
//        } catch (SQLException e) {
//            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error" + e + sql, "Error al modificar Registro" + e.toString()));
//            Deb.consola("Controlador.CUsuarios.guardar()" + e);
//        } finally {
//            this.cerrar();
//        }
//
//    }
//  
    public ProductosTemp getProductoTemp(Integer codigoProveedor, String codigoProductoAlternoE) {
        ResultSet rs;
        ProductosTemp u = new ProductosTemp();
        u.setCodigoProductoI("XX");
        u.setCodigoProductoE("XX");
        try {
            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall("select * from productosTEMp where CodigoProveedor= " + codigoProveedor + " and codigoProductoE = '" + codigoProductoAlternoE + "' ");
            rs = st.executeQuery();
            while (rs.next()) {
                ProductosTemp per = new ProductosTemp();
                per.setCodigo(rs.getInt("Codigo"));
                per.setNombreI(rs.getString("nombreI"));
                per.setNombreE(rs.getString("nombreE"));
                per.setCodigoProductoI(rs.getString("codigoProductoI"));
                per.setCodigoProductoE(rs.getString("codigoProductoE"));
                per.setCodigoProveedor(rs.getInt("CodigoProveedor"));
                per.setCosto(rs.getDouble("costo"));
                per.setFechaCompra(rs.getString("fechaCompra"));
                per.setNumeroFactura(rs.getString("numeroFactura"));
                u = per;

            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }

    public List<ProductosTemp> listar() {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall("select * from productosTEMp");
            rs = st.executeQuery();
            this.lista = new ArrayList();
            while (rs.next()) {
                ProductosTemp per = new ProductosTemp();
                per.setCodigo(rs.getInt("Codigo"));
                per.setNombreI(rs.getString("nombreI"));
                per.setNombreE(rs.getString("nombreE"));
                per.setCodigoProductoI(rs.getString("codigoProductoI"));
                per.setCodigoProductoE(rs.getString("codigoProductoE"));
                per.setCodigoProveedor(rs.getInt("CodigoProveedor"));
                per.setCosto(rs.getDouble("costo"));
                per.setFechaCompra(rs.getString("fechaCompra"));
                per.setNumeroFactura(rs.getString("numeroFactura"));

                this.lista.add(per);
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }
//    
//    public List<ProductosTemp> listarLikeok( String [] cad) {
//        String sql="";
//           switch (cad.length) {
//                    case 1:
//                        sql="SELECT * FROM `productos` WHERE `producto` LIKE '%"+cad[0]+"%'";
//                        break;
//                    case 2:
//                        sql="SELECT * FROM `productos` WHERE `producto` LIKE '%"+cad[0]+"%' and `producto` LIKE '%"+cad[1]+"%'";
//                        break;
//                    case 3:
//                        sql="SELECT * FROM `productos` WHERE `producto` LIKE '%"+cad[0]+"%' and `producto` LIKE '%"+cad[1]+"%' and `producto` LIKE '%"+cad[2]+"%'";
//                        break;
//                    case 4:
//                        sql="SELECT * FROM `productos` WHERE `producto` LIKE '%"+cad[0]+"%' and `producto` LIKE '%"+cad[1]+"%' and `producto` LIKE '%"+cad[2]+"%' and `producto` LIKE '%"+cad[3]+"%'";
//                        break;
//                    case 5:
//                        sql="SELECT * FROM `productos` WHERE `producto` LIKE '%"+cad[0]+"%' and `producto` LIKE '%"+cad[1]+"%' and `producto` LIKE '%"+cad[2]+"%' and `producto` LIKE '%"+cad[3]+"%' and `producto` LIKE '%"+cad[4]+"%'";
//                        break;   
//                        
//                }
//           Deb.consola("SQLxL: "+sql);
//        ResultSet rs;
//        
//        
//        try {
//            this.conectar();
//            PreparedStatement st;
//            //   st = this.getCnx().prepareCall("select ProductosTemp.*, modelos.Modelo from productos inner join modelos on modelos.Codigo=productos.Modelos_Codigo order BY productos.producto");
//            st = this.getCnx().prepareCall(sql);
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//                ProductosTemp per = new ProductosTemp();
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
//                if (rs.getBlob("imagen") != null) {
//                    Blob blob = rs.getBlob("imagen");
//
//                    byte[] data = blob.getBytes(1, (int) blob.length());
//                    BufferedImage img = null;
//                    try {
//                        img = ImageIO.read(new ByteArrayInputStream(data));
//                    } catch (IOException ex) {
//                        Logger.getLogger(ProductosTempTempDao.class.getName()).log(Level.SEVERE, null, ex);
//                    }
//                    per.setImagen(img);
//                }
//                per.setMaximo(rs.getString("maximo"));
//                per.setGarantia(rs.getString("garantia"));
//                per.setModelo_codigo(rs.getInt("Modelos_Codigo"));
//                per.setModelos_marcas_codigo(rs.getInt("Modelos_Marcas_Codigo"));
//    //            JOptionPane.showMessageDialog(null, "--  "+rs.getString("b" + Principal.bodegaPredeterminadaenVenta.substring(0, 1))+"  --");
//                per.setBodegaPredVenta(rs.getString("b" + Principal.bodegaPredeterminadaenVenta.substring(0, 1)));
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
//    
//    public List<ProductosTemp> listarlike(String val) {
//        ResultSet rs;
//        
//        
//        
//        try {
//            this.conectar();
//            PreparedStatement st;
//            
//            //   st = this.getCnx().prepareCall("select ProductosTemp.*, modelos.Modelo from productos inner join modelos on modelos.Codigo=productos.Modelos_Codigo order BY productos.producto");            
//            st = this.getCnx().prepareCall("select * from productos where producto like '%"+val+"%' order BY producto");            
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//                ProductosTemp per = new ProductosTemp();
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
//                if (rs.getBlob("imagen") != null) {
//                    Blob blob = rs.getBlob("imagen");
//
//                    byte[] data = blob.getBytes(1, (int) blob.length());
//                    BufferedImage img = null;
//                    try {
//                        img = ImageIO.read(new ByteArrayInputStream(data));
//                    } catch (IOException ex) {
//                        Logger.getLogger(ProductosTempTempDao.class.getName()).log(Level.SEVERE, null, ex);
//                    }
//                    per.setImagen(img);
//                }
//                per.setMaximo(rs.getString("maximo"));
//                per.setGarantia(rs.getString("garantia"));
//                per.setModelo_codigo(rs.getInt("Modelos_Codigo"));
//                per.setModelos_marcas_codigo(rs.getInt("Modelos_Marcas_Codigo"));
//    //            JOptionPane.showMessageDialog(null, "--  "+rs.getString("b" + Principal.bodegaPredeterminadaenVenta.substring(0, 1))+"  --");
//                per.setBodegaPredVenta(rs.getString("b" + Principal.bodegaPredeterminadaenVenta.substring(0, 1)));
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
//

    public ProductosTemp buscarConID(Integer id) {
        ResultSet rs;
        ProductosTemp u = new ProductosTemp();
        try {
            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall("select ProductosTemp.*, where productos.codigo =" + id + "");
            //select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo

            rs = st.executeQuery();
            Deb.consola("Controlador.Usuarios.ProductosTempDao.buscarConID() : " + st);
            Deb.consola("Controlador.Usuarios.ProductosTempDao.buscarConID()222 : " + rs);
            //this.lista= new ArrayList();
            while (rs.next()) {
                ProductosTemp per = new ProductosTemp();
                per.setCodigo(rs.getInt("Codigo"));
//////                per.setProducto(rs.getString("producto"));
//////                per.setCodigoAlterno(rs.getString("codigoAlterno"));
//////                per.setCodigoBarras(rs.getString("codigoBarras"));
//////                per.setCosto(rs.getString("costo"));
//////                per.setUtilidad(rs.getString("utilidad"));
//////                per.setPvp(rs.getString("pvp"));
//////                per.setCantidad(rs.getInt("Cantidad"));
//////                per.setUnidades(rs.getString("unidades"));
//////                per.setUbicacion(rs.getString("ubicacion"));
//////                per.setObservacion(rs.getString("observacion"));
//////                per.setMinimo(rs.getString("minimo"));
//////                per.setMaximo(rs.getString("maximo"));
//////                per.setGarantia(rs.getString("garantia"));
//////                if (rs.getBlob("imagen") != null) {
//////                    Blob blob = rs.getBlob("imagen");
//////
//////                    byte[] data = blob.getBytes(1, (int) blob.length());
//////                    BufferedImage img = null;
//////                    try {
//////                        img = ImageIO.read(new ByteArrayInputStream(data));
//////                    } catch (IOException ex) {
//////                        Logger.getLogger(ProductosTempTempDao.class.getName()).log(Level.SEVERE, null, ex);
//////                    }
//////                    per.setImagen(img);
//////                }
//////
//////                per.setModelo_codigo(rs.getInt("Modelos_Codigo"));
//////                per.setModelos_marcas_codigo(rs.getInt("Modelos_Marcas_Codigo"));
//////                per.setP1(rs.getDouble("p1"));
//////                per.setP2(rs.getDouble("p2"));
//////                per.setP3(rs.getDouble("p3"));
//////                per.setBase(rs.getDouble("base"));
//////                per.setImpuesto(rs.getString("impuesto"));
//////                per.setIva12(rs.getDouble("iva12"));
//////                //per.setIva0(rs.getDouble("iva0"));
//////                per.setProductoOServicio(rs.getInt("ProductoOServicio"));
//////                per.setCostoconIVA(rs.getDouble("costoConIVA"));

                //per.setObservaciones(rs.getString("PersonaObservaciones"));
                //per.setFechaN(rs.getDate("PersonaFN").toString());
                //Deb.consola("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
                u = per;
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }
//    public ProductosTemp buscarPorNombre(String producto) {
//        ResultSet rs;
//        ProductosTemp u = new ProductosTemp();
//        try {
//            this.conectar();
//            PreparedStatement st;
////            select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo
////            select usuarios.*, tipos_usuarios.codigo,tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo where usuarios.codigo = 1
//
//            st = this.getCnx().prepareCall("select ProductosTemp.*, modelos.Modelo from productos inner join modelos on modelos.Codigo=productos.Modelos_Codigo where productos.producto ='"+ producto +"' order BY productos.producto");
//            //select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo
//
//            rs = st.executeQuery();
//            Deb.consola("Controlador.Usuarios.ProductosTempDao.buscarConID() : " + st);
//            Deb.consola("Controlador.Usuarios.ProductosTempDao.buscarConID()222 : " + rs);
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//                ProductosTemp per = new ProductosTemp();
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
//                if (rs.getBlob("imagen") != null) {
//                    Blob blob = rs.getBlob("imagen");
//
//                    byte[] data = blob.getBytes(1, (int) blob.length());
//                    BufferedImage img = null;
//                    try {
//                        img = ImageIO.read(new ByteArrayInputStream(data));
//                    } catch (IOException ex) {
//                        Logger.getLogger(ProductosTempTempDao.class.getName()).log(Level.SEVERE, null, ex);
//                    }
//                    per.setImagen(img);
//                }
//
//                per.setModelo_codigo(rs.getInt("Modelos_Codigo"));
//                per.setModelos_marcas_codigo(rs.getInt("Modelos_Marcas_Codigo"));
//                per.setP1(rs.getDouble("p1"));
//                per.setP2(rs.getDouble("p2"));
//                per.setP3(rs.getDouble("p3"));
//                per.setBase(rs.getDouble("base"));
//                per.setImpuesto(rs.getString("impuesto"));
//                per.setIva12(rs.getDouble("iva12"));
//                //per.setIva0(rs.getDouble("iva0"));
//                per.setProductoOServicio(rs.getInt("ProductoOServicio"));
//                per.setCostoconIVA(rs.getDouble("costoConIVA"));
//
//                //per.setObservaciones(rs.getString("PersonaObservaciones"));
//                //per.setFechaN(rs.getDate("PersonaFN").toString());
//                //Deb.consola("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
//                u = per;
//            }
//
//        } catch (Exception ex) {
//            Deb.consola("Controlador.CUsuarios.BuscarConId()" + ex);
//        } finally {
//            this.cerrar();
//        }
//
//        return u;
//    }
//
//    public ProductosTemp buscarObjeto(String columna, String value) {
//        ResultSet rs;
//        ProductosTemp u = new ProductosTemp();
//        try {
//            this.conectar();
//            PreparedStatement st;
//
//            st = this.getCnx().prepareCall("select ProductosTemp.*, modelos.Modelo from productos inner join modelos on modelos.Codigo=productos.Modelos_Codigo where " + tabla + "." + columna + " like '%" + value + "%' order BY productos.producto");
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//                ProductosTemp per = new ProductosTemp();
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
//            Deb.consola("Controlador.CUsuarios.BuscarConCedula()" + ex);
//        } finally {
//            this.cerrar();
//        }
//
//        return u;
//    }
//
//    public void eliminar(ProductosTemp obj) throws Exception {
//        try {
//            this.conectar();
//            PreparedStatement st = this.con.prepareStatement("DELETE from " + tabla + " "
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
//
//    public DefaultTableModel Buscar_table(String columna, String value) {
//        DefaultTableModel modelo = null;
//        String[] titulos
//                = {"Codigo", "Codigo de Barras", "NOMBRE DEL PRODUCTO", "COSTO",
//                    "Utilidad", "pvp",
//                    "Cantidad", "Maximos", "Minimos"};
//        String[] registros = new String[9];
//        modelo = new DefaultTableModel(null, titulos) {
//            @Override
//            public boolean isCellEditable(int row, int column) {
//                // make read only fields except column 0,13,14
//                //  return column == 0 || column == 13 || column == 14;
//                return false;
//            }
////            {Class[] types = new Class [] {java.lang.Double.class, java.lang.String.class};
////            public Class getColumnClass(int columnIndex)
////            {
////                return types [columnIndex];
////            }
////        }
//        };
//
//        ResultSet rs;
//        try {
//            this.conectar();
//            PreparedStatement st;
//            st = this.getCnx().prepareCall("select ProductosTemp.*, modelos.Modelo from productos inner join modelos on modelos.Codigo=productos.Modelos_Codigo where " + tabla + "." + columna + " like '%" + value + "%' order BY productos.producto ");
//            Deb.consola("Controlador.CUsuarios.Buscar_table()" + st.toString());
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//
//                registros[0] = String.valueOf(rs.getInt("Codigo"));
//                registros[1] = rs.getString("codigoBarras");
//                registros[2] = rs.getString("Producto");
//                registros[3] = rs.getString("costo");
//                registros[4] = rs.getString("utilidad");
//                registros[5] = rs.getString("pvp");
//                registros[6] = rs.getString("cantidad");
//                registros[7] = rs.getString("maximo");
//                registros[8] = rs.getString("minimo");
//
//                modelo.addRow(registros);
//                Deb.consola("Controlador.CUsuarios.Buscar_table()" + registros[1]);
//
//                //per.setObservaciones(rs.getString("PersonaObservaciones"));
//                //per.setFechaN(rs.getDate("PersonaFN").toString());
//                //Deb.consola("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
//            }
//
//        } catch (Exception ex) {
//            JOptionPane.showMessageDialog(null, ex + "hhhh");
//        } finally {
//            this.cerrar();
//        }
//
//        return modelo;
//    }
//
//    public DefaultTableModel Buscar_table_only_Activos() {
//        DefaultTableModel modelo = null;
//        String[] titulos
//                = {"Codigo", "Codigo de Barras", "NOMBRE DEL PRODUCTOS", "COSTO",
//                    "Utilidad", "pvp",
//                    "Cantidad", "Maximos", "Minimos"};
//        String[] registros = new String[9];
//        modelo = new DefaultTableModel(null, titulos) {
//            @Override
//            public boolean isCellEditable(int row, int column) {
//                // make read only fields except column 0,13,14
//                //  return column == 0 || column == 13 || column == 14;
//                return false;
//            }    
//};
//
//        ResultSet rs;
//        try {
//            this.conectar();
//            PreparedStatement st;
//            st = this.getCnx().prepareCall("select ProductosTemp.*, modelos.Modelo from productos inner join modelos on modelos.Codigo=productos.Modelos_Codigo  order BY productos.producto ");
//            Deb.consola("Controlador.CUsuarios.Buscar_table()" + st.toString());
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//
//                registros[0] = String.valueOf(rs.getInt("Codigo"));
//                registros[1] = rs.getString("codigoBarras");
//                registros[2] = rs.getString("Producto");
//                registros[3] = rs.getString("costo");
//                registros[4] = rs.getString("utilidad");
//                registros[5] = rs.getString("pvp");
//                registros[6] = rs.getString("cantidad");
//                registros[7] = rs.getString("maximo");
//                registros[8] = rs.getString("minimo");
//
//                modelo.addRow(registros);
//                //       Deb.consola("Controlador.CUsuarios.Buscar_table()" + registros[1]);
//
//                //per.setObservaciones(rs.getString("PersonaObservaciones"));
//                //per.setFechaN(rs.getDate("PersonaFN").toString());
//                //Deb.consola("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
//            }
//
//        } catch (Exception ex) {
//            JOptionPane.showMessageDialog(null, ex + "hhhh");
//        } finally {
//            this.cerrar();
//        }
//        return modelo;
//    }
//
//    public Integer getMaxCodigoProsucto(String sql) {
//        ResultSet rs;
//        Integer codigo = null;
//        try {
//            this.conectar();
//            PreparedStatement st;
//            st = this.getCnx().prepareCall(sql);
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//                codigo = rs.getInt("Codigo");
//            }
//
//        } catch (Exception ex) {
//            msg.setMensaje(ex.toString());
//            //Deb.consola("Controlador.CUsuarios.listar()" + ex);
//        } finally {
//            this.cerrar();
//        }
//        return codigo;
//    }
}
