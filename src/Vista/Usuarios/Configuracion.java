/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista.Usuarios;

import ClasesAuxiliares.MaquinaDao;
import ClasesAuxiliares.Variables;
import ClasesAuxiliares.loadconfig;
import Controlador.Usuarios.BodegasDao;
import Controlador.Usuarios.CajasDao;
import Controlador.Usuarios.Config2Dao;
import Controlador.Usuarios.ConfigDao;
import Controlador.Usuarios.Config_EquiposDao;
import Controlador.Usuarios.Config_UsuariosDao;
import Controlador.Usuarios.EquiposDao;
import Controlador.Usuarios.FormasPagoVDao;
import Modelo.Bodegas;
import Modelo.Cajas;
import Modelo.Config2;
import Modelo.ConfigSofia;
import Modelo.Config_Equipos;
import Modelo.Config_Usuarios;
import Modelo.Equipos;
import Modelo.FormasPagoV;
import Vista.Principal;
import Vista.alertas.alerta;
import login.login;
import static login.login.codigoCaja;
import impresoras.ServicioDeImpresion;
import java.awt.Color;
import java.awt.Component;
import java.awt.Frame;
import java.awt.Rectangle;
import static java.lang.System.exit;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.swing.DefaultListModel;
import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;
import javax.swing.table.DefaultTableModel;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeModel;

/**
 *
 * @author USUARIO
 */
public class Configuracion extends javax.swing.JInternalFrame {

    public static Integer esteesequipoNuevo = 0;
    String seleccione = "seleccione";
    DefaultTableModel modelo = null;
    Integer x;
    Integer y;
    public static Integer indexPositiotoolBar;
    public static Integer rowClicked;
    public static Integer codigoCaja = 0;
    public static String cajaClicked;
    String bodegePredeterminadaCompraValor;
    String bodegePredeterminadaVentaValor;
    ConfigSofia objconfig = new ConfigSofia();
    Config_Equipos objConfigEquipos = new Config_Equipos();
    Config_Usuarios objConfigUsuarios = new Config_Usuarios();
    ConfigDao confDao = new ConfigDao();
    Config_EquiposDao confEquipoDao = new Config_EquiposDao();
    Config_UsuariosDao confUsuarioDao = new Config_UsuariosDao();
    ArrayList<ConfigSofia> listConfig = new ArrayList<ConfigSofia>();
    ArrayList<Bodegas> listBodegas = new ArrayList<Bodegas>();
    ArrayList<Config_Equipos> listConfigdeEquipo = new ArrayList<Config_Equipos>();
    ArrayList<Config_Usuarios> listConfigdeUsuarios = new ArrayList<Config_Usuarios>();
    public static List<String> listImpresoras = new ArrayList<String>();
    List<Map<String, String>> mapList = new ArrayList<Map<String, String>>();
    boolean isClickedinJCB = false;
    Equipos equipo = new Equipos();
    EquiposDao equipoDao = new EquiposDao();

    ///////////tab 6
    /////////////////////////////////////////////////////////
    ArrayList<Cajas> lista = new ArrayList<Cajas>();
    public static String cajaNombre = null;
    public static Integer cajaCodigo = null;
    private Integer codigoConfig2 = -1;
    Equipos obj = new Equipos();
    EquiposDao objDao = new EquiposDao();
    MaquinaDao maquina = new MaquinaDao();
    //  ArrayList<Bodegas> listBodegasx = new ArrayList<Bodegas>();
    ArrayList<Config2> listConfig2 = new ArrayList<Config2>();
    boolean isClickedinJCBCompra = false;
    boolean isClickedinJCBVenta = false;
    Config_Equipos cofigracionEquipoNuevo = new Config_Equipos();
    Config_Equipos objConfigEquiposcompra = new Config_Equipos();
    Config_Equipos objConfigEquiposventa = new Config_Equipos();
    Integer codigoNewEquipo = null;
    DefaultListModel model2 = new DefaultListModel();

    //////////////
    //public static List<Map<String,String>>   = new ArrayList<Map<String,String>>();
    /**
     * Creates new form Congifuracion
     */
    public Configuracion() {
        initComponents();

        ////pongo el codigo del equipo al objeto
        objConfigEquipos.setEquipos_codigo(login.CodigoDelEquipo);

        ///lleno la lista d eequipos regstrados en el sisitema
        jTable1.setModel(equipoDao.Buscar_table_All());

        listImpresoras = ServicioDeImpresion.getListadeImpresoras();
        for (String listImpresora : listImpresoras) {
            jcb_impfacturas.addItem(listImpresora);
            jcb_imptickets.addItem(listImpresora);
        }
        BodegasDao bDao = new BodegasDao();
        listBodegas = bDao.listar();
        for (Bodegas b : listBodegas) {
            jcb_BodegaPredeterminadCOmpra.addItem(b.getBodegaID() + "-" + b.getBodega());
            jcb_BodegaPredeterminadventas.addItem(b.getBodegaID() + "-" + b.getBodega());
        }

        SetConfig();
        SetConfigDeUsuario();
        // new loadconfig();
        SetConfigEquipo();

/////////////////////tab6///////////////
/////////////////////tab6///////////////
        Config2 cf = new Config2();
        Config2Dao cfdao = new Config2Dao();
        DefaultListModel model = new DefaultListModel();
        Integer i = 0;

        listConfig2 = cfdao.listar();
        for (Config2 c : listConfig2) {

            model.add(i, c.getNombre());
            i++;

        }
        jList1.setModel(model);

        if (esteesequipoNuevo == 1) {
            CajasDao cajaDao = new CajasDao();
            Cajas caja = new Cajas();
            lista = cajaDao.listar();
            for (Cajas cajas : lista) {
                jcb_cajaPredeterminada1.addItem(cajas.getCaja());
                System.out.println("Cajassss: " + cajas.getCaja());
            }

            BodegasDao bDaod = new BodegasDao();
            listBodegas = bDaod.listar();
            for (Bodegas b : listBodegas) {
                jcb_BodegaPredeterminadCOmpra1.addItem(b.getBodegaID() + "-" + b.getBodega());
                jcb_BodegaPredeterminadventas1.addItem(b.getBodegaID() + "-" + b.getBodega());
            }
            jlnombrereal.setText(maquina.getNombreEquipo());
            txt_nombreSoft.setText(maquina.getNombreEquipo() + Math.random());

        } else {

            ////busco codigo de config2 y codigoequipo
            Equipos equipo = new Equipos();
            EquiposDao equpDao = new EquiposDao();
            equipo = equpDao.Buscar_by_NombreReal(login.nombreDelEquipo);
            codigoNewEquipo = equipo.getCodigo();
            jList1.setEnabled(true);
            jList2.setEnabled(true);
        }
////////////////////////fin tab 6
        llenarJTree();
    }

    public void llenarJTree() {
        DefaultMutableTreeNode raiz = new DefaultMutableTreeNode(jlnombrereal.getText());
        for (Config2 config2 : listConfig2) {
            DefaultMutableTreeNode nodo = new DefaultMutableTreeNode(config2.getNombre());
            raiz.add(nodo);

            switch (config2.getNombre()) {
                case "IMPRESORA TICKETS":
                    List<String> listaimpresoras;
                    listaimpresoras = ServicioDeImpresion.getListadeImpresoras();
                    for (String listaimpresora : listaimpresoras) {
                        DefaultMutableTreeNode nodox = new DefaultMutableTreeNode(listaimpresora);
                        nodo.add(nodox);
                    }
                    break;
                case "IMPRESORA FACTURAS":
                    List<String> listaimpresoras2;
                    listaimpresoras2 = ServicioDeImpresion.getListadeImpresoras();
                    for (String listaimpresora : listaimpresoras2) {
                        DefaultMutableTreeNode nodox = new DefaultMutableTreeNode(listaimpresora);
                        nodo.add(nodox);
                    }

                    break;
                case "FORMA DE PAGO PREDETERMINADA":

                    break;
                case "BODEGA PREDETERMINADA EN COMPRA":
                    break;
                case "BODEGA PREDETERMINADA EN VENTA":
                    break;
                case "VER IMAAGEN":
                    break;
                case "FACTURA TIRILLAS O CON FORMATO":
                    break;
                case "TICKET TIRILLAS O CON FORMATO":
                    break;

                case "PROFORMA TIRILLAS O CON FORMATO":
                    break;
                case "ACTIVAR CONTROL EFECTIVO":
                    break;
                case "FORMATO FACTURA":
                    break;
                case "FORMATO TICKET":
                    break;
                case "FORMATO PROFORMA ":
                    break;

            }
        }
        DefaultTreeModel model = new DefaultTreeModel(raiz);
    }

    private void SetConfig() {
        listConfig = confDao.listar();

        for (ConfigSofia c : listConfig) {

            switch (c.getNombre()) {
                case "IVA":
                    txt_iva.setText(c.getNombre());
                    txt_iva_.setText(c.getValor1());
                    break;
                case "MONEDA":
                    txt_moneda.setText(c.getNombre());
                    txt_moneda_.setText(c.getValor1());
                    break;
                case "UTILIDAD":
                    txt_utilidad.setText(c.getNombre());
                    txt_utilidad_.setText(c.getValor1());
                    break;
                case "NUMERO DE VECES QUE SE IMPRIMIRA FACTURA":
                    txt_vecesImpreFac.setText(c.getNombre());
                    txt_vecesImpreFac_.setText(c.getValor1());
                    break;
                case "DOCUMENTO PREDETERMINADO":
                    txt_documentopredeterminado.setText(c.getNombre());
                    jcb_documentopredeterminado.setSelectedItem(c.getValor1());
                    break;
                case "PERMITIR FACTURAR SIN STCOCK":
                    txt_PERMITIRFACTURARSINSTOCK.setText(c.getNombre());
                    jcb_PermitirFacturarSinStock.setSelectedItem(c.getValor1());
                    break;
                case "METODO DE VALORACION DE INVENTARIO":
                    jl_METODOVALORACIONINVENTARIO.setText(c.getNombre());
                    jcb_METODOVALORACIONINVENTARIO.setSelectedItem(c.getValor1());
                    break;

                case "ACTIVAR FACTURACION ELECTRONICA":
                    check_activarfacElectronica.setText(c.getNombre());
                    if (c.getValor1().equalsIgnoreCase("1")) {
                        check_activarfacElectronica.setSelected(true);
                    } else {
                        check_activarfacElectronica.setSelected(false);
                    }

                    break;

                case "AMBIENTE":
                    txt_ambiente.setText(c.getNombre());

                    if (c.getValor1().equalsIgnoreCase("1")) {
                        check_preubas.setSelected(true);
                    } else {
                        check_producciona.setSelected(true);
                    }

                    break;
                    case "EDITAR DETALLE ITEM FACTURACION":
                    txt_editarDetalle_item_en_Facturacion.setText(c.getNombre());

                    if (c.getValor1().equalsIgnoreCase("SI")) {
                        jcb_editarDetalle_item_en_Facturacion.setSelectedItem("SI");
                    } else {
                        jcb_editarDetalle_item_en_Facturacion.setSelectedItem("NO");
                    }

                    break;
                    

            }

        }
    }

