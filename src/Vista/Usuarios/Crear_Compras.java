/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista.Usuarios;

import ClasesAuxiliares.FeCodigoNUmerico;
import ClasesAuxiliares.NewSql.Forms.OperacionesForms;
import ClasesAuxiliares.NullValidator;
import ClasesAuxiliares.Variables;
import Controlador.Coneccion;
import Controlador.Usuarios.CajasDetalleDao;
import Controlador.Usuarios.ClientesDao;
import Controlador.Usuarios.ComprasDao;
import Controlador.Usuarios.DetalleComprasDao;
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
import Controlador.Usuarios.ProductosDao;
import Controlador.Usuarios.cxcDao;
import Controlador.Usuarios.ProformasDao;
import Controlador.Usuarios.ProveedoresDao;
import Controlador.Usuarios.SeriesFacturasDao;
import Controlador.Usuarios.TicketsDao;
import Controlador.Usuarios.cxpDao;
import Modelo.CajasDetalle;
import Modelo.Compras;
import Modelo.DetalleFactura;
import Modelo.DetalleProforma;
import Modelo.DetalleTicket;
import Modelo.Equipos;
import Modelo.Facturas;
import Modelo.FormasPagoV;
import Modelo.Kardex;
import Modelo.Cxc;
import Modelo.Cxp;
import Modelo.DetalleCompra;
import Modelo.Productos;
import Modelo.Proformas;
import Modelo.Proveedores;
import Modelo.SeriesFacturas;
import Modelo.Tickets;
import Modelo.sri_sustentocomprobante;
import Modelo.sri_tipocomprobante;
import Vista.Dialogs.cantidadCompra;
import Vista.Dialogs.precioCompra;
import static Vista.Principal.desktopPane;
import Vlidaciones.ProgressBar;
import Vlidaciones.VaciarTexto;
import Vlidaciones.ValidaCedula;
import Vlidaciones.ValidaNUmeros;
import com.mxrck.autocompleter.AutoCompleterCallback;
import com.mxrck.autocompleter.TextAutoCompleter;
import ecx.unomas.factura.Factura;
import ecx.unomas.factura.TotalImpuesto;
import login.login;
import impresoras.ServicioDeImpresion;
import java.awt.Frame;
import java.awt.Image;
import java.awt.MouseInfo;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseEvent;
import java.beans.PropertyVetoException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JInternalFrame;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.ListModel;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import net.sf.jasperreports.view.JasperViewer;

/**
 *
 * @author USUARIO
 */
public class Crear_Compras extends javax.swing.JInternalFrame {

    /**
     * Creates new form Crear_Facturas
     */
    
    TextAutoCompleter proveedorAutoCompleter;
    TextAutoCompleter productosAutoCompleter;
    public static boolean isOpenfromCrearFacturaSelectAir = false;
    public static CajasDetalle cd = new CajasDetalle();
    public static Integer indexPositiotoolBar;
    public static String formaPagoSeelccionada;
    public static Integer codigoCompra;
    public static Integer codigoClienteCompra;
    public static boolean RegistrodeCreditoExitoso = false;
    public static boolean RegistrodeEfectivoyCambioExitoso = true;
    public static String claveAcceso;
    public static Double efectivo;
    public static Double cambio;
    public static Double costoEnviadodesdeDialog;
    public static Double cantidadEnviadadesdeDialog;
    public static String diasCrediotoconProveedor;
    public static Integer CrediotoconProveedorSiNo;
    public static Integer aumentarIvaSiNO=-1;
    public static int filacliked = -1;
    public static int columnacliked = -1;
    Integer ultimoIndexSeleccionadojcBTipoCOmporbante = 0;
    Integer ultimoIndexSeleccionadojcbSustento = 0;
    ProgressBar a = new ProgressBar(3000, "Mensaje Inicial");
    Double utilidad;
    Double descuentogeneral;
    Double descuentoItem;

    DefaultTableModel modelo = null;
    TableColumnModel columnModel;
    Double total = 0.0;
    Double subtotal = 0.0;
    Double subtotaliva12 = 0.0;
    Double subtotaliva0 = 0.0;
    Double iva = Double.valueOf(Principal.iva);
    ProgressBar msg = new ProgressBar(3000, "Mensaje Inicial");
    public static String secuenciaFac = null;
    public static String IdTipoComprabanteSeleccionado = null;
    public static String IdsustentoComprabanteSeleccionado = null;
    public static Integer codigFormaPagoSeleccionada = null;
    Boolean dobleClick = false;
    // ProgressBar msg = new ProgressBar(3000, "Mensaje Inicial");
    public static String tipoDocumento = "";
    ArrayList<Usuarios> listaU = new ArrayList<Usuarios>();
    ArrayList<sri_tipocomprobante> listatipoComprobantes = new ArrayList<sri_tipocomprobante>();
    ArrayList<sri_sustentocomprobante> listasustentoComprobantes = new ArrayList<sri_sustentocomprobante>();
    ArrayList<FormasPagoV> listaFormasDePago = new ArrayList<FormasPagoV>();
    List<Clientes> listaProveedores = new ArrayList<Clientes>();
    FormasPagoV objFormasdePago = new FormasPagoV();
    //   ArrayList<DetalleFactura> listaDetFac = new ArrayList<DetalleFactura>();
    Integer codigoUsuarioVendedorSeleccionadoJCB;
//String[] registros = new String[8];

    private void datosPredeterminadosFacturas() {
        txt_cedula.requestFocus();
        txt_cedula.setText("9999999999999");
        codigoClienteCompra = addDatosClienteonFactura(txt_cedula.getText());
        txt_cedula.setSelectionStart(0);
        txt_cedula.setSelectionEnd(txt_cedula.getText().length());
        lbl_subTotalIva.setText("Sub Total IVA " + Principal.iva + "%");
        //check_Fac.setSelected(true);
        //tipoDocumento = "FACTURA";
        txt_total_.setText("0.00");
        txt_iva_valor.setText("0.00");
        txt_subtotalIvaValor.setText("0.00");
        txt_subtotal.setText("0.00");
        txt_descuentoGenral.setText("0.00");
        txt_subtotalIvaValor.setText("0.00");
        txt_subtotalIvaValorCero.setText("0.00");
        txt_buscar_producto.setText("");
        txt_utilidad.setText("0.00");
        
        ComprasDao cDao = new ComprasDao();
        listatipoComprobantes = cDao.getlistaTipoComprobate();
        for (sri_tipocomprobante tcom : listatipoComprobantes) {
            jcb_tipoComprobante.addItem(tcom.getTipocomprobante());
            IdTipoComprabanteSeleccionado = tcom.getId();
        }

        ComprasDao c2Dao = new ComprasDao();
        listasustentoComprobantes = c2Dao.getlistasustentoComprobate();
        for (sri_sustentocomprobante suscom : listasustentoComprobantes) {
            jcb_sustentoComprobante.addItem(suscom.getSustento());

            IdsustentoComprabanteSeleccionado = suscom.getId();
        }
    }

    public Crear_Compras() {
        initComponents();
        this.setSize(1286, 720);

        proveedorAutoCompleter = new TextAutoCompleter(txt_nombres, new AutoCompleterCallback() {

            @Override
            public void callback(Object selectedItem) {

                //   System.out.println(((Clientes) selectedItem).getNombre() + " hola"); // Imprime 25
                //     Object itemSelected = clienteAutoCompleter.getItemSelected();
                if (selectedItem instanceof Proveedores) {
                    Proveedores c = new Proveedores();
                    c = ((Proveedores) selectedItem);
                    txt_cedula.setText(c.getCedula());
                    txt_celular.setText(c.getCelular());
                    txt_clienteCodigo.setText(c.getCodigo().toString());
                    txt_dir.setText(c.getDireccion());
                    codigoClienteCompra = c.getCodigo();

                    //System.out.println(((Clientes) selectedItem).getNombre() + " casas"); // Imprime 25
                } else {
                    System.out.println("El item es de un tipo desconocido");
                }

            }
        });
        proveedorAutoCompleter.setCaseSensitive(false);
        proveedorAutoCompleter.setMode(0);

//        ProveedoresDao cd = new ProveedoresDao();
//        listaProveedores = cd.listar();
//        
//        for (Proveedores p : listaProveedores) {
//            // System.out.println("Vista.Usuarios.Crear_Facturas.<init>()asdasdasdasdasdasdasvccccccccccccccccc");
//            proveedorAutoCompleter.addItem(p);
//        }
        //listaClientes = cd.buscarConNombresLike(txt_nombres.getText());
        productosAutoCompleter = new TextAutoCompleter(txtBuscar2, new AutoCompleterCallback() {

            @Override
            public void callback(Object selectedItem) {

                if (selectedItem instanceof Productos) {
                    Productos c = new Productos();
                    c = ((Productos) selectedItem);
                    ComprasDao facDao = new ComprasDao();
                    //FacturasDao facDao = new FacturasDao();
                    modelo.addRow(facDao.Buscar_registros(c.getProducto(), Principal.bodegaPredeterminadaenCOmpra.substring(0, 1)));
                    jTable1.setModel(modelo);
                    if (c.getImagen() != null) {
                        ImageIcon icon = new ImageIcon(c.getImagen());
                        Icon icono = new ImageIcon(icon.getImage().getScaledInstance(251, 205, Image.SCALE_DEFAULT));
                        foto.setText(null);
                        foto.setIcon(icono);
                    } else {
                        foto.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/producto.jpg")));
                    }

                } else {
                    System.out.println("El item es de un tipo desconocido");
                }

            }
        });

        productosAutoCompleter.setCaseSensitive(false);
        productosAutoCompleter.setMode(0);
//        ProductosDao pDao = new ProductosDao();
//        for (Productos p : pDao.listar()) {
//            System.out.println("Prod: " + p.getProducto());
//            productosAutoCompleter.addItem(p);
//        }

        ///llena secuencas facturas
        // llenarSecuenciaFacura();
        btn_nuevo.setVisible(false);
        txt_iva_valor.setText(iva.toString());
        //System.out.println("Iva: " + iva);
        datosPredeterminadosFacturas();

        jTable1.putClientProperty("terminateEditOnFocusLost", Boolean.TRUE);
        String titulos[] = {"costo", "#", "Codigo", "ARTICULO", "CANTIDAD",
            "DESCUENTO", "BODEGA",
            "P. UNIT", "P. TOTAL", "CANTIDAD"};;
        if (Principal.obligaoSINO.equalsIgnoreCase("NO")) {
            String[] titulosx
                    = {"costo", "#", "Codigo", "ARTICULO", "CANTIDAD",
                        "DESCUENTO", "BODEGA",
                        "P. UNIT", "P. TOTAL", "CANTIDAD"};
            titulos = titulosx;
        } else {
            String[] titulosx
                    = {"costo", "#", "Codigo", "ARTICULO", "CANTIDAD",
                        "DESCUENTO", "BODEGA",
                        "P. UNIT", "P. TOTAL", "CANTIDAD", "AIR"};
            titulos = titulosx;
        }

        modelo = new DefaultTableModel(null, titulos) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // make read only fields except column 0,13,14
                return column == 3 || column == 4 || column == 5 || column == 7 || column == 10;
                //  return false;
            }
        };

        jTable1.setModel(modelo);
        setModeloColumnas(jTable1);

        HoraFecha ob = new HoraFecha();
