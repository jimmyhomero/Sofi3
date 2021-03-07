/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista;

import Controlador.Usuarios.ConfigDao;
import ClasesAuxiliares.debug.Deb;
import Controlador.Usuarios.Config_EquiposDao;
import Controlador.Usuarios.Config_UsuariosDao;
import Modelo.CajasDetalle;
import Modelo.Clientes;
import Modelo.ConfigSofia;
import Modelo.Config_Equipos;
import Modelo.Config_Usuarios;
import Modelo.DetalleFactura;
import Modelo.Facturas;
import Modelo.FormasPagoV;
import Modelo.Kardex;
import Modelo.Usuarios;
import Vlidaciones.ProgressBar;
import com.mxrck.autocompleter.TextAutoCompleter;
import ecx.unomas.factura.Factura;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.Locale;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;
import login.login;
import static login.login.CodigoTipoUsuario;
import static login.login.CodigoUsuario;

/**
 *
 * @author USUARIO
 */

public class jc extends javax.swing.JFrame {

    /**
     * Creates new form jc
     */
    
    /////////////////
    
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

    ///////////
    public static Integer codigoTipoUsuario;
    public static Integer X;
    public static Integer Y;
    public static Integer X2;
    public static Integer Y2;

    public jc() {

        initComponents();
        this.setExtendedState(this.MAXIMIZED_BOTH);

        menu();
        //calseframe c = new calseframe();
        calseframe c = new calseframe();
        desktopPane.add(c);
        c.setVisible(true);

        Deb.consola("tamaño :" + desktopPane.getSize().toString());
        Deb.consola("tamaño :" + desktopPane.getBounds());
        X = desktopPane.getBounds().x;
        Y = desktopPane.getBounds().y;
        X2 = desktopPane.getBounds().width;
        Y2 = desktopPane.getBounds().height;
        Deb.consola("jDESKTOPINTD; " + X + "-" + Y + "-" + X2 + "-" + Y2);
        

    }

    public void menu() {
        ArrayList<JMenu> listaMenus = new ArrayList<JMenu>();
        JMenuBar menux = new JMenuBar();
        menuDao menudao = new menuDao();
        listaMenus = menudao.listar(login.CodigoTipoUsuario);

        for (JMenu menu : listaMenus) {

            menux.add(menu);

        }

        setJMenuBar(menux);

        for (JMenu menu : listaMenus) {
            if (menu.getName().equals("CXC")) {
                Deb.consola("Vista.jc.menu()");
                calseframe c = new calseframe();
                desktopPane.add(c);
                c.setVisible(true);
            }

        }

//        JMenuBar menu = new JMenuBar();
//        JMenu compras = new JMenu();
//        compras.setText("compras");
//        JMenuItem nuevaCompra = new JMenuItem();
//        nuevaCompra.setText("nuevo");
//        nuevaCompra.addActionListener(new java.awt.event.ActionListener() {
//            public void actionPerformed(java.awt.event.ActionEvent evt) {
//                nuevaCompra(evt);
//            }
//        });
//        
//        JMenuItem listaCompras = new JMenuItem();
//        listaCompras.setText("Lista");
//        listaCompras.addActionListener(new ActionListener() {
//            @Override
//            public void actionPerformed(ActionEvent e) {
//                listaCompras(e);
//            }
//        });
//        compras.add(nuevaCompra);
//        compras.add(listaCompras);
//        menu.add(compras);
//        /////////////////////////////////////////  
//        JMenu ventas = new JMenu();
//        ventas.setText("ventas");
//        JMenuItem nuevaVenta = new JMenuItem();
//        nuevaVenta.setText("nuevo");
//        nuevaVenta.addActionListener(new ActionListener() {
//            @Override
//            public void actionPerformed(ActionEvent e) {
//                nuevaVenta(e);
//            }
//        });
//        JMenuItem listaVenta = new JMenuItem();
//        listaVenta.setText("Lista");
//        listaVenta.addActionListener(new ActionListener() {
//            @Override
//            public void actionPerformed(ActionEvent e) {
//                listaVentas(e);
//            }
//        });
//        ventas.add(nuevaVenta);
//        ventas.add(listaVenta);
//        menu.add(ventas);
//        setJMenuBar(menu);
    }

    private void nuevaCompra(java.awt.event.ActionEvent evt) {

    }

    private void nuevaVenta(java.awt.event.ActionEvent evt) {

    }

    private void listaCompras(java.awt.event.ActionEvent evt) {

    }

    private void listaVentas(java.awt.event.ActionEvent evt) {

    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        desktopPane = new javax.swing.JDesktopPane();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setExtendedState(1);

        desktopPane.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                desktopPaneMouseClicked(evt);
            }
        });

        javax.swing.GroupLayout desktopPaneLayout = new javax.swing.GroupLayout(desktopPane);
        desktopPane.setLayout(desktopPaneLayout);
        desktopPaneLayout.setHorizontalGroup(
            desktopPaneLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 1081, Short.MAX_VALUE)
        );
        desktopPaneLayout.setVerticalGroup(
            desktopPaneLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 694, Short.MAX_VALUE)
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(desktopPane)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(26, 26, 26)
                .addComponent(desktopPane)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void desktopPaneMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_desktopPaneMouseClicked
        // TODO add your handling code here:

        //jDesktopPane1.setBounds(6, 26, 1081, 694);
        // pack();

    }//GEN-LAST:event_desktopPaneMouseClicked

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(jc.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(jc.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(jc.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(jc.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new jc().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    public static javax.swing.JDesktopPane desktopPane;
    // End of variables declaration//GEN-END:variables
}