    private void SetConfigEquipo() {
        txt_NumEq.setText(login.nombreDelEquipo + " : " + login.CodigoDelEquipo);
        listConfigdeEquipo = confEquipoDao.listarByID(login.CodigoDelEquipo);
        ///lleno combo forma de pago       

        FormasPagoVDao fpDao = new FormasPagoVDao();
        for (FormasPagoV f : fpDao.listar()) {
            jcb_formadePagoPredeterminada.addItem(f.getFormaPago());
        }
        //// fin formas dpago

        for (Config_Equipos c : listConfigdeEquipo) {

            switch (c.getNombre()) {

                case "IMPRESORA TICKETS":
                    txt_tickets.setText(c.getNombre());
                    jcb_imptickets.setSelectedItem(c.getValor1());

                    break;
                case "IMPRESORA FACTURAS":
                    txt_facturas.setText(c.getNombre());
                    jcb_impfacturas.setSelectedItem(c.getValor1());
                    break;
                case "FORMA DE PAGO PREDETERMINADA":
                    txt_formadepagoPredeterminada.setText(c.getNombre());
                    jcb_formadePagoPredeterminada.setSelectedItem(c.getValor1());
                    break;
                case "BODEGA PREDETERMINADA EN COMPRA":
                    txt_bodegaPredeterminadaEnCompras.setText(c.getNombre());
                    jcb_BodegaPredeterminadCOmpra.setSelectedItem(c.getValor1());
                    break;

                case "BODEGA PREDETERMINADA EN VENTA":

                    txt_bodegaPredeterminadaEnVENTAS.setText(c.getNombre());
                    jcb_BodegaPredeterminadventas.setSelectedItem(c.getValor1());
                    break;
                case "FACTURA TIRILLAS O CON FORMATO":

                    TXT_FACTURASDEROOLO.setText(c.getNombre());
                    if (c.getValor1().equalsIgnoreCase("ROLLO")) {
                        CHECFACROLLO.setSelected(true);
                    } else if (c.getValor1().equalsIgnoreCase("GRANDE")) {
                        CHECFACGRANDE.setSelected(true);
                    }
                    Principal.facturatiriiasoGrande = c.getValor1();
                    break;
                case "TICKET TIRILLAS O CON FORMATO":

                    TXT_TICKETSDEROOLO.setText(c.getNombre());
                    if (c.getValor1().equalsIgnoreCase("ROLLO")) {
                        CHECTICROLLO.setSelected(true);
                    } else if (c.getValor1().equalsIgnoreCase("GRANDE")) {
                        CHECTICGRANDE.setSelected(true);
                    }
                    Principal.tickettiriiasoGrande = c.getValor1();
                    break;
                case "ACTIVAR CONTROL EFECTIVO":

                    TXT_CONTROL_EFECTIVO_CAJA_SI_NO.setText(c.getNombre());
                    if (c.getValor1().equalsIgnoreCase("SI")) {
                        CHECK_CONTROL_EFECTIVO.setSelected(true);
                    } else if (c.getValor1().equalsIgnoreCase("NO")) {
                        CHECK_CONTROL_EFECTIVO.setSelected(false);
                    }
                    Principal.controlCambioEfectivoSINO = c.getValor1();
                    break;

                case "PROFORMA TIRILLAS O CON FORMATO":

                    TXT_PROFORMASDEROOLO2.setText(c.getNombre());
                    if (c.getValor1().equalsIgnoreCase("ROLLO")) {
                        CHECPROFROLLO.setSelected(true);
                    } else if (c.getValor1().equalsIgnoreCase("GRANDE")) {
                        CHECPROFGRANDE.setSelected(true);
                    }
                    Principal.proformatiriiasoFacturaGrande = c.getValor1();
                    break;                
            }

        }
    }

