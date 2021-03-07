/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ClasesAuxiliares.ObtenerFecha;
import ClasesAuxiliares.debug.Deb;
import Controlador.Usuarios.DetalleComprasDao;
import Controlador.Usuarios.HoraFecha;
import Modelo.CajasDetalle;
import Modelo.Cheques;
import Modelo.Compras;
import Modelo.Cxc;
import Modelo.Cxp;
import Modelo.DetalleCompra;
import Modelo.DetalleFactura;
import Modelo.Facturas;
import Modelo.Kardex;
import Modelo.Productos;
import Vista.Principal;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
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

    public int facturar(Facturas tarea, CajasDetalle cajaDetalle, ArrayList<DetalleFactura> listaDetalleFactura, ArrayList<Kardex> listaKardex, boolean afectaCaja, boolean afectakardex) {
        int codigoThisFactura = 0;
        PreparedStatement consulta = null;
        this.conectar();
        try {
            this.conectar().setAutoCommit(false);

            try {

                consulta = this.con.prepareStatement("INSERT INTO facturas (fecha, iva, subtotaI_con_iva, subtotal_sin_iva,"
                        + " total, utilidad, tipo_documento, "
                        + "descuento,Clientes_codigo,Usuarios_Codigo, Equipo, secuencia,fechain,iva_valor,calveAcceso,establecimiento,ptoEmision,secfactura,formaPago,efectivo,cambio,equipos_codigo,codigo_doc_afectado_nc,secuencia_doc_afectado_nc,Fecha_doc_afectado_nc,ValorAfectadoxNCenFactura) VALUES(?,?,?,?,?,?, ?, ?,?,?,?, ?, ?,?,?,?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
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
                consulta.setInt(23, tarea.getCodigo_doc_afectado_nc());
                consulta.setString(24, tarea.getSecuencia_doc_afectado_nc());
                consulta.setString(25, tarea.getFecha_doc_afectado_nc());
                consulta.setString(26, tarea.getValorAfectadoxNCenFactura());
                Deb.consola("Controlador.CUsuarios.guardar()" + consulta);
                consulta.executeUpdate();
                ResultSet rs = consulta.getGeneratedKeys();
                if (rs.next()) {
                    codigoThisFactura = rs.getInt(1);
                    Deb.consola("Controlador.Usuarios.FacturasDao.guardar()>: " + codigoThisFactura);
                }

            } catch (SQLException ex) {
                errorfacturacion = true;
                //msg.setProgressBar_mensajae(ex.toString());
                Deb.consola("Controlador.CUsuarios.guardar()" + ex);
            } finally {

            }
            /////////////FIN FACTURA
            ///////agredo el codigo de la factura al detalle de factura 
            for (DetalleFactura det : listaDetalleFactura) {
                det.setFactura_Codigo(codigoThisFactura);
            }
            //////////
            ///////////////////INCIA CAJA DETALLE
            if (afectaCaja) {
                try {

                    consulta = this.con.prepareStatement("INSERT INTO CajasDetalle (detalle,valor,tipo,documento,descripcion,codigoDocumento,cajas_codigo) VALUES(?,?,?,?,?,?,?)");
                    consulta.setString(1, cajaDetalle.getDetalle());
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
                            + "Productos_Codigo,Observaciones,costo,precio,utilidad,bodega,productos_codigoAlterno) VALUES(?,?,?,?,?,?,?,?,?, ?, ?,?,?,?)");
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
                    consulta.setString(14, detalleFactura.getProductos_codigoAlterno());

                    ////
                    Deb.consola("Controlador.CUsuarios.guardar()" + consulta);
                    consulta.executeUpdate();
                } catch (SQLException ex) {
                    //msg.setProgressBar_mensajae(ex.toString());
                    errorfacturacion = true;
                    Deb.consola("Controlador.CUsuarios.guardar()" + ex);
                } finally {

                }
            }

            ///// FIN DETALLE FACTURA
            /////////////////INICIO KARDEX
            if (afectakardex) {
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
                        Deb.consola("Controlador.CUsuarios.guardar()" + consulta);
                        consulta.executeUpdate();
                    } catch (SQLException ex) {
                        errorfacturacion = true;
                        //    msg.setProgressBar_mensajae(ex.toString());
                        Deb.consola("Controlador.CUsuarios.guardar()" + ex);
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
                codigoThisFactura = 0;
                EOLfacturacion = false;
                this.con.rollback();
            }

        } catch (SQLException ex) {

            Deb.consola("Controlador.ComitsAll.facturar() error al guardar la factura nunca llego al comit : " + ex);
            Logger.getLogger(ComitsAll.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ///finalmente cierro la conexion
            this.cerrar();
        }
        return codigoThisFactura;
    }

    public int facturar(Facturas tarea, CajasDetalle cajaDetalle, ArrayList<DetalleFactura> listaDetalleFactura, ArrayList<Kardex> listaKardex, boolean afectaCaja,boolean afectakardex ,Cxc cxc) {
        int codigoThisFactura = 0;
        PreparedStatement consulta = null;
        this.conectar();
        try {
            this.conectar().setAutoCommit(false);

            try {

                consulta = this.con.prepareStatement("INSERT INTO facturas (fecha, iva, subtotaI_con_iva, subtotal_sin_iva,"
                        + " total, utilidad, tipo_documento, "
                        + "descuento,Clientes_codigo,Usuarios_Codigo, Equipo, secuencia,fechain,iva_valor,calveAcceso,establecimiento,ptoEmision,secfactura,formaPago,efectivo,cambio,"
                        + "equipos_codigo,codigo_doc_afectado_nc,secuencia_doc_afectado_nc,Fecha_doc_afectado_nc,ValorAfectadoxNCenFactura) VALUES(?,?,?,?,?,?,?,?, ?, ?,?,?,?, ?, ?,?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
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
                consulta.setInt(23, tarea.getCodigo_doc_afectado_nc());
                consulta.setString(24, tarea.getSecuencia_doc_afectado_nc());
                consulta.setString(25, tarea.getFecha_doc_afectado_nc());
                consulta.setString(26, tarea.getValorAfectadoxNCenFactura());
                Deb.consola("Controlador.CUsuarios.guardar()" + consulta);
                consulta.executeUpdate();
                ResultSet rs = consulta.getGeneratedKeys();
                if (rs.next()) {
                    codigoThisFactura = rs.getInt(1);
                    Deb.consola("Controlador.Usuarios.FacturasDao.guardar()>: " + codigoThisFactura);
                }

            } catch (SQLException ex) {
                errorfacturacion = true;
                //msg.setProgressBar_mensajae(ex.toString());
                Deb.consola("Controlador.CUsuarios.guardar()" + ex);
            } finally {

            }
            /////////////FIN FACTURA
            ///////agredo el codigo de la factura al detalle de factura 
            for (DetalleFactura det : listaDetalleFactura) {
                det.setFactura_Codigo(codigoThisFactura);
            }
            //////////
            ///////////////////INCIA CAJA DETALLE
            if (afectaCaja) {
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
                            + "Productos_Codigo,Observaciones,costo,precio,utilidad,bodega,productos_codigoAlterno) VALUES(?,?,?,?,?,?,?,?,?, ?, ?,?,?,?)");
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
                    consulta.setString(14, detalleFactura.getProductos_codigoAlterno());

                    ////
                    Deb.consola("Controlador.CUsuarios.guardar()" + consulta);
                    consulta.executeUpdate();
                } catch (SQLException ex) {
                    //msg.setProgressBar_mensajae(ex.toString());
                    errorfacturacion = true;
                    Deb.consola("Controlador.CUsuarios.guardar()" + ex);
                } finally {

                }
            }

            ///// FIN DETALLE FACTURA
            /////////////////INICIO KARDEX
            if (afectakardex) {
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
                        Deb.consola("Controlador.CUsuarios.guardar()" + consulta);
                        consulta.executeUpdate();
                    } catch (SQLException ex) {
                        errorfacturacion = true;
                        //    msg.setProgressBar_mensajae(ex.toString());
                        Deb.consola("Controlador.CUsuarios.guardar()" + ex);
                    } finally {

                    }
                }

                /////////////////FIN KARDEX
            }
            /////////SI LA VENTA ES A CREDITO REGISTRA CXC

            Integer CodigoThisInsert = null;
            try {

                //this.conectar();
                /// PreparedStatement consultacxc = null;
                consulta = this.con.prepareStatement("INSERT INTO cxc (tipo,"
                        + " descripcion,fechaVencimiento,total,abono,saldo,facturas_codigo,formasPagoV_codigo,diasCredito,diasAtrazo,Clientes_codigo)"
                        + " VALUES(?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
                consulta.setString(1, cxc.getTipo().toUpperCase());
                consulta.setString(2, cxc.getDescripcion().toUpperCase());
                long d = cxc.getFechaVencimiento().getTime();
                java.sql.Date fecha = new java.sql.Date(d);
                consulta.setDate(3, fecha);
                consulta.setString(4, cxc.getTotal());
                consulta.setString(5, cxc.getAbono());
                consulta.setString(6, cxc.getSaldo());
                consulta.setInt(7, codigoThisFactura);
                consulta.setInt(8, cxc.getFormasPagoV_codigo());
                consulta.setString(9, cxc.getDiasCredito());
                consulta.setString(10, cxc.getDiasAtrazo());
                consulta.setInt(11, cxc.getClientes_Codigo());
                Deb.consola("Controlador.Usuarios.PagosDao.guardar()consulta: " + consulta.toString());
                consulta.executeUpdate();
                ResultSet rs = consulta.getGeneratedKeys();
                if (rs.next()) {
                //S    CodigoThisInsert = rs.getInt(1);
                    
                }

            } catch (SQLException ex) {
                errorfacturacion = true;

                Deb.consola("Controlador.CUsuarios.guardar()cxc" + ex);
            } finally {

            }
            /////////FIN SI LA VENTA ES A CREDITO REGISTRA CXC
            ////se guarda todo el proceso
            if (!errorfacturacion) {
                this.con.commit();
                EOLfacturacion = true;
            } else {
                codigoThisFactura = 0;
                EOLfacturacion = false;
                this.con.rollback();
            }

        } catch (SQLException ex) {

            Deb.consola("Controlador.ComitsAll.facturar() error al guardar la factura nunca llego al comit : " + ex);
            Logger.getLogger(ComitsAll.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ///finalmente cierro la conexion
            this.cerrar();
        }
        return codigoThisFactura;
    }

    ///////////facturarPago ceque
    public int facturaPagoConChque(Facturas tarea, CajasDetalle cajaDetalle, ArrayList<DetalleFactura> listaDetalleFactura, ArrayList<Kardex> listaKardex, boolean afectaCaja,boolean afectakardex , Cheques cheque) {
        int codigoThisFactura = 0;
        PreparedStatement consulta = null;
        this.conectar();
        try {
            this.conectar().setAutoCommit(false);

            try {

                consulta = this.con.prepareStatement("INSERT INTO facturas (fecha, iva, subtotaI_con_iva, subtotal_sin_iva,"
                        + " total, utilidad, tipo_documento, "
                        + "descuento,Clientes_codigo,Usuarios_Codigo, Equipo, secuencia,fechain,iva_valor,calveAcceso,establecimiento,ptoEmision,secfactura,"
                        + "formaPago,efectivo,cambio,equipos_codigo,codigo_doc_afectado_nc,secuencia_doc_afectado_nc,Fecha_doc_afectado_nc,ValorAfectadoxNCenFactura) VALUES(?,?,?,?,?,?,?,?, ?, ?,?,?,?, ?, ?,?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
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
                consulta.setInt(23, tarea.getCodigo_doc_afectado_nc());
                consulta.setString(24, tarea.getSecuencia_doc_afectado_nc());
                consulta.setString(25, tarea.getFecha_doc_afectado_nc());
                consulta.setString(26, tarea.getValorAfectadoxNCenFactura());

                Deb.consola("Controlador.CUsuarios.guardar()" + consulta);
                consulta.executeUpdate();
                ResultSet rs = consulta.getGeneratedKeys();
                if (rs.next()) {
                    codigoThisFactura = rs.getInt(1);
                    Deb.consola("Controlador.Usuarios.FacturasDao.guardar()>: " + codigoThisFactura);
                }

            } catch (SQLException ex) {
                errorfacturacion = true;
                //msg.setProgressBar_mensajae(ex.toString());
                Deb.consola("Controlador.CUsuarios.guardar()" + ex);
            } finally {

            }
            /////////////FIN FACTURA
            ///////agredo el codigo de la factura al detalle de factura 
            for (DetalleFactura det : listaDetalleFactura) {
                det.setFactura_Codigo(codigoThisFactura);
            }
            //////////
            ///////////////////INCIA CAJA DETALLE
            if (afectaCaja) {
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
                            + "Productos_Codigo,Observaciones,costo,precio,utilidad,bodega,Productos_codigoAlterno) VALUES(?,?,?,?,?,?,?,?,?, ?, ?,?,?,?)");
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
                    consulta.setString(14, detalleFactura.getProductos_codigoAlterno());

                    ////
                    Deb.consola("Controlador.CUsuarios.guardar()" + consulta);
                    consulta.executeUpdate();
                } catch (SQLException ex) {
                    //msg.setProgressBar_mensajae(ex.toString());
                    errorfacturacion = true;
                    Deb.consola("Controlador.CUsuarios.guardar()" + ex);
                } finally {

                }
            }

            ///// FIN DETALLE FACTURA
            /////////////////INICIO KARDEX
            if (afectakardex) {
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
                        Deb.consola("Controlador.CUsuarios.guardar()" + consulta);
                        consulta.executeUpdate();
                    } catch (SQLException ex) {
                        errorfacturacion = true;
                        //    msg.setProgressBar_mensajae(ex.toString());
                        Deb.consola("Controlador.CUsuarios.guardar()" + ex);
                    } finally {

                    }
                }

                /////////////////FIN KARDEX
            }
            /////////SI LA VENTA ES A CREDITO REGISTRA CXC

            Integer CodigoThisInsert = null;
            try {

                consulta = this.con.prepareStatement(""
                        + "INSERT INTO `cheques`(`codigo_banco`,`fecha_cobro`,`valor`,`paguese_a`,`titular_chequera`,`numero`,`referencia`,`codigo_cliente`,"
                        + "`codigo_proveedor`,`estado`) "
                        + "VALUES ( '?','?','?','?','?','?',?,'?',?,?)");
                consulta.setInt(1, cheque.getCodigo_banco());
                long d = cheque.getFecha_c().getTime();
                java.sql.Date fecha = new java.sql.Date(d);
                consulta.setDate(2, fecha);
                consulta.setDouble(3, cheque.getValor());
                consulta.setString(4, cheque.getPaguesea());
                consulta.setString(5, cheque.getTitular());
                consulta.setInt(6, cheque.getNumero());
                consulta.setString(7, cheque.getReferencia());
                consulta.setInt(8, cheque.getCodigo_cliente());
                consulta.setInt(9, cheque.getCodigo_proveedor());
                consulta.setString(10, cheque.getEstado());
                consulta.executeUpdate();
                ResultSet rs = consulta.getGeneratedKeys();
                if (rs.next()) {
                  //  int CodigoThisInsertcheque = rs.getInt(1);
                    //Deb.consola("Controlador.Usuarios.FacturasDao.guardar()>: " + codigoThisFactura);
                }

            } catch (SQLException ex) {
                errorfacturacion = true;

                Deb.consola("Controlador.CUsuarios.guardar()cxc" + ex);
            } finally {

            }
            /////////FIN SI LA VENTA ES A CREDITO REGISTRA CXC
            ////se guarda todo el proceso
            if (!errorfacturacion) {
                this.con.commit();
                EOLfacturacion = true;
            } else {
                codigoThisFactura = 0;
                EOLfacturacion = false;
                this.con.rollback();
            }

        } catch (SQLException ex) {

            Deb.consola("Controlador.ComitsAll.facturar() error al guardar la factura nunca llego al comit : " + ex);
            Logger.getLogger(ComitsAll.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ///finalmente cierro la conexion
            this.cerrar();
        }
        return codigoThisFactura;
    }

    public int compraEfectivo(Compras tarea, CajasDetalle cajaDetalle, ArrayList<DetalleCompra> listaDetalleFactura, ArrayList<Kardex> listaKardex, boolean afectaCaja,boolean afectakardex , ArrayList<Productos> listaProductos) {
        int codigoThisFactura = 0;
        PreparedStatement consulta = null;
        this.conectar();
        try {
            this.conectar().setAutoCommit(false);

            try {
                consulta = this.con.prepareStatement("INSERT INTO compras (fecha, iva, subtotaI_con_iva, subtotal_sin_iva,"
                        + " total, utilidad, tipo_documentoID, tipo_documento, "
                        + "descuento,proveedores_codigo,Usuarios_Codigo, Equipo, secuencia,fechain,iva_valor,calveAcceso,establecimiento,ptoEmision,secfactura,formaPago,efectivo,cambio,sustento,sustentoID) VALUES(?,?,?,?, ?,?,?, ?,?,?,?,?, ?, ?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
                //           java.sql.Timestamp sqlTimeStamp = new java.sql.Timestamp(tarea.getFecha());
                long d = tarea.getFecha().getTime();
                java.sql.Date fecha = new java.sql.Date(d);

                consulta.setDate(1, fecha);
                consulta.setString(2, tarea.getIva());
                consulta.setString(3, tarea.getSubtotaI_con_iva());
                consulta.setString(4, tarea.getSubtotal_sin_iva());
                consulta.setString(5, tarea.getTotal());
                consulta.setString(6, tarea.getUtilidad());
                consulta.setString(7, tarea.getTipo_documentoID());
                consulta.setString(8, tarea.getTipo_documento());
                consulta.setString(9, tarea.getDescuento());
                consulta.setInt(10, tarea.getProveedores_codigo());
                consulta.setInt(11, tarea.getUsuarios_Codigo());
                consulta.setString(12, tarea.getEquipo());
                consulta.setString(13, tarea.getSecuencia());
                consulta.setString(14, tarea.getFechain());
                consulta.setString(15, tarea.getIva_valor());
                consulta.setString(16, tarea.getCalveAcceso());

                consulta.setString(17, tarea.getEstablecimiento());
                consulta.setString(18, tarea.getPtoEmision());
                consulta.setString(19, tarea.getSecfactura());
                consulta.setString(20, tarea.getFormaPago());
                if (tarea.getEfectivo() != null) {
                    consulta.setDouble(21, tarea.getEfectivo());
                }
                if (tarea.getCambio() != null) {
                    consulta.setDouble(22, tarea.getCambio());
                }
                consulta.setString(23, tarea.getSustento());
                consulta.setString(24, tarea.getSustentoID());
                Deb.consola("Controlador.CUsuarios.guardar()" + consulta);
                // Deb.consola(bdd);
                //// cream
                consulta.executeUpdate();
                ResultSet rs = consulta.getGeneratedKeys();
                if (rs.next()) {
                    codigoThisFactura = rs.getInt(1);
                    Deb.consola("Controlador.Usuarios.FacturasDao.guardar()>: " + codigoThisFactura);
                }

            } catch (SQLException ex) {
                errorfacturacion = true;
                //msg.setProgressBar_mensajae(ex.toString());
                Deb.consola("Controlador.CUsuarios.guardar()" + ex);
            } finally {

            }
            /////////////FIN FACTURA
            ///////agredo el codigo de la factura al detalle de factura 
            for (DetalleCompra det : listaDetalleFactura) {
                det.setCompra_Codigo(codigoThisFactura);
            }
            //////////
            ///////////////////INCIA CAJA DETALLE
            if (afectaCaja) {
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
            for (DetalleCompra detalleCompra : listaDetalleFactura) {
                try {
                    //this.conectar();
                    //PreparedStatement consulta;
                    consulta = this.con.prepareStatement("INSERT INTO  detallecompra (cantidad, detalle, iva, descuento,"
                            + " valorUnitario, valorTotal, compras_Codigo, "
                            + "Productos_Codigo,Observaciones) VALUES(?,?,?,?, ?, ?,?,?,?)");
                    consulta.setString(1, detalleCompra.getCantidad().toUpperCase());
                    consulta.setString(2, detalleCompra.getDetalle().toUpperCase());
                    consulta.setString(3, detalleCompra.getIva());
                    consulta.setString(4, detalleCompra.getDescuento());
                    consulta.setString(5, detalleCompra.getValorUnitario());
                    consulta.setString(6, detalleCompra.getValorTotal());
                    consulta.setInt(7, detalleCompra.getCompra_Codigo());
                    consulta.setInt(8, detalleCompra.getProductos_codigo());
                    consulta.setString(9, detalleCompra.getObservaciones());
                    Deb.consola("Controlador.CUsuariosdasds.gasduardar()" + consulta);
                    consulta.executeUpdate();
                } catch (SQLException ex) {
                    //msg.setProgressBar_mensajae(ex.toString());
                    errorfacturacion = true;
                    Deb.consola("Controlador.CUsuarios.guardar()" + ex);
                } finally {

                }
            }

            ///// FIN DETALLE FACTURA
            /////////////////INICIO KARDEX
            if (afectakardex) {
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
                        Deb.consola("Controlador.CUsuarios.guardar()" + consulta);
                        consulta.executeUpdate();
                    } catch (SQLException ex) {
                        errorfacturacion = true;
                        //    msg.setProgressBar_mensajae(ex.toString());
                        Deb.consola("Controlador.CUsuarios.guardar()" + ex);
                    } finally {

                    }
                }

                /////////////////FIN KARDEX
            }

            ////////////////actualiza precios de costp a productos
            for (Productos prod : listaProductos) {

                try {

                    PreparedStatement st = this.con.prepareStatement("UPDATE Productos SET "
                            + "costo= ?, "
                            + "pvp= ?, "
                            + "p1=?,"
                            + "p2=?,"
                            + "p3=?,"
                            + "base=?"
                            + "WHERE Codigo=?");
                    st.setString(1, prod.getCosto());
                    st.setString(2, prod.getPvp());
                    st.setDouble(3, prod.getP1());
                    st.setDouble(4, prod.getP2());
                    st.setDouble(5, prod.getP3());
                    st.setDouble(6, prod.getBase());
                    st.setInt(7, prod.getCodigo());
                    String sql = st.toString();
                    Deb.consola("Controlador.Usuarios.CUsdadqweuarios.modificar()" + sql);
                    st.executeUpdate();

                } catch (SQLException ex) {
                    errorfacturacion = true;
                    //    msg.setProgressBar_mensajae(ex.toString());
                    Deb.consola("Controlador.CUsuarios.guardar()" + ex);
                } finally {

                }
            }
            ///fina actualzia precio costo a prductps
            /////////SI LA VENTA ES A CREDITO REGISTRA CXC

            Integer CodigoThisInsert = null;

            /////////FIN SI LA VENTA ES A CREDITO REGISTRA CXC
            ////se guarda todo el proceso
            if (!errorfacturacion) {
                this.con.commit();
                EOLfacturacion = true;
            } else {
                codigoThisFactura = 0;
                EOLfacturacion = false;
                this.con.rollback();
            }

        } catch (SQLException ex) {

            Deb.consola("Controlador.ComitsAll.facturar() error al guardar la factura nunca llego al comit : " + ex);
            Logger.getLogger(ComitsAll.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ///finalmente cierro la conexion
            this.cerrar();
        }
        return codigoThisFactura;
    }

    public int compraCreditoconcxp(Compras tarea, CajasDetalle cajaDetalle, ArrayList<DetalleCompra> listaDetalleFactura, ArrayList<Kardex> listaKardex, boolean afectaCaja,boolean afectakardex , ArrayList<Productos> listaProductos, Cxp cxp) {
        int codigoThisFactura = 0;
        PreparedStatement consulta = null;
        this.conectar();
        try {
            this.conectar().setAutoCommit(false);

            try {
                consulta = this.con.prepareStatement("INSERT INTO compras (fecha, iva, subtotaI_con_iva, subtotal_sin_iva,"
                        + " total, utilidad, tipo_documentoID, tipo_documento, "
                        + "descuento,proveedores_codigo,Usuarios_Codigo, Equipo, secuencia,fechain,iva_valor,calveAcceso,establecimiento,ptoEmision,secfactura,formaPago,efectivo,cambio,sustento,sustentoID) VALUES(?,?,?,?, ?,?,?, ?,?,?,?,?, ?, ?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
                //           java.sql.Timestamp sqlTimeStamp = new java.sql.Timestamp(tarea.getFecha());
                long d = tarea.getFecha().getTime();
                java.sql.Date fecha = new java.sql.Date(d);

                consulta.setDate(1, fecha);
                consulta.setString(2, tarea.getIva());
                consulta.setString(3, tarea.getSubtotaI_con_iva());
                consulta.setString(4, tarea.getSubtotal_sin_iva());
                consulta.setString(5, tarea.getTotal());
                consulta.setString(6, tarea.getUtilidad());
                consulta.setString(7, tarea.getTipo_documentoID());
                consulta.setString(8, tarea.getTipo_documento());
                consulta.setString(9, tarea.getDescuento());
                consulta.setInt(10, tarea.getProveedores_codigo());
                consulta.setInt(11, tarea.getUsuarios_Codigo());
                consulta.setString(12, tarea.getEquipo());
                consulta.setString(13, tarea.getSecuencia());
                consulta.setString(14, tarea.getFechain());
                consulta.setString(15, tarea.getIva_valor());
                consulta.setString(16, tarea.getCalveAcceso());

                consulta.setString(17, tarea.getEstablecimiento());
                consulta.setString(18, tarea.getPtoEmision());
                consulta.setString(19, tarea.getSecfactura());
                consulta.setString(20, tarea.getFormaPago());
                if (tarea.getEfectivo() != null) {
                    consulta.setDouble(21, tarea.getEfectivo());
                }
                if (tarea.getCambio() != null) {
                    consulta.setDouble(22, tarea.getCambio());
                }
                consulta.setString(23, tarea.getSustento());
                consulta.setString(24, tarea.getSustentoID());
                Deb.consola("Controlador.CUsuarios.guardar()" + consulta);
                // Deb.consola(bdd);
                //// cream
                consulta.executeUpdate();
                ResultSet rs = consulta.getGeneratedKeys();
                if (rs.next()) {
                    codigoThisFactura = rs.getInt(1);
                    Deb.consola("Controlador.Usuarios.FacturasDao.guardar()>: " + codigoThisFactura);
                }

            } catch (SQLException ex) {
                errorfacturacion = true;
                //msg.setProgressBar_mensajae(ex.toString());
                Deb.consola("Controlador.CUsuarios.guardar()" + ex);
            } finally {

            }
            /////////////FIN FACTURA
            ///////agredo el codigo de la factura al detalle de factura 
            for (DetalleCompra det : listaDetalleFactura) {
                det.setCompra_Codigo(codigoThisFactura);
            }
            //////////
            ///////////////////INCIA CAJA DETALLE
            if (afectaCaja) {
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
            for (DetalleCompra detalleCompra : listaDetalleFactura) {
                try {
                    //this.conectar();
                    //PreparedStatement consulta;
                    consulta = this.con.prepareStatement("INSERT INTO  detallecompra (cantidad, detalle, iva, descuento,"
                            + " valorUnitario, valorTotal, compras_Codigo, "
                            + "Productos_Codigo,Observaciones) VALUES(?,?,?,?, ?, ?,?,?,?)");
                    consulta.setString(1, detalleCompra.getCantidad().toUpperCase());
                    consulta.setString(2, detalleCompra.getDetalle().toUpperCase());
                    consulta.setString(3, detalleCompra.getIva());
                    consulta.setString(4, detalleCompra.getDescuento());
                    consulta.setString(5, detalleCompra.getValorUnitario());
                    consulta.setString(6, detalleCompra.getValorTotal());
                    consulta.setInt(7, detalleCompra.getCompra_Codigo());
                    consulta.setInt(8, detalleCompra.getProductos_codigo());
                    consulta.setString(9, detalleCompra.getObservaciones());
                    Deb.consola("Controlador.CUsuariosdasds.gasduardar()" + consulta);
                    consulta.executeUpdate();
                } catch (SQLException ex) {
                    //msg.setProgressBar_mensajae(ex.toString());
                    errorfacturacion = true;
                    Deb.consola("Controlador.CUsuarios.guardar()" + ex);
                } finally {

                }
            }

            ///// FIN DETALLE FACTURA
            /////////////////INICIO KARDEX
            if (afectakardex) {
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
                        Deb.consola("Controlador.CUsuarios.guardar()" + consulta);
                        consulta.executeUpdate();
                    } catch (SQLException ex) {
                        errorfacturacion = true;
                        //    msg.setProgressBar_mensajae(ex.toString());
                        Deb.consola("Controlador.CUsuarios.guardar()" + ex);
                    } finally {

                    }
                }

                /////////////////FIN KARDEX
            }
            ////////////////actualiza precios de costp a productos
            for (Productos prod : listaProductos) {

                try {

                    PreparedStatement st = this.con.prepareStatement("UPDATE Productos SET "
                            + "costo= ?, "
                            + "pvp= ?, "
                            + "p1=?,"
                            + "p2=?,"
                            + "p3=?,"
                            + "base=?"
                            + "WHERE Codigo=?");
                    st.setString(1, prod.getCosto());
                    st.setString(2, prod.getPvp());
                    st.setDouble(3, prod.getP1());
                    st.setDouble(4, prod.getP2());
                    st.setDouble(5, prod.getP3());
                    st.setDouble(6, prod.getBase());
                    st.setInt(7, prod.getCodigo());
                    String sql = st.toString();
                    Deb.consola("Controlador.Usuarios.CUsdadqweuarios.modificar()" + sql);
                    st.executeUpdate();

                } catch (SQLException ex) {
                    errorfacturacion = true;
                    //    msg.setProgressBar_mensajae(ex.toString());
                    Deb.consola("Controlador.CUsuarios.guardar()" + ex);
                } finally {

                }
            }
            ///fina actualzia precio costo a prductps

            /////////SI LA VENTA ES A CREDITO REGISTRA CXP
            Integer CodigoThisInsert = null;
            try {

                //this.conectar();
                /// PreparedStatement consultacxc = null;
                consulta = this.con.prepareStatement("INSERT INTO cxp (tipo,"
                        + " descripcion,fechaVencimiento,total,abono,saldo,compras_codigo,formasPagoc_codigo,diasCredito,diasAtrazo,proveedores_codigo)"
                        + " VALUES(?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);

                consulta.setString(1, cxp.getTipo().toUpperCase());
                consulta.setString(2, cxp.getDescripcion().toUpperCase());
                long d = cxp.getFechaVencimiento().getTime();
                java.sql.Date fecha = new java.sql.Date(d);
                consulta.setDate(3, fecha);
                consulta.setString(4, cxp.getTotal());
                consulta.setString(5, cxp.getAbono());
                consulta.setString(6, cxp.getSaldo());
                consulta.setInt(7, codigoThisFactura);
                consulta.setInt(8, cxp.getFormasPagoc_codigo());
                consulta.setString(9, cxp.getDiasCredito());
                consulta.setString(10, cxp.getDiasAtrazo());
                consulta.setInt(11, cxp.getProveedores_Codigo());
                Deb.consola("Controlador.Usuarios.PagosDao.guardar()consulta: " + consulta.toString());
                consulta.executeUpdate();
                ResultSet rs = consulta.getGeneratedKeys();
                if (rs.next()) {
                    CodigoThisInsert = rs.getInt(1);
                    //Deb.consola("Controlador.Usuarios.FacturasDao.guardar()>: " + codigoThisFactura);
                }
            } catch (SQLException ex) {
                errorfacturacion = true;

                Deb.consola("" + ex);
            } finally {

            }
            /////////FIN SI LA VENTA ES A CREDITO REGISTRA CXC
            ////se guarda todo el proceso

            if (!errorfacturacion) {
                this.con.commit();
                EOLfacturacion = true;
            } else {

                codigoThisFactura = 0;
                EOLfacturacion = false;
                this.con.rollback();
            }

        } catch (SQLException ex) {

            Deb.consola("Controlador.ComitsAll.facturar() error al guardar la factura nunca llego al comit : " + ex);
            Logger.getLogger(ComitsAll.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ///finalmente cierro la conexion
            this.cerrar();
        }
        return codigoThisFactura;
    }

    public void ElimiarCompras(Integer id, List<DetalleCompra> list, ArrayList<Kardex> kardexlist) {
        int codigoThisFactura = 0;
        PreparedStatement consulta = null;

        try {
            java.sql.Date fec = null;
            this.conectar();
            this.con.setAutoCommit(false);
            int cod = 0;
            HoraFecha hora = new HoraFecha();
            fec = (Date) hora.obtenerFecha();
            try {
                for (Kardex kardex : kardexlist) {

                    try {

                        consulta = this.con.prepareStatement("INSERT INTO kardex (fecha, bodega,"
                                + " detalle, incantidad, incosto,"
                                + " inpvp, outcantidad, outcosto,"
                                + "outpvp,saldocantidad,saldocosto,"
                                + "saldopvp,productos_Codigo) VALUES(?,?,?,?,?,?,?, ?, ?,?,?,?,?)");
                        long fi = fec.getTime();
                        java.sql.Date fecha = new java.sql.Date(fi);
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
                        Deb.consola("Controlador.CUsuarios.guardar()" + consulta);
                        consulta.executeUpdate();
                    } catch (SQLException ex) {
                        errorfacturacion = true;
                        //    msg.setProgressBar_mensajae(ex.toString());
                        Deb.consola("Controlador.CUsuarios.guardar()" + ex);
                    } finally {

                    }
                    ////fin kardex

                }

                for (DetalleCompra d : list) {
                    try {
                        consulta = this.con.prepareStatement("delete  from detallecompra where codigo= " + d.getCodigo());
                        consulta.executeUpdate();
                    } catch (Exception e) {
                        errorfacturacion = true;
                        //    msg.setProgressBar_mensajae(ex.toString());
                        Deb.consola("Controlador.CUsuarios.guardar()" + e);
                    }

                }
                try {

                    consulta = this.con.prepareStatement("delete  from compras where codigo= " + id);
                    consulta.executeUpdate();
                } catch (Exception e) {
                    errorfacturacion = true;
                    //    msg.setProgressBar_mensajae(ex.toString());
                    Deb.consola("Controlador.CUsuarios.guardar()" + e);
                }

                consulta.executeUpdate();
                

            } catch (SQLException ex) {
                errorfacturacion = true;
                //msg.setProgressBar_mensajae(ex.toString());
                Deb.consola("Controlador.CUsuarios.guardar()" + ex);
            } finally {

            }
            for (Object obj : list) {

//                cod = preparedStatement.executeUpdate();
//  //              ResultSet rs = preparedStatement.getGeneratedKeys();
//                if (rs.next()) {
//                    cod = rs.getInt(1);
//                    Deb.consola("Controlador.Usuarios.FacturasDao.guardar()>   xxxxccc   xx  : " + cod);
//                }
//            
            }
            if (!errorfacturacion) {
                this.con.commit();
                EOLfacturacion = true;
            } else {

                EOLfacturacion = false;
                this.con.rollback();
            }

        } catch (Exception e) {

            try {
                this.con.rollback();
                System.out.println("Controlador.ComitsAll.ElimiarCompras()");
            } catch (SQLException ex) {
                Logger.getLogger(ComitsAll.class.getName()).log(Level.SEVERE, null, ex);
            }
        } finally {

            this.cerrar();
        }
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
//                    Deb.consola("Controlador.Usuarios.FacturasDao.guardar()>   xxxxccc   xx  : " + cod);
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
