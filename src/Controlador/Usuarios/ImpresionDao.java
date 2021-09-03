/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import ClasesAuxiliares.DaoEmpresaImpl;
import ClasesAuxiliares.debug.Deb;
import Controlador.Coneccion;
import Modelo.Clientes;
import Modelo.DetalleFactura;
import Modelo.Facturas;
import Modelo.Tickets;
import Modelo.Usuarios;
import Vista.Principal;
import Vista.Usuarios.Crear_Productos;
import static Vista.Usuarios.Modal_CrearFacturas.tipoDocumento;
import static Vista.Usuarios.Modal_CrearFacturas.txt_cedula;
import static Vista.Usuarios.Modal_CrearFacturas.txt_celular;
import static Vista.Usuarios.Modal_CrearFacturas.txt_dir;
import static Vista.Usuarios.Modal_CrearFacturas.txt_nombres;
import Vista.Usuarios.Modal_CrearFacturas;
import Vista.Usuarios.rep;
import Vlidaciones.ProgressBar;
import impresoras.ServicioDeImpresion;
import java.awt.BorderLayout;
import java.net.URL;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.scene.layout.Pane;
import javax.print.Doc;
import javax.print.DocPrintJob;
import javax.print.PrintException;
import javax.print.PrintService;
import javax.print.SimpleDoc;
import javax.swing.JFrame;
import javax.swing.JInternalFrame;
import javax.swing.JPanel;
import login.login;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRPrintServiceExporter;
import net.sf.jasperreports.engine.export.JRPrintServiceExporterParameter;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JRViewer;
import net.sf.jasperreports.view.JasperViewer;

/**
 *
 * @author USUARIO
 */
public class ImpresionDao extends Coneccion {

    ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");

//    public  JPanel getdetallesmovimiento(Map parametros, String rutaInforme) {
//        JPanel jpContainer = new JPanel();
//        try {
//            //archivo jasper
//          //  URL jasperUrl = this.getClass().getResource(rutaInforme);
//          //  JasperReport report = (JasperReport) JRLoader.loadObject(jasperUrl);
//
//            JasperPrint jasperPrint = JasperFillManager.fillReport(rutaInforme, parametros, this.getCnx());
//            //se crea el visor con el reporte
//            JRViewer jRViewer = new JRViewer(jasperPrint);
//            //se elimina elementos del contenedor JPanel
//            jpContainer.removeAll();
//            //para el tamaño del reporte se agrega un BorderLayout
//            jpContainer.setLayout(new BorderLayout());
//            jpContainer.add(jRViewer, BorderLayout.CENTER);
//            jRViewer.setVisible(true);
//            jpContainer.repaint();
//            jpContainer.revalidate();
//        } catch (JRException ex) {
//            System.err.println(ex.getMessage());
//        }
//        return jpContainer;
//    }
    public void getShowReport(Map parametros, String rutaInforme) {
        try {

            this.conectar();
            Deb.consola("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()empez la impresionnnn");
            // String rutaInforme = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\Ticket.jasper";
            // Map parametros = new HashMap();
            //parametros.put("numeroFactura", secuenciaFac);                        
            Deb.consola("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()secuencia :" + parametros);
            Deb.consola("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()rurainorme :" + rutaInforme);

            JasperPrint informe = JasperFillManager.fillReport(rutaInforme, parametros, this.getCnx());
            JasperViewer jv = new JasperViewer(informe, false);
            //  JasperPrintManager.printReport(informe, true);
            jv.setVisible(true);
        } catch (JRException ex) {
            Deb.consola("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()" + ex);
            //   Logger.getLogger(Crear_Facturas.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.cerrar();
        }
    }

