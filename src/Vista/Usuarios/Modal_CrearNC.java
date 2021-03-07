/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista.Usuarios;

import ClasesAuxiliares.FeCodigoNUmerico;
import ClasesAuxiliares.Leertxt;
import ClasesAuxiliares.NewSql.Forms.OperacionesForms;
import ClasesAuxiliares.NullValidator;
import ClasesAuxiliares.Variables;
import ClasesAuxiliares.debug.Deb;
import ClasesAuxiliares.loadconfig;
import ClasesAuxiliares.tablas.SetRenderJTableCXC;
import Controlador.ComitsAll;
import Controlador.Coneccion;
import Controlador.Ejemplo;
import Controlador.Usuarios.AnticiposDao;
import Controlador.Usuarios.CajasDetalleDao;
import Controlador.Usuarios.ClientesDao;
import Controlador.Usuarios.DetalleFacturaDao;
import Controlador.Usuarios.DetalleProformaDao;
import Controlador.Usuarios.DetalleTicketDao;
import Controlador.Usuarios.EquiposDao;
import Controlador.Usuarios.FacturasDao;
import Controlador.Usuarios.FormasPagoVDao;
import Controlador.Usuarios.UsuariosDao;
import Modelo.Clientes;
import Modelo.Usuarios;
import Vista.Principal;
import static Vista.Principal.desktopPane;
import Controlador.Usuarios.HoraFecha;
import Controlador.Usuarios.ImpresionDao;
import Controlador.Usuarios.KardexDao;
import Controlador.Usuarios.PagosDao;
import Controlador.Usuarios.ProductosDao;
import Controlador.Usuarios.cxcDao;
import Controlador.Usuarios.ProformasDao;
import Controlador.Usuarios.SeriesFacturasDao;
import Controlador.Usuarios.TicketsDao;
import Modelo.Anticipos;
import Modelo.Bodegas;
import Modelo.CajasDetalle;
import Modelo.DetalleFactura;
import Modelo.DetalleProforma;
import Modelo.DetalleTicket;
import Modelo.Equipos;
import Modelo.Facturas;
import Modelo.FormasPagoV;
import Modelo.Kardex;
import Modelo.Cxc;
import Modelo.Pagos;
import Modelo.Productos;
import Modelo.Proformas;
import Modelo.SeriesFacturas;
import Modelo.Tickets;
import Vista.Dialogs.PagoConCheque;
import Vista.Dialogs.PrecioTotalFacturacionXFila;
import Vista.Dialogs.PreciosProductos;
import Vlidaciones.ProgressBar;
import Vlidaciones.VaciarTexto;
import Vlidaciones.ValidaNUmeros;
import com.mxrck.autocompleter.AutoCompleterCallback;
import com.mxrck.autocompleter.TextAutoCompleter;
import com.ws.localhost.WSElectro;
import ecx.unomas.factura.Factura;
import ecx.unomas.factura.TotalImpuesto;
import login.login;
import impresoras.ServicioDeImpresion;
import java.awt.Dimension;
import java.awt.Frame;
import java.awt.Image;
import java.awt.MouseInfo;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ComponentAdapter;
import java.awt.event.ComponentEvent;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseEvent;
import java.awt.image.RescaleOp;
import java.beans.PropertyVetoException;
import java.io.File;
import java.sql.PreparedStatement;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintService;
import javax.print.SimpleDoc;
import javax.swing.DefaultListModel;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JRadioButton;
import javax.swing.JTable;
import javax.swing.ListModel;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.plaf.synth.SynthStyle;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;
import javax.swing.text.JTextComponent;

/**
 *
 * @author USUARIO
 */
public class Modal_CrearNC extends javax.swing.JInternalFrame {

    /**
     * Creates new form Crear_Facturas
     */
    //private ArrayList<Object> listaObjFacturacion = new ArrayList<Object>();
    private static List<DetalleFactura> dfNC;
    private Facturas u = new Facturas();
    public static Cxc cxc = new Cxc();
    //private Factura f = new Factura();
    // private Tickets t = new Tickets();
    // private Proformas p = new Proformas();
    private ArrayList<DetalleFactura> listaDetalleFactura = new ArrayList<DetalleFactura>();
    private ArrayList<Kardex> listaKardex = new ArrayList<Kardex>();
    public static boolean seleccionafacturadesdeNotaCredito = false;
    public static Integer idFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito = 0;
    public static String SecuanciaFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito = "";
    public static String SecuenciaFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito = "NA";
    public static String FechaFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito = "NA";
    public static String ValorAfectadoNotaCreditoFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito = "0.0";
    public static String ValorTotalFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito = "0.0";

    TextAutoCompleter clienteAutoCompleter;
    TextAutoCompleter productosAutoCompleter;
    public static CajasDetalle cd = new CajasDetalle();
    public static Integer indexPositiotoolBar;
    public static String formaPagoSeelccionada;
    public static Integer codigoFactura;
    public static Integer codigoProductoSeleccionadoClickonJTable;
    public static Double PrecioSeleccionado;
    public static Double PrecioTotalFila;
    public static Double PrecioUnitarioFila;
    public static Integer codigoClienteFactura;
    public static boolean selectPrecioExitoso = false;
    public static boolean RegistrodeCreditoExitoso = false;
    public static boolean RegistrodeEfectivoyCambioExitoso = false;
    public static boolean procedeVentaExitosa = false;
    public static boolean ValidaErrorVenta = false;
    public static boolean RegistrodeChequeExitoso = false;
    public static String claveAcceso;
    public static Double efectivo;
    public static Double cambio;
    ProgressBar a = new ProgressBar(3000, "Mensaje Inicial");
    public static Double utilidad;
    TableColumnModel columnModel;
    public static DefaultTableModel modelo = null;
    Double total = 0.0;
    Double totaliva12 = 0.0;
    Double totaliva0 = 0.0;
    Double subtotal = 0.0;
    Double subtotaliva12 = 0.0;
    Double subtotaliva0 = 0.0;
    Double iva = Double.valueOf(Principal.iva);
boolean afectakardex = false;  ///e proformas no
    public static boolean afectacaja = false; /// en cuadno es credito no
    ProgressBar msg = new ProgressBar(3000, "Mensaje Inicial");
    public static String secuenciaFac = null;
    public static Integer codigFormaPagoSeleccionada = null;
    Boolean dobleClick = false;
    // ProgressBar msg = new ProgressBar(3000, "Mensaje Inicial");
    public static String tipoDocumento = "";
    ArrayList<Usuarios> listaU = new ArrayList<Usuarios>();
    ArrayList<Clientes> listaClientes = new ArrayList<Clientes>();
    ArrayList<FormasPagoV> listaFormasDePago = new ArrayList<FormasPagoV>();
    FormasPagoV objFormasdePago = new FormasPagoV();
    //   ArrayList<DetalleFactura> listaDetFac = new ArrayList<DetalleFactura>();
    Integer codigoUsuarioVendedorSeleccionadoJCB;
    Clientes clienteseleccionadoAutocomplete = new Clientes();
//String[] registros = new String[8];

    private String getClaveAcceso() {
        /*creo el codigoAcceso*/
        String ruc = "";
        if (txt_cedula.getText().length() == 10) {
            ruc = txt_cedula.getText() + "001";
        } else if (txt_cedula.getText().length() == 13) {
            ruc = txt_cedula.getText();
        }
        /*Clave de acceso*/
        if (!Variables.FE_OBLIGADO_CONTABILIDAD.equalsIgnoreCase("NO")) {
            claveAcceso = HoraFecha.fecha_ddmmaaa(jdfecha.getDate().toString());
            claveAcceso = claveAcceso + Variables.FE_NOTA_CREDITO + login.rucEmpresa + Variables.FE_TIPO_AMBIENTE + txt_sec1.getText() + txt_sec2.getText() + txt_secNUmFac.getText() + Variables.FE_CODIGO_NUMERICO + Variables.FE_TIPO_EMISION;
            Variables.FE_DIGITO_VERIFICADOR = String.valueOf(FeCodigoNUmerico.obtenerSumaPorDigitosOK(FeCodigoNUmerico.invertirCadenaOK(claveAcceso)));
            claveAcceso = claveAcceso + Variables.FE_DIGITO_VERIFICADOR;
        }
        return claveAcceso;
    }

    private void impresionEnTirillas(Facturas u) {

        ServicioDeImpresion imprime = new ServicioDeImpresion();
        PrintService jb = imprime.getJobPrinter();

        String nombreEm = imprime.centrarTexto(login.nombreEmpresa, 40);
        imprime.imprimirGenerico(nombreEm, jb);
        String tipo = imprime.centrarTexto(tipoDocumento, 40);
        imprime.imprimirGenerico(tipo, jb);
        imprime.imprimirGenerico("RUC: " + login.rucEmpresa, jb);
        imprime.imprimirGenerico("TELEFONOS: " + login.telefonoEmpresa, jb);
        imprime.imprimirGenerico("DIRECCION: " + login.direccionEmpresa, jb);
        //imprime.imprimirGenerico("");
        imprime.imprimirGenerico("OBLIGADO A LLEVAR CONTABILIDAD: " + login.ObligadoSiNOEmpresa, jb);
        imprime.imprimirGenerico("", jb);
        imprime.imprimirGenerico(tipoDocumento + ": " + u.getSecuencia(), jb);
        imprime.imprimirGenerico("FECHA: " + u.getFecha().toString(), jb);
        imprime.imprimirGenerico("USUARIO: " + jComboBox1.getSelectedItem(), jb);
        imprime.imprimirGenerico("---------------------------------------", jb);
        imprime.imprimirGenerico("CLIENTE: " + txt_nombres.getText(), jb);
        imprime.imprimirGenerico("RUC: " + txt_cedula.getText(), jb);
        imprime.imprimirGenerico("DIRECCION: " + txt_dir.getText(), jb);
        String telef = "";
        if (txt_celular.getText().equalsIgnoreCase("")) {
            telef = "999999999";
        }
        imprime.imprimirGenerico("TELF: " + telef, jb);
        imprime.imprimirGenerico("---------------------------------------", jb);
        Deb.consola("numero de filas: " + jTable1.getRowCount());

        int tamano = 25;
        String detalle = "";

        for (int i = 0; i < jTable1.getRowCount(); i++) {
            String cantidad = jTable1.getValueAt(i, 4).toString();
            String pu = jTable1.getValueAt(i, 7).toString();
            String pt = jTable1.getValueAt(i, 8).toString();
            if ((cantidad.length() > 2 && cantidad.length() < 4) || (pu.length() > 6)) {
                tamano = 21;
            }
            detalle = jTable1.getValueAt(i, 3).toString();
            while (detalle.length() < 25) {
                detalle = detalle.concat(" ");
            }
            imprime.imprimirGenerico(
                    jTable1.getValueAt(i, 4).toString() + " "
                    + imprime.recortar(detalle, tamano) + " "
                    + jTable1.getValueAt(i, 7).toString() + "  "
                    + jTable1.getValueAt(i, 8).toString(), jb);
        }

        imprime.imprimirGenerico("---------------------------------------", jb);
        imprime.imprimirGenerico("SUBTOTAL:                      " + txt_subtotal_val.getText(), jb);
        imprime.imprimirGenerico("SUBTOTAL 12%:                  " + txt_subtotal_val.getText(), jb);
        imprime.imprimirGenerico("IVA " + Principal.iva + "%:                       " + txt_iva_valor.getText(), jb);
        imprime.imprimirGenerico("TOTAL A CANCELAR:              " + txt_total_val_grande.getText(), jb);
        imprime.imprimirGenerico("", jb);
        imprime.imprimirGenerico("---------GRACIAS POR PREFERIRNOS-----------", jb);
        imprime.imprimirGenerico("", jb);
        imprime.imprimirGenerico("", jb);
        imprime.imprimirGenerico("", jb);
        imprime.imprimirGenerico("", jb);
        imprime.imprimirGenerico("", jb);
        imprime.imprimirGenerico("", jb);
    }

    private void limpiarIntefazVentas() {
        /*
                                    limpiamos la jtable                                                                        
         */
        while (modelo.getRowCount() > 0) {
            modelo.removeRow(0);
        }
    }

    private void addOrDeleteRowTable(JTable table) {
        table.getModel().addTableModelListener(new TableModelListener() {

            @Override
            public void tableChanged(TableModelEvent e) {
                //         JOptionPane.showMessageDialog(null, "private void addOrDeleteRowTable(JTable table) xx");
                boolean esNUmero = false;
                Deb.consola(".tableChanged() addOrDeleteRowTable ssssssxxxxxxdddddxxx");
                if (e.getType() == TableModelEvent.UPDATE) {
                    int col = e.getColumn();
                    int fila = e.getFirstRow();
                    if (col == 3 || col == 4 || col == 5 || col == 7) {
                        if (!ValidaNUmeros.isOnlyDouble(jTable1.getValueAt(fila, 4).toString())) {
                            jTable1.setValueAt("1.0", fila, 4);
                        }
                        if (!ValidaNUmeros.isOnlyDouble(jTable1.getValueAt(fila, 5).toString())) {
                            jTable1.setValueAt("0.0", fila, 5);
                        }
                        if (!ValidaNUmeros.isOnlyDouble(jTable1.getValueAt(fila, 7).toString())) {
                            Double precio = Double.valueOf(modelo.getValueAt(fila, 8).toString().replace(",", "."));
                            jTable1.setValueAt(precio, fila, 7);

                        }

                        operacionFacturauPDATEandAddRowrs();
                        jTable1.setValueAt(fila, fila, 1);

                    }
                }
                if (e.getType() == TableModelEvent.INSERT) {

                    operacionFacturauPDATEandAddRowrs();

                }
                if (e.getType() == TableModelEvent.DELETE) {

                }

            }
        });

    }

    private void cellEditJtableGuardaBDDMetodoUpdate(JTable table) {
        table.addKeyListener(new KeyAdapter() {
            public void keyPressed(KeyEvent e) {
                if (e.getKeyCode() == KeyEvent.VK_ENTER) {

                    int row = table.getSelectedRow();
                    int column = table.getSelectedColumn();

                    // resul is the new value to insert in the DB
                    String resul = table.getValueAt(row, column).toString();
                    // id is the primary key of my DB
                    String id = table.getValueAt(row, 0).toString();

                    // update is my method to update. Update needs the id for
                    // the where clausule. resul is the value that will receive
                    // the cell and you need column to tell what to update.
                    //      update(id, resul, column);
                }
            }
        });
    }

