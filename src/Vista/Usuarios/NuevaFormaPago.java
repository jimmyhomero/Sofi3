/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista.Usuarios;

import ClasesAuxiliares.KeysEnventos;
import ClasesAuxiliares.NewSql.Forms.OperacionesForms;
import ClasesAuxiliares.Variables;
import ClasesAuxiliares.debug.Deb;
import Controlador.Usuarios.FormasPagoCVDao;
import Controlador.Usuarios.PreciosDao;
import Controlador.Usuarios.SriFormaPagoDao;
import Modelo.FormasPagoCV;
import Modelo.Precios;
import Modelo.SriFormaPago;
import Vista.Principal;
import Vista.alertas.alerta;
import Vlidaciones.ProgressBar;
import Vlidaciones.ValidaNUmeros;
import com.sun.tools.xjc.gen.Op;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.event.KeyEvent;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.swing.JOptionPane;
//import static login.login.__factory;

/**
 *
 * @author USUARIO
 */
public class NuevaFormaPago extends javax.swing.JInternalFrame {

    /**
     * Creates new form NuevaFormaPago
     */
    boolean _FormaPagoSelected = false;
    String _tipo_forma_pago = "";
    boolean _afectaaCaja = false;
    Integer _idCuenta_contable = -1;
    String esEnComprasoEnVentas = "";
    boolean _pvpaUsarselected = false;
    boolean _peridoCobranzaselected = false;
    boolean _sustentoTributarioSelected = false;
    public static String comprasoVentas="";

    private List<SriFormaPago> listaFormasPagoSri = new ArrayList();
    private ArrayList<Precios> listaPrecios = new ArrayList();
    Dimension dimensiooOriginal = new Dimension();
    Dimension dimensiooCredito = new Dimension();
    Dimension dimensionJCBTipopvpv = new Dimension();
    Dimension dimensionlabelTipopvpv = new Dimension();
    Dimension dimensioncero = new Dimension();
    Precios precioseleccionado = new Precios();
    SriFormaPago sriformaPagoSeleccionada = new SriFormaPago();

    public NuevaFormaPago(){
        initComponents();        
        /////////////INICIALIZAR JTEXFIELD Y jTEXTaREA
        OperacionesForms.inicializarJtextFieldMyusculas(jTextArea1);
        OperacionesForms.inicializarJtextFieldMyusculas(txt_nombreFormaPago);

        /////////INICIALIZA COMBOCBOX
        OperacionesForms.Inicializar_Combobox_Seleccione(jcb_tipoPVPUsar);
        OperacionesForms.Inicializar_Combobox_Seleccione(jcb_cobranza);
        OperacionesForms.Inicializar_Combobox_Seleccione(jcb_formaPago);
        OperacionesForms.Inicializar_Combobox_Seleccione(jcb_sustentoTributario);
        jcb_formaPago.addItem(OperacionesForms._EFECTIVO_TEXT);
        jcb_formaPago.addItem(OperacionesForms._CREDITO_TEXT);
        jcb_formaPago.addItem(OperacionesForms._PLAN_ACUMULATIVO_TEXT);        
        jcb_formaPago.addItem(OperacionesForms._CHEQUE_TEXT);
        OperacionesForms.Inicializar_Combobox_TamanoCero(jcb_tipoPVPUsar);
        OperacionesForms.inicializadPeriodosCObranza(jcb_cobranza);
        
////////////tamanos
        dimensiooCredito.setSize(1153, 304);
        dimensiooOriginal.setSize(948, 304);
        dimensionJCBTipopvpv.setSize(165, 26);
        dimensionlabelTipopvpv.setSize(119, 16);

///////////////formas de pago SRI
        SriFormaPago obj = new SriFormaPago();
        SriFormaPagoDao objDao = new SriFormaPagoDao();
        listaFormasPagoSri = new ArrayList<>();
        listaFormasPagoSri = objDao.listar();
        Deb.consola(listaFormasPagoSri.toString());
        for (SriFormaPago f : listaFormasPagoSri) {
            jcb_sustentoTributario.addItem(f.getId() + " - " + f.getFormaPago());
        }

///////////////////fin formas de pago sri
////////////////////tipo de PVP a usar
        PreciosDao precioDao = new PreciosDao();
        listaPrecios = precioDao.listar();
        for (Precios pre : listaPrecios) {
            jcb_tipoPVPUsar.addItem(pre.getNombre());
        }
////////////////////FIN tipo de PVP a usar
        Deb.consola(this.getSize().toString());

        this.setSize(dimensiooOriginal);

        Deb.consola(jcb_tipoPVPUsar.getPreferredSize().toString() + "   -jcbx1");
        Deb.consola(jLabel7.getPreferredSize().toString() + "   -jcbx1");

        Deb.consola("SELECTED ITEM: " + jcb_tipoPVPUsar.getSelectedItem().toString());
          Deb.consola("SELECTED ITEMxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxaSDDDDDDDDDDDDDDDDDDDD: "+this.getTitle());
        if(this.getTitle().equalsIgnoreCase(OperacionesForms._FORMA_PAGO_CXP_TEXT)){
              
        jcb_tipoPVPUsar.setVisible(false);
        }
    }