    public void impresionShowReport(Map parametros, String rutaInforme) {
        try {

            this.conectar();
            Deb.consola("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()empez la impresionnnn");
            // String rutaInforme = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\Ticket.jasper";
            // Map parametros = new HashMap();
            //parametros.put("numeroFactura", secuenciaFac);                        
            Deb.consola("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()secuencia :" + parametros);
            JasperPrint informe = JasperFillManager.fillReport(rutaInforme, parametros, this.getCnx());
            JasperViewer jv = new JasperViewer(informe, false);
            JasperPrintManager.printReport(informe, true);
            jv.setVisible(true);
        } catch (JRException ex) {
            Deb.consola("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()" + ex);
            //   Logger.getLogger(Crear_Facturas.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.cerrar();
        }
    }

    public void impresionzZebra(Doc doc) {
        try {
            ServicioDeImpresion imprime = new ServicioDeImpresion();
            PrintService jb = imprime.getJobPrinter();
            DocPrintJob job = jb.createPrintJob();
            job.print(doc, null);
        } catch (PrintException ex) {
            Logger.getLogger(ImpresionDao.class.getName()).log(Level.SEVERE, null, ex);
            Deb.consola("Controlador.Usuarios.ImpresionDao.impresionzZebra(): " + ex);
        }

    }

    public ResultSet geteresulset(String secuenca) {
        ResultSet rs = null;

        PreparedStatement st = null;
        try {
            this.conectar();
            st = this.getCnx().prepareCall("SELECT u.Nombres AS usuario, c.Cedula AS ruc, c.Nombres AS cliente ,c.Direccion,c.Telefono,c.Celular, t.*,dt.* FROM usuarios u  INNER JOIN clientes c INNER JOIN facturaS t INNER JOIN detallefactura dt ON( t.Codigo=dt.Factura_Codigo ) WHERE (t.secuencia='" + secuenca + "' AND t.Usuarios_Codigo=u.codigo AND t.tipo_documento=\"FACTURA\" ) AND t.Clientes_codigo=c.codigo");
            rs = st.executeQuery();
        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConId() impresionticketssxdfsdfsdfeeeeszzzdda" + ex);
        } finally {
            this.cerrar();
        }

        return rs;
    }

