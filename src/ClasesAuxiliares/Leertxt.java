/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares;

import ClasesAuxiliares.debug.Deb;
import ClasesAuxiliares.http.ConsultaCedulas;
import Controlador.Usuarios.ClientesDao;
import Controlador.Usuarios.ComprasDao;
import Controlador.Usuarios.DetalleComprasDao;
import Controlador.Usuarios.FacturasDao;
import Controlador.Usuarios.ProductosDao;
import Controlador.Usuarios.ProveedoresDao;
import Modelo.Clientes;
import Modelo.Compras;
import Modelo.ComprobantesRecibidosSri;
import Modelo.DetalleCompra;
import Modelo.Facturas;
import Modelo.Productos;
import Modelo.Proveedores;
import Vista.Principal;
import Vista.Usuarios.Crear_Clientes;
import Vista.Usuarios.DesgargarDocumentosElectronicosSRI;
import Vlidaciones.ProgressBar;
import Vlidaciones.ValidaNUmeros;
import ecx.unomas.elements.ArchivoUtil;
import ecx.unomas.factura.Detalle;
import ecx.unomas.factura.Factura;
import ecx.unomas.factura.InfoAdicional;
import ecx.unomas.factura.TotalImpuesto;
import ecx.unomas.notacredito.NotaCredito;
import ecx.unomas.notacredito.TotalConImpuestos;
import ecx.unomas.notadebito.NotaDebito;
import ecx.unomas.retencion.Impuesto;
import ecx.unomas.retencion.Retencion;
import ecx.unomas.service.Comprobante;
import ecx.unomas.service.Config;
import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import login.login;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author USUARIO
 */
public class Leertxt extends Thread {
    
    public Leertxt() {
        Config.AUTORIZADOS_DIR = Config.RECIBIDOS_DIR + "PDF" + Config.SEPARADOR;
    }
    private static XSSFCellStyle cellstyle;
    public static ArrayList<Factura> listaFacturasGenaradas = new ArrayList<Factura>();
    public static Factura facturaElectronica = new Factura();
    public static ArrayList<NotaCredito> listaNotaCreditoGenaradas = new ArrayList<NotaCredito>();
    public static ArrayList<NotaDebito> listaNotaDebitoGenaradas = new ArrayList<NotaDebito>();
    public static ArrayList<Retencion> listaRetencionesGenaradas = new ArrayList<Retencion>();
    public static ArrayList<Clientes> listaClientes = new ArrayList<Clientes>();
    public static ArrayList<Facturas> listaFacturas = new ArrayList<>();
    
    public static ArrayList<ComprobantesRecibidosSri> listaComprobantesRecibidos = new ArrayList<>();
    //public static DefaultTableModel modelo = null;
    public String rutaarchivo = "";
    public boolean continuar = false;
    public Integer pasos = -1;
    
    public static void main(String[] arg) {
        getNumerComprobanteseneltxt("c:\\dato.txt");
//////////        File archivo = null;
//////////        FileReader fr = null;
//////////        BufferedReader br = null;
//////////
//////////        try {
//////////            // Apertura del fichero y creacion de BufferedReader para poder
//////////            // hacer una lectura comoda (disponer del metodo readLine()).
//////////            archivo = new File("C:\\dato.txt");
//////////            fr = new FileReader(archivo);
//////////            br = new BufferedReader(fr);
//////////
//////////            // Lectura del fichero
//////////            String linea;
//////////            Integer cont = 0;
//////////            Comprobante c = new Comprobante();
//////////
//////////            byte[] archivoBytes = null;
//////////            while ((linea = br.readLine()) != null) {
//////////                //   Deb.consola(linea);
//////////                String[] a = linea.split("\t");
//////////                int soloclaveAceso = 0;
//////////
//////////                for (int i = 0; i < a.length; i++) {
//////////                    String ruta = Config.GENERADOS_DIR + a[i] + ".xml";
//////////                    //Deb.consola(a[i]);
//////////                    // Deb.consola(i+" - "+a[i]);
//////////
//////////                    if (a[i].length() == 49 && ValidaNUmeros.isOnlyNumbers(a[i])) {
//////////
//////////                        if (soloclaveAceso == 0) {
//////////                            soloclaveAceso = 1;
//////////                            Deb.consola("Clave Acceso: " + cont + " - " + a[i]);
//////////                            //if (a[i].equals( "2102202001171632036900120010220000301530003017612")) {
//////////                            if (1 == 1) {
//////////                                String xmlstring = c.getxmlFromSriWS2(a[i]);
//////////                                ArchivoUtil.stringToFile(Config.FIRMADOS_DIR + a[i] + ".xml", xmlstring);
//////////                                File xml_file = new File(ruta);
//////////                                archivoBytes = ArchivoUtil.convertirArchivoAByteArray(xml_file);
//////////                                c.xmlToPDF(a[i], archivoBytes);
//////////                            }
//////////                            cont++;
//////////                        }
//////////
//////////                    }
//////////                }
//////////            }
//////////
//////////        } catch (Exception e) {
//////////            e.printStackTrace();
//////////        } finally {
//////////            // En el finally cerramos el fichero, para asegurarnos
//////////            // que se cierra tanto si todo va bien como si salta 
//////////            // una excepcion.
//////////            try {
//////////                if (null != fr) {
//////////                    fr.close();
//////////                }
//////////            } catch (Exception e2) {
//////////                e2.printStackTrace();
//////////            }
//////////        }
    }
    
