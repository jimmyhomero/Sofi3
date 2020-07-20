/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista;

import ClasesAuxiliares.BackupBaseDatos.BackupMysql;
import ClasesAuxiliares.MaquinaDao;
import ClasesAuxiliares.NewSql.Forms.OperacionesForms;
import ClasesAuxiliares.NewSql.updataesBDD;
import ClasesAuxiliares.Update;
import ClasesAuxiliares.Variables;
import ClasesAuxiliares.loadFromtxtoMysql.LoadDataFromtxtToMysql;
import ClasesAuxiliares.loadconfig;
import Controlador.Coneccion;
import Controlador.Electronica;
import Controlador.GUIUtils;
import Controlador.UnActionListener;
import Controlador.Usuarios.ConfigDao;
import Controlador.Usuarios.Config_EquiposDao;
import Controlador.Usuarios.Config_UsuariosDao;
import Controlador.Usuarios.EquiposDao;
import Modelo.Clientes;
import Modelo.ConfigSofia;
import Modelo.Config_Equipos;
import Modelo.Config_Usuarios;
import Modelo.Equipos;
import Modelo.Tipo_Usuario;
import Vista.Backup.Crear_Backup;
import Vista.Usuarios.BuscarFacturas;
import Vista.Usuarios.Buscar_Clientes;
import Vista.Productos.Buscar_Productos;
import Vista.Sat.Crear_Aparato;
import Vista.Sat.Crear_Orden;
import Vista.Usuarios.BotonSuperior;
import Vista.Usuarios.BuscarCompras;
import Vista.Usuarios.Buscar_Proveedores;
import Vista.Usuarios.Buscar_Tipos;
import Vista.Usuarios.Buscar_cxc;
import Vista.Usuarios.Buscar_electronicas;
import Vista.Usuarios.Crear_Usuarios;
import Vista.Usuarios.Buscar_usuarios;
import Vista.Usuarios.Configuracion;
import Vista.Usuarios.CrearBodegas;
import Vista.Usuarios.Crear_Clientes;
import Vista.Usuarios.Crear_Compras;
import Vista.Usuarios.Crear_Productos;
import Vista.Usuarios.Crear_Proveedores;
import Vista.Usuarios.Crear_RetencionC;
import Vista.Usuarios.Crear_Tipo_Usuarios;
import Vista.Usuarios.CuadrarCaja;
import Vista.Usuarios.DatosEmpresaForm;
import Vista.Usuarios.DesgargarDocumentosElectronicosEMITIDOSSRI;
import Vista.Usuarios.DesgargarDocumentosElectronicosSRI;
import Vista.caja.EgresoCaja;
import Vista.Usuarios.ImprtarInventario;
import Vista.Usuarios.Modal;
import Vista.Usuarios.Modal_BucarUsuarios;
import Vista.Usuarios.Modal_CrearFacturas;
import Vista.Usuarios.Modal_CrearNotaCredito;
import Vista.Usuarios.Modal_Crear_Pvps;
import Vista.Usuarios.Modal_Crear_compras;
import Vista.Usuarios.Modal_buscarCilentes;
import Vista.Usuarios.Modal_buscarProveedores;
import Vista.Usuarios.NuevaFormaPago;
import Vista.Usuarios.PLANC;
import Vista.caja.IngresoCaja;
import Vista.Usuarios.prueba1;
import Vista.dasboard.dash;
import ecx.unomas.service.Config;
import login.login;
import java.awt.Dimension;
import java.awt.GraphicsDevice;
import java.awt.GraphicsEnvironment;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyVetoException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JButton;
import javax.swing.JDesktopPane;
import javax.swing.JFrame;
import javax.swing.JInternalFrame;
import javax.swing.JOptionPane;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import org.jespxml.pruebas.PruebaXML;

/**
 *
 * @author USUARIO
 */
public class Principal extends javax.swing.JFrame {

    /**
     * Creates new form Main
     */
    public static Integer controlareduccionPrincilapParamenusuperior = 0;
     public static Integer NumerodeBotonesAbiertos = 0;
    int numVentana = 0;/// si es cero, significa que no se ha encontrado un frmulario de tipo que ya ecista 
    public static boolean IsOpenFormNuevoUsuario = false;
    ConfigSofia conf = new ConfigSofia();
    ConfigDao confDao = new ConfigDao();
    Config_EquiposDao confEquipoDao = new Config_EquiposDao();
    Config_UsuariosDao confUsuarioDao = new Config_UsuariosDao();
    ArrayList<ConfigSofia> listConfig = new ArrayList<ConfigSofia>();
    ArrayList<Config_Equipos> listConfigdeEquipo = new ArrayList<Config_Equipos>();
    ArrayList<Config_Usuarios> listConfigdeUsuarios = new ArrayList<Config_Usuarios>();
    public static ArrayList<Integer> posisionButonToolbar = new ArrayList<Integer>();
    public static boolean isllamadoDesdeProveedorOCliente=false; ///false cliente, true proveedor;

    //JInternalFrame obj = new JInternalFrame();
    public static Integer X;
    public static Integer Y;
    public static Integer X2;
    public static Integer Y2;
    public static String iva;
    public static String periodo;
    public static String moneda;
    public static String monedaSigno;
    public static String utilidad;
    //public static Integer loginAPpOK;
    public static String impresoraTicket;
    public static String impresoraFactura;
    public static String numerovecseimpresionFactura = "1";
    public static String documentoPredeterminadoFacturacion;
    public static boolean activarfacturacionelectronica;
    public static String documentoPredeterminadoFacturacionCodigo;
    public static String formadepagopredeterminada;
    public static String bodegaPredeterminadaenCOmpra;
    public static String bodegaPredeterminadaenCOmpraNOmbre;
    public static String bodegaPredeterminadaenVenta;
    public static String bodegaPredeterminadaenVentaNombre;
    public static String permitirvendersinstock;
    public static String editarDetalle_item_en_Facturacion;
    public static String soloFacturacionElectronica;
    public static Integer metodoValoracionInventario; //UEPS =1,PROMEDIO=2
    public static String facturatiriiasoGrande;
    public static String tickettiriiasoGrande;
    public static String proformatiriiasoFacturaGrande;
    public static String ItemRepetidoEnFacturacionSumarCantidad;
    public static String VerImagenEnFacturacion;