    // public void setProgressBar_mensajae(String mensaje) {
    public void impresionEnTirillasFaturas(String secuenca) {
        Thread t = new Thread() {
            public void run() {
                String subtotalsinIVA = "";
                String subtotalConIVA = "";
                String IVAValor = "";
                String Total = "";
                ////////////
                ServicioDeImpresion imprime = new ServicioDeImpresion();
                PrintService jb = imprime.getJobPrinter();

                ResultSet rs = null;

                Facturas f = new Facturas();
                FacturasDao facdao = new FacturasDao();
                f = facdao.buscarXSecuancia(secuenca);
                List<DetalleFactura> df;
                DetalleFacturaDao dfDao = new DetalleFacturaDao();
                df = dfDao.buscarConIDFact(f.getCodigo());
                ClientesDao cl = new ClientesDao();
                Clientes c = new Clientes();
                c = cl.buscarConID(f.getClientes_codigo());
                Usuarios u = new Usuarios();
                UsuariosDao udao = new UsuariosDao();
                u = udao.buscarConID(f.getUsuarios_Codigo());
                rs = geteresulset(equipo);// st.executeQuery();
                for (int i = 0; i < Integer.parseInt(Principal.numerovecseimpresionFactura); i++) {
                    int a = 1;

                    for (DetalleFactura d : df) {
                        if (a == 1) {
//////////IMPRIME ENCABEZADO//////
                            String nombreEm = imprime.centrarTexto(login.nombreEmpresa, 40);
                            imprime.imprimirGenerico(nombreEm, jb);
                            String tipo = imprime.centrarTexto(f.getTipo_documento(), 40);
                            imprime.imprimirGenerico(tipo, jb);
                            imprime.imprimirGenerico("RUC: " + login.rucEmpresa, jb);
                            imprime.imprimirGenerico("TELEFONOS: " + login.telefonoEmpresa, jb);
                            imprime.imprimirGenerico("DIRECCION: " + login.direccionEmpresa, jb);
//imprime.imprimirGenerico("");
                            imprime.imprimirGenerico("OBLIGADO A LLEVAR CONTABILIDAD: " + login.ObligadoSiNOEmpresa, jb);
                            imprime.imprimirGenerico("", jb);

                            imprime.imprimirGenerico(f.getTipo_documento() + ": " + secuenca, jb);
                            imprime.imprimirGenerico("FECHA: " + f.getFechain(), jb);
                            imprime.imprimirGenerico("USUARIO: " + u.getNombre(), jb);
                            imprime.imprimirGenerico("---------------------------------------", jb);
                            imprime.imprimirGenerico("CLIENTE: " + c.getNombre(), jb);
                            imprime.imprimirGenerico("RUC: " + c.getCedula(), jb);
                            imprime.imprimirGenerico("DIRECCION: " + c.getDireccion(), jb);
                            String telef = "";
                            if (c.getCelular().equalsIgnoreCase("") && c.getTelefono().equalsIgnoreCase("")) {
                                telef = "999999999";
                            } else if (c.getTelefono().equalsIgnoreCase("")) {
                                telef = c.getTelefono();
                            } else {
                                telef = c.getCelular();
                            }
                            imprime.imprimirGenerico("TELF: " + telef, jb);
                            imprime.imprimirGenerico("---------------------------------------", jb);
//   Deb.consola("numero de filas: " + jTable1.getRowCount());

                            String detalle = "";
////////////                

                        }
                        //   a++;
                        Integer tamano = null;
                        try {
                            tamano = Integer.parseInt(Principal.anchoimpresionticket);
                        } catch (Exception e) {

                            Deb.consola("Controlador.Usuarios.ImpresionDao.impresionEnTirillasFaturas()sssErrorx TAMANO IMPRESION: " + tamano);
                            Deb.consola("Controlador.Usuarios.ImpresionDao.impresionEnTirillasFaturas()sssErrorx TAMANO IMPRESION: " + tamano);
                        }

                        String cantidad = d.getCantidad().toString();
                        String pu = d.getValorUnitario().toString();
                        String pt = d.getValorTotal();
                        subtotalsinIVA = f.getSubtotal_sin_iva();
                        subtotalConIVA = f.getSubtotaI_con_iva();
                        IVAValor = f.getIva_valor();
                        Total = f.getTotal();
                        Integer tamanototalpermitido = 40;
                        Integer sumachar = 0;
                        Integer cant = cantidad.length();
                        Integer pux = pu.length();
                        Integer ptx = pt.length();
                        String detalle = d.getDetalle();
                        Integer detallex = detalle.length();
                        Integer espaciosadd = 0;
                        Integer numerostamano = 0;

                        sumachar = detallex + cant + pux + ptx + 3;
                        numerostamano = pux + ptx + cant;

                        if (sumachar < 40) {
                            
                            espaciosadd = 40 - sumachar;
                        } else {
                            
                        }
                        imprime.imprimirGenerico(
                                Double.parseDouble(cantidad) + 
                                        imprime.recortar(detalle, 23) + "  " + pu + "  " + pt, jb);

                        a++;
                    }
                    //imprime.imprimirGenerico("1234567890qwertyuiopasdfghjklzxcvbnm1234567890", jb);
                    //imprime.imprimirGenerico("1234567890QWERTYUIOPASDFGHJKLZXCVBNM1234567890", jb);
                    imprime.imprimirGenerico("---------------------------------------", jb);
                    imprime.imprimirGenerico("SUBTOTAL:                      " + subtotalsinIVA, jb);
                    imprime.imprimirGenerico("SUBTOTAL " + Principal.iva + "%:                  " + subtotalConIVA, jb);
                    imprime.imprimirGenerico("IVA " + Principal.iva + "%:                       " + IVAValor, jb);
                    imprime.imprimirGenerico("TOTAL A CANCELAR:              " + Total, jb);
                    imprime.imprimirGenerico("", jb);
                    imprime.imprimirGenerico("---------GRACIAS POR PREFERIRNOS-----------", jb);
                    imprime.imprimirGenerico("", jb);
                    imprime.imprimirGenerico("", jb);
                    imprime.imprimirGenerico("", jb);
                    imprime.imprimirGenerico("", jb);
                    imprime.imprimirGenerico("", jb);
                    imprime.imprimirGenerico("", jb);

                }

            }

        };
        t.start();
    }

