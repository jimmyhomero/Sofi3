/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista.caja;

import ClasesAuxiliares.NumeroToLetras;
import ClasesAuxiliares.Variables;
import Controlador.Usuarios.CajasDetalleDao;
import Modelo.CajasDetalle;
import Vlidaciones.ProgressBar;
import Vlidaciones.VaciarTexto;
import Vlidaciones.ValidaNUmeros;
import login.login;
import java.awt.event.KeyEvent;
import javax.swing.JOptionPane;
import javax.swing.text.html.parser.DTDConstants;

/**
 *
 * @author USUARIO
 */
public class EgresoCaja extends javax.swing.JInternalFrame {

    public static Integer indexPositiotoolBar;
 ProgressBar msg = new ProgressBar(2000, "Mensaje Inicial");
    /**
     * Creates new form IngresoCaja
     */
    public EgresoCaja() {
        initComponents();
        txt_valor.selectAll();
       

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
        jLabel1 = new javax.swing.JLabel();
        txt_valor = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        txt_letras = new javax.swing.JTextArea();
        txt_password = new javax.swing.JPasswordField();
        jLabel2 = new javax.swing.JLabel();
        btn_cancelar = new javax.swing.JButton();
        btn_guardar = new javax.swing.JButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        txt_detalle = new javax.swing.JTextArea();
        jLabel3 = new javax.swing.JLabel();

        setClosable(true);
        setMaximizable(true);
        setMaximumSize(new java.awt.Dimension(2147, 214770));
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 17)); // NOI18N
        jLabel1.setText("VALOR DEL INGRESO");

        txt_valor.setFont(new java.awt.Font("Tahoma", 1, 17)); // NOI18N
        txt_valor.setText("0.0");
        txt_valor.addInputMethodListener(new java.awt.event.InputMethodListener() {
            public void caretPositionChanged(java.awt.event.InputMethodEvent evt) {
            }
            public void inputMethodTextChanged(java.awt.event.InputMethodEvent evt) {
                txt_valorInputMethodTextChanged(evt);
            }
        });
        txt_valor.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                txt_valorPropertyChange(evt);
            }
        });
        txt_valor.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txt_valorKeyPressed(evt);
            }
        });

        txt_letras.setEditable(false);
        txt_letras.setColumns(20);
        txt_letras.setFont(new java.awt.Font("Monospaced", 0, 14)); // NOI18N
        txt_letras.setRows(5);
        txt_letras.setTabSize(4);
        jScrollPane1.setViewportView(txt_letras);

        jLabel2.setFont(new java.awt.Font("Tahoma", 1, 17)); // NOI18N
        jLabel2.setText("Calve de Administrador");

        btn_cancelar.setBackground(new java.awt.Color(255, 51, 51));
        btn_cancelar.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        btn_cancelar.setText("CANCELAR");

        btn_guardar.setBackground(new java.awt.Color(51, 255, 51));
        btn_guardar.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        btn_guardar.setText("GUARDAR");
        btn_guardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_guardarActionPerformed(evt);
            }
        });

        txt_detalle.setColumns(20);
        txt_detalle.setRows(5);
        jScrollPane2.setViewportView(txt_detalle);

        jLabel3.setFont(new java.awt.Font("Tahoma", 1, 17)); // NOI18N
        jLabel3.setText("DETALLE DEL MOVIMIENTO");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(btn_guardar, javax.swing.GroupLayout.PREFERRED_SIZE, 155, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(36, 36, 36)
                        .addComponent(btn_cancelar, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(32, 32, 32))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 215, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(txt_password, javax.swing.GroupLayout.PREFERRED_SIZE, 195, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                .addGroup(jPanel1Layout.createSequentialGroup()
                                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 225, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addGap(18, 18, 18)
                                    .addComponent(txt_valor, javax.swing.GroupLayout.PREFERRED_SIZE, 169, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 465, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 465, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 313, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addContainerGap(23, Short.MAX_VALUE))))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 38, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txt_valor, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 38, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 121, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txt_password, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 43, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(20, 20, 20)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btn_guardar, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btn_cancelar, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(49, Short.MAX_VALUE))
        );

        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 500, 510));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void txt_valorInputMethodTextChanged(java.awt.event.InputMethodEvent evt) {//GEN-FIRST:event_txt_valorInputMethodTextChanged
        // TODO add your handling code here:
        // NumeroToLetras ntl = new NumeroToLetras();


    }//GEN-LAST:event_txt_valorInputMethodTextChanged

    private void txt_valorKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_valorKeyPressed
        // TODO add your handling code here:
        String c;
        char a = 0;
        //JOptionPane.showMessageDialog(null, evt.getKeyChar());
        // txt_valor.setText(txt_valor.getText()+ );
        System.out.println("Char: " + evt.getKeyCode());
        String s = "";
        if ((evt.getKeyCode() >= 96 && evt.getKeyCode() <= 105) || (evt.getKeyCode() >= 48 && evt.getKeyCode() <= 57) || evt.getKeyCode() == 110) {
            s = txt_valor.getText() + evt.getKeyChar();
            if (ValidaNUmeros.isOnlyDouble(txt_valor.getText())) {
                NumeroToLetras n = new NumeroToLetras();
                txt_letras.setText(n.Convertir(s, true));
            } else {
                txt_valor.setText("0.0");
                txt_valor.selectAll();
            }
        } else {
            s = txt_valor.getText();
            txt_valor.setText("0.0");
            txt_valor.selectAll();
            System.out.println("Vista.Usuarios.IngresoCaja.txt_valorKeyPressed()" + s);
        }

    }//GEN-LAST:event_txt_valorKeyPressed

    private void txt_valorPropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_txt_valorPropertyChange
        // TODO add your handling code here:
      //  NumeroToLetras n = new NumeroToLetras();
       // txt_letras.setText(n.Convertir(txt_valor.getText(), true));

    }//GEN-LAST:event_txt_valorPropertyChange

    private void btn_guardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_guardarActionPerformed
        // TODO add your handling code here:
        if(!txt_detalle.getText().equals("")&&!txt_valor.getText().endsWith("0.0")&&!txt_valor.getText().equals("")){
        CajasDetalle cjd = new CajasDetalle();
        CajasDetalleDao cjdDao = new CajasDetalleDao();
       cjd.setCajas_Codigo( login.codigoCaja);
       cjd.setCodigoDocuemnto(0);
       cjd.setDescripcion(txt_detalle.getText());
       cjd.setDetalle(Variables.CAJA_EGRESO_MANUAL+login.nombresUsuario+" DESDE EQUIPO: "+login.nombreDelEquipo);
       cjd.setTipo(Variables.CAJA_TIPO_EGRESO);
       cjd.setDocumento(Variables.CAJA_EGRESO_MANUAL);
       cjd.setValor(Double.parseDouble(txt_valor.getText()));
       cjdDao.guardar(cjd);
            VaciarTexto v= new VaciarTexto();
            v.limpiar_texto(jPanel1);
       txt_valor.setText("0.0");
        }else{
            msg.setProgressBar_mensajae("Se debe Ingresar un Detalle");        
        }
    }//GEN-LAST:event_btn_guardarActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btn_cancelar;
    private javax.swing.JButton btn_guardar;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTextArea txt_detalle;
    private javax.swing.JTextArea txt_letras;
    private javax.swing.JPasswordField txt_password;
    private javax.swing.JTextField txt_valor;
    // End of variables declaration//GEN-END:variables
}