    public static String obligaoSINO;
    public static String controlCambioEfectivoSINO;
    public static boolean FE_SOLO_FIRMA_DOC;

    public Principal() {

        initComponents();

//        jc j = new jc();
        //      j.setVisible(true);
        GraphicsDevice gd = GraphicsEnvironment.getLocalGraphicsEnvironment().getDefaultScreenDevice();
        int width = gd.getDisplayMode().getWidth();
        int height = gd.getDisplayMode().getHeight();

        Variables.trial();
        //  Variables v = new Variables();

        // System.out.println("Vista.Principal.<init>() usuario: " + login.nombresUsuario);
        this.setTitle("   SOFI SOFTWARE    " + login.nombreEmpresa + "    Usuario :  " + login.nombresUsuario + "    Equipo :  " + login.nombreDelEquipo);
        configuracionsistemageneral();
        this.setExtendedState(MAXIMIZED_BOTH);

        System.out.println("Vista.Principal.<init>()siiiiiiiiiiiiiiiiiiiiiiiiii : " + soloFacturacionElectronica);
        if (soloFacturacionElectronica.equals("SI")) {
            this.menuBar.setEnabled(false);
            this.menuBar.setVisible(false);
            System.out.println("Vista.Principal.<init>()siiiiiiiiiiiiiiiiiiiiiiiiii : " + soloFacturacionElectronica);
            Buscar_electronicas be = new Buscar_electronicas();
            desktopPane.add(be);
            be.setVisible(true);
        }
        /////////////////LLAMA DASHBOARD
        //dash d = new dash();
        ///desktopPane.add(d);
        ///d.setVisible(true);

        ////////////////
        ////////////preubas
        //  Modal m = new Modal();
        //  desktopPane.add(m);
        // m.setVisible(true);
        ////////////
    }

    public void configuracionsistemageneral() {

        listConfig = confDao.listar();
        for (ConfigSofia c : listConfig) {
            switch (c.getNombre()) {
                case "IVA":
                    this.iva = c.getValor1();
                    break;
                case "MONEDA":
                    this.moneda = c.getValor1();

                    break;
                case "UTILIDAD":
                    this.utilidad = c.getValor1();
                    break;
                case "NUMERO DE VECES QUE SE IMPRIMIRA FACTURA":
                    this.numerovecseimpresionFactura = c.getValor1();
                    break;
                case "DOCUMENTO PREDETERMINADO":
                    this.documentoPredeterminadoFacturacion = c.getValor1();
                    break;
                case "PERMITIR FACTURAR SIN STCOCK":
                    this.permitirvendersinstock = c.getValor1();
                    break;
                case "ELECTRONICA":
                    this.soloFacturacionElectronica = c.getValor1();
                    break;
                case "FE_SOLO_FIRMA_DOC":
                    //// SI ESTA EN 1 SOLO FIRMA EL XML , SI ESTA EN 0 CREA, FIRMA ENVIA AUTORIZA
                    this.FE_SOLO_FIRMA_DOC = Boolean.getBoolean(c.getValor1());
                    break;
                case "PERIODO":
                    this.periodo = c.getValor1();
                    break;
                case "GENERADOS":
                    Config.GENERADOS_DIR = c.getValor1();
                    break;
                case "FIRMADOS":
                    Config.FIRMADOS_DIR = c.getValor1();
                    break;
                case "AUTORIZADOS":
                    Config.AUTORIZADOS_DIR = c.getValor1();
                    break;
                case "FIRMADOS_SHEYLA":
                    Config.GENERADOS_TEMP = c.getValor1();
                    break;
                case "LOGO_ELECTRONICA":
                    Config.LOGO = c.getValor1();
                    break;
                case "CACERT":
                    Config.CACERT = c.getValor1();
                    break;
                case "FIRMA":
                    Config.PKCS12_RESOURCE = c.getValor1();
                    break;
                case "FIRMA_PASSWORD":
                    Config.PKCS12_PASSWORD_DIR = c.getValor1();
                    break;
                case "METODO DE VALORACION DE INVENTARIO":
                    if (c.getValor1().equalsIgnoreCase("U.E.P.S")) {
                    }
                    if (c.getValor1().equalsIgnoreCase("PROMEDIO")) {
                        metodoValoracionInventario = 2;
                    }

                    break;
                case "OBLIGADO":
                    this.obligaoSINO = c.getValor1();
                    break;

            }

        }
        listConfigdeEquipo = confEquipoDao.listarByID(login.CodigoDelEquipo);
        for (Config_Equipos c : listConfigdeEquipo) {

            switch (c.getNombre()) {
                case "IMPRESORA TICKETS":
                    this.impresoraTicket = c.getValor1();
                    break;
                case "IMPRESORA FACTURAS":
                    this.impresoraFactura = c.getValor1();
                    break;
                case "FORMA DE PAGO PREDETERMINADA":
                    this.formadepagopredeterminada = c.getValor1();
                    break;
                case "BODEGA PREDETERMINADA EN COMPRA":
                    this.bodegaPredeterminadaenCOmpra = c.getValor1();

                    break;
                case "BODEGA PREDETERMINADA EN VENTA":
                    this.bodegaPredeterminadaenVenta = c.getValor1();
                    Variables.BODEGA_PREDETERMINDA_VENTA = c.getValor1();
                    break;
                case "FACTURA TIRILLAS O CON FORMATO":

                    facturatiriiasoGrande = c.getValor1();
                    break;
                case "TICKET TIRILLAS O CON FORMATO":

                    Principal.tickettiriiasoGrande = c.getValor1();
                    break;

                case "PROFORMA TIRILLAS O CON FORMATO":

                    Principal.proformatiriiasoFacturaGrande = c.getValor1();
                    break;
                case "ACTIVAR CONTROL EFECTIVO":
                    this.controlCambioEfectivoSINO = c.getValor1();
                    break;
                case "VER IMAGEN":
                    this.VerImagenEnFacturacion = c.getValor1();
                    break;
                case "ITEM REPETIDO SUMAR CANTIDAD EN FACTURACION":
                    System.err.println("ITEM REPETIDO SUMAR CANTIDAD EN FACTURACION ::::: " + c.getValor1());
                    this.ItemRepetidoEnFacturacionSumarCantidad = c.getValor1();
                    break;

            }

        }
//  loadconfig q = new loadconfig();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jFrame1 = new javax.swing.JFrame();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu3 = new javax.swing.JMenu();
        jMenu4 = new javax.swing.JMenu();
        jMenuBar2 = new javax.swing.JMenuBar();
        jMenu5 = new javax.swing.JMenu();
        jMenu6 = new javax.swing.JMenu();
        jFrame2 = new javax.swing.JFrame();
        jMenuItem9 = new javax.swing.JMenuItem();
        desktopPane = new javax.swing.JDesktopPane();
        jProgressBar2 = new javax.swing.JProgressBar();
        menuBar = new javax.swing.JMenuBar();
        fileMenu = new javax.swing.JMenu();
        openMenuItem = new javax.swing.JMenuItem();
        DatosEmpresa = new javax.swing.JMenuItem();
        saveAsMenuItem = new javax.swing.JMenuItem();
        exitMenuItem = new javax.swing.JMenuItem();
        editMenu = new javax.swing.JMenu();
        cutMenuItem = new javax.swing.JMenuItem();
        copyMenuItem = new javax.swing.JMenuItem();
        pasteMenuItem = new javax.swing.JMenuItem();
        deleteMenuItem = new javax.swing.JMenuItem();
        helpMenu = new javax.swing.JMenu();
        contentMenuItem = new javax.swing.JMenuItem();
        aboutMenuItem = new javax.swing.JMenuItem();
        jMenuItem7 = new javax.swing.JMenuItem();
        jMenuItem13 = new javax.swing.JMenuItem();
        helpMenu1 = new javax.swing.JMenu();
        NuevoProducto = new javax.swing.JMenuItem();
        aboutMenuItem1 = new javax.swing.JMenuItem();
        aboutMenuItem9 = new javax.swing.JMenuItem();
        jMenuItem10 = new javax.swing.JMenuItem();
        jMenuItem11 = new javax.swing.JMenuItem();
        helpMenu2 = new javax.swing.JMenu();
        contentMenuItem2 = new javax.swing.JMenuItem();
        aboutMenuItem2 = new javax.swing.JMenuItem();
        helpMenu3 = new javax.swing.JMenu();
        menNUevoCLiente = new javax.swing.JMenuItem();
        aboutMenuItem3 = new javax.swing.JMenuItem();
        helpMenu4 = new javax.swing.JMenu();
        contentMenuItem4 = new javax.swing.JMenuItem();
        aboutMenuItem4 = new javax.swing.JMenuItem();
        helpMenu5 = new javax.swing.JMenu();
        contentMenuItem5 = new javax.swing.JMenuItem();
        aboutMenuItem5 = new javax.swing.JMenuItem();
        helpMenu6 = new javax.swing.JMenu();
        contentMenuItem6 = new javax.swing.JMenuItem();
        aboutMenuItem6 = new javax.swing.JMenuItem();
        aboutMenuItem11 = new javax.swing.JMenuItem();
        helpMenu7 = new javax.swing.JMenu();
        contentMenuItem7 = new javax.swing.JMenuItem();
        aboutMenuItem7 = new javax.swing.JMenuItem();
        jMenuItem1 = new javax.swing.JMenuItem();
        helpMenu9 = new javax.swing.JMenu();
        contentMenuItem9 = new javax.swing.JMenuItem();
        aboutMenuItem10 = new javax.swing.JMenuItem();
        helpMenu8 = new javax.swing.JMenu();
        contentMenuItem8 = new javax.swing.JMenuItem();
        aboutMenuItem8 = new javax.swing.JMenuItem();
        jMenuItem2 = new javax.swing.JMenuItem();
        jMenuItem3 = new javax.swing.JMenuItem();
        jMenuItem8 = new javax.swing.JMenuItem();
        jMenuItem12 = new javax.swing.JMenuItem();
        jMenuItem14 = new javax.swing.JMenuItem();
        jMenu1 = new javax.swing.JMenu();
        jMenuItem5 = new javax.swing.JMenuItem();
        jMenuItem4 = new javax.swing.JMenuItem();
        jMenu2 = new javax.swing.JMenu();
        jMenuItem6 = new javax.swing.JMenuItem();

        javax.swing.GroupLayout jFrame1Layout = new javax.swing.GroupLayout(jFrame1.getContentPane());
        jFrame1.getContentPane().setLayout(jFrame1Layout);
        jFrame1Layout.setHorizontalGroup(
            jFrame1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 400, Short.MAX_VALUE)
        );
        jFrame1Layout.setVerticalGroup(
            jFrame1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );

