/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.cla

 */
package Controlador.Usuarios;

import ClasesAuxiliares.FeCodigoNUmerico;
import ClasesAuxiliares.Variables;
import ClasesAuxiliares.debug.Deb;
import Controlador.Coneccion;
import Modelo.CajasDetalle;
import Modelo.Clientes;
import Modelo.DetalleFactura;
import Modelo.Facturas;
import Vista.Principal;
import Vlidaciones.ProgressBar;
import com.ws.electro.cliente.Response;
import com.ws.electro.cliente.Respuesta;
import com.ws.electro.cliente.WSElectro_Service;
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
import java.io.StringReader;
import java.io.StringWriter;
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
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/**
 *
 * @author USUARIO
 */
public class FacturasDao extends Coneccion {

    private String tabla = "facturas";
    ProgressBar msg = new ProgressBar(3000, "");
    private DefaultListModel modeloListadetalle = new DefaultListModel();
    private DefaultListModel modeloListacantidad = new DefaultListModel();
    private ArrayList<Facturas> listaFacNoAutorizadas = new ArrayList<>();
    private ArrayList<Facturas> listaFacEnviadaslawssinestadoAutorizadas = new ArrayList<>();

    public void cabiaestadoFacturasDeEnviadastoAutorizadasEtado2(Facturas fac) {

        WSElectro_Service Ws = new WSElectro_Service();
        Respuesta r = new Respuesta();
        r = Ws.getWSElectroPort().searchAuthorization(login.rucEmpresa, Variables.FE_FACTURA, fac.getEstablecimiento(), fac.getPtoEmision(), fac.getSecfactura(), "1");//.receiptXMLIn(facxx, "admin", "admin", cliente.getMail());
        if (r.getEstado().equalsIgnoreCase("A")) {
            UpdateEstadoAutorizado(fac.getCodigo(), 2, r.getFechaAutorizacion());

        } else {
            UpdateEstadoAutorizado(fac.getCodigo(), 2, r.getMensajeSri());
        }
    }