    public static void descargarXMLformSRItoFileXML(String rutaarchivo) {
        File archivo = null;
        FileReader fr = null;
        BufferedReader br = null;
        Integer docProcesados = 0;
        try {
            // Apertura del fichero y creacion de BufferedReader para poder
            // hacer una lectura comoda (disponer del metodo readLine()).
            archivo = new File(rutaarchivo);
            fr = new FileReader(archivo);
            br = new BufferedReader(fr);

            // Lectura del fichero
            String linea;
            Integer cont = 0;
            Comprobante c = new Comprobante();
            
            byte[] archivoBytes = null;
            while ((linea = br.readLine()) != null) {
                //   Deb.consola(linea);
                String[] a = linea.split("\t");
                int soloclaveAceso = 0;
                
                for (int i = 0; i < a.length; i++) {
                    String ruta = Config.GENERADOS_DIR + a[i] + ".xml";
                    //Deb.consola(a[i]);
                    // Deb.consola(i+" - "+a[i]);

                    if (a[i].length() == 49 && ValidaNUmeros.isOnlyNumbers(a[i])) {
                        
                        if (soloclaveAceso == 0) {
                            soloclaveAceso = 1;
                            Deb.consola("Clave Acceso: " + cont + " - " + a[i]);
                            //if (a[i].equals( "2102202001171632036900120010220000301530003017612")) {
                            if (true) {                
                                docProcesados++;
                                String xmlstring = c.getxmlFromSriWS2(a[i]);
                                Deb.consola("ClasesAuxiliares.Leertxt.descargarXMLformSRItoFileXML()xxxxxxxaaaaaaaaaaaaaaaaaaaaaaaaaaa: " + Config.FIRMADOS_DIR);
                                ArchivoUtil.stringToFile(Config.FIRMADOS_DIR + a[i] + ".xml", xmlstring);
//                                File xml_file = new File(Config.FIRMADOS_DIR + a[i] + ".xml");                               
//                                archivoBytes = ArchivoUtil.convertirArchivoAByteArray(xml_file);                                
//                                c.xmlToPDF(a[i], archivoBytes);
                                DesgargarDocumentosElectronicosSRI.txt_numDoc.setText(ruta);
                            }
                            cont++;
                        }
                        
                    }
                }
            }
            //  pasos = -1;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // En el finally cerramos el fichero, para asegurarnos
            // que se cierra tanto si todo va bien como si salta 
            // una excepcion.
            try {
                if (null != fr) {
                    fr.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }
    
    public static void registrarcomprasdesdesri() {
        Compras u = new Compras();
        
        DetalleCompra dc = new DetalleCompra();
        
        Productos p = new Productos();
        
        Proveedores provee = new Proveedores();
        
        Integer codProvedor = null;
        Integer codCompra = null;;
        Integer codProducto = null;;
        
        for (Factura f : listaFacturasGenaradas) {
            try {
                
                u.setCalveAcceso(f.getClaveAcceso());
                u.setEquipo(login.CodigoDelEquipo.toString());
                Date date1 = new SimpleDateFormat("dd/MM/yyyy").parse(f.getFechaEmision());
                u.setFecha(date1);
                u.setEstablecimiento(f.getEstab());
                u.setPtoEmision(f.getPtoEmi());
                u.setSecfactura(f.getSecuencia());
                //provee.setCedula("xxx");
                ProveedoresDao proveeDado = new ProveedoresDao();
                provee = proveeDado.buscarConCedula(f.getRUC());
                if (provee.getCedula() != null) {
                    codProvedor = provee.getCodigo();
                    u.setProveedores_codigo(codProvedor);
                } else {
                    provee.setCedula(f.getRUC());
                    provee.setNombre(f.getRazonSocial());
                    provee.setObservaciones("creacion automaticas");
                    provee.setCredito(1);
                    ProveedoresDao proveeDadox = new ProveedoresDao();
                    codProvedor = proveeDadox.guardar(provee);
                }
                u.setProveedores_codigo(codProvedor);
                u.setUsuarios_Codigo(login.CodigoUsuario);
                u.setIva_valor(String.valueOf(f.getIVA12()));
                u.setSubtotaI_con_iva(String.valueOf(f.getSubtotal12()));
                u.setSubtotal_sin_iva(String.valueOf(f.getSubtotal0()));
                u.setTotal(String.valueOf(f.getImporteTotal()));
                u.setEfectivo(0.0);
                u.setCambio(0.0);
                u.setIva(Principal.iva);
                ComprasDao uDao = new ComprasDao();
                codCompra = uDao.guardar(u);

                ////////Detalle COmpras
                for (Detalle detalle : f.getDetalles()) {
                    dc.setCantidad(detalle.getCantidad().toString());
                    dc.setCompra_Codigo(codCompra);
                    dc.setDetalle(detalle.getDescripcion());
                    dc.setValorUnitario(detalle.getPrecioUnitario().toString());
                    dc.setValorTotal(detalle.getPrecioTotalSinImpuesto().toString());
                    //p.setProducto("qweasd");
                    ProductosDao pDao = new ProductosDao();
                    p = pDao.buscarPorNombre(detalle.getDescripcion());
                    if (p.getProducto() != null) {
                        codProducto = p.getCodigo();
                        dc.setProductos_codigo(p.getCodigo());
                        
                        p.setBase(detalle.getPrecioUnitario());
                        p.setCosto(String.valueOf(String.format("%.3f", detalle.getPrecioUnitario() * 1.12)).replace(",", "."));
                        p.setPvp(String.format("%.3f", detalle.getPrecioUnitario() * 1.12 * 1.28).replace(",", "."));
                        for (ecx.unomas.factura.Impuesto im : detalle.getImpuestos()) {
                            p.setIva12(im.getValor());
                            p.setIva0(im.getValor());
                            p.setImpuesto(im.getTarifa().toString());
                        }
                        ProductosDao pDaoxx = new ProductosDao();
                        pDaoxx.modificarSinImagen(p);
                    } else {
                        p.setProducto(detalle.getDescripcion());
                        p.setProductoOServicio(1);
                        p.setPvp(String.format("%.3f", detalle.getPrecioUnitario() * 1.12 * 1.28).replace(",", "."));
                        p.setBase(detalle.getPrecioUnitario());
                        for (ecx.unomas.factura.Impuesto im : detalle.getImpuestos()) {
                            p.setIva12(im.getValor());
                            p.setIva0(im.getValor());
                            p.setImpuesto(im.getTarifa().toString());
                        }
                        p.setCosto(String.valueOf(String.format("%.3f", detalle.getPrecioUnitario() * 1.12)).replace(",", "."));
                        p.setP1(detalle.getPrecioUnitario() * 1.12);
                        p.setP2(detalle.getPrecioUnitario() * 1.18);
                        p.setP3(detalle.getPrecioUnitario() * 1.2);
                        p.setModelo_codigo(1);
                        p.setModelos_marcas_codigo(1);
                        ProductosDao pDaox = new ProductosDao();
                        codProducto = pDaox.guardar(p);
                        
                    }
                    dc.setProductos_codigo(codProducto);
                    DetalleComprasDao dcDao = new DetalleComprasDao();
                    dcDao.guardar(dc);
                }
                
            } catch (ParseException ex) {
                Deb.consola("fffffffffffff: " + ex);
            }
        }

        // u.
//        DetalleCompra df = new DetalleCompra();
//        Productos pr = new Productos();
//        ProductosDao productoDao = new ProductosDao();
//        ProductosDao prodconsultaDao = new ProductosDao();
//        //buscarPorNombre
//        pr = prodconsultaDao.buscarConID(codigoProducto);
//        productoDao.modificarPreciosAlRegistrarCompra(pr);
    }
    
    public static void registrarcompradesdesriconCLavedeAcceso(Factura f) {
        Compras u = new Compras();
        DetalleCompra dc = new DetalleCompra();
        Productos p = new Productos();
        Proveedores provee = new Proveedores();
        Integer codProvedor = null;
        Integer codCompra = null;
        Integer codProducto = null;
        
        try {
            
            u.setCalveAcceso(f.getClaveAcceso());
            u.setEquipo(login.CodigoDelEquipo.toString());
            Date date1 = new SimpleDateFormat("dd/MM/yyyy").parse(f.getFechaEmision());
            u.setFecha(date1);
            u.setEstablecimiento(f.getEstab());
            u.setPtoEmision(f.getPtoEmi());
            u.setSecfactura(f.getSecuencia());
            //provee.setCedula("xxx");
            ProveedoresDao proveeDado = new ProveedoresDao();
            provee = proveeDado.buscarConCedula(f.getRUC());
            if (provee.getCedula() != null) {
                codProvedor = provee.getCodigo();
                u.setProveedores_codigo(codProvedor);
            } else {
                provee.setCedula(f.getRUC());
                provee.setNombre(f.getRazonSocial());
                provee.setObservaciones("creacion automaticas");
                provee.setCredito(1);
                ProveedoresDao proveeDadox = new ProveedoresDao();
                codProvedor = proveeDadox.guardar(provee);
            }
            u.setProveedores_codigo(codProvedor);
            u.setUsuarios_Codigo(login.CodigoUsuario);
            u.setIva_valor(String.valueOf(f.getIVA12()));
            u.setSubtotaI_con_iva(String.valueOf(f.getSubtotal12()));
            u.setSubtotal_sin_iva(String.valueOf(f.getSubtotal0()));
            u.setTotal(String.valueOf(f.getImporteTotal()));
            u.setEfectivo(0.0);
            u.setCambio(0.0);
            u.setIva(Principal.iva);
            ComprasDao uDao = new ComprasDao();
            codCompra = uDao.guardar(u);

            ////////Detalle COmpras
            for (Detalle detalle : f.getDetalles()) {
                dc.setCantidad(detalle.getCantidad().toString());
                dc.setCompra_Codigo(codCompra);
                dc.setDetalle(detalle.getDescripcion());
                dc.setValorUnitario(detalle.getPrecioUnitario().toString());
                dc.setValorTotal(detalle.getPrecioTotalSinImpuesto().toString());
                //p.setProducto("qweasd");
                ProductosDao pDao = new ProductosDao();
                p = pDao.buscarPorNombre(detalle.getDescripcion());
                if (p.getProducto() != null) {
                    codProducto = p.getCodigo();
                    dc.setProductos_codigo(p.getCodigo());
                    
                    p.setBase(detalle.getPrecioUnitario());
                    p.setCosto(String.valueOf(String.format("%.3f", detalle.getPrecioUnitario() * 1.12)).replace(",", "."));
                    p.setPvp(String.format("%.3f", detalle.getPrecioUnitario() * 1.12 * 1.28).replace(",", "."));
                    for (ecx.unomas.factura.Impuesto im : detalle.getImpuestos()) {
                        p.setIva12(im.getValor());
                        p.setIva0(im.getValor());
                        p.setImpuesto(im.getTarifa().toString());
                    }
                    ProductosDao pDaoxx = new ProductosDao();
                    pDaoxx.modificarSinImagen(p);
                } else {
                    p.setProducto(detalle.getDescripcion());
                    p.setProductoOServicio(1);
                    p.setPvp(String.format("%.3f", detalle.getPrecioUnitario() * 1.12 * 1.28).replace(",", "."));
                    p.setBase(detalle.getPrecioUnitario());
                    for (ecx.unomas.factura.Impuesto im : detalle.getImpuestos()) {
                        p.setIva12(im.getValor());
                        p.setIva0(im.getValor());
                        p.setImpuesto(im.getTarifa().toString());
                    }
                    p.setCosto(String.valueOf(String.format("%.3f", detalle.getPrecioUnitario() * 1.12)).replace(",", "."));
                    p.setP1(detalle.getPrecioUnitario() * 1.12);
                    p.setP2(detalle.getPrecioUnitario() * 1.18);
                    p.setP3(detalle.getPrecioUnitario() * 1.2);
                    p.setModelo_codigo(1);
                    p.setModelos_marcas_codigo(1);
                    ProductosDao pDaox = new ProductosDao();
                    codProducto = pDaox.guardar(p);
                    
                }
                dc.setProductos_codigo(codProducto);
                DetalleComprasDao dcDao = new DetalleComprasDao();
                dcDao.guardar(dc);
            }
            
        } catch (ParseException ex) {
            Deb.consola("fffffffffffff: " + ex);
        }

        // u.
//        DetalleCompra df = new DetalleCompra();
//        Productos pr = new Productos();
//        ProductosDao productoDao = new ProductosDao();
//        ProductosDao prodconsultaDao = new ProductosDao();
//        //buscarPorNombre
//        pr = prodconsultaDao.buscarConID(codigoProducto);
//        productoDao.modificarPreciosAlRegistrarCompra(pr);
    }
    
    public static DefaultTableModel listaDetalleFacturasrecibidas() {
        
        String[] titulos
                = {"COMPROBANTE", "SERIE_COMPROBANTE", "RUC_EMISOR", "RAZON_SOCIAL_EMISOR",
                    "FECHA_EMISION", "FECHA_AUTORIZACION",
                    "TIPO_EMISION", "IDENTIFICACION_RECEPTOR", "CLAVE_ACCESO", "IMPORTE_TOTAL"};
        String[] registros = new String[10];
        DefaultTableModel modelo = new DefaultTableModel(null, titulos) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // make read only fields except column 0,13,14
                //  return column == 0 || column == 13 || column == 14;
                return false;
            }
        };
        try {

            //this.lista= new ArrayList();
            for (Factura rs : listaFacturasGenaradas) {
                
                registros[0] = rs.getRUC();
                registros[1] = rs.getSecuencia();
                registros[2] = rs.getRazonSocial();
                registros[3] = rs.getRUC();
                registros[4] = rs.getTotalSinImpuestos().toString();
                registros[5] = String.valueOf(rs.getSubtotal12());
                registros[6] = rs.getImporteTotal().toString();
                registros[7] = "";
                registros[8] = "";
                registros[9] = "";
                
                modelo.addRow(registros);
                for (Detalle de : rs.getDetalles()) {
                    registros[0] = "";
                    registros[1] = "";
                    registros[2] = "";
                    registros[3] = "";
                    registros[4] = de.getCantidad().toString();
                    registros[5] = de.getDescripcion();
                    registros[6] = de.getPrecioUnitario().toString();
                    registros[7] = de.getPrecioTotalSinImpuesto().toString();
                    registros[8] = "";
                    registros[9] = "";
                    modelo.addRow(registros);
                }
                
            }
            
        } catch (Exception ex) {
            ProgressBar.mostrarMensajeAzul(ex.toString());
        } finally {
            
        }
        
        return modelo;
    }
    
    public static void descargarXMLformSRItoFileXMLandPFDenUnSoloPasoconHilo(String ruta) {
        Thread t = new Thread() {
            public void run() {
                descargarXMLformSRItoFileXMLandPFDenUnSoloPaso(ruta);
            }
        ;
        
        };
t.start();
    }
    
    public void HiloTread(String mensaje) {
        Thread t = new Thread() {
            
            public void run() {
                
            }
        ;
        
        };
t.start();
    }
    
    public static boolean VerificaExistenciadeClavedeAccesoRegistrada(String clave) {
        if (clave.length() == 49) {
            if (ValidaNUmeros.isOnlyNumbers(clave) && (clave.length() == 49)) {
                ComprasDao cDao = new ComprasDao();
                if (cDao.buscarbyCLaveAcceso(clave) != null) {
                    return true;
                } else {
                    return false;
                }
            }
        } else {
            
            ProgressBar.mostrarMensajeAzul("clave de acceso mal fomada");
            return false;
            
        }
        return false;
        
    }
    
    public DefaultTableModel listarFacturasTbModel() {
        ArrayList<Clientes> lista = new ArrayList<>();
        ArrayList<Compras> listacompras = new ArrayList<>();
        String[] titulos
                = {"COMPROBANTE", "SERIE_COMPROBANTE", "RUC_EMISOR", "RAZON_SOCIAL_EMISOR",
                    "FECHA_EMISION", "FECHA_AUTORIZACION",
                    "TIPO_EMISION", "IDENTIFICACION_RECEPTOR", "CLAVE_ACCESO", "IMPORTE_TOTAL", "EXISTE PROV", "FAC REGISTRADA"};
        String[] registros = new String[12];
        DefaultTableModel modelo = new DefaultTableModel(null, titulos) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // make read only fields except column 0,13,14
                //  return column == 0 || column == 13 || column == 14;
                return false;
            }
        };
        try {
            ClientesDao cdao = new ClientesDao();
            lista = cdao.buscarAllCLientes(1);
            
            ComprasDao fdao = new ComprasDao();
            listacompras = fdao.listadecompras();
            //this.lista= new ArrayList();
            for (ComprobantesRecibidosSri rs : listaComprobantesRecibidos) {
                if (rs.getCOMPROBANTE().equalsIgnoreCase("FACTURA")) {
                    registros[0] = rs.getCOMPROBANTE();
                    registros[1] = rs.getSERIE_COMPROBANTE();
                    registros[2] = rs.getRUC_EMISOR();
                    registros[3] = rs.getRAZON_SOCIAL_EMISOR();
                    registros[4] = rs.getFECHA_EMISION();
                    registros[5] = rs.getFECHA_AUTORIZACION();
                    registros[6] = rs.getTIPO_EMISION();
                    registros[7] = rs.getIDENTIFICACION_RECEPTOR();
                    registros[8] = rs.getCLAVE_ACCESO();
                    registros[9] = rs.getIMPORTE_TOTAL();
                    registros[10] = "NO";
                    registros[11] = "NO";
                    for (Clientes clientes : lista) {
                        if (clientes.getCedula().equals(rs.getRUC_EMISOR())) {
                            registros[10] = "SI";
                            Deb.consola(clientes.getCedula() + " --- " + rs.getRUC_EMISOR());
                            
                        }
                    }
                    for (Compras f : listacompras) {
                        if (f.getCalveAcceso().equals(rs.getCLAVE_ACCESO())) {
                            registros[11] = "SI";
                            Deb.consola(f.getCalveAcceso() + " **** " + rs.getCLAVE_ACCESO());
                        }
                    }
                    modelo.addRow(registros);
                    
                }
                
            }
            
        } catch (Exception ex) {
            ProgressBar.mostrarMensajeAzul(ex.toString());
        } finally {
            
        }
        