//        jdchoserNOW.setDate(ob.getFechaNowTImestampServer());
        HoraFecha ob2 = new HoraFecha();

        jdfecha.setDate(ob2.obtenerFecha());
        list2.setVisible(false);
        list1.setVisible(false);
        addOrDeleteRowTable(jTable1);
        int row = jTable1.getModel().getRowCount();
        int col = jTable1.getModel().getColumnCount();

        txt_buscar_producto.requestFocus();
        //lleno cb Vendedores
        UsuariosDao objUDao = new UsuariosDao();
        listaU = objUDao.listarVendedores();
        for (Usuarios usuarios : listaU) {
            jComboBox1.addItem(usuarios.getNombre());
        }

        System.out.println(
                "Nombre de Usuario: " + login.nombresUsuario);
        jComboBox1.setSelectedItem(login.nombresUsuario);
        /// pongo docuento predererminado

////formas de pago
        FormasPagoVDao objFdPDao = new FormasPagoVDao();
        listaFormasDePago = objFdPDao.listar();
        for (FormasPagoV f : listaFormasDePago) {
            jcbFormasPago.addItem(f.getFormaPago());
        }

        jcbFormasPago.setSelectedItem(Principal.formadepagopredeterminada);
        //codigFormaPagoSeleccionada=

////
    }

    private void addDialogoCantidad() {
        Frame frame = JOptionPane.getFrameForComponent(this);
        cantidadCompra pcdialog = new cantidadCompra(frame, true);
        int fila = jTable1.getRowCount();
        pcdialog.txt_producto.setText(modelo.getValueAt(fila - 1, 3).toString());
        pcdialog.txt_cantidad.setText(modelo.getValueAt(fila - 1, 4).toString().replace(",", "."));
        pcdialog.txt_cantidad.selectAll();
        pcdialog.setLocationRelativeTo(this);
        pcdialog.setVisible(true);
        jTable1.setValueAt(cantidadEnviadadesdeDialog, fila - 1, 4);
        //Double precio = Double.valueOf(modelo.getValueAt(fila, 8).toString().replace(",", "."));

    }

    private void addDialogoPrecio() {
        int x = MouseInfo.getPointerInfo().getLocation().x;
        int y = MouseInfo.getPointerInfo().getLocation().y;
        Frame frame = JOptionPane.getFrameForComponent(this);
        precioCompra pcdialog = new precioCompra(frame, true);
        int fila = jTable1.getRowCount();
        pcdialog.txt_producto.setText(modelo.getValueAt(fila - 1, 3).toString());
        pcdialog.precioIn = Double.parseDouble(modelo.getValueAt(fila - 1, 7).toString().replace(",", "."));
        pcdialog.txt_precio.setText(modelo.getValueAt(fila - 1, 7).toString().replace(",", "."));
        pcdialog.txt_precio.selectAll();
        pcdialog.setLocationRelativeTo(this);

        pcdialog.setVisible(true);
        jTable1.setValueAt(costoEnviadodesdeDialog, fila - 1, 7);
    }

    private void llenarSecuenciaFacura() {
        int x = MouseInfo.getPointerInfo().getLocation().x;
        int y = MouseInfo.getPointerInfo().getLocation().y;
//        DecimalFormat formateador = new DecimalFormat("000000000");
//        SeriesFacturas objSF = new SeriesFacturas();
//        SeriesFacturasDao objDaoSF = new SeriesFacturasDao();
//
//        objSF = objDaoSF.getMaxNUumeroFactura(login.CodigoDelEquipo);
//        Integer nfac = Integer.parseInt(objSF.getFac3());
//        nfac = nfac + 1;
//        String format = formateador.format(nfac);
//        txt_sec1.setText(objSF.getSec1());
//        txt_sec2.setText(objSF.getSec2());
//        txt_secNUmFac.setText(String.valueOf(format));
    }

    private void addOrDeleteRowTable(JTable table) {
        table.getModel().addTableModelListener(new TableModelListener() {

            @Override
            public void tableChanged(TableModelEvent e) {
                boolean esNUmero = false;

                if (e.getType() == TableModelEvent.UPDATE) {

                    int col = e.getColumn();
                    int fila = e.getFirstRow();
                    if (col == 3 || col == 4 || col == 5 || col == 7 || col == 10) {

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
                        ///col 10 es la col del air
                        if (col == 10) {
                            if (ValidaNUmeros.isOnlyNumbers(jTable1.getValueAt(fila, col).toString())) {
                                ComprasDao cdao = new ComprasDao();
                                if (!cdao.getTrueifCodigoAIRisCorrect(jTable1.getValueAt(fila, col).toString())) {
                                    JOptionPane.showMessageDialog(null, "EL codiogo AIR es Incorrecto");
                                    isOpenfromCrearFacturaSelectAir = true;
                                    columnacliked = col;
                                    filacliked = fila;
                                    Frame f = JOptionPane.getFrameForComponent(Crear_Compras.this);
                                    SelectPorcentajesRetencion dialog = new SelectPorcentajesRetencion(f, true);
                                    dialog.isCheckrenta = true;
                                    dialog.jTable11.setModel(Crear_RetencionC.llenartableRENTA());
                                    dialog.setLocationRelativeTo(null);
                                    dialog.setVisible(true);

                                }
                            } else {
                                JOptionPane.showMessageDialog(null, "Algo Anda muy mal");
                                jTable1.setValueAt("332", fila, col);
                            }
                        }

                        operacionFacturauPDATEandAddRowrs();
                        jTable1.setValueAt(fila, fila, 1);

//                        
//                        for (int i = 0; i < jTable1.getModel().getRowCount(); i++) {
//                            //  System.out.println("Vista.Usuarios.Crear_Facturas.addOrDeleteRowTable(): " + jTable1.getRowCount());
//                            jTable1.setValueAt("dd", i, 1);
//                        }
                    }
                }
                if (e.getType() == TableModelEvent.INSERT) {

                    operacionFacturauPDATEandAddRowrs();

                }
                if (e.getType() == TableModelEvent.DELETE) {

                }

            }
        });
/// pongo numero de item en columna1 en cada evento depus de que  se hya realizado cuaaquier accion sea update
        //delete or add row

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
        
        try {
            utilidad = 0.0;
            descuentogeneral=Double.valueOf(txt_descuentoGenral.getText().replace(",", "."));
            total = 0.0;
            subtotal = 0.0;
            subtotaliva0 = 0.0;
            subtotaliva12 = 0.0;
            Double ivadecimal = (iva / 100) + 1;
            int row = jTable1.getModel().getRowCount();
            int col = jTable1.getModel().getColumnCount();
                  System.out.println("Add_event:  row: " + row + "  col:  " + col);
            
            for (int i = 0; i < row; i++) {
               //  modelo.setValueAt(String.valueOf(precio), i, 7);
                System.out.println("INGRESA AL pRIMER for");
                Double cantidad = Double.valueOf(modelo.getValueAt(i, 4).toString().replace(",", "."));
                 Double precioold = Double.valueOf(modelo.getValueAt(i, 7).toString().replace(",", "."));
                Double precio = Double.valueOf(modelo.getValueAt(i, 7).toString().replace(",", "."));
             
                System.out.println("rows: "+row +" xx: "+precio);
                //////////descuento general
                if(descuentogeneral>0 && descuentogeneral<=100){
                  //  precio=precio-(precio*descuentogeneral)/100;
                    precio=precioold-(precioold*descuentogeneral)/100;
                }
                
                //////////fin descuento general
                
                if(aumentarIvaSiNO==1){
                precio=precioold*ivadecimal;
                }
                if(aumentarIvaSiNO==0){
                precio=precioold/ivadecimal;
             //   modelo.setValueAt(String.valueOf(precio), i, 7);
                }
  //               modelo.setValueAt(String.valueOf(precio), i, 7);
                
                Double descuento = Double.valueOf(modelo.getValueAt(i, 5).toString().replace(",", "."));

                Double costo = Double.valueOf(modelo.getValueAt(i, 0).toString().replace(",", "."));
                Double Ptotal = precio * cantidad;
                Double costoxFila = costo * cantidad;

                if (descuento > 0 && descuento <= 100) {
                    Ptotal = Ptotal - ((Ptotal * descuento) / 100);
                    //utilidad
                }
//                modelo.setValueAt(precio, i, 7);
                modelo.setValueAt(String.valueOf(String.format("%.3f", Ptotal)).replace(",", "."), i, 8);
                

                subtotal = subtotal + Ptotal; // precio*cantidad;
              
                
                total = (subtotal) * ivadecimal;
                utilidad = utilidad + (Double.valueOf(modelo.getValueAt(i, 8).toString().replace(",", ".")) - costoxFila);
//                     utilidad = utilidad + Ptotal2 - costoxFila;
                //  System.out.println("total_segundoFor: " + Double.valueOf(modelo.getValueAt(i, 8).toString().replace(",", ".")));
                txt_utilidad.setText(String.valueOf(String.format("%.2f", utilidad)).replace(",", "."));
                  txt_total_val.setText(String.valueOf(String.format("%.2f", total)).replace(",", "."));
                txt_total_.setText(String.valueOf(String.format("%.2f", total)).replace(",", "."));
                txt_subtotal.setText(String.valueOf(String.format("%.2f", subtotal)).replace(",", "."));
                txt_subtotalIvaValor.setText(String.valueOf(String.format("%.2f", subtotal)).replace(",", "."));
                txt_iva_valor.setText(String.valueOf(String.format("%.2f", (total - subtotal))).replace(",", "."));

    //            modelo.setValueAt(String.valueOf(precio), i, 7);
            }

        } catch (Exception e) {
            msg.setMensaje(e.toString());
        }
    }

    private void setModeloColumnas(JTable tb) {
        this.columnModel = tb.getColumnModel();
        this.columnModel.getColumn(0).setPreferredWidth(3);
        this.columnModel.getColumn(1).setPreferredWidth(3);
        this.columnModel.getColumn(2).setPreferredWidth(5);
        this.columnModel.getColumn(3).setPreferredWidth(300);
        this.columnModel.getColumn(4).setPreferredWidth(10);
        this.columnModel.getColumn(5).setPreferredWidth(10);
        this.columnModel.getColumn(6).setPreferredWidth(10);
        this.columnModel.getColumn(7).setPreferredWidth(10);
        this.columnModel.getColumn(8).setPreferredWidth(10);
        this.columnModel.getColumn(9).setPreferredWidth(10);
        if (Principal.obligaoSINO.equalsIgnoreCase("si")) {
            this.columnModel.getColumn(10).setPreferredWidth(10);
        }

    }

    /**
     * This method is called from within the constructor to initialize the form.
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        txt_utilidad = new javax.swing.JLabel();
        txt_clienteCodigo = new javax.swing.JLabel();
        txt_usuarioCodigo = new javax.swing.JLabel();
        jPanel2 = new javax.swing.JPanel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        txt_nombres = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        txt_celular = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        txt_dir = new javax.swing.JTextField();
        jComboBox1 = new javax.swing.JComboBox<>();
        jLabel10 = new javax.swing.JLabel();
        btn_nuevo = new javax.swing.JButton();
        txt_cedula = new javax.swing.JTextField();
        jPanel3 = new javax.swing.JPanel();
        jLabel7 = new javax.swing.JLabel();
        txt_sec1 = new javax.swing.JTextField();
        txt_secNUmFac = new javax.swing.JTextField();
        jLabel11 = new javax.swing.JLabel();
        txt_sec2 = new javax.swing.JTextField();
        txt_hora = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        jdfecha = new com.toedter.calendar.JDateChooser();
        txt_total_val = new javax.swing.JLabel();
        txt_numAutorizacion = new javax.swing.JTextField();
        jcb_tipoComprobante = new javax.swing.JComboBox<>();
        jLabel9 = new javax.swing.JLabel();
        jLabel15 = new javax.swing.JLabel();
        jcb_sustentoComprobante = new javax.swing.JComboBox<>();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jScrollPane2 = new javax.swing.JScrollPane();
        txt_buscar_producto = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        jScrollPane3 = new javax.swing.JScrollPane();
        list2 = new javax.swing.JList<>();
        jScrollPane4 = new javax.swing.JScrollPane();
        list1 = new javax.swing.JList<>();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        jcbFormasPago = new javax.swing.JComboBox<>();
        jcbPVPs = new javax.swing.JComboBox<>();
        jLabel14 = new javax.swing.JLabel();
        txtBuscar2 = new javax.swing.JTextField();
        jPanel1 = new javax.swing.JPanel();
        foto = new javax.swing.JLabel();
        jButton3 = new javax.swing.JButton();
        jPanel4 = new javax.swing.JPanel();
        txt_subtotal = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();
        jLabel13 = new javax.swing.JLabel();
        txt_descuentoGenral = new javax.swing.JTextField();
        lbl_subTotalIva = new javax.swing.JLabel();
        lbl_subTotalIva1 = new javax.swing.JLabel();
        txt_subtotalIvaValorCero = new javax.swing.JLabel();
        lbl_Iva = new javax.swing.JLabel();
        txt_iva_valor = new javax.swing.JLabel();
        lbl_subTotalIva2 = new javax.swing.JLabel();
        txt_total_ = new javax.swing.JLabel();
        txt_subtotalIvaValor = new javax.swing.JLabel();
        jPanel5 = new javax.swing.JPanel();
        jButton4 = new javax.swing.JButton();
        jButton5 = new javax.swing.JButton();

        txt_utilidad.setFont(new java.awt.Font("Tahoma", 1, 13)); // NOI18N

        txt_clienteCodigo.setText(" ");
        txt_clienteCodigo.setOpaque(true);

        txt_usuarioCodigo.setText(" ");
        txt_usuarioCodigo.setOpaque(true);

        setClosable(true);
        setMaximizable(true);
        setResizable(true);
        setTitle("Nueva Compra");
        setName(""); // NOI18N
        addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                formFocusGained(evt);
            }
        });
        addInternalFrameListener(new javax.swing.event.InternalFrameListener() {
            public void internalFrameActivated(javax.swing.event.InternalFrameEvent evt) {
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
            }
        });
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Datos del Proveedor", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 14))); // NOI18N
        jPanel2.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel4.setFont(new java.awt.Font("Tahoma", 0, 15)); // NOI18N
        jLabel4.setText("Nombres/RUC");
        jPanel2.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 30, 100, -1));

        jLabel5.setFont(new java.awt.Font("Tahoma", 0, 15)); // NOI18N
        jLabel5.setText("RUC/Cedula");
        jPanel2.add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 60, -1, -1));

        txt_nombres.setFont(new java.awt.Font("Tahoma", 0, 15)); // NOI18N
        txt_nombres.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txt_nombresFocusGained(evt);
            }
        });
        txt_nombres.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txt_nombresKeyPressed(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_nombresKeyReleased(evt);
            }
        });
        jPanel2.add(txt_nombres, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 30, 190, -1));

        jLabel6.setFont(new java.awt.Font("Tahoma", 0, 15)); // NOI18N
        jLabel6.setText("Direccion");
        jPanel2.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 90, -1, -1));

        txt_celular.setFont(new java.awt.Font("Tahoma", 0, 15)); // NOI18N
        jPanel2.add(txt_celular, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 120, 260, -1));

        jLabel8.setFont(new java.awt.Font("Tahoma", 0, 15)); // NOI18N
        jLabel8.setText("Celular");
        jPanel2.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 120, 50, -1));

        txt_dir.setFont(new java.awt.Font("Tahoma", 0, 15)); // NOI18N
        jPanel2.add(txt_dir, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 90, 260, -1));

        jComboBox1.setFont(new java.awt.Font("Tahoma", 0, 15)); // NOI18N
        jComboBox1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccione" }));
        jComboBox1.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jComboBox1ItemStateChanged(evt);
            }
        });
        jPanel2.add(jComboBox1, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 150, 230, -1));

        jLabel10.setFont(new java.awt.Font("Tahoma", 0, 15)); // NOI18N
        jLabel10.setText("Vendedor:");
        jPanel2.add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 150, -1, -1));

        btn_nuevo.setBackground(new java.awt.Color(0, 204, 51));
        btn_nuevo.setText("Nuevo");
        btn_nuevo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_nuevoActionPerformed(evt);
            }
        });
        jPanel2.add(btn_nuevo, new org.netbeans.lib.awtextra.AbsoluteConstraints(320, 30, 70, -1));

        txt_cedula.setFont(new java.awt.Font("Tahoma", 0, 15)); // NOI18N
        txt_cedula.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txt_cedulaFocusGained(evt);
            }
        });
        txt_cedula.addInputMethodListener(new java.awt.event.InputMethodListener() {
            public void caretPositionChanged(java.awt.event.InputMethodEvent evt) {
            }
            public void inputMethodTextChanged(java.awt.event.InputMethodEvent evt) {
                txt_cedulaInputMethodTextChanged(evt);
            }
        });
        txt_cedula.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                txt_cedulaPropertyChange(evt);
            }
        });
        txt_cedula.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txt_cedulaKeyPressed(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_cedulaKeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txt_cedulaKeyTyped(evt);
            }
        });
        jPanel2.add(txt_cedula, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 60, 260, -1));

        getContentPane().add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 10, 400, 192));

        jPanel3.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Datos de Cliente", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 14))); // NOI18N
        jPanel3.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel7.setText("Numero Aut.");
        jPanel3.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 20, 80, -1));

        txt_sec1.setText("001");
        txt_sec1.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txt_sec1FocusGained(evt);
            }
            public void focusLost(java.awt.event.FocusEvent evt) {
                txt_sec1FocusLost(evt);
            }
        });
        txt_sec1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_sec1KeyReleased(evt);
            }
        });
        jPanel3.add(txt_sec1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 20, 40, -1));

        txt_secNUmFac.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txt_secNUmFacFocusGained(evt);
            }
            public void focusLost(java.awt.event.FocusEvent evt) {
                txt_secNUmFacFocusLost(evt);
            }
        });
        txt_secNUmFac.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_secNUmFacKeyReleased(evt);
            }
        });
        jPanel3.add(txt_secNUmFac, new org.netbeans.lib.awtextra.AbsoluteConstraints(110, 20, 90, -1));

        jLabel11.setText("Hora:");
        jPanel3.add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 80, 40, 20));

        txt_sec2.setText("001");
        txt_sec2.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txt_sec2FocusGained(evt);
            }
            public void focusLost(java.awt.event.FocusEvent evt) {
                txt_sec2FocusLost(evt);
            }
        });
        txt_sec2.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_sec2KeyReleased(evt);
            }
        });
        jPanel3.add(txt_sec2, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 20, 40, -1));
        jPanel3.add(txt_hora, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 80, 120, 20));

        jLabel1.setText("Fecha:");
        jPanel3.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 50, -1, -1));

        jdfecha.setOpaque(false);
        jPanel3.add(jdfecha, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 50, 150, -1));

        txt_total_val.setBackground(new java.awt.Color(255, 51, 51));
        txt_total_val.setFont(new java.awt.Font("Tahoma", 1, 48)); // NOI18N
        txt_total_val.setText("0.00");
        txt_total_val.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Total", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 14))); // NOI18N
        jPanel3.add(txt_total_val, new org.netbeans.lib.awtextra.AbsoluteConstraints(390, 90, 420, 90));

        txt_numAutorizacion.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_numAutorizacionKeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txt_numAutorizacionKeyTyped(evt);
            }
        });
        jPanel3.add(txt_numAutorizacion, new org.netbeans.lib.awtextra.AbsoluteConstraints(320, 20, 480, -1));

        jcb_tipoComprobante.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jcb_tipoComprobanteItemStateChanged(evt);
            }
        });
        jPanel3.add(jcb_tipoComprobante, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 140, 350, -1));

        jLabel9.setText("Tipo de Comprobante");
        jPanel3.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 110, 140, -1));

        jLabel15.setText("Sustento Comp");
        jPanel3.add(jLabel15, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 50, -1, -1));

        jcb_sustentoComprobante.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jcb_sustentoComprobanteItemStateChanged(evt);
            }
        });
        jPanel3.add(jcb_sustentoComprobante, new org.netbeans.lib.awtextra.AbsoluteConstraints(320, 50, 480, -1));

        getContentPane().add(jPanel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(420, 10, 820, 190));
        jPanel3.getAccessibleContext().setAccessibleName("Datos de Factura");

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {

            }
        ));
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
        jTable1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                jTable1KeyTyped(evt);
            }
        });
        jScrollPane1.setViewportView(jTable1);

        getContentPane().add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 230, 900, 280));
        getContentPane().add(jScrollPane2, new org.netbeans.lib.awtextra.AbsoluteConstraints(310, 290, -1, -1));

        txt_buscar_producto.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_buscar_productoActionPerformed(evt);
            }
        });
        txt_buscar_producto.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txt_buscar_productoKeyPressed(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_buscar_productoKeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txt_buscar_productoKeyTyped(evt);
            }
        });
        getContentPane().add(txt_buscar_producto, new org.netbeans.lib.awtextra.AbsoluteConstraints(1410, 330, 320, -1));

        jLabel3.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        jLabel3.setText("BUSCAR PRODUCTOS");
        getContentPane().add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(930, 200, -1, -1));

        list2.setSelectionMode(javax.swing.ListSelectionModel.SINGLE_SELECTION);
        list2.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                list2MouseClicked(evt);
            }
        });
        list2.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                list2KeyPressed(evt);
            }
        });
        jScrollPane3.setViewportView(list2);

        getContentPane().add(jScrollPane3, new org.netbeans.lib.awtextra.AbsoluteConstraints(1440, 370, 290, 120));

        jScrollPane4.setViewportView(list1);

        getContentPane().add(jScrollPane4, new org.netbeans.lib.awtextra.AbsoluteConstraints(1410, 370, 50, 120));

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
        getContentPane().add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(990, 610, 250, 60));

        jButton2.setBackground(new java.awt.Color(255, 102, 102));
        jButton2.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        jButton2.setText("Cerrar");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton2, new org.netbeans.lib.awtextra.AbsoluteConstraints(740, 610, 200, 60));

        jLabel2.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        jLabel2.setText("Pago:");
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(920, 530, 70, 30));

        jcbFormasPago.setFont(new java.awt.Font("Tahoma", 1, 15)); // NOI18N
        jcbFormasPago.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jcbFormasPagoItemStateChanged(evt);
            }
        });
        getContentPane().add(jcbFormasPago, new org.netbeans.lib.awtextra.AbsoluteConstraints(990, 530, 250, 30));

        jcbPVPs.setFont(new java.awt.Font("Tahoma", 1, 15)); // NOI18N
        jcbPVPs.setMaximumSize(new java.awt.Dimension(2767, 3767));
        jcbPVPs.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jcbPVPsActionPerformed(evt);
            }
        });
        getContentPane().add(jcbPVPs, new org.netbeans.lib.awtextra.AbsoluteConstraints(990, 570, 250, 30));

        jLabel14.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        jLabel14.setText("PVPs:");
        getContentPane().add(jLabel14, new org.netbeans.lib.awtextra.AbsoluteConstraints(920, 570, 70, -1));

        txtBuscar2.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txtBuscar2KeyPressed(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txtBuscar2KeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtBuscar2KeyTyped(evt);
            }
        });
        getContentPane().add(txtBuscar2, new org.netbeans.lib.awtextra.AbsoluteConstraints(930, 230, 300, -1));

        jPanel1.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        foto.setName(""); // NOI18N

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(foto, javax.swing.GroupLayout.DEFAULT_SIZE, 282, Short.MAX_VALUE)
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(foto, javax.swing.GroupLayout.DEFAULT_SIZE, 233, Short.MAX_VALUE)
                .addContainerGap())
        );

        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(930, 260, 310, 250));

        jButton3.setText("+");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton3, new org.netbeans.lib.awtextra.AbsoluteConstraints(1230, 230, 40, -1));

        jPanel4.setBorder(javax.swing.BorderFactory.createTitledBorder(""));

        txt_subtotal.setFont(new java.awt.Font("Tahoma", 1, 13)); // NOI18N

        jLabel12.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel12.setText("Subtotal:");

        jLabel13.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel13.setText("%Dcto");

        txt_descuentoGenral.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        txt_descuentoGenral.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txt_descuentoGenralFocusGained(evt);
            }
        });
        txt_descuentoGenral.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txt_descuentoGenralKeyPressed(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_descuentoGenralKeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txt_descuentoGenralKeyTyped(evt);
            }
        });

        lbl_subTotalIva.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        lbl_subTotalIva.setText("Subtotal iva:");

        lbl_subTotalIva1.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        lbl_subTotalIva1.setText("Subtotal iva 0:");

        txt_subtotalIvaValorCero.setFont(new java.awt.Font("Tahoma", 1, 13)); // NOI18N

        lbl_Iva.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        lbl_Iva.setText("IVA");

        txt_iva_valor.setFont(new java.awt.Font("Tahoma", 1, 13)); // NOI18N

        lbl_subTotalIva2.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        lbl_subTotalIva2.setText("Total");

        txt_total_.setFont(new java.awt.Font("Tahoma", 1, 13)); // NOI18N

        txt_subtotalIvaValor.setFont(new java.awt.Font("Tahoma", 1, 13)); // NOI18N

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addComponent(jLabel12)
                        .addGap(28, 28, 28)
                        .addComponent(jLabel13)
                        .addGap(26, 26, 26)
                        .addComponent(lbl_subTotalIva, javax.swing.GroupLayout.PREFERRED_SIZE, 190, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(30, 30, 30)
                        .addComponent(lbl_subTotalIva1, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(80, 80, 80)
                        .addComponent(lbl_Iva, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addComponent(txt_subtotal, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(txt_descuentoGenral, javax.swing.GroupLayout.PREFERRED_SIZE, 68, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(30, 30, 30)
                        .addComponent(txt_subtotalIvaValor, javax.swing.GroupLayout.PREFERRED_SIZE, 160, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txt_subtotalIvaValorCero, javax.swing.GroupLayout.PREFERRED_SIZE, 110, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(88, 88, 88)
                        .addComponent(txt_iva_valor, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(40, 40, 40)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(lbl_subTotalIva2, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txt_total_, javax.swing.GroupLayout.PREFERRED_SIZE, 110, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(79, Short.MAX_VALUE))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel12)
                    .addComponent(jLabel13)
                    .addComponent(lbl_subTotalIva)
                    .addComponent(lbl_subTotalIva1)
                    .addComponent(lbl_Iva)
                    .addComponent(lbl_subTotalIva2))
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel4Layout.createSequentialGroup()
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(txt_subtotalIvaValorCero, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel4Layout.createSequentialGroup()
                                .addGap(8, 8, 8)
                                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(txt_descuentoGenral)
                                    .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                        .addComponent(txt_subtotal, javax.swing.GroupLayout.DEFAULT_SIZE, 20, Short.MAX_VALUE)
                                        .addComponent(txt_subtotalIvaValor, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))))
                        .addContainerGap())
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txt_total_, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txt_iva_valor, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addContainerGap(22, Short.MAX_VALUE))))
        );

        getContentPane().add(jPanel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 520, 900, 70));

        jPanel5.setBorder(javax.swing.BorderFactory.createTitledBorder(""));

        jButton4.setBackground(new java.awt.Color(102, 255, 102));
        jButton4.setText("+ IVA");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });

        jButton5.setBackground(new java.awt.Color(255, 102, 102));
        jButton5.setText("- IVA");
        jButton5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel5Layout = new javax.swing.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addContainerGap(629, Short.MAX_VALUE)
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jButton4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButton5, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addComponent(jButton4)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jButton5)
                .addContainerGap())
        );

        getContentPane().add(jPanel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 590, 710, 70));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void txt_cedulaKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_cedulaKeyTyped
        // TODO add your handling code here:
        //System.out.println("Vista.Usuarios.Crear_Facturas.txt_cedulaKeyTyped()  "+evt.getExtendedKeyCode());
        // if (txt_cedula.getText().length() < 13  ) {
//        ValidaNUmeros val = new ValidaNUmeros();
  //      val.keyTyped(evt);


    }//GEN-LAST:event_txt_cedulaKeyTyped

    private void txt_buscar_productoKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_buscar_productoKeyPressed

        System.err.println("key presed");
        if (evt.getKeyCode() == 40) {
            list2.requestFocus();
        }
        if (txt_buscar_producto.getText().isEmpty()) {
            list2.setVisible(false);
            list1.setVisible(false);
        } else {
            //System.out.println("Vista.Usuarios.Crear_Facturas.txt_buscar_productoKeyPressed()"+evt.getKeyChar());
            //if (evt.getKeyCode() != 8) {            
            FacturasDao objDao = new FacturasDao();
            list2.setModel(objDao.Buscar_productos(txt_buscar_producto.getText(), Principal.bodegaPredeterminadaenCOmpra.substring(0, 1)));
            list1.setModel(objDao.Buscar_productos_stock());
            list2.setVisible(true);
            list1.setVisible(true);
            //     }
        }

    }//GEN-LAST:event_txt_buscar_productoKeyPressed

    private void txt_buscar_productoKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_buscar_productoKeyTyped
        // TODO add your handling code here:
        System.err.println("key typed");
    }//GEN-LAST:event_txt_buscar_productoKeyTyped

    private void list2KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_list2KeyPressed
        // TODO add your handling code here:

        if (evt.getKeyCode() == 10 && !list2.getSelectedValue().equals("")) {
            FacturasDao facDao = new FacturasDao();
            String productoSelecionado = "";
            Integer index;
            index = list2.getSelectedIndex();
            list1.setSelectedIndex(index);
            productoSelecionado = list2.getSelectedValue();
            modelo.addRow(facDao.Buscar_registros(productoSelecionado, Principal.bodegaPredeterminadaenCOmpra.substring(0, 1)));
            jTable1.setModel(modelo);
//           
//            if (Principal.permitirvendersinstock.equals("SI")) {
//                 modelo.addRow(facDao.Buscar_registros(productoSelecionado, Principal.bodegaPredeterminadaenVenta.substring(0, 1)));
//                jTable1.setModel(modelo);
//            } else {
//                if (Double.parseDouble(list1.getSelectedValue()) > 0) {
//                    modelo.addRow(facDao.Buscar_registros(productoSelecionado, Principal.bodegaPredeterminadaenVenta.substring(0, 1)));
//                    jTable1.setModel(modelo);
//                } else {
//                    JOptionPane.showMessageDialog(null, productoSelecionado + " NO TIENE STOCK");
//                }
//            }

        }
    }//GEN-LAST:event_list2KeyPressed


    private void list2MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_list2MouseClicked
        // TODO add your handling code here:
        if (evt.getClickCount() == 2 && !list2.getSelectedValue().equals("")) {
            FacturasDao facDao = new FacturasDao();
            String productoSelecionado = "";
            Integer index;
            index = list2.getSelectedIndex();
            list1.setSelectedIndex(index);
            productoSelecionado = list2.getSelectedValue();
            modelo.addRow(facDao.Buscar_registros(productoSelecionado, Principal.bodegaPredeterminadaenCOmpra.substring(0, 1)));
            jTable1.setModel(modelo);

//            if (Principal.permitirvendersinstock.equals("SI")) {
//                modelo.addRow(facDao.Buscar_registros(productoSelecionado, Principal.bodegaPredeterminadaenVenta.substring(0, 1)));
//                jTable1.setModel(modelo);
//            } else {
//                if (Double.parseDouble(list1.getSelectedValue()) > 0) {
//                    modelo.addRow(facDao.Buscar_registros(productoSelecionado, Principal.bodegaPredeterminadaenVenta.substring(0, 1)));
//                    jTable1.setModel(modelo);
//                } else {
//                    JOptionPane.showMessageDialog(null, productoSelecionado + " NO TIENE STOCK");
//                }
//            }
        }
    }//GEN-LAST:event_list2MouseClicked

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        // TODO add your handling code here:

        int x = MouseInfo.getPointerInfo().getLocation().x;
        int y = MouseInfo.getPointerInfo().getLocation().y;
        System.out.println("X  AND Y : " + x + " - " + y);
        if (evt.getButton() == MouseEvent.BUTTON1) {
            System.out.println("BOTON 1");
            // operacionFacturauPDATEandAddRowrs();
        }
        if (evt.getButton() == MouseEvent.BUTTON2) {
            System.out.println("BOTON 2");
        }
        if (evt.getButton() == MouseEvent.BUTTON3) {
            System.out.println("BOTON 3");
        }
        try {

            if (evt.getClickCount() == 3) {
                if (jTable1.getSelectedRow() != -1) {
                    // remove selected row from the model
                    if (jTable1.getRowCount() > 0) {
                        ///eliminamos la fila seleccionada y actualizamos el total de la factura
                        int row = jTable1.getSelectedRow();
                        Double costo = Double.valueOf(modelo.getValueAt(row, 0).toString().replace(",", "."));
                        Double cantidad = Double.valueOf(modelo.getValueAt(row, 4).toString().replace(",", "."));
                        Double Ptotal = Double.valueOf(modelo.getValueAt(row, 8).toString().replace(",", "."));
                        Double costoxFila = costo * cantidad;
                        Double totaltemp = Double.valueOf(txt_total_val.getText().toString().replace(",", "."));
                        Double Utilidadtemp = Double.valueOf(txt_utilidad.getText().toString().replace(",", "."));

                        total = totaltemp - Double.valueOf(jTable1.getValueAt(row, 8).toString().replace(",", "."));
                        utilidad = Utilidadtemp - (Ptotal - costoxFila);
                        //Double.valueOf(modelo.getValueAt(row, 7).toString().replace(",", "."));
                        //txt_pvp.setText(String.valueOf(String.format("%.4f", pvp1)));
                        txt_total_val.setText(String.valueOf(String.format("%.2f", total)).replace(",", "."));
                        txt_total_.setText(String.valueOf(String.format("%.2f", total)).replace(",", "."));
                        txt_utilidad.setText(String.valueOf(String.format("%.2f", utilidad)).replace(",", "."));
                        Double ivadecimal = (this.iva / 100) + 1;
                        subtotal = total / ivadecimal;
                        txt_subtotal.setText(String.valueOf(String.format("%.2f", subtotal)).replace(",", "."));
                        txt_subtotalIvaValor.setText(String.valueOf(String.format("%.2f", subtotal)).replace(",", "."));
                        //txt_iva_valor.setText(total-subtotal);
                        txt_iva_valor.setText(String.valueOf(String.format("%.2f", (total - subtotal))).replace(",", "."));
                        modelo.removeRow(row);

                    }

                }
            }
        } catch (Exception e) {
            msg.setMensaje(e.toString());
        }

    }//GEN-LAST:event_jTable1MouseClicked

    private void jTable1KeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTable1KeyTyped
        // TODO add your handling code here:
        System.out.println("Vista.Usuarios.Crear_Facturas.jTable1KeyTyped()   enteeerrrr" + evt.getKeyCode());
        if (evt.getKeyCode() == 10) {
            System.out.println("Vista.Usuarios.Crear_Facturas.jTable1KeyTyped()   enteeerrrr");
            // list1.requestFocus();
            list2.requestFocus();
        }
    }//GEN-LAST:event_jTable1KeyTyped


    private void jTable1InputMethodTextChanged(java.awt.event.InputMethodEvent evt) {//GEN-FIRST:event_jTable1InputMethodTextChanged
        // TODO add your handling code here:
    }//GEN-LAST:event_jTable1InputMethodTextChanged

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed

        Compras u = new Compras();

        /*creo el codigoAcceso*/
        String ruc = "";
        if (txt_cedula.getText().length() == 10) {
            ruc = txt_cedula.getText() + "001";
        } else if (txt_cedula.getText().length() == 13) {
            ruc = txt_cedula.getText();
        }

        claveAcceso = txt_numAutorizacion.getText();
        if (!txt_cedula.getText().isEmpty() && !txt_nombres.getText().isEmpty() && codigoClienteCompra != null && !txt_sec1.getText().isEmpty() && !txt_sec2.getText().isEmpty() && !txt_secNUmFac.getText().isEmpty()) {
            //  JOptionPane.showMessageDialog(null, "codigo: " + codigoClienteFactura);
            if (jTable1.getRowCount() != 0) {
                u.setEstablecimiento(txt_sec1.getText());
                u.setPtoEmision(txt_sec2.getText());
                u.setSecfactura(txt_secNUmFac.getText());
                u.setProveedores_codigo(Integer.valueOf(txt_clienteCodigo.getText()));
                u.setUsuarios_Codigo(Integer.valueOf(txt_usuarioCodigo.getText()));
                u.setDescuento(txt_descuentoGenral.getText());
                u.setEquipo(login.nombreDelEquipo);
                u.setFecha(jdfecha.getDate());
                u.setIva(iva.toString());
                secuenciaFac = txt_sec1.getText() + "-" + txt_sec2.getText() + "-" + txt_secNUmFac.getText();
                u.setSecuencia(secuenciaFac);
                u.setSubtotaI_con_iva(txt_subtotalIvaValor.getText());
                u.setSubtotal_sin_iva(txt_subtotalIvaValorCero.getText());

                u.setTotal(txt_total_val.getText());
                u.setUtilidad(this.utilidad.toString());
                u.setUsuarios_Codigo(this.codigoUsuarioVendedorSeleccionadoJCB);
                String fechaInicio = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdfecha.getDate().toString());
                u.setIva_valor(txt_iva_valor.getText());
                u.setFechain(fechaInicio);
                u.setCalveAcceso(claveAcceso);

                for (sri_tipocomprobante t : listatipoComprobantes) {
                    if (jcb_tipoComprobante.getSelectedItem().toString().contains(t.getTipocomprobante())) {
                        IdTipoComprabanteSeleccionado = t.getId();
                        tipoDocumento = t.getTipocomprobante();
                    }
                }

                for (sri_sustentocomprobante t : listasustentoComprobantes) {
                    if (jcb_sustentoComprobante.getSelectedItem().toString().contains(t.getSustento())) {
                        IdsustentoComprabanteSeleccionado = t.getId();

                    }
                }
                u.setTipo_documentoID(IdTipoComprabanteSeleccionado);
                u.setTipo_documento(jcb_tipoComprobante.getSelectedItem().toString());
                u.setSustento(jcb_sustentoComprobante.getSelectedItem().toString());
                u.setSustentoID(IdsustentoComprabanteSeleccionado);

                Cxp pagos = new Cxp();
                cxpDao pagosDao = new cxpDao();
                ComprasDao objFacDao = new ComprasDao();
//                CajasDetalleDao cdDao = new CajasDetalleDao();
                Double Ptotal = 0.0;

                int col = jTable1.getColumnCount();
                int row = jTable1.getRowCount();
                SeriesFacturas objSF = new SeriesFacturas();
                SeriesFacturasDao objDaoSF = new SeriesFacturasDao();
                String rutaInforme = "";
                Map parametros = new HashMap();
                switch (jcbFormasPago.getSelectedItem().toString()) {

                    case "EFECTIVO":
                        formaPagoSeelccionada = jcbFormasPago.getSelectedItem().toString();
                        u.setFormaPago(formaPagoSeelccionada);
                        u.setCalveAcceso(claveAcceso);
                        u.setEfectivo(0.0);
                        u.setCambio(0.0);
                        codigoCompra = objFacDao.guardar(u);
                        if (RegistrodeEfectivoyCambioExitoso) {

                            /* EFECTIVO*/

 /* REGISTO PAGO EN EFECTIVO Y VUELTO*/
                            System.out.println("Vista.Usuarios.Crear_Facturas.facfafac()");
                            DetalleCompra df = new DetalleCompra();

                            for (int i = 0; i < row; i++) {
                                Productos pr = new Productos();
                                ProductosDao productoDao = new ProductosDao();
                                ProductosDao prodconsultaDao = new ProductosDao();
                                Kardex k = new Kardex();
                                KardexDao kDao = new KardexDao();
                                DetalleComprasDao dfDao = new DetalleComprasDao();
                                Double iva12 = 0.0;
                                Double BaseImponible = 0.0;
                                df.setCantidad(jTable1.getValueAt(i, 4).toString());
                                df.setDetalle(jTable1.getValueAt(i, 3).toString());
                                Ptotal = Double.valueOf(jTable1.getValueAt(i, 8).toString().replace(",", "."));
                                BaseImponible = Ptotal / ((this.iva / 100) + 1);
                                iva12 = Ptotal - BaseImponible;
                                //                 JOptionPane.showMessageDialog(rootPane, String.valueOf(String.format("%.4f", iva)).replace(",", "."));
                                df.setIva(String.valueOf(String.format("%.4f", iva12)).replace(",", "."));
                                Double ivaDecimal = ((this.iva / 100) + 1);
                                Double valorUnitarioSinIVA = Double.valueOf(jTable1.getValueAt(i, 7).toString().replace(",", "."));
                                valorUnitarioSinIVA = (valorUnitarioSinIVA / ivaDecimal);
                                Double valorTotalSinIVA = Double.valueOf(jTable1.getValueAt(i, 8).toString().replace(",", "."));
                                valorTotalSinIVA = valorTotalSinIVA / ivaDecimal;
                                df.setDescuento(jTable1.getValueAt(i, 5).toString());
                                df.setValorUnitario(String.valueOf(String.format("%.4f", valorUnitarioSinIVA)).replace(",", "."));
                                df.setValorTotal(String.valueOf(String.format("%.4f", valorTotalSinIVA)).replace(",", "."));

                                //   JOptionPane.showMessageDialog(rootPane,"VU: "+valorUnitarioSinIVA);
                                // JOptionPane.showMessageDialog(rootPane,"VT: "+valorTotalSinIVA);
                                df.setCompra_Codigo(codigoCompra);
                                df.setProductos_codigo(Integer.valueOf(jTable1.getValueAt(i, 2).toString()));
                                k.setBodega(jTable1.getValueAt(i, 6).toString());
                                k.setFecha(jdfecha.getDate());
                                k.setDetalle("INGRESO -- " + tipoDocumento + " " + secuenciaFac);
                                k.setOutcantidad("0");
                                k.setIncantidad(jTable1.getValueAt(i, 4).toString());
                                k.setIncosto(jTable1.getValueAt(i, 0).toString());
                                k.setInpvp(jTable1.getValueAt(i, 7).toString());
                                //  k.setSaldocantidad(secuenciaFac);
                                Integer codigoProducto = Integer.parseInt(jTable1.getValueAt(i, 2).toString());
                                k.setProductos_Codigo(codigoProducto);
                                ////lleno informacion para actualizar el costo del producto
                                pr = prodconsultaDao.buscarConID(codigoProducto);
                                Double porvcentajeDeUtilidad = Double.parseDouble(pr.getUtilidad());
                                String costoUnitario = jTable1.getValueAt(i, 7).toString().replace(",", ".");
                                JOptionPane.showMessageDialog(null, "val: " + costoUnitario);
                                Double costounitario = Double.parseDouble(costoUnitario);

                                Double pvp = (costounitario + (porvcentajeDeUtilidad * costounitario) / 100);
                                pr.setCodigo(codigoProducto);
                                pr.setCosto(String.valueOf(String.format("%.4f", costounitario)).replace(",", "."));
                                pr.setPvp(String.valueOf(String.format("%.4f", pvp)).replace(",", "."));

                                String valunitadoString = (String.valueOf(String.format("%.4f", valorUnitarioSinIVA)).replace(",", "."));
                                Double vau = Double.parseDouble(valunitadoString);
                                pr.setBase(vau);
                                dfDao.guardar(df);
                                kDao.guardar(k);
                                productoDao.modificarPreciosAlRegistrarCompra(pr);

                            }
                            limpiarIntefazVentas();
                            ///IMPRESION DEL DOCUMENTO
//                                rutaInforme = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\FACTURA.jasper";
//                                parametros.put("numeroFactura", secuenciaFac);
//                                for (int i = 0; i < Integer.parseInt(Principal.numerovecseimpresionFactura); i++) {
//                                    ImpresionDao imp = new ImpresionDao();
//                                    imp.impresionDontShowReport(parametros, rutaInforme);
//                                }
                            //* enviamoa a crear i firmar factura electronica*/
                            //  objFacDao.creaxmlFacturaElectronica(codigoFactura);
//                            FacturasDao fad = new FacturasDao();
//                            fad.creaxmlFacturaElectronica(codigoFactura);
                            /* fincreacion facura electronica*/

                        }
                        break;

                    case "CREDITO":

                        if (codigoClienteCompra != null && !txt_cedula.getText().contains("9999999999")) {

                            formaPagoSeelccionada = jcbFormasPago.getSelectedItem().toString();

                            u.setFormaPago(formaPagoSeelccionada);
                            u.setCalveAcceso(claveAcceso);
                            u.setEfectivo(0.00);
                            u.setCambio(0.00);
                            Frame frame = JOptionPane.getFrameForComponent(this);
                            PagoCreditoCompras pcdialog = new PagoCreditoCompras(frame, true);
                            pcdialog.txt_total.setText(txt_total_val.getText());
                            formaPagoSeelccionada = jcbFormasPago.getSelectedItem().toString();
                            pcdialog.txt_saldo.setText(txt_total_val.getText());
                            u.setFormaPago(formaPagoSeelccionada);
                            u.setEfectivo(0.00);
                            u.setCambio(0.00);
                            pcdialog.comp = u;
                            pcdialog.setVisible(true);

                            if (RegistrodeCreditoExitoso) {
                                DetalleCompra df = new DetalleCompra();
                                for (int i = 0; i < row; i++) {
                                    Kardex k = new Kardex();
                                    KardexDao kDao = new KardexDao();
                                    DetalleComprasDao dfDao = new DetalleComprasDao();
                                    Double iva12 = 0.0;
                                    Double BaseImponible = 0.0;
                                    df.setCantidad(jTable1.getValueAt(i, 4).toString());
                                    df.setDetalle(jTable1.getValueAt(i, 3).toString());
                                    Ptotal = Double.valueOf(jTable1.getValueAt(i, 8).toString().replace(",", "."));
                                    BaseImponible = Ptotal / ((this.iva / 100) + 1);
                                    iva12 = Ptotal - BaseImponible;
                                    df.setIva(String.valueOf(String.format("%.4f", iva12)).replace(",", "."));
                                    Double ivaDecimal = ((this.iva / 100) + 1);
                                    Double valorUnitarioSinIVA = Double.valueOf(jTable1.getValueAt(i, 7).toString().replace(",", "."));
                                    valorUnitarioSinIVA = (valorUnitarioSinIVA / ivaDecimal);
                                    Double valorTotalSinIVA = Double.valueOf(jTable1.getValueAt(i, 8).toString().replace(",", "."));
                                    valorTotalSinIVA = valorTotalSinIVA / ivaDecimal;
                                    df.setDescuento(jTable1.getValueAt(i, 5).toString());
                                    df.setValorUnitario(String.valueOf(String.format("%.4f", valorUnitarioSinIVA)).replace(",", "."));
                                    df.setValorTotal(String.valueOf(String.format("%.4f", valorTotalSinIVA)).replace(",", "."));

                                    df.setCompra_Codigo(codigoCompra);
                                    df.setProductos_codigo(Integer.valueOf(jTable1.getValueAt(i, 2).toString()));
                                    dfDao.guardar(df);
                                    k.setBodega(jTable1.getValueAt(i, 6).toString());
                                    k.setFecha(jdfecha.getDate());
                                    k.setDetalle("INGRESO -- " + tipoDocumento + " " + secuenciaFac);
                                    k.setOutcantidad("0");
                                    k.setIncantidad(jTable1.getValueAt(i, 4).toString());
                                    k.setIncosto(jTable1.getValueAt(i, 0).toString());
                                    k.setInpvp(jTable1.getValueAt(i, 7).toString());
                                    //  k.setSaldocantidad(secuenciaFac);
                                    k.setProductos_Codigo(Integer.parseInt(jTable1.getValueAt(i, 2).toString()));
                                    kDao.guardar(k);

                                }
//                                    ///GUARDO LAS SERIES D ELA FACTURA
//
//                                    objSF.setSec1(txt_sec1.getText());
//                                    objSF.setSec2(txt_sec2.getText());
//                                    objSF.setFac3(txt_secNUmFac.getText());
//                                    objSF.setEquipos_Codigo(login.CodigoDelEquipo);
//                                    objDaoSF.guardar(objSF);
                                limpiarIntefazVentas();
////
////                                    ///IMPRESION DEL DOCUMENTO
////                                    rutaInforme = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\FACTURA.jasper";
////
////                                    //    001-001-0000022
////                                    //parametros.put("numeroFactura", secuenciaFac);
////                                    parametros.put("numeroFactura", secuenciaFac);
//                                    for (int i = 0; i < Integer.parseInt(Principal.numerovecseimpresionFactura); i++) {
//
//                                        ImpresionDao imp = new ImpresionDao();
//                                        imp.impresionDontShowReport(parametros, rutaInforme);
//                                    }
//                                    FacturasDao fad = new FacturasDao();
//                                    fad.creaxmlFacturaElectronica(codigoFactura);
                            }

                        } else {
                            JOptionPane.showMessageDialog(null, "Debe seleccionar un cliente para registrar el Credito", "Aviso Importante", 0, frameIcon);
                        }
                        break;
                    case "CHEQUE":

                        break;
                    case "MIXTO":

                        break;
                    case "TRANSFERENCIA":

                        break;
                }
/////////FACTURA ELECTRONICA////////////

////////FACTURA ELECTRONICA//////////////
////////////////////
                ///vavi tabla detalle 
            } else {
                a.setProgressBar_mensajae("No existen Articulos a facturar");
            }

        } else {

            a.setProgressBar_mensajae("Debes LLenar los campos Obligatorios");
        }

    }//GEN-LAST:event_jButton1ActionPerformed

    private void limpiarIntefazVentas() {
        while (modelo.getRowCount() > 0) {
            modelo.removeRow(0);
        }
        jTable1.setModel(modelo);
        VaciarTexto vt = new VaciarTexto();
        vt.limpiar_texto(jPanel2);
        txt_total_val.setText("0.00");
        llenarSecuenciaFacura();
        datosPredeterminadosFacturas();
        list1.setVisible(false);
        list2.setVisible(false);
    }
    private void jButton1PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_jButton1PropertyChange
        // TODO add your handling code here:
        //if(evt.getPropertyName())
        if (jButton1.getText().equals("Actualizar")) {
            //jcb_estado.setSelectedItem("");
        }
        System.out.println("Vista.Usuarios.Crear_Usuarios.jButton1Prop,,,,,,,,ertyChange()" + evt.getNewValue());
    }//GEN-LAST:event_jButton1PropertyChange

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:
        this.dispose();
    }//GEN-LAST:event_jButton2ActionPerformed

    private void formFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_formFocusGained
        // TODO add your handling code here:

        //addDatosClienteonFactura();
    }//GEN-LAST:event_formFocusGained

    private void txt_cedulaFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_cedulaFocusGained
    }//GEN-LAST:event_txt_cedulaFocusGained

    private void jComboBox1ItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jComboBox1ItemStateChanged
        // TODO add your handling code here:
        for (Usuarios usuarios : listaU) {
            if (usuarios.getNombre().equals(jComboBox1.getSelectedItem())) {
                this.codigoUsuarioVendedorSeleccionadoJCB = usuarios.getCodigo();
                txt_usuarioCodigo.setText(codigoUsuarioVendedorSeleccionadoJCB.toString());

            }

        }
        System.out.println("Vista.Usuarios.Crear_Facturas.jComboBox1ItemStateChanged(): " + evt.getItem());
    }//GEN-LAST:event_jComboBox1ItemStateChanged

    private void txt_cedulaInputMethodTextChanged(java.awt.event.InputMethodEvent evt) {//GEN-FIRST:event_txt_cedulaInputMethodTextChanged
        // TODO add your handling code here

    }//GEN-LAST:event_txt_cedulaInputMethodTextChanged

    private void txt_cedulaPropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_txt_cedulaPropertyChange
        // TODO add your handling code here:

    }//GEN-LAST:event_txt_cedulaPropertyChange

    private void txt_cedulaKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_cedulaKeyReleased