    public String creaxmlFacturaElectronica(Facturas fac) {
        String facxx = "";

        //
        Integer codigoFac = fac.getCodigo();
        System.out.println("TIPO AMBIENTE EEEEEEEEEEEEEEEEEEEE: " + Variables.FE_TIPO_AMBIENTE);
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
            String fecha = fac.getFecha().toString();
            String a = HoraFecha.fecha_ddmmaaa_conslash_facElectronica(fecha);
            f.setFechaEmision(a);
            f.setDirEstablecimiento(login.direccionEmpresa);
            if (login.contribuyenteEspecialNUmero.equalsIgnoreCase("00")) {
                ///000 significa que no es contribuyente especial
                f.setContribuyenteEspecial(login.contribuyenteEspecialNUmero);
            } else {

            }

            f.setObligadoContabilidad(login.ObligadoSiNOEmpresa);
            ClientesDao clienteDao = new ClientesDao();
            Clientes cliente = new Clientes();

            cliente = clienteDao.buscarConID(fac.getClientes_codigo(), 0);

            if (cliente.getCedula().length() == 10) {
                f.setTipoIdentificacionComprador(Variables.FE_TIPO_IDENTIFICACION_CEDULA);
            } else if (cliente.getCedula().length() == 13) {
                f.setTipoIdentificacionComprador(Variables.FE_TIPO_IDENTIFICACION_RUC);
            }
            // f.setGuiaRemision("001-001-00000002");
            f.setRazonSocialComprador(cliente.getNombre());
            f.setIdentificacionComprador(cliente.getCedula());
            f.setDireccionComprador(cliente.getDireccion());
            Double tot1=Double.parseDouble(fac.getSubtotaI_con_iva()) ;
            Double tot2 =Double.parseDouble(fac.getSubtotal_sin_iva());
            Double total=tot1+tot2;
            String stirngtot=String.format("%.2f", total).replace(",", ".");
            f.setTotalSinImpuestos(Double.parseDouble(stirngtot));
            f.setTotalDescuento(Double.parseDouble(fac.getDescuento()));

//// totatal con impuesto ya esta en xml     
            /////
            TotalImpuesto totimp = new TotalImpuesto();
            totimp.setBaseImponible(Double.parseDouble(fac.getSubtotaI_con_iva()));
            totimp.setCodigo(2);
            totimp.setCodigoPorcentaje(2);
            totimp.setValor(Double.parseDouble(fac.getIva_valor()));
            f.setTotalImpuestos(totimp);
///////////////////iva cero
            TotalImpuesto totimpiva0 = new TotalImpuesto();
            totimpiva0.setBaseImponible(Double.parseDouble(fac.getSubtotal_sin_iva()));
            totimpiva0.setCodigo(2);
            totimpiva0.setCodigoPorcentaje(0);
            totimpiva0.setValor(Double.parseDouble("0.0"));
            f.setTotalImpuestos(totimpiva0);

/////////////
            f.setImporteTotal(Double.parseDouble(fac.getTotal()));
            System.out.println("Controlador.Usuarios.FacturasDao.creaxmlFacturaElectronica()ccccxcxc:" + fac.getTotal());
            //DetalleFactura df = new DetalleFactura();
            List<DetalleFactura> lista = new ArrayList<DetalleFactura>();
            DetalleFacturaDao dfDao = new DetalleFacturaDao();
            lista = dfDao.buscarConIDFact(fac.getCodigo());
            for (DetalleFactura df : lista) {

                Detalle d = new Detalle();

                d.setCodigoPrincipal(String.valueOf(df.getProductos_codigo()));
                d.setCodigoSecundario(String.valueOf(df.getProductos_codigo()));
                d.setDescripcion(df.getDetalle());
                d.setCantidad(Double.parseDouble(df.getCantidad()));
                d.setPrecioUnitario(Double.parseDouble(df.getValorUnitario()));
                d.setDescuento(Double.parseDouble(df.getDescuento()));
                d.setPrecioTotalSinImpuesto(Double.parseDouble(df.getValorTotal()));
                //if(df.getIva().ev)
                Impuesto i = new Impuesto();
                Vector<Impuesto> ivec = new Vector<Impuesto>();
                if (df.getTineIva().equalsIgnoreCase("si")) {
                    i.setCodigo(2);
                    i.setCodigoPorcentaje(2);
                    i.setTarifa(Double.parseDouble(Principal.iva));
                    //Double bi = Double.parseDouble(df.getValorTotal()) - Double.parseDouble(df.getIva());
                    i.setBaseImponible(Double.parseDouble(df.getValorTotal()));
                    i.setValor(Double.parseDouble(df.getIva()));

                }
                if (df.getTineIva().equalsIgnoreCase("no")) {
                    i.setCodigo(2);
                    i.setCodigoPorcentaje(0);
                    i.setTarifa(0.0);
                    //Double bi = Double.parseDouble(df.getValorTotal()) - Double.parseDouble(df.getIva());
                    i.setBaseImponible(Double.parseDouble(df.getValorTotal()));
                    i.setValor(0.0);

                }
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
//                if (mail.getValor().contains("@")) {
//                    f.setInfAdicional(mail);
//                }

            f.setInfAdicional(infadd3);
            f.setInfAdicional(infadd2);

            f.setInfAdicional(infadd1);
            f.setInfAdicional(infadd);
            String s = f.getXML2plano();

            String s2 = xmltoStringFormat(s);
            facxx = s2;
            System.out.println("XMLLLL: " + facxx);
//////            WSElectro_Service Ws = new WSElectro_Service();
//////            Response r = new Response();
//////            r = Ws.getWSElectroPort().receiptXMLIn(facxx, "admin", "admin", cliente.getMail());
//////            JOptionPane.showMessageDialog(null,"estado" +r.getResponse());
//////            
//////            if (r.getResponse().equalsIgnoreCase("0")) {
//////                this.UpdateEstadoAutorizado(fac.getCodigo(), 1, "");
//////                System.out.println("Controlador.Usuarios.FacturasDao.creaxmlFacturaElectronica()xxxs: recibida x ws RESPUESTA WS>>: " + r.getResponse());
//////            } else {
//////                System.out.println("Controlador.Usuarios.FacturasDao.creaxmlFacturaElectronica()xxxs: ERROR RESPUESTA WS>>: " + r.getResponse());
//////            }
            //     System.out.println("xmls" + s);
            //JOptionPane.showMessageDialog(null,Config.GENERADOS_DIR);

////                Config.GENERADOS_DIR = Config.GENERADOS_DIR + "\\";
////                Config.FIRMADOS_DIR = Config.FIRMADOS_DIR + "\\";
////                Config.SUBIDOS_DIR = Config.SUBIDOS_DIR + "\\";
////                Config.AUTORIZADOS_DIR = Config.AUTORIZADOS_DIR + "\\";
////                Config.NO_AUTORIZADOS_DIR = Config.NO_AUTORIZADOS_DIR + "\\";
////
////                ArchivoUtil.stringToFile(Config.GENERADOS_DIR + fac.getCalveAcceso() + ".xml", s);
////                File xml_file = new File(Config.GENERADOS_DIR + fac.getCalveAcceso() + ".xml");
////                byte[] archivoBytes = null;
////                try {
////
////                    archivoBytes = ArchivoUtil.convertirArchivoAByteArray(xml_file);
////                } catch (IOException ex) {
////                    Logger.getLogger(FacturasDao.class.getName()).log(Level.SEVERE, null, ex);
////                }
////                String clave = fac.getCalveAcceso();
        } catch (Exception e) {
            System.err.println("erroro : " + e);
        }

        //a.sendDoc(claveAcceso,"homer_loading@hotmail.com"," Jimmy carri");
        //      a.download(claveAcceso, ext);
        return facxx;
    }