        jMenu3.setText("File");
        jMenuBar1.add(jMenu3);

        jMenu4.setText("Edit");
        jMenuBar1.add(jMenu4);

        jMenu5.setText("File");
        jMenuBar2.add(jMenu5);

        jMenu6.setText("Edit");
        jMenuBar2.add(jMenu6);

        javax.swing.GroupLayout jFrame2Layout = new javax.swing.GroupLayout(jFrame2.getContentPane());
        jFrame2.getContentPane().setLayout(jFrame2Layout);
        jFrame2Layout.setHorizontalGroup(
            jFrame2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 400, Short.MAX_VALUE)
        );
        jFrame2Layout.setVerticalGroup(
            jFrame2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );

        jMenuItem9.setText("jMenuItem9");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setExtendedState(1);
        setName("Formulario"); // NOI18N
        addHierarchyBoundsListener(new java.awt.event.HierarchyBoundsListener() {
            public void ancestorMoved(java.awt.event.HierarchyEvent evt) {
            }
            public void ancestorResized(java.awt.event.HierarchyEvent evt) {
                dddd(evt);
            }
        });
        addComponentListener(new java.awt.event.ComponentAdapter() {
            public void componentResized(java.awt.event.ComponentEvent evt) {
                formComponentResized(evt);
            }
        });

        desktopPane.setBackground(new java.awt.Color(240, 240, 240));
        desktopPane.setForeground(new java.awt.Color(102, 102, 255));
        desktopPane.setName("ertetetet"); // NOI18N

        jProgressBar2.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N

        desktopPane.setLayer(jProgressBar2, javax.swing.JLayeredPane.DEFAULT_LAYER);

        javax.swing.GroupLayout desktopPaneLayout = new javax.swing.GroupLayout(desktopPane);
        desktopPane.setLayout(desktopPaneLayout);
        desktopPaneLayout.setHorizontalGroup(
            desktopPaneLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jProgressBar2, javax.swing.GroupLayout.DEFAULT_SIZE, 1128, Short.MAX_VALUE)
        );
        desktopPaneLayout.setVerticalGroup(
            desktopPaneLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, desktopPaneLayout.createSequentialGroup()
                .addGap(0, 641, Short.MAX_VALUE)
                .addComponent(jProgressBar2, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        fileMenu.setMnemonic('f');
        fileMenu.setText("Sistema");
        fileMenu.setFont(new java.awt.Font("Segoe UI Historic", 1, 14)); // NOI18N
        fileMenu.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        fileMenu.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        fileMenu.setIconTextGap(0);
        fileMenu.setVerifyInputWhenFocusTarget(false);
        fileMenu.setVerticalAlignment(javax.swing.SwingConstants.BOTTOM);
        fileMenu.setVerticalTextPosition(javax.swing.SwingConstants.TOP);

        openMenuItem.setMnemonic('o');
        openMenuItem.setText("Configurar Sistema");
        openMenuItem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                openMenuItemActionPerformed(evt);
            }
        });
        fileMenu.add(openMenuItem);

        DatosEmpresa.setMnemonic('s');
        DatosEmpresa.setText("Datos Empresa");
        DatosEmpresa.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                DatosEmpresaActionPerformed(evt);
            }
        });
        fileMenu.add(DatosEmpresa);

        saveAsMenuItem.setMnemonic('a');
        saveAsMenuItem.setText("Save As ...");
        saveAsMenuItem.setDisplayedMnemonicIndex(5);
        fileMenu.add(saveAsMenuItem);

        exitMenuItem.setMnemonic('x');
        exitMenuItem.setText("Exit");
        exitMenuItem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                exitMenuItemActionPerformed(evt);
            }
        });
        fileMenu.add(exitMenuItem);

        menuBar.add(fileMenu);

        editMenu.setMnemonic('e');
        editMenu.setText("Usuarios");
        editMenu.setFont(new java.awt.Font("Segoe UI Historic", 1, 14)); // NOI18N

        cutMenuItem.setFont(new java.awt.Font("Segoe UI", 0, 16)); // NOI18N
        cutMenuItem.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/user/addUser.png"))); // NOI18N
        cutMenuItem.setMnemonic('t');
        cutMenuItem.setText("Nuevo");
        cutMenuItem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cutMenuItemActionPerformed(evt);
            }
        });
        editMenu.add(cutMenuItem);

        copyMenuItem.setFont(new java.awt.Font("Segoe UI", 0, 16)); // NOI18N
        copyMenuItem.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/user/listarUsers.png"))); // NOI18N
        copyMenuItem.setMnemonic('y');
        copyMenuItem.setText("Listar");
        copyMenuItem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                copyMenuItemActionPerformed(evt);
            }
        });
        editMenu.add(copyMenuItem);

        pasteMenuItem.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/user/tipoUsuaris.png"))); // NOI18N
        pasteMenuItem.setMnemonic('p');
        pasteMenuItem.setText("Nuevo Tipo");
        pasteMenuItem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                pasteMenuItemActionPerformed(evt);
            }
        });
        editMenu.add(pasteMenuItem);

        deleteMenuItem.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/user/listarTipoUsuarios.png"))); // NOI18N
        deleteMenuItem.setMnemonic('d');
        deleteMenuItem.setText("Listar Tipos");
        deleteMenuItem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                deleteMenuItemActionPerformed(evt);
            }
        });
        editMenu.add(deleteMenuItem);

        menuBar.add(editMenu);

        helpMenu.setMnemonic('h');
        helpMenu.setText("Ventas");
        helpMenu.setFont(new java.awt.Font("Segoe UI Historic", 1, 14)); // NOI18N

        contentMenuItem.setMnemonic('c');
        contentMenuItem.setText("Facturar");
        contentMenuItem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                contentMenuItemActionPerformed(evt);
            }
        });
        helpMenu.add(contentMenuItem);

        aboutMenuItem.setMnemonic('a');
        aboutMenuItem.setText("Lista Facturas");
        aboutMenuItem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                aboutMenuItemActionPerformed(evt);
            }
        });
        helpMenu.add(aboutMenuItem);

        jMenuItem7.setText("Formas Pago");
        jMenuItem7.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem7ActionPerformed(evt);
            }
        });
        helpMenu.add(jMenuItem7);

        jMenuItem13.setText("Nota Credito");
        jMenuItem13.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem13ActionPerformed(evt);
            }
        });
        helpMenu.add(jMenuItem13);

        menuBar.add(helpMenu);

        helpMenu1.setMnemonic('h');
        helpMenu1.setText("Productos");
        helpMenu1.setFont(new java.awt.Font("Segoe UI Historic", 1, 14)); // NOI18N

        NuevoProducto.setMnemonic('c');
        NuevoProducto.setText("Nuevo Pruducto");
        NuevoProducto.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                NuevoProductoActionPerformed(evt);
            }
        });
        helpMenu1.add(NuevoProducto);

        aboutMenuItem1.setMnemonic('a');
        aboutMenuItem1.setText("Buscar Producto");
        aboutMenuItem1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                aboutMenuItem1ActionPerformed(evt);
            }
        });
        helpMenu1.add(aboutMenuItem1);

        aboutMenuItem9.setMnemonic('a');
        aboutMenuItem9.setText("Bodegas");
        aboutMenuItem9.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                aboutMenuItem9ActionPerformed(evt);
            }
        });
        helpMenu1.add(aboutMenuItem9);

        jMenuItem10.setText("Nuevo PVP");
        jMenuItem10.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem10ActionPerformed(evt);
            }
        });
        helpMenu1.add(jMenuItem10);

        jMenuItem11.setText("Lista PVPs");
        helpMenu1.add(jMenuItem11);

        menuBar.add(helpMenu1);

        helpMenu2.setMnemonic('h');
        helpMenu2.setText("Proveedore");
        helpMenu2.setFont(new java.awt.Font("Segoe UI Historic", 1, 14)); // NOI18N

        contentMenuItem2.setMnemonic('c');
        contentMenuItem2.setText("Nuevo");
        contentMenuItem2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                contentMenuItem2ActionPerformed(evt);
            }
        });
        helpMenu2.add(contentMenuItem2);

        aboutMenuItem2.setMnemonic('a');
        aboutMenuItem2.setText("Listar");
        aboutMenuItem2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                aboutMenuItem2ActionPerformed(evt);
            }
        });
        helpMenu2.add(aboutMenuItem2);

        menuBar.add(helpMenu2);

        helpMenu3.setMnemonic('h');
        helpMenu3.setText("Clientes");
        helpMenu3.setFont(new java.awt.Font("Segoe UI Historic", 1, 14)); // NOI18N

        menNUevoCLiente.setMnemonic('c');
        menNUevoCLiente.setText("Nuevo Cliente");
        menNUevoCLiente.setToolTipText("");
        menNUevoCLiente.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menNUevoCLienteActionPerformed(evt);
            }
        });
        helpMenu3.add(menNUevoCLiente);

        aboutMenuItem3.setMnemonic('a');
        aboutMenuItem3.setText("Listar Clientes");
        aboutMenuItem3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                aboutMenuItem3ActionPerformed(evt);
            }
        });
        helpMenu3.add(aboutMenuItem3);

        menuBar.add(helpMenu3);

        helpMenu4.setMnemonic('h');
        helpMenu4.setText("CXC");
        helpMenu4.setFont(new java.awt.Font("Segoe UI Historic", 1, 14)); // NOI18N

        contentMenuItem4.setMnemonic('c');
        contentMenuItem4.setText("VER CXC");
        contentMenuItem4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                contentMenuItem4ActionPerformed(evt);
            }
        });
        helpMenu4.add(contentMenuItem4);

        aboutMenuItem4.setMnemonic('a');
        aboutMenuItem4.setText("FORMAS PAGO");
        aboutMenuItem4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                aboutMenuItem4ActionPerformed(evt);
            }
        });
        helpMenu4.add(aboutMenuItem4);

        menuBar.add(helpMenu4);

        helpMenu5.setMnemonic('h');
        helpMenu5.setText("CXP");
        helpMenu5.setFont(new java.awt.Font("Segoe UI Historic", 1, 14)); // NOI18N

        contentMenuItem5.setMnemonic('c');
        contentMenuItem5.setText("Contents");
        helpMenu5.add(contentMenuItem5);

        aboutMenuItem5.setMnemonic('a');
        aboutMenuItem5.setText("About");
        helpMenu5.add(aboutMenuItem5);

        menuBar.add(helpMenu5);

        helpMenu6.setMnemonic('h');
        helpMenu6.setText("Caja");
        helpMenu6.setFont(new java.awt.Font("Segoe UI Historic", 1, 14)); // NOI18N

        contentMenuItem6.setMnemonic('c');
        contentMenuItem6.setText("Ingreso de Caja");
        contentMenuItem6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                contentMenuItem6ActionPerformed(evt);
            }
        });
        helpMenu6.add(contentMenuItem6);

        aboutMenuItem6.setMnemonic('a');
        aboutMenuItem6.setText("Egreso de Caja");
        aboutMenuItem6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                aboutMenuItem6ActionPerformed(evt);
            }
        });
        helpMenu6.add(aboutMenuItem6);

        aboutMenuItem11.setMnemonic('a');
        aboutMenuItem11.setText("Cuadrar Caja");
        aboutMenuItem11.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                aboutMenuItem11ActionPerformed(evt);
            }
        });
        helpMenu6.add(aboutMenuItem11);

        menuBar.add(helpMenu6);

        helpMenu7.setMnemonic('h');
        helpMenu7.setText("Compras");
        helpMenu7.setFont(new java.awt.Font("Segoe UI Historic", 1, 14)); // NOI18N

        contentMenuItem7.setMnemonic('c');
        contentMenuItem7.setText("Registrar");
        contentMenuItem7.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                contentMenuItem7ActionPerformed(evt);
            }
        });
        helpMenu7.add(contentMenuItem7);

        aboutMenuItem7.setMnemonic('a');
        aboutMenuItem7.setText("Retencion");
        aboutMenuItem7.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                aboutMenuItem7ActionPerformed(evt);
            }
        });
        helpMenu7.add(aboutMenuItem7);

        jMenuItem1.setText("Formas Pago");
        jMenuItem1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem1ActionPerformed(evt);
            }
        });
        helpMenu7.add(jMenuItem1);

        menuBar.add(helpMenu7);

        helpMenu9.setMnemonic('h');
        helpMenu9.setText("Contabilidad");
        helpMenu9.setFont(new java.awt.Font("Segoe UI Historic", 1, 14)); // NOI18N

        contentMenuItem9.setMnemonic('c');
        contentMenuItem9.setText("Pla de Cuentas");
        contentMenuItem9.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                contentMenuItem9ActionPerformed(evt);
            }
        });
        helpMenu9.add(contentMenuItem9);

        aboutMenuItem10.setMnemonic('a');
        aboutMenuItem10.setText("Envios Electronicos");
        aboutMenuItem10.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                aboutMenuItem10ActionPerformed(evt);
            }
        });
        helpMenu9.add(aboutMenuItem10);

        menuBar.add(helpMenu9);

        helpMenu8.setMnemonic('h');
        helpMenu8.setText("Utilidades");
        helpMenu8.setFont(new java.awt.Font("Segoe UI Historic", 1, 14)); // NOI18N

        contentMenuItem8.setMnemonic('c');
        contentMenuItem8.setText("ImprtarProductos");
        contentMenuItem8.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                contentMenuItem8ActionPerformed(evt);
            }
        });
        helpMenu8.add(contentMenuItem8);

        aboutMenuItem8.setMnemonic('a');
        aboutMenuItem8.setText("Envios Electronicos");
        aboutMenuItem8.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                aboutMenuItem8ActionPerformed(evt);
            }
        });
        helpMenu8.add(aboutMenuItem8);

        jMenuItem2.setText("Importar Clientes");
        jMenuItem2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem2ActionPerformed(evt);
            }
        });
        helpMenu8.add(jMenuItem2);

        jMenuItem3.setText("Nuevo Aparato");
        helpMenu8.add(jMenuItem3);

        jMenuItem8.setText("Backup BseDatos");
        jMenuItem8.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem8ActionPerformed(evt);
            }
        });
        helpMenu8.add(jMenuItem8);

        jMenuItem12.setText("Doc Recbidos SRI");
        jMenuItem12.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem12ActionPerformed(evt);
            }
        });
        helpMenu8.add(jMenuItem12);

        jMenuItem14.setText("Doc Emitidos SRI");
        jMenuItem14.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem14ActionPerformed(evt);
            }
        });
        helpMenu8.add(jMenuItem14);

        menuBar.add(helpMenu8);

        jMenu1.setText("Sat");
        jMenu1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenu1ActionPerformed(evt);
            }
        });

        jMenuItem5.setText("Nuevo Aparato");
        jMenuItem5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem5ActionPerformed(evt);
            }
        });
        jMenu1.add(jMenuItem5);

        jMenuItem4.setText("Orden de Trabajo");
        jMenuItem4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem4ActionPerformed(evt);
            }
        });
        jMenu1.add(jMenuItem4);

        menuBar.add(jMenu1);

        jMenu2.setText("Actualizar");
        jMenu2.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jMenu2MouseClicked(evt);
            }
        });

        jMenuItem6.setText("ACTULIZAR");
        jMenuItem6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem6ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem6);

        menuBar.add(jMenu2);

        setJMenuBar(menuBar);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(desktopPane)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(desktopPane)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void exitMenuItemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_exitMenuItemActionPerformed
        System.exit(0);
    }//GEN-LAST:event_exitMenuItemActionPerformed

    private void cutMenuItemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cutMenuItemActionPerformed
        // TODO add your handling code here:
        Crear_Usuarios obj = new Crear_Usuarios();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), false);
    }//GEN-LAST:event_cutMenuItemActionPerformed


    private void copyMenuItemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_copyMenuItemActionPerformed
        // TODO add your handling code here:
        //Buscar_usuarios obj = new Buscar_usuarios();
        Modal_BucarUsuarios obj = new Modal_BucarUsuarios();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);

    }//GEN-LAST:event_copyMenuItemActionPerformed

    private void pasteMenuItemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_pasteMenuItemActionPerformed
        // TODO add your handling code here:
        Crear_Tipo_Usuarios obj = new Crear_Tipo_Usuarios();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), false);

    }//GEN-LAST:event_pasteMenuItemActionPerformed

    private void deleteMenuItemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_deleteMenuItemActionPerformed
        // TODO add your handling code here

        Buscar_Tipos obj = new Buscar_Tipos();
        
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);

    }//GEN-LAST:event_deleteMenuItemActionPerformed

    private void menNUevoCLienteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menNUevoCLienteActionPerformed
        // TODO add your handling code here:

        Crear_Clientes obj = new Crear_Clientes();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), false);

    }//GEN-LAST:event_menNUevoCLienteActionPerformed

    private void aboutMenuItem3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_aboutMenuItem3ActionPerformed
        // TODO add your handling code here:
        Modal_buscarCilentes obj = new Modal_buscarCilentes();
        obj.setTitle("Buscar CLientes");
        Principal.isllamadoDesdeProveedorOCliente= false;
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);
    }//GEN-LAST:event_aboutMenuItem3ActionPerformed

    private void NuevoProductoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_NuevoProductoActionPerformed
        // TODO add your handling code here:
        Crear_Productos obj = new Crear_Productos();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), false);

    }//GEN-LAST:event_NuevoProductoActionPerformed

    private void aboutMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_aboutMenuItem1ActionPerformed
        // TODO add your handling code here:
        Buscar_Productos obj = new Buscar_Productos();
        
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);


    }//GEN-LAST:event_aboutMenuItem1ActionPerformed

    private void contentMenuItemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_contentMenuItemActionPerformed

        //        Crear_Facturas obj = new Crear_Facturas();