    private void operacionFacturauPDATEandAddRowrs() {

        Deb.consola("Vista.Usuarios.Crear_Facturas.operacionFacturauPDATEandAddRowrs() ddddddxxxxddddddddddddddddxxxxxxxxxx:   -------->");
        try {
            utilidad = 0.0;
            total = 0.0;
            subtotal = 0.0;
            subtotaliva0 = 0.0;
            subtotaliva12 = 0.0;
            totaliva0 = 0.0;
            totaliva12 = 0.0;
            int row = jTable1.getModel().getRowCount();
            int col = jTable1.getModel().getColumnCount();
            //      Deb.consola("Add_event:  row: " + row + "  col:  " + col);
            //    JOptionPane.showMessageDialog(null, "sadasdasdasd");
            for (int i = 0; i < row; i++) {
                Deb.consola("INGRESA AL pRIMER for");
                Double cantidad = Double.valueOf(modelo.getValueAt(i, 4).toString().replace(",", "."));
                Double precio = Double.valueOf(modelo.getValueAt(i, 7).toString().replace(",", "."));
                Double descuento = Double.valueOf(modelo.getValueAt(i, 5).toString().replace(",", "."));
                //  JOptionPane.showMessageDialog(null,"++++sss: "+ modelo.getValueAt(i, 0).toString().replace(",", "."));
                Double costo = Double.valueOf(modelo.getValueAt(i, 0).toString().replace(",", "."));
                Double Ptotal = precio * cantidad;
                Double costoxFila = costo * cantidad;

                if (descuento > 0 && descuento <= 100) {
                    Ptotal = Ptotal - ((Ptotal * descuento) / 100);
                    //utilidad
                } else {

                }

                modelo.setValueAt(String.valueOf(String.format("%.3f", Ptotal)).replace(",", "."), i, 8);

                if (modelo.getValueAt(i, 10).toString().equalsIgnoreCase("0")) {
                    totaliva0 = totaliva0 + Double.valueOf(modelo.getValueAt(i, 8).toString().replace(",", "."));
                    subtotaliva0 = (totaliva0);
                } else {
                    totaliva12 = totaliva12 + Double.valueOf(modelo.getValueAt(i, 8).toString().replace(",", "."));
                    Double ivadecimal = (iva / 100) + 1;
                    subtotaliva12 = (totaliva12) / ivadecimal;
                }
                total = totaliva0 + totaliva12;
                subtotal = subtotaliva0 + subtotaliva12;

                txt_total_val_grande.setText(String.valueOf(String.format("%.2f", total)).replace(",", "."));
                txt_total_vAL_PEQ.setText(String.valueOf(String.format("%.2f", total)).replace(",", "."));

                utilidad = utilidad + (Double.valueOf(modelo.getValueAt(i, 8).toString().replace(",", ".")) - costoxFila);
                txt_utilidad.setText(String.valueOf(String.format("%.2f", utilidad)).replace(",", "."));
                txt_subtotal_val.setText(String.valueOf(String.format("%.2f", subtotal)).replace(",", "."));
                txt_subtotalIvaValorCero0.setText(String.valueOf(String.format("%.2f", subtotaliva0)).replace(",", "."));
                txt_subtotalIvaValor_conIva12.setText(String.valueOf(String.format("%.2f", subtotaliva12)).replace(",", "."));
                txt_iva_valor.setText(String.valueOf(String.format("%.2f", (totaliva12 - subtotaliva12))).replace(",", "."));

            }

        } catch (Exception e) {

            ProgressBar.mostrarMensajeAzul(e.toString());
            Deb.consola("Vista.Usuarios.Modal_CrearFacturas.operacionFacturauPDATEandAddRowrs()" + e.toString());
        }
    }

    private Integer addDatosClienteonFactura(String cedula) {
        //Deb.consola("Vista.Usuarios.Crear_Facturas.txt_cedulaKeyTyped() Entrooo:  " + evt.getKeyCode());
        Integer codigoCliente = null;
        try {

            Clientes obj = new Clientes();
            ClientesDao objDao = new ClientesDao();
            Usuarios objUsu = new Usuarios();
            UsuariosDao objUsuDao = new UsuariosDao();

            obj = objDao.buscarConCedulaLike(cedula, 0);
            if (obj == null) {
                ClientesDao objDao2 = new ClientesDao();
                objDao2.guardar(OperacionesForms._OBJ_CONSUMIDOR_FINAL);
            } else {
                txt_nombres.setText(obj.getNombre());
                txt_celular.setText(obj.getCelular());
                txt_dir.setText(obj.getDireccion());
                txt_clienteCodigo.setText(obj.getCodigo().toString());
                txt_cedula.setText(obj.getCedula());
                txt_clienteCodigo.setVisible(false);
                codigoCliente = obj.getCodigo();

            }
//  

        } catch (Exception e) {
            Deb.consola("Vista.Usuarios.Crear_Facturas.addDatosClienteonFactura(): vgb: " + e);

        }
        return codigoCliente;
    }

    public void setModeloColumnas(JTable tb, int valorClumnas) {
        this.columnModel = tb.getColumnModel();
        this.columnModel.getColumn(0).setPreferredWidth(valorClumnas * 0);
        this.columnModel.getColumn(0).setWidth(valorClumnas * 0);
        this.columnModel.getColumn(1).setPreferredWidth(valorClumnas * 0);
        this.columnModel.getColumn(1).setWidth(valorClumnas * 0);
        this.columnModel.getColumn(2).setPreferredWidth(valorClumnas * 2);
        this.columnModel.getColumn(3).setPreferredWidth(valorClumnas * 100);
        this.columnModel.getColumn(4).setPreferredWidth(valorClumnas * 4);
        this.columnModel.getColumn(5).setPreferredWidth(valorClumnas * 4);
        this.columnModel.getColumn(6).setPreferredWidth(valorClumnas * 4);
        this.columnModel.getColumn(7).setPreferredWidth(valorClumnas * 9);
        this.columnModel.getColumn(8).setPreferredWidth(valorClumnas * 9);
        this.columnModel.getColumn(9).setPreferredWidth(valorClumnas * 0);
        this.columnModel.getColumn(9).setWidth(valorClumnas * 0);
        this.columnModel.getColumn(10).setPreferredWidth(valorClumnas * 0);
        this.columnModel.getColumn(10).setWidth(valorClumnas * 0);

    }

    private void datosPredeterminadosFacturas() {
        txt_numeroFacaafectarNotaCredito.setText("");
        FechaFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito = "NA";
        SecuenciaFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito = "NA";
        ValorTotalFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito = "0.0";
        ValorAfectadoNotaCreditoFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito = "0.0";
        idFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito = 0;
        txt_cedula.setText(OperacionesForms._OBJ_CONSUMIDOR_FINAL.getCedula());
        codigoClienteFactura = addDatosClienteonFactura(txt_cedula.getText());
        txt_cedula.setSelectionStart(0);
        txt_cedula.setSelectionEnd(txt_cedula.getText().length());
        lbl_subTotalIva.setText("Sub Total IVA " + Principal.iva + "%");
        //check_Fac.setSelected(true);
        //tipoDocumento = "FACTURA";
        txt_total_val_grande.setText("0.00");
        txt_total_vAL_PEQ.setText("0.00");
        txt_iva_valor.setText("0.00");
        txt_subtotalIvaValor_conIva12.setText("0.00");
        txt_subtotal_val.setText("0.00");
        txt_descuentoGenral.setText("0.00");
        txt_subtotalIvaValor_conIva12.setText("0.00");
        txt_subtotalIvaValorCero0.setText("0.00");
        // txt_buscar_producto.setText("");
        txt_utilidad.setText("0.00");

        getNuevonumeroNotaCredito();
        check_Fac.setSelected(true);
        txt_sec1.setVisible(true);
        txt_sec2.setVisible(true);
        tipoDocumento = "NC";

    }

    private void getNuevonumeroTicket() {
        FacturasDao tdao = new FacturasDao();
        String n = tdao.getNextumeroDeTicket();
        Integer num = Integer.valueOf(n);

        DecimalFormat formateador = new DecimalFormat("000000000");
        String format = formateador.format(num);
        txt_secNUmFac.setText(String.valueOf(format));
        txt_sec1.setText("");
        txt_sec2.setText("");
    }

    private void getNuevonumeroNC() {
        FacturasDao tdao = new FacturasDao();
        ArrayList<String> sec = new ArrayList<String>();
        sec = tdao.getNextumeroDeNOtaCreditobyEquipo(login.CodigoDelEquipo);//DeFacturabyEquipo(login.CodigoDelEquipo);
        if (!sec.isEmpty()) {

            int i = 1;
            Deb.consola("XXXXXXXXXXXXXXXXXXXXXX SECUENCIA fACTURA: " + sec);
            for (String partSecuencua : sec) {

                Deb.consola("XXXXXXXXXXXXXXXXXXXXXX SECUENCIA fACTURA: " + partSecuencua);
                if (i == 1) {
                    txt_sec1.setText(partSecuencua);
                }
                if (i == 2) {
                    txt_sec2.setText(partSecuencua);
                }
                if (i == 3) {
                    Integer num = Integer.valueOf(partSecuencua);
                    num = num + 1;
                    DecimalFormat formateador = new DecimalFormat("000000000");
                    String format = formateador.format(num);
                    txt_secNUmFac.setText(String.valueOf(format));
                }
                i++;
            }
        } else {
            txt_sec1.setText("001");
            txt_sec2.setText("001");
            Integer num = Integer.valueOf("1");
            num = num + 1;
            DecimalFormat formateador = new DecimalFormat("000000000");
            String format = formateador.format(num);
            txt_secNUmFac.setText(String.valueOf(format));
        }
    }

    private void getNuevonumeroNotaCredito() {
        FacturasDao tdao = new FacturasDao();
        ArrayList<String> sec = new ArrayList<String>();
        sec = tdao.getNextumeroDeNOtaCreditobyEquipo(login.CodigoDelEquipo);
        if (!sec.isEmpty()) {

            int i = 1;
            Deb.consola("XXXXXXXXXXXXXXXXXXXXXX SECUENCIA fACTURA: " + sec);
            for (String partSecuencua : sec) {

                Deb.consola("XXXXXXXXXXXXXXXXXXXXXX SECUENCIA fACTURA: " + partSecuencua);
                if (i == 1) {
                    txt_sec1.setText(partSecuencua);
                }
                if (i == 2) {
                    txt_sec2.setText(partSecuencua);
                }
                if (i == 3) {
                    Integer num = Integer.valueOf(partSecuencua);
                    num = num + 1;
                    DecimalFormat formateador = new DecimalFormat("000000000");
                    String format = formateador.format(num);
                    txt_secNUmFac.setText(String.valueOf(format));
                }
                i++;
            }
        } else {
            txt_sec1.setText("001");
            txt_sec2.setText("001");
            Integer num = Integer.valueOf("1");
            num = num + 1;
            DecimalFormat formateador = new DecimalFormat("000000000");
            String format = formateador.format(num);
            txt_secNUmFac.setText(String.valueOf(format));
        }
    }

    private void UpdateNuevonumeroFactura() {
        FacturasDao fdao = new FacturasDao();
        String n = fdao.getNextumeroDeFacturaByEstablecimientoyPuntoEmision(txt_sec1.getText(), txt_sec2.getText(), tipoDocumento);
        Integer num = Integer.valueOf(n);
        // txt_numeroOrden.setText();
        DecimalFormat formateador = new DecimalFormat("000000000");
        String format = formateador.format(num);
        txt_secNUmFac.setText(String.valueOf(format));

    }

    private void getNuevonumeroProforma() {
        FacturasDao tdao = new FacturasDao();
        String n = tdao.getNextumeroDeProformas();
        Integer num = Integer.valueOf(n);
        // txt_numeroOrden.setText();
        DecimalFormat formateador = new DecimalFormat("000000000");
        String format = formateador.format(num);
        txt_secNUmFac.setText(String.valueOf(format));
        txt_sec1.setText("");
        txt_sec2.setText("");
    }

    public Modal_CrearNC() {
        initComponents();

        addComponentListener(new ComponentAdapter() {
            public void componentMoved(ComponentEvent ce) {
                Deb.consola("x = " + getX() + ", y = " + getY());
            }
        });

        clienteAutoCompleter = new TextAutoCompleter(txt_nombres, new AutoCompleterCallback() {

            @Override
            public void callback(Object selectedItem) {

                //   Deb.consola(((Clientes) selectedItem).getNombre() + " hola"); // Imprime 25
                //     Object itemSelected = clienteAutoCompleter.getItemSelected();
                Clientes c = new Clientes();
                if (selectedItem instanceof Clientes) {

                    c = ((Clientes) selectedItem);
                    clienteseleccionadoAutocomplete = c;
                    txt_cedula.setText(c.getCedula());
                    txt_celular.setText(c.getCelular());
                    txt_clienteCodigo.setText(c.getCodigo().toString());
                    txt_dir.setText(c.getDireccion());
                    txt_nombres.setText(c.getNombre());

                    codigoClienteFactura = c.getCodigo();

                    //Deb.consola(((Clientes) selectedItem).getNombre() + " casas"); // Imprime 25
                } else {
                    Deb.consola("El item es de un tipo desconocido");
                }
                txt_nombres.setText(c.getNombre());
            }
        });

        clienteAutoCompleter.setCaseSensitive(false);
        clienteAutoCompleter.setMode(0);

        //listaClientes = cd.buscarConNombresLike(txt_nombres.getText());
//        productosAutoCompleter = new TextAutoCompleter(txtbuscarx, new AutoCompleterCallback() {
//
//            @Override
//            public void callback(Object selectedItem) {
//
//                if (selectedItem instanceof Productos) {
//                    Double stockok = null;
//                    Productos c = new Productos();
//                    c = ((Productos) selectedItem);
//                    FacturasDao facDao = new FacturasDao();
//                    String[] registros = new String[11];
//
//                    registros = facDao.Buscar_registros(c.getProducto(), Principal.bodegaPredeterminadaenVenta.substring(0, 1));
//                    registros[1] = String.valueOf(jTable1.getRowCount() + 1);
//                    String stock = registros[9];
//                    stockok = Double.parseDouble(stock);
//                    if (Principal.permitirvendersinstock.equals("SI")) {
//
//                        modelo.addRow(registros);
//                        jTable1.setModel(modelo);
//                    } else {
//                        if (Double.parseDouble(stock) > 0) {
//                            modelo.addRow(registros);
//                            jTable1.setModel(modelo);
//
//                        } else {
//                            JOptionPane.showMessageDialog(null, "NO TIENE STOCK BODEGA: " + Principal.bodegaPredeterminadaenVenta);
////                            modelo.addRow(registros);
////                            jTable1.setModel(modelo);
//                        }
//                    }
//                    if (c.getImagen() != null) {
//                        ImageIcon icon = new ImageIcon(c.getImagen());
//                        Icon icono = new ImageIcon(icon.getImage().getScaledInstance(251, 205, Image.SCALE_DEFAULT));
//                        foto.setText(null);
//                        foto.setIcon(icono);
//                    } else {
//                        foto.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/producto.jpg")));
//                    }
//
//                } else {
//                    Deb.consola("El item es de un tipo desconocido");
//                }
//
//            }
//        });
        //    productosAutoCompleter.setCaseSensitive(false);
        //   productosAutoCompleter.setMode(0);
        jdfecha.setEnabled(false);
        btn_nuevo.setVisible(false);
        txt_iva_valor.setText(iva.toString());
        //Deb.consola("Iva: " + iva);
        datosPredeterminadosFacturas();

        jTable1.putClientProperty(
                "terminateEditOnFocusLost", Boolean.TRUE);

        String[] titulos
                = {"0costo", "1#", "2Codigo", "3ARTICULO", "4CANTIDAD",
                    "5DESCUENTO", "6BODEGA",
                    "7P. UNIT", "8P. TOTAL", "9cantidad", "10imp", "11C. ALTERNO"};

        modelo = new DefaultTableModel(null, titulos) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // make read only fields except column 0,13,14
                return column == 3 || column == 4 || column == 5 || column == 7 || column == 8;
                //  return false;
            }
        };

        jTable1.setModel(modelo);

        setModeloColumnas(jTable1, 3);
        HoraFecha ob = new HoraFecha();
        HoraFecha ob2 = new HoraFecha();

        jdfecha.setDate(ob2.obtenerFecha());
