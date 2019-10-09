/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import ClasesAuxiliares.DaoEmpresaImpl;
import Controlador.Coneccion;
import Modelo.DetalleFactura;
import Modelo.Facturas;
import Modelo.Tickets;
import Modelo.Usuarios;
import Vista.Principal;
import Vista.Usuarios.Crear_Facturas;
import static Vista.Usuarios.Crear_Facturas.tipoDocumento;
import static Vista.Usuarios.Crear_Facturas.txt_cedula;
import static Vista.Usuarios.Crear_Facturas.txt_celular;
import static Vista.Usuarios.Crear_Facturas.txt_dir;
import static Vista.Usuarios.Crear_Facturas.txt_nombres;
import Vista.Usuarios.rep;
import Vlidaciones.ProgressBar;
import impresoras.ServicioDeImpresion;
import java.awt.BorderLayout;
import java.net.URL;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
            System.out.println("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()empez la impresionnnn");
            // String rutaInforme = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\Ticket.jasper";
            // Map parametros = new HashMap();
            //parametros.put("numeroFactura", secuenciaFac);                        
            System.out.println("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()secuencia :" + parametros);
            System.out.println("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()rurainorme :" + rutaInforme);

            JasperPrint informe = JasperFillManager.fillReport(rutaInforme, parametros, this.getCnx());
            JasperViewer jv = new JasperViewer(informe, false);
            //  JasperPrintManager.printReport(informe, true);
            jv.setVisible(true);
        } catch (JRException ex) {
            System.out.println("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()" + ex);
            //   Logger.getLogger(Crear_Facturas.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.cerrar();
        }
    }

    public void impresionShowReport(Map parametros, String rutaInforme) {
        try {

            this.conectar();
            System.out.println("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()empez la impresionnnn");
            // String rutaInforme = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\Ticket.jasper";
            // Map parametros = new HashMap();
            //parametros.put("numeroFactura", secuenciaFac);                        
            System.out.println("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()secuencia :" + parametros);
            JasperPrint informe = JasperFillManager.fillReport(rutaInforme, parametros, this.getCnx());
            JasperViewer jv = new JasperViewer(informe, false);
            JasperPrintManager.printReport(informe, true);
            jv.setVisible(true);
        } catch (JRException ex) {
            System.out.println("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()" + ex);
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
            System.out.println("Controlador.Usuarios.ImpresionDao.impresionzZebra(): "+ex);
        }

}
    public void impresionEnTirillasFaturas(String secuenca) {

        ////////////
        ServicioDeImpresion imprime = new ServicioDeImpresion();
        PrintService jb = imprime.getJobPrinter();

        ResultSet rs;
        Tickets u = new Tickets();
        try {
            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall("SELECT u.Nombres AS usuario, c.Cedula AS ruc, c.Nombres AS cliente ,c.Direccion,c.Telefono,c.Celular, t.*,dt.* FROM usuarios u  INNER JOIN clientes c INNER JOIN tickets t INNER JOIN detalleticket dt ON( t.Codigo=dt.ticket_Codigo ) WHERE (t.secuencia=" + secuenca + " AND t.Usuarios_Codigo=u.codigo ) AND t.Clientes_codigo=c.codigo");
            rs = st.executeQuery();
            for (int i = 0; i < Integer.parseInt(Principal.numerovecseimpresionFactura); i++) {
                int a = 1;

                while (rs.next()) {
                    if (a == 1) {
//////////IMPRIME ENCABEZADO//////
                        String nombreEm = imprime.centrarTexto(login.nombreEmpresa, 40);
                        imprime.imprimirGenerico(nombreEm, jb);
                        String tipo = imprime.centrarTexto(rs.getString("tipo_documento"), 40);
                        imprime.imprimirGenerico(tipo, jb);
                        imprime.imprimirGenerico("RUC: " + login.rucEmpresa, jb);
                        imprime.imprimirGenerico("TELEFONOS: " + login.telefonoEmpresa, jb);
                        imprime.imprimirGenerico("DIRECCION: " + login.direccionEmpresa, jb);
                        //imprime.imprimirGenerico("");
                        imprime.imprimirGenerico("OBLIGADO A LLEVAR CONTABILIDAD: " + login.ObligadoSiNOEmpresa, jb);
                        imprime.imprimirGenerico("", jb);

                        imprime.imprimirGenerico(rs.getString("tipo_documento") + ": " + secuenca, jb);
                        imprime.imprimirGenerico("FECHA: " + rs.getDate("fecha").toString(), jb);
                        imprime.imprimirGenerico("USUARIO: " + rs.getString("usuario"), jb);
                        imprime.imprimirGenerico("---------------------------------------", jb);
                        imprime.imprimirGenerico("CLIENTE: " + rs.getString("cliente"), jb);
                        imprime.imprimirGenerico("RUC: " + rs.getString("ruc"), jb);
                        imprime.imprimirGenerico("DIRECCION: " + rs.getString("direccion"), jb);
                        String telef = "";
                        if (rs.getString("telefono").equalsIgnoreCase("") && rs.getString("celular").equalsIgnoreCase("")) {
                            telef = "999999999";
                        } else if (rs.getString("celular").equalsIgnoreCase("")) {
                            telef = rs.getString("telefono");
                        } else {
                            telef = rs.getString("celular");
                        }
                        imprime.imprimirGenerico("TELF: " + telef, jb);
                        imprime.imprimirGenerico("---------------------------------------", jb);
                        //   System.out.println("numero de filas: " + jTable1.getRowCount());

                        int tamano = 25;
                        String detalle = "";
                        ////////////                

                    }
                    a++;
                    Integer tamano = 25;
                    String cantidad = rs.getString("cantidad").toString();
                    String pu = rs.getString("valorUnitario").toString();
                    String pt = rs.getString("valortotal").toString();
                    if ((cantidad.length() > 2 && cantidad.length() < 4) || (pu.length() > 6)) {
                        tamano = 21;
                    }
                    String detalle = rs.getString("detalle").toString();
                    while (detalle.length() < 25) {
                        detalle = detalle.concat(" ");
                    }
                    imprime.imprimirGenerico(
                            cantidad + " "
                            + imprime.recortar(detalle, tamano) + " " + pu + "  " + pt, jb);
                }
                if (a == 1) {
                    imprime.imprimirGenerico("---------------------------------------", jb);
                    imprime.imprimirGenerico("SUBTOTAL:                      " + rs.getString("subtotal_sin_iva"), jb);
                    imprime.imprimirGenerico("SUBTOTAL 12%:                  " + rs.getString("subtotaI_con_iva"), jb);
                    imprime.imprimirGenerico("IVA 12%:                       " + rs.getString("iva_valor"), jb);
                    imprime.imprimirGenerico("TOTAL A CANCELAR:              " + rs.getString("total"), jb);
                    imprime.imprimirGenerico("", jb);
                    imprime.imprimirGenerico("---------GRACIAS POR PREFERIRNOS-----------", jb);
                    imprime.imprimirGenerico("", jb);
                    imprime.imprimirGenerico("", jb);
                    imprime.imprimirGenerico("", jb);
                    imprime.imprimirGenerico("", jb);
                    imprime.imprimirGenerico("", jb);
                    imprime.imprimirGenerico("", jb);

                }
                a++;
                rs.beforeFirst();
            }
        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConId() impresionticketssszzzdda" + ex);
        } finally {
            this.cerrar();
        }
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
            System.out.println("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()empez la impresionnnn");
            // String rutaInforme = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\Ticket.jasper";
            // Map parametros = new HashMap();
            //parametros.put("numeroFactura", secuenciaFac);                        
            System.out.println("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()secuencia :" + parametros);
            JasperPrint informe = JasperFillManager.fillReport(rutaInforme, parametros, this.getCnx());
            //JasperViewer jv = new JasperViewer(informe, false);
            //JasperPrintManager.printReport(informe, false);
            for (int i = 0; i < Integer.parseInt(Principal.numerovecseimpresionFactura); i++) {
                //se manda a la impresora
                JRPrintServiceExporter jrprintServiceExporter = new JRPrintServiceExporter();
                jrprintServiceExporter.setParameter(JRExporterParameter.JASPER_PRINT, informe);
                jrprintServiceExporter.setParameter(JRPrintServiceExporterParameter.PRINT_SERVICE, jb);
                jrprintServiceExporter.setParameter(JRPrintServiceExporterParameter.DISPLAY_PRINT_DIALOG, Boolean.FALSE);
                jrprintServiceExporter.exportReport();
            }

        } catch (JRException ex) {
            System.out.println("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()" + ex);
            //   Logger.getLogger(Crear_Facturas.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.cerrar();
        }
    }

    public void ExportPDF(Map parametros, String rutaInforme) {
        try {

            this.conectar();
            System.out.println("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()empez la impresionnnn");
            // String rutaInforme = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\Ticket.jasper";
            // Map parametros = new HashMap();
            //parametros.put("numeroFactura", secuenciaFac);                        
            System.out.println("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()secuencia :" + parametros);
            JasperPrint informe = JasperFillManager.fillReport(rutaInforme, parametros, this.getCnx());
            JasperExportManager.exportReportToPdfFile(informe, "src/prueba.pdf");
            //JasperExportManager.exportRepor(informe, "src/prueba.html");

//            JasperViewer jv = new JasperViewer(informe,false);
//            JasperPrintManager.printReport(informe, false);
//            jv.setVisible(true);
        } catch (JRException ex) {
            System.out.println("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()" + ex);
            //   Logger.getLogger(Crear_Facturas.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.cerrar();
        }
    }

    public void ExportHtml(Map parametros, String rutaInforme) {
        try {

            this.conectar();
            System.out.println("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()empez la impresionnnn");
            // String rutaInforme = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\Ticket.jasper";
            // Map parametros = new HashMap();
            //parametros.put("numeroFactura", secuenciaFac);                        
            System.out.println("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()secuencia :" + parametros);
            JasperPrint informe = JasperFillManager.fillReport(rutaInforme, parametros, this.getCnx());
            JasperExportManager.exportReportToHtmlFile(informe, "src/prueba2.html");
            //JasperExportManager.exportRepor(informe, "src/prueba.html");

//            JasperViewer jv = new JasperViewer(informe,false);
//            JasperPrintManager.printReport(informe, false);
//            jv.setVisible(true);
        } catch (JRException ex) {
            System.out.println("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()" + ex);
            //   Logger.getLogger(Crear_Facturas.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.cerrar();
        }
    }

}
