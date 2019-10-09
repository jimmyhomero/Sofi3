/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista.Usuarios;

import ClasesAuxiliares.MaquinaDao;
import ClasesAuxiliares.NewConfigfile;
import Controlador.Coneccion;
import Controlador.Ejemplo;
import Controlador.ProbarConexion;
import Controlador.Usuarios.BodegasDao;
import Controlador.Usuarios.CajasDao;
import Controlador.Usuarios.Config2Dao;
import Controlador.Usuarios.Config_EquiposDao;
import Controlador.Usuarios.DatosEmpresaDao;
import Controlador.Usuarios.EquiposDao;
import Modelo.Bodegas;
import Modelo.Cajas;
import Modelo.Config2;
import Modelo.Config_Equipos;
import Modelo.DatosEmpresa;
import Modelo.Equipos;
import Vista.alertas.MnesajesOption;
import java.awt.Color;
import java.awt.Frame;
import java.io.IOException;
import static java.lang.System.exit;
import java.util.ArrayList;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.border.Border;

/**
 *
 * @author USUARIO
 */
public class NuevoEquipobk extends javax.swing.JDialog {

    /**
     * Creates new form ConfigurarServidor
     */
/////////////////
    
    ArrayList<Cajas> lista = new ArrayList<Cajas>();
    public static String cajaNombre = null;
    public static Integer cajaCodigo = null;
    Equipos obj = new Equipos();
    EquiposDao objDao = new EquiposDao();
    MaquinaDao maquina = new MaquinaDao();
    ArrayList<Bodegas> listBodegas = new ArrayList<Bodegas>();
    boolean isClickedinJCBCompra = false;
    boolean isClickedinJCBVenta = false;
    Config_Equipos objConfigEquiposcompra = new Config_Equipos();
    Config_Equipos objConfigEquiposventa = new Config_Equipos();