    public static String xmltoStringFormat(String xml) throws TransformerConfigurationException, ParserConfigurationException, SAXException, IOException, TransformerException {
        String r = "";
        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer t = tf.newTransformer();
        StringWriter sw = new StringWriter();
        DocumentBuilder db = DocumentBuilderFactory.newInstance().newDocumentBuilder();
        InputSource is = new InputSource();
        is.setCharacterStream(new StringReader(xml));

        Document doc = db.parse(is);
        t.transform(new DOMSource(doc), new StreamResult(sw));
        r = sw.toString();
        return r;
    }

    public String getNextumeroDeProformas() {

        ResultSet rs;
        String maxnumeroOrden = "1";
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("SELECT max(secuencia) as numero from facturas WHERE tipo_documento='PROFORMA'");
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
            System.out.println("Controlador.CUsuarios.BuscarConCedula()sss" + ex);
        } finally {
            this.cerrar();
        }

        return maxnumeroOrden;
    }

    public String getNextumeroDeTicket() {

        ResultSet rs;
        String maxnumeroOrden = "1";
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("SELECT max(secuencia) as numero from  FACTURAS WHERE tipo_documento='TICKET'");
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
            System.out.println("Controlador.CUsuarios.BuscarCogtyrtynCedula()sss" + ex);
        } finally {
            this.cerrar();
        }

        return maxnumeroOrden;
    }

    public ArrayList<String> getNextumeroDeFacturabyEquipo(Integer idEcquipo) {
        ArrayList<String> numfactura = new ArrayList<String>();

        ResultSet rs1;
        String maxnumeroOrden1 = "001";
        String maxnumeroOrden2 = "001";
        String maxnumeroOrden3 = "1";
        try {
            this.conectar();
            PreparedStatement st1;
            //SELECT establecimiento , ptoEmision, MAX(secfactura) FROM facturas WHERE   equipos_Codigo=20
            //SELECT establecimiento , ptoEmision, secfactura FROM facturas WHERE  codigo  = ( SELECT MAX(Codigo)  FROM facturas  ) AND equipos_Codigo=
            st1 = this.getCnx().prepareCall("SELECT establecimiento , ptoEmision, MAX(secfactura) as secfactura FROM facturas WHERE tipo_documento='factura' and equipos_Codigo=" + idEcquipo);
            rs1 = st1.executeQuery();

            //this.lista= new ArrayList();
            while (rs1.next()) {
                if (rs1.getString("establecimiento").equals("") || rs1.getString("ptoEmision").equals("")) {
                    numfactura.add("001");
                    numfactura.add("001");
                    numfactura.add("1");

                } else {
                    maxnumeroOrden1 = rs1.getString("establecimiento");
                    maxnumeroOrden2 = rs1.getString("ptoEmision");
                    maxnumeroOrden3 = rs1.getString("secfactura");
                    numfactura.add(maxnumeroOrden1);
                    numfactura.add(maxnumeroOrden2);
                    numfactura.add(maxnumeroOrden3);
                }

            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarioqweqs.BuscarConCedula()sss" + ex);
        } finally {
            this.cerrar();
        }
        return numfactura;
    }
public ArrayList<String> getNextumeroDeNOtaCreditobyEquipo(Integer idEcquipo) {
        ArrayList<String> numfactura = new ArrayList<String>();

        ResultSet rs1;
        String maxnumeroOrden1 = "001";
        String maxnumeroOrden2 = "001";
        String maxnumeroOrden3 = "1";
        try {
            this.conectar();
            PreparedStatement st1;
            //SELECT establecimiento , ptoEmision, MAX(secfactura) FROM facturas WHERE   equipos_Codigo=20
            //SELECT establecimiento , ptoEmision, secfactura FROM facturas WHERE  codigo  = ( SELECT MAX(Codigo)  FROM facturas  ) AND equipos_Codigo=
            st1 = this.getCnx().prepareCall("SELECT establecimiento , ptoEmision, MAX(secfactura) as secfactura FROM facturas WHERE tipo_documento='NC' and equipos_Codigo=" + idEcquipo);
            rs1 = st1.executeQuery();

            //this.lista= new ArrayList();
            if(rs1.first()){
            while (rs1.next()) {
                if (rs1.getString("establecimiento").equals("") || rs1.getString("ptoEmision").equals("")) {
                    numfactura.add("001");
                    numfactura.add("001");
                    numfactura.add("1");

                } else {
                    maxnumeroOrden1 = rs1.getString("establecimiento");
                    maxnumeroOrden2 = rs1.getString("ptoEmision");
                    maxnumeroOrden3 = rs1.getString("secfactura");
                    numfactura.add(maxnumeroOrden1);
                    numfactura.add(maxnumeroOrden2);
                    numfactura.add(maxnumeroOrden3);
                }
                Deb.consola("secuancia notascredito: "+maxnumeroOrden1+"-"+maxnumeroOrden2+"-"+maxnumeroOrden1+" :----dsdfsfsdf");
            }
            }else{
                    numfactura.add(maxnumeroOrden1);
                    numfactura.add(maxnumeroOrden2);
                    numfactura.add(maxnumeroOrden3);
            }
            
           
        } catch (Exception ex) {
            System.out.println("Controlador.CUsuariertwos.BuscarConCedula()sss" + ex);
        } finally {
            this.cerrar();
        }
        return numfactura;
    }
    public String getNextumeroDeFacturaByEstablecimientoyPuntoEmision(String sec1, String sec2, Integer idEcquipo) {

        ResultSet rs;
        String maxnumeroOrden = "1";
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("SELECT MAX(secfactura) AS numero FROM facturas WHERE tipo_documento='factura' and establecimiento=" + sec1 + " AND ptoEmision=" + sec2 + " AND equipos_Codigo=" + idEcquipo);
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
            System.out.println("Controlador.CUsuariotyrtys.BuscarConCedula()sss" + ex);
        } finally {
            this.cerrar();
        }

        return maxnumeroOrden;
    }

    public String getEstablecimeinto(String sec1, String sec2, Integer idEcquipo) {

        ResultSet rs;
        String maxnumeroOrden = "1";
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("SELECT MAX(secfactura) AS numero FROM facturas WHERE tipo_documento='factura' establecimiento=" + sec1 + " AND ptoEmision=" + sec2 + " AND equipos_Codigo=" + idEcquipo);
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
            System.out.println("Controlador.CUsuarios.ertetBuscarConCedula()sss" + ex);
        } finally {
            this.cerrar();
        }

        return maxnumeroOrden;
    }

    public String UpdateEstadoAutorizado(Integer id, Integer estado, String MenSRI) {

        ResultSet rs;
        String maxnumeroOrden = "1";
        try {
            this.conectar();
            PreparedStatement st = null;
            if (estado.equals(1)) {
                st = this.getCnx().prepareCall("UPDATE facturas SET autorizado=" + estado + " WHERE codigo = " + id);
            }
            if (estado.equals(2)) {
                st = this.getCnx().prepareCall("UPDATE facturas SET DescripcionElectronica='" + MenSRI + "' , autorizado=" + estado + " WHERE codigo = " + id);
                //            st = this.getCnx().prepareCall("UPDATE facturas SET hora='"+fechaAut+"' , autorizado=" + estado + " WHERE codigo = " + id);
            }

            st.executeUpdate();

            //this.lista= new ArrayList();
        } catch (Exception ex) {
            System.out.println("Contrdfsfolador.CUsuarios.BuscarConCedula()sss" + ex);
        } finally {
            this.cerrar();
        }

        return maxnumeroOrden;
    }

    public boolean UpdateAnuladoComprobantedeVenta(Integer id) {

        ResultSet rs;
        String maxnumeroOrden = "1";
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("UPDATE facturas SET anulada=1 WHERE codigo = " + id);
            st.executeUpdate();

            //this.lista= new ArrayList();
            return true;
        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConCsdfsdfedula()sss" + ex);
            return false;

        } finally {
            this.cerrar();
        }

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

    public DefaultListModel Buscar_productos_stock() {
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

    public String[] Buscar_registros(String value, String bodega) {
        String[] registros = new String[11];
        //    JOptionPane.showMessageDialog(null, "entroooooo");
        ResultSet rs;
        String tabla = "productos";
        try {
            this.conectar();
            PreparedStatement st;
            //st = this.getCnx().prepareCall("select Productos.*, modelos.Modelo from productos inner join modelos on modelos.Codigo=productos.Modelos_Codigo where producto  like '%" + value + "%' order BY productos.producto LIMIT 0, 50");
            st = this.getCnx().prepareCall("select * from productos where producto  like '%" + value + "%' order BY producto LIMIT 0, 50");
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
                registros[7] = rs.getString("pvp");
                registros[8] = "0";
                registros[9] = rs.getString("b" + bodega);
                registros[10] = rs.getString("IMPUESTO");
                //  JOptionPane.showMessageDialog(null, registros[3] + "----" + registros[10]);
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "lllxxxcxcxxxhhhh");
        } finally {
            this.cerrar();
        }

        return registros;
    }

    public Integer guardar(Facturas tarea) {
        int codigoThisFactura = 0;
        try {
            this.conectar();
            //this.conectar().setAutoCommit(false);
            PreparedStatement consulta;
            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (fecha, iva, subtotaI_con_iva, subtotal_sin_iva,"
                    + " total, utilidad, tipo_documento, "
                    + "descuento,Clientes_codigo,Usuarios_Codigo, Equipo, secuencia,fechain,iva_valor,calveAcceso,establecimiento,ptoEmision,secfactura,formaPago,efectivo,cambio) VALUES(?,?,?,?, ?, ?,?,?,?, ?, ?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
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
            System.out.println("Controlador.CUsuarios.guardar()" + consulta);
            consulta.executeUpdate();
            ResultSet rs = consulta.getGeneratedKeys();
            if (rs.next()) {
                codigoThisFactura = rs.getInt(1);
                System.out.println("Controlador.Usuarios.FacturasDao.guardar()>: " + codigoThisFactura);
            }
            //  this.con.commit();
            //  this.con.rollback();
        } catch (SQLException ex) {
            //msg.setProgressBar_mensajae(ex.toString());
            System.out.println("Controlador.CUsuarios.guardar()" + ex);
        } finally {

        }
        return codigoThisFactura;
    }

    public PreparedStatement guardarReturnPreparedStatemen(Facturas tarea) {
        int codigoThisFactura = 0;
        PreparedStatement consulta = null;
        try {
            this.conectar();

            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (fecha, iva, subtotaI_con_iva, subtotal_sin_iva,"
                    + " total, utilidad, tipo_documento, "
                    + "descuento,Clientes_codigo,Usuarios_Codigo, Equipo, secuencia,fechain,iva_valor,calveAcceso,establecimiento,ptoEmision,secfactura,formaPago,efectivo,cambio) VALUES(?,?,?,?, ?, ?,?,?,?, ?, ?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
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
            System.out.println("Controlador.CUsuarios.guardar()" + consulta);
////            consulta.executeUpdate();
////            ResultSet rs = consulta.getGeneratedKeys();
////            if (rs.next()) {
////                codigoThisFactura = rs.getInt(1);
////                System.out.println("Controlador.Usuarios.FacturasDao.guardar()>: " + codigoThisFactura);
////            }

        } catch (SQLException ex) {
            //msg.setProgressBar_mensajae(ex.toString());
            System.out.println("Controlador.CUsuarios.guardar()" + ex);
        } finally {

        }
        return consulta;
    }

    public Facturas buscarConID(Integer id) {
        ResultSet rs;
        Facturas u = new Facturas();
        try {

            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall("select * from facturas where codigo =" + id);
            rs = st.executeQuery();
            while (rs.next()) {
                Facturas per = new Facturas();
                per.setCodigo(rs.getInt("Codigo"));
                per.setAnulada(rs.getBoolean("anulada"));
                per.setClientes_codigo(rs.getInt("Clientes_codigo"));
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
                u = per;
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }

    public ArrayList<Facturas> buscarFacturasNoAutorizadas() {
        ResultSet rs;
        Facturas u = new Facturas();
        try {

            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall("select * from facturas where autorizado =0 and tipo_documento='factura'");
            rs = st.executeQuery();
            while (rs.next()) {
                Facturas per = new Facturas();
                per.setCodigo(rs.getInt("Codigo"));
                per.setAnulada(rs.getBoolean("anulada"));
                per.setClientes_codigo(rs.getInt("Clientes_codigo"));
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
                u = per;
                listaFacNoAutorizadas.add(u);
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return listaFacNoAutorizadas;
    }

    public ArrayList<Facturas> ListaFacturasEnviadasalWS_SinEstadoAutorizado() {
        ResultSet rs;
        Facturas u = new Facturas();
        try {

            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall("select * from facturas where autorizado =1 and tipo_documento='factura'");
            rs = st.executeQuery();
            while (rs.next()) {
                Facturas per = new Facturas();
                per.setCodigo(rs.getInt("Codigo"));
                per.setAnulada(rs.getBoolean("anulada"));
                per.setClientes_codigo(rs.getInt("Clientes_codigo"));
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
                u = per;
                listaFacEnviadaslawssinestadoAutorizadas.add(u);
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return listaFacEnviadaslawssinestadoAutorizadas;
    }

    public DefaultTableModel listarFacturasTbModel(String fecha1, String fecha2, String tipo) {
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
        String sql = "SELECT facturas.* ,usuarios.Nombres as usuario, clientes.Nombres as cliente, clientes.Cedula as ruc from facturas inner join clientes on clientes.Codigo=facturas.Clientes_codigo inner JOIN usuarios on usuarios.codigo= facturas.Usuarios_Codigo where facturas.tipo_documento='" + tipo + "' and hora BETWEEN '" + fecha1 + "' and '" + fecha2 + "' order BY facturas.secuencia ";
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

    public DefaultTableModel listarFacturasElectronicasTbModel(String fecha1, String fecha2, String tipo) {
        DefaultTableModel modelo = null;

        String[] titulos
                = {"Codigo", "Fecha", "Numero de Factura", "RUC/CI",
                    "Num. Autorizacion", "Estado", "Mensaje SRI"};
        String[] registros = new String[7];
        modelo = new DefaultTableModel(null, titulos) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // make read only fields except column 0,13,14
                //  return column == 0 || column == 13 || column == 14;
                return false;
            }
        };

        ResultSet rs;
        String sql = "SELECT facturas.* ,usuarios.Nombres as usuario, clientes.Nombres as cliente, clientes.Cedula as ruc from facturas inner join clientes on clientes.Codigo=facturas.Clientes_codigo inner JOIN usuarios on usuarios.codigo= facturas.Usuarios_Codigo where facturas.tipo_documento='" + tipo + "' and hora BETWEEN '" + fecha1 + "' and '" + fecha2 + "' order BY facturas.secuencia ";
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
                registros[3] = rs.getString("ruc");
                registros[4] = rs.getString("calveAcceso");
                if (rs.getString("autorizado").equals("0")) {
                    registros[5] = "ENVIANDO AL SRI..";
                } else if (rs.getString("autorizado").equals("1")) {
                    registros[5] = "ESPERANDO RESPUESTA";
                } else if (rs.getString("autorizado").equals("2")) {
                    registros[5] = "AUTORIZADA";
                }
                registros[6] = rs.getString("DescripcionElectronica");
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

    public void eliminar(Facturas obj) throws Exception {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("DELETE from  facturas WHERE Codigo = ? ");
            st.setInt(1, obj.getCodigo());
            st.executeUpdate();
        } catch (SQLException e) {
            msg.setProgressBar_mensajae("Error..!! " + e);
        } finally {
            this.cerrar();
        }

    }

    public ArrayList<Facturas> ListaVentasportipoyFacha(String Fecha1, String Fecha2) {
        ResultSet rs;

        ArrayList<Facturas> lista = new ArrayList<>();
        try {

            this.conectar();
            PreparedStatement st;
            String sql = "SELECT *  FROM  facturas f INNER JOIN CLIENTES c ON( f.Clientes_codigo=c.codigo) WHERE  f.hora BETWEEN '" + Fecha1 + "'  AND '" + Fecha2 + "'";
            System.out.println("Controlador.Usuarios.FacturasDao.ListaVentasportipoyFacha(): " + sql);
            st = this.getCnx().prepareCall(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Facturas per = new Facturas();
                per.setCodigo(rs.getInt("Codigo"));
                per.setAnulada(rs.getBoolean("anulada"));
                per.setClientes_codigo(rs.getInt("Clientes_codigo"));
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
                lista.add(per);
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }
}