    private void SetConfigDeUsuario() {
        listConfigdeUsuarios = confUsuarioDao.listar();

        for (Config_Usuarios c : listConfigdeUsuarios) {

            switch (c.getNombre()) {

                case "I":
                    System.out.println("Vista.Usuarios.Congifuracion.SetConfig()tickets : " + c.getValor1());
                    txt_tickets.setText(c.getNombre());
                    jcb_imptickets.setSelectedItem(c.getValor1());

                    break;
                case "IMPR":
                    System.out.println("Vista.Usuarios.Congifuracion.SetConfig() facturas : " + c.getValor1());
                    txt_facturas.setText(c.getNombre());
                    jcb_impfacturas.setSelectedItem(c.getValor1());
                    break;

            }

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

        bgfacturas = new javax.swing.ButtonGroup();
        bgtickets = new javax.swing.ButtonGroup();
        bgproformas = new javax.swing.ButtonGroup();
        buttonGroup1x = new javax.swing.ButtonGroup();
        jTabbedPane1 = new javax.swing.JTabbedPane();
        jPanel1 = new javax.swing.JPanel();
        txt_tickets = new javax.swing.JLabel();
        jcb_imptickets = new javax.swing.JComboBox<>();
        txt_facturas = new javax.swing.JLabel();
        jcb_impfacturas = new javax.swing.JComboBox<>();
        jToolBar1 = new javax.swing.JToolBar();
        txt_formadepagoPredeterminada = new javax.swing.JLabel();
        jcb_formadePagoPredeterminada = new javax.swing.JComboBox<>();
        txt_bodegaPredeterminadaEnCompras = new javax.swing.JLabel();
        jcb_BodegaPredeterminadCOmpra = new javax.swing.JComboBox<>();
        txt_bodegaPredeterminadaEnVENTAS = new javax.swing.JLabel();
        jcb_BodegaPredeterminadventas = new javax.swing.JComboBox<>();
        TXT_FACTURASDEROOLO = new javax.swing.JLabel();
        CHECFACROLLO = new javax.swing.JCheckBox();
        CHECFACGRANDE = new javax.swing.JCheckBox();
        TXT_TICKETSDEROOLO = new javax.swing.JLabel();
        CHECTICROLLO = new javax.swing.JCheckBox();
        CHECTICGRANDE = new javax.swing.JCheckBox();
        TXT_PROFORMASDEROOLO2 = new javax.swing.JLabel();
        CHECPROFROLLO = new javax.swing.JCheckBox();
        CHECPROFGRANDE = new javax.swing.JCheckBox();
        CHECK_CONTROL_EFECTIVO = new javax.swing.JCheckBox();
        TXT_CONTROL_EFECTIVO_CAJA_SI_NO = new javax.swing.JLabel();
        jPanel5 = new javax.swing.JPanel();
        jTabbedPane2 = new javax.swing.JTabbedPane();
        jPanel6 = new javax.swing.JPanel();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTable2 = new javax.swing.JTable();
        jPanel2 = new javax.swing.JPanel();
        jPanel3 = new javax.swing.JPanel();
        txt_iva = new javax.swing.JLabel();
        txt_moneda = new javax.swing.JLabel();
        txt_utilidad = new javax.swing.JLabel();
        txt_iva_ = new javax.swing.JTextField();
        txt_moneda_ = new javax.swing.JTextField();
        txt_utilidad_ = new javax.swing.JTextField();
        txt_vecesImpreFac = new javax.swing.JLabel();
        txt_vecesImpreFac_ = new javax.swing.JTextField();
        txt_documentopredeterminado = new javax.swing.JLabel();
        jcb_documentopredeterminado = new javax.swing.JComboBox<>();
        txt_PERMITIRFACTURARSINSTOCK = new javax.swing.JLabel();
        jcb_PermitirFacturarSinStock = new javax.swing.JComboBox<>();
        jl_METODOVALORACIONINVENTARIO = new javax.swing.JLabel();
        jcb_METODOVALORACIONINVENTARIO = new javax.swing.JComboBox<>();
        txt_editarDetalle_item_en_Facturacion = new javax.swing.JLabel();
        jcb_editarDetalle_item_en_Facturacion = new javax.swing.JComboBox<>();
        jPanel4 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jPanel7 = new javax.swing.JPanel();
        jPanel8 = new javax.swing.JPanel();
        check_activarfacElectronica = new javax.swing.JCheckBox();
        check_preubas = new javax.swing.JCheckBox();
        check_producciona = new javax.swing.JCheckBox();
        txt_ambiente = new javax.swing.JLabel();
        jPanel9 = new javax.swing.JPanel();
        jPanel10 = new javax.swing.JPanel();
        txt_nombreSoft = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        jlnombrereal = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        txtSec1 = new javax.swing.JTextField();
        txtSec2 = new javax.swing.JTextField();
        txtSec3 = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        txt_bodegaPredeterminadaEnCompras1 = new javax.swing.JLabel();
        txt_bodegaPredeterminadaEnVENTAS1 = new javax.swing.JLabel();
        jcb_BodegaPredeterminadCOmpra1 = new javax.swing.JComboBox<>();
        jcb_BodegaPredeterminadventas1 = new javax.swing.JComboBox<>();
        jcb_cajaPredeterminada1 = new javax.swing.JComboBox<>();
        jLabel4 = new javax.swing.JLabel();
        jPanel11 = new javax.swing.JPanel();
        jButton2 = new javax.swing.JButton();
        jButton1 = new javax.swing.JButton();
        jPanel12 = new javax.swing.JPanel();
        jScrollPane3 = new javax.swing.JScrollPane();
        jList2 = new javax.swing.JList<>();
        jScrollPane4 = new javax.swing.JScrollPane();
        jList1 = new javax.swing.JList<>();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        txt_NumEq = new javax.swing.JLabel();

        bgfacturas.add(CHECFACGRANDE);
        bgfacturas.add(CHECFACROLLO);

        bgtickets.add(CHECTICGRANDE);
        bgtickets.add(CHECTICROLLO);

        bgproformas.add(CHECPROFGRANDE);
        bgproformas.add(CHECPROFROLLO);

        buttonGroup1x.add(check_preubas);
        buttonGroup1x.add(check_producciona);

        setClosable(true);
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

        jTabbedPane1.addChangeListener(new javax.swing.event.ChangeListener() {
            public void stateChanged(javax.swing.event.ChangeEvent evt) {
                jTabbedPane1StateChanged(evt);
            }
        });

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder("CONFIGURACION IMPRESORAS"));

        txt_tickets.setText("Impresora de Tirillas");

        jcb_imptickets.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jcb_impticketsItemStateChanged(evt);
            }
        });
        jcb_imptickets.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jcb_impticketsMouseClicked(evt);
            }
            public void mouseReleased(java.awt.event.MouseEvent evt) {
                jcb_impticketsMouseReleased(evt);
            }
        });
        jcb_imptickets.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jcb_impticketsActionPerformed(evt);
            }
        });

        txt_facturas.setText("Impresora de Facturas");

        jcb_impfacturas.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jcb_impfacturasItemStateChanged(evt);
            }
        });
        jcb_impfacturas.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseReleased(java.awt.event.MouseEvent evt) {
                jcb_impfacturasMouseReleased(evt);
            }
        });
        jcb_impfacturas.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jcb_impfacturasActionPerformed(evt);
            }
        });

        jToolBar1.setRollover(true);

        txt_formadepagoPredeterminada.setText("FORMA DE PAGO PREDETERMINADA");

        jcb_formadePagoPredeterminada.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jcb_formadePagoPredeterminadaItemStateChanged(evt);
            }
        });
        jcb_formadePagoPredeterminada.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseReleased(java.awt.event.MouseEvent evt) {
                jcb_formadePagoPredeterminadaMouseReleased(evt);
            }
        });
        jcb_formadePagoPredeterminada.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jcb_formadePagoPredeterminadaActionPerformed(evt);
            }
        });

        txt_bodegaPredeterminadaEnCompras.setText("bodega predeterminada en COMPRAS");

        jcb_BodegaPredeterminadCOmpra.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jcb_BodegaPredeterminadCOmpraItemStateChanged(evt);
            }
        });
        jcb_BodegaPredeterminadCOmpra.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseReleased(java.awt.event.MouseEvent evt) {
                jcb_BodegaPredeterminadCOmpraMouseReleased(evt);
            }
        });
        jcb_BodegaPredeterminadCOmpra.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jcb_BodegaPredeterminadCOmpraActionPerformed(evt);
            }
        });

        txt_bodegaPredeterminadaEnVENTAS.setText("BODEGA predeterminada en VENTAS");

        jcb_BodegaPredeterminadventas.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jcb_BodegaPredeterminadventasItemStateChanged(evt);
            }
        });
        jcb_BodegaPredeterminadventas.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseReleased(java.awt.event.MouseEvent evt) {
                jcb_BodegaPredeterminadventasMouseReleased(evt);
            }
        });
        jcb_BodegaPredeterminadventas.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jcb_BodegaPredeterminadventasActionPerformed(evt);
            }
        });

        TXT_FACTURASDEROOLO.setText("FACTURA TIRILLAS O CON FORMATO");

        CHECFACROLLO.setText("ROLLO");
        CHECFACROLLO.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                CHECFACROLLOItemStateChanged(evt);
            }
        });

        CHECFACGRANDE.setText("GRANDE");
        CHECFACGRANDE.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                CHECFACGRANDEItemStateChanged(evt);
            }
        });

        TXT_TICKETSDEROOLO.setText("TICKETS TIRILLAS O CON FORMATO");

        CHECTICROLLO.setText("ROLLO");
        CHECTICROLLO.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                CHECTICROLLOItemStateChanged(evt);
            }
        });

        CHECTICGRANDE.setText("GRANDE");
        CHECTICGRANDE.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                CHECTICGRANDEItemStateChanged(evt);
            }
        });

        TXT_PROFORMASDEROOLO2.setText("PROFORMAS TIRILLAS O CON FORMATO");

        CHECPROFROLLO.setText("ROLLO");
        CHECPROFROLLO.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                CHECPROFROLLOItemStateChanged(evt);
            }
        });

        CHECPROFGRANDE.setText("GRANDE");
        CHECPROFGRANDE.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                CHECPROFGRANDEItemStateChanged(evt);
            }
        });

        CHECK_CONTROL_EFECTIVO.setText("ACTIVO");
        CHECK_CONTROL_EFECTIVO.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                CHECK_CONTROL_EFECTIVOItemStateChanged(evt);
            }
        });

        TXT_CONTROL_EFECTIVO_CAJA_SI_NO.setText("PROFORMAS TIRILLAS O CON FORMATO");

        jPanel5.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        jTable2.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Title 1"
            }
        ));
        jScrollPane2.setViewportView(jTable2);

        javax.swing.GroupLayout jPanel6Layout = new javax.swing.GroupLayout(jPanel6);
        jPanel6.setLayout(jPanel6Layout);
        jPanel6Layout.setHorizontalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 808, Short.MAX_VALUE)
        );
        jPanel6Layout.setVerticalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 103, Short.MAX_VALUE))
        );

        jTabbedPane2.addTab("FORMATOS", jPanel6);

        javax.swing.GroupLayout jPanel5Layout = new javax.swing.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jTabbedPane2)
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jTabbedPane2)
        );

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(993, 993, 993)
                        .addComponent(jToolBar1, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(12, 12, 12)
                                .addComponent(txt_bodegaPredeterminadaEnCompras, javax.swing.GroupLayout.PREFERRED_SIZE, 264, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(jcb_BodegaPredeterminadCOmpra, javax.swing.GroupLayout.PREFERRED_SIZE, 208, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(txt_bodegaPredeterminadaEnVENTAS, javax.swing.GroupLayout.PREFERRED_SIZE, 264, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(TXT_FACTURASDEROOLO, javax.swing.GroupLayout.PREFERRED_SIZE, 264, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(18, 18, 18)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jcb_BodegaPredeterminadventas, javax.swing.GroupLayout.PREFERRED_SIZE, 208, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addGroup(jPanel1Layout.createSequentialGroup()
                                        .addComponent(CHECFACROLLO)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                        .addComponent(CHECFACGRANDE))))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addGroup(jPanel1Layout.createSequentialGroup()
                                        .addComponent(TXT_TICKETSDEROOLO, javax.swing.GroupLayout.PREFERRED_SIZE, 264, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGap(18, 18, 18)
                                        .addComponent(CHECTICROLLO)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                        .addComponent(CHECTICGRANDE))
                                    .addGroup(jPanel1Layout.createSequentialGroup()
                                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                            .addGroup(jPanel1Layout.createSequentialGroup()
                                                .addComponent(TXT_PROFORMASDEROOLO2, javax.swing.GroupLayout.PREFERRED_SIZE, 264, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                .addGap(18, 18, 18))
                                            .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup()
                                                .addComponent(TXT_CONTROL_EFECTIVO_CAJA_SI_NO, javax.swing.GroupLayout.PREFERRED_SIZE, 264, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)))
                                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                            .addComponent(CHECK_CONTROL_EFECTIVO)
                                            .addGroup(jPanel1Layout.createSequentialGroup()
                                                .addComponent(CHECPROFROLLO)
                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                .addComponent(CHECPROFGRANDE))))))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(12, 12, 12)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(jPanel1Layout.createSequentialGroup()
                                        .addComponent(txt_tickets, javax.swing.GroupLayout.PREFERRED_SIZE, 264, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGap(18, 18, 18)
                                        .addComponent(jcb_imptickets, javax.swing.GroupLayout.PREFERRED_SIZE, 208, javax.swing.GroupLayout.PREFERRED_SIZE))
                                    .addGroup(jPanel1Layout.createSequentialGroup()
                                        .addComponent(txt_facturas, javax.swing.GroupLayout.PREFERRED_SIZE, 264, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGap(18, 18, 18)
                                        .addComponent(jcb_impfacturas, javax.swing.GroupLayout.PREFERRED_SIZE, 208, javax.swing.GroupLayout.PREFERRED_SIZE))
                                    .addGroup(jPanel1Layout.createSequentialGroup()
                                        .addComponent(txt_formadepagoPredeterminada, javax.swing.GroupLayout.PREFERRED_SIZE, 264, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGap(18, 18, 18)
                                        .addComponent(jcb_formadePagoPredeterminada, javax.swing.GroupLayout.PREFERRED_SIZE, 208, javax.swing.GroupLayout.PREFERRED_SIZE)))))
                        .addGap(46, 46, 46)
                        .addComponent(jPanel5, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(13, 13, 13)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(3, 3, 3)
                                .addComponent(txt_tickets))
                            .addComponent(jcb_imptickets, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(7, 7, 7)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(3, 3, 3)
                                .addComponent(txt_facturas))
                            .addComponent(jcb_impfacturas, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(7, 7, 7)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(3, 3, 3)
                                .addComponent(txt_formadepagoPredeterminada))
                            .addComponent(jcb_formadePagoPredeterminada, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(14, 14, 14)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txt_bodegaPredeterminadaEnCompras)
                            .addComponent(jcb_BodegaPredeterminadCOmpra, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(7, 7, 7)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(3, 3, 3)
                                .addComponent(txt_bodegaPredeterminadaEnVENTAS))
                            .addComponent(jcb_BodegaPredeterminadventas, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(TXT_FACTURASDEROOLO)
                            .addComponent(CHECFACROLLO)
                            .addComponent(CHECFACGRANDE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(TXT_TICKETSDEROOLO)
                            .addComponent(CHECTICROLLO)
                            .addComponent(CHECTICGRANDE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(TXT_PROFORMASDEROOLO2)
                            .addComponent(CHECPROFROLLO)
                            .addComponent(CHECPROFGRANDE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(CHECK_CONTROL_EFECTIVO)
                            .addComponent(TXT_CONTROL_EFECTIVO_CAJA_SI_NO)))
                    .addComponent(jPanel5, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jToolBar1, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        jTabbedPane1.addTab("Configuracin Local", jPanel1);

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder("PERMISOS"));

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 1552, Short.MAX_VALUE)
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 600, Short.MAX_VALUE)
        );

        jTabbedPane1.addTab("Configuracion por Usuarios", jPanel2);

        txt_iva.setText("iva");

        txt_moneda.setText("moneda");

        txt_utilidad.setText("utilidad general");

        txt_iva_.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                txt_iva_FocusLost(evt);
            }
        });
        txt_iva_.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_iva_KeyReleased(evt);
            }
        });

        txt_moneda_.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                txt_moneda_FocusLost(evt);
            }
        });
        txt_moneda_.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_moneda_ActionPerformed(evt);
            }
        });

        txt_utilidad_.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                txt_utilidad_FocusLost(evt);
            }
        });

        txt_vecesImpreFac.setText("NUMERO DE VECES QUE SE IMPRIMIRA FACTURA");

        txt_vecesImpreFac_.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                txt_vecesImpreFac_FocusLost(evt);
            }
        });
        txt_vecesImpreFac_.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_vecesImpreFac_ActionPerformed(evt);
            }
        });

        txt_documentopredeterminado.setText("num vecse impimira factura");

        jcb_documentopredeterminado.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "FACTURA", "TICKET", "PROFORMA" }));
        jcb_documentopredeterminado.setName(""); // NOI18N
        jcb_documentopredeterminado.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jcb_documentopredeterminadoItemStateChanged(evt);
            }
        });
        jcb_documentopredeterminado.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseReleased(java.awt.event.MouseEvent evt) {
                jcb_documentopredeterminadoMouseReleased(evt);
            }
        });
        jcb_documentopredeterminado.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jcb_documentopredeterminadoActionPerformed(evt);
            }
        });

        txt_PERMITIRFACTURARSINSTOCK.setText("premitir facturar sin Stock");

        jcb_PermitirFacturarSinStock.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SI", "NO" }));
        jcb_PermitirFacturarSinStock.setName(""); // NOI18N
        jcb_PermitirFacturarSinStock.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jcb_PermitirFacturarSinStockItemStateChanged(evt);
            }
        });
        jcb_PermitirFacturarSinStock.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseReleased(java.awt.event.MouseEvent evt) {
                jcb_PermitirFacturarSinStockMouseReleased(evt);
            }
        });
        jcb_PermitirFacturarSinStock.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jcb_PermitirFacturarSinStockActionPerformed(evt);
            }
        });

        jl_METODOVALORACIONINVENTARIO.setText("METODO DE VALORACION DE INVENTARIO");

        jcb_METODOVALORACIONINVENTARIO.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "U.E.P.S", "PROMEDIO" }));
        jcb_METODOVALORACIONINVENTARIO.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jcb_METODOVALORACIONINVENTARIOItemStateChanged(evt);
            }
        });
        jcb_METODOVALORACIONINVENTARIO.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseReleased(java.awt.event.MouseEvent evt) {
                jcb_METODOVALORACIONINVENTARIOMouseReleased(evt);
            }
        });

        txt_editarDetalle_item_en_Facturacion.setText("EDITAR DETALLE ITEM FACTURACION");

        jcb_editarDetalle_item_en_Facturacion.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SI", "NO" }));
        jcb_editarDetalle_item_en_Facturacion.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jcb_editarDetalle_item_en_FacturacionItemStateChanged(evt);
            }
        });

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGap(46, 46, 46)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                        .addComponent(txt_PERMITIRFACTURARSINSTOCK, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(txt_moneda, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(txt_utilidad, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(txt_vecesImpreFac, javax.swing.GroupLayout.DEFAULT_SIZE, 447, Short.MAX_VALUE)
                        .addComponent(txt_iva, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(txt_documentopredeterminado, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addComponent(jl_METODOVALORACIONINVENTARIO, javax.swing.GroupLayout.PREFERRED_SIZE, 264, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txt_editarDetalle_item_en_Facturacion, javax.swing.GroupLayout.PREFERRED_SIZE, 326, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txt_iva_, javax.swing.GroupLayout.DEFAULT_SIZE, 557, Short.MAX_VALUE)
                            .addComponent(txt_moneda_)
                            .addComponent(jcb_documentopredeterminado, javax.swing.GroupLayout.PREFERRED_SIZE, 218, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txt_vecesImpreFac_)
                            .addComponent(txt_utilidad_))
                        .addGap(509, 509, 509))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addComponent(jcb_editarDetalle_item_en_Facturacion, javax.swing.GroupLayout.Alignment.LEADING, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jcb_PermitirFacturarSinStock, javax.swing.GroupLayout.Alignment.LEADING, 0, 218, Short.MAX_VALUE)
                            .addComponent(jcb_METODOVALORACIONINVENTARIO, javax.swing.GroupLayout.Alignment.LEADING, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGap(28, 28, 28)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txt_iva)
                    .addComponent(txt_iva_, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txt_moneda)
                    .addComponent(txt_moneda_, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txt_utilidad)
                    .addComponent(txt_utilidad_, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(txt_vecesImpreFac_, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txt_vecesImpreFac))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(txt_documentopredeterminado)
                    .addComponent(jcb_documentopredeterminado, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txt_PERMITIRFACTURARSINSTOCK)
                    .addComponent(jcb_PermitirFacturarSinStock, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jl_METODOVALORACIONINVENTARIO)
                    .addComponent(jcb_METODOVALORACIONINVENTARIO, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txt_editarDetalle_item_en_Facturacion)
                    .addComponent(jcb_editarDetalle_item_en_Facturacion, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(380, Short.MAX_VALUE))
        );

        jTabbedPane1.addTab("Configuracin Genereal", jPanel3);

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {},
                {},
                {},
                {}
            },
            new String [] {

            }
        ));
        jTable1.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                jTable1FocusGained(evt);
            }
        });
        jTable1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTable1MouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(jTable1);

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 1169, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(383, Short.MAX_VALUE))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 388, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(224, Short.MAX_VALUE))
        );

        jTabbedPane1.addTab("CAJAS", jPanel4);

        check_activarfacElectronica.setText("ACTIVAR FACTURACION ELECTRONICA");
        check_activarfacElectronica.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                check_activarfacElectronicaItemStateChanged(evt);
            }
        });

        check_preubas.setText("preubas");
        check_preubas.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                check_preubasItemStateChanged(evt);
            }
        });
        check_preubas.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                check_preubasActionPerformed(evt);
            }
        });

        check_producciona.setText("Produccion");

        txt_ambiente.setText("AMBIENTE: ");

        javax.swing.GroupLayout jPanel8Layout = new javax.swing.GroupLayout(jPanel8);
        jPanel8.setLayout(jPanel8Layout);
        jPanel8Layout.setHorizontalGroup(
            jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel8Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(check_activarfacElectronica, javax.swing.GroupLayout.PREFERRED_SIZE, 266, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanel8Layout.createSequentialGroup()
                        .addComponent(txt_ambiente)
                        .addGap(18, 18, 18)
                        .addComponent(check_producciona, javax.swing.GroupLayout.PREFERRED_SIZE, 105, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(check_preubas, javax.swing.GroupLayout.PREFERRED_SIZE, 105, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(123, Short.MAX_VALUE))
        );
        jPanel8Layout.setVerticalGroup(
            jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel8Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel8Layout.createSequentialGroup()
                        .addComponent(check_activarfacElectronica)
                        .addGap(30, 30, 30))
                    .addGroup(jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(txt_ambiente)
                        .addComponent(check_producciona)
                        .addComponent(check_preubas)))
                .addContainerGap(41, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jPanel7Layout = new javax.swing.GroupLayout(jPanel7);
        jPanel7.setLayout(jPanel7Layout);
        jPanel7Layout.setHorizontalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel8, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(1121, Short.MAX_VALUE))
        );
        jPanel7Layout.setVerticalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addGap(36, 36, 36)
                .addComponent(jPanel8, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(488, Short.MAX_VALUE))
        );

        jTabbedPane1.addTab("fac electronica", jPanel7);

        jPanel10.setBackground(new java.awt.Color(204, 255, 204));
        jPanel10.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        jLabel1.setText("NOMBRE REAL");

        jLabel2.setText("SECUENCIA");

        txtSec1.setText("001");

        txtSec2.setText("001");

        txtSec3.setText("000000001");

        jLabel3.setText("CAJA PREDETERMINADA");

        txt_bodegaPredeterminadaEnCompras1.setText("BODEGA PREDETERMINADA EN COMPRAS");

        txt_bodegaPredeterminadaEnVENTAS1.setText("BODEGA PREDETERMINADA EN VENTAS");

        jcb_BodegaPredeterminadCOmpra1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccione" }));
        jcb_BodegaPredeterminadCOmpra1.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jcb_BodegaPredeterminadCOmpra1ItemStateChanged(evt);
            }
        });
        jcb_BodegaPredeterminadCOmpra1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseReleased(java.awt.event.MouseEvent evt) {
                jcb_BodegaPredeterminadCOmpra1MouseReleased(evt);
            }
        });
        jcb_BodegaPredeterminadCOmpra1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jcb_BodegaPredeterminadCOmpra1ActionPerformed(evt);
            }
        });

        jcb_BodegaPredeterminadventas1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccione" }));
        jcb_BodegaPredeterminadventas1.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jcb_BodegaPredeterminadventas1ItemStateChanged(evt);
            }
        });
        jcb_BodegaPredeterminadventas1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseReleased(java.awt.event.MouseEvent evt) {
                jcb_BodegaPredeterminadventas1MouseReleased(evt);
            }
        });
        jcb_BodegaPredeterminadventas1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jcb_BodegaPredeterminadventas1ActionPerformed(evt);
            }
        });

        jcb_cajaPredeterminada1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccione" }));
        jcb_cajaPredeterminada1.setName(""); // NOI18N
        jcb_cajaPredeterminada1.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jcb_cajaPredeterminada1ItemStateChanged(evt);
            }
        });
        jcb_cajaPredeterminada1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jcb_cajaPredeterminada1ActionPerformed(evt);
            }
        });

        jLabel4.setText("ALIAS DEL EQUIPO");

        jButton2.setBackground(new java.awt.Color(255, 51, 51));
        jButton2.setText("Cancelar");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jButton1.setBackground(new java.awt.Color(0, 175, 31));
        jButton1.setText("Guardar");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel11Layout = new javax.swing.GroupLayout(jPanel11);
        jPanel11.setLayout(jPanel11Layout);
        jPanel11Layout.setHorizontalGroup(
            jPanel11Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel11Layout.createSequentialGroup()
                .addContainerGap(87, Short.MAX_VALUE)
                .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        jPanel11Layout.setVerticalGroup(
            jPanel11Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel11Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel11Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jPanel10Layout = new javax.swing.GroupLayout(jPanel10);
        jPanel10.setLayout(jPanel10Layout);
        jPanel10Layout.setHorizontalGroup(
            jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel10Layout.createSequentialGroup()
                .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel10Layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(txt_bodegaPredeterminadaEnVENTAS1)
                            .addComponent(txt_bodegaPredeterminadaEnCompras1)
                            .addComponent(jLabel3)
                            .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 66, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel4)
                            .addComponent(jLabel1))
                        .addGap(18, 18, 18)
                        .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addComponent(jcb_cajaPredeterminada1, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jcb_BodegaPredeterminadventas1, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jcb_BodegaPredeterminadCOmpra1, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel10Layout.createSequentialGroup()
                                .addComponent(txtSec1, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(txtSec2, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(txtSec3, javax.swing.GroupLayout.PREFERRED_SIZE, 83, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addComponent(txt_nombreSoft, javax.swing.GroupLayout.PREFERRED_SIZE, 208, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jlnombrereal, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 115, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(jPanel10Layout.createSequentialGroup()
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jPanel11, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(350, 350, 350))
        );
        jPanel10Layout.setVerticalGroup(
            jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel10Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel1, javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jlnombrereal, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(13, 13, 13)
                .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txt_nombreSoft, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(txtSec3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(txtSec2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(txtSec1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jLabel2, javax.swing.GroupLayout.Alignment.TRAILING))
                .addGap(18, 18, 18)
                .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txt_bodegaPredeterminadaEnCompras1)
                    .addComponent(jcb_BodegaPredeterminadCOmpra1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jcb_BodegaPredeterminadventas1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txt_bodegaPredeterminadaEnVENTAS1))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jcb_cajaPredeterminada1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 187, Short.MAX_VALUE)
                .addComponent(jPanel11, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        jPanel12.setBorder(javax.swing.BorderFactory.createTitledBorder("COnfiguracion"));

        jList2.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jList2MouseClicked(evt);
            }
        });
        jScrollPane3.setViewportView(jList2);

        jList1.setEnabled(false);
        jList1.addListSelectionListener(new javax.swing.event.ListSelectionListener() {
            public void valueChanged(javax.swing.event.ListSelectionEvent evt) {
                jList1ValueChanged(evt);
            }
        });
        jScrollPane4.setViewportView(jList1);

        jLabel5.setFont(new java.awt.Font("Tahoma", 1, 15)); // NOI18N
        jLabel5.setForeground(new java.awt.Color(204, 0, 0));
        jLabel5.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);

        jLabel6.setText("Equipo: ");

        javax.swing.GroupLayout jPanel12Layout = new javax.swing.GroupLayout(jPanel12);
        jPanel12.setLayout(jPanel12Layout);
        jPanel12Layout.setHorizontalGroup(
            jPanel12Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
            .addGroup(jPanel12Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel12Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 840, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanel12Layout.createSequentialGroup()
                        .addComponent(jLabel6)
                        .addGap(18, 18, 18)
                        .addComponent(txt_NumEq, javax.swing.GroupLayout.PREFERRED_SIZE, 374, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(239, 239, 239))
                    .addGroup(jPanel12Layout.createSequentialGroup()
                        .addComponent(jScrollPane4, javax.swing.GroupLayout.PREFERRED_SIZE, 591, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 232, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(54, Short.MAX_VALUE))
        );
        jPanel12Layout.setVerticalGroup(
            jPanel12Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel12Layout.createSequentialGroup()
                .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel12Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jScrollPane4, javax.swing.GroupLayout.DEFAULT_SIZE, 370, Short.MAX_VALUE)
                    .addComponent(jScrollPane3))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel12Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6)
                    .addComponent(txt_NumEq))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jPanel9Layout = new javax.swing.GroupLayout(jPanel9);
        jPanel9.setLayout(jPanel9Layout);
        jPanel9Layout.setHorizontalGroup(
            jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel9Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel10, javax.swing.GroupLayout.PREFERRED_SIZE, 483, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jPanel12, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(139, Short.MAX_VALUE))
        );
        jPanel9Layout.setVerticalGroup(
            jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel9Layout.createSequentialGroup()
                .addGroup(jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jPanel12, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel10, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap(150, Short.MAX_VALUE))
        );

        jTabbedPane1.addTab("CONFIGURACIONPOR EQUIPO", jPanel9);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jTabbedPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 1569, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jTabbedPane1, javax.swing.GroupLayout.Alignment.TRAILING)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jcb_impfacturasActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jcb_impfacturasActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jcb_impfacturasActionPerformed

    private void formInternalFrameClosed(javax.swing.event.InternalFrameEvent evt) {//GEN-FIRST:event_formInternalFrameClosed
        // TODO add your handling code here:


    }//GEN-LAST:event_formInternalFrameClosed

    private void jcb_impticketsItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcb_impticketsItemStateChanged
        // TODO add your handling code here:

        if (jcb_imptickets.getItemCount() > 1 && isClickedinJCB) {
            objConfigEquipos.setValor1(jcb_imptickets.getSelectedItem().toString());
            objConfigEquipos.setNombre(txt_tickets.getText());
            JOptionPane.showMessageDialog(null, login.CodigoDelEquipo);

            objConfigEquipos.setEquipos_codigo(login.CodigoDelEquipo);
            Config_EquiposDao objConfgEquipoDao = new Config_EquiposDao();
            objConfgEquipoDao.modificar(objConfigEquipos);
            Principal.impresoraTicket = jcb_imptickets.getSelectedItem().toString();
        }
    }//GEN-LAST:event_jcb_impticketsItemStateChanged

    private void jcb_impticketsMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jcb_impticketsMouseClicked
        // TODO add your handling code here:
        //    System.out.println("Vista.Usuarios.Congifuracion.jcb_impticketsMouseReleased()clikeddd");
    }//GEN-LAST:event_jcb_impticketsMouseClicked

    private void jcb_impfacturasItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcb_impfacturasItemStateChanged
        // TODO add your handling code here:        
        if (jcb_impfacturas.getItemCount() > 1 && isClickedinJCB) {
            objConfigEquipos.setValor1(jcb_impfacturas.getSelectedItem().toString());
            objConfigEquipos.setNombre(txt_facturas.getText());
            objConfigEquipos.setEquipos_codigo(login.CodigoDelEquipo);
            Config_EquiposDao objConfgEquipoDao = new Config_EquiposDao();
            objConfgEquipoDao.modificar(objConfigEquipos);
            Principal.impresoraFactura = jcb_impfacturas.getSelectedItem().toString();
        }


    }//GEN-LAST:event_jcb_impfacturasItemStateChanged

    private void txt_moneda_ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_moneda_ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_moneda_ActionPerformed

    private void jcb_impticketsMouseReleased(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jcb_impticketsMouseReleased
        // TODO add your handling code here:
        isClickedinJCB = true;
        //  System.out.println("Vista.Usuarios.Congifuracion.jcb_impticketsMouseReleased()releseeeed ninto");
    }//GEN-LAST:event_jcb_impticketsMouseReleased

    private void jcb_impfacturasMouseReleased(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jcb_impfacturasMouseReleased
        // TODO add your handling code here:
        isClickedinJCB = true;
        System.out.println("Vista.Usuarios.Congifuracion.jcb_impticketsMouseReleased()releseeeed ninto");
    }//GEN-LAST:event_jcb_impfacturasMouseReleased

    private void txt_iva_KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_iva_KeyReleased
        // TODO add your handling code here:

    }//GEN-LAST:event_txt_iva_KeyReleased

    private void txt_iva_FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_iva_FocusLost
        // TODO add your handling code here:
        ConfigDao objconfgDao = new ConfigDao();
        objconfig.setNombre(txt_iva.getText());
        objconfig.setValor1(txt_iva_.getText());
        objconfgDao.modificar(objconfig);
        Principal.iva = txt_iva_.getText();
    }//GEN-LAST:event_txt_iva_FocusLost

    private void txt_moneda_FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_moneda_FocusLost
        // TODO add your handling code here:
        ConfigDao objconfgDao = new ConfigDao();
        objconfig.setNombre(txt_moneda.getText());
        objconfig.setValor1(txt_moneda_.getText());
        objconfgDao.modificar(objconfig);
        Principal.moneda = txt_moneda_.getText();
    }//GEN-LAST:event_txt_moneda_FocusLost

    private void txt_utilidad_FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_utilidad_FocusLost
        // TODO add your handling code here:
        ConfigDao objconfgDao = new ConfigDao();
        objconfig.setNombre(txt_utilidad.getText());
        objconfig.setValor1(txt_utilidad_.getText());
        objconfgDao.modificar(objconfig);
        Principal.utilidad = txt_utilidad_.getText();
    }//GEN-LAST:event_txt_utilidad_FocusLost

    private void txt_vecesImpreFac_FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_vecesImpreFac_FocusLost
        // TODO add your handling code here:
        ConfigDao objconfgDao = new ConfigDao();
        objconfig.setNombre(txt_vecesImpreFac.getText());
        objconfig.setValor1(txt_vecesImpreFac_.getText());
        objconfgDao.modificar(objconfig);
        Principal.numerovecseimpresionFactura = txt_vecesImpreFac_.getText();
    }//GEN-LAST:event_txt_vecesImpreFac_FocusLost

    private void jcb_documentopredeterminadoItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcb_documentopredeterminadoItemStateChanged
        // TODO add your handling code here:
        if (jcb_documentopredeterminado.getItemCount() > 1 && isClickedinJCB) {
            objconfig.setValor1(jcb_documentopredeterminado.getSelectedItem().toString());
            objconfig.setNombre(txt_documentopredeterminado.getText());
            ConfigDao objDao = new ConfigDao();
            objDao.modificar(objconfig);
            Principal.documentoPredeterminadoFacturacion = jcb_documentopredeterminado.getSelectedItem().toString();
        }
    }//GEN-LAST:event_jcb_documentopredeterminadoItemStateChanged

    private void jcb_documentopredeterminadoMouseReleased(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jcb_documentopredeterminadoMouseReleased
        // TODO add your handling code here:
        isClickedinJCB = true;
    }//GEN-LAST:event_jcb_documentopredeterminadoMouseReleased

    private void jcb_documentopredeterminadoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jcb_documentopredeterminadoActionPerformed
        // TODO add your handling code here:

    }//GEN-LAST:event_jcb_documentopredeterminadoActionPerformed

    private void jcb_formadePagoPredeterminadaItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcb_formadePagoPredeterminadaItemStateChanged
        // TODO add your handling code here:
        if (jcb_formadePagoPredeterminada.getItemCount() > 1 && isClickedinJCB) {
            objConfigEquipos.setValor1(jcb_formadePagoPredeterminada.getSelectedItem().toString());
            objConfigEquipos.setNombre(txt_formadepagoPredeterminada.getText());
            objConfigEquipos.setEquipos_codigo(login.CodigoDelEquipo);
            Config_EquiposDao objDao = new Config_EquiposDao();
            objDao.modificar(objConfigEquipos);
            Principal.formadepagopredeterminada = jcb_formadePagoPredeterminada.getSelectedItem().toString();
        }

    }//GEN-LAST:event_jcb_formadePagoPredeterminadaItemStateChanged

    private void jcb_formadePagoPredeterminadaMouseReleased(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jcb_formadePagoPredeterminadaMouseReleased
        // TODO add your handling code here:
        isClickedinJCB = true;
    }//GEN-LAST:event_jcb_formadePagoPredeterminadaMouseReleased

    private void jcb_formadePagoPredeterminadaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jcb_formadePagoPredeterminadaActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jcb_formadePagoPredeterminadaActionPerformed

    private void jcb_BodegaPredeterminadCOmpraItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcb_BodegaPredeterminadCOmpraItemStateChanged
        // TODO add your handling code here:
        if (jcb_BodegaPredeterminadCOmpra.getItemCount() > 1 && isClickedinJCB) {
            objConfigEquipos.setValor1(jcb_BodegaPredeterminadCOmpra.getSelectedItem().toString());
            objConfigEquipos.setNombre(txt_bodegaPredeterminadaEnCompras.getText());
            objConfigEquipos.setEquipos_codigo(login.CodigoDelEquipo);
            Config_EquiposDao objDao = new Config_EquiposDao();
            objDao.modificar(objConfigEquipos);
            Principal.bodegaPredeterminadaenCOmpra = jcb_BodegaPredeterminadCOmpra.getSelectedItem().toString();
        }
    }//GEN-LAST:event_jcb_BodegaPredeterminadCOmpraItemStateChanged

    private void jcb_BodegaPredeterminadCOmpraMouseReleased(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jcb_BodegaPredeterminadCOmpraMouseReleased
        // TODO add your handling code here:
        isClickedinJCB = true;
    }//GEN-LAST:event_jcb_BodegaPredeterminadCOmpraMouseReleased

    private void jcb_BodegaPredeterminadCOmpraActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jcb_BodegaPredeterminadCOmpraActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jcb_BodegaPredeterminadCOmpraActionPerformed

    private void jcb_BodegaPredeterminadventasItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcb_BodegaPredeterminadventasItemStateChanged
        // TODO add your handling code here:
        if (jcb_BodegaPredeterminadventas.getItemCount() > 1 && isClickedinJCB) {
            //objConfigEquipos.setValor2(jcb_BodegaPredeterminadventas.getSelectedItem().toString());
            objConfigEquipos.setValor1(jcb_BodegaPredeterminadventas.getSelectedItem().toString());
            objConfigEquipos.setNombre(txt_bodegaPredeterminadaEnVENTAS.getText());
            objConfigEquipos.setEquipos_codigo(login.CodigoDelEquipo);
            Config_EquiposDao objDao = new Config_EquiposDao();
            objDao.modificar(objConfigEquipos);
            Principal.bodegaPredeterminadaenVenta = jcb_BodegaPredeterminadventas.getSelectedItem().toString();
        }
    }//GEN-LAST:event_jcb_BodegaPredeterminadventasItemStateChanged

    private void jcb_BodegaPredeterminadventasMouseReleased(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jcb_BodegaPredeterminadventasMouseReleased
        // TODO add your handling code here:
        isClickedinJCB = true;
    }//GEN-LAST:event_jcb_BodegaPredeterminadventasMouseReleased

    private void jcb_BodegaPredeterminadventasActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jcb_BodegaPredeterminadventasActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jcb_BodegaPredeterminadventasActionPerformed

    private void jcb_PermitirFacturarSinStockItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcb_PermitirFacturarSinStockItemStateChanged
        // TODO add your handling code here:
        if (jcb_PermitirFacturarSinStock.getItemCount() > 1 && isClickedinJCB) {
            objconfig.setValor1(jcb_PermitirFacturarSinStock.getSelectedItem().toString());
            objconfig.setNombre(txt_PERMITIRFACTURARSINSTOCK.getText());
            ConfigDao objDao = new ConfigDao();
            objDao.modificar(objconfig);
            Principal.permitirvendersinstock = jcb_PermitirFacturarSinStock.getSelectedItem().toString();
        }
    }//GEN-LAST:event_jcb_PermitirFacturarSinStockItemStateChanged

    private void jcb_PermitirFacturarSinStockMouseReleased(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jcb_PermitirFacturarSinStockMouseReleased
        // TODO add your handling code here:
        isClickedinJCB = true;
    }//GEN-LAST:event_jcb_PermitirFacturarSinStockMouseReleased

    private void jcb_PermitirFacturarSinStockActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jcb_PermitirFacturarSinStockActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jcb_PermitirFacturarSinStockActionPerformed

    private void jcb_impticketsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jcb_impticketsActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jcb_impticketsActionPerformed

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        // TODO add your handling code here:
        if (evt.getClickCount() == 2) {
            rowClicked = jTable1.getSelectedRow();
            EquiposDao eqDao = new EquiposDao();
            this.cajaClicked = jTable1.getValueAt(rowClicked, 3).toString();
            equipo = eqDao.Buscar_conID(Integer.parseInt(jTable1.getValueAt(rowClicked, 0).toString()));
            System.out.println("Vista.Usuarios.Configuracion.jTable1MouseClicked()esqipo>: " + equipo);
            Frame f = JOptionPane.getFrameForComponent(this);
            SelectCaja dialog = new SelectCaja(f, true);
            System.out.println("Vista.Usuarios.Congifuracion.jTable1MouseClicked()");
            dialog.setLocation(evt.getPoint().x, evt.getPoint().y + 230);
            dialog.setVisible(true);
        }
    }//GEN-LAST:event_jTable1MouseClicked

    private void jTable1FocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_jTable1FocusGained
        // TODO add your handling code here:
        if (!codigoCaja.equals(0)) {
            login.codigoCaja = codigoCaja;
            jTable1.setValueAt(cajaClicked, rowClicked, 3);
            equipo.setCajas_Codigo(codigoCaja);
            equipo.setCajas_Nombre(cajaClicked);
            EquiposDao equipoDao = new EquiposDao();
            equipoDao.modificar(equipo);
            login.codigoCaja = codigoCaja;
            codigoCaja = 0;
        }

    }//GEN-LAST:event_jTable1FocusGained

    private void jcb_METODOVALORACIONINVENTARIOItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcb_METODOVALORACIONINVENTARIOItemStateChanged
        // TODO add your handling code here:
        if (jcb_METODOVALORACIONINVENTARIO.getItemCount() > 1 && isClickedinJCB) {
            objconfig.setValor1(jcb_METODOVALORACIONINVENTARIO.getSelectedItem().toString());
            objconfig.setNombre(jl_METODOVALORACIONINVENTARIO.getText());
            ConfigDao objDao = new ConfigDao();
            objDao.modificar(objconfig);
            if (jcb_METODOVALORACIONINVENTARIO.getSelectedItem().toString().equalsIgnoreCase("U.E.P.S")) {
                Principal.metodoValoracionInventario = 1;
            } else {
                Principal.metodoValoracionInventario = 2;
            }

        }

    }//GEN-LAST:event_jcb_METODOVALORACIONINVENTARIOItemStateChanged

    private void jcb_METODOVALORACIONINVENTARIOMouseReleased(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jcb_METODOVALORACIONINVENTARIOMouseReleased
        // TODO add your handling code here:
        isClickedinJCB = true;
    }//GEN-LAST:event_jcb_METODOVALORACIONINVENTARIOMouseReleased

    private void CHECFACROLLOItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_CHECFACROLLOItemStateChanged
        // TODO add your handling code here:
        if (CHECFACROLLO.isSelected()) {
            objConfigEquipos.setValor1("ROLLO");
            objConfigEquipos.setNombre(TXT_FACTURASDEROOLO.getText());

            Config_EquiposDao objDao = new Config_EquiposDao();
            objDao.modificar(objConfigEquipos);
            Principal.facturatiriiasoGrande = objConfigEquipos.getValor1();
        } else {
            objConfigEquipos.setValor1("GRANDE");
            objConfigEquipos.setNombre(TXT_FACTURASDEROOLO.getText());
            Config_EquiposDao objDao = new Config_EquiposDao();
            objDao.modificar(objConfigEquipos);
            Principal.facturatiriiasoGrande = objConfigEquipos.getValor1();
        }
    }//GEN-LAST:event_CHECFACROLLOItemStateChanged

    private void CHECFACGRANDEItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_CHECFACGRANDEItemStateChanged
        // TODO add your handling code here:
        if (CHECFACROLLO.isSelected()) {
            objConfigEquipos.setValor1("ROLLO");
            objConfigEquipos.setNombre(TXT_FACTURASDEROOLO.getText());
            Config_EquiposDao objDao = new Config_EquiposDao();
            objDao.modificar(objConfigEquipos);
            Principal.facturatiriiasoGrande = objConfigEquipos.getValor1();
        } else {
            objConfigEquipos.setValor1("GRANDE");
            objConfigEquipos.setNombre(TXT_FACTURASDEROOLO.getText());
            Config_EquiposDao objDao = new Config_EquiposDao();
            objDao.modificar(objConfigEquipos);
            Principal.facturatiriiasoGrande = objConfigEquipos.getValor1();
        }
    }//GEN-LAST:event_CHECFACGRANDEItemStateChanged

    private void CHECTICROLLOItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_CHECTICROLLOItemStateChanged
        // TODO add your handling code here:
        if (CHECTICROLLO.isSelected()) {
            objConfigEquipos.setValor1("ROLLO");
            objConfigEquipos.setNombre(TXT_TICKETSDEROOLO.getText());

            Config_EquiposDao objDao = new Config_EquiposDao();
            objDao.modificar(objConfigEquipos);
            Principal.tickettiriiasoGrande = objConfigEquipos.getValor1();
        } else {
            objConfigEquipos.setValor1("GRANDE");
            objConfigEquipos.setNombre(TXT_TICKETSDEROOLO.getText());
            Config_EquiposDao objDao = new Config_EquiposDao();
            objDao.modificar(objConfigEquipos);
            Principal.tickettiriiasoGrande = objConfigEquipos.getValor1();
        }

    }//GEN-LAST:event_CHECTICROLLOItemStateChanged

    private void CHECTICGRANDEItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_CHECTICGRANDEItemStateChanged
        // TODO add your handling code here:
        if (CHECTICROLLO.isSelected()) {
            objConfigEquipos.setValor1("ROLLO");
            objConfigEquipos.setNombre(TXT_TICKETSDEROOLO.getText());

            Config_EquiposDao objDao = new Config_EquiposDao();
            objDao.modificar(objConfigEquipos);
            Principal.tickettiriiasoGrande = objConfigEquipos.getValor1();
        } else {
            objConfigEquipos.setValor1("GRANDE");
            objConfigEquipos.setNombre(TXT_TICKETSDEROOLO.getText());
            Config_EquiposDao objDao = new Config_EquiposDao();
            objDao.modificar(objConfigEquipos);
            Principal.tickettiriiasoGrande = objConfigEquipos.getValor1();
        }
    }//GEN-LAST:event_CHECTICGRANDEItemStateChanged

    private void CHECPROFROLLOItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_CHECPROFROLLOItemStateChanged
        // TODO add your handling code here:
        if (CHECPROFROLLO.isSelected()) {
            objConfigEquipos.setValor1("ROLLO");
            objConfigEquipos.setNombre(TXT_PROFORMASDEROOLO2.getText());

            Config_EquiposDao objDao = new Config_EquiposDao();
            objDao.modificar(objConfigEquipos);
            Principal.proformatiriiasoFacturaGrande = objConfigEquipos.getValor1();
        } else {
            objConfigEquipos.setValor1("GRANDE");
            objConfigEquipos.setNombre(TXT_PROFORMASDEROOLO2.getText());
            Config_EquiposDao objDao = new Config_EquiposDao();
            objDao.modificar(objConfigEquipos);
            Principal.proformatiriiasoFacturaGrande = objConfigEquipos.getValor1();
        }
    }//GEN-LAST:event_CHECPROFROLLOItemStateChanged

    private void CHECPROFGRANDEItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_CHECPROFGRANDEItemStateChanged
        // TODO add your handling code here:
        if (CHECPROFROLLO.isSelected()) {
            objConfigEquipos.setValor1("ROLLO");
            objConfigEquipos.setNombre(TXT_PROFORMASDEROOLO2.getText());

            Config_EquiposDao objDao = new Config_EquiposDao();
            objDao.modificar(objConfigEquipos);
            Principal.proformatiriiasoFacturaGrande = objConfigEquipos.getValor1();
        } else {
            objConfigEquipos.setValor1("GRANDE");
            objConfigEquipos.setNombre(TXT_PROFORMASDEROOLO2.getText());
            Config_EquiposDao objDao = new Config_EquiposDao();
            objDao.modificar(objConfigEquipos);
            Principal.proformatiriiasoFacturaGrande = objConfigEquipos.getValor1();
        }
    }//GEN-LAST:event_CHECPROFGRANDEItemStateChanged

    private void txt_vecesImpreFac_ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_vecesImpreFac_ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_vecesImpreFac_ActionPerformed

    private void CHECK_CONTROL_EFECTIVOItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_CHECK_CONTROL_EFECTIVOItemStateChanged
        // TODO add your handling code here:
        if (CHECK_CONTROL_EFECTIVO.isSelected()) {
            objConfigEquipos.setValor1("SI");
            objConfigEquipos.setNombre(TXT_CONTROL_EFECTIVO_CAJA_SI_NO.getText());

            Config_EquiposDao objDao = new Config_EquiposDao();
            objDao.modificar(objConfigEquipos);
            loadconfig.controlElefectivoSiNO = objConfigEquipos.getValor1();
        } else {
            objConfigEquipos.setValor1("NO");
            objConfigEquipos.setNombre(TXT_CONTROL_EFECTIVO_CAJA_SI_NO.getText());
            Config_EquiposDao objDao = new Config_EquiposDao();
            objDao.modificar(objConfigEquipos);
            loadconfig.controlElefectivoSiNO = objConfigEquipos.getValor1();
        }

    }//GEN-LAST:event_CHECK_CONTROL_EFECTIVOItemStateChanged

    private void check_activarfacElectronicaItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_check_activarfacElectronicaItemStateChanged
        // TODO add your handling code here:
        if (check_activarfacElectronica.isSelected()) {
            objconfig.setValor1("1");
            objconfig.setNombre(check_activarfacElectronica.getText());
            ConfigDao objDao = new ConfigDao();
            objDao.modificar(objconfig);
            Principal.activarfacturacionelectronica = true;
//            check_preubas.setEnabled(true);
//            check_producciona.setEnabled(true);

        } else {
            objconfig.setValor1("0");
            objconfig.setNombre(check_activarfacElectronica.getText());
            ConfigDao objDao = new ConfigDao();
            objDao.modificar(objconfig);
            Principal.activarfacturacionelectronica = false;
//            check_preubas.setEnabled(false);
//            check_producciona.setEnabled(false);

        }
    }//GEN-LAST:event_check_activarfacElectronicaItemStateChanged

    private void check_preubasActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_check_preubasActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_check_preubasActionPerformed

    private void check_preubasItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_check_preubasItemStateChanged
        // TODO add your handling code here:

        if (check_preubas.isSelected()) {
            objconfig.setValor1("1");
            objconfig.setNombre(txt_ambiente.getText());
            ConfigDao objDao = new ConfigDao();
            objDao.modificar(objconfig);
            Variables.FE_TIPO_AMBIENTE = "1";

        } else {
            objconfig.setValor1("2");
            objconfig.setNombre(txt_ambiente.getText());
            ConfigDao objDao = new ConfigDao();
            objDao.modificar(objconfig);
            Variables.FE_TIPO_AMBIENTE = "2";

        }

    }//GEN-LAST:event_check_preubasItemStateChanged

    private void jcb_BodegaPredeterminadCOmpra1ItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcb_BodegaPredeterminadCOmpra1ItemStateChanged
        // TODO add your handling code here:
        if (jcb_BodegaPredeterminadCOmpra1.getItemCount() > 1 && !jcb_BodegaPredeterminadCOmpra1.getSelectedItem().equals(seleccione)) {
            objConfigEquiposcompra.setValor1(jcb_BodegaPredeterminadCOmpra1.getSelectedItem().toString());

        }
    }//GEN-LAST:event_jcb_BodegaPredeterminadCOmpra1ItemStateChanged

    private void jcb_BodegaPredeterminadCOmpra1MouseReleased(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jcb_BodegaPredeterminadCOmpra1MouseReleased
        // TODO add your handling code here:
        isClickedinJCBCompra = true;
    }//GEN-LAST:event_jcb_BodegaPredeterminadCOmpra1MouseReleased

    private void jcb_BodegaPredeterminadCOmpra1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jcb_BodegaPredeterminadCOmpra1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jcb_BodegaPredeterminadCOmpra1ActionPerformed

    private void jcb_BodegaPredeterminadventas1ItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcb_BodegaPredeterminadventas1ItemStateChanged
        // TODO add your handling code here:
        if (jcb_BodegaPredeterminadventas1.getItemCount() > 1 && jcb_BodegaPredeterminadventas1.getSelectedItem().equals("seleccione")) {
            //objConfigEquipos.setValor2(jcb_BodegaPredeterminadventas.getSelectedItem().toString());
            objConfigEquiposventa.setValor1(jcb_BodegaPredeterminadventas1.getSelectedItem().toString());
        }
    }//GEN-LAST:event_jcb_BodegaPredeterminadventas1ItemStateChanged

    private void jcb_BodegaPredeterminadventas1MouseReleased(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jcb_BodegaPredeterminadventas1MouseReleased
        // TODO add your handling code here:
        isClickedinJCBVenta = true;
    }//GEN-LAST:event_jcb_BodegaPredeterminadventas1MouseReleased

    private void jcb_BodegaPredeterminadventas1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jcb_BodegaPredeterminadventas1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jcb_BodegaPredeterminadventas1ActionPerformed

    private void jcb_cajaPredeterminada1ItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcb_cajaPredeterminada1ItemStateChanged
        // TODO add your handling code here:
        System.out.println("Vista.Usuarios.SelectCaja.jComboBox1ItemStateChanged()se ha seleccinadosss");
        if (jcb_cajaPredeterminada1.getSelectedItem() != null) {
            for (Cajas cajas : lista) {
                if (jcb_cajaPredeterminada1.getSelectedItem().toString().equals(cajas.getCaja())) {

                    cajaCodigo = cajas.getCodigo();
                    cajaNombre = cajas.getCaja();
                }
                if (jcb_cajaPredeterminada1.getSelectedItem().toString().equals(seleccione)) {
                    cajaCodigo = null;
                    cajaNombre = "N/A";
                    JOptionPane.showMessageDialog(null, "Por favor Seleccione una Caja para este Equipo");
                }

            }
        }
    }//GEN-LAST:event_jcb_cajaPredeterminada1ItemStateChanged

    private void jcb_cajaPredeterminada1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jcb_cajaPredeterminada1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jcb_cajaPredeterminada1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:
        exit(0);
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        alerta.menajes(jcb_BodegaPredeterminadCOmpra1.getSelectedItem().toString() + jcb_BodegaPredeterminadventas1.getSelectedItem().toString());
        if (!jcb_BodegaPredeterminadCOmpra1.getSelectedItem().toString().equalsIgnoreCase(seleccione) && !jcb_BodegaPredeterminadventas1.getSelectedItem().toString().equalsIgnoreCase(seleccione)) {
            if (cajaCodigo != null && cajaNombre != null) {
                if (txtSec1.getText().length() == 3 && txtSec2.getText().length() == 3 && txtSec3.getText().length() == 9) {

                    obj.setCajas_Codigo(cajaCodigo);
                    obj.setCajas_Nombre(cajaNombre);
                    obj.setIp(maquina.getIpEquipo());
                    obj.setNombreReal(maquina.getNombreEquipo());
                    obj.setNombreSof(maquina.getNombreEquipo() + "_" + txt_nombreSoft.getText());
                    obj.setSecuencia1(txtSec1.getText());
                    obj.setSecuencia2(txtSec2.getText());
                    obj.setSecuencia3(txtSec3.getText());
                    codigoNewEquipo = objDao.guardar(obj);
                    jcb_BodegaPredeterminadCOmpra.setEnabled(false);
                    jcb_BodegaPredeterminadventas.setEnabled(false);
                    jcb_cajaPredeterminada1.setEnabled(false);
                    jList1.setEnabled(true);
                    /////////////////////////////////
                    //crear todas la configuraciones  por defecto vacias
                    ///////////////crearla configuracioninicialocargarla
                    for (Config2 c : listConfig2) {
                        Config_Equipos configEq = new Config_Equipos();
                        Config_EquiposDao configEqDao = new Config_EquiposDao();
                        configEq.setConfig2_codigo(c.getCodigo());
                        configEq.setEquipos_codigo(codigoNewEquipo);
                        configEq.setNombre(c.getNombre());
                        configEq.setValor1("N/A");
                        boolean resp = configEqDao.guardar(configEq);
                    }
                    //////////////////////////////////
                } else {
                    JOptionPane.showMessageDialog(null, "Secuencal mal formado..");
                }
            } else {
                JOptionPane.showMessageDialog(null, "Debe Seleccionar una Caja..");
            }
        } else {
            JOptionPane.showMessageDialog(null, "Debe Seleccionar Bodegas Predeterminadas para Compra y  Venta");
        }
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jList2MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jList2MouseClicked

        // TODO add your handling code here:
        if (evt.getClickCount() == 2 && codigoConfig2 != -1) {
            //////////////
            //////////////consulto el codigo del config2 seleccionado
            Config_Equipos configEqtoUpdate = new Config_Equipos();
            Config_EquiposDao configEqDaoupdate = new Config_EquiposDao();
            configEqtoUpdate = configEqDaoupdate.buscarConfiguracionesdeEquipos(codigoNewEquipo, codigoConfig2);
            System.out.println("equipo en operacion: " + configEqtoUpdate.toString());
            System.out.println("Codifoxxxx: " + configEqtoUpdate.getCodigo());
            if (configEqtoUpdate.getCodigo() == null) {
                Config_Equipos configEq = new Config_Equipos();
                Config_EquiposDao configEqDao = new Config_EquiposDao();

                configEq.setConfig2_codigo(codigoConfig2);
                configEq.setEquipos_codigo(codigoNewEquipo);
                configEq.setNombre(jList1.getSelectedValue());
                configEq.setValor1(jList2.getSelectedValue());
                boolean resp = configEqDao.guardar(configEq);
                if (resp) {
                    JOptionPane.showMessageDialog(null, "Se regstro: " + jList2.getSelectedValue());
                }
            } else {
                configEqtoUpdate.setValor1(jList2.getSelectedValue());
                Config_EquiposDao configEqDaoupdate2 = new Config_EquiposDao();
                configEqDaoupdate2.ActualizarValor1deConfiguracion(configEqtoUpdate);
                jLabel5.setText(jList1.getSelectedValue() + " --> " + (jList2.getSelectedValue()));
            }
            jList2.setSelectionBackground(Color.ORANGE);

        }
        jList2.setSelectionBackground(Color.ORANGE);
    }//GEN-LAST:event_jList2MouseClicked

    private void jList1ValueChanged(javax.swing.event.ListSelectionEvent evt) {//GEN-FIRST:event_jList1ValueChanged
        // TODO add your handling code here:
        Integer index = -1;
        Integer i = 0;
        jLabel5.setText(jList1.getSelectedValue());

        for (Config2 config2 : listConfig2) {
            if (config2.getNombre().equalsIgnoreCase(jList1.getSelectedValue())) {
                System.out.println("Nombre Coonfig2 sleeccionado: " + jList1.getSelectedValue());
                codigoConfig2 = config2.getCodigo();
                System.out.println("Codigo Coonfig2 sleeccionado: " + codigoConfig2);
            }

        }

        //Integer index = -1;
        Config_Equipos csofi = new Config_Equipos();
        Config_EquiposDao cdao = new Config_EquiposDao();
        csofi = cdao.buscarConfiguracionesdeEquipos(codigoNewEquipo, codigoConfig2);
        model2.clear();
        switch (jList1.getSelectedValue()) {
            case "IMPRESORA TICKETS":

                List<String> listaimpresoras;
                listaimpresoras = ServicioDeImpresion.getListadeImpresoras();
                for (String listaimpresora : listaimpresoras) {
                    model2.add(i, listaimpresora);
                    if (csofi.getValor1().equalsIgnoreCase(listaimpresora)) {
                        index = i;
                        jLabel5.setText(csofi.getNombre() + " --> " + (csofi.getValor1()));
                        Principal.impresoraTicket = csofi.getValor1();
                    }
                    i++;
                }

                jList2.setModel(model2);
                jList2.setSelectedIndex(index);
                break;

            case "IMPRESORA FACTURAS":
                List<String> listaimpresoras2;
                listaimpresoras2 = ServicioDeImpresion.getListadeImpresoras();
                for (String listaimpresora : listaimpresoras2) {
                    model2.add(i, listaimpresora);
                    if (csofi.getValor1().equalsIgnoreCase(listaimpresora)) {
                        index = i;
                        jLabel5.setText(csofi.getNombre() + " --> " + (csofi.getValor1()));
                        Principal.impresoraFactura = csofi.getValor1();
                    }
                    i++;
                }
                jList2.setModel(model2);
                jList2.setSelectedIndex(index);

                //      jcb_configoptions.setPopupVisible(true);
                break;
            case "FORMA DE PAGO PREDETERMINADA":
                FormasPagoVDao fpDao = new FormasPagoVDao();
                for (FormasPagoV f : fpDao.listar()) {
                    model2.add(i, f.getFormaPago());
                    if (csofi.getValor1().equalsIgnoreCase(f.getFormaPago())) {
                        index = i;
                        jLabel5.setText(csofi.getNombre() + " --> " + (csofi.getValor1()));
                        Principal.formadepagopredeterminada = csofi.getValor1();
                    }

                    i++;
                }
                jList2.setModel(model2);
                jList2.setSelectedIndex(index);
                break;
            case "BODEGA PREDETERMINADA EN COMPRA":
                BodegasDao bDao = new BodegasDao();
                listBodegas = bDao.listar();

                for (Bodegas b : listBodegas) {

                    model2.add(i, b.getBodegaID() + "-" + b.getBodega());
                    if (csofi.getValor1().equalsIgnoreCase(b.getBodegaID() + "-" + b.getBodega())) {
                        index = i;
                        jLabel5.setText(csofi.getNombre() + " --> " + (csofi.getValor1()));
                        Principal.bodegaPredeterminadaenCOmpraNOmbre = csofi.getValor1();
                        Principal.bodegaPredeterminadaenCOmpra = b.getBodegaID() + "-" + b.getBodega();
                    }

                    i++;
                }
                jList2.setModel(model2);
                jList2.setSelectedIndex(index);
                break;
            case "BODEGA PREDETERMINADA EN VENTA":
                BodegasDao bDao2 = new BodegasDao();
                listBodegas = bDao2.listar();

                for (Bodegas b : listBodegas) {
                    model2.add(i, b.getBodegaID() + "-" + b.getBodega());
                    if (csofi.getValor1().equalsIgnoreCase(b.getBodegaID() + "-" + b.getBodega())) {
                        index = i;
                        jLabel5.setText(csofi.getNombre() + " --> " + (csofi.getValor1()));
                        Principal.bodegaPredeterminadaenVentaNombre = csofi.getValor1();
                        Principal.bodegaPredeterminadaenVenta = b.getBodegaID() + "-" + b.getBodega();
                    }

                    i++;
                }
                jList2.setModel(model2);
                jList2.setSelectedIndex(index);
                break;
            case "VER IMAAGEN":
                break;
            case "FACTURA TIRILLAS O CON FORMATO":
                model2.add(0, "GRANDE");
                model2.add(1, "ROLLO");
                for (Object object : model2.toArray()) {
                    if (csofi.getValor1().equalsIgnoreCase(object.toString())) {
                        index = i;
                        jLabel5.setText(csofi.getNombre() + " --> " + (csofi.getValor1()));
                        Principal.facturatiriiasoGrande = csofi.getValor1();
                    }
                    i++;
                }
                jList2.setModel(model2);
                jList2.setSelectedIndex(index);
                break;
            case "TICKET TIRILLAS O CON FORMATO":
                model2.add(0, "GRANDE");
                model2.add(1, "ROLLO");
                for (Object object : model2.toArray()) {
                    if (csofi.getValor1().equalsIgnoreCase(object.toString())) {
                        index = i;
                        jLabel5.setText(csofi.getNombre() + " --> " + (csofi.getValor1()));
                        Principal.tickettiriiasoGrande = csofi.getValor1();
                    }
                    i++;
                }
                jList2.setModel(model2);
                jList2.setSelectedIndex(index);
                break;

            case "PROFORMA TIRILLAS O CON FORMATO":
                model2.add(0, "GRANDE");
                model2.add(1, "ROLLO");
                for (Object object : model2.toArray()) {
                    if (csofi.getValor1().equalsIgnoreCase(object.toString())) {
                        index = i;
                        jLabel5.setText(csofi.getNombre() + " --> " + (csofi.getValor1()));
                        Principal.proformatiriiasoFacturaGrande = csofi.getValor1();
                    }
                    i++;
                }
                jList2.setModel(model2);
                jList2.setSelectedIndex(index);
                break;
            case "ACTIVAR CONTROL EFECTIVO":
                model2.add(0, "SI");
                model2.add(1, "NO");
                for (Object object : model2.toArray()) {
                    if (csofi.getValor1().equalsIgnoreCase(object.toString())) {
                        index = i;
                        jLabel5.setText(csofi.getNombre() + " --> " + (csofi.getValor1()));
                        loadconfig.controlElefectivoSiNO = csofi.getValor1();
                    }
                    i++;
                }
                jList2.setModel(model2);
                jList2.setSelectedIndex(index);
                break;
            case "FORMATO FACTURA":
                break;
            case "FORMATO TICKET":
                break;
            case "FORMATO PROFORMA ":
                break;
            case "VER IMAGEN":
                model2.add(0, "SI");
                model2.add(1, "NO");
                for (Object object : model2.toArray()) {
                    if (csofi.getValor1().equalsIgnoreCase(object.toString())) {
                        index = i;
                        jLabel5.setText(csofi.getNombre() + " --> " + (csofi.getValor1()));
                        Principal.VerImagenEnFacturacion = csofi.getValor1();

                    }
                    i++;
                }
                jList2.setModel(model2);
                jList2.setSelectedIndex(index);
                break;
            case "ITEM REPETIDO SUMAR CANTIDAD EN FACTURACION":
                model2.add(0, "SI");
                model2.add(1, "NO");
                for (Object object : model2.toArray()) {
                    if (csofi.getValor1().equalsIgnoreCase(object.toString())) {
                        index = i;
                        jLabel5.setText(csofi.getNombre() + " --> " + (csofi.getValor1()));
                        Principal.ItemRepetidoEnFacturacionSumarCantidad = csofi.getValor1();

                    }
                    i++;
                }
                jList2.setModel(model2);
                jList2.setSelectedIndex(index);
                break;

        }
    }//GEN-LAST:event_jList1ValueChanged

    private void jTabbedPane1StateChanged(javax.swing.event.ChangeEvent evt) {//GEN-FIRST:event_jTabbedPane1StateChanged
        // TODO add your handling code here:
        System.out.println("Vista.Usuarios.Configuracion.jTabbedPane1StateChanged()" + jTabbedPane1.getSelectedIndex());
        if (esteesequipoNuevo != 1) {
            txtSec1.setEditable(false);
            txtSec2.setEditable(false);
            txtSec3.setEditable(false);
            txt_nombreSoft.setEditable(false);
            jcb_BodegaPredeterminadCOmpra1.setEditable(false);
            jcb_BodegaPredeterminadventas1.setEditable(false);
            jcb_cajaPredeterminada1.setEditable(false);

            System.out.println("Vista.Usuarios.Configuracion.<init>()10: " + jPanel10.getBounds());
            System.out.println("Vista.Usuarios.Configuracion.<init>12(),llll: " + jPanel12.getBounds());
            jPanel10.setBounds(0, 0, 0, 0);
            jPanel12.setBounds(6, 0, 495, 499);
            jPanel10.repaint();
            jPanel12.repaint();

            // this.pack();
        }


    }//GEN-LAST:event_jTabbedPane1StateChanged

    private void jcb_editarDetalle_item_en_FacturacionItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcb_editarDetalle_item_en_FacturacionItemStateChanged
        // TODO add your handling code here:
        if (jcb_editarDetalle_item_en_Facturacion.getItemCount() > 1) {
            objconfig.setValor1(jcb_editarDetalle_item_en_Facturacion.getSelectedItem().toString());
            objconfig.setNombre(txt_editarDetalle_item_en_Facturacion.getText());
            ConfigDao objDao = new ConfigDao();
            objDao.modificar(objconfig);
            Principal.editarDetalle_item_en_Facturacion = jcb_editarDetalle_item_en_Facturacion.getSelectedItem().toString();
        }
    }//GEN-LAST:event_jcb_editarDetalle_item_en_FacturacionItemStateChanged


    // Variables declaration - do not modify//GEN-BEGIN:variables
    public static javax.swing.JCheckBox CHECFACGRANDE;
    public static javax.swing.JCheckBox CHECFACROLLO;
    public static javax.swing.JCheckBox CHECK_CONTROL_EFECTIVO;
    public static javax.swing.JCheckBox CHECPROFGRANDE;
    public static javax.swing.JCheckBox CHECPROFROLLO;
    public static javax.swing.JCheckBox CHECTICGRANDE;
    public static javax.swing.JCheckBox CHECTICROLLO;
    public static javax.swing.JLabel TXT_CONTROL_EFECTIVO_CAJA_SI_NO;
    public static javax.swing.JLabel TXT_FACTURASDEROOLO;
    public static javax.swing.JLabel TXT_PROFORMASDEROOLO2;
    public static javax.swing.JLabel TXT_TICKETSDEROOLO;
    private javax.swing.ButtonGroup bgfacturas;
    private javax.swing.ButtonGroup bgproformas;
    private javax.swing.ButtonGroup bgtickets;
    public static javax.swing.ButtonGroup buttonGroup1x;
    public static javax.swing.JCheckBox check_activarfacElectronica;
    public static javax.swing.JCheckBox check_preubas;
    public static javax.swing.JCheckBox check_producciona;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JList<String> jList1;
    private javax.swing.JList<String> jList2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel10;
    private javax.swing.JPanel jPanel11;
    private javax.swing.JPanel jPanel12;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JPanel jPanel8;
    private javax.swing.JPanel jPanel9;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JScrollPane jScrollPane4;
    public static javax.swing.JTabbedPane jTabbedPane1;
    private javax.swing.JTabbedPane jTabbedPane2;
    public static javax.swing.JTable jTable1;
    private javax.swing.JTable jTable2;
    private javax.swing.JToolBar jToolBar1;
    public static javax.swing.JComboBox<String> jcb_BodegaPredeterminadCOmpra;
    private javax.swing.JComboBox<String> jcb_BodegaPredeterminadCOmpra1;
    public static javax.swing.JComboBox<String> jcb_BodegaPredeterminadventas;
    private javax.swing.JComboBox<String> jcb_BodegaPredeterminadventas1;
    public static javax.swing.JComboBox<String> jcb_METODOVALORACIONINVENTARIO;
    public static javax.swing.JComboBox<String> jcb_PermitirFacturarSinStock;
    private javax.swing.JComboBox<String> jcb_cajaPredeterminada1;
    public static javax.swing.JComboBox<String> jcb_documentopredeterminado;
    private javax.swing.JComboBox<String> jcb_editarDetalle_item_en_Facturacion;
    public static javax.swing.JComboBox<String> jcb_formadePagoPredeterminada;
    public static javax.swing.JComboBox<String> jcb_impfacturas;
    public static javax.swing.JComboBox<String> jcb_imptickets;
    public static javax.swing.JLabel jl_METODOVALORACIONINVENTARIO;
    private javax.swing.JLabel jlnombrereal;
    private javax.swing.JTextField txtSec1;
    private javax.swing.JTextField txtSec2;
    private javax.swing.JTextField txtSec3;
    private javax.swing.JLabel txt_NumEq;
    public static javax.swing.JLabel txt_PERMITIRFACTURARSINSTOCK;
    private javax.swing.JLabel txt_ambiente;
    public static javax.swing.JLabel txt_bodegaPredeterminadaEnCompras;
    private javax.swing.JLabel txt_bodegaPredeterminadaEnCompras1;
    public static javax.swing.JLabel txt_bodegaPredeterminadaEnVENTAS;
    private javax.swing.JLabel txt_bodegaPredeterminadaEnVENTAS1;
    public static javax.swing.JLabel txt_documentopredeterminado;
    private javax.swing.JLabel txt_editarDetalle_item_en_Facturacion;
    public static javax.swing.JLabel txt_facturas;
    public static javax.swing.JLabel txt_formadepagoPredeterminada;
    public static javax.swing.JLabel txt_iva;
    public static javax.swing.JTextField txt_iva_;
    public static javax.swing.JLabel txt_moneda;
    public static javax.swing.JTextField txt_moneda_;
    private javax.swing.JTextField txt_nombreSoft;
    public static javax.swing.JLabel txt_tickets;
    public static javax.swing.JLabel txt_utilidad;
    public static javax.swing.JTextField txt_utilidad_;
    public static javax.swing.JLabel txt_vecesImpreFac;
    public static javax.swing.JTextField txt_vecesImpreFac_;
    // End of variables declaration//GEN-END:variables
}