//        desktopPane.add(obj);
//        obj.setVisible(true);
//        JButton a = new JButton("Facturacion");
        Modal_CrearFacturas obj = new Modal_CrearFacturas();
        obj.setTitle(OperacionesForms._TITLE_FORM_FACTURA);
        this.tananoVentanas(obj);
        desktopPane.add(obj);
        obj.setVisible(true);
    }//GEN-LAST:event_contentMenuItemActionPerformed

    public static void tananoVentanas(JInternalFrame obj) {

        Integer desplazamientohaciaabajo = 10;
        Principal.X = Principal.desktopPane.getBounds().x;
        Principal.Y = Principal.desktopPane.getBounds().y;
        Principal.X2 = Principal.desktopPane.getBounds().width; ///anchura
        Principal.Y2 = Principal.desktopPane.getBounds().height; ///altura
        Principal.desktopPane.setBounds(X, Y, X2, Y2);
    //    Principal.jDesktopPane1.setBounds(X, Y, X2, 75);
        obj.setSize(new Dimension(Principal.X2, Principal.Y2 - (Principal.jProgressBar2.getSize().height)));

//        if (controlareduccionPrincilapParamenusuperior < 2) {
//
//            if (controlareduccionPrincilapParamenusuperior == 1) {
//                ///////////pongo tamano y ubicacion a botonsuperiro
//                NumerodeBotonesAbiertos++;
//                BotonSuperior b = new BotonSuperior();
//                b.setSize(new Dimension(200, 31));
//                b.setTitle(obj.getTitle() + NumerodeBotonesAbiertos);
//                b.setEnabled(false);
//                Principal.desktopPane.add(b);
//                b.setVisible(true);
//                
//            }
//            System.out.println("Vista.Principal.tananoVentanas()xxxxxxxxxxxxxxxxxxxasasas{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}}");
//            obj.setBounds(X - 5, Y + 15, X2, Y2);
//            obj.setSize(new Dimension(Principal.X2, Principal.Y2 - (Principal.jProgressBar2.getSize().height + 20)));
//            controlareduccionPrincilapParamenusuperior = controlareduccionPrincilapParamenusuperior + 1;
//
//        }

    }
    private void openMenuItemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_openMenuItemActionPerformed
        // TODO add your handling code here:

        Configuracion obj = new Configuracion();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);


    }//GEN-LAST:event_openMenuItemActionPerformed

    private void DatosEmpresaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_DatosEmpresaActionPerformed
        // TODO add your handling code here:
        DatosEmpresaForm obj = new DatosEmpresaForm();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);
    }//GEN-LAST:event_DatosEmpresaActionPerformed

    private void aboutMenuItemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_aboutMenuItemActionPerformed
        // TODO add your handling code here:

        BuscarFacturas obj = new BuscarFacturas();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);


    }//GEN-LAST:event_aboutMenuItemActionPerformed

    private void contentMenuItem8ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_contentMenuItem8ActionPerformed
        // TODO add your handling code here:
        ImprtarInventario obj = new ImprtarInventario();// = new ImprtarInventario();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);

    }//GEN-LAST:event_contentMenuItem8ActionPerformed

    private void aboutMenuItem9ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_aboutMenuItem9ActionPerformed
        // TODO add your handling code here:
        CrearBodegas obj = new CrearBodegas();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);

    }//GEN-LAST:event_aboutMenuItem9ActionPerformed

    private void contentMenuItem6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_contentMenuItem6ActionPerformed
        // TODO add your handling code here:
        IngresoCaja obj = new IngresoCaja();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);


    }//GEN-LAST:event_contentMenuItem6ActionPerformed

    private void aboutMenuItem8ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_aboutMenuItem8ActionPerformed
        // TODO add your handling code here:

        Buscar_electronicas obj = new Buscar_electronicas();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);

    }//GEN-LAST:event_aboutMenuItem8ActionPerformed

    private void aboutMenuItem6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_aboutMenuItem6ActionPerformed
        // TODO add your handling code here:

        EgresoCaja obj = new EgresoCaja();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);


    }//GEN-LAST:event_aboutMenuItem6ActionPerformed

    private void contentMenuItem2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_contentMenuItem2ActionPerformed