//        list2.setVisible(false);
        //      list1.setVisible(false);
        addOrDeleteRowTable(jTable1);
        int row = jTable1.getModel().getRowCount();
        int col = jTable1.getModel().getColumnCount();

        //     txt_buscar_producto.requestFocus();
        //lleno cb Vendedores
        UsuariosDao objUDao = new UsuariosDao();
        listaU = objUDao.listarVendedores();
        for (Usuarios usuarios : listaU) {
            jComboBox1.addItem(usuarios.getNombre());
        }

        Deb.consola(
                "Nombre de Usuario: " + login.nombresUsuario);
        jComboBox1.setSelectedItem(login.nombresUsuario);
        /// pongo docuento predererminado

////formas de pago
        FormasPagoVDao objFdPDao = new FormasPagoVDao();
        listaFormasDePago = objFdPDao.listar();
        for (FormasPagoV f : listaFormasDePago) {
            jcbFormasPago.addItem(f.getFormaPago());
        }

        jcbFormasPago.setSelectedItem(Principal.formadepagopredeterminadaVenta);
        txt_nombres.selectAll();

        if (this.getTitle().equalsIgnoreCase(OperacionesForms._TITLE_FORM_NOTA_CREDITO)) {
            Deb.consola(OperacionesForms._TITLE_FORM_NOTA_CREDITO + "####################################");
        } else {
            Deb.consola(this.getTitle() + "####################################");
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        buttonGroup1 = new javax.swing.ButtonGroup();
        jPopupMenu1 = new javax.swing.JPopupMenu();
        buttonGroup2 = new javax.swing.ButtonGroup();
        jPanel1 = new javax.swing.JPanel();
        jPanel3 = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();
        jPanel9 = new javax.swing.JPanel();
        jLabel4 = new javax.swing.JLabel();
        txt_cedula = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        txt_nombres = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        txt_celular = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        txt_dir = new javax.swing.JTextField();
        jComboBox1 = new javax.swing.JComboBox<>();
        jLabel10 = new javax.swing.JLabel();
        btn_nuevo = new javax.swing.JButton();
        txt_numeroFacaafectarNotaCredito = new javax.swing.JTextField();
        jButton4 = new javax.swing.JButton();
        jPanel10 = new javax.swing.JPanel();
        jLabel9 = new javax.swing.JLabel();
        txt_sec1 = new javax.swing.JTextField();
        txt_secNUmFac = new javax.swing.JTextField();
        jLabel11 = new javax.swing.JLabel();
        txt_sec2 = new javax.swing.JTextField();
        check_Fac = new javax.swing.JCheckBox();
        txt_hora = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        jdfecha = new com.toedter.calendar.JDateChooser();
        txt_total_val_grande = new javax.swing.JLabel();
        jComboBox2 = new javax.swing.JComboBox<>();
        foto = new javax.swing.JLabel();
        jPanel11 = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        txtbuscarx = new javax.swing.JTextField();
        df = new javax.swing.JLabel();
        txt_saldocxc = new javax.swing.JTextField();
        jPanel12 = new javax.swing.JPanel();
        jScrollPane2 = new javax.swing.JScrollPane();
        listx = new javax.swing.JList<>();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jPanel18 = new javax.swing.JPanel();
        jPanel16 = new javax.swing.JPanel();
        jcbFormasPago = new javax.swing.JComboBox<>();
        jLabel2 = new javax.swing.JLabel();
        jLabel14 = new javax.swing.JLabel();
        jcbPVPs = new javax.swing.JComboBox<>();
        jRadioButton1 = new javax.swing.JRadioButton();
        jRadioButton2 = new javax.swing.JRadioButton();
        jPanel5 = new javax.swing.JPanel();
        jPanel13 = new javax.swing.JPanel();
        jLabel12 = new javax.swing.JLabel();
        txt_subtotal_val = new javax.swing.JLabel();
        jLabel13 = new javax.swing.JLabel();
        txt_descuentoGenral = new javax.swing.JTextField();
        lbl_subTotalIva = new javax.swing.JLabel();
        txt_subtotalIvaValor_conIva12 = new javax.swing.JLabel();
        lbl_subTotalIva1 = new javax.swing.JLabel();
        txt_subtotalIvaValorCero0 = new javax.swing.JLabel();
        lbl_Iva = new javax.swing.JLabel();
        txt_iva_valor = new javax.swing.JLabel();
        lbl_subTotalIva2 = new javax.swing.JLabel();
        txt_total_vAL_PEQ = new javax.swing.JLabel();
        txt_utilidad = new javax.swing.JLabel();
        txt_clienteCodigo = new javax.swing.JLabel();
        txt_usuarioCodigo = new javax.swing.JLabel();
        txtbus = new javax.swing.JTextField();
        txt_stock_Valor = new javax.swing.JLabel();
        jPanel19 = new javax.swing.JPanel();
        txt_motivo = new javax.swing.JTextField();
        jPanel14 = new javax.swing.JPanel();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jPanel17 = new javax.swing.JPanel();
        jInternalFrame1 = new javax.swing.JInternalFrame();
        jPanel4 = new javax.swing.JPanel();
        jPanel6 = new javax.swing.JPanel();
        lateral1 = new javax.swing.JPanel();
        jPanel7 = new javax.swing.JPanel();
        jPanel8 = new javax.swing.JPanel();

        buttonGroup1.add(check_Fac);

        buttonGroup2.add(jRadioButton1);
        buttonGroup2.add(jRadioButton2);

        setClosable(true);
        setResizable(true);
        setTitle("Crear Facturas");
        addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                formFocusGained(evt);
            }
        });
        addInternalFrameListener(new javax.swing.event.InternalFrameListener() {
            public void internalFrameActivated(javax.swing.event.InternalFrameEvent evt) {
                formInternalFrameActivated(evt);
            }
            public void internalFrameClosed(javax.swing.event.InternalFrameEvent evt) {
                formInternalFrameClosed(evt);
            }
            public void internalFrameClosing(javax.swing.event.InternalFrameEvent evt) {
            }
            public void internalFrameDeactivated(javax.swing.event.InternalFrameEvent evt) {
            }
            public void internalFrameDeiconified(javax.swing.event.InternalFrameEvent evt) {
            }
            public void internalFrameIconified(javax.swing.event.InternalFrameEvent evt) {
            }
            public void internalFrameOpened(javax.swing.event.InternalFrameEvent evt) {
                formInternalFrameOpened(evt);
            }
        });

        jPanel1.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        jPanel3.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 0, Short.MAX_VALUE)
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 3, Short.MAX_VALUE)
        );

        jPanel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        jPanel9.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Datos Cliente", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 13))); // NOI18N

        jLabel4.setText("Nombres");

        txt_cedula.setEditable(false);
        txt_cedula.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txt_cedulaFocusGained(evt);
            }
        });
        txt_cedula.addHierarchyBoundsListener(new java.awt.event.HierarchyBoundsListener() {
            public void ancestorMoved(java.awt.event.HierarchyEvent evt) {
            }
            public void ancestorResized(java.awt.event.HierarchyEvent evt) {
                txt_cedulaAncestorResized(evt);
            }
        });
        txt_cedula.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_cedulaActionPerformed(evt);
            }
        });
        txt_cedula.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_cedulaKeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txt_cedulaKeyTyped(evt);
            }
        });

        jLabel5.setText("Ruc");

        txt_nombres.setMinimumSize(new java.awt.Dimension(5, 22));
        txt_nombres.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txt_nombresFocusGained(evt);
            }
        });
        txt_nombres.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                txt_nombresMouseClicked(evt);
            }
        });
        txt_nombres.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_nombresActionPerformed(evt);
            }
        });
        txt_nombres.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txt_nombresKeyPressed(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_nombresKeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txt_nombresKeyTyped(evt);
            }
        });

        jLabel6.setText("Direccion");

        jLabel8.setText("Celular");

        jComboBox1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccione" }));
        jComboBox1.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jComboBox1ItemStateChanged(evt);
            }
        });
        jComboBox1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox1ActionPerformed(evt);
            }
        });

        jLabel10.setText("Vendedor:");

        btn_nuevo.setBackground(new java.awt.Color(0, 204, 51));
        btn_nuevo.setText("Nuevo");
        btn_nuevo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_nuevoActionPerformed(evt);
            }
        });

        txt_numeroFacaafectarNotaCredito.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                txt_numeroFacaafectarNotaCreditoFocusLost(evt);
            }
        });
        txt_numeroFacaafectarNotaCredito.addInputMethodListener(new java.awt.event.InputMethodListener() {
            public void caretPositionChanged(java.awt.event.InputMethodEvent evt) {
            }
            public void inputMethodTextChanged(java.awt.event.InputMethodEvent evt) {
                txt_numeroFacaafectarNotaCreditoInputMethodTextChanged(evt);
            }
        });
        txt_numeroFacaafectarNotaCredito.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                txt_numeroFacaafectarNotaCreditoPropertyChange(evt);
            }
        });
        txt_numeroFacaafectarNotaCredito.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txt_numeroFacaafectarNotaCreditoKeyPressed(evt);
            }
        });

        jButton4.setBackground(new java.awt.Color(0, 204, 102));
        jButton4.setText("Buscar Fac:");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel9Layout = new javax.swing.GroupLayout(jPanel9);
        jPanel9.setLayout(jPanel9Layout);
        jPanel9Layout.setHorizontalGroup(
            jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel9Layout.createSequentialGroup()
                .addGroup(jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel9Layout.createSequentialGroup()
                        .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel9Layout.createSequentialGroup()
                                .addComponent(txt_cedula, javax.swing.GroupLayout.PREFERRED_SIZE, 126, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(btn_nuevo)
                                .addGap(18, 18, 18)
                                .addComponent(jButton4, javax.swing.GroupLayout.PREFERRED_SIZE, 99, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(txt_numeroFacaafectarNotaCredito))
                            .addComponent(txt_nombres, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                    .addGroup(jPanel9Layout.createSequentialGroup()
                        .addGroup(jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel5)
                            .addComponent(jLabel6)
                            .addComponent(jLabel8, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(23, 23, 23)
                        .addGroup(jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addGroup(jPanel9Layout.createSequentialGroup()
                                .addComponent(txt_celular)
                                .addGap(18, 18, 18)
                                .addComponent(jLabel10)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, 197, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addComponent(txt_dir, javax.swing.GroupLayout.PREFERRED_SIZE, 424, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addContainerGap())
        );
        jPanel9Layout.setVerticalGroup(
            jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel9Layout.createSequentialGroup()
                .addGroup(jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txt_nombres, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4))
                .addGap(2, 2, 2)
                .addGroup(jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel9Layout.createSequentialGroup()
                        .addComponent(jLabel5)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel6)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel8))
                    .addGroup(jPanel9Layout.createSequentialGroup()
                        .addGroup(jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(jButton4)
                                .addComponent(txt_numeroFacaafectarNotaCredito, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(btn_nuevo)
                                .addComponent(txt_cedula, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGap(2, 2, 2)
                        .addComponent(txt_dir, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(2, 2, 2)
                        .addGroup(jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(txt_celular, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel10)))))
        );

        jPanel10.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Tipo Documento", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 14))); // NOI18N

        jLabel9.setText("Proximimo No de Comprobante");

        txt_sec1.setEditable(false);
        txt_sec1.setText("005");
        txt_sec1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_sec1KeyReleased(evt);
            }
        });

        txt_secNUmFac.setEditable(false);
        txt_secNUmFac.setText("00000200");

        jLabel11.setText("Hora:");

        txt_sec2.setEditable(false);
        txt_sec2.setText("001");
        txt_sec2.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_sec2KeyReleased(evt);
            }
        });

        check_Fac.setText("NOTA DE CREDITO ");
        check_Fac.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                check_FacItemStateChanged(evt);
            }
        });
        check_Fac.addChangeListener(new javax.swing.event.ChangeListener() {
            public void stateChanged(javax.swing.event.ChangeEvent evt) {
                check_FacStateChanged(evt);
            }
        });

        jLabel1.setText("Fecha:");

        jdfecha.setBackground(java.awt.Color.white);

        txt_total_val_grande.setBackground(new java.awt.Color(255, 255, 255));
        txt_total_val_grande.setFont(new java.awt.Font("Tahoma", 1, 48)); // NOI18N
        txt_total_val_grande.setText("0.00");
        txt_total_val_grande.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Total", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 14))); // NOI18N

        foto.setBackground(new java.awt.Color(255, 255, 0));
        foto.setForeground(new java.awt.Color(153, 255, 153));

        javax.swing.GroupLayout jPanel10Layout = new javax.swing.GroupLayout(jPanel10);
        jPanel10.setLayout(jPanel10Layout);
        jPanel10Layout.setHorizontalGroup(
            jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel10Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel11, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanel10Layout.createSequentialGroup()
                        .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(check_Fac)
                            .addComponent(jLabel9, javax.swing.GroupLayout.PREFERRED_SIZE, 190, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(jPanel10Layout.createSequentialGroup()
                                .addComponent(txt_sec1, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(10, 10, 10)
                                .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(jPanel10Layout.createSequentialGroup()
                                        .addComponent(txt_sec2, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGap(20, 20, 20)
                                        .addComponent(txt_secNUmFac, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE))
                                    .addGroup(jPanel10Layout.createSequentialGroup()
                                        .addGap(10, 10, 10)
                                        .addComponent(txt_hora, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                        .addComponent(jLabel1)))))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel10Layout.createSequentialGroup()
                                .addGap(28, 28, 28)
                                .addComponent(txt_total_val_grande, javax.swing.GroupLayout.PREFERRED_SIZE, 302, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(foto, javax.swing.GroupLayout.PREFERRED_SIZE, 121, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel10Layout.createSequentialGroup()
                                .addComponent(jdfecha, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jComboBox2, javax.swing.GroupLayout.PREFERRED_SIZE, 166, javax.swing.GroupLayout.PREFERRED_SIZE)))))
                .addContainerGap(172, Short.MAX_VALUE))
        );
        jPanel10Layout.setVerticalGroup(
            jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel10Layout.createSequentialGroup()
                .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel10Layout.createSequentialGroup()
                        .addGap(2, 2, 2)
                        .addComponent(check_Fac)
                        .addGap(5, 5, 5)
                        .addComponent(jLabel9, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txt_sec1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txt_sec2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txt_secNUmFac, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addComponent(txt_total_val_grande, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 74, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanel10Layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(foto, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel1, javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jdfecha, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txt_hora, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel11, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jComboBox2, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
        );

        jLabel3.setBackground(new java.awt.Color(255, 255, 255));
        jLabel3.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        jLabel3.setText("AGREGAR PRODUCTOS");

        txtbuscarx.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txtbuscarxKeyPressed(evt);
            }
        });

        df.setBackground(new java.awt.Color(255, 204, 204));
        df.setText("CXC A AFECTAR:");

        txt_saldocxc.setEditable(false);
        txt_saldocxc.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txt_saldocxc.setForeground(new java.awt.Color(255, 0, 0));

        javax.swing.GroupLayout jPanel11Layout = new javax.swing.GroupLayout(jPanel11);
        jPanel11.setLayout(jPanel11Layout);
        jPanel11Layout.setHorizontalGroup(
            jPanel11Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel11Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(df, javax.swing.GroupLayout.PREFERRED_SIZE, 108, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txt_saldocxc, javax.swing.GroupLayout.PREFERRED_SIZE, 194, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jLabel3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtbuscarx, javax.swing.GroupLayout.PREFERRED_SIZE, 454, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        jPanel11Layout.setVerticalGroup(
            jPanel11Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel11Layout.createSequentialGroup()
                .addGroup(jPanel11Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(df, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanel11Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(txtbuscarx, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(jLabel3)
                        .addComponent(txt_saldocxc, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(0, 1, Short.MAX_VALUE))
        );

        jPanel12.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        jScrollPane2.setHorizontalScrollBarPolicy(javax.swing.ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
        jScrollPane2.setVerticalScrollBarPolicy(javax.swing.ScrollPaneConstants.VERTICAL_SCROLLBAR_NEVER);

        listx.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        listx.setSelectionMode(javax.swing.ListSelectionModel.SINGLE_SELECTION);
        listx.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                listxMouseClicked(evt);
            }
        });
        listx.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                listxKeyPressed(evt);
            }
        });
        jScrollPane2.setViewportView(listx);

        javax.swing.GroupLayout jPanel12Layout = new javax.swing.GroupLayout(jPanel12);
        jPanel12.setLayout(jPanel12Layout);
        jPanel12Layout.setHorizontalGroup(
            jPanel12Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel12Layout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 448, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        jPanel12Layout.setVerticalGroup(
            jPanel12Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane2)
        );

        jScrollPane1.setBackground(new java.awt.Color(255, 255, 255));

        jTable1.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "null", "null", "null", "null", "null", "null", "Title 7", "Title 8"
            }
        ));
        jTable1.setRowHeight(28);
        jTable1.addContainerListener(new java.awt.event.ContainerAdapter() {
            public void componentAdded(java.awt.event.ContainerEvent evt) {
                jTable1ComponentAdded(evt);
            }
        });
        jTable1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTable1MouseClicked(evt);
            }
        });
        jTable1.addInputMethodListener(new java.awt.event.InputMethodListener() {
            public void caretPositionChanged(java.awt.event.InputMethodEvent evt) {
            }
            public void inputMethodTextChanged(java.awt.event.InputMethodEvent evt) {
                jTable1InputMethodTextChanged(evt);
            }
        });
        jTable1.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                jTable1PropertyChange(evt);
            }
        });
        jTable1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                jTable1KeyTyped(evt);
            }
        });
        jScrollPane1.setViewportView(jTable1);

        jPanel18.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        jcbFormasPago.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jcbFormasPago.setEnabled(false);
        jcbFormasPago.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jcbFormasPagoItemStateChanged(evt);
            }
        });

        jLabel2.setBackground(new java.awt.Color(255, 255, 255));
        jLabel2.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel2.setText("Pago:");

        jLabel14.setBackground(new java.awt.Color(255, 255, 255));
        jLabel14.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel14.setText("PVPs:");

        jcbPVPs.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jcbPVPs.setEnabled(false);
        jcbPVPs.setMaximumSize(new java.awt.Dimension(2767, 3767));
        jcbPVPs.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jcbPVPsActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel16Layout = new javax.swing.GroupLayout(jPanel16);
        jPanel16.setLayout(jPanel16Layout);
        jPanel16Layout.setHorizontalGroup(
            jPanel16Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel16Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel16Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel14, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2, javax.swing.GroupLayout.Alignment.TRAILING))
                .addGap(18, 18, 18)
                .addGroup(jPanel16Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jcbFormasPago, 0, 241, Short.MAX_VALUE)
                    .addComponent(jcbPVPs, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanel16Layout.setVerticalGroup(
            jPanel16Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel16Layout.createSequentialGroup()
                .addGap(0, 9, Short.MAX_VALUE)
                .addGroup(jPanel16Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jcbFormasPago, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 21, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel16Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jcbPVPs, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel14)))
        );

        jRadioButton1.setFont(new java.awt.Font("Tahoma", 1, 13)); // NOI18N
        jRadioButton1.setSelected(true);
        jRadioButton1.setText("Efectivo");

        jRadioButton2.setFont(new java.awt.Font("Tahoma", 1, 13)); // NOI18N
        jRadioButton2.setText("Aticipo Cliente");

        javax.swing.GroupLayout jPanel18Layout = new javax.swing.GroupLayout(jPanel18);
        jPanel18.setLayout(jPanel18Layout);
        jPanel18Layout.setHorizontalGroup(
            jPanel18Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel18Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel18Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jRadioButton2)
                    .addComponent(jRadioButton1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel16, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        jPanel18Layout.setVerticalGroup(
            jPanel18Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel18Layout.createSequentialGroup()
                .addGroup(jPanel18Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel18Layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(jPanel16, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel18Layout.createSequentialGroup()
                        .addContainerGap(12, Short.MAX_VALUE)
                        .addComponent(jRadioButton1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jRadioButton2)))
                .addContainerGap())
        );

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addComponent(jPanel9, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGap(18, 18, 18)
                .addComponent(jPanel10, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addComponent(jPanel11, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addComponent(jScrollPane1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jPanel12, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel18, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel10, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jPanel9, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(0, 0, 0)
                .addComponent(jPanel11, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(2, 2, 2)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 425, Short.MAX_VALUE)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jPanel12, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jPanel18, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(0, 0, 0))
        );

        jPanel5.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        jPanel13.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        jLabel12.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel12.setText("Subtotal:");

        txt_subtotal_val.setFont(new java.awt.Font("Tahoma", 1, 13)); // NOI18N

        jLabel13.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel13.setText("%Dcto");

        lbl_subTotalIva.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        lbl_subTotalIva.setText("Subtotal iva:");

        txt_subtotalIvaValor_conIva12.setFont(new java.awt.Font("Tahoma", 1, 13)); // NOI18N

        lbl_subTotalIva1.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        lbl_subTotalIva1.setText("Subtotal iva 0:");

        txt_subtotalIvaValorCero0.setFont(new java.awt.Font("Tahoma", 1, 13)); // NOI18N

        lbl_Iva.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        lbl_Iva.setText("IVA");

        txt_iva_valor.setFont(new java.awt.Font("Tahoma", 1, 13)); // NOI18N

        lbl_subTotalIva2.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        lbl_subTotalIva2.setText("Total");

        txt_total_vAL_PEQ.setFont(new java.awt.Font("Tahoma", 1, 13)); // NOI18N

        txt_utilidad.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        txt_utilidad.setForeground(new java.awt.Color(0, 204, 102));

        txt_clienteCodigo.setBackground(new java.awt.Color(255, 255, 255));
        txt_clienteCodigo.setText(" ");
        txt_clienteCodigo.setOpaque(true);

        txt_usuarioCodigo.setBackground(new java.awt.Color(255, 255, 255));
        txt_usuarioCodigo.setText(" ");
        txt_usuarioCodigo.setOpaque(true);

        txtbus.setBackground(new java.awt.Color(0, 153, 153));

        txt_stock_Valor.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        txt_stock_Valor.setHorizontalTextPosition(javax.swing.SwingConstants.LEFT);

        jPanel19.setBorder(javax.swing.BorderFactory.createTitledBorder("Motivo"));

        javax.swing.GroupLayout jPanel19Layout = new javax.swing.GroupLayout(jPanel19);
        jPanel19.setLayout(jPanel19Layout);
        jPanel19Layout.setHorizontalGroup(
            jPanel19Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel19Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(txt_motivo, javax.swing.GroupLayout.DEFAULT_SIZE, 272, Short.MAX_VALUE)
                .addContainerGap())
        );
        jPanel19Layout.setVerticalGroup(
            jPanel19Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel19Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(txt_motivo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jPanel13Layout = new javax.swing.GroupLayout(jPanel13);
        jPanel13.setLayout(jPanel13Layout);
        jPanel13Layout.setHorizontalGroup(
            jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel13Layout.createSequentialGroup()
                .addGroup(jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel13Layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jLabel12))
                    .addComponent(txt_subtotal_val, javax.swing.GroupLayout.PREFERRED_SIZE, 82, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel13)
                    .addComponent(txt_descuentoGenral, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(lbl_subTotalIva, javax.swing.GroupLayout.PREFERRED_SIZE, 112, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txt_subtotalIvaValor_conIva12, javax.swing.GroupLayout.PREFERRED_SIZE, 98, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel13Layout.createSequentialGroup()
                        .addComponent(txt_subtotalIvaValorCero0, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(txt_iva_valor, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel13Layout.createSequentialGroup()
                        .addComponent(lbl_subTotalIva1, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(lbl_Iva, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel13Layout.createSequentialGroup()
                        .addComponent(lbl_subTotalIva2, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(txt_clienteCodigo, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(txtbus, javax.swing.GroupLayout.PREFERRED_SIZE, 38, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel13Layout.createSequentialGroup()
                        .addComponent(txt_total_vAL_PEQ, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(txt_usuarioCodigo, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(txt_stock_Valor, javax.swing.GroupLayout.PREFERRED_SIZE, 69, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel19, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(77, 77, 77)
                .addComponent(txt_utilidad, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(259, 259, 259))
        );
        jPanel13Layout.setVerticalGroup(
            jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel13Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel13Layout.createSequentialGroup()
                        .addGroup(jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(jLabel12)
                                .addComponent(jLabel13)
                                .addComponent(lbl_subTotalIva)
                                .addComponent(lbl_subTotalIva1)
                                .addComponent(lbl_Iva)
                                .addComponent(lbl_subTotalIva2)
                                .addComponent(txt_clienteCodigo)
                                .addComponent(txtbus, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addComponent(txt_utilidad, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addGap(2, 2, 2)
                        .addGroup(jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                .addComponent(txt_subtotal_val, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGroup(jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                    .addComponent(txt_subtotalIvaValor_conIva12, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(txt_descuentoGenral, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addComponent(txt_subtotalIvaValorCero0, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(txt_iva_valor, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(txt_total_vAL_PEQ, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                .addComponent(txt_stock_Valor, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(txt_usuarioCodigo))))
                    .addGroup(jPanel13Layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(jPanel19, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel14.setBorder(javax.swing.BorderFactory.createTitledBorder(""));

        jButton1.setBackground(new java.awt.Color(102, 153, 255));
        jButton1.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jButton1.setText("Guardar");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        jButton1.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                jButton1PropertyChange(evt);
            }
        });

        jButton2.setBackground(new java.awt.Color(255, 102, 102));
        jButton2.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        jButton2.setText("Cerrar");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel14Layout = new javax.swing.GroupLayout(jPanel14);
        jPanel14.setLayout(jPanel14Layout);
        jPanel14Layout.setHorizontalGroup(
            jPanel14Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel14Layout.createSequentialGroup()
                .addContainerGap(33, Short.MAX_VALUE)
                .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 140, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 144, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(21, 21, 21))
        );
        jPanel14Layout.setVerticalGroup(
            jPanel14Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel14Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 45, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 48, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        javax.swing.GroupLayout jPanel5Layout = new javax.swing.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addComponent(jPanel13, javax.swing.GroupLayout.PREFERRED_SIZE, 1055, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jPanel14, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel14, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addComponent(jPanel13, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );

        jPanel17.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        javax.swing.GroupLayout jPanel17Layout = new javax.swing.GroupLayout(jPanel17);
        jPanel17.setLayout(jPanel17Layout);
        jPanel17Layout.setHorizontalGroup(
            jPanel17Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 1439, Short.MAX_VALUE)
        );
        jPanel17Layout.setVerticalGroup(
            jPanel17Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 0, Short.MAX_VALUE)
        );

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jPanel3, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel17, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel5, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel2, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(2, 2, 2))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, 0)
                .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel5, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, 0)
                .addComponent(jPanel17, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        jInternalFrame1.setClosable(true);
        jInternalFrame1.setIconifiable(true);
        jInternalFrame1.setMaximizable(true);
        jInternalFrame1.setResizable(true);

        jPanel4.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        jPanel6.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        javax.swing.GroupLayout jPanel6Layout = new javax.swing.GroupLayout(jPanel6);
        jPanel6.setLayout(jPanel6Layout);
        jPanel6Layout.setHorizontalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 0, Short.MAX_VALUE)
        );
        jPanel6Layout.setVerticalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 51, Short.MAX_VALUE)
        );

        lateral1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        lateral1.setAutoscrolls(true);

        javax.swing.GroupLayout lateral1Layout = new javax.swing.GroupLayout(lateral1);
        lateral1.setLayout(lateral1Layout);
        lateral1Layout.setHorizontalGroup(
            lateral1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 165, Short.MAX_VALUE)
        );
        lateral1Layout.setVerticalGroup(
            lateral1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 0, Short.MAX_VALUE)
        );

        jPanel7.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        javax.swing.GroupLayout jPanel7Layout = new javax.swing.GroupLayout(jPanel7);
        jPanel7.setLayout(jPanel7Layout);
        jPanel7Layout.setHorizontalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 0, Short.MAX_VALUE)
        );
        jPanel7Layout.setVerticalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 0, Short.MAX_VALUE)
        );

        jPanel8.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        javax.swing.GroupLayout jPanel8Layout = new javax.swing.GroupLayout(jPanel8);
        jPanel8.setLayout(jPanel8Layout);
        jPanel8Layout.setHorizontalGroup(
            jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 0, Short.MAX_VALUE)
        );
        jPanel8Layout.setVerticalGroup(
            jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 46, Short.MAX_VALUE)
        );

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addComponent(lateral1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel7, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel8, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
            .addComponent(jPanel6, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addComponent(jPanel6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addComponent(jPanel7, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jPanel8, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(lateral1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
        );

        javax.swing.GroupLayout jInternalFrame1Layout = new javax.swing.GroupLayout(jInternalFrame1.getContentPane());
        jInternalFrame1.getContentPane().setLayout(jInternalFrame1Layout);
        jInternalFrame1Layout.setHorizontalGroup(
            jInternalFrame1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        jInternalFrame1Layout.setVerticalGroup(
            jInternalFrame1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(layout.createSequentialGroup()
                    .addGap(0, 723, Short.MAX_VALUE)
                    .addComponent(jInternalFrame1, javax.swing.GroupLayout.PREFERRED_SIZE, 0, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGap(0, 724, Short.MAX_VALUE)))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(layout.createSequentialGroup()
                    .addGap(0, 357, Short.MAX_VALUE)
                    .addComponent(jInternalFrame1, javax.swing.GroupLayout.PREFERRED_SIZE, 0, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGap(0, 357, Short.MAX_VALUE)))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void txt_cedulaFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_cedulaFocusGained
        txt_cedula.selectAll();
    }//GEN-LAST:event_txt_cedulaFocusGained

    private void txt_cedulaKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_cedulaKeyReleased

    }//GEN-LAST:event_txt_cedulaKeyReleased

    private void txt_cedulaKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_cedulaKeyTyped

    }//GEN-LAST:event_txt_cedulaKeyTyped

    private void txt_nombresFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_nombresFocusGained
        // TODO add your handling code here:
        //      txt_nombres.selectAll();

    }//GEN-LAST:event_txt_nombresFocusGained

    private void txt_nombresMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_txt_nombresMouseClicked
        // TODO add your handling code here:
        txt_nombres.selectAll();
    }//GEN-LAST:event_txt_nombresMouseClicked

    private void txt_nombresActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_nombresActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_nombresActionPerformed

    private void txt_nombresKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_nombresKeyPressed
        // TODO add your handling code here:

//************************************
        Deb.consola("Vista.Usuarios.Crear_Facturas.txt_nombresKeyPressed()xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
        String ruc = "";

        if (ValidaNUmeros.isOnlyNumbers(txt_nombres.getText()) && KeyEvent.VK_ENTER == evt.getKeyCode()) {
            if ((txt_nombres.getText().length() == 10 || txt_nombres.getText().length() == 13)) {

                ruc = txt_nombres.getText();
                //  JOptionPane.showMessageDialog(null, ruc);
                Deb.consola("Vista.Usuarios.Crear_Facturas.txt_nombresKeyPressed()llllllllllllllllllllllllll");
                if (addDatosClienteonFactura(txt_nombres.getText()) == null) {
                    //  JOptionPane.showMessageDialog(null, ruc);
                    Crear_Clientes obj_crearC = new Crear_Clientes();
                    Principal.desktopPane.add(obj_crearC);

                    try {
                        obj_crearC.setSelected(true);

                    } catch (PropertyVetoException ex) {
                        Logger.getLogger(Modal_CrearFacturas.class
                                .getName()).log(Level.SEVERE, null, ex);
                    }
                    Crear_Clientes.txt_cedulax.setText(ruc);
                    obj_crearC.setVisible(true);
                }
                //   btn_nuevo.setVisible(true);
            }

        } else {
            Deb.consola("Vista.Usuarios.Crear_Facturas.txt_nombresKeyPressed()xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
            ClientesDao cd = new ClientesDao();
            listaClientes = cd.BuscarClietneslikokokok(ruc, 0);
            clienteAutoCompleter.removeAllItems();
            for (Clientes p : listaClientes) {
                clienteAutoCompleter.addItem(p);
            }
        }

    }//GEN-LAST:event_txt_nombresKeyPressed

    private void txt_nombresKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_nombresKeyReleased
        // TODO add your handling code here:

    }//GEN-LAST:event_txt_nombresKeyReleased

    private void txt_nombresKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_nombresKeyTyped
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_nombresKeyTyped

    private void jComboBox1ItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jComboBox1ItemStateChanged
        // TODO add your handling code here:
        for (Usuarios usuarios : listaU) {
            if (usuarios.getNombre().equals(jComboBox1.getSelectedItem())) {
                this.codigoUsuarioVendedorSeleccionadoJCB = usuarios.getCodigo();
                txt_usuarioCodigo.setText(codigoUsuarioVendedorSeleccionadoJCB.toString());

            }

        }
        Deb.consola("Vista.Usuarios.Crear_Facturas.jComboBox1ItemStateChanged(): " + evt.getItem());
    }//GEN-LAST:event_jComboBox1ItemStateChanged

    private void btn_nuevoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_nuevoActionPerformed
        // TODO add your handling code here:
        Crear_Clientes obj = new Crear_Clientes();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), false);


    }//GEN-LAST:event_btn_nuevoActionPerformed

    private void txt_sec1KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_sec1KeyReleased
        // TODO add your handling code here:
        //        if (txt_sec1.getText().length() == 3) {
        //            if (ValidaNUmeros.isOnlyNumbers(txt_sec1.getText())) {
        //                Deb.consola("xtxSec1");
        //                UpdateNuevonumeroFactura();
        //            }
        //        }
    }//GEN-LAST:event_txt_sec1KeyReleased

    private void txt_sec2KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_sec2KeyReleased
        // TODO add your handling code here:

        if (txt_sec2.getText().length() == 3) {
            if (ValidaNUmeros.isOnlyNumbers(txt_sec2.getText())) {
                Deb.consola("xtxSec2");
                UpdateNuevonumeroFactura();
            }
        }
    }//GEN-LAST:event_txt_sec2KeyReleased

    private void check_FacItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_check_FacItemStateChanged
        // TODO add your handling code here:
        if (check_Fac.isSelected()) {
            tipoDocumento = "NC";
            txt_sec1.setVisible(true);
            txt_sec2.setVisible(true);
            Deb.consola(tipoDocumento);
            getNuevonumeroNotaCredito();

        }
    }//GEN-LAST:event_check_FacItemStateChanged

    private void check_FacStateChanged(javax.swing.event.ChangeEvent evt) {//GEN-FIRST:event_check_FacStateChanged
        // TODO add your handling code here:

    }//GEN-LAST:event_check_FacStateChanged

    private void jComboBox1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jComboBox1ActionPerformed

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        // TODO add your handling code here:
        int Rowclik = jTable1.getSelectedRow();
        int columclik = jTable1.getSelectedColumn();

        if (evt.getButton() == MouseEvent.BUTTON1) {
            Deb.consola("BOTON 1");

        }
        if (evt.getButton() == MouseEvent.BUTTON2) {
            Deb.consola("BOTON 2");
            //  Deb.consola("8888888888888888888888888888888888888888888888888888: " + SetRenderJTableCXC.get_jtable_cell_component(jTable1, Rowclik, columclik).getBackground().toString());
        }
        if (evt.getButton() == MouseEvent.BUTTON3) {
            Deb.consola("BOTON 3");
        }

        if (evt.getButton() == MouseEvent.BUTTON3 || evt.getButton() == MouseEvent.BUTTON1) {
            int colValUnitario = 7;
            int colpvpTotalrow = 8;
            int colcantidad = 4;
            int colNombreProducto = 3;
            int colCodigoProducto = 2;
            Deb.consola("CLICK COUNT: " + evt.getClickCount());
            Deb.consola("SELECTED ROW : " + jTable1.getSelectedRow());
            int x = MouseInfo.getPointerInfo().getLocation().x;
            int y = MouseInfo.getPointerInfo().getLocation().y;
            Deb.consola("X  AND Y : " + x + " - " + y);

            if (evt.getClickCount() == 1 && columclik == colValUnitario) {
                if (jTable1.getSelectedRow() != -1) {

                    codigoProductoSeleccionadoClickonJTable = Integer.parseInt(jTable1.getValueAt(Rowclik, colCodigoProducto).toString());
                    // JOptionPane.showMessageDialog(null,"codigo prodxxx"+ codigoProductoSeleccionadoClickonJTable);
                    Deb.consola("Vista.Usuarios.Crear_Facturas.jTable1MouseClicked()codigo prducto seleccionado L: " + codigoProductoSeleccionadoClickonJTable);
                    Frame frame = JOptionPane.getFrameForComponent(this);
                    PreciosProductos pcdialog = new PreciosProductos(frame, true);
                    pcdialog._codigoProductoSeleccionadoClickonJTable = Integer.parseInt(jTable1.getValueAt(Rowclik, colCodigoProducto).toString());
                    pcdialog.txt_precio.setText(jTable1.getValueAt(Rowclik, colValUnitario).toString());
                    Deb.consola("X  AND Y : " + x + " - " + y);
                    pcdialog.setLocation(x, y);
                    // pcdialog.setLocationRelativeTo(frame);
                    pcdialog.txt_precio.selectAll();
                    pcdialog.setVisible(true);

                    jTable1.setValueAt(pcdialog._precioProducto, Rowclik, colValUnitario);

                }
            }

            if (evt.getClickCount() == 1 && columclik == colpvpTotalrow) {
                if (jTable1.getSelectedRow() != -1) {
                    codigoProductoSeleccionadoClickonJTable = Integer.parseInt(jTable1.getValueAt(Rowclik, colCodigoProducto).toString());
                    Deb.consola("Vista.Usuarios.Crear_Facturas.jTable1MouseClicked()codigo prducto seleccionado L: " + codigoProductoSeleccionadoClickonJTable);
                    Frame frame = JOptionPane.getFrameForComponent(this);
                    PrecioTotalFacturacionXFila pcdialog = new PrecioTotalFacturacionXFila(frame, true);
                    pcdialog.codigoProducto = codigoProductoSeleccionadoClickonJTable;
                    pcdialog.cantidadProducto = Double.parseDouble(jTable1.getValueAt(Rowclik, colcantidad).toString());
                    pcdialog._pvpTotal = Double.parseDouble(jTable1.getValueAt(Rowclik, colpvpTotalrow).toString());
                    pcdialog._pvpUnitario = Double.parseDouble(jTable1.getValueAt(Rowclik, colValUnitario).toString());
                    pcdialog.txt_precio.setText(jTable1.getValueAt(Rowclik, colpvpTotalrow).toString());

                    pcdialog.txt_producto.setText(jTable1.getValueAt(Rowclik, colNombreProducto).toString());
                    Deb.consola("X  AND Y : " + x + " - " + y);
                    pcdialog.setLocation(x, y);
                    // pcdialog.setLocationRelativeTo(frame);
                    pcdialog.txt_precio.selectAll();
                    pcdialog.setVisible(true);
                    jTable1.setValueAt(pcdialog._pvpTotal, Rowclik, colpvpTotalrow);
                    jTable1.setValueAt(pcdialog._pvpUnitario, Rowclik, colValUnitario);
                }
            }

        }
        try {

            if (evt.getClickCount() == 1) {
                if (jTable1.getSelectedRow() != -1) {

                    //    int Rowclik = jTable1.getSelectedRow();
                    //  int columclik = jTable1.getSelectedColumn();
                }
            }
            //////////////CON 3 CLICKS ELIMINA UNA FILA EN JTABLE DE FACTURACION
            if (evt.getClickCount() == 3) {
                if (jTable1.getSelectedRow() != -1) {
                    // remove selected row from the model
                    if (jTable1.getRowCount() >= 0) {
                        int i = jTable1.getSelectedRow();
                        modelo.removeRow(i);
                        operacionFacturauPDATEandAddRowrs();
                        if (jTable1.getRowCount() == 0) {
                            limpiarIntefazVentas();
                        }

                    }

                }
            }
            if (evt.getClickCount() == 2) {
                // jTable1.getValueAt(Rowclik, colNombreProducto);
                jTable1.selectAll();
            }
        } catch (Exception e) {
            msg.setMensaje(e.toString());
        }

    }//GEN-LAST:event_jTable1MouseClicked

    private void jTable1InputMethodTextChanged(java.awt.event.InputMethodEvent evt) {//GEN-FIRST:event_jTable1InputMethodTextChanged
        // TODO add your handling code here:
        //  JOptionPane.showMessageDialog(null, "inputmethodtextchaned");
    }//GEN-LAST:event_jTable1InputMethodTextChanged

    private void jTable1KeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTable1KeyTyped
        // TODO add your handling code here:
        //        Deb.consola("Vista.Usuarios.Crear_Facturas.jTable1KeyTyped()   enteeerrrr" + evt.getKeyCode());
        //        if (evt.getKeyCode() == 10) {
        //            Deb.consola("Vista.Usuarios.Crear_Facturas.jTable1KeyTyped()   enteeerrrr");
        //            // list1.requestFocus();
        //            list2.requestFocus();
        //        }
    }//GEN-LAST:event_jTable1KeyTyped

    private void jcbFormasPagoItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcbFormasPagoItemStateChanged
        // TODO add your handling code here:
        FormasPagoV f = new FormasPagoV();
        FormasPagoVDao fDao = new FormasPagoVDao();
        f = fDao.buscarConFormaPago(evt.getItem().toString());
        this.codigFormaPagoSeleccionada = f.getCodigo();
    }//GEN-LAST:event_jcbFormasPagoItemStateChanged

    private void jcbPVPsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jcbPVPsActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jcbPVPsActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:
        this.dispose();
    }//GEN-LAST:event_jButton2ActionPerformed

    private void procesoFacturacion() {
        ValidaErrorVenta = false;
        if (jTable1.getRowCount() != 0) {
            u.setEstablecimiento(txt_sec1.getText());
            u.setPtoEmision(txt_sec2.getText());
            u.setSecfactura(txt_secNUmFac.getText());
            u.setClientes_codigo(Integer.valueOf(txt_clienteCodigo.getText()));
            u.setUsuarios_Codigo(Integer.valueOf(txt_usuarioCodigo.getText()));
            u.setDescuento(txt_descuentoGenral.getText());
            u.setEquipo(login.nombreDelEquipo);
            String fechaIniciox = HoraFecha.fecha_aa_mm_dd_conSlash(jdfecha.getDate().toString());
            Date date1 = null;
            try {
                date1 = new SimpleDateFormat("yyyy/MM/dd").parse(fechaIniciox);
            } catch (ParseException ex) {
                ProgressBar.mostrarMensajeAzul("Problemas al convertir Fechas al registrar la Nota de Credito..");
            }
            u.setFecha(date1);
            u.setIva(iva.toString());

            if (check_Fac.isSelected()) {
                secuenciaFac = txt_sec1.getText() + "-" + txt_sec2.getText() + "-" + txt_secNUmFac.getText();
                u.setSecuencia(secuenciaFac);
                u.setCalveAcceso(claveAcceso);

            } else {
                secuenciaFac = txt_secNUmFac.getText();
                u.setSecuencia(secuenciaFac);
                u.setCalveAcceso("N/A");
            }

            u.setSubtotaI_con_iva(txt_subtotalIvaValor_conIva12.getText());
            u.setSubtotal_sin_iva(txt_subtotalIvaValorCero0.getText());
            u.setTipo_documento(tipoDocumento);
            u.setTotal(txt_total_val_grande.getText());
            this.utilidad = Double.parseDouble(String.format("%.2f", utilidad).replace(",", "."));
            u.setUtilidad(String.valueOf(utilidad));
            u.setUsuarios_Codigo(this.codigoUsuarioVendedorSeleccionadoJCB);
            String fechaInicio = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdfecha.getDate().toString());
            u.setIva_valor(txt_iva_valor.getText());
            u.setFechain(fechaInicio);
            u.setCodigo_doc_afectado_nc(idFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito);
            u.setSecuencia_doc_afectado_nc(SecuenciaFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito);
            u.setFecha_doc_afectado_nc(FechaFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito);

            Deb.consola("Clave de ACCESO :  " + claveAcceso);
            //  JOptionPane.showMessageDialog(null, login.CodigoDelEquipo);
            u.setEquipos_codigo(login.CodigoDelEquipo);

            ////consulto nuevamente la existencia de CXC REALCIONA A LA FACTIRA A ANULAR CON LA NC
            Cxc cxc = new Cxc();
            cxcDao cxcDao = new cxcDao();
            cxc = cxcDao.listarBuscarConCodigoFactura(idFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito);
            boolean ingresaaCXCaseranulada = false;

            if (cxc.getCodigo() != null) {
                jRadioButton1.isSelected();
                jRadioButton2.setEnabled(false);
                Double saldo1 = Double.parseDouble(cxc.getSaldo().trim());
                Double total1 = Double.parseDouble(txt_total_val_grande.getText().trim());
                if (saldo1 == total1) {
                    cxcDao cxcDao2 = new cxcDao();
                    cxc.setAbono(cxc.getSaldo().trim());
                    cxc.setSaldo("0.0");
                    cxc.setVisible(0);
                    cxc.setDescripcion("CXC CANCELADA POR : " + tipoDocumento + " - " + jcbFormasPago.getSelectedItem().toString() + " # " + secuenciaFac + " EN EQUIPO: " + login.nombreDelEquipo + " USUARIO: " + login.nombresUsuario);
                    cxc.setEstado("PAGADO");
                    cxcDao2.modificar(cxc);
                    ////REGISTRO EN PAGOS
                    Pagos p = new Pagos();
                    p.setCxc_codigo(cxc.getCodigo());
                    p.setDescripcion("CXC CANCELADA POR : " + tipoDocumento + " - " + jcbFormasPago.getSelectedItem().toString() + " # " + secuenciaFac + " EN EQUIPO: " + login.nombreDelEquipo + " USUARIO: " + login.nombresUsuario);
                    p.setTipo("NC");
                    p.setTotal(Double.parseDouble(cxc.getSaldo().trim()));
                    p.setVisible(1);
                    PagosDao pDao = new PagosDao();
                    pDao.guardar(p);
                    ///
                    ingresaaCXCaseranulada = true;
                } else if (saldo1 < total1) {
                    cxcDao cxcDao2 = new cxcDao();
                    cxc.setAbono(cxc.getSaldo().trim());
                    cxc.setSaldo("0.0");
                    cxc.setVisible(0);
                    cxc.setDescripcion("CXC CANCELADA POR : " + tipoDocumento + " - " + jcbFormasPago.getSelectedItem().toString() + " # " + secuenciaFac + " EN EQUIPO: " + login.nombreDelEquipo + " USUARIO: " + login.nombresUsuario);
                    cxc.setEstado("PAGADO");
                    cxcDao2.modificar(cxc);
                    ////REGISTRO EN PAGOS
                    Pagos p = new Pagos();
                    p.setCxc_codigo(cxc.getCodigo());
                    p.setDescripcion("CXC CANCELADA POR : " + tipoDocumento + " - " + jcbFormasPago.getSelectedItem().toString() + " # " + secuenciaFac + " EN EQUIPO: " + login.nombreDelEquipo + " USUARIO: " + login.nombresUsuario);
                    p.setTipo("NC");
                    p.setTotal(Double.parseDouble(cxc.getSaldo().trim()));
                    p.setVisible(1);
                    PagosDao pDao = new PagosDao();
                    pDao.guardar(p);
                    ///
                    ////creo anticipo
                    Anticipos ant = new Anticipos();
                    AnticiposDao antDao = new AnticiposDao();
                    ant.setClientes_codigo(Integer.parseInt(txt_clienteCodigo.getText()));
                    ant.setDescripcion("ANTICIPO POR : " + tipoDocumento + " - " + jcbFormasPago.getSelectedItem().toString() + " # " + secuenciaFac + " EN EQUIPO: " + login.nombreDelEquipo + " USUARIO: " + login.nombresUsuario);
                    ant.setDocumento(tipoDocumento);
                    ant.setDocumeto_codigo(idFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito);
                    ant.setMotivo("DIFERENCIA ENTRE LA NC Y EL SALDO DE LA CXC");
                    ant.setTotal(saldo1);
                    ant.setUsado(0.00);
                    ant.setTipo_movimeinto("NC");
                    ant.setSaldo(saldo1);
                    antDao.guardar(ant);
                    ///////////////////
                    ingresaaCXCaseranulada = true;

                }

            }
            /////
            /////////// DETALLE DE CAJA

            if (jRadioButton1.isSelected()) {
                if (!ingresaaCXCaseranulada) {
                    cd.setCajas_Codigo(login.codigoCaja);
                    cd.setDetalle(Variables.CAJA_EGRESO_NC + tipoDocumento + " - " + jcbFormasPago.getSelectedItem().toString() + " # " + secuenciaFac + " EN EQUIPO: " + login.nombreDelEquipo + " USUARIO: " + login.nombresUsuario);
                    cd.setDescripcion("---");
                    cd.setDocumento(tipoDocumento);
                    cd.setFecha(jdfecha.getDate());
                    cd.setTipo(Variables.CAJA_TIPO_EGRESO);
                    cd.setValor(Double.parseDouble(txt_total_val_grande.getText()));
                    cd.setCajas_Codigo(login.codigoCaja);
                }
            } else {
                ////creo anticipo
                if (!ingresaaCXCaseranulada) {
                    Anticipos a = new Anticipos();
                    AnticiposDao adao = new AnticiposDao();
                    a.setClientes_codigo(codigoClienteFactura);
                    a.setDescripcion("ANTICIPO NOTA DE CREDITO DOCUMENTO REFERENCIA " + SecuanciaFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito + " - " + idFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito);
                    a.setDocumento(tipoDocumento);
                    a.setDocumeto_codigo(idFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito);
                    a.setMotivo(txt_motivo.getText().trim());
                    a.setClientes_codigo(codigoClienteFactura);
                    a.setSaldo(total);
                    a.setSecuencia(secuenciaFac);
                    a.setTipo_movimeinto("xxx");
                    a.setTotal(total);
                    a.setUsado(0.0);
                    adao.guardar(a);
                    ///PONGO EN TRUE PARA REGISTRAR LA NC SIN GENRAR MOVIMIENTO DE CAJA PUES QUEDA COMO ANTICIPO AL CLIENTE
                    ingresaaCXCaseranulada = true;

                }
            }
            /////////////
            //  Integer codigFactura;
            Cxc pagos = new Cxc();
            cxcDao pagosDao = new cxcDao();
            FacturasDao objFacDao = new FacturasDao();
            CajasDetalleDao cdDao = new CajasDetalleDao();
            Double Ptotal = 0.0;

            int col = jTable1.getColumnCount();
            int row = jTable1.getRowCount();
            SeriesFacturas objSF = new SeriesFacturas();
            SeriesFacturasDao objDaoSF = new SeriesFacturasDao();
            String rutaInforme = "";
            Map parametros = new HashMap();
            if (check_Fac.isSelected()) {
                getNuevonumeroNotaCredito();

                formaPagoSeelccionada = jcbFormasPago.getSelectedItem().toString();
                u.setFormaPago(formaPagoSeelccionada);

                switch (jcbFormasPago.getSelectedItem().toString()) {

                    case "EFECTIVO":
                        /*
                    @param
                    verifica si esta activado el el control de efectivo y cambio
                         */
                        u.setEfectivo(0.00);
                        u.setCambio(0.00);
                        if (Principal.controlCambioEfectivoSINO.equalsIgnoreCase("SI")) {
//                        if (!check_proformas.isSelected()) {
//                            Frame ff = JOptionPane.getFrameForComponent(this);
//                            PagoEfectivo dialog = new PagoEfectivo(ff, true);
//                            dialog.txt_total.setText(txt_total_val_grande.getText());
//                            dialog.txt_entrada.setText("0.0");
//                            dialog.txt_entrada.selectAll();
//                            dialog.setLocationRelativeTo(ff);
//                            dialog.setVisible(true);
//                            u.setEfectivo(Double.parseDouble(dialog.txt_entrada.getText()));
//                            u.setCambio(Double.parseDouble(dialog.txt_cambio.getText()));
//                            // procedeVentaExitosa = true;
//                            Deb.consola("Vista.Usuarios.Modal_CrearFacturas.jButton1ActionPerformed()_: " + procedeVentaExitosa);
//                        }
                        } else {

                            u.setEfectivo(0.0);
                            u.setCambio(0.0);
                            // RegistrodeEfectivoyCambioExitoso = true;
                            procedeVentaExitosa = true;
                        }

                        break;

                    ///
                }
                Deb.consola("Vista.Usuarios.Modal_CrearFacturas.jButton1ActionPerformed()Ñ :xx " + procedeVentaExitosa);
                if (procedeVentaExitosa) {

                    cd.setCodigoDocuemnto(codigoFactura);
                    for (int i = 0; i < row; i++) {
                        Kardex k = new Kardex();
                        DetalleFactura df = new DetalleFactura();
                        KardexDao kDao = new KardexDao();
                        DetalleFacturaDao dfDao = new DetalleFacturaDao();
                        Double iva12 = 0.0;
                        Double BaseImponible = 0.0;
                        df.setCantidad(jTable1.getValueAt(i, 4).toString());
                        df.setDetalle(jTable1.getValueAt(i, 3).toString());
                        ////////////////
                        Double costo = Double.parseDouble(jTable1.getValueAt(i, 0).toString());
                        Double precio = Double.parseDouble(jTable1.getValueAt(i, 7).toString());
                        Double utilidad = (precio / 1.12) - (costo / 1.12);
                        df.setUtilidad(Double.valueOf(String.format("%.2f", utilidad).replace(",", ".")));
                        df.setPrecio(precio);
                        df.setBodega(Integer.parseInt(jTable1.getValueAt(i, 6).toString()));
                        df.setCosto(costo);

                        ///////////////////////////////////////////////
                        Ptotal = Double.valueOf(jTable1.getValueAt(i, 8).toString().replace(",", "."));
                        Double ivaDecimal = ((this.iva / 100) + 1);
                        Double valorUnitarioSinIVA = Double.valueOf(jTable1.getValueAt(i, 7).toString().replace(",", "."));
                        Double valorTotalSinIVA = Double.valueOf(jTable1.getValueAt(i, 8).toString().replace(",", "."));
                        if (jTable1.getValueAt(i, 10).toString().equalsIgnoreCase("0")) {

                            df.setTineIva("no");
                            df.setIva("0");

                        }
                        if (jTable1.getValueAt(i, 10).toString().contains(Principal.iva)) {
                            df.setTineIva("si");
                            BaseImponible = Ptotal / ((this.iva / 100) + 1);
                            iva12 = Ptotal - BaseImponible;
                            df.setIva(String.valueOf(String.format("%.2f", iva12)).replace(",", "."));
                            valorUnitarioSinIVA = (valorUnitarioSinIVA / ivaDecimal);
                            valorTotalSinIVA = valorTotalSinIVA / ivaDecimal;
                        }

                        df.setDescuento(jTable1.getValueAt(i, 5).toString());
                        df.setValorUnitario(String.valueOf(String.format("%.2f", valorUnitarioSinIVA)).replace(",", "."));
                        df.setValorTotal(String.valueOf(String.format("%.2f", valorTotalSinIVA)).replace(",", "."));
                        df.setFactura_Codigo(codigoFactura);
                        //  JOptionPane.showMessageDialog(null,"cod ProdÑ : "+ jTable1.getValueAt(i, 2).toString());
                        df.setProductos_codigo(Integer.valueOf(jTable1.getValueAt(i, 2).toString()));
                        df.setProductos_codigoAlterno(jTable1.getValueAt(i, 11).toString());

                        k.setBodega(jTable1.getValueAt(i, 6).toString());
                        k.setFecha(jdfecha.getDate());
                        k.setDetalle("INGRESO -- " + tipoDocumento + " " + secuenciaFac);
                        k.setOutcantidad("0");
                        k.setIncantidad(jTable1.getValueAt(i, 4).toString());
                        k.setIncosto(jTable1.getValueAt(i, 0).toString());
                        k.setInpvp(jTable1.getValueAt(i, 7).toString());
                        k.setOutpvp("0");
                        k.setOutcosto("0");
                        k.setProductos_Codigo(Integer.parseInt(jTable1.getValueAt(i, 2).toString()));
                        listaDetalleFactura.add(df);
                        listaKardex.add(k);
                    }
                    //////////////////////////
                    /////////////facturao
                    if (jRadioButton2.isSelected()) {

                    }

    //                    boolean afectacajaykardex = false;
                    if (!tipoDocumento.equalsIgnoreCase("PROFORMA")) {
                         afectakardex = true;  ///e proformas no
                             afectacaja = true; /// en cuadno es credito no
                    }
                    ComitsAll cm = new ComitsAll();
                    Integer cofigFacok = 0;
//                    if (formaPagoSeelccionada.equalsIgnoreCase(OperacionesForms._CREDITO_TEXT)) {
//                        Deb.consola(cxc.toString());
//                        cofigFacok = cm.facturar(u, cd, listaDetalleFactura, listaKardex, afectacajaykardex, cxc);
//                    } else if (formaPagoSeelccionada.equalsIgnoreCase(OperacionesForms._EFECTIVO_TEXT)) {
//                        cofigFacok = cm.facturar(u, cd, listaDetalleFactura, listaKardex, afectacajaykardex);
//                    }
                    /// *ingresaaCXCaseranulada* ingresa a NC pero tiene cxc, se anula pero no genra nada en caja solo anticipo

                    if (ingresaaCXCaseranulada) {
                        afectakardex = true;  ///e proformas no
                             afectacaja = false; /// en cuadno es credito no
                        cofigFacok = cm.facturar(u, cd, listaDetalleFactura, listaKardex, afectacaja,afectakardex);
                    } else {
                        //genera anticipo pero tambien efecto en cja
                        afectakardex = true;  ///e proformas no
                             afectacaja = true; /// en cuadno es credito no
                        cofigFacok = cm.facturar(u, cd, listaDetalleFactura, listaKardex, afectacaja,afectakardex);
                    }

                    if (cofigFacok == 0) {

                        //   limpiarIntefazVentas();
                        ProgressBar.mostrarMensajeAzul("Error al registrar la transaccion de venta ");
                    } else {

                        listaKardex.clear();
                        listaDetalleFactura.clear();
                        if (idFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito != 0) {
                            Facturas p = new Facturas();
                            FacturasDao pdao = new FacturasDao();
                            FacturasDao pdao2 = new FacturasDao();
                            //sssFecha_doc_afectado_nc
                            p = pdao2.buscarConID(idFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito);
                            Double v1 = Double.parseDouble(p.getValorAfectadoxNCenFactura());
                            Double v2 = total;
                            Double vt = v1 + v2;
                            p.setValorAfectadoxNCenFactura(String.valueOf(String.format("%.3f", vt)).replace(",", "."));
                            pdao.update(p);
                        }
                        if (Principal.facturatiriiasoGrande.equalsIgnoreCase("ROLLO")) {

                            ImpresionDao impdao = new ImpresionDao();
                            impdao.impresionEnTirillasFaturas(secuenciaFac);
                            /////////////////codigo para zebra
                            //                            String zplCommand = "^XA\n"
                            //                                    + "^FO10,0^ARN,11,7^FD SOME TEXT ^FS\n"
                            //                                    + "^FO300,0^ARN,11,7^FD impresion xxx ^FS\n"
                            //                                    + "^FO10,35^ARN,11,7^FD SOME TEXT ^FS\n"
                            //                                    + "^FO300,35^ARN,11,7^FD mas que nadad ^FS\n"
                            //                                    + "^FO10,70^ARN,11,7^FD SOME CODE ^FS\n"
                            //                                    + "^FO250,115^ARN,11,7^BCN,60,Y,Y,N^FD 123456789 ^FS\n"
                            //                                    + "^XZ";
                            //
                            //                            // convertimos el comando a bytes
                            //                            byte[] by = zplCommand.getBytes();
                            //                            DocFlavor flavor = DocFlavor.BYTE_ARRAY.AUTOSENSE;
                            //                            Doc doc = new SimpleDoc(by, flavor, null);
                            //
                            //                            ImpresionDao impdao = new ImpresionDao();
                            //                            impdao.impresionzZebra(doc);
                            //                            ////////////////fin codigo para zebra

                        } else {

                            String template = Variables.DIR_REPORTE_FACTURA;
                            rutaInforme = template;
                            Deb.consola("Ruta Archivo: " + template);
                            //  JOptionPane.showMessageDialog(null, "cod: " + secuenciaFac);
                            parametros.put("numeroFactura", secuenciaFac);
                            ImpresionDao imp = new ImpresionDao();
                            //imp.getShowReport(parametros, rutaInforme);
                            ///imp.ExportPDF(parametros, rutaInforme);
                            imp.impresionDontShowReport(parametros, rutaInforme);
                            // imp.impresionDontShowReport(parametros, rutaInforme);
                        }
                        limpiarIntefazVentas();
                        if (!Variables.FE_OBLIGADO_CONTABILIDAD.equalsIgnoreCase("NO")) {

                        }

                        /* fincreacion facura electronica*/
                        u.setCodigo(cofigFacok);
                        FacturasDao fs = new FacturasDao();

                        //////////localhost
                        try {
                            String fa = fs.creaxmlFacturaElectronica(u);
                            com.ws.localhost.WSElectro_Service wslocal = new com.ws.localhost.WSElectro_Service();
                            com.ws.localhost.Response resp = new com.ws.localhost.Response();
                            resp = wslocal.getWSElectroPort().receiptXMLIn(fa, "admin", "admin", "homer_loading@hotmail.com;homer.loading@gmail.com");

                        } catch (Exception e) {
                            Deb.consola("erro al enviar al WS: " + e);
                        }

                        ///////////
                        //compueconomia     WSElectro_Service s = new WSElectro_Service();
                        //compueconomia  Response r = new Response();
                        ///compueconomia     r =s.getWSElectroPort().receiptXMLIn(fa, "admin", "admin", "homer_loading@hotmail.com;homer.loading@gmail.com");
                        // Deb.consola("Vista.Usuarios.Crear_Facturas.jButton1ActionPerformed()" + fa);
                        //cosom  com.ws.cosmobelleza.WSElectro_Service ss = new com.ws.cosmobelleza.WSElectro_Service();
                        //cosmo      com.ws.cosmobelleza.Response r= new  com.ws.cosmobelleza.Response();
                        //cosmo    r=ss.getWSElectroPort().receiptXMLIn(fa, "admin", "admin", "homer_loading@hotmail.com;homer.loading@gmail.com");
                        //        JOptionPane.showMessageDialogerror (null, "Respuesta: "+r.getResponse());
                    }
/////////////imprime recibo en tirillas
                    if (true) {

                        Deb.consola("Numero de veces: " + Integer.parseInt(Principal.numerovecseimpresionFactura));
                        for (int i = 0; i < Integer.parseInt(Principal.numerovecseimpresionFactura); i++) {
                            if (Principal.tickettiriiasoGrande.equalsIgnoreCase("ROLLO")) {
                                impresionEnTirillas(u);
                            } else {
                                rutaInforme = Variables.DIR_REPORTE_TICKET;
                                parametros.put("numeroFactura", secuenciaFac);
                                ImpresionDao imp = new ImpresionDao();
                                imp.getShowReport(parametros, rutaInforme);
                                //imp.impresionDontShowReport(parametros, rutaInforme);

                            }
                        }
                        //*
                    }
                    limpiarIntefazVentas();
                } else {
                    if (!ValidaErrorVenta) {
                        ProgressBar.mostrarMensajeAzul("No se puede registrar Errorxx nc");
                    }

                }
            } else {

                ProgressBar.mostrarMensajeAzul("NO EXISTEN ARTICULOS A REALIZAR NOTA DE CREDITO");
            }
        }
    }
    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed

        /* Fin  el codigoAcceso*/
        ///verifico si el dato registardo en venta existe en niesta
        codigoClienteFactura = addDatosClienteonFactura(txt_cedula.getText());
        claveAcceso = getClaveAcceso();

        if (jTable1.getRowCount() != 0) {

            if (!txt_cedula.getText().isEmpty() && !txt_nombres.getText().isEmpty() && codigoClienteFactura != null) {

                if (txt_nombres.getText().equalsIgnoreCase(OperacionesForms._OBJ_CONSUMIDOR_FINAL.getNombre())) {
                    ProgressBar.mostrarMensajeAzul("NOTAS DE CREDITO A CONSUMIDOR FINAL NO ESTAN PERMITIDAS");
                } else {
                    Double valorAfectadoPorNOCfactura = Double.parseDouble(ValorAfectadoNotaCreditoFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito);
                    Double valorTotalfactura = Double.parseDouble(ValorTotalFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito);
                    Double DispnoblepataNC = valorTotalfactura - valorAfectadoPorNOCfactura;
                    Double totalNC = Double.parseDouble(ValorAfectadoNotaCreditoFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito);
                    if (Double.parseDouble(txt_total_val_grande.getText()) <= DispnoblepataNC) {
                        procesoFacturacion();
                    } else {
                        ProgressBar.mostrarMensajeAzul("El valor de la NC es superior a al Factura : " + String.valueOf(DispnoblepataNC));
                    }

                }

            } else {

                ProgressBar.mostrarMensajeAzul("PRO FAVOR LLENAR CAMPOS OBLIGATORIOS");
            }

        } else {

            ProgressBar.mostrarMensajeAzul(" ** NO EXISTEN ARTICULOS A FACTIRAR");
        }

        ////LENAMOS LOS DATOS PREDETERMINADOS EN LA VENTA DE FACTURACION
        //enceramos la transcaccion anterior
        if (procedeVentaExitosa) {

            datosPredeterminadosFacturas();

            jcbFormasPago.setSelectedItem(Principal.formadepagopredeterminadaVenta);

            //JOptionPane.showMessageDialog(null, "Forma de pago predeterminadaxc: " + Principal.formadepagopredeterminada);
        }
        procedeVentaExitosa = false;
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton1PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_jButton1PropertyChange
        // TODO add your handling code here:
        //if(evt.getPropertyName())
        if (jButton1.getText().equals("Actualizar")) {
            //jcb_estado.setSelectedItem("");
        }
        Deb.consola("Vista.Usuarios.Crear_Usuarios.jButton1Prop,,,,,,,,ertyChange()" + evt.getNewValue());
    }//GEN-LAST:event_jButton1PropertyChange

    private void txtbuscarxKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtbuscarxKeyPressed
        // TODO add your handling code here:
        if (evt.getKeyCode() == com.sun.glass.events.KeyEvent.VK_UP || evt.getKeyCode() == com.sun.glass.events.KeyEvent.VK_DOWN) {
            if (!listx.isFocusOwner()) {
                listx.requestFocus();
            }
            if (listx.isSelectionEmpty() && listx.getModel().getSize() >= 1) {
                listx.setSelectedIndex(0);
            }
            System.out.println("Vista.Usuarios.Modal_CrearFacturas.txtbuscarxKeyPressed()ccccccccccccccccccccccccccccccccccccccccccccfechas");
        } else {
            txtbuscarx.requestFocus();

            ArrayList listax = new ArrayList();

            DefaultListModel modelista = new DefaultListModel();

            List<Productos> lista;
            String cadenainicial = "";
//            if (jcbusc.getItemCount() >= 0) {
//                //jcbusc.setSelectedIndex(0);
//                cadenainicial = txtbuscarx.getText();
//                if (evt.getKeyCode() != 13 && cadenainicial.length() >= 1) {
//                    String[] cadena = cadenainicial.split(" ");
//                    Deb.consola(cadena);
//                    Deb.consola(cadenainicial);
//                    ProductosDao pDao = new ProductosDao();
//                    lista = pDao.listarLikeok(cadena);
//
//                    for (Productos p : lista) {
//                        modelista.addElement(p.getCantidad() + ":" + p.getProducto());
//                        //  listax.add(p.getProducto()+": <"+ p.getCantidad()+ "> ");
//
//                        //     jcbusc.addItem(p.getProducto());
//                        //  productosAutoCompleter.addItem(p);
//                    }
//                    //modelista.addElement(listax);//
//                    listx.setModel(modelista);
//                    if (modelista.getSize() >= 1) {
//
//                    }
//                }
//            }
        }

    }//GEN-LAST:event_txtbuscarxKeyPressed

    private static void calculosAlseleccionarProductodesdeJList(String nombrePruductoSeleccionado) {
        String nombre = nombrePruductoSeleccionado;
        Deb.consola("Vista.Usuarios.Modal_CrearFacturas.listxKeyPressed()" + nombre);
        if (!nombre.isEmpty()) {
            Double stockok = null;

            Productos c = new Productos();
            ProductosDao pdao = new ProductosDao();
            c = pdao.buscarPorNombre(nombre);
            FacturasDao facDao = new FacturasDao();
            String[] registros = new String[11];
            // JOptionPane.showMessageDialog(null, "sdfsfg :"+Principal.bodegaPredeterminadaenVenta);
            registros = facDao.Buscar_registros(c.getProducto(), Principal.bodegaPredeterminadaenVenta.substring(0, 1));
            registros[1] = String.valueOf(jTable1.getRowCount() + 1);
            String stock = registros[9];
            Deb.consola("Vista.Usuarios.Modal_CrearFacturas.calculosAlseleccionarProductodesdeJList();;;stock::::::::GDGDG " + stock);
            stockok = Double.parseDouble(stock);
            boolean exiteProductoRepetido = false;
            if (Principal.permitirvendersinstock.equals("SI")) {
                if (Principal.ItemRepetidoEnFacturacionSumarCantidad.equalsIgnoreCase("SI")) {

                    for (int i = 0; i < modelo.getRowCount(); i++) {
                        String productoname = modelo.getValueAt(i, 3).toString();
                        Deb.consola("XXXC: " + productoname);
                        if (productoname.equalsIgnoreCase(nombre)) {
                            Double cantidad = Double.parseDouble(modelo.getValueAt(i, 4).toString());
                            modelo.setValueAt(cantidad + 1, i, 4);
                            exiteProductoRepetido = true;
                        }
                    }
                    if (!exiteProductoRepetido) {
                        modelo.addRow(registros);
                        jTable1.setModel(modelo);
                    }
                } else {
                    modelo.addRow(registros);
                    jTable1.setModel(modelo);
                }
            } else {
                if (Double.parseDouble(stock) > 0) {
                    modelo.addRow(registros);
                    jTable1.setModel(modelo);

                } else {

                    ProgressBar.mostrarMensajeAzul("NO TIENE STOCK BODEGA: " + Principal.bodegaPredeterminadaenVenta);
//                            modelo.addRow(registros);
//                            jTable1.setModel(modelo);
                }
            }

            if (c.getImagen() != null) {
                ImageIcon icon = new ImageIcon(c.getImagen());
                Icon icono = new ImageIcon(icon.getImage().getScaledInstance(251, 205, Image.SCALE_DEFAULT));
                foto.setText(null);
                foto.setIcon(icono);
            } else {
                //      foto.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/producto.jpg")));
            }

        } else {
            Deb.consola("El item es de un tipo desconocido");
        }
    }

    private static void calculosAlseleccionarProductodesdeJListNC(DetalleFactura det) {
        String nombre = det.getDetalle();
        Deb.consola("Vista.Usuarios.Modal_CrearFacturas.listxKeyPressed()" + nombre);
        if (!nombre.isEmpty()) {
            Double stockok = null;
            Productos c = new Productos();
            ProductosDao pdao = new ProductosDao();
            c = pdao.buscarConID(det.getProductos_codigo());
            c.setPvp(String.valueOf(det.getPrecio()));
            c.setCosto(String.valueOf(det.getCosto()));
            FacturasDao facDao = new FacturasDao();
            String[] registros = new String[11];
            // JOptionPane.showMessageDialog(null, Principal.bodegaPredeterminadaenVenta);
            registros = facDao.Buscar_registrosparaNC(det, Principal.bodegaPredeterminadaenVenta.substring(0, 1));
            registros[1] = String.valueOf(jTable1.getRowCount() + 1);
            String stock = registros[9];
            Deb.consola("Vista.Usuarios.Modal_CrearFacturas.calculosAlseleccionarProductodesdeJList();;;stock::::::::RTETERTE " + stock);
            stockok = Double.parseDouble(stock);
            boolean exiteProductoRepetido = false;
            if (Principal.permitirvendersinstock.equals("SI")) {
                if (Principal.ItemRepetidoEnFacturacionSumarCantidad.equalsIgnoreCase("SI")) {

                    for (int i = 0; i < modelo.getRowCount(); i++) {
                        String productoname = modelo.getValueAt(i, 3).toString();
                        Deb.consola("XXXC: " + productoname);
                        if (productoname.equalsIgnoreCase(nombre)) {
                            Double cantidad = Double.parseDouble(modelo.getValueAt(i, 4).toString());
                            modelo.setValueAt(cantidad + 1, i, 4);
                            exiteProductoRepetido = true;
                        }
                    }
                    if (!exiteProductoRepetido) {
                        modelo.addRow(registros);
                        jTable1.setModel(modelo);
                    }
                } else {
                    modelo.addRow(registros);
                    jTable1.setModel(modelo);
                }
            } else {
                if (Double.parseDouble(stock) > 0) {
                    modelo.addRow(registros);
                    jTable1.setModel(modelo);

                } else {

                    ProgressBar.mostrarMensajeAzul("NO TIENE STOCK BODEGA: " + Principal.bodegaPredeterminadaenVenta);
//                            modelo.addRow(registros);
//                            jTable1.setModel(modelo);
                }
            }

            if (c.getImagen() != null) {
                ImageIcon icon = new ImageIcon(c.getImagen());
                Icon icono = new ImageIcon(icon.getImage().getScaledInstance(251, 205, Image.SCALE_DEFAULT));
                foto.setText(null);
                foto.setIcon(icono);
            } else {
                //      foto.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/producto.jpg")));
            }

        } else {
            Deb.consola("El item es de un tipo desconocido");
        }
    }
    private void listxKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_listxKeyPressed
        // TODO add your handling code here:
        String cad[] = listx.getSelectedValue().trim().split(":");
        if (evt.getKeyCode() == KeyEvent.VK_UP || evt.getKeyCode() == KeyEvent.VK_DOWN) {

        } else if (evt.getKeyCode() == KeyEvent.VK_ENTER) {

            calculosAlseleccionarProductodesdeJList(cad[1]);
        } else {
            System.err.println("TEClasAS" + evt.getKeyChar() + " " + evt.getKeyCode());
            txtbuscarx.requestFocus();
        }
    }//GEN-LAST:event_listxKeyPressed

    private void listxMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_listxMouseClicked
        // TODO add your handling code here:
