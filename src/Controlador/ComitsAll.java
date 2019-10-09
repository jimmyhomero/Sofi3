/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.CajasDetalle;
import Modelo.DetalleFactura;
import Modelo.Facturas;
import Modelo.Kardex;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.jsp.tagext.TryCatchFinally;
import javax.swing.JOptionPane;
import jdk.nashorn.internal.ir.CatchNode;

/**
 *
 * @author USUARIO
 */
public class ComitsAll extends Coneccion {

    private boolean errorfacturacion = false;
    private boolean EOLfacturacion = false;
 
    private ArrayList<DetalleFactura> listaDetalleFactura = new ArrayList<DetalleFactura>();
 
    public int facturar(Facturas tarea, CajasDetalle cajaDetalle, ArrayList<DetalleFactura> listaDetalleFactura, ArrayList<Kardex> listaKardex,  boolean afectaCajayCardex) {
        int codigoThisFactura = 0;
        PreparedStatement consulta = null;
        this.conectar();
        try {
            this.conectar().setAutoCommit(false);

            try {

                consulta = this.con.prepareStatement("INSERT INTO facturas (fecha, iva, subtotaI_con_iva, subtotal_sin_iva,"
                        + " total, utilidad, tipo_documento, "
                        + "descuento,Clientes_codigo,Usuarios_Codigo, Equipo, secuencia,fechain,iva_valor,calveAcceso,establecimiento,ptoEmision,secfactura,formaPago,efectivo,cambio,equipos_codigo) VALUES(?,?,?,?, ?, ?,?,?,?, ?, ?,?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
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
                consulta.setString(15, tarea.getCalveAcceso());
                consulta.setString(16, tarea.getEstablecimiento());
                consulta.setString(17, tarea.getPtoEmision());
                consulta.setString(18, tarea.getSecfactura());
                consulta.setString(19, tarea.getFormaPago());
                consulta.setDouble(20, tarea.getEfectivo());
                consulta.setDouble(21, tarea.getCambio());
                consulta.setDouble(22, tarea.getEquipos_codigo());
                System.out.println("Controlador.CUsuarios.guardar()" + consulta);
                consulta.executeUpdate();
                ResultSet rs = consulta.getGeneratedKeys();
                if (rs.next()) {
                    codigoThisFactura = rs.getInt(1);
                    System.out.println("Controlador.Usuarios.FacturasDao.guardar()>: " + codigoThisFactura);
                }

            } catch (SQLException ex) {
                errorfacturacion = true;
                //msg.setProgressBar_mensajae(ex.toString());
                System.out.println("Controlador.CUsuarios.guardar()" + ex);
            } finally {

            }
            /////////////FIN FACTURA
            ///////agredo el codigo de la factura al detalle de factura 
            for (DetalleFactura det : listaDetalleFactura) {
                det.setFactura_Codigo(codigoThisFactura);
            }
            //////////
            ///////////////////INCIA CAJA DETALLE
            if(afectaCajayCardex){
            try {

                consulta = this.con.prepareStatement("INSERT INTO CajasDetalle (detalle,valor,tipo,documento,descripcion,codigoDocumento,cajas_codigo) VALUES(?,?,?,?,?,?,?)");
                consulta.setString(1, cajaDetalle.getDetalle().toUpperCase());
                consulta.setDouble(2, cajaDetalle.getValor());
                consulta.setString(3, cajaDetalle.getTipo());
                consulta.setString(4, cajaDetalle.getDocumento());
                consulta.setString(5, cajaDetalle.getDescripcion());
//            long d = tarea.getFecha().getDate();
//            java.sql.Date fecha = new java.sql.Date(d);
//            consulta.setDate(6, fecha);
                consulta.setInt(6, codigoThisFactura);
                consulta.setInt(7, cajaDetalle.getCajas_Codigo());
                consulta.executeUpdate();
            } catch (SQLException ex) {
                errorfacturacion = true;
                JOptionPane.showMessageDialog(null, ex + " seeee");
                //  msg.setProgressBar_mensajae("Error..!! " + ex);

            } finally {
                ///this.cerrar();
            }
            }
            ///////////////////FIN cajadetalle
            //INICIA DETALLE FACURA
            for (DetalleFactura detalleFactura : listaDetalleFactura) {
                try {
                    //this.conectar();
                    //PreparedStatement consulta;

                    consulta = this.con.prepareStatement("INSERT INTO detallefactura (cantidad, detalle, iva, descuento,"
                            + " valorUnitario, valorTotal, Factura_Codigo, "
                            + "Productos_Codigo,Observaciones,costo,precio,utilidad,bodega) VALUES(?,?,?,?,?,?,?,?, ?, ?,?,?,?)");                      
                    consulta.setString(1, detalleFactura.getCantidad().toUpperCase());
                    consulta.setString(2, detalleFactura.getDetalle().toUpperCase());
                    consulta.setString(3, detalleFactura.getIva());
                    consulta.setString(4, detalleFactura.getDescuento());
                    consulta.setString(5, detalleFactura.getValorUnitario());
                    consulta.setString(6, detalleFactura.getValorTotal());
                    consulta.setInt(7, codigoThisFactura);
                    consulta.setInt(8, detalleFactura.getProductos_codigo());
                    consulta.setString(9, detalleFactura.getObservaciones());
                    //////////
            consulta.setDouble(10, detalleFactura.getCosto());
            consulta.setDouble(11, detalleFactura.getPrecio());
            consulta.setDouble(12, detalleFactura.getUtilidad());
            consulta.setInt(13, detalleFactura.getBodega());
            
            ////
                    System.out.println("Controlador.CUsuarios.guardar()" + consulta);
                    consulta.executeUpdate();
                } catch (SQLException ex) {
                    //msg.setProgressBar_mensajae(ex.toString());
                    errorfacturacion = true;
                    System.out.println("Controlador.CUsuarios.guardar()" + ex);
                } finally {

                }
            }

            ///// FIN DETALLE FACTURA
            /////////////////INICIO KARDEX
            if(afectaCajayCardex){
            for (Kardex kardex : listaKardex) {

                try {

                    consulta = this.con.prepareStatement("INSERT INTO kardex (fecha, bodega,"
                            + " detalle, incantidad, incosto,"
                            + " inpvp, outcantidad, outcosto,"
                            + "outpvp,saldocantidad,saldocosto,"
                            + "saldopvp,productos_Codigo) VALUES(?,?,?,?,?,?,?, ?, ?,?,?,?,?)");
                    long d = tarea.getFecha().getTime();
                    java.sql.Date fecha = new java.sql.Date(d);
                    consulta.setDate(1, fecha);
                    consulta.setString(2, kardex.getBodega());
                    consulta.setString(3, kardex.getDetalle());
                    consulta.setString(4, kardex.getIncantidad());
                    consulta.setString(5, kardex.getIncosto());
                    consulta.setString(6, kardex.getInpvp());
                    consulta.setString(7, kardex.getOutcantidad());
                    consulta.setString(8, kardex.getOutcosto());
                    consulta.setString(9, kardex.getOutpvp());
                    consulta.setString(10, kardex.getSaldocantidad());
                    consulta.setString(11, kardex.getSaldocosto());
                    consulta.setString(12, kardex.getSaldopvp());
                    consulta.setInt(13, kardex.getProductos_Codigo());
                    System.out.println("Controlador.CUsuarios.guardar()" + consulta);
                    consulta.executeUpdate();
                } catch (SQLException ex) {
                    errorfacturacion = true;
                    //    msg.setProgressBar_mensajae(ex.toString());
                    System.out.println("Controlador.CUsuarios.guardar()" + ex);
                } finally {

                }
            }

            /////////////////FIN KARDEX
            }
            ////se guarda todo el proceso
            if (!errorfacturacion) {
                this.con.commit();
                EOLfacturacion = true;
            } else {
                codigoThisFactura=0;
                EOLfacturacion = false;
                this.con.rollback();
            }

        } catch (SQLException ex) {

            System.out.println("Controlador.ComitsAll.facturar() error al guardar la factura nunca llego al comit : " + ex);
            Logger.getLogger(ComitsAll.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ///finalmente cierro la conexion
            this.cerrar();
        }
        return codigoThisFactura;
    }

    public void guardarProcesoFacturacion(ArrayList<Object> list) {

        try {

            this.conectar();
            this.con.setAutoCommit(false);
            int cod = 0;
            for (Object obj : list) {
//                cod = preparedStatement.executeUpdate();
//  //              ResultSet rs = preparedStatement.getGeneratedKeys();
//                if (rs.next()) {
//                    cod = rs.getInt(1);
//                    System.out.println("Controlador.Usuarios.FacturasDao.guardar()>   xxxxccc   xx  : " + cod);
//                }
//            
            }
            this.con.commit();
        } catch (Exception e) {
            try {
                this.con.rollback();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, "Rollbac on Class ComitsAll");
            }
        } finally {

            this.cerrar();
        }
    }

}
