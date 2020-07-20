/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import ClasesAuxiliares.FeCodigoNUmerico;
import ClasesAuxiliares.Variables;
import Controlador.Coneccion;
import Modelo.Clientes;
import Modelo.Compras;
import Modelo.DetalleCompra;
import Modelo.sri_sustentocomprobante;
import Modelo.sri_tipocomprobante;
import Vista.Principal;
import Vlidaciones.ProgressBar;
import ecx.unomas.elements.ArchivoUtil;
import ecx.unomas.factura.Detalle;
import ecx.unomas.factura.Factura;
import ecx.unomas.factura.Impuesto;
import ecx.unomas.factura.InfoAdicional;
import ecx.unomas.factura.TotalImpuesto;
import ecx.unomas.service.Comprobante;
import ecx.unomas.service.Config;
import login.login;
import java.io.File;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultListModel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author USUARIO
 */
public class ComprasDao extends Coneccion {

    private String tabla = "compras";
    ProgressBar msg = new ProgressBar(3000, "");
    private DefaultListModel modeloListadetalle = new DefaultListModel();
    private DefaultListModel modeloListacantidad = new DefaultListModel();
    public ArrayList<sri_tipocomprobante> listaTipoComporabante = new ArrayList<sri_tipocomprobante>();

    public ArrayList<sri_tipocomprobante> getlistaTipoComprobate() {
        ArrayList<sri_tipocomprobante> listaTipoComporabante = new ArrayList<sri_tipocomprobante>();

        ResultSet rs;
        //sri_tipocomprobante u = new sri_tipocomprobante();
        try {

            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall("select * from sri_tipocomprobante");
            rs = st.executeQuery();
            while (rs.next()) {
                sri_tipocomprobante per = new sri_tipocomprobante();
                per.setCodigo(rs.getInt("Codigo"));
                per.setId(rs.getString("id"));
                per.setTipocomprobante(rs.getString("tipoComprobante"));
                listaTipoComporabante.add(per);

            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return listaTipoComporabante;
    }

    public ArrayList<sri_sustentocomprobante> getlistasustentoComprobate() {

        ArrayList<sri_sustentocomprobante> listasustentoComporabante = new ArrayList<sri_sustentocomprobante>();

        ResultSet rs;
        //sri_tipocomprobante u = new sri_tipocomprobante();
        try {

            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall("select * from sri_sustentocomprobante");
            rs = st.executeQuery();
            while (rs.next()) {
                sri_sustentocomprobante per = new sri_sustentocomprobante();
                per.setCodigo(rs.getInt("Codigo"));
                per.setId(rs.getString("id"));
                per.setSustento(rs.getString("sustento"));
                listasustentoComporabante.add(per);

            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return listasustentoComporabante;
    }

    public DefaultTableModel listarComprasTbModelok(String fecha1, String fecha2) {
        DefaultTableModel modelo = null;

        String[] titulos
                = {"Codigo", "Fecha", "Numero de Factura", "Total",
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
        String sql = "SELECT compras.* ,usuarios.Nombres AS usuario, proveedores.Nombres AS cliente, proveedores.Cedula AS ruc FROM compras INNER JOIN proveedores ON proveedores.Codigo=compras.Proveedores_codigo INNER JOIN usuarios ON usuarios.codigo= compras.Usuarios_Codigo WHERE hora BETWEEN '" + fecha1 + "' AND '" + fecha2 + "' ORDER BY compras.secuencia";
        //String sql = "SELECT compras.* ,usuarios.Nombres as usuario, proveedores.Nombres as cliente, clientes.Cedula as ruc from compras inner join clientes on clientes.Codigo=compras.Proveedor_codigo inner JOIN usuarios on usuarios.codigo= facturas.Usuarios_Codigo where hora BETWEEN '" + fecha1 + "' and '" + fecha2 + "' order BY facturas.secuencia ";
        //String sql="SELECT facturas.* ,usuarios.Nombres as usuario, clientes.Nombres as cliente, clientes.Cedula as ruc from facturas inner join clientes on clientes.Codigo=facturas.Clientes_codigo inner JOIN usuarios on usuarios.codigo= facturas.Usuarios_Codigo order BY facturas.secuencia LIMIT 0, 50";
        try {
            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall(sql);
            System.out.println("Controlador.CUsuarios.Buscar_table_Only()" + st.toString());
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
                System.out.println("Controlador.CUsuarios.Buscar_table_only()" + registros[1]);

            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "rrrrddrrrrrrrrrr");
        } finally {
            this.cerrar();
        }

        return modelo;
    }

    public DefaultTableModel Buscar_table_compras(String columna, String value) {
        DefaultTableModel modelo = null;
        String[] titulos
                = {"Codigo", "Fecha", "Numero de Factura", "Total",
                    "Documento", "Terminal",
                    "Provvedor", "Ruc", "Forma Pago"};
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
            st = this.getCnx().prepareCall("SELECT proveedores.nombres AS proveedor, proveedores.Cedula AS ruc, compras.*, usuarios.nombres AS usuario, usuarios.codigo AS ucodigo FROM proveedores INNER JOIN compras ON proveedores.Codigo=compras.Proveedores_codigo  INNER JOIN usuarios ON usuarios.codigo= compras.Usuarios_Codigo  WHERE " + columna + " LIKE '%" + value + "%' ORDER BY compras.hora ");
            System.out.println("Controlador.CUsuarios.Buscar_table()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {

                registros[0] = String.valueOf(rs.getInt("Codigo"));
                registros[1] = rs.getString("fecha");
                registros[2] = rs.getString("secuencia");
                registros[3] = rs.getString("total");
                registros[4] = rs.getString("tipo_documento");
                registros[5] = rs.getString("Equipo");
                registros[6] = rs.getString("Proveedor");
                registros[7] = rs.getString("ruc");
                registros[8] = rs.getString("formaPago");

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

    public void creaxmlFacturaElectronica(Integer codigo) {

        Compras fac = new Compras();
        try {
            fac = this.buscarConID(codigo);
        } catch (Exception e) {
            System.out.println("Controlador.Usuarios.FacturasDao.creaxmlFacturaElectronica()sssd" + e);
        }
        try {

            Factura f = new Factura();

            f.setTipoEmision(Integer.parseInt(Variables.FE_TIPO_EMISION));
            f.setAmbiente(Integer.parseInt(Variables.FE_TIPO_AMBIENTE));
            //f.setAmbienteName();
            f.setNombreComercial(login.nombreEmpresa);
            f.setRazonSocial(login.nombreEmpresa);
            f.setRUC(login.rucEmpresa);

            f.setClaveAcceso(fac.getCalveAcceso());
            f.setCodDoc(Variables.FE_FACTURA);
            f.setEstab(fac.getEstablecimiento());
            f.setPtoEmi(fac.getPtoEmision());
            f.setSecuencia(fac.getSecfactura());
            f.setDirMatriz(login.direccionEmpresa);

            f.setFechaEmision(HoraFecha.fecha_ddmmaaa_conSlash(fac.getFecha().toString()));
            f.setDirEstablecimiento(login.direccionEmpresa);
            f.setContribuyenteEspecial(login.contribuyenteEspecialNUmero.toString());
            f.setObligadoContabilidad(login.ObligadoSiNOEmpresa);
            ClientesDao clienteDao = new ClientesDao();
            Clientes cliente = new Clientes();

            cliente = clienteDao.buscarConID(fac.getProveedores_codigo(),1);

            if (cliente.getCedula().length() == 10) {
                f.setTipoIdentificacionComprador(Variables.FE_TIPO_IDENTIFICACION_CEDULA);
            } else if (cliente.getCedula().length() == 13) {
                f.setTipoIdentificacionComprador(Variables.FE_TIPO_IDENTIFICACION_RUC);
            }
            // f.setGuiaRemision("001-001-00000002");
            f.setRazonSocialComprador(cliente.getNombre());
            f.setIdentificacionComprador(cliente.getCedula());
            f.setDireccionComprador(cliente.getDireccion());
            f.setTotalSinImpuestos(Double.parseDouble(fac.getSubtotaI_con_iva()));
            f.setTotalDescuento(Double.parseDouble(fac.getDescuento()));

//// totatal con impuesto ya esta en xml     
            /////
            TotalImpuesto totimp = new TotalImpuesto();
            totimp.setBaseImponible(Double.parseDouble(fac.getSubtotaI_con_iva()));
            totimp.setCodigo(2);
            totimp.setCodigoPorcentaje(2);
            totimp.setValor(Double.parseDouble(fac.getIva_valor()));
            f.setTotalImpuestos(totimp);
            f.setImporteTotal(Double.parseDouble(fac.getTotal()));
/////////////
            //DetalleFactura df = new DetalleFactura();
            List<DetalleCompra> lista = new ArrayList<DetalleCompra>();
            DetalleComprasDao dfDao = new DetalleComprasDao();
            lista = dfDao.buscarConIDFact(fac.getCodigo());
            for (DetalleCompra df : lista) {

                Detalle d = new Detalle();

                d.setCodigoPrincipal(String.valueOf(df.getProductos_codigo()));
                d.setCodigoSecundario(String.valueOf(df.getProductos_codigo()));
                d.setDescripcion(df.getDetalle());
                d.setCantidad(Double.parseDouble(df.getCantidad()));
                d.setPrecioUnitario(Double.parseDouble(df.getValorUnitario()));
                d.setDescuento(Double.parseDouble(df.getDescuento()));
                d.setPrecioTotalSinImpuesto(Double.parseDouble(df.getValorTotal()));
                Impuesto i = new Impuesto();
                Vector<Impuesto> ivec = new Vector<Impuesto>();

                i.setCodigo(2);
                i.setCodigoPorcentaje(2);
                i.setTarifa(Double.parseDouble(Principal.iva));
                //Double bi = Double.parseDouble(df.getValorTotal()) - Double.parseDouble(df.getIva());
                i.setBaseImponible(Double.parseDouble(df.getValorTotal()));
                i.setValor(Double.parseDouble(df.getIva()));
                ivec.add(i);
                d.setImpuesto(ivec);

                f.setDetalle(d);
            }
            InfoAdicional infadd = new InfoAdicional();
            InfoAdicional infadd1 = new InfoAdicional();
            InfoAdicional infadd2 = new InfoAdicional();
            InfoAdicional infadd3 = new InfoAdicional();
            InfoAdicional mail = new InfoAdicional();
            mail.setNombre("E-MAIL");
            mail.setValor(cliente.getMail());
            infadd.setNombre("FORMA DE PAGO");
            infadd.setValor(fac.getFormaPago());
            infadd1.setNombre("DIENRO EN EFECTIVO");
            infadd1.setValor(String.valueOf(fac.getEfectivo()));
            infadd3.setNombre("CAMBIO");
            infadd3.setValor(String.valueOf(fac.getCambio()));
            infadd2.setNombre("EQUIPO");
            infadd2.setValor(fac.getEquipo());
            f.setInfAdicional(mail);
            f.setInfAdicional(infadd3);
            f.setInfAdicional(infadd2);
            f.setInfAdicional(infadd1);
            f.setInfAdicional(infadd);
            String s = f.getXML();
            //     System.out.println("xmls" + s);
            // TODO code application logic here
            //byte[] xmlBytes=  readBytesFromFile("D:\\comprobantes\\generados\\fac3.xml");
            ArchivoUtil.stringToFile(Config.GENERADOS_DIR + fac.getCalveAcceso() + ".xml", s);
            File xml_file = new File(Config.GENERADOS_DIR + fac.getCalveAcceso() + ".xml");
            byte[] archivoBytes = null;
            try {

                archivoBytes = ArchivoUtil.convertirArchivoAByteArray(xml_file);
            } catch (IOException ex) {
                Logger.getLogger(ComprasDao.class.getName()).log(Level.SEVERE, null, ex);
            }
            String clave = fac.getCalveAcceso();
            Comprobante a = new Comprobante();
            String upload = "";
            String valida = "";

////////////            upload = a.upload(clave, archivoBytes);            
////////////            if (upload.contains("OK")) {  
////////////                System.out.println("FIRMADO, AUTORIZADO Y ENVIADO CON EXITO..");
////////////            } else {
////////////                System.out.println("ERROR DE ENVIO: " + upload);
////////////            }
//
//            System.out.println("VALIDATE: " + a.validate(fac.getCalveAcceso()));
//            System.out.println("DOWNLOAD: " + a.download(fac.getCalveAcceso(), "xml"));
        } catch (Exception e) {
            System.err.println("erroro : " + e);
        }
        //a.sendDoc(claveAcceso,"homer_loading@hotmail.com"," Jimmy carri");

        //      a.download(claveAcceso, ext);
    }

    public DefaultListModel Buscar_productos(String value, String bodega) {

        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select b" + bodega + " , producto from productos where  producto like '%" + value + "%' order BY productos.producto LIMIT 0, 50");
            System.out.println("Controlador.CUsuarios.Buscar_table()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                modeloListacantidad.addElement(rs.getString("b" + bodega));
                modeloListadetalle.addElement(rs.getString("producto"));
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "hhhh");
        } finally {
            this.cerrar();
        }

        return modeloListadetalle;
    }

    public DefaultListModel Buscar_Facuras_Proveedor() {
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

    public boolean getTrueifCodigoAIRisCorrect(String codAir) {
        boolean exiteId = false;
        ResultSet rs;

        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select id from sri_porcentajes_retencion where id=" + codAir);

            rs = st.executeQuery();

            while (rs.next()) {
                if (codAir.equals(rs.getString("id"))) {
                    exiteId = true;
                }

            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "lllhhhh");
        } finally {
            this.cerrar();
        }
        return exiteId;
    }

    public String[] Buscar_registros(String value, String bodega) {
        String[] registros = new String[11];

        ResultSet rs;
        String tabla = "productos";
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select Productos.*, modelos.Modelo from productos inner join modelos on modelos.Codigo=productos.Modelos_Codigo where producto  like '%" + value + "%' order BY productos.producto LIMIT 0, 50");
            //  JOptionPane.showMessageDialog(null,"sssssddeerere"+ st.toString());
            //    System.out.println("Controlador.CUsuarios.Buscar_table()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                registros[0] = rs.getString("costo");
                registros[1] = String.valueOf(1);
                registros[2] = String.valueOf(rs.getInt("Codigo"));
                registros[3] = rs.getString("Producto");
                registros[4] = "1";
                registros[5] = "0";
                registros[6] = bodega;
                registros[7] = rs.getString("costo");
                registros[8] = "0";
                registros[9] = rs.getString("b" + bodega);
                registros[10] = "332";

//                System.out.println("Controlador.CUsuarios.Buscar_table()" + registros[1]);
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "lllhhhh");
        } finally {
            this.cerrar();
        }

        return registros;
    }

    public Integer guardar(Compras tarea) {
        int codigoThisFactura = 0;
        try {
            this.conectar();
            PreparedStatement consulta;
            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (fecha, iva, subtotaI_con_iva, subtotal_sin_iva,"
                    + " total, utilidad, tipo_documentoID, tipo_documento, "
                    + "descuento,proveedores_codigo,Usuarios_Codigo, Equipo, secuencia,fechain,iva_valor,calveAcceso,establecimiento,ptoEmision,secfactura,formaPago,efectivo,cambio,sustento,sustentoID) VALUES(?,?,?,?, ?,?,?, ?,?,?,?,?, ?, ?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            //           java.sql.Timestamp sqlTimeStamp = new java.sql.Timestamp(tarea.getFecha());
            long d = tarea.getFecha().getTime();
            java.sql.Date fecha = new java.sql.Date(d);
            consulta.setDate(1, fecha);
            consulta.setString(2, tarea.getIva().toUpperCase());
            consulta.setString(3, tarea.getSubtotaI_con_iva().toUpperCase());
            consulta.setString(4, tarea.getSubtotal_sin_iva());
            consulta.setString(5, tarea.getTotal());
            consulta.setString(6, tarea.getUtilidad());
            consulta.setString(7, tarea.getTipo_documentoID());
            consulta.setString(8, tarea.getTipo_documento());
            consulta.setString(9, tarea.getDescuento().toUpperCase());
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
            System.out.println("Controlador.CUsuarios.guardar()" + consulta);
            //// cream
            consulta.executeUpdate();
            ResultSet rs = consulta.getGeneratedKeys();
            if (rs.next()) {
                codigoThisFactura = rs.getInt(1);
                System.out.println("Controlador.Usuarios.FacturasDao.guardar()>: " + codigoThisFactura);
            }
        } catch (SQLException ex) {
            //msg.setProgressBar_mensajae(ex.toString());
            System.out.println("Controlador.CUsuarios.guardar()" + ex);
        } finally {
            this.cerrar();
        }
        return codigoThisFactura;
    }

    public Compras buscarConID(Integer id) {
        ResultSet rs;
        Compras u = new Compras();
        try {

            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall("select * from compras where codigo =" + id);
            rs = st.executeQuery();
            while (rs.next()) {
                Compras per = new Compras();
                per.setCodigo(rs.getInt("Codigo"));
                per.setAnulada(rs.getBoolean("anulada"));
                per.setProveedores_codigo(rs.getInt("Proveedores_codigo"));
                per.setDescuento(rs.getString("descuento"));
                per.setEquipo(rs.getString("equipo"));
                per.setUtilidad(rs.getString("utilidad"));
                per.setFecha(rs.getDate("fecha"));
                per.setHora(rs.getTimestamp("Hora"));
                per.setIva(rs.getString("iva"));
                per.setIva_valor(rs.getString("iva_valor"));
                per.setSecuencia(rs.getString("secuencia"));
                per.setSubtotaI_con_iva(rs.getString("subtotaI_con_iva"));
                per.setSubtotal_sin_iva(rs.getString("subtotal_sin_iva"));
                per.setTipo_documentoID(rs.getString("tipo_documentoID"));
                per.setTipo_documento(rs.getString("tipo_documento"));
                per.setTotal(rs.getString("total"));
                per.setUsuarios_Codigo(rs.getInt("Usuarios_Codigo"));
                per.setCalveAcceso(rs.getString("calveAcceso"));
                per.setEstablecimiento(rs.getString("establecimiento"));
                per.setPtoEmision(rs.getString("ptoEmision"));
                per.setSecfactura(rs.getString("secfactura"));
                per.setFormaPago(rs.getString("formaPago"));
                per.setEfectivo(rs.getDouble("efectivo"));
                per.setCambio(rs.getDouble("cambio"));
                per.setNota_Codigo(rs.getInt("nota_codigo"));
                per.setSustento(rs.getString("sustento"));
                per.setSustentoID(rs.getString("sustentoID"));
                u = per;
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }

    public DefaultTableModel listarComprasTbModel2(String fecha1, String fecha2) {
        DefaultTableModel modelo = null;

        String[] titulos
                = {"Codigo", "Fecha", "Numero de Factura", "Total",
                    "Vendedor", "Terminal",
                    "Provvedor", "Ruc", "Estado"};
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
        String sql = "SELECT compras.* ,usuarios.Nombres as usuario, proveedores.Nombres as cliente, proveedores.Cedula as ruc from compras inner join proveedores on proveedores.Codigo=compras.Proveedores_codigo inner JOIN usuarios on usuarios.codigo= compras.Usuarios_Codigo where hora BETWEEN '" + fecha1 + "' and '" + fecha2 + "' ";
        //String sql="SELECT facturas.* ,usuarios.Nombres as usuario, clientes.Nombres as cliente, clientes.Cedula as ruc from facturas inner join clientes on clientes.Codigo=facturas.Proveedores_codigo inner JOIN usuarios on usuarios.codigo= facturas.Usuarios_Codigo order BY facturas.secuencia LIMIT 0, 50";
        try {
            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall(sql);
            System.out.println("Controlador.CUsuarios.Buscar_table_Only()" + st.toString());
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
                System.out.println("Controlador.CUsuarios.Buscar_table_only()" + registros[1]);

            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "rrrrddrrrrrrrrrr");
        } finally {
            this.cerrar();
        }

        return modelo;
    }

    public void eliminar(Compras obj) throws Exception {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("DELETE from  compras WHERE Codigo = ? ");
            st.setInt(1, obj.getCodigo());
            st.executeUpdate();
        } catch (SQLException e) {
            msg.setProgressBar_mensajae("Error..!! " + e);
        } finally {
            this.cerrar();
        }

    }

}