//        listx.clearSelection();
        String cad[] = listx.getSelectedValue().trim().split(":");
        if (evt.getClickCount() == 1 && listx.getModel().getSize() >= 1) {

            Productos p = new Productos();
            ProductosDao pDao = new ProductosDao();
            //JOptionPane.showMessageDialog(null, cad[1]);
            p = pDao.buscarPorNombre(cad[1]);
            if (p != null) {
                txt_stock_Valor.setText(p.getCantidad().toString());
            }
        }
        if (evt.getClickCount() == 2 && listx.getModel().getSize() >= 1) {
            if (listx.locationToIndex(evt.getPoint()) != -1 && listx.locationToIndex(evt.getPoint()) == listx.getSelectedIndex()) {
                calculosAlseleccionarProductodesdeJList(cad[1]);

            }

        }
    }//GEN-LAST:event_listxMouseClicked

    private void txt_cedulaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_cedulaActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_cedulaActionPerformed

    private void jTable1PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_jTable1PropertyChange
        // TODO add your handling code here:

    }//GEN-LAST:event_jTable1PropertyChange

    private void jTable1ComponentAdded(java.awt.event.ContainerEvent evt) {//GEN-FIRST:event_jTable1ComponentAdded
        // TODO add your handling code here:

    }//GEN-LAST:event_jTable1ComponentAdded

    private void formInternalFrameOpened(javax.swing.event.InternalFrameEvent evt) {//GEN-FIRST:event_formInternalFrameOpened
        // TODO add your handling code here:
        //  JOptionPane.showMessageDialog(null, this.getTitle());

        //datosPredeterminadosFacturas();
    }//GEN-LAST:event_formInternalFrameOpened

    private void txt_cedulaAncestorResized(java.awt.event.HierarchyEvent evt) {//GEN-FIRST:event_txt_cedulaAncestorResized
        // TODO add your handling code here:

    }//GEN-LAST:event_txt_cedulaAncestorResized

    private void formFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_formFocusGained
        // TODO add your handling code here:
    }//GEN-LAST:event_formFocusGained

    private void formInternalFrameActivated(javax.swing.event.InternalFrameEvent evt) {//GEN-FIRST:event_formInternalFrameActivated
        // TODO add your handling code here:
        //  datosPredeterminadosFacturas();

    }//GEN-LAST:event_formInternalFrameActivated

    private void formInternalFrameClosed(javax.swing.event.InternalFrameEvent evt) {//GEN-FIRST:event_formInternalFrameClosed
        // TODO add your handling code here:

    }//GEN-LAST:event_formInternalFrameClosed

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
        this.seleccionafacturadesdeNotaCredito = true;
        BuscarFacturas obj = new BuscarFacturas();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);

        Deb.consola("Vista.Usuarios.Modal_CrearNotaCredito.jButton3ActionPerformed(asdasdasdasdasdasasdas)");
    }//GEN-LAST:event_jButton4ActionPerformed

    private void txt_numeroFacaafectarNotaCreditoInputMethodTextChanged(java.awt.event.InputMethodEvent evt) {//GEN-FIRST:event_txt_numeroFacaafectarNotaCreditoInputMethodTextChanged
        // TODO add your handling code here:

    }//GEN-LAST:event_txt_numeroFacaafectarNotaCreditoInputMethodTextChanged

    private void txt_numeroFacaafectarNotaCreditoPropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_txt_numeroFacaafectarNotaCreditoPropertyChange
        // TODO add your handling code here:

    }//GEN-LAST:event_txt_numeroFacaafectarNotaCreditoPropertyChange

    private void txt_numeroFacaafectarNotaCreditoKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_numeroFacaafectarNotaCreditoKeyPressed
        // TODO add your handling code here:
        boolean ok = false;
        String cad[] = txt_numeroFacaafectarNotaCredito.getText().split("-");
        for (String string : cad) {
            if (ValidaNUmeros.isOnlyNumbers(string)) {

            }
        }
        if (cad.length == 3) {

            if (evt.VK_ENTER == evt.getKeyCode()) {
                Facturas f = new Facturas();
                FacturasDao fdao = new FacturasDao();
                f = fdao.buscarXSecuancia(txt_numeroFacaafectarNotaCredito.getText());
                idFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito = f.getCodigo();
                SecuanciaFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito = f.getSecuencia_doc_afectado_nc();
                ValorAfectadoNotaCreditoFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito = f.getValorAfectadoxNCenFactura();
                ValorTotalFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito = f.getTotal();
                llenacamposNC();
            }
        }
    }//GEN-LAST:event_txt_numeroFacaafectarNotaCreditoKeyPressed

    public static void llenacamposNC() {
        Double saldoparaNC = 0.0;
        Deb.consola("Vista.Usuarios.Modal_CrearNotaCredito.txt_numeroFacaafectarNotaCreditoPropertyChange()sssssssssssssssssssss: " + txt_numeroFacaafectarNotaCredito.getText().length());
        Deb.consola("Vista.Usuarios.Modal_CrearNotaCredito.txt_numeroFacaafectarNotaCreditoPropertyChange()sssssssssssssssssssss: " + idFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito);
        if (txt_numeroFacaafectarNotaCredito.getText().length() >= 9 && idFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito > 0) {
            Clientes cli = new Clientes();
            Facturas fac = new Facturas();
            Usuarios usu = new Usuarios();
            FacturasDao facDao = new FacturasDao();
            ClientesDao cliDao = new ClientesDao();
            fac = facDao.buscarConID(idFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito);
            SecuenciaFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito = fac.getSecuencia();
            FechaFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito = fac.getFecha().toString();
            ValorAfectadoNotaCreditoFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito = fac.getValorAfectadoxNCenFactura();
            ValorTotalFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito = fac.getTotal();
            Double valafecnc = Double.parseDouble(ValorAfectadoNotaCreditoFacturaSeleccionadaDesdeListadeFacturasParaNotaCredito);
            Double totalfac = Double.parseDouble(fac.getTotal());
            //VERIFICO SI EXISTE CXC
            Cxc cxc = new Cxc();
            cxcDao cxcDao = new cxcDao();
            cxc = cxcDao.listarBuscarConCodigoFactura(fac.getCodigo());
            
            /// FIN VERIFICAR CXC

            if (valafecnc < totalfac) {
                if (cxc.getCodigo() != null) {
                txt_saldocxc.setText(totalfac.toString());
                jRadioButton2.setSelected(true);
                jRadioButton1.setEnabled(false);
            }
                cli = cliDao.buscarConID(fac.getClientes_codigo(), 0);
                txt_cedula.setText(cli.getCedula());
                txt_celular.setText(cli.getCelular());
                txt_clienteCodigo.setText(cli.getCodigo().toString());
                txt_dir.setText(cli.getDireccion());
                txt_nombres.setText(cli.getNombre());
                codigoClienteFactura = cli.getCodigo();

                List<DetalleFactura> lista;
                DetalleFacturaDao dDao = new DetalleFacturaDao();
                lista = dDao.buscarConIDFact(fac.getCodigo());
                for (DetalleFactura d : lista) {
                    Deb.consola(d.getDetalle());
                    calculosAlseleccionarProductodesdeJListNC(d);
                }

            } else {
                ProgressBar.mostrarMensajeAzul("La factura ya cuenta con NOta de Credito:");
            }

        }
    }

    public static void llenarcamposNCdesdeFacturaCompra(String secuencia) {
        List<DetalleFactura> listaf;
        DetalleFacturaDao dfacDao = new DetalleFacturaDao();
        Facturas fac = new Facturas();
        Clientes cli = new Clientes();
        ClientesDao cliDao = new ClientesDao();
        FacturasDao facDao = new FacturasDao();
        fac = facDao.buscarXSecuancia(secuencia);
        cli = cliDao.buscarConID(fac.getClientes_codigo(), 0);
        if (cli.getCedula() != OperacionesForms._OBJ_CONSUMIDOR_FINAL.getCedula()) {
            modelo = dfacDao.getDetalleFacutraByIdFactura(fac.getCodigo());
            jTable1.setModel(modelo);
        } else {
            ProgressBar.mostrarMensajeAzul("NOSTAS DE CREDITO A CONSUMIDOR RFINAL NO ESTAN PERMITIDAS");
        }

    }
    private void txt_numeroFacaafectarNotaCreditoFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_numeroFacaafectarNotaCreditoFocusLost
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_numeroFacaafectarNotaCreditoFocusLost


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btn_nuevo;
    private javax.swing.ButtonGroup buttonGroup1;
    private javax.swing.ButtonGroup buttonGroup2;
    public static javax.swing.JCheckBox check_Fac;
    private static javax.swing.JLabel df;
    public static javax.swing.JLabel foto;
    public static javax.swing.JButton jButton1;
    public static javax.swing.JButton jButton2;
    private javax.swing.JButton jButton4;
    private javax.swing.JComboBox<String> jComboBox1;
    private javax.swing.JComboBox<String> jComboBox2;
    private javax.swing.JInternalFrame jInternalFrame1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel10;
    private javax.swing.JPanel jPanel11;
    private javax.swing.JPanel jPanel12;
    private javax.swing.JPanel jPanel13;
    private javax.swing.JPanel jPanel14;
    private javax.swing.JPanel jPanel16;
    private javax.swing.JPanel jPanel17;
    private javax.swing.JPanel jPanel18;
    private javax.swing.JPanel jPanel19;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JPanel jPanel8;
    private javax.swing.JPanel jPanel9;
    private javax.swing.JPopupMenu jPopupMenu1;
    private static javax.swing.JRadioButton jRadioButton1;
    private static javax.swing.JRadioButton jRadioButton2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    public static javax.swing.JTable jTable1;
    public static javax.swing.JComboBox<String> jcbFormasPago;
    private javax.swing.JComboBox<String> jcbPVPs;
    private com.toedter.calendar.JDateChooser jdfecha;
    private javax.swing.JPanel lateral1;
    private javax.swing.JLabel lbl_Iva;
    private javax.swing.JLabel lbl_subTotalIva;
    private javax.swing.JLabel lbl_subTotalIva1;
    private javax.swing.JLabel lbl_subTotalIva2;
    private javax.swing.JList<String> listx;
    public static javax.swing.JTextField txt_cedula;
    public static javax.swing.JTextField txt_celular;
    public static javax.swing.JLabel txt_clienteCodigo;
    public static javax.swing.JTextField txt_descuentoGenral;
    public static javax.swing.JTextField txt_dir;
    public static javax.swing.JLabel txt_hora;
    public static javax.swing.JLabel txt_iva_valor;
    private javax.swing.JTextField txt_motivo;
    public static javax.swing.JTextField txt_nombres;
    public static javax.swing.JTextField txt_numeroFacaafectarNotaCredito;
    private static javax.swing.JTextField txt_saldocxc;
    public static javax.swing.JTextField txt_sec1;
    public static javax.swing.JTextField txt_sec2;
    public static javax.swing.JTextField txt_secNUmFac;
    private javax.swing.JLabel txt_stock_Valor;
    public static javax.swing.JLabel txt_subtotalIvaValorCero0;
    public static javax.swing.JLabel txt_subtotalIvaValor_conIva12;
    public static javax.swing.JLabel txt_subtotal_val;
    public static javax.swing.JLabel txt_total_vAL_PEQ;
    public static javax.swing.JLabel txt_total_val_grande;
    public static javax.swing.JLabel txt_usuarioCodigo;
    public static javax.swing.JLabel txt_utilidad;
    private javax.swing.JTextField txtbus;
    private javax.swing.JTextField txtbuscarx;
    // End of variables declaration//GEN-END:variables
}
