/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista.Usuarios;

import Controlador.Usuarios.RetencionCDao;
import Modelo.Sri_porcentajes_retencion;
import Modelo.sri_tipocomprobante;
import Vista.Principal;
import static Vista.Usuarios.Crear_Compras.isOpenfromCrearFacturaSelectAir;
import static Vista.Usuarios.Crear_RetencionC.isOpenfromCrearRetencion;
import java.util.ArrayList;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;

/**
 *
 * @author USUARIO
 */
public class SelectPorcentajesRetencion extends javax.swing.JDialog {

    /**
     * Creates new form SelectPorcentajesRetencion
     */
    TableColumnModel columnModel;
    ArrayList<Sri_porcentajes_retencion> listaporcentajesRetencion = new ArrayList<Sri_porcentajes_retencion>();
    public static boolean isChekiva = false;
    public static boolean isCheckrenta = false;

    DefaultTableModel modelo = null;
    String[] titulos
            = {"NUMERO", "ID", "PORCENTAJE", "TIPO", "DESCRIPCION"};
    String[] registros = new String[5];

    public SelectPorcentajesRetencion(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();

    }

    private void setModeloColumnas(JTable tb) {
        this.columnModel = tb.getColumnModel();
        this.columnModel.getColumn(0).setPreferredWidth(5);
        this.columnModel.getColumn(1).setPreferredWidth(5);
        this.columnModel.getColumn(2).setPreferredWidth(5);

    }

    private DefaultTableModel llenartable() {

        RetencionCDao rtDao = new RetencionCDao();

        listaporcentajesRetencion = rtDao.getlistaPorcentajesdeRetencion();

        this.modelo = new DefaultTableModel(null, titulos) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // make read only fields except column 0,13,14
                //  return column == 0 || column == 13 || column == 14;
                return false;
            }
        };
        jTable11.setModel(modelo);
        for (Sri_porcentajes_retencion P : listaporcentajesRetencion) {
            if (P.getTipo().equalsIgnoreCase("IVA") && isChekiva) {
                registros[0] = P.getCodigo().toString();
                registros[1] = P.getId();
                registros[2] = P.getPorcentaje().toString();
                registros[3] = P.getTipo();
                registros[4] = P.getDescripcion();
                modelo.addRow(registros);

            }
            if (P.getTipo().equalsIgnoreCase("RENTA") && isCheckrenta) {
                registros[0] = P.getCodigo().toString();
                registros[1] = P.getId();
                registros[2] = P.getPorcentaje().toString();
                registros[3] = P.getTipo();
                registros[4] = P.getDescripcion();
                modelo.addRow(registros);

            }
        }
        isChekiva = false;
        isCheckrenta = false;
        return modelo;
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
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable11 = new javax.swing.JTable();
        jButton1 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowOpened(java.awt.event.WindowEvent evt) {
                formWindowOpened(evt);
            }
        });

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder("Seleccione los Porcentajes de Retencion"));

        jTable11.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {},
                {},
                {},
                {}
            },
            new String [] {

            }
        ));
        jTable11.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTable11MouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(jTable11);

        jButton1.setBackground(new java.awt.Color(255, 153, 153));
        jButton1.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        jButton1.setText("Cerrar");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 168, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 794, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(0, 0, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 339, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jTable11MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable11MouseClicked
        // TODO add your handling code here:
        String id = "";
        if (evt.getClickCount() == 2) {
            String[] registros = new String[7];
            JTable table = (JTable) evt.getSource();
            int row = table.getSelectedRow();
            int col = table.getSelectedColumn();
            //obtengo el codigo del usuario
            Double retenido = null;
            id = table.getValueAt(row, 1).toString();
            int porcentaje = Integer.valueOf(table.getValueAt(row, 2).toString());
            String tipo = table.getValueAt(row, 3).toString();
            registros[0] = "1";
            registros[1] = Principal.periodo;
            if (isOpenfromCrearRetencion) {
                if (tipo.equals("IVA")) {
                    registros[2] = Crear_RetencionC.txtIvaFac.getText();
                    retenido = (Double.parseDouble(registros[2]) * porcentaje) / 100;
                } else if (tipo.equals("RENTA")) {
                    registros[2] = Crear_RetencionC.txtBaseFac.getText();
                    retenido = (Double.parseDouble(registros[2]) * porcentaje) / 100;
                }

                registros[3] = tipo;
                registros[4] = id;
                //txt_iva_valor.setText(String.valueOf(String.format("%.4f", (total - subtotal))).replace(",", "."));
                registros[5] = String.valueOf(porcentaje);
                registros[6] = String.valueOf(String.format("%.4f", retenido).replace(",", "."));
                Crear_RetencionC.modelo.addRow(registros);
                //modelo2.addRow(registros);
                Crear_RetencionC.jTable1.setModel(Crear_RetencionC.modelo);
                Crear_RetencionC.modelo.fireTableDataChanged();
                int i = 0;
                Double val = 0.0;
                while (i < Crear_RetencionC.modelo.getRowCount()) {
                    val = val + Double.parseDouble(Crear_RetencionC.modelo.getValueAt(i, 6).toString());
                    String totalret = String.valueOf(String.format("%.4f", val).replace(",", "."));
                    Crear_RetencionC.txtTotal.setText(totalret);
                    i++;
                }
            }

            if (isOpenfromCrearFacturaSelectAir) {

                Crear_Compras.jTable1.setValueAt(id, Crear_Compras.filacliked, Crear_Compras.columnacliked);
                this.dispose();
            }
        }

    }//GEN-LAST:event_jTable11MouseClicked

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        dispose();
    }//GEN-LAST:event_jButton1ActionPerformed

    private void formWindowOpened(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowOpened
        // TODO add your handling code here:
        setModeloColumnas(jTable11);
    }//GEN-LAST:event_formWindowOpened

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
            java.util.logging.Logger.getLogger(SelectPorcentajesRetencion.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(SelectPorcentajesRetencion.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(SelectPorcentajesRetencion.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(SelectPorcentajesRetencion.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the dialog */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                SelectPorcentajesRetencion dialog = new SelectPorcentajesRetencion(new javax.swing.JFrame(), true);
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
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    public static javax.swing.JTable jTable11;
    // End of variables declaration//GEN-END:variables
}