    ////////////////////encerarVaraibles
    private void encerarVariables() {
        _FormaPagoSelected = false;
        _tipo_forma_pago = "";
        _afectaaCaja = false;
        _idCuenta_contable = -1;
        esEnComprasoEnVentas = "";
        _pvpaUsarselected = false;
        _sustentoTributarioSelected = false;
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
        jPanel1 = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        jPanel7 = new javax.swing.JPanel();
        txt_cuotas = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        txt_entrada = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        jcb_cobranza = new javax.swing.JComboBox<>();
        jLabel6 = new javax.swing.JLabel();
        txt_diasCredito = new javax.swing.JTextField();
        jPanel8 = new javax.swing.JPanel();
        jcb_tipoPVPUsar = new javax.swing.JComboBox<>();
        jLabel7 = new javax.swing.JLabel();
        jrb_afectaCaja = new javax.swing.JRadioButton();
        jcb_formaPago = new javax.swing.JComboBox<>();
        jPanel6 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTextArea1 = new javax.swing.JTextArea();
        jLabel8 = new javax.swing.JLabel();
        jPanel9 = new javax.swing.JPanel();
        jButton1 = new javax.swing.JButton();
        txt_nombreFormaPago = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        jPanel3 = new javax.swing.JPanel();
        jPanel11 = new javax.swing.JPanel();
        jcb_sustentoTributario = new javax.swing.JComboBox<>();
        jPanel12 = new javax.swing.JPanel();
        jButton3 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jComboBox1 = new javax.swing.JComboBox<>();
        jLabel9 = new javax.swing.JLabel();

        setClosable(true);
        setResizable(true);
        setTitle("Nueva Forma Pago CXC");
        addComponentListener(new java.awt.event.ComponentAdapter() {
            public void componentResized(java.awt.event.ComponentEvent evt) {
                formComponentResized(evt);
            }
        });

        jPanel2.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        jPanel7.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        txt_cuotas.setText("1");
        txt_cuotas.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_cuotasActionPerformed(evt);
            }
        });
        txt_cuotas.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_cuotasKeyReleased(evt);
            }
        });

        jLabel2.setText("# CUOTAS");

        jLabel4.setText("% ENTRADA");

        txt_entrada.setText("0");
        txt_entrada.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_entradaKeyReleased(evt);
            }
        });

        jLabel5.setText("COBRANZA");

        jcb_cobranza.setBackground(new java.awt.Color(204, 255, 204));
        jcb_cobranza.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECCIONE", "DIARIO", "SEMANAL", "QUINCENAL", "MENSUAL" }));
        jcb_cobranza.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jcb_cobranzaItemStateChanged(evt);
            }
        });

        jLabel6.setText("DIAS DE CREDITO");

        txt_diasCredito.setText("30");

        javax.swing.GroupLayout jPanel7Layout = new javax.swing.GroupLayout(jPanel7);
        jPanel7.setLayout(jPanel7Layout);
        jPanel7Layout.setHorizontalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel7Layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addGroup(jPanel7Layout.createSequentialGroup()
                                .addComponent(jLabel5)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jcb_cobranza, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel7Layout.createSequentialGroup()
                                .addComponent(jLabel2)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(txt_cuotas))
                            .addGroup(jPanel7Layout.createSequentialGroup()
                                .addComponent(jLabel4)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(txt_entrada, javax.swing.GroupLayout.PREFERRED_SIZE, 92, javax.swing.GroupLayout.PREFERRED_SIZE))))
                    .addGroup(jPanel7Layout.createSequentialGroup()
                        .addComponent(jLabel6)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(txt_diasCredito)))
                .addContainerGap())
        );
        jPanel7Layout.setVerticalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addGap(0, 0, 0)
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txt_cuotas, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2))
                .addGap(18, 18, 18)
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(txt_entrada, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(jcb_cobranza, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6)
                    .addComponent(txt_diasCredito, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel8.setBorder(javax.swing.BorderFactory.createTitledBorder("Opciones en Formas de Pago"));

        jcb_tipoPVPUsar.setBackground(new java.awt.Color(153, 255, 0));
        jcb_tipoPVPUsar.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECCIONE" }));
        jcb_tipoPVPUsar.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jcb_tipoPVPUsarItemStateChanged(evt);
            }
        });

        jLabel7.setBackground(new java.awt.Color(255, 153, 153));
        jLabel7.setText("TIPO DE PVP A USAR");

        jrb_afectaCaja.setText("Afecta a Caja");
        jrb_afectaCaja.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jrb_afectaCajaItemStateChanged(evt);
            }
        });
        jrb_afectaCaja.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jrb_afectaCajaActionPerformed(evt);
            }
        });

        jcb_formaPago.setBackground(new java.awt.Color(102, 255, 102));
        jcb_formaPago.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECCIONE", "EFECTIVO", "CREDITO", "PLAN ACUMULATIVO" }));
        jcb_formaPago.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jcb_formaPagoItemStateChanged(evt);
            }
        });
        jcb_formaPago.addComponentListener(new java.awt.event.ComponentAdapter() {
            public void componentResized(java.awt.event.ComponentEvent evt) {
                jcb_formaPagoComponentResized(evt);
            }
        });

        jPanel6.setBorder(javax.swing.BorderFactory.createTitledBorder("Descripcion"));

        jTextArea1.setColumns(10);
        jTextArea1.setFont(new java.awt.Font("Monospaced", 1, 13)); // NOI18N
        jTextArea1.setRows(5);
        jTextArea1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jTextArea1KeyPressed(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                jTextArea1KeyReleased(evt);
            }
        });
        jScrollPane1.setViewportView(jTextArea1);

        javax.swing.GroupLayout jPanel6Layout = new javax.swing.GroupLayout(jPanel6);
        jPanel6.setLayout(jPanel6Layout);
        jPanel6Layout.setHorizontalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1)
        );
        jPanel6Layout.setVerticalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 109, Short.MAX_VALUE)
        );

        jLabel8.setText("PAGO ");

        javax.swing.GroupLayout jPanel8Layout = new javax.swing.GroupLayout(jPanel8);
        jPanel8.setLayout(jPanel8Layout);
        jPanel8Layout.setHorizontalGroup(
            jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel8Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel8Layout.createSequentialGroup()
                        .addComponent(jLabel7)
                        .addGap(18, 18, 18)
                        .addComponent(jrb_afectaCaja))
                    .addGroup(jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                        .addComponent(jcb_formaPago, javax.swing.GroupLayout.Alignment.LEADING, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jcb_tipoPVPUsar, javax.swing.GroupLayout.Alignment.LEADING, 0, 241, Short.MAX_VALUE))
                    .addComponent(jLabel8, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel6, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel8Layout.setVerticalGroup(
            jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel8Layout.createSequentialGroup()
                .addGroup(jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanel8Layout.createSequentialGroup()
                        .addGap(5, 5, 5)
                        .addGroup(jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel7)
                            .addComponent(jrb_afectaCaja))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jcb_tipoPVPUsar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel8)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jcb_formaPago, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel9.setBorder(javax.swing.BorderFactory.createTitledBorder("Nueva Forma de Pago"));

        jButton1.setBackground(new java.awt.Color(2, 117, 216));
        jButton1.setText("Vincular a Cuenta Contable");
        jButton1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jButton1MouseClicked(evt);
            }
        });
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        txt_nombreFormaPago.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txt_nombreFormaPago.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_nombreFormaPagoKeyReleased(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel1.setText("Nombre Forma de Pago");

        javax.swing.GroupLayout jPanel9Layout = new javax.swing.GroupLayout(jPanel9);
        jPanel9.setLayout(jPanel9Layout);
        jPanel9Layout.setHorizontalGroup(
            jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel9Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel1)
                    .addComponent(txt_nombreFormaPago, javax.swing.GroupLayout.PREFERRED_SIZE, 204, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 204, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel9Layout.setVerticalGroup(
            jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel9Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txt_nombreFormaPago, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButton1)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel11.setBorder(javax.swing.BorderFactory.createTitledBorder("Forma de Pago SRI"));

        jcb_sustentoTributario.setBackground(new java.awt.Color(255, 204, 51));
        jcb_sustentoTributario.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECCIONE" }));
        jcb_sustentoTributario.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jcb_sustentoTributarioItemStateChanged(evt);
            }
        });

        javax.swing.GroupLayout jPanel11Layout = new javax.swing.GroupLayout(jPanel11);
        jPanel11.setLayout(jPanel11Layout);
        jPanel11Layout.setHorizontalGroup(
            jPanel11Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jcb_sustentoTributario, 0, 388, Short.MAX_VALUE)
        );
        jPanel11Layout.setVerticalGroup(
            jPanel11Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel11Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jcb_sustentoTributario, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        jPanel12.setBorder(javax.swing.BorderFactory.createTitledBorder("Accionese"));

        jButton3.setBackground(new java.awt.Color(92, 184, 92));
        jButton3.setText("GUARDAR");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        jButton2.setBackground(new java.awt.Color(217, 83, 79));
        jButton2.setText("CANCELAR");

        javax.swing.GroupLayout jPanel12Layout = new javax.swing.GroupLayout(jPanel12);
        jPanel12.setLayout(jPanel12Layout);
        jPanel12Layout.setHorizontalGroup(
            jPanel12Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel12Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jButton3, javax.swing.GroupLayout.PREFERRED_SIZE, 129, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 135, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        jPanel12Layout.setVerticalGroup(
            jPanel12Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel12Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 43, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addComponent(jButton3, javax.swing.GroupLayout.PREFERRED_SIZE, 43, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        jComboBox1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECCIONE", "CHEQUE", "TRANSFERENCIA", "VOUCHER" }));

        jLabel9.setText("subclase");

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel11, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jComboBox1, 0, 175, Short.MAX_VALUE)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(jLabel9, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel12, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel12, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jPanel11, javax.swing.GroupLayout.PREFERRED_SIZE, 68, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(19, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel9)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(32, 32, 32))
        );

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(787, 787, 787)
                        .addComponent(jLabel3))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jPanel9, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jPanel8, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel7, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jPanel7, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE)
                    .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                        .addComponent(jPanel8, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 158, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(jPanel9, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 51, Short.MAX_VALUE)
                .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 12, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        // TODO add your handling code here:
        String error = "";
        FormasPagoCV fpc = new FormasPagoCV();
        if (!txt_nombreFormaPago.getText().isEmpty()) {
            PLANC cuenta = new PLANC();
            if (_FormaPagoSelected && _sustentoTributarioSelected) {
                try {
                    fpc.setDescripcion(jTextArea1.getText());
                    fpc.setFormaPago(txt_nombreFormaPago.getText());
                    if (_afectaaCaja) {
                        fpc.setAfectaACaja(1);
                        fpc.setNumeroCuotas(0);
                        fpc.setPorcentajeEntrada(0.0);
                        fpc.setPeridoCobranza("");
                        fpc.setDias_credito(0);
                    } else {
                        fpc.setAfectaACaja(0);
                        fpc.setNumeroCuotas(Integer.parseInt(txt_cuotas.getText()));
                        fpc.setPorcentajeEntrada(Double.valueOf(txt_entrada.getText()));
                        fpc.setDias_credito(Integer.valueOf(txt_diasCredito.getText()));
                        if (jcb_cobranza.getSelectedItem().equals(OperacionesForms._COMBO_SELECCIONE_TEXT)) {
                            error = "DEBE SELECCIONAR PERIDO DE COBRANZA";
                        } else {
                            fpc.setPeridoCobranza(jcb_cobranza.getSelectedItem().toString());
                            error = "";
                        }
                    }
                    fpc.setEsCxcCxp(comprasoVentas);
                    fpc.setPlanCodigo(OperacionesForms._ID_CODIGO_PLAN_CUENTA_0);
                    fpc.setSriFormaPagoCodigo(sriformaPagoSeleccionada.getCodigo());
                    fpc.setTipoPago(jcb_formaPago.getSelectedItem().toString());
                    fpc.setCodigo_tipoPrecio(precioseleccionado.getCodigo());
                    FormasPagoCVDao fpcompracontroller = new FormasPagoCVDao();
                    if (fpcompracontroller.guardarFormaPagook(fpc) != null && error.equalsIgnoreCase("")) {
                        ProgressBar.mostrarMensajeAzul("Forma de Pago " + txt_nombreFormaPago.getText() + " se registro correctamente..!");
                    } else {
                        ProgressBar.mostrarMensajeAzul("Errorx: " + error);
                    }
    }//GEN-LAST:event_jButton3ActionPerformed

       catch (Exception e) {

                    ProgressBar.mostrarMensajeAzul(e + "xxxxxxx");
                }
            } else {

                ProgressBar.mostrarMensajeAzul("DEBE SELECCIONAR LAS OPCIONES BASICAS : _FormaPagoSelected:: " + _FormaPagoSelected + "   _pvpaUsarselected :: " + _pvpaUsarselected + " _sustentoTributarioSelected:  " + _sustentoTributarioSelected);
            }

        } else {

            ProgressBar.mostrarMensajeAzul("DEBE NOMRAR FORMA DE PAGO");
        }

    }

    private void jButton1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jButton1MouseClicked


    }//GEN-LAST:event_jButton1MouseClicked

    private void txt_nombreFormaPagoKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_nombreFormaPagoKeyReleased

    }//GEN-LAST:event_txt_nombreFormaPagoKeyReleased

    private void jrb_afectaCajaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jrb_afectaCajaActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jrb_afectaCajaActionPerformed

    private void txt_cuotasKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_cuotasKeyReleased
        // TODO add your handling code here:
        if (!ValidaNUmeros.isOnlyDouble(txt_cuotas.getText())) {
            evt.consume();
        } else {
            txt_cuotas.setText("1");
        }
    }//GEN-LAST:event_txt_cuotasKeyReleased

    private void txt_cuotasActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_cuotasActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_cuotasActionPerformed

    private void jTextArea1KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextArea1KeyPressed
        // TODO add your handling code here:

    }//GEN-LAST:event_jTextArea1KeyPressed

    private void jTextArea1KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextArea1KeyReleased
    }//GEN-LAST:event_jTextArea1KeyReleased

    private void jcb_formaPagoItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcb_formaPagoItemStateChanged
        // TODO add your handling code here:

        if (!jcb_formaPago.getSelectedItem().toString().equals(OperacionesForms._COMBO_SELECCIONE_TEXT)) {
            _FormaPagoSelected = true;
            if (jcb_formaPago.getSelectedItem().toString().equals(OperacionesForms._EFECTIVO_TEXT)) {
                jrb_afectaCaja.setSelected(true);
                _afectaaCaja = true;
            } else {
                jrb_afectaCaja.setSelected(false);
                _afectaaCaja = false;
            }

            if (jcb_formaPago.getSelectedItem().toString().equals(OperacionesForms._EFECTIVO_TEXT)) {
                this.setSize(dimensiooOriginal);
            } else {

                this.setSize(dimensiooCredito);
                txt_cuotas.setText("1");
                txt_diasCredito.setText("30");
                txt_entrada.setText("0.0");
                jcb_cobranza.setSelectedItem(OperacionesForms._COMBO_SELECCIONE_TEXT);
            }

        } else {
            _FormaPagoSelected = false;
        }
    }//GEN-LAST:event_jcb_formaPagoItemStateChanged

    private void jrb_afectaCajaItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jrb_afectaCajaItemStateChanged
        // TODO add your handling code here:

        if (jcb_formaPago.getSelectedItem().toString().equals(OperacionesForms._EFECTIVO_TEXT)) {
            jrb_afectaCaja.setSelected(true);
        } else {
            jrb_afectaCaja.setSelected(false);
        }
    }//GEN-LAST:event_jrb_afectaCajaItemStateChanged

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        //PlanJpaController planControlller = new PlanJpaController(__factory);
        //Plan cuenta = planControlller.findCuentaByDescripcion("EFECTIVO Y EQUIVALENTES DE EFECTIVO");
    }//GEN-LAST:event_jButton1ActionPerformed

    private void txt_entradaKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_entradaKeyReleased
        // TODO add your handling code here:

        if (!ValidaNUmeros.isOnlyDouble(txt_entrada.getText())) {
            evt.consume();
        } else {
            txt_entrada.setText("0.0");
        }
    }//GEN-LAST:event_txt_entradaKeyReleased

    private void jcb_cobranzaItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcb_cobranzaItemStateChanged
        // TODO add your handling code here:
        if (!jcb_cobranza.getSelectedItem().toString().equalsIgnoreCase(OperacionesForms._COMBO_SELECCIONE_TEXT)) {
            _peridoCobranzaselected = true;
        } else {
            _peridoCobranzaselected = false;
        }
    }//GEN-LAST:event_jcb_cobranzaItemStateChanged

    private void jcb_formaPagoComponentResized(java.awt.event.ComponentEvent evt) {//GEN-FIRST:event_jcb_formaPagoComponentResized
        // TODO add your handling code here:


    }//GEN-LAST:event_jcb_formaPagoComponentResized

    private void formComponentResized(java.awt.event.ComponentEvent evt) {//GEN-FIRST:event_formComponentResized
        // TODO add your handling code here:
        Deb.consola(this.getSize().toString());
    }//GEN-LAST:event_formComponentResized

    private void jcb_tipoPVPUsarItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcb_tipoPVPUsarItemStateChanged
        // TODO add your handling code here:
        if (!jcb_tipoPVPUsar.getSelectedItem().toString().equalsIgnoreCase(OperacionesForms._COMBO_SELECCIONE_TEXT)) {

            for (Precios pre : listaPrecios) {
                if (pre.getNombre().equalsIgnoreCase(jcb_tipoPVPUsar.getSelectedItem().toString())) {
                    precioseleccionado = pre;
                    _pvpaUsarselected = true;
                }
            }
        } else {
            _pvpaUsarselected = false;
        }
    }//GEN-LAST:event_jcb_tipoPVPUsarItemStateChanged

    private void jcb_sustentoTributarioItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcb_sustentoTributarioItemStateChanged
        // TODO add your handling code here:

        if (!jcb_sustentoTributario.getSelectedItem().toString().equalsIgnoreCase(OperacionesForms._COMBO_SELECCIONE_TEXT)) {

            Deb.consola("SELECTED ITEMmmmmmmmmmmm: " + jcb_sustentoTributario.getItemCount());
            String formapago = jcb_sustentoTributario.getSelectedItem().toString();
            String[] arrOfStr = formapago.split("-");
            for (int i = 0; i < arrOfStr.length; i++) {
                String string = arrOfStr[i].trim();

                if (string.length() > 4) {
                    for (SriFormaPago sriF : listaFormasPagoSri) {
                        if (sriF.getFormaPago().equalsIgnoreCase(string)) {
                            sriformaPagoSeleccionada = sriF;
                            _sustentoTributarioSelected = true;
                            Deb.consola("SELECTED cccccccccccc: " + jcb_sustentoTributario.getSelectedItem().toString());
                        }
                    }
                }
            }
        } else {
            _sustentoTributarioSelected = false;
        }
    }//GEN-LAST:event_jcb_sustentoTributarioItemStateChanged


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.ButtonGroup buttonGroup1;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JComboBox<String> jComboBox1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel11;
    private javax.swing.JPanel jPanel12;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JPanel jPanel8;
    private javax.swing.JPanel jPanel9;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextArea jTextArea1;
    private javax.swing.JComboBox<String> jcb_cobranza;
    private javax.swing.JComboBox<String> jcb_formaPago;
    private javax.swing.JComboBox<String> jcb_sustentoTributario;
    private javax.swing.JComboBox<String> jcb_tipoPVPUsar;
    private javax.swing.JRadioButton jrb_afectaCaja;
    private javax.swing.JTextField txt_cuotas;
    private javax.swing.JTextField txt_diasCredito;
    private javax.swing.JTextField txt_entrada;
    private javax.swing.JTextField txt_nombreFormaPago;
    // End of variables declaration//GEN-END:variables
}