//        // TODO add your handling code here:

        Crear_Clientes obj = new Crear_Clientes();
        obj.setTitle("Nuevo Proveedor");
        ///false valor por defeccto, para cleintes
        obj.isllamadoDesdeNuevoProveedor = true;
        
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);

    }//GEN-LAST:event_contentMenuItem2ActionPerformed

    private void aboutMenuItem2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_aboutMenuItem2ActionPerformed
        // TODO add your handling code here:
        //Modal_buscarProveedores obj = new Modal_buscarProveedores();
        Modal_buscarCilentes obj = new Modal_buscarCilentes();
        obj.setTitle("Buscar Proveedores");
         Principal.isllamadoDesdeProveedorOCliente= true;
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);


    }//GEN-LAST:event_aboutMenuItem2ActionPerformed

    private void contentMenuItem9ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_contentMenuItem9ActionPerformed
        // TODO add your handling code here:
        PLANC obj = new PLANC();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);

    }//GEN-LAST:event_contentMenuItem9ActionPerformed

    private void aboutMenuItem10ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_aboutMenuItem10ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_aboutMenuItem10ActionPerformed

    private void contentMenuItem7ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_contentMenuItem7ActionPerformed
        // TODO add your handling code here:
       // Crear_Compras obj = new Crear_Compras();
       Modal_Crear_compras obj = new Modal_Crear_compras();
         OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);

    }//GEN-LAST:event_contentMenuItem7ActionPerformed

    private void aboutMenuItem7ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_aboutMenuItem7ActionPerformed
        // TODO add your handling code here:

        Crear_RetencionC obj = new Crear_RetencionC();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), false);

    }//GEN-LAST:event_aboutMenuItem7ActionPerformed

    private void jMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem1ActionPerformed
        // TODO add your handling code here:
        BuscarCompras obj = new BuscarCompras();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);

    }//GEN-LAST:event_jMenuItem1ActionPerformed

    private void jMenuItem2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem2ActionPerformed
        // TODO add your handling code here:

    }//GEN-LAST:event_jMenuItem2ActionPerformed

    private void jMenu1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenu1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jMenu1ActionPerformed

    private void jMenuItem4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem4ActionPerformed
        // TODO add your handling code here:
        Crear_Orden obj = new Crear_Orden();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);

    }//GEN-LAST:event_jMenuItem4ActionPerformed

    private void jMenuItem5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem5ActionPerformed
        // TODO add your handling code here:
        Crear_Aparato obj = new Crear_Aparato();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);

    }//GEN-LAST:event_jMenuItem5ActionPerformed

    private void aboutMenuItem11ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_aboutMenuItem11ActionPerformed
        // TODO add your handling code here:
        CuadrarCaja obj = new CuadrarCaja();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);


    }//GEN-LAST:event_aboutMenuItem11ActionPerformed

    private void jMenu2MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jMenu2MouseClicked
        // TODO add your handling code here:

    }//GEN-LAST:event_jMenu2MouseClicked

    private void contentMenuItem4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_contentMenuItem4ActionPerformed
        // TODO add your handling code here:
        Buscar_cxc obj = new Buscar_cxc();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);

    }//GEN-LAST:event_contentMenuItem4ActionPerformed

    private void jMenuItem6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem6ActionPerformed
        String[] sentencias
                = {
                    "CREATE TABLE `config_asientos` (\n"
                    + "`codigo` INT(11) NOT NULL AUTO_INCREMENT,  \n"
                    + "`config` VARCHAR(200) DEFAULT NULL,        \n"
                    + "`valor` VARCHAR(500) DEFAULT NULL,         \n"
                    + "PRIMARY KEY (`codigo`)                     \n"
                    + ") ENGINE=INNODB DEFAULT CHARSET=latin1       "
                };
        for (int i = 0; i < sentencias.length; i++) {
            String sql = sentencias[i];
            updataesBDD update = new updataesBDD();
            update.execSql(sql);
        }
        //udate dede la nube
        Update u = new Update();
        u.updatenow();

    }//GEN-LAST:event_jMenuItem6ActionPerformed

    private void jMenuItem7ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem7ActionPerformed