//        if (txt_cedula.getText().length() == 10 && txt_cedula.getText() != "9999999999" || txt_cedula.getText().length() == 13 && txt_cedula.getText() != "9999999999999") {
//            if (evt.getKeyCode() == KeyEvent.VK_ENTER) {
//                if (ValidaCedula.validaRUC(txt_cedula.getText())) {
//
//                    if (addDatosClienteonFactura(txt_cedula.getText()) == null) {
//                        Crear_Clientes obj_crearC = new Crear_Clientes();
//                        Principal.desktopPane.add(obj_crearC);
//                        obj_crearC.setVisible(true);
//                        Crear_Clientes.txt_cedulax.setText(txt_cedula.getText());
//                        //Crear_Proveedores.txt_cedula.setText(txt_cedula.getText());
//                        try {
//                            obj_crearC.setSelected(true);
//
//                        } catch (PropertyVetoException ex) {
//                            Logger.getLogger(Crear_Compras.class
//                                    .getName()).log(Level.SEVERE, null, ex);
//                        }
//
//                        // btn_nuevo.setVisible(true);
//                    }
//                } else {
//
//                    //    JOptionPane.showMessageDialog(null, "Cedula o RUC mal Formada.");
//                }
//
//            }
//        }


    }//GEN-LAST:event_txt_cedulaKeyReleased

    private void txt_buscar_productoKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_buscar_productoKeyReleased
        // TODO add your handling code here:
        System.err.println("key relesedd");

    }//GEN-LAST:event_txt_buscar_productoKeyReleased

    private void btn_nuevoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_nuevoActionPerformed
        // TODO add your handling code here:
        Crear_Proveedores obj_crearC = new Crear_Proveedores();
        Principal.desktopPane.add(obj_crearC);
        obj_crearC.setVisible(true);
        Crear_Proveedores.txt_cedula.setText(txt_cedula.getText());
        try {
            obj_crearC.setSelected(true);

        } catch (PropertyVetoException ex) {
            Logger.getLogger(Crear_Compras.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_btn_nuevoActionPerformed

    private void txt_sec1FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_sec1FocusLost
        // TODO add your handling code here:
    txt_sec1.setText(OperacionesForms.validaNumeroFactura3(txt_sec1.getText()));
    }//GEN-LAST:event_txt_sec1FocusLost

    private void formInternalFrameClosed(javax.swing.event.InternalFrameEvent evt) {//GEN-FIRST:event_formInternalFrameClosed
        // TODO add your handling code here:
//        Principal.toolbar.remove(indexPositiotoolBar);
    }//GEN-LAST:event_formInternalFrameClosed

    private void jcbFormasPagoItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcbFormasPagoItemStateChanged
        // TODO add your handling code here:
        FormasPagoV f = new FormasPagoV();
        FormasPagoVDao fDao = new FormasPagoVDao();
        f = fDao.buscarConFormaPago(evt.getItem().toString());
        this.codigFormaPagoSeleccionada = f.getCodigo();
    }//GEN-LAST:event_jcbFormasPagoItemStateChanged

    private void txt_buscar_productoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_buscar_productoActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_buscar_productoActionPerformed

    private void jcbPVPsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jcbPVPsActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jcbPVPsActionPerformed

    private void jcb_tipoComprobanteItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcb_tipoComprobanteItemStateChanged
        // TODO add your handling code here:

        for (sri_tipocomprobante t : listatipoComprobantes) {
            if (jcb_tipoComprobante.getSelectedItem().toString().contains(t.getTipocomprobante())) {
                IdTipoComprabanteSeleccionado = t.getId();
                tipoDocumento = t.getTipocomprobante();
                ultimoIndexSeleccionadojcBTipoCOmporbante = 10;
            }

        }
    }//GEN-LAST:event_jcb_tipoComprobanteItemStateChanged

    private void jcb_sustentoComprobanteItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcb_sustentoComprobanteItemStateChanged
        // TODO add your handling code here:

        for (sri_sustentocomprobante t : listasustentoComprobantes) {
            if (jcb_sustentoComprobante.getSelectedItem().toString().contains(t.getSustento())) {
                IdsustentoComprabanteSeleccionado = t.getId();
                ultimoIndexSeleccionadojcbSustento = 10;

            }

        }
    }//GEN-LAST:event_jcb_sustentoComprobanteItemStateChanged

    private void txtBuscar2KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtBuscar2KeyReleased
        // TODO add your handling code here:

        //System.out.println("relesed :  "+txtBuscar2.getText());
        if (evt.getKeyCode() == 10) {
            if (!txtBuscar2.getText().equalsIgnoreCase("")) {
                txtBuscar2.setText("");
                addDialogoCantidad();
                addDialogoPrecio();
            }
        } else {

            ProductosDao pDao = new ProductosDao();
            productosAutoCompleter.removeAllItems();
            for (Productos p : pDao.listarlike(txtBuscar2.getText())) {
                System.out.println("Prod: " + p.getProducto());
                System.out.println("prod: " + p.getProducto());
                productosAutoCompleter.addItem(p);
            }

        }
    }//GEN-LAST:event_txtBuscar2KeyReleased

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        // TODO add your handling code here:

        Integer numVentana = 0;
        JInternalFrame v[] = desktopPane.getAllFrames();
        if (v.length >= 1) {

            for (int i = 0; i < v.length; i++) {
                if (v[i] instanceof Crear_Productos) {

                    if (numVentana == 0) {
                        numVentana = 100;
                        try {
                            v[i].setSelected(true);

                        } catch (PropertyVetoException ex) {
                            Logger.getLogger(Principal.class
                                    .getName()).log(Level.SEVERE, null, ex);
                        }
                    } else {
                        v[i].dispose();
                    }
                } else {
                    if (numVentana == 0) {

                        numVentana = 100;
                        Crear_Productos obj = new Crear_Productos();
                        desktopPane.add(obj);
                        obj.setVisible(true);
                        JButton a = new JButton("Crear Productos");
                    }
                }

            }
            numVentana = 0;
        } else {
            Crear_Productos obj = new Crear_Productos();
            desktopPane.add(obj);
            obj.setVisible(true);
            JButton a = new JButton("Crear Productos");
        }

    }//GEN-LAST:event_jButton3ActionPerformed

    private void txtBuscar2KeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtBuscar2KeyTyped
        //      System.out.println("cadena: " + txtBuscar2.getText() + " - KeyTyped:  " + evt.getKeyChar());

        // TODO add your handling code here:
    }//GEN-LAST:event_txtBuscar2KeyTyped

    private void txtBuscar2KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtBuscar2KeyPressed