    public NuevoEquipobk(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();

        Cajas caja = new Cajas();
        CajasDao cajaDao = new CajasDao();
        lista = cajaDao.listar();
        for (Cajas cajas : lista) {
            jComboBox1.addItem(cajas.getCaja());
            System.out.println("Cajassss: " + cajas.getCaja());
        }
        BodegasDao bDao = new BodegasDao();
        listBodegas = bDao.listar();
        for (Bodegas b : listBodegas) {
            jcb_BodegaPredeterminadCOmpra.addItem(b.getBodegaID() + "-" + b.getBodega());
            jcb_BodegaPredeterminadventas.addItem(b.getBodegaID() + "-" + b.getBodega());
        }
        jlnombrereal.setText(maquina.getNombreEquipo());
        setLocationRelativeTo(null);
        // this.setUndecorated(true);

        ///////////////
        Config2Dao condig2 = new Config2Dao();
        Integer x1izquierda = 10;
        Integer x2sperior = 10;
        Integer x3ancho = 300;
        Integer x4alto = 20;

        for (int i = 0; i < 3; i++) {
//            
//        
//          JLabel lbl = new JLabel("Nombre label"+i);
//            lbl.setText("texto label"+i);            
//            //lbl.setSize(100, 200);
//            lbl.setBounds(x1izquierda, x2sperior, x3ancho, x4alto);
//            lbl.setBackground(Color.white);   
//            lbl.setBackground(Color.red);
//            jPanel1.add(lbl);
//            jPanel1.validate();            
//            lbl.setVisible(true);
//            x2sperior=x2sperior+x4alto;
        }
        for (Config2 cfg2 : condig2.listar()) {

            JLabel lbl = new JLabel(cfg2.getNombre());
            lbl.setText(cfg2.getNombre());
            //lbl.setSize(100, 200);
            lbl.setBounds(x1izquierda, x2sperior, x3ancho, x4alto);
            lbl.setBackground(Color.white);
            lbl.setBackground(Color.red);
            jPanel2.add(lbl);
            jPanel2.validate();
            lbl.setVisible(true);
            x2sperior = x2sperior + x4alto;
        }

///////////////
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        txt_nombreSoft = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        jlnombrereal = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        txtSec1 = new javax.swing.JTextField();
        txtSec2 = new javax.swing.JTextField();
        txtSec3 = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        txt_bodegaPredeterminadaEnCompras = new javax.swing.JLabel();
        txt_bodegaPredeterminadaEnVENTAS = new javax.swing.JLabel();
        jcb_BodegaPredeterminadCOmpra = new javax.swing.JComboBox<>();
        jcb_BodegaPredeterminadventas = new javax.swing.JComboBox<>();
        jComboBox1 = new javax.swing.JComboBox<>();
        jLabel4 = new javax.swing.JLabel();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jTabbedPane1 = new javax.swing.JTabbedPane();
        jPanel2 = new javax.swing.JPanel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        jPanel1.setBackground(new java.awt.Color(204, 255, 204));
        jPanel1.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        jLabel1.setText("NOMBRE REAL");

        jLabel2.setText("SECUENCIA");

        txtSec1.setText("001");

        txtSec2.setText("001");

        txtSec3.setText("000000001");

        jLabel3.setText("CAJA PREDETERMINADA");

        txt_bodegaPredeterminadaEnCompras.setText("BODEGA PREDETERMINADA EN COMPRAS");

        txt_bodegaPredeterminadaEnVENTAS.setText("BODEGA PREDETERMINADA EN VENTAS");

        jcb_BodegaPredeterminadCOmpra.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccione" }));
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

        jcb_BodegaPredeterminadventas.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccione" }));
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

        jComboBox1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccione" }));
        jComboBox1.setName(""); // NOI18N
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

        jLabel4.setText("ALIAS DEL EQUIPO");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addGap(268, 268, 268)
                .addComponent(jlnombrereal, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(txt_bodegaPredeterminadaEnVENTAS)
                    .addComponent(txt_bodegaPredeterminadaEnCompras)
                    .addComponent(jLabel3)
                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 66, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4)
                    .addComponent(jLabel1))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                    .addComponent(jComboBox1, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jcb_BodegaPredeterminadventas, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jcb_BodegaPredeterminadCOmpra, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup()
                        .addComponent(txtSec1, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txtSec2, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 27, Short.MAX_VALUE)
                        .addComponent(txtSec3, javax.swing.GroupLayout.PREFERRED_SIZE, 83, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(txt_nombreSoft)))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jlnombrereal, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txt_nombreSoft, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(txtSec3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(txtSec2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(txtSec1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jLabel2, javax.swing.GroupLayout.Alignment.TRAILING))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txt_bodegaPredeterminadaEnCompras)
                    .addComponent(jcb_BodegaPredeterminadCOmpra, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jcb_BodegaPredeterminadventas, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txt_bodegaPredeterminadaEnVENTAS))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3))
                .addGap(45, 45, 45))
        );

        jButton1.setBackground(new java.awt.Color(0, 175, 31));
        jButton1.setText("Guardar");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jButton2.setBackground(new java.awt.Color(255, 51, 51));
        jButton2.setText("Cancelar");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 736, Short.MAX_VALUE)
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 344, Short.MAX_VALUE)
        );

        jTabbedPane1.addTab("Config", jPanel2);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jTabbedPane1)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 117, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addContainerGap())
                    .addComponent(jPanel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 192, javax.swing.GroupLayout.PREFERRED_SIZE)))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(164, Short.MAX_VALUE))
            .addGroup(layout.createSequentialGroup()
                .addComponent(jTabbedPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 374, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        if (isClickedinJCBCompra && isClickedinJCBVenta) {
            if (cajaCodigo != null && cajaNombre != null) {
                if (txtSec1.getText().length() == 3 && txtSec2.getText().length() == 3 && txtSec3.getText().length() == 9) {
                    Integer codigoNewEquipo = null;
                    obj.setCajas_Codigo(cajaCodigo);
                    obj.setCajas_Nombre(cajaNombre);
                    obj.setIp(maquina.getIpEquipo());
                    obj.setNombreReal(maquina.getNombreEquipo());
                    obj.setNombreSof(txt_nombreSoft.getText());
                    obj.setSecuencia1(txtSec1.getText());
                    obj.setSecuencia2(txtSec2.getText());
                    obj.setSecuencia3(txtSec3.getText());
                    codigoNewEquipo = objDao.guardar(obj);
                    //// condiguracion inicial para el equipo
                    Config_Equipos ce = new Config_Equipos();
                    ce.setNombre("IMPRESORA TICKETS");
                    ce.setValor1("No Asignada");
                    ce.setEquipos_codigo(codigoNewEquipo);

                    Config_EquiposDao cdDao = new Config_EquiposDao();
                    cdDao.guardar(ce);
                    ce.setNombre("IMPRESORA FACTURAS");
                    ce.setEquipos_codigo(codigoNewEquipo);
                    ce.setValor1("No Asignada");
                    Config_EquiposDao cdDao1 = new Config_EquiposDao();
                    cdDao1.guardar(ce);
                    ce.setNombre("FORMA DE PAGO PREDETERMINADA");
                    ce.setEquipos_codigo(codigoNewEquipo);
                    ce.setValor1("No Asignada");
                    Config_EquiposDao cdDao2 = new Config_EquiposDao();
                    cdDao2.guardar(ce);

                    ///es necesaria una bodega predeterminada de compra y de venta 
                    objConfigEquiposcompra.setNombre("BODEGA PREDETERMINADA EN COMPRA");
                    objConfigEquiposcompra.setEquipos_codigo(codigoNewEquipo);
                    Config_EquiposDao cdDao3 = new Config_EquiposDao();
                    cdDao3.guardar(objConfigEquiposcompra);

                    objConfigEquiposventa.setNombre("BODEGA PREDETERMINADA EN VENTA");
                    objConfigEquiposventa.setEquipos_codigo(codigoNewEquipo);
                    Config_EquiposDao cdDao4 = new Config_EquiposDao();
                    cdDao4.guardar(objConfigEquiposventa);
                    //////////////

                    ce.setNombre("IMPRESORA TICKETS");
                    ce.setEquipos_codigo(codigoNewEquipo);
                    Config_EquiposDao cdDao5 = new Config_EquiposDao();
                    ce.setValor1("No Asignada");
                    cdDao5.guardar(ce);
                    ce.setNombre("VER IMAAGEN ");
                    ce.setEquipos_codigo(codigoNewEquipo);
                    Config_EquiposDao cdDao6 = new Config_EquiposDao();
                    ce.setValor1("No Asignada");
                    cdDao6.guardar(ce);

                    /////
                    try {
                        String cmd = Ejemplo.jarExec; //Comando de apagado en linux
                        Runtime.getRuntime().exec(cmd);
                    } catch (IOException ioe) {
                        System.out.println(ioe);
                    }
                    dispose();
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

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:
        exit(0);
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jcb_BodegaPredeterminadCOmpraItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcb_BodegaPredeterminadCOmpraItemStateChanged
        // TODO add your handling code here:
        if (jcb_BodegaPredeterminadCOmpra.getItemCount() > 1 && isClickedinJCBCompra) {
            objConfigEquiposcompra.setValor1(jcb_BodegaPredeterminadCOmpra.getSelectedItem().toString());
        }
    }//GEN-LAST:event_jcb_BodegaPredeterminadCOmpraItemStateChanged

    private void jcb_BodegaPredeterminadCOmpraMouseReleased(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jcb_BodegaPredeterminadCOmpraMouseReleased
        // TODO add your handling code here:
        isClickedinJCBCompra = true;
    }//GEN-LAST:event_jcb_BodegaPredeterminadCOmpraMouseReleased

    private void jcb_BodegaPredeterminadCOmpraActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jcb_BodegaPredeterminadCOmpraActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jcb_BodegaPredeterminadCOmpraActionPerformed

    private void jcb_BodegaPredeterminadventasItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcb_BodegaPredeterminadventasItemStateChanged
        // TODO add your handling code here:
        if (jcb_BodegaPredeterminadventas.getItemCount() > 1 && isClickedinJCBVenta) {
            //objConfigEquipos.setValor2(jcb_BodegaPredeterminadventas.getSelectedItem().toString());
            objConfigEquiposventa.setValor1(jcb_BodegaPredeterminadventas.getSelectedItem().toString());
        }
    }//GEN-LAST:event_jcb_BodegaPredeterminadventasItemStateChanged

    private void jcb_BodegaPredeterminadventasMouseReleased(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jcb_BodegaPredeterminadventasMouseReleased
        // TODO add your handling code here:
        isClickedinJCBVenta = true;
    }//GEN-LAST:event_jcb_BodegaPredeterminadventasMouseReleased

    private void jcb_BodegaPredeterminadventasActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jcb_BodegaPredeterminadventasActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jcb_BodegaPredeterminadventasActionPerformed

    private void jComboBox1ItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jComboBox1ItemStateChanged
        // TODO add your handling code here:
        System.out.println("Vista.Usuarios.SelectCaja.jComboBox1ItemStateChanged()se ha seleccinadosss");
        if (jComboBox1.getSelectedItem() != null) {
            for (Cajas cajas : lista) {
                if (jComboBox1.getSelectedItem().toString().equals(cajas.getCaja())) {

                    cajaCodigo = cajas.getCodigo();
                    cajaNombre = cajas.getCaja();
                }
                if (jComboBox1.getSelectedItem().toString().equals("Seleccione")) {
                    cajaCodigo = null;
                    cajaNombre = "N/A";
                    JOptionPane.showMessageDialog(null, "Por favor Seleccione una Caja para este Equipo");
                }

            }
        }
    }//GEN-LAST:event_jComboBox1ItemStateChanged

    private void jComboBox1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jComboBox1ActionPerformed

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
            java.util.logging.Logger.getLogger(NuevoEquipobk.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(NuevoEquipobk.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(NuevoEquipobk.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(NuevoEquipobk.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the dialog */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                NuevoEquipobk dialog = new NuevoEquipobk(new javax.swing.JFrame(), true);
                dialog.addWindowListener(new java.awt.event.WindowAdapter() {
                    @Override
                    public void windowClosing(java.awt.event.WindowEvent e) {
                        System.exit(0);
                    }
                });
                dialog.setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JComboBox<String> jComboBox1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JTabbedPane jTabbedPane1;
    private javax.swing.JComboBox<String> jcb_BodegaPredeterminadCOmpra;
    private javax.swing.JComboBox<String> jcb_BodegaPredeterminadventas;
    private javax.swing.JLabel jlnombrereal;
    private javax.swing.JTextField txtSec1;
    private javax.swing.JTextField txtSec2;
    private javax.swing.JTextField txtSec3;
    private javax.swing.JLabel txt_bodegaPredeterminadaEnCompras;
    private javax.swing.JLabel txt_bodegaPredeterminadaEnVENTAS;
    private javax.swing.JTextField txt_nombreSoft;
    // End of variables declaration//GEN-END:variables
}