//        NuevaFormaPago obj = new NuevaFormaPago();
//        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), false);

    }//GEN-LAST:event_jMenuItem7ActionPerformed

    private void aboutMenuItem4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_aboutMenuItem4ActionPerformed
        // TODO add your handling code here:

        NuevaFormaPago obj = new NuevaFormaPago();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), false);

    }//GEN-LAST:event_aboutMenuItem4ActionPerformed

    private void dddd(java.awt.event.HierarchyEvent evt) {//GEN-FIRST:event_dddd
        // TODO add your handling code here:
        //this.tananoVentanas(obj);
    }//GEN-LAST:event_dddd

    private void formComponentResized(java.awt.event.ComponentEvent evt) {//GEN-FIRST:event_formComponentResized
        // TODO add your handling code here:
//        this.tananoVentanas(obj);
////        Integer desplazamientohaciaabajo = 10;
////        Integer xx = this.getBounds().x;
////        Integer yy = this.getBounds().y;
////        Integer xx2 = this.getBounds().width; ///anchura
////        Integer yy2 = this.getBounds().height; ///altura
////        System.out.println("Vista.Principal.formComponentResized()fffffffffffffff");
////// obj.setSize(new Dimension(xx2, yy2 - 10);
////       
////        if (controlareduccionPrincilapParamenusuperior == 0) {
////            this.setSize(new Dimension(xx2, yy2 - 10));
////            controlareduccionPrincilapParamenusuperior = 1;
////        }

        //this.setMaximizedBounds(X);

    }//GEN-LAST:event_formComponentResized

    private void jMenuItem8ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem8ActionPerformed
        // TODO add your handling code here:
        Crear_Backup obj = new Crear_Backup();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);

    }//GEN-LAST:event_jMenuItem8ActionPerformed

    private void jMenuItem10ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem10ActionPerformed
        // TODO add your handling code here:
        Modal_Crear_Pvps obj = new Modal_Crear_Pvps();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), false);
    }//GEN-LAST:event_jMenuItem10ActionPerformed

    private void jMenuItem12ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem12ActionPerformed
        // TODO add your handling code here:
                DesgargarDocumentosElectronicosSRI obj = new DesgargarDocumentosElectronicosSRI();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);
    }//GEN-LAST:event_jMenuItem12ActionPerformed

    private void jMenuItem13ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem13ActionPerformed
        // TODO add your handling code here:
Modal_CrearNotaCredito obj = new Modal_CrearNotaCredito();
obj.setTitle(OperacionesForms._TITLE_FORM_NOTA_CREDITO);
OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);        
    }//GEN-LAST:event_jMenuItem13ActionPerformed

    private void jMenuItem14ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem14ActionPerformed
        // TODO add your handling code here:
                  DesgargarDocumentosElectronicosEMITIDOSSRI obj = new DesgargarDocumentosElectronicosEMITIDOSSRI();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);
    }//GEN-LAST:event_jMenuItem14ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        try {
            /* Set the Nimbus look and feel */
            //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
            /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
            * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html
             */
            //UIManager.setLookAndFeel("javax.swing.plaf.metal.MetalLookAndFeel");
            UIManager.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");

//        try {
//            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
//                if ("Nimbus".equals(info.getName())) {
//                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
//                    break;
//                }
//            }
//        } catch (ClassNotFoundException ex) {
//            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (InstantiationException ex) {
//            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (IllegalAccessException ex) {
//            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
//            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        }
//</editor-fold>
//</editor-fold>
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
        } catch (UnsupportedLookAndFeelException ex) {
            Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
        }

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Principal().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JMenuItem DatosEmpresa;
    private javax.swing.JMenuItem NuevoProducto;
    private javax.swing.JMenuItem aboutMenuItem;
    private javax.swing.JMenuItem aboutMenuItem1;
    private javax.swing.JMenuItem aboutMenuItem10;
    private javax.swing.JMenuItem aboutMenuItem11;
    private javax.swing.JMenuItem aboutMenuItem2;
    private javax.swing.JMenuItem aboutMenuItem3;
    private javax.swing.JMenuItem aboutMenuItem4;
    private javax.swing.JMenuItem aboutMenuItem5;
    private javax.swing.JMenuItem aboutMenuItem6;
    private javax.swing.JMenuItem aboutMenuItem7;
    private javax.swing.JMenuItem aboutMenuItem8;
    private javax.swing.JMenuItem aboutMenuItem9;
    private javax.swing.JMenuItem contentMenuItem;
    private javax.swing.JMenuItem contentMenuItem2;
    private javax.swing.JMenuItem contentMenuItem4;
    private javax.swing.JMenuItem contentMenuItem5;
    private javax.swing.JMenuItem contentMenuItem6;
    private javax.swing.JMenuItem contentMenuItem7;
    private javax.swing.JMenuItem contentMenuItem8;
    private javax.swing.JMenuItem contentMenuItem9;
    private javax.swing.JMenuItem copyMenuItem;
    private javax.swing.JMenuItem cutMenuItem;
    private javax.swing.JMenuItem deleteMenuItem;
    public static javax.swing.JDesktopPane desktopPane;
    private javax.swing.JMenu editMenu;
    private javax.swing.JMenuItem exitMenuItem;
    private javax.swing.JMenu fileMenu;
    private javax.swing.JMenu helpMenu;
    private javax.swing.JMenu helpMenu1;
    private javax.swing.JMenu helpMenu2;
    private javax.swing.JMenu helpMenu3;
    private javax.swing.JMenu helpMenu4;
    private javax.swing.JMenu helpMenu5;
    private javax.swing.JMenu helpMenu6;
    private javax.swing.JMenu helpMenu7;
    private javax.swing.JMenu helpMenu8;
    private javax.swing.JMenu helpMenu9;
    private javax.swing.JFrame jFrame1;
    private javax.swing.JFrame jFrame2;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenu jMenu2;
    private javax.swing.JMenu jMenu3;
    private javax.swing.JMenu jMenu4;
    private javax.swing.JMenu jMenu5;
    private javax.swing.JMenu jMenu6;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuBar jMenuBar2;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem jMenuItem10;
    private javax.swing.JMenuItem jMenuItem11;
    private javax.swing.JMenuItem jMenuItem12;
    private javax.swing.JMenuItem jMenuItem13;
    private javax.swing.JMenuItem jMenuItem14;
    private javax.swing.JMenuItem jMenuItem2;
    private javax.swing.JMenuItem jMenuItem3;
    private javax.swing.JMenuItem jMenuItem4;
    private javax.swing.JMenuItem jMenuItem5;
    private javax.swing.JMenuItem jMenuItem6;
    private javax.swing.JMenuItem jMenuItem7;
    private javax.swing.JMenuItem jMenuItem8;
    private javax.swing.JMenuItem jMenuItem9;
    public static javax.swing.JProgressBar jProgressBar2;
    private javax.swing.JMenuItem menNUevoCLiente;
    public static javax.swing.JMenuBar menuBar;
    private javax.swing.JMenuItem openMenuItem;
    private javax.swing.JMenuItem pasteMenuItem;
    private javax.swing.JMenuItem saveAsMenuItem;
    // End of variables declaration//GEN-END:variables

}
