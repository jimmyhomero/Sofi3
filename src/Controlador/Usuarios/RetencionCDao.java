/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import ClasesAuxiliares.FeCodigoNUmerico;
import ClasesAuxiliares.Variables;
import Controlador.Coneccion;
import Modelo.Proveedores;
import Modelo.Compras;
import Modelo.DetalleCompra;
import Modelo.DetalleRetencion;
import Modelo.Retencion_;
import Modelo.Sri_porcentajes_retencion;
import Modelo.sri_sustentocomprobante;
import Modelo.sri_tipocomprobante;
import Vista.Principal;
import Vlidaciones.ProgressBar;
import ecx.unomas.elements.ArchivoUtil;
import ecx.unomas.retencion.InfoAdicional;
import ecx.unomas.retencion.Impuesto;
import ecx.unomas.retencion.Retencion;
import ecx.unomas.service.Comprobante;
import ecx.unomas.service.Config;
import ClasesAuxiliares.debug.Deb;
import Modelo.Clientes;
import login.login;
import java.io.File;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
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
public class RetencionCDao extends Coneccion {
private String retstring="";
    private String tabla = "retencion";
    ProgressBar msg = new ProgressBar(3000, "");
    private DefaultListModel modeloListadetalle = new DefaultListModel();
    private DefaultListModel modeloListacantidad = new DefaultListModel();
    public ArrayList<sri_tipocomprobante> listaTipoComporabante = new ArrayList<sri_tipocomprobante>();
    public ArrayList<Retencion_> listaFacNoAutorizadas = new ArrayList<Retencion_>();

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
            Deb.consola("Controlador.CUsuarios.BuscarConId()" + ex);
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
            Deb.consola("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return listasustentoComporabante;
    }