        return modelo;
    }
    
    public DefaultTableModel listarFacturasEmitidasTbModel() {
        
        String[] titulos
                = {"COMPROBANTE", "SERIE_COMPROBANTE", "RUC_EMISOR", "RAZON_SOCIAL_EMISOR",
                    "FECHA_EMISION", "FECHA_AUTORIZACION",
                    "TIPO_EMISION", "IDENTIFICACION_RECEPTOR", "CLAVE_ACCESO", "IMPORTE_TOTAL"};
        String[] registros = new String[10];
        DefaultTableModel modelo = new DefaultTableModel(null, titulos) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // make read only fields except column 0,13,14
                //  return column == 0 || column == 13 || column == 14;
                return false;
            }
        };
        try {

            //this.lista= new ArrayList();
            HashMap<String, String> hm = new HashMap<String, String>();
            Integer i = 0;
            for (ComprobantesRecibidosSri rs : listaComprobantesRecibidos) {
                ProgressBar.jpb_incremental = i++;
                registros[0] = rs.getCOMPROBANTE();
                registros[1] = rs.getSERIE_COMPROBANTE();
                registros[2] = rs.getRUC_EMISOR();

//                hm = ConsultaCedulas.getInfoSheylaGetokok(rs.getCLAVE_ACCESO());
//                Deb.consola("hhhhhhhhhhhhhhhÑ : " + hm);
//                registros[3] = hm.get("nombre");// rs.getRAZON_SOCIAL_EMISOR();
                registros[3] = rs.getRAZON_SOCIAL_EMISOR();
                registros[4] = rs.getFECHA_EMISION();
                registros[5] = rs.getFECHA_AUTORIZACION();
                registros[6] = rs.getTIPO_EMISION();
                registros[7] = rs.getIDENTIFICACION_RECEPTOR();
                registros[8] = rs.getRAZON_SOCIAL_EMISOR();//rs.getCLAVE_ACCESO();
                registros[9] = rs.getIMPORTE_TOTAL();
                
                modelo.addRow(registros);
                
            }
            
        } catch (Exception ex) {
            ProgressBar.mostrarMensajeAzul(ex.toString());
        } finally {
            
        }
        
        return modelo;
    }
    
    public static Integer listaficehros(String rutaarchivo) {
        Integer numero = 0;
        File carpeta = new File(rutaarchivo);
        String[] listado = carpeta.list();
        if (listado == null || listado.length == 0) {
            Deb.consola("No hay elementos dentro de la carpeta actual");
            return 0;
        } else {
            for (int i = 0; i < listado.length; i++) {
                Deb.consola(listado[i]);
                numero = numero + getNumerComprobanteseneltxt(rutaarchivo + listado[i]);
                getListaComprobantes(rutaarchivo + listado[i]);
                
            }
            JOptionPane.showMessageDialog(null, "Listacomprobantes: " + listaComprobantesRecibidos.size());
        }
        return numero;
    }
    
    public static Integer getNumerComprobanteseneltxt(String rutaarchivo) {
        Integer numdocs = 0;
        Integer aux = 0;
        Integer contocurrencias = 0;
        File archivo = null;
        FileReader fr = null;
        BufferedReader br = null;
        
        try {
            ComprobantesRecibidosSri comp = null;
            // Apertura del fichero y creacion de BufferedReader para poder
            // hacer una lectura comoda (disponer del metodo readLine()).
            archivo = new File(rutaarchivo);
            fr = new FileReader(archivo);
            br = new BufferedReader(fr);

            // Lectura del fichero
            String linea;
            Integer cont = 0;
            Comprobante c = new Comprobante();
            
            byte[] archivoBytes = null;
            String frase = "";
            //   ComprobantesRecibidosSri comp = new ComprobantesRecibidosSri();
            while ((linea = br.readLine()) != null) {

                //   Deb.consola(linea);
                String[] a = linea.split("\t");
                int soloclaveAceso = 0;
                Deb.consola("****************************************************");
                //  Deb.consola(a.toString());
                Deb.consola("****************************************************");
                
                for (int i = 0; i < a.length; i++) {
                    Deb.consola(i + 1 + " - " + a[i]);
                    if (a[i].length() == 49 && ValidaNUmeros.isOnlyNumbers(a[i])) {
                        
                        if (soloclaveAceso == 0) {
                            soloclaveAceso = 1;
                            numdocs++;
                            Deb.consola("NumeroDOumentos: " + numdocs);
                        }
                        
                    }
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // En el finally cerramos el fichero, para asegurarnos
            // que se cierra tanto si todo va bien como si salta 
            // una excepcion.
            try {
                if (null != fr) {
                    fr.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return numdocs;
    }
    
    public static ArrayList<ComprobantesRecibidosSri> getListaComprobantes(String rutaarchivo) {
        ArrayList<ComprobantesRecibidosSri> lista = new ArrayList<>();
        Integer numdocs = 0;
        Integer aux = 0;
        Integer contocurrencias = 0;
        File archivo = null;
        FileReader fr = null;
        BufferedReader br = null;
        
        try {
            ComprobantesRecibidosSri comp = null;
            // Apertura del fichero y creacion de BufferedReader para poder
            // hacer una lectura comoda (disponer del metodo readLine()).
            archivo = new File(rutaarchivo);
            fr = new FileReader(archivo);
            br = new BufferedReader(fr);

            // Lectura del fichero
            String linea;
            Integer cont = 0;
            Comprobante c = new Comprobante();
            
            byte[] archivoBytes = null;
            String frase = "";
            //   ComprobantesRecibidosSri comp = new ComprobantesRecibidosSri();
            while ((linea = br.readLine()) != null) {

                //   Deb.consola(linea);
                String[] a = linea.split("\t");
                int soloclaveAceso = 0;
                Deb.consola("****************************************************");
                //  Deb.consola(a.toString());
                Deb.consola("****************************************************");
                
                for (int i = 0; i < a.length; i++) {
                    Deb.consola(i + 1 + " - " + a[i]);
                    if (a[i].length() == 49 && ValidaNUmeros.isOnlyNumbers(a[i])) {
                        
                        if (soloclaveAceso == 0) {
                            soloclaveAceso = 1;
                            numdocs++;
                            Deb.consola("NumeroDOumentos: " + numdocs);
                        }
                        
                    }
                }
                Deb.consola("NumeroDOumentos: " + numdocs);
                if (numdocs > 0) { ////solo ingresan los documentos, el enacebzado no
                    if (contocurrencias == 0 && aux == 0) {
                        comp = new ComprobantesRecibidosSri();
                    }
                    if (contocurrencias == 0) {
                        
                        if (a.length > 1) {
                            if (a[7].trim().equals("")) {
                                comp.setIDENTIFICACION_RECEPTOR(a[8]);
                                comp.setCLAVE_ACCESO(a[9]);
                                
                            } else {
                                if (a[0].contains("Comprobante de Retenci")) {
                                    comp.setIDENTIFICACION_RECEPTOR(a[8]);
                                    comp.setCLAVE_ACCESO(a[9]);
                                } else {
                                    comp.setIDENTIFICACION_RECEPTOR(a[7]);
                                    comp.setCLAVE_ACCESO(a[8]);
                                }
                                
                            }
                            comp.setCOMPROBANTE(a[0].toUpperCase());
                            comp.setSERIE_COMPROBANTE(a[1]);
                            comp.setRUC_EMISOR(a[2]);
                            comp.setRAZON_SOCIAL_EMISOR(a[3].toUpperCase());
                            comp.setFECHA_EMISION(a[4]);
                            comp.setFECHA_AUTORIZACION(a[5]);
                            comp.setTIPO_EMISION(a[6]);
                            ///

////
                            aux = 1;
                        } else {
                            comp.setIMPORTE_TOTAL(a[0]);
                            lista.add(comp);
                            listaComprobantesRecibidos.add(comp);
                            //contocurrencias++;
                            aux = 0;
                            
                        }
                    }
//else {
//                        listaComprobantesRecibidos.add(comp);
//                        contocurrencias = 0;
//                        
//                    }

                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // En el finally cerramos el fichero, para asegurarnos
            // que se cierra tanto si todo va bien como si salta 
            // una excepcion.
            try {
                if (null != fr) {
                    fr.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        //listaComprobantesRecibidos = lista;
        return lista;
    }
    
    private void crearDirectorio(String dir) {
        File directorio = new File(dir);
        if (!directorio.exists()) {
            if (directorio.mkdirs()) {
                Deb.consola("Directorio creado");
            } else {
                Deb.consola("Error al crear directorio");
            }
        }
    }
    
    private void crearDirectoriosdeacuerdoalTIpoDocumentoyAlMes(String claveAcceso) {
        String anio = claveAcceso.substring(2, 4);
        switch (anio) {
            
            case "01":
//                crearDirectorio(Config.RECIBIDOS_DIR)
                break;
            
            case "02":
                
                break;
            
            default:
        }
        
        String mes = "";
        File directorio = new File(Config.RECIBIDOS_DIR);
        if (!directorio.exists()) {
            if (directorio.mkdirs()) {
                Deb.consola("Directorio creado");
            } else {
                Deb.consola("Error al crear directorio");
            }
        }
        
    }
    
    public static void descargarXMLformSRItoFileXMLandPFDenUnSoloPaso(String rutaarchivo) {
        File archivo = null;
        FileReader fr = null;
        BufferedReader br = null;
        
        try {
            // Apertura del fichero y creacion de BufferedReader para poder
            // hacer una lectura comoda (disponer del metodo readLine()).
            archivo = new File(rutaarchivo);
            fr = new FileReader(archivo);
            br = new BufferedReader(fr);

            // Lectura del fichero
            String linea;
            Integer cont = 0;
            Comprobante c = new Comprobante();
            
            byte[] archivoBytes = null;
            while ((linea = br.readLine()) != null) {
                //   Deb.consola(linea);
                String[] a = linea.split("\t");
                int soloclaveAceso = 0;
                
                for (int i = 0; i < a.length; i++) {
                    //String ruta = Config.GENERADOS_DIR + a[i] + ".xml";
                    //Deb.consola(a[i]);
                    // Deb.consola(i+" - "+a[i]);

                    if (a[i].length() == 49 && ValidaNUmeros.isOnlyNumbers(a[i])) {
                        
                        if (soloclaveAceso == 0) {
                            soloclaveAceso = 1;
                            Deb.consola("Clave Acceso: " + cont + " - " + a[i]);
                            //if (a[i].equals( "2102202001171632036900120010220000301530003017612")) {
                            if (true) {                
                                
                                String xmlstring = c.getxmlFromSriWS2(a[i]);
                                if (!xmlstring.equalsIgnoreCase("ERROR CONECCION SRI")) {
                                    Deb.consola("ClasesAuxiliares.Leertxt.descargarXMLformSRItoFileXML()xxxxxxxaaaaaaaaaaaaaaaaaaaaaaaaaaa: " + Config.FIRMADOS_DIR);
                                    String dir_xml = Config.RECIBIDOS_DIR + "XML" + Config.SEPARADOR;
                                    String dir_pdf = Config.RECIBIDOS_DIR + "PDF" + Config.SEPARADOR;
                                    ArchivoUtil.stringToFile(dir_xml + a[i] + ".xml", xmlstring);
                                    File xml_file = new File(dir_xml + a[i] + ".xml");
                                    archivoBytes = ArchivoUtil.convertirArchivoAByteArray(xml_file);
                                    c.xmlToPDF(a[i], archivoBytes, dir_xml, dir_pdf);
                                }
                                
                            }
                            cont++;
                        }
                        
                    }
                }
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // En el finally cerramos el fichero, para asegurarnos
            // que se cierra tanto si todo va bien como si salta 
            // una excepcion.
            try {
                if (null != fr) {
                    fr.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }
    
    public static String descargarXMLformSRItoFileXMLandPFDenUnSoloPasoEMITIDOSlista(String claveAcceso) {
        String ret = "";
        
        try {
            byte[] archivoBytes = null;
            Comprobante c = new Comprobante();
            
            if (true) {                
                String xmlstring = c.getxmlFromSriWS2(claveAcceso);
                if (!xmlstring.equalsIgnoreCase("ERROR CONECCION SRI")) {                    
                    Deb.consola("ClasesAuxiliares.Leertxt.descargarXMLformSRItoFileXML()xxxxxxxaaaaaaaaaaaaaaaaaaaaaaaaaaa: " + Config.FIRMADOS_DIR);
                    String dir_xml = Config.EMITIDOS_DIR + "XML" + Config.SEPARADOR;
                    String dir_pdf = Config.EMITIDOS_DIR + "PDF" + Config.SEPARADOR;
                    ArchivoUtil.stringToFile(dir_xml + claveAcceso + ".xml", xmlstring);
                    File xml_file = new File(dir_xml + claveAcceso + ".xml");
                    archivoBytes = ArchivoUtil.convertirArchivoAByteArray(xml_file);
                    c.xmlToPDF(claveAcceso, archivoBytes, dir_xml, dir_pdf);
                    ret = "OK";
                } else {
                    return "ERROR";
                }
                
            }            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ret;
    }
    
    public static void descargarXMLformSRItoFileXMLandPFDenUnSoloPasoEMITIDOS(String rutaarchivo) {
        File archivo = null;
        FileReader fr = null;
        BufferedReader br = null;
        
        try {
            // Apertura del fichero y creacion de BufferedReader para poder
            // hacer una lectura comoda (disponer del metodo readLine()).
            archivo = new File(rutaarchivo);
            fr = new FileReader(archivo);
            br = new BufferedReader(fr);

            // Lectura del fichero
            String linea;
            Integer cont = 0;
            Comprobante c = new Comprobante();
            
            byte[] archivoBytes = null;
            while ((linea = br.readLine()) != null) {
                //   Deb.consola(linea);
                String[] a = linea.split("\t");
                int soloclaveAceso = 0;
                
                for (int i = 0; i < a.length; i++) {
                    //String ruta = Config.GENERADOS_DIR + a[i] + ".xml";
                    //Deb.consola(a[i]);
                    // Deb.consola(i+" - "+a[i]);

                    if (a[i].length() == 49 && ValidaNUmeros.isOnlyNumbers(a[i])) {
                        
                        if (soloclaveAceso == 0) {
                            soloclaveAceso = 1;
                            Deb.consola("Clave Acceso: " + cont + " - " + a[i]);
                            //if (a[i].equals( "2102202001171632036900120010220000301530003017612")) {
                            if (true) {                
                                String xmlstring = c.getxmlFromSriWS2(a[i]);
                                Deb.consola("ClasesAuxiliares.Leertxt.descargarXMLformSRItoFileXML()xxxxxxxaaaaaaaaaaaaaaaaaaaaaaaaaaa: " + Config.FIRMADOS_DIR);
                                String dir_xml = Config.EMITIDOS_DIR + "XML" + Config.SEPARADOR;
                                String dir_pdf = Config.EMITIDOS_DIR + "PDF" + Config.SEPARADOR;
                                ArchivoUtil.stringToFile(dir_xml + a[i] + ".xml", xmlstring);
                                File xml_file = new File(dir_xml + a[i] + ".xml");
                                archivoBytes = ArchivoUtil.convertirArchivoAByteArray(xml_file);
                                c.xmlToPDF(a[i], archivoBytes, dir_xml, dir_pdf);
                            }
                            cont++;
                        }
                        
                    }
                }
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // En el finally cerramos el fichero, para asegurarnos
            // que se cierra tanto si todo va bien como si salta 
            // una excepcion.
            try {
                if (null != fr) {
                    fr.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }
    
    public static void descargarXMLformSRItoFileXMLandPFDenUnSoloPasoclickjtable(String claveAcceso) {
        File archivo = null;
        FileReader fr = null;
        BufferedReader br = null;
        if (Comprobante.VerificasiExisteConecionconWSdelSRI(claveAcceso)) {                
        try {
            Comprobante c = new Comprobante();
            byte[] archivoBytes = null;
            String xmlstring = c.getxmlFromSriWS2(claveAcceso);
            Deb.consola("ClasesAuxiliares.Leertxt.descargarXMLformSRItoFileXML()xxxxxxxaaaaaaaaaaaaaaaaaaaaaaaaaaa: " + Config.FIRMADOS_DIR);
            
            String dir_xml = Config.RECIBIDOS_DIR + "XML" + Config.SEPARADOR;
            String dir_pdf = Config.RECIBIDOS_DIR + "PDF" + Config.SEPARADOR;
            Deb.consola("ClasesAuxiliares.Leertxt.descargarXMLformSRItoFileXML()xxxxxxxaaaaaaaaaaaaaaaaaaaaaaaaaaa: " + dir_xml);
            Deb.consola("ClasesAuxiliares.Leertxt.descargarXMLformSRItoFileXML()xxxxxxxaaaaaaaaaaaaaaaaaaaaaaaaaaa: " + dir_pdf);
            ArchivoUtil.stringToFile(dir_xml + claveAcceso + ".xml", xmlstring);
            File xml_file = new File(dir_xml + claveAcceso + ".xml");
            archivoBytes = ArchivoUtil.convertirArchivoAByteArray(xml_file);
            c.xmlToPDF(claveAcceso, archivoBytes, dir_xml, dir_pdf);
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // En el finally cerramos el fichero, para asegurarnos
            // que se cierra tanto si todo va bien como si salta 
            // una excepcion.
            try {
                if (null != fr) {
                    fr.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        }
    }
    
    public static void descargarXMLformSRItoFileXMLandPFDenUnSoloPasoclickjtableEMITIDOS(String claveAcceso) {
        File archivo = null;
        FileReader fr = null;
        BufferedReader br = null;
        if (true) {                
        try {
            Comprobante c = new Comprobante();
            byte[] archivoBytes = null;
            String xmlstring = c.getxmlFromSriWS2(claveAcceso);
            Deb.consola("ClasesAuxiliares.Leertxt.descargarXMLformSRItoFileXML()xxxxxxxaaaaaaaaaaaaaaaaaaaaaaaaaaa: " + Config.FIRMADOS_DIR);
            
            String dir_xml = Config.EMITIDOS_DIR + "XML" + Config.SEPARADOR;
            String dir_pdf = Config.EMITIDOS_DIR + "PDF" + Config.SEPARADOR;
            Deb.consola("ClasesAuxiliares.Leertxt.descargarXMLformSRItoFileXML()xxxxxxxaaaaaaaaaaaaaaaaaaaaaaaaaaa: " + dir_xml);
            Deb.consola("ClasesAuxiliares.Leertxt.descargarXMLformSRItoFileXML()xxxxxxxaaaaaaaaaaaaaaaaaaaaaaaaaaa: " + dir_pdf);
            ArchivoUtil.stringToFile(dir_xml + claveAcceso + ".xml", xmlstring);
            File xml_file = new File(dir_xml + claveAcceso + ".xml");
            archivoBytes = ArchivoUtil.convertirArchivoAByteArray(xml_file);
            c.xmlToPDF(claveAcceso, archivoBytes, dir_xml, dir_pdf);
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // En el finally cerramos el fichero, para asegurarnos
            // que se cierra tanto si todo va bien como si salta 
            // una excepcion.
            try {
                if (null != fr) {
                    fr.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }
    }
    
    public void XMLformtoFilePDF(String rutaarchivo) {
        File archivo = null;
        FileReader fr = null;
        BufferedReader br = null;
        
        try {
            // Apertura del fichero y creacion de BufferedReader para poder
            // hacer una lectura comoda (disponer del metodo readLine()).
            archivo = new File(rutaarchivo);
            fr = new FileReader(archivo);
            br = new BufferedReader(fr);

            // Lectura del fichero
            String linea;
            Integer cont = 0;
            Comprobante c = new Comprobante();
            
            byte[] archivoBytes = null;
            while ((linea = br.readLine()) != null) {
                //   Deb.consola(linea);
                String[] a = linea.split("\t");
                int soloclaveAceso = 0;
                
                for (int i = 0; i < a.length; i++) {
                    //   String ruta = Config.GENERADOS_DIR + a[i] + ".xml";
                    //Deb.consola(a[i]);
                    // Deb.consola(i+" - "+a[i]);

                    if (a[i].length() == 49 && ValidaNUmeros.isOnlyNumbers(a[i])) {
                        
                        if (soloclaveAceso == 0) {
                            soloclaveAceso = 1;
                            Deb.consola("Clave Acceso: " + cont + " - " + a[i]);
                            //if (a[i].equals( "2902202001170739967900120020100000586567404014116")) {
                            if (1 == 1) {
                                //  String xmlstring = c.getxmlFromSriWS2(a[i]);
                                // ArchivoUtil.stringToFile(Config.FIRMADOS_DIR + a[i] + ".xml", xmlstring);                       
                                ////////////////
                                String dir_xml = Config.RECIBIDOS_DIR + "XML" + Config.SEPARADOR;
                                String dir_pdf = Config.RECIBIDOS_DIR + "PDF" + Config.SEPARADOR;
                                //ArchivoUtil.stringToFile(dir_xml + ".xml", xmlstring);
                                // File xml_file = new File(dir_xml + ".xml");
                                ////////////////
                                File xml_file = new File(dir_xml + ".xml");
                                Deb.consola("ClasesAuxiliares.Leertxt.XMLformtoFilePDF(): " + dir_xml + ".xml");
                                
                                archivoBytes = ArchivoUtil.convertirArchivoAByteArray(xml_file);
                                c.xmlToPDF(a[i], archivoBytes, dir_xml, dir_pdf);
                                
                            }
                            cont++;
                        }
                        
                    }
                }
            }
            pasos = -1;
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // En el finally cerramos el fichero, para asegurarnos
            // que se cierra tanto si todo va bien como si salta 
            // una excepcion.
            try {
                if (null != fr) {
                    fr.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }
    
    public String getinformacionSingular(String xml, String nodoClave) {
        
        String s1 = "<" + nodoClave + ">";
        String s2 = "</" + nodoClave + ">";
        Integer x1 = xml.indexOf(s1);
        Integer x2 = xml.indexOf(s2);
        if (x1 == -1 || x2 == -1) {
            return "xxx";
        } else {
            return xml.substring(x1 + s1.length(), x2);
        }
        
    }
    
    public static String getEtiquetas(String xml) {
        
        String s1 = "<";
        String s2 = ">";
        
        Integer x1 = xml.indexOf(s1);
        Integer x2 = xml.indexOf(s2);
        if (x1 == -1 || x2 == -1) {
            return "xxx";
        } else {
            return xml.substring(x1 + s1.length(), x2);
        }
        
    }
    
    @Override
    public void run() {
        while (continuar) {
            this.descargarXMLformSRItoFileXML(rutaarchivo);
            if (pasos == 1) {
                this.descargarXMLformSRItoFileXMLandPFDenUnSoloPaso(rutaarchivo);
                continuar = false;
            } else if (pasos == 2) {
                this.XMLformtoFilePDF(rutaarchivo);
                continuar = false;
            } else if (pasos == 3) {
                this.descargarXMLformSRItoFileXMLandPFDenUnSoloPaso(rutaarchivo);
                continuar = false;
            }
            
        }
    }
    
    public static void exportxml(JTable jTable1) {
        
        Thread t = new Thread() {
            
            @Override
            public void run() {
                XSSFWorkbook workbook = new XSSFWorkbook();
                XSSFSheet hoja = workbook.createSheet();
                XSSFRow fila = hoja.createRow(0);
                
                fila.createCell(0).setCellValue("Cedula");
                fila.setHeightInPoints(23);
                fila.createCell(1).setCellValue("Nombres");
                fila.createCell(2).setCellValue("Direccion");
                XSSFRow filas;
                
                for (int i = 0; i < jTable1.getRowCount(); i++) {
                    jTable1.setRowSelectionInterval(i, i);
                    filas = hoja.createRow(i + 1);
                    filas.createCell(0).setCellValue(jTable1.getValueAt(i, 0).toString());
                    filas.createCell(1).setCellValue(jTable1.getValueAt(i, 1).toString());
                    filas.createCell(2).setCellValue(jTable1.getValueAt(i, 2).toString());
                }
                
                try {
                    workbook.write(new FileOutputStream(new File(Config.AUTORIZADOS_DIR + "Excel.xlsx")));
                } catch (Exception e) {
                }
                
            }
        ;
        
        };
        t.start();
    }
    
    private static XSSFSheet crecarHojaExcel(XSSFWorkbook workbook, String nombreHoja, String[] titulosColumnas) {
        XSSFSheet hoja = workbook.createSheet(nombreHoja);
        XSSFRow fila = hoja.createRow(0);/// cren fila cero la de los titulos
        /* *************Creamos formato Numero formato numer*************/
        cellstyle = workbook.createCellStyle();
        CreationHelper ch = workbook.getCreationHelper();
        cellstyle.setDataFormat(ch.createDataFormat().getFormat("#,##0.00;\\-#,##0.00"));
        /* ****************************************** */
        fila.setHeightInPoints(25);//// acemos mas alta la priemra fila de los titulos
        for (int i = 0; i < titulosColumnas.length; i++) {
            
            fila.createCell(i).setCellValue(titulosColumnas[i]);
            hoja.setColumnWidth(i, 10000);///pongo ancho de la columan 
        }
        return hoja;
    }
    
    public static void exportxmlexcelFacturas() {
//listaFacturasGenaradas.clear();
        Thread t = new Thread() {
            
            @Override
            public void run() {
                XSSFWorkbook workbook = new XSSFWorkbook();
                String[] titulos
                        = {"razonSocial EMISOR".toUpperCase(), "nombreComercial EMISOR".toUpperCase(), "RUC EMISOR",
                            "FEC_EMISION", "FECHA AUT", "CLAVE_ACCESO", "COD. DOC", "SERIE", "SECUENCIAL", "subtotal".toUpperCase(),
                            "Descuento".toUpperCase(), "BASE 0".toUpperCase(), " BASE iva ".toUpperCase(), "monto iva", "IMPORTE_TOTAL"};
                
                XSSFSheet hoja = crecarHojaExcel(workbook, "FACTURAS", titulos);
                hoja.setColumnWidth(2, 3700);///pongo ancho de la columan 
                hoja.setColumnWidth(3, 2800);///pongo ancho de la columan 
                hoja.setColumnWidth(4, 2800);///pongo ancho de la columan 
                hoja.setColumnWidth(5, 13000);///pongo ancho de la columan 
                hoja.setColumnWidth(6, 1500);///pongo ancho de la columan 
                hoja.setColumnWidth(7, 2800);///pongo ancho de la columan 
                hoja.setColumnWidth(8, 3000);///pongo ancho de la columan 
                hoja.setColumnWidth(9, 3000);///pongo ancho de la columan 
                hoja.setColumnWidth(10, 3000);///pongo ancho de la columan 
                hoja.setColumnWidth(11, 3000);///pongo ancho de la columan 
                hoja.setColumnWidth(12, 3000);///pongo ancho de la columan 
                hoja.setColumnWidth(13, 3000);///pongo ancho de la columan 
                hoja.setColumnWidth(14, 3000);///pongo ancho de la columan 
                XSSFRow filas;
                Integer filax = 1;
                Deb.consola(".run(): numero factiras: " + listaFacturasGenaradas.size());
                for (Factura f : listaFacturasGenaradas) {
                    
                    filas = hoja.createRow(filax);
                    filas.createCell(0).setCellValue(f.getRazonSocial());
                    filas.createCell(1).setCellValue(f.getNombreComercial());
                    filas.createCell(2).setCellValue(f.getRUC());
                    filas.createCell(3).setCellValue(f.getFechaEmision());
                    String fecha = f.getFechaAutorizacion().substring(0, 10);
                    filas.createCell(4).setCellValue(fecha);
                    filas.createCell(5).setCellValue(f.getClaveAcceso());
                    filas.createCell(6).setCellValue(f.getCodDoc());
                    filas.createCell(7).setCellValue(f.getEstab().concat(f.getPtoEmi().toString()));
                    filas.createCell(8).setCellValue(f.getSecuencia().toString());
                    //filas.createCell(3).setCellValue(f.getSecuencia());

                    /*NUMERO*/
                    filas.createCell(9).setCellStyle(cellstyle);
                    filas.createCell(9).setCellValue(f.getTotalSinImpuestos());
                    /*NUMERO*/
                    filas.createCell(10).setCellStyle(cellstyle);
                    filas.createCell(10).setCellValue(f.getTotalDescuento());

                    //////////SUBTOTALL 12 Y 0
                    for (int i = 0; i < f.getTotalImpuestos().size(); i++) {
                        TotalImpuesto e = f.getTotalImpuestos().elementAt(i);
                        if (e.getCodigoPorcentaje() == 2) {
                            ///base IVA 12
                            filas.createCell(12).setCellStyle(cellstyle);
                            filas.createCell(12).setCellValue(e.getBaseImponible());
                            //VALOR IVA 12
                            filas.createCell(13).setCellStyle(cellstyle);
                            filas.createCell(13).setCellValue(e.getValor());
                        } else {
                            filas.createCell(8).setCellStyle(cellstyle);
                            filas.createCell(8).setCellValue(0.00);
                        }
                        if (e.getCodigoPorcentaje() == 0) {
                            filas.createCell(11).setCellStyle(cellstyle);
                            filas.createCell(11).setCellValue(e.getBaseImponible());
                        }
                        
                    }
                    
                    filas.createCell(14).setCellValue(f.getImporteTotal());
                    filax++;
                }

                ////////notas de credigo
                String[] titulosnc
                        = {"razonSocial EMISOR".toUpperCase(), "nombreComercial EMISOR".toUpperCase(), "RUC EMISOR",
                            "FEC_EMISION", "FECHA AUT", "CLAVE_ACCESO", "COD. DOC", "SERIE", "SECUENCIAL", "subtotal".toUpperCase(),
                            "Descuento".toUpperCase(), "BASE 0".toUpperCase(), " BASE iva ".toUpperCase(), "monto iva", "IMPORTE_TOTAL"};
                
                XSSFSheet hojanc = crecarHojaExcel(workbook, "NOTAS DE CREDITO", titulosnc);
                hojanc.setColumnWidth(2, 3700);///pongo ancho de la columan 
                hojanc.setColumnWidth(3, 2800);///pongo ancho de la columan 
                hojanc.setColumnWidth(4, 2800);///pongo ancho de la columan 
                hojanc.setColumnWidth(5, 13000);///pongo ancho de la columan 
                hojanc.setColumnWidth(6, 1500);///pongo ancho de la columan 
                hojanc.setColumnWidth(7, 2800);///pongo ancho de la columan 
                hojanc.setColumnWidth(8, 3000);///pongo ancho de la columan 
                hojanc.setColumnWidth(9, 3000);///pongo ancho de la columan 
                hojanc.setColumnWidth(10, 3000);///pongo ancho de la columan 
                hojanc.setColumnWidth(11, 3000);///pongo ancho de la columan 
                hojanc.setColumnWidth(12, 3000);///pongo ancho de la columan 
                hojanc.setColumnWidth(13, 3000);///pongo ancho de la columan 
                hojanc.setColumnWidth(14, 3000);///pongo ancho de la columan 

                XSSFRow filasnc;
                Integer filaxnc = 1;
                Deb.consola(".run(): numero Notascredito: " + listaNotaCreditoGenaradas.size());
                for (NotaCredito n : listaNotaCreditoGenaradas) {
                    filasnc = hojanc.createRow(filaxnc);
                    filasnc.createCell(0).setCellValue(n.getRazonSocial());
                    filasnc.createCell(1).setCellValue(n.getNombreComercial());
                    filasnc.createCell(2).setCellValue(n.getRUC());
                    filasnc.createCell(3).setCellValue(n.getFechaEmision());
                    //   String fecha = n.get.getFechaAutorizacion().substring(0, 10);
                    String fecha = n.getAuthDate().substring(0, 10);
                    filasnc.createCell(4).setCellValue(fecha);
                    filasnc.createCell(5).setCellValue(n.getClaveAcceso());
                    filasnc.createCell(6).setCellValue(n.getCodDoc());
                    filasnc.createCell(7).setCellValue(n.getEstab().concat(n.getPtoEmi().toString()));
                    filasnc.createCell(8).setCellValue(n.getSecuencia().toString());
                    //filas.createCell(3).setCellValue(f.getSecuencia());

                    /*NUMERO*/
                    filasnc.createCell(9).setCellStyle(cellstyle);
                    filasnc.createCell(9).setCellValue(n.getTotalSinImpuestos());
                    /*NUMERO*/
                    filasnc.createCell(10).setCellStyle(cellstyle);
                    filasnc.createCell(10).setCellValue(n.getTotalDescuento());

                    //////////SUBTOTALL 12 Y 0
                    for (int i = 0; i < n.getTotalConImpuestos().size(); i++) {
                        TotalConImpuestos e = n.getTotalConImpuestos().elementAt(i);
                        if (e.getCodigoPorcentaje() == 2) {
                            ///base IVA 12
                            filasnc.createCell(12).setCellStyle(cellstyle);
                            filasnc.createCell(12).setCellValue(e.getBaseImponible());
                            //VALOR IVA 12
                            filasnc.createCell(13).setCellStyle(cellstyle);
                            filasnc.createCell(13).setCellValue(e.getValor());
                        } else {
                            filasnc.createCell(8).setCellStyle(cellstyle);
                            filasnc.createCell(8).setCellValue(0.00);
                        }
                        if (e.getCodigoPorcentaje() == 0) {
                            filasnc.createCell(11).setCellStyle(cellstyle);
                            filasnc.createCell(11).setCellValue(e.getBaseImponible());
                        }
                        
                    }
                    
                    filasnc.createCell(14).setCellValue(n.getImporteTotal());
                    filaxnc++;
                }
                ////////RETENCIONES           
                String[] titulosre
                        = {"razonSocial EMISOR".toUpperCase(), "nombreComercial EMISOR".toUpperCase(), "RUC EMISOR",
                            "FEC_EMISION", "FECHA AUT", "CLAVE_ACCESO", "COD. DOC", "SERIE", "SECUENCIAL", "RUC RECEPTOR".toUpperCase(),
                            "NOMBRE RECEPTOR".toUpperCase(), "COD. DOC.".toUpperCase(), "NUM.DOC".toUpperCase(), "FECHA EMI.", "PERIODO FISCAL", "BASE IMP", "IMPUESTO",
                            "% RETENCION", "VALOR"};
                
                XSSFSheet hojare = crecarHojaExcel(workbook, "RETENCIONES", titulosre);
                
                hojare.setColumnWidth(2, 3700);///pongo ancho de la columan 
                hojare.setColumnWidth(3, 2800);///pongo ancho de la columan 
                hojare.setColumnWidth(4, 2800);///pongo ancho de la columan 
                hojare.setColumnWidth(5, 13000);///pongo ancho de la columan 
                hojare.setColumnWidth(6, 1500);///pongo ancho de la columan 
                hojare.setColumnWidth(7, 2800);///pongo ancho de la columan 
                hojare.setColumnWidth(8, 3000);///pongo ancho de la columan 
                hojare.setColumnWidth(9, 3500);///pongo ancho de la columan 
                hojare.setColumnWidth(10, 9000);///pongo ancho de la columan 
                hojare.setColumnWidth(11, 1000);///pongo ancho de la columan 
                hojare.setColumnWidth(12, 3600);///pongo ancho de la columan 
                hojare.setColumnWidth(13, 3000);///pongo ancho de la columan 
                hojare.setColumnWidth(14, 3000);///pongo ancho de la columan 
                hojare.setColumnWidth(15, 3000);///pongo ancho de la columan 
                hojare.setColumnWidth(16, 3000);///pongo ancho de la columan 
                hojare.setColumnWidth(17, 3000);///pongo ancho de la columan 
                hojare.setColumnWidth(18, 3000);///pongo ancho de la columan 

                XSSFRow filasre;
                Integer filaxre = 1;
                Deb.consola(".run(): numero retenciones: " + listaRetencionesGenaradas.size());
                for (Retencion r : listaRetencionesGenaradas) {
                    filasre = hojare.createRow(filaxre);
                    filasre.createCell(0).setCellValue(r.getRazonSocial());
                    filasre.createCell(1).setCellValue(r.getNombreComercial());
                    filasre.createCell(2).setCellValue(r.getRUC());
                    filasre.createCell(3).setCellValue(r.getFechaEmision());
                    //   String fecha = n.get.getFechaAutorizacion().substring(0, 10);
                    String fecha = r.getAuthDate().substring(0, 10);
                    filasre.createCell(4).setCellValue(fecha);
                    filasre.createCell(5).setCellValue(r.getClaveAcceso());
                    filasre.createCell(6).setCellValue(r.getCodDoc());
                    filasre.createCell(7).setCellValue(r.getEstab().concat(r.getPtoEmi().toString()));
                    filasre.createCell(8).setCellValue(r.getSecuencia().toString());
                    //filas.createCell(3).setCellValue(f.getSecuencia());

                    /*NUMERO*/
                    //filasre.createCell(9).setCellStyle(cellstyle);
                    filasre.createCell(9).setCellValue(r.getIdentificacionSujetoRetenido());
                    /*NUMERO*/
                    // filasre.createCell(10).setCellStyle(cellstyle);
                    filasre.createCell(10).setCellValue(r.getRazonSocialSujetoRetenido());

                    //////////SUBTOTALL 12 Y 0
                    Integer tamanolistaretenciones = r.getImpuesto().size();
                    Double sumtatotalRetencion = 0.00;
                    for (int i = 0; i < tamanolistaretenciones; i++) {
                        Impuesto e = r.getImpuesto().elementAt(i);
                        filasre.createCell(11).setCellStyle(cellstyle);
                        filasre.createCell(11).setCellValue(e.getCodDocSustento());
                        filasre.createCell(12).setCellStyle(cellstyle);
                        filasre.createCell(12).setCellValue(e.getNumDocSustento());
                        filasre.createCell(13).setCellStyle(cellstyle);
                        filasre.createCell(13).setCellValue(e.getFechaEmisionDocSustento());
                        filasre.createCell(14).setCellStyle(cellstyle);
                        filasre.createCell(14).setCellValue(r.getPeriodoFiscal());
                        filasre.createCell(15).setCellStyle(cellstyle);
                        filasre.createCell(15).setCellValue(e.getBaseImponible());
                        Integer codigo = e.getCodigo();
                        if (codigo == 1) {
                            // filasre.createCell(16).setCellStyle(cellstyle);
                            filasre.createCell(16).setCellValue("RENTA");
                        }
                        if (codigo == 2) {
                            //   filasre.createCell(16).setCellStyle(cellstyle);
                            filasre.createCell(16).setCellValue("IVA");
                        }
                        
                        filasre.createCell(17).setCellStyle(cellstyle);
                        filasre.createCell(17).setCellValue(e.getPorcentajeRetener());
                        filasre.createCell(18).setCellStyle(cellstyle);
                        filasre.createCell(18).setCellValue(e.getValorRetenido());
                        sumtatotalRetencion = sumtatotalRetencion + e.getValorRetenido();
                        if (tamanolistaretenciones > 1) {
                            filaxre++;
                            filasre = hojare.createRow(filaxre);
                        }
                    }
                    filaxre++;
                 //   cellstyle.setFillForegroundColor(new XSSFColor(new java.awt.Color(255, 255, 0)));
                    cellstyle.setFillPattern(FillPatternType.ALT_BARS);
                    filasre.createCell(18).setCellStyle(cellstyle);
                    filasre.createCell(18).setCellValue(sumtatotalRetencion);
                    // XSSFCellStyle cellstylere= ;
//                 HSSFCellStyle style = workbook.createCellStyle()
//style.setFillForegroundColor(HSSFColor.YELLOW.index)
//style.setFillPattern((short) FillPatternType.SOLID_FOREGROUND.ordinal())

                }
                try {
                    //    listaFacturasGenaradas.clear();
                    listaNotaCreditoGenaradas.clear();
                    listaNotaDebitoGenaradas.clear();
                    listaRetencionesGenaradas.clear();
                    Integer numero = (int) (Math.random() * 12152135 + 5656532);
                    String file = Config.AUTORIZADOS_DIR + "Reporte" + numero + ".xlsx";
                    workbook.write(new FileOutputStream(new File(file)));
                    
                    Runtime.getRuntime().exec("cmd /c start " + file);
                } catch (Exception e) {
                    Deb.consola(".run()" + e.toString());
                    
                }
                
            }
        ;
        };
            t.start();
        
    }
    
    public static void exportxmlexcelFacturasCXCJC() {
//listaFacturasGenaradas.clear();

        XSSFWorkbook workbook = new XSSFWorkbook();
        String[] titulos
                = {"razonSocial EMISOR".toUpperCase(), "nombreComercial EMISOR".toUpperCase(), "RUC EMISOR",
                    "FEC_EMISION", "FECHA AUT", "CLAVE_ACCESO", "COD. DOC", "SERIE", "SECUENCIAL", "subtotal".toUpperCase(),
                    "Descuento".toUpperCase(), "BASE 0".toUpperCase(), " BASE iva ".toUpperCase(), "monto iva", "IMPORTE_TOTAL", "SALDOS"};
        
        XSSFSheet hoja = crecarHojaExcel(workbook, "FACTURAS", titulos);
        hoja.setColumnWidth(2, 3700);///pongo ancho de la columan 
        hoja.setColumnWidth(3, 2800);///pongo ancho de la columan 
        hoja.setColumnWidth(4, 2800);///pongo ancho de la columan 
        hoja.setColumnWidth(5, 13000);///pongo ancho de la columan 
        hoja.setColumnWidth(6, 1500);///pongo ancho de la columan 
        hoja.setColumnWidth(7, 2800);///pongo ancho de la columan 
        hoja.setColumnWidth(8, 3000);///pongo ancho de la columan 
        hoja.setColumnWidth(9, 3000);///pongo ancho de la columan 
        hoja.setColumnWidth(10, 3000);///pongo ancho de la columan 
        hoja.setColumnWidth(11, 3000);///pongo ancho de la columan 
        hoja.setColumnWidth(12, 3000);///pongo ancho de la columan 
        hoja.setColumnWidth(13, 3000);///pongo ancho de la columan 
        hoja.setColumnWidth(14, 3000);///pongo ancho de la columan 
        hoja.setColumnWidth(15, 3000);///pongo ancho de la columan 
        XSSFRow filas;
        Integer filax = 1;
        Deb.consola(".run(): numero factiras: " + listaFacturasGenaradas.size());
        for (Factura f : listaFacturasGenaradas) {
            
            for (InfoAdicional i : f.getInfoAdicional()) {
                if (i.getValor().contains("CREDITO")) {
                    
                    filas = hoja.createRow(filax);
                    filas.createCell(0).setCellValue(f.getRazonSocial());
                    filas.createCell(1).setCellValue(f.getRazonSocialComprador());
                    filas.createCell(2).setCellValue(f.getRUC());
                    filas.createCell(3).setCellValue(f.getFechaEmision());
                    String fecha = f.getFechaAutorizacion().substring(0, 10);
                    filas.createCell(4).setCellValue(fecha);
                    filas.createCell(5).setCellValue(f.getClaveAcceso());
                    filas.createCell(6).setCellValue(f.getCodDoc());
                    filas.createCell(7).setCellValue(f.getEstab().concat(f.getPtoEmi().toString()));
                    filas.createCell(8).setCellValue(f.getSecuencia().toString());
                    //filas.createCell(3).setCellValue(f.getSecuencia());

                    /*NUMERO*/
                    filas.createCell(9).setCellStyle(cellstyle);
                    filas.createCell(9).setCellValue(f.getTotalSinImpuestos());
                    /*NUMERO*/
                    filas.createCell(10).setCellStyle(cellstyle);
                    filas.createCell(10).setCellValue(f.getTotalDescuento());

                    //////////SUBTOTALL 12 Y 0
                    for (int ii = 0; ii < f.getTotalImpuestos().size(); ii++) {
                        TotalImpuesto e = f.getTotalImpuestos().elementAt(ii);
                        if (e.getCodigoPorcentaje() == 2) {
                            ///base IVA 12
                            filas.createCell(12).setCellStyle(cellstyle);
                            filas.createCell(12).setCellValue(e.getBaseImponible());
                            //VALOR IVA 12
                            filas.createCell(13).setCellStyle(cellstyle);
                            filas.createCell(13).setCellValue(e.getValor());
                        } else {
                            filas.createCell(8).setCellStyle(cellstyle);
                            filas.createCell(8).setCellValue(0.00);
                        }
                        if (e.getCodigoPorcentaje() == 0) {
                            filas.createCell(11).setCellStyle(cellstyle);
                            filas.createCell(11).setCellValue(e.getBaseImponible());
                        }
                        
                    }
                    Deb.consola("TIPO: " + i.getValor());
                    Deb.consola("CLIENTE: " + f.getRazonSocialComprador());
                    for (InfoAdicional in : f.getInfoAdicional()) {
                        //    Deb.consola(in.getNombre()+" : "+in.getValor());

                        if (in.getNombre().contains("OBSERVACIONES")) {
                            Deb.consola("OOBS: " + in.getValor());
                            filas.createCell(15).setCellValue(in.getValor());
                        }
                    }
                    
                    filas.createCell(14).setCellValue(f.getImporteTotal());
                    filax++;
                    Deb.consola("TOTAL: " + f.getImporteTotal());
                    
                }
            }
        }

        ////////notas de credigo
        String[] titulosnc
                = {"razonSocial EMISOR".toUpperCase(), "nombreComercial EMISOR".toUpperCase(), "RUC EMISOR",
                    "FEC_EMISION", "FECHA AUT", "CLAVE_ACCESO", "COD. DOC", "SERIE", "SECUENCIAL", "subtotal".toUpperCase(),
                    "Descuento".toUpperCase(), "BASE 0".toUpperCase(), " BASE iva ".toUpperCase(), "monto iva", "IMPORTE_TOTAL"};
        
        XSSFSheet hojanc = crecarHojaExcel(workbook, "NOTA DE CREDITO", titulosnc);
        hojanc.setColumnWidth(2, 3700);///pongo ancho de la columan 
        hojanc.setColumnWidth(3, 2800);///pongo ancho de la columan 
        hojanc.setColumnWidth(4, 2800);///pongo ancho de la columan 
        hojanc.setColumnWidth(5, 13000);///pongo ancho de la columan 
        hojanc.setColumnWidth(6, 1500);///pongo ancho de la columan 
        hojanc.setColumnWidth(7, 2800);///pongo ancho de la columan 
        hojanc.setColumnWidth(8, 3000);///pongo ancho de la columan 
        hojanc.setColumnWidth(9, 3000);///pongo ancho de la columan 
        hojanc.setColumnWidth(10, 3000);///pongo ancho de la columan 
        hojanc.setColumnWidth(11, 3000);///pongo ancho de la columan 
        hojanc.setColumnWidth(12, 3000);///pongo ancho de la columan 
        hojanc.setColumnWidth(13, 3000);///pongo ancho de la columan 
        hojanc.setColumnWidth(14, 3000);///pongo ancho de la columan 

        XSSFRow filasnc;
        Integer filaxnc = 1;
        Deb.consola(".run(): numero Notascredito: " + listaNotaCreditoGenaradas.size());
        for (NotaCredito n : listaNotaCreditoGenaradas) {
            filasnc = hojanc.createRow(filaxnc);
            filasnc.createCell(0).setCellValue(n.getRazonSocial());
            filasnc.createCell(1).setCellValue(n.getNombreComercial());
            filasnc.createCell(2).setCellValue(n.getRUC());
            filasnc.createCell(3).setCellValue(n.getFechaEmision());
            //   String fecha = n.get.getFechaAutorizacion().substring(0, 10);
            String fecha = n.getAuthDate().substring(0, 10);
            filasnc.createCell(4).setCellValue(fecha);
            filasnc.createCell(5).setCellValue(n.getClaveAcceso());
            filasnc.createCell(6).setCellValue(n.getCodDoc());
            filasnc.createCell(7).setCellValue(n.getEstab().concat(n.getPtoEmi().toString()));
            filasnc.createCell(8).setCellValue(n.getSecuencia().toString());
            //filas.createCell(3).setCellValue(f.getSecuencia());

            /*NUMERO*/
            filasnc.createCell(9).setCellStyle(cellstyle);
            filasnc.createCell(9).setCellValue(n.getTotalSinImpuestos());
            /*NUMERO*/
            filasnc.createCell(10).setCellStyle(cellstyle);
            filasnc.createCell(10).setCellValue(n.getTotalDescuento());

            //////////SUBTOTALL 12 Y 0
            for (int i = 0; i < n.getTotalConImpuestos().size(); i++) {
                TotalConImpuestos e = n.getTotalConImpuestos().elementAt(i);
                if (e.getCodigoPorcentaje() == 2) {
                    ///base IVA 12
                    filasnc.createCell(12).setCellStyle(cellstyle);
                    filasnc.createCell(12).setCellValue(e.getBaseImponible());
                    //VALOR IVA 12
                    filasnc.createCell(13).setCellStyle(cellstyle);
                    filasnc.createCell(13).setCellValue(e.getValor());
                } else {
                    filasnc.createCell(8).setCellStyle(cellstyle);
                    filasnc.createCell(8).setCellValue(0.00);
                }
                if (e.getCodigoPorcentaje() == 0) {
                    filasnc.createCell(11).setCellStyle(cellstyle);
                    filasnc.createCell(11).setCellValue(e.getBaseImponible());
                }
                
            }
            
            filasnc.createCell(14).setCellValue(n.getImporteTotal());
            filaxnc++;
        }
        ////////RETENCIONES           
        String[] titulosre
                = {"razonSocial EMISOR".toUpperCase(), "nombreComercial EMISOR".toUpperCase(), "RUC EMISOR",
                    "FEC_EMISION", "FECHA AUT", "CLAVE_ACCESO", "COD. DOC", "SERIE", "SECUENCIAL", "RUC RECEPTOR".toUpperCase(),
                    "NOMBRE RECEPTOR".toUpperCase(), "COD. DOC.".toUpperCase(), "NUM.DOC".toUpperCase(), "FECHA EMI.", "PERIODO FISCAL", "BASE IMP", "IMPUESTO",
                    "% RETENCION", "VALOR"};
        
        XSSFSheet hojare = crecarHojaExcel(workbook, "RETENCIONES", titulosre);
        
        hojare.setColumnWidth(2, 3700);///pongo ancho de la columan 
        hojare.setColumnWidth(3, 2800);///pongo ancho de la columan 
        hojare.setColumnWidth(4, 2800);///pongo ancho de la columan 
        hojare.setColumnWidth(5, 13000);///pongo ancho de la columan 
        hojare.setColumnWidth(6, 1500);///pongo ancho de la columan 
        hojare.setColumnWidth(7, 2800);///pongo ancho de la columan 
        hojare.setColumnWidth(8, 3000);///pongo ancho de la columan 
        hojare.setColumnWidth(9, 3500);///pongo ancho de la columan 
        hojare.setColumnWidth(10, 9000);///pongo ancho de la columan 
        hojare.setColumnWidth(11, 1000);///pongo ancho de la columan 
        hojare.setColumnWidth(12, 3600);///pongo ancho de la columan 
        hojare.setColumnWidth(13, 3000);///pongo ancho de la columan 
        hojare.setColumnWidth(14, 3000);///pongo ancho de la columan 
        hojare.setColumnWidth(15, 3000);///pongo ancho de la columan 
        hojare.setColumnWidth(16, 3000);///pongo ancho de la columan 
        hojare.setColumnWidth(17, 3000);///pongo ancho de la columan 
        hojare.setColumnWidth(18, 3000);///pongo ancho de la columan 

        XSSFRow filasre;
        Integer filaxre = 1;
        Deb.consola(".run(): numero retenciones: " + listaRetencionesGenaradas.size());
        for (Retencion r : listaRetencionesGenaradas) {
            filasre = hojare.createRow(filaxre);
            filasre.createCell(0).setCellValue(r.getRazonSocial());
            filasre.createCell(1).setCellValue(r.getNombreComercial());
            filasre.createCell(2).setCellValue(r.getRUC());
            filasre.createCell(3).setCellValue(r.getFechaEmision());
            //   String fecha = n.get.getFechaAutorizacion().substring(0, 10);
            String fecha = r.getAuthDate().substring(0, 10);
            filasre.createCell(4).setCellValue(fecha);
            filasre.createCell(5).setCellValue(r.getClaveAcceso());
            filasre.createCell(6).setCellValue(r.getCodDoc());
            filasre.createCell(7).setCellValue(r.getEstab().concat(r.getPtoEmi().toString()));
            filasre.createCell(8).setCellValue(r.getSecuencia().toString());
            //filas.createCell(3).setCellValue(f.getSecuencia());

            /*NUMERO*/
            //filasre.createCell(9).setCellStyle(cellstyle);
            filasre.createCell(9).setCellValue(r.getIdentificacionSujetoRetenido());
            /*NUMERO*/
            // filasre.createCell(10).setCellStyle(cellstyle);
            filasre.createCell(10).setCellValue(r.getRazonSocialSujetoRetenido());

            //////////SUBTOTALL 12 Y 0
            Integer tamanolistaretenciones = r.getImpuesto().size();
            Double sumtatotalRetencion = 0.00;
            for (int i = 0; i < tamanolistaretenciones; i++) {
                Impuesto e = r.getImpuesto().elementAt(i);
                filasre.createCell(11).setCellStyle(cellstyle);
                filasre.createCell(11).setCellValue(e.getCodDocSustento());
                filasre.createCell(12).setCellStyle(cellstyle);
                filasre.createCell(12).setCellValue(e.getNumDocSustento());
                filasre.createCell(13).setCellStyle(cellstyle);
                filasre.createCell(13).setCellValue(e.getFechaEmisionDocSustento());
                filasre.createCell(14).setCellStyle(cellstyle);
                filasre.createCell(14).setCellValue(r.getPeriodoFiscal());
                filasre.createCell(15).setCellStyle(cellstyle);
                filasre.createCell(15).setCellValue(e.getBaseImponible());
                Integer codigo = e.getCodigo();
                if (codigo == 1) {
                    // filasre.createCell(16).setCellStyle(cellstyle);
                    filasre.createCell(16).setCellValue("RENTA");
                }
                if (codigo == 2) {
                    //   filasre.createCell(16).setCellStyle(cellstyle);
                    filasre.createCell(16).setCellValue("IVA");
                }
                
                filasre.createCell(17).setCellStyle(cellstyle);
                filasre.createCell(17).setCellValue(e.getPorcentajeRetener());
                filasre.createCell(18).setCellStyle(cellstyle);
                filasre.createCell(18).setCellValue(e.getValorRetenido());
                sumtatotalRetencion = sumtatotalRetencion + e.getValorRetenido();
                if (tamanolistaretenciones > 1) {
                    filaxre++;
                    filasre = hojare.createRow(filaxre);
                }
            }
            filaxre++;
         //   cellstyle.setFillForegroundColor(new XSSFColor(new java.awt.Color(255, 255, 0)));
            cellstyle.setFillPattern(FillPatternType.ALT_BARS);
            filasre.createCell(18).setCellStyle(cellstyle);
            filasre.createCell(18).setCellValue(sumtatotalRetencion);
            // XSSFCellStyle cellstylere= ;
//                 HSSFCellStyle style = workbook.createCellStyle()
//style.setFillForegroundColor(HSSFColor.YELLOW.index)
//style.setFillPattern((short) FillPatternType.SOLID_FOREGROUND.ordinal())

        }
        try {
            //    listaFacturasGenaradas.clear();
            listaNotaCreditoGenaradas.clear();
            listaNotaDebitoGenaradas.clear();
            listaRetencionesGenaradas.clear();
            Integer numero = (int) (Math.random() * 12152135 + 5656532);
            String file = Config.AUTORIZADOS_DIR + "Reporte" + numero + ".xlsx";
            workbook.write(new FileOutputStream(new File(file)));
            
            Runtime.getRuntime().exec("cmd /c start " + file);
        } catch (Exception e) {
            Deb.consola(".run()" + e.toString());
            
        }
        
    }
    
    public static void exportxml() {
        
        Thread t = new Thread() {
            
            @Override
            public void run() {
                
                XSSFWorkbook workbook = new XSSFWorkbook();
                XSSFSheet hojaFac = workbook.createSheet("FACTURAS");
                XSSFRow filafc = hojaFac.createRow(0);
                
                hojaFac.setColumnWidth(0, 10000);
                XSSFCellStyle cellstyle = workbook.createCellStyle();
                CreationHelper ch = workbook.getCreationHelper();
                cellstyle.setDataFormat(ch.createDataFormat().getFormat("#,##0.00;\\-#,##0.00"));
                //cellstyle.setDataFormat((short)8);

                filafc.createCell(0).setCellValue("RAZON SOCIAL");
                filafc.setHeightInPoints(23);
                filafc.createCell(1).setCellValue("RAZON SOCIAL COMPRADOR");
                filafc.createCell(2).setCellValue("DIRECCION MATRIZ");
                filafc.createCell(3).setCellValue("IMPORTE TOTAL");
                XSSFRow filasfc;
                Integer filaxfc = 1;
                Deb.consola(".run(): numero factiras: " + listaFacturasGenaradas.size());
                for (Factura f : listaFacturasGenaradas) {
                    filasfc = hojaFac.createRow(filaxfc);
                    filasfc.createCell(0).setCellValue(f.getRazonSocial());
                    filasfc.createCell(1).setCellValue(f.getRazonSocialComprador());
                    filasfc.createCell(2).setCellValue(f.getDirMatriz());
                    System.err.println("IMPORTE TOTAL: " + f.getImporteTotal());
                    filasfc.createCell(3).setCellStyle(cellstyle);
                    filasfc.createCell(3).setCellValue(f.getImporteTotal());
                    filaxfc++;
                }
                ////////notas de credigo
                XSSFSheet hojanc = workbook.createSheet("NOTAS DE CREDITO");
                
                XSSFRow filanc = hojanc.createRow(0);
                
                filanc.createCell(0).setCellValue("RAZON SOCIAL");
                filanc.setHeightInPoints(23);
                filanc.createCell(1).setCellValue("RAZON SOCIAL COMPRADOR");
                filanc.createCell(2).setCellValue("DIRECCION MATRIZ");
                XSSFRow filasnc;
                Integer filaxnc = 1;
                Deb.consola(".run(): numero Notascredito: " + listaNotaCreditoGenaradas.size());
                for (NotaCredito n : listaNotaCreditoGenaradas) {
                    filasnc = hojanc.createRow(filaxnc);
                    filasnc.createCell(0).setCellValue(n.getRazonSocial());
                    filasnc.createCell(1).setCellValue(n.getRazonSocialComprador());
                    filasnc.createCell(2).setCellValue(n.getDirMatriz());
                    filaxnc++;
                }
                ////////RETENCIONES           

                XSSFSheet hojare = workbook.createSheet("RETENCIONES");
                hojare.setColumnWidth(0, 10000);
                XSSFCellStyle cellstylef = workbook.createCellStyle();
                cellstylef.setDataFormat((short) 7);
                
                XSSFRow filare = hojare.createRow(0);
                filare.createCell(0).setCellValue("RAZON SOCIAL");
                filare.setHeightInPoints(23);
                filare.createCell(1).setCellValue("RAZON SOCIAL SUJETO RETENIDO");
                filare.createCell(2).setCellValue("DIRECCION MATRIZ");
                XSSFRow filasre;
                Integer filaxre = 1;
                Deb.consola(".run(): numero retenciones: " + listaRetencionesGenaradas.size());
                for (Retencion r : listaRetencionesGenaradas) {
                    filasre = hojare.createRow(filaxre);
                    filasre.createCell(0).setCellValue(r.getRazonSocial());
                    filasre.createCell(1).setCellValue(r.getRazonSocialSujetoRetenido());
                    filasre.createCell(2).setCellValue(r.getDirMatriz());
                    
                    filasre.createCell(3).setCellValue("012.5");
                    filasre.createCell(3).setCellStyle(cellstyle);
                    filaxre++;
                }
                
                try {
                    listaFacturasGenaradas.clear();
                    listaNotaCreditoGenaradas.clear();
                    listaNotaDebitoGenaradas.clear();
                    listaRetencionesGenaradas.clear();
                    String file = Config.AUTORIZADOS_DIR + "Excel.xlsx";
                    workbook.write(new FileOutputStream(new File(file)));
                    
                    Runtime.getRuntime().exec("cmd /c start " + file);
                } catch (Exception e) {
                    Deb.consola(".run()" + e.toString());
                    
                }
                
            }
        ;
        }

            ;
            t.start();
        
    }
    
    public static boolean validarSiExisteProveedor(String ruc) {
        ClientesDao cdao = new ClientesDao();
        if (cdao.buscarClienteRegistrado(ruc, 1)) {
            return true;
        } else {
            return false;
        }
        
    }
}