    public void impresionDontShowReport(Map parametros, String rutaInforme) {
        try {
            String impresoraConfigurada = "";

            if (Principal.facturatiriiasoGrande.equalsIgnoreCase("ROLLO")) {
                impresoraConfigurada = Principal.impresoraTicket;
            } else {
                impresoraConfigurada = Principal.impresoraFactura;
            }

            ServicioDeImpresion imprime = new ServicioDeImpresion();
            PrintService jb = imprime.getJobPrinterImpresoraDefinida(impresoraConfigurada);

            this.conectar();
            Deb.consola("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()empez la impresionnnn");
            // String rutaInforme = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\Ticket.jasper";
            // Map parametros = new HashMap();
            //parametros.put("numeroFactura", secuenciaFac);                        
            Deb.consola("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()secuencia :" + parametros);
            JasperPrint informe = JasperFillManager.fillReport(rutaInforme, parametros, this.getCnx());
            //JasperViewer jv = new JasperViewer(informe, false);
            //JasperPrintManager.printReport(informe, false);
            for (int i = 0; i < Integer.parseInt(Principal.numerovecseimpresionFactura); i++) {

                JRPrintServiceExporter jrprintServiceExporter = new JRPrintServiceExporter();
                jrprintServiceExporter.setParameter(JRExporterParameter.JASPER_PRINT, informe);
                jrprintServiceExporter.setParameter(JRPrintServiceExporterParameter.PRINT_SERVICE, jb);
                jrprintServiceExporter.setParameter(JRPrintServiceExporterParameter.DISPLAY_PRINT_DIALOG, Boolean.TRUE);
                jrprintServiceExporter.exportReport();
            }

        } catch (JRException ex) {
            Deb.consola("Errora impresionx" + ex);
            //   Logger.getLogger(Crear_Facturas.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.cerrar();
        }
    }

    public void ExportPDF(Map parametros, String rutaInforme) {
        try {

            this.conectar();
            Deb.consola("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()empez la impresionnnn");
            // String rutaInforme = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\Ticket.jasper";
            // Map parametros = new HashMap();
            //parametros.put("numeroFactura", secuenciaFac);                        
            Deb.consola("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()secuencia :" + parametros);
            JasperPrint informe = JasperFillManager.fillReport(rutaInforme, parametros, this.getCnx());
            JasperExportManager.exportReportToPdfFile(informe, "src/prueba.pdf");
            //JasperExportManager.exportRepor(informe, "src/prueba.html");

//            JasperViewer jv = new JasperViewer(informe,false);
//            JasperPrintManager.printReport(informe, false);
//            jv.setVisible(true);
        } catch (JRException ex) {
            Deb.consola("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()" + ex);
            //   Logger.getLogger(Crear_Facturas.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.cerrar();
        }
    }

    public void ExportHtml(Map parametros, String rutaInforme) {
        try {

            this.conectar();
            Deb.consola("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()empez la impresionnnn");
            // String rutaInforme = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\Ticket.jasper";
            // Map parametros = new HashMap();
            //parametros.put("numeroFactura", secuenciaFac);                        
            Deb.consola("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()secuencia :" + parametros);
            JasperPrint informe = JasperFillManager.fillReport(rutaInforme, parametros, this.getCnx());
            JasperExportManager.exportReportToHtmlFile(informe, "src/prueba2.html");
            //JasperExportManager.exportRepor(informe, "src/prueba.html");

//            JasperViewer jv = new JasperViewer(informe,false);
//            JasperPrintManager.printReport(informe, false);
//            jv.setVisible(true);
        } catch (JRException ex) {
            Deb.consola("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()" + ex);
            //   Logger.getLogger(Crear_Facturas.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.cerrar();
        }
    }

}