//        System.out.println("cadena: " + txtBuscar2.getText() + " - Presed:  " + evt.getKeyChar());
        // TODO add your handling code here:
    }//GEN-LAST:event_txtBuscar2KeyPressed

    private void txt_nombresKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_nombresKeyReleased
        // TODO add your handling code here:
//
//        if (evt.getKeyCode() == 10) {
//
//        } else {
//
//            ProveedoresDao pDao = new ProveedoresDao();
//            proveedorAutoCompleter.removeAllItems();
//            for (Proveedores p : pDao.listarlike(txt_nombres.getText())) {  //.listarlike(txtBuscar2.getText())) {
//                System.out.println("Prod: " + p.getNombre());
//                proveedorAutoCompleter.addItem(p);
//            }
//        }
    }//GEN-LAST:event_txt_nombresKeyReleased

    private void txt_nombresFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_nombresFocusGained
        // TODO add your handling code here:
        //txt_nombres.selectAll();
    }//GEN-LAST:event_txt_nombresFocusGained

    private void txt_sec1KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_sec1KeyReleased
        // TODO add your handling code here:
        //if (!ValidaNUmeros.isOnlyNumbers(txt_sec1.getText())||  !(txt_sec1.getText().length() <= 3)) {
        txt_sec1.setText(OperacionesForms.ValidaNumeroFacturaCompraKeyRelesed3(txt_sec1.getText()));    
        if(txt_sec1.getText().equals("000")){
            txt_sec1.selectAll();            
        }

    }//GEN-LAST:event_txt_sec1KeyReleased

    private void txt_sec1FocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_sec1FocusGained

        txt_sec1.selectAll();
    }//GEN-LAST:event_txt_sec1FocusGained

    private void txt_sec2FocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_sec2FocusGained
        // TODO add your handling code here:
        txt_sec2.selectAll();
    }//GEN-LAST:event_txt_sec2FocusGained

    private void txt_sec2FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_sec2FocusLost
        // TODO add your handling code here:
         txt_sec2.setText(OperacionesForms.validaNumeroFactura3(txt_sec2.getText()));
    }//GEN-LAST:event_txt_sec2FocusLost

    private void txt_sec2KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_sec2KeyReleased
        // TODO add your handling code here:
        txt_sec2.setText(OperacionesForms.ValidaNumeroFacturaCompraKeyRelesed3(txt_sec2.getText()));    
        if(txt_sec2.getText().equals("001")){
            txt_sec2.selectAll();            
        }
        
        

    }//GEN-LAST:event_txt_sec2KeyReleased

    private void txt_secNUmFacFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_secNUmFacFocusGained
        // TODO add your handling code here:
        txt_secNUmFac.selectAll();
    }//GEN-LAST:event_txt_secNUmFacFocusGained

    private void txt_secNUmFacFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_secNUmFacFocusLost
        // TODO add your handling code here:
        
        txt_secNUmFac.setText(OperacionesForms.validaNumeroFactura9(txt_secNUmFac.getText()));
    }//GEN-LAST:event_txt_secNUmFacFocusLost

    private void txt_secNUmFacKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_secNUmFacKeyReleased
    txt_secNUmFac.setText(OperacionesForms.ValidaNumeroFacturaCompraKeyRelesed9(txt_secNUmFac.getText()));
    if(txt_secNUmFac.getText().equals("000000001")){
            txt_secNUmFac.selectAll();            
        }
    
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_secNUmFacKeyReleased

    private void txt_numAutorizacionKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_numAutorizacionKeyReleased
        // TODO add your handling code here:
        //txt_numAutorizacion.setText(OperacionesForms.ValidaNumeroFacturaCompraNumeroAutorizacion(txt_numAutorizacion.getText()));
        ValidaNUmeros.keyTyped(evt);
    }//GEN-LAST:event_txt_numAutorizacionKeyReleased

    private void txt_numAutorizacionKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_numAutorizacionKeyTyped
        // TODO add your handling code here:
        ValidaNUmeros.keyTyped(evt);
    }//GEN-LAST:event_txt_numAutorizacionKeyTyped

    private void txt_descuentoGenralKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_descuentoGenralKeyTyped
        // TODO add your handling code here:
        
        
    }//GEN-LAST:event_txt_descuentoGenralKeyTyped

    private void txt_descuentoGenralKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_descuentoGenralKeyPressed
        // TODO add your handling code here:
        
    }//GEN-LAST:event_txt_descuentoGenralKeyPressed

    private void txt_descuentoGenralKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_descuentoGenralKeyReleased
        // TODO add your handling code here:
        if(!ValidaNUmeros.isOnlyDouble(txt_descuentoGenral.getText())){
        txt_descuentoGenral.setText("0.00");
        }else{
        operacionFacturauPDATEandAddRowrs();
        }
    }//GEN-LAST:event_txt_descuentoGenralKeyReleased

    private void txt_descuentoGenralFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_descuentoGenralFocusGained
        // TODO add your handling code here:
        txt_descuentoGenral.selectAll();
    }//GEN-LAST:event_txt_descuentoGenralFocusGained

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
       aumentarIvaSiNO=1;
       operacionFacturauPDATEandAddRowrs();
       aumentarIvaSiNO=-1;
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton4ActionPerformed

    private void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5ActionPerformed
        // TODO add your handling code here:
        aumentarIvaSiNO=0;
       operacionFacturauPDATEandAddRowrs();
       aumentarIvaSiNO=-1;
    }//GEN-LAST:event_jButton5ActionPerformed

    private void txt_cedulaKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_cedulaKeyPressed

    }//GEN-LAST:event_txt_cedulaKeyPressed

    private void txt_nombresKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_nombresKeyPressed
        // TODO add your handling code here:
        
                // TODO add your handling code here:
        
        //************************************
        System.out.println("Vista.Usuarios.Crear_Facturas.txt_nombresKeyPressed()xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
        String ruc = "";

        if (ValidaNUmeros.isOnlyNumbers(txt_nombres.getText()) && KeyEvent.VK_ENTER == evt.getKeyCode()) {
            if ((txt_nombres.getText().length() == 10 || txt_nombres.getText().length() == 13)) {

                ruc = txt_nombres.getText();
                //  JOptionPane.showMessageDialog(null, ruc);
                System.out.println("Vista.Usuarios.Crear_Facturas.txt_nombresKeyPressed()llllllllllllllllllllllllll");
                if (addDatosClienteonFactura(txt_nombres.getText()) == null) {
                    //  JOptionPane.showMessageDialog(null, ruc);
                    
                    Crear_Clientes obj_crearC = new Crear_Clientes();
                    obj_crearC.buscarProvvedoroCLiente=1;
                    Principal.desktopPane.add(obj_crearC);

                    try {
                        obj_crearC.setSelected(true);

                    } catch (PropertyVetoException ex) {
                        Logger.getLogger(Crear_Facturas.class
                                .getName()).log(Level.SEVERE, null, ex);
                    }
                    Crear_Clientes.txt_cedulax.setText(ruc);
                    obj_crearC.setVisible(true);
                }
                
            }
        } else {
            System.out.println("Vista.Usuarios.Crear_Facturas.txt_nombresKeyPressed()xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
            ClientesDao cd = new ClientesDao();
            listaProveedores = cd.BuscarClietneslikokokok(ruc, 1);
            proveedorAutoCompleter.removeAllItems();
            for (Clientes p : listaProveedores) {
                proveedorAutoCompleter.addItem(p);
            }
        }

    }//GEN-LAST:event_txt_nombresKeyPressed

    private Integer addDatosClienteonFactura(String cedula) {
        //System.out.println("Vista.Usuarios.Crear_Facturas.txt_cedulaKeyTyped() Entrooo:  " + evt.getKeyCode());
        Integer codigoCliente = null;
        try {

            Proveedores obj = new Proveedores();
            ProveedoresDao objDao = new ProveedoresDao();
            obj = objDao.buscarConCedulaLike(cedula);

            txt_nombres.setText(obj.getNombre());
           // txt_celular.setText(obj.getdiasCrediotoconProveedorCelular());
            txt_dir.setText(obj.getDireccion());
            txt_clienteCodigo.setText(obj.getCodigo().toString());
            txt_clienteCodigo.setVisible(false);
            codigoCliente = obj.getCodigo();
            if (obj.getCredito() == 1) {
                diasCrediotoconProveedor = obj.getTiempoCredito();
            } else {
                diasCrediotoconProveedor = "0";
            }

            codigoClienteCompra = codigoCliente;

        } catch (Exception e) {
        }
        return codigoCliente;
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btn_nuevo;
    public static javax.swing.JLabel foto;
    public static javax.swing.JButton jButton1;
    public static javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JButton jButton5;
    private javax.swing.JComboBox<String> jComboBox1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JScrollPane jScrollPane4;
    public static javax.swing.JTable jTable1;
    public static javax.swing.JComboBox<String> jcbFormasPago;
    private javax.swing.JComboBox<String> jcbPVPs;
    private javax.swing.JComboBox<String> jcb_sustentoComprobante;
    private javax.swing.JComboBox<String> jcb_tipoComprobante;
    private com.toedter.calendar.JDateChooser jdfecha;
    private javax.swing.JLabel lbl_Iva;
    private javax.swing.JLabel lbl_subTotalIva;
    private javax.swing.JLabel lbl_subTotalIva1;
    private javax.swing.JLabel lbl_subTotalIva2;
    private javax.swing.JList<String> list1;
    private javax.swing.JList<String> list2;
    private javax.swing.JTextField txtBuscar2;
    private javax.swing.JTextField txt_buscar_producto;
    public static javax.swing.JTextField txt_cedula;
    public static javax.swing.JTextField txt_celular;
    private javax.swing.JLabel txt_clienteCodigo;
    private javax.swing.JTextField txt_descuentoGenral;
    public static javax.swing.JTextField txt_dir;
    public static javax.swing.JLabel txt_hora;
    private javax.swing.JLabel txt_iva_valor;
    public static javax.swing.JTextField txt_nombres;
    private javax.swing.JTextField txt_numAutorizacion;
    public static javax.swing.JTextField txt_sec1;
    public static javax.swing.JTextField txt_sec2;
    public static javax.swing.JTextField txt_secNUmFac;
    private javax.swing.JLabel txt_subtotal;
    private javax.swing.JLabel txt_subtotalIvaValor;
    private javax.swing.JLabel txt_subtotalIvaValorCero;
    private javax.swing.JLabel txt_total_;
    private javax.swing.JLabel txt_total_val;
    private javax.swing.JLabel txt_usuarioCodigo;
    private javax.swing.JLabel txt_utilidad;
    // End of variables declaration//GEN-END:variables
}