    public ArrayList<Sri_porcentajes_retencion> getlistaPorcentajesdeRetencion() {

        ArrayList<Sri_porcentajes_retencion> listapoercentajeRet = new ArrayList<Sri_porcentajes_retencion>();

        ResultSet rs;
        //sri_tipocomprobante u = new sri_tipocomprobante();
        try {

            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall("select * from Sri_porcentajes_retencion");
            rs = st.executeQuery();
            while (rs.next()) {
                Sri_porcentajes_retencion per = new Sri_porcentajes_retencion();
                per.setCodigo(rs.getInt("Codigo"));
                per.setId(rs.getString("id"));
                per.setPorcentaje(rs.getInt("porcentaje"));
                per.setDescripcion(rs.getString("descripcion"));
                per.setTipo(rs.getString("tipo"));
                listapoercentajeRet.add(per);

            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return listapoercentajeRet;
    }

    private String periodo(String claveAcceso) {
        String mes = "";
        String anio = "";
        mes = claveAcceso.substring(2, 4);
        anio = claveAcceso.substring(4, 8);
        Deb.consola("periodo: " + mes + "/" + anio);
        return mes + "/" + anio;
    }

    public String creaxmlRetencionElectronica(Integer codigoRet) {
        
        String periodo = "02/2018";
//        try {
//            long ddo = getFechaNowTImestampServer().getTime();
//        java.sql.Date fecha = new java.sql.Date(ddo);
//        Deb.consola("SsssssssssssssssssssssssssssÑ     : " + fecha.toString());
//         periodo = HoraFecha.fecha_mmaaConSlash(fecha.toString());
//        } catch (Exception e) {
//            Deb.consola("Controlador.Usuarios.RetencionCDao.creaxmlRetencionElectronica()cvb: "+e);
//        }

        Retencion_ ret = new Retencion_();
        Compras com = new Compras();
        ComprasDao comDao = new ComprasDao();
        Clientes pro = new Clientes();
        ClientesDao proDao = new ClientesDao();
        try {
            ret = this.buscarConID(codigoRet);
        } catch (Exception e) {
            Deb.consola("Controlador.Usuarios.FacturasDao.creaxmlFacturaElectronica()sssd" + e);
        }
        try {
            com = comDao.buscarConID(ret.getCompras_codigo());

            Retencion f = new Retencion();

            f.setTipoEmision(Integer.parseInt(Variables.FE_TIPO_EMISION));
            f.setAmbiente(Integer.parseInt(Variables.FE_TIPO_AMBIENTE));
            //f.setAmbienteName();
            f.setNombreComercial(login.nombreEmpresa);
            f.setRazonSocial(login.nombreEmpresa);
            f.setRUC(login.rucEmpresa);

            f.setClaveAcceso(ret.getAutorizacion());
          periodo=periodo(ret.getAutorizacion());
            f.setCodDoc(Variables.FE_RETENCION);
            f.setEstab(ret.getSec1());
            f.setPtoEmi(ret.getSec2());
            f.setSecuencia(ret.getSec3());
            f.setDirMatriz(login.direccionEmpresa);

            f.setFechaEmision(HoraFecha.fecha_ddmmaaa_conSlash(ret.getFecha().toString()));
            f.setDirEstablecimiento(login.direccionEmpresa);
            if (login.contribuyenteEspecialNUmero != "") {
                f.setContribuyenteEspecial(login.contribuyenteEspecialNUmero);
            }

            f.setObligadoContabilidad(login.ObligadoSiNOEmpresa);

            pro = proDao.buscarConID(ret.getProveedor_codigo(),1);

            if (pro.getCedula().length() == 10) {
                f.setTipoIdentificacionSujetoRetenido(Variables.FE_TIPO_IDENTIFICACION_CEDULA);
            } else if (pro.getCedula().length() == 13) {
                f.setTipoIdentificacionSujetoRetenido(Variables.FE_TIPO_IDENTIFICACION_RUC);
            }
            // f.setGuiaRemision("001-001-00000002");
            f.setRazonSocialSujetoRetenido(pro.getNombre());
            f.setIdentificacionSujetoRetenido(pro.getCedula());

            f.setPeriodoFiscal(periodo);

            DetalleRetencionDao drDao = new DetalleRetencionDao();
            //DetalleRetencion detRet =new DetalleRetencion();
            List<DetalleRetencion> lista = new ArrayList<DetalleRetencion>();
            lista = drDao.buscarConIDFact(codigoRet);
            int i = 1;
            for (DetalleRetencion d : lista) {
                Impuesto imp = new Impuesto();
                imp.setBaseImponible(d.getBase());
                imp.setCodigo(i);
                ///fac-notadebito-notacredito
                imp.setCodDocSustento(com.getSustentoID());
                //num fact-nota-debito
                String secuencia = ret.getCompra_seceuncia().replace("-", "");
                imp.setNumDocSustento(secuencia);
                imp.setCodigoRetencion(d.getId());
                String fech = HoraFecha.fecha_aaMMdd_to_ddMMaa(com.getFecha().toString().replace("-", "/"));
                imp.setFechaEmisionDocSustento(fech);
                imp.setPorcentajeRetener(Integer.parseInt(String.valueOf(d.getPorcentaje())));
                imp.setValorRetenido(d.getRetenido());
                f.setImpuesto(imp);
                i++;

            }
            
            InfoAdicional infadd2 = new InfoAdicional();
            infadd2.setNombre("PAGO");
            infadd2.setValor(pro.getPagoPredeterminado().toString());                      
            InfoAdicional mail = new InfoAdicional();
            mail.setNombre("E-MAIL");
            mail.setValor(pro.getMail());            
            f.setInfAdicional(mail);            
            f.setInfAdicional(infadd2);            
            retstring = f.getXML();
//////            ArchivoUtil.stringToFile(Config.GENERADOS_DIR + ret.getAutorizacion() + ".xml", s);
//////            Deb.consola("RUTA DE GENERADOS: " + Config.GENERADOS_DIR + ret.getAutorizacion() + ".xml");
//////            File xml_file = new File(Config.GENERADOS_DIR + ret.getAutorizacion() + ".xml");
//////            byte[] archivoBytes = null;
//////            try {
//////
//////                archivoBytes = ArchivoUtil.convertirArchivoAByteArray(xml_file);
//////            } catch (IOException ex) {
//////                Logger.getLogger(FacturasDao.class.getName()).log(Level.SEVERE, null, ex);
//////            }
//////            String clave = ret.getAutorizacion();
//////            Comprobante a = new Comprobante();
        } catch (Exception e) {
            System.err.println("erroro : " + e);
        }
        //a.sendDoc(claveAcceso,"homer_loading@hotmail.com"," Jimmy carri");

        //      a.download(claveAcceso, ext);
        return retstring;
    }

    public DefaultListModel Buscar_productos(String value, String bodega) {

        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select b" + bodega + " , producto from productos where  producto like '%" + value + "%' order BY productos.producto LIMIT 0, 50");
            Deb.consola("Controlador.CUsuarios.Buscar_table()" + st.toString());
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

    public DefaultListModel Buscar_productos_stock() {
        return modeloListacantidad;
    }
public ArrayList<Retencion_> buscarFacturasNoAutorizadas() {
        ResultSet rs;
        Retencion_ u = new Retencion_();
        try {

            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall("select * from retencion where autorizado =0 ");
            rs = st.executeQuery();
            while (rs.next()) {
                Retencion_ per = new Retencion_();
                per.setCodig(rs.getInt("Codigo"));
                per.setAutorizacion(rs.getString("Autorizacion"));
                per.setCaducidad(rs.getDate("caducidad"));
                per.setCompra_seceuncia(rs.getString("Compra_seceuncia"));
                per.setCompras_codigo(rs.getInt("Compras_codigo"));
                per.setConcepto(rs.getString("Concepto"));
                per.setFecha(rs.getDate("fecha"));
                per.setEstado(rs.getInt("estado"));
                per.setProveedor_codigo(rs.getInt("Proveedor_codigo"));
                per.setSec1(rs.getString("sec1"));
                per.setSec2(rs.getString("sec2"));
                per.setSec3(rs.getString("sec3"));
                per.setSecuencia(rs.getString("Secuencia"));
                per.setTipo_comprobante(rs.getString("Tipo_comprobante"));
                per.setTotal(rs.getDouble("total"));
                per.setUsuario_codigo(rs.getInt("Usuarios_Codigo"));
                per.setAutorizado(rs.getInt("Autorizado"));
                
                u = per;
                listaFacNoAutorizadas.add(u);
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return listaFacNoAutorizadas;
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

    public boolean Buscar_siExisteRetenciondelDocumento(String secuencial) {
        String registros = "";
        boolean existe = false;
        ResultSet rs;
        String tabla = "Retencion";
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select compra_secuencia from retencion where compra_secuencia ='" + secuencial + "'");
            //  JOptionPane.showMessageDialog(null,"sssssddeerere"+ st.toString());
            Deb.consola("Controlador.CUsuarios.Buscar_takkkkkkkkkkkkkkble()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                //registros = rs.getString("compra_secuencia");
                existe = true;
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "lllhhhh");
        } finally {
            this.cerrar();
        }

        return existe;
    }

    public String[] Buscar_registros(String value, String bodega) {
        String[] registros = new String[10];

        ResultSet rs;
        String tabla = "productos";
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select Productos.*, modelos.Modelo from productos inner join modelos on modelos.Codigo=productos.Modelos_Codigo where producto  like '%" + value + "%' order BY productos.producto LIMIT 0, 50");
            //  JOptionPane.showMessageDialog(null,"sssssddeerere"+ st.toString());
            //    Deb.consola("Controlador.CUsuarios.Buscar_table()" + st.toString());
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
                registros[7] = rs.getString("pvp");
                registros[8] = "0";
                registros[9] = rs.getString("b" + bodega);

//                Deb.consola("Controlador.CUsuarios.Buscar_table()" + registros[1]);
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "lllhhhh");
        } finally {
            this.cerrar();
        }

        return registros;
    }

    public Timestamp getFechaNowTImestampServer() {
        ResultSet rs;
        java.sql.Timestamp t = null;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select current_timestamp as fecha");
            rs = st.executeQuery();

            //this.lista= new ArrayList();
            while (rs.next()) {
                t = (rs.getTimestamp("fecha"));
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConCedula()xxx: " + ex);
        } finally {
            this.cerrar();

        }

        return t;
    }

    public Integer guardar(Retencion_ tarea) {
        int codigoThisFactura = 0;
        try {
            this.conectar();
            PreparedStatement consulta;
            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla
                    + " (proveedor_codigo,compras_codigo,usuario_codigo,tipo_comprobante,autorizacion,"
                    + "compra_secuencia,secuencia,fecha,caducidad,total,concepto,sec1,sec2,sec3) VALUES(?,?,?,?,?,?,?, ?, ?,?,?,?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            //java.sql.Timestamp sqlTimeStamp = new java.sql.Timestamp(tarea.getFecha());
//            long d = tarea.getFechaEmision().getTime();
//            java.sql.Date fecha = new java.sql.Date(d);
            consulta.setInt(1, tarea.getProveedor_codigo());
            consulta.setInt(2, tarea.getCompras_codigo());
            consulta.setInt(3, tarea.getUsuario_codigo());
            consulta.setString(4, tarea.getTipo_comprobante());
            consulta.setString(5, tarea.getAutorizacion());
            consulta.setString(6, tarea.getCompra_seceuncia());
            consulta.setString(7, tarea.getSecuencia());
            consulta.setDate(8, tarea.getFecha());
            consulta.setDate(9, tarea.getCaducidad());
            consulta.setDouble(10, tarea.getTotal());
            consulta.setString(11, tarea.getConcepto());
            consulta.setString(12, tarea.getSec1());
            consulta.setString(13, tarea.getSec2());
            consulta.setString(14, tarea.getSec3());

            consulta.executeUpdate();
            ResultSet rs = consulta.getGeneratedKeys();
            if (rs.next()) {
                codigoThisFactura = rs.getInt(1);
                Deb.consola("Controlador.Usuarios.FacturasDao.guardar()>: " + codigoThisFactura);
            }
        } catch (SQLException ex) {
            //msg.setProgressBar_mensajae(ex.toString());
            Deb.consola("Controlador.CUsuarios.guardar()" + ex);
        } finally {
            this.cerrar();
        }
        return codigoThisFactura;
    }

    public Retencion_ buscarConID(Integer id) {
        ResultSet rs;
        Retencion_ u = new Retencion_();
        try {

            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall("select * from retencion where codigo =" + id);
            rs = st.executeQuery();
            while (rs.next()) {
                Retencion_ per = new Retencion_();
                per.setProveedor_codigo(rs.getInt("proveedor_codigo"));
                per.setCompras_codigo(rs.getInt("compras_codigo"));
                per.setUsuario_codigo(rs.getInt("usuario_codigo"));
                per.setTipo_comprobante(rs.getString("tipo_comprobante"));
                per.setAutorizacion(rs.getString("autorizacion"));
                per.setCompra_seceuncia(rs.getString("compra_secuencia"));
                per.setSecuencia(rs.getString("secuencia"));
                per.setFecha(rs.getDate("fecha"));
                per.setCaducidad(rs.getDate("caducidad"));
                per.setTotal(rs.getDouble("total"));
                per.setConcepto(rs.getString("concepto"));
                per.setSec1(rs.getString("sec1"));
                per.setSec2(rs.getString("sec2"));
                per.setSec3(rs.getString("sec3"));
                u = per;
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }

    public DefaultTableModel listarFacturasTbModel(String fecha1, String fecha2) {
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
        String sql = "SELECT compras.* ,usuarios.Nombres as usuario, proveedores.Nombres as cliente, proveedores.Cedula as ruc from compras inner join proveedores on proveedores.Codigo=compras.Proveedores_codigo inner JOIN usuarios on usuarios.codigo= compras.Usuarios_Codigo where hora BETWEEN '" + fecha1 + "' and '" + fecha2 + "' ";
        //String sql="SELECT facturas.* ,usuarios.Nombres as usuario, clientes.Nombres as cliente, clientes.Cedula as ruc from facturas inner join clientes on clientes.Codigo=facturas.Proveedores_codigo inner JOIN usuarios on usuarios.codigo= facturas.Usuarios_Codigo order BY facturas.secuencia LIMIT 0, 50";
        try {
            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall(sql);
            Deb.consola("Controlador.CUsuarios.Buscar_table_Only()" + st.toString());
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
                Deb.consola("Controlador.CUsuarios.Buscar_table_only()" + registros[1]);

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
