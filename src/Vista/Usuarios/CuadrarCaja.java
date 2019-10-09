/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista.Usuarios;

import ClasesAuxiliares.Variables;
import Controlador.Coneccion;
import Controlador.Usuarios.ImpresionDao;
import static Vista.Usuarios.Crear_Facturas.secuenciaFac;
import Vlidaciones.ValidaNUmeros;
import java.awt.BorderLayout;
import java.awt.Color;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTable;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.table.DefaultTableModel;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JRViewer;

/**
 *
 * @author USUARIO
 */
public class CuadrarCaja extends javax.swing.JInternalFrame {

    /**
     * Creates new form CuadrarCaja
     */
    static Double valorbillete = 0.0;
    String rutaInforme = "";
    Map parametros = new HashMap();

    public CuadrarCaja() {
        initComponents();
        ///llenar tabla
        crearModelo();
        addOrDeleteRowTable(jTable1);
        operacionFacturauPDATEandAddRowrs();

        ///"C:\\Users\\USUARIO\\Desktop\\Cajas1.jasper"
        //String rutaInforme = Variables.DIR_REPORTE_FACTURA;
        String rutaInforme = Variables.DIR_REPORTE_DETALLE_CAJA;
        parametros.put("doc", "FACTURA");
       // parametros.put("numeroFactura", "001-001-000000005");      
        getdetallesmovimiento(parametros,rutaInforme);
    }

    public void getdetallesmovimiento(Map parametros, String rutaInforme) {

        try {
            Coneccion c = new Coneccion();
            JasperPrint jasperPrint = JasperFillManager.fillReport(rutaInforme, parametros, c.conectar());
            //se crea el visor con el reporte
            JRViewer jRViewer = new JRViewer(jasperPrint);
            //se elimina elementos del contenedor JPanel
            jpContainer.removeAll();
            //para el tamaño del reporte se agrega un BorderLayout
            jpContainer.setLayout(new BorderLayout());
            jpContainer.add(jRViewer, BorderLayout.CENTER);
            jRViewer.setVisible(true);
            jpContainer.repaint();
            jpContainer.revalidate();
            c.cerrar();
        } catch (JRException ex) {
            System.err.println(ex.getMessage());
        }

    }

    private void crearModelo() {
        DefaultTableModel modelo = null;
        String[] titulos
                = {"DENOMINACION", "CANTIDAD"};
        String[] registros = new String[2];
        modelo = new DefaultTableModel(null, titulos) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // make read only fields except column 0,13,14
                //  return column == 0 || column == 13 || column == 14;
                return column == 1;
                // return false;
            }
        };
        registros[0] = "Billetes $100";
        registros[1] = "";
        modelo.addRow(registros);
        registros[0] = "Billetes $150";
        registros[1] = "";
        modelo.addRow(registros);
        registros[0] = "Billetes $20";
        registros[1] = "";
        modelo.addRow(registros);
        registros[0] = "Billetes $10";
        registros[1] = "";
        modelo.addRow(registros);
        registros[0] = "Billetes $5";
        registros[1] = "";
        modelo.addRow(registros);
        registros[0] = "Monedas $1";
        registros[1] = "";
        modelo.addRow(registros);
        registros[0] = "Monedas $0.5";
        registros[1] = "";
        modelo.addRow(registros);
        registros[0] = "Monedas $0.25";
        registros[1] = "";
        modelo.addRow(registros);
        registros[0] = "Monedas $0.1";
        registros[1] = "";
        modelo.addRow(registros);
        registros[0] = "Monedas $0.05";
        registros[1] = "";
        modelo.addRow(registros);
        registros[0] = "Monedas $0.01";
        registros[1] = "";
        modelo.addRow(registros);
        registros[0] = "CHEQUES";
        registros[1] = "";
        modelo.addRow(registros);
        registros[0] = "DEPOSITOS";
        registros[1] = "";
        modelo.addRow(registros);
        registros[0] = "TRANSFERENCIAS";
        registros[1] = "";
        modelo.addRow(registros);
        registros[0] = "VOUCHERS";
        registros[1] = "";
        modelo.addRow(registros);
        registros[0] = "OTROS SALDOS";
        registros[1] = "";
        modelo.addRow(registros);
        jTable1.setModel(modelo);
    }

    public static void valorMoneda(int numero) {
        switch (numero) {
            case 0:
                valorbillete = 100.0;
                break;
            case 1:
                valorbillete = 50.0;
                break;
            case 2:
                valorbillete = 20.0;
                break;
            case 3:
                valorbillete = 10.0;
                break;
            case 4:
                valorbillete = 5.0;
                break;
            case 5:
                valorbillete = 1.0;
                break;
            case 6:
                valorbillete = 0.5;
                break;
            case 7:
                valorbillete = 0.25;
                break;
            case 8:
                valorbillete = 0.1;
                break;
            case 9:
                valorbillete = 0.05;
                break;
            case 10:
                valorbillete = 0.01;
                break;
        }

    }

    private void operacionFacturauPDATEandAddRowrs() {
        DefaultTableModel modelo = (DefaultTableModel) jTable1.getModel();
        System.out.println("Vista.Usuarios.CuadrarCaja.operacionFacturauPDATEandAddRowrs()operacionFacturauPDATEandAddRowrs: ");
        try {

            Double totalefectivo = 0.0;
            Double totalotro = 0.0;
            Double totalarqueo = 0.0;
            int row = jTable1.getModel().getRowCount();
            int col = jTable1.getModel().getColumnCount();

            for (int i = 0; i < row; i++) {
                Double cantidad = 0.0;

                if (!modelo.getValueAt(i, 1).toString().equalsIgnoreCase("")) {
                    cantidad = Double.valueOf(modelo.getValueAt(i, 1).toString().replace(",", "."));
                }

                if (i <= 10) {
                    valorMoneda(i);
                    totalefectivo = totalefectivo + valorbillete * cantidad;
                    txt_total_efectivo.setText(String.valueOf(String.format("%.4f", totalefectivo)).replace(",", "."));
                } else {
                    totalotro = totalotro + cantidad;
                    txt_total_otros.setText(String.valueOf(String.format("%.4f", totalotro)).replace(",", "."));
                }
                txt_total_arqueo.setText(String.valueOf(String.format("%.4f", totalotro + totalefectivo)).replace(",", "."));
                txt_total_arqueo.setText(String.valueOf(String.format("%.4f", totalotro + totalefectivo)).replace(",", "."));
                Double totalcaja = Double.parseDouble(txt_total_caja.getText().replace(",", "."));
                totalcaja = (totalotro + totalefectivo) - totalcaja;
                if (totalcaja < 0) {
                    txt_total_reultado.setBackground(Color.RED);
                } else {
                    txt_total_reultado.setBackground(Color.GREEN);
                }
                txt_total_reultado.setText(String.valueOf(String.format("%.4f", totalcaja)).replace(",", "."));

//               
//               txt_total_otros.setText(String.valueOf(String.format("%.4f", Ptotal)).replace(",", "."), i, 8);
//               txt_total_arqueo.setText(String.valueOf(String.format("%.4f", Ptotal)).replace(",", "."), i, 8);
//               
            }

        } catch (Exception e) {
            System.out.println("Vista.Usuarios.CuadrarCaja.operacionFacturauPDATEandAddRowrs(): " + e);
            // msg.setMensaje(e.toString());
        }
    }

    private void addOrDeleteRowTable(JTable table) {
        table.getModel().addTableModelListener(new TableModelListener() {

            @Override
            public void tableChanged(TableModelEvent e) {
                boolean esNUmero = false;
                if (e.getType() == TableModelEvent.UPDATE) {
                    int col = e.getColumn();
                    int fila = e.getFirstRow();
                    if (col == 1) {
                        if (!ValidaNUmeros.isOnlyDouble(jTable1.getValueAt(fila, 1).toString())) {
                            //   jTable1.setValueAt("0.0", fila, 1);
                        }
                        operacionFacturauPDATEandAddRowrs();
                        //  jTable1.setValueAt(fila, fila, 1);

                    }
                    // operacionFacturauPDATEandAddRowrs();
                }
                if (e.getType() == TableModelEvent.INSERT) {

                    operacionFacturauPDATEandAddRowrs();

                }
                if (e.getType() == TableModelEvent.DELETE) {

                }

            }
        });

    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {
        java.awt.GridBagConstraints gridBagConstraints;

        jPanel3 = new javax.swing.JPanel();
        jPanel7 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jPanel24 = new javax.swing.JPanel();
        jLabel14 = new javax.swing.JLabel();
        txt_total_efectivo = new javax.swing.JTextField();
        jPanel25 = new javax.swing.JPanel();
        jLabel15 = new javax.swing.JLabel();
        txt_total_otros = new javax.swing.JTextField();
        jPanel2 = new javax.swing.JPanel();
        jPanel17 = new javax.swing.JPanel();
        jLabel6 = new javax.swing.JLabel();
        txt_total_caja = new javax.swing.JTextField();
        jPanel21 = new javax.swing.JPanel();
        jLabel10 = new javax.swing.JLabel();
        txt_total_reultado = new javax.swing.JTextField();
        jPanel22 = new javax.swing.JPanel();
        jLabel11 = new javax.swing.JLabel();
        txt_total_arqueo = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        jCheckBox1 = new javax.swing.JCheckBox();
        jpContainer = new javax.swing.JPanel();

        setClosable(true);
        setTitle("CUADRE DE CAJA");

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null},
                {null, null},
                {null, null},
                {null, null},
                {null, null},
                {null, null}
            },
            new String [] {
                "DENOMINACION", "VALOR"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jTable1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                jTable1KeyTyped(evt);
            }
        });
        jScrollPane1.setViewportView(jTable1);

        jPanel24.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        jPanel24.setLayout(new java.awt.GridLayout());

        jLabel14.setText("TOTAL EFECTIVO");
        jPanel24.add(jLabel14);
        jPanel24.add(txt_total_efectivo);

        jPanel25.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        jPanel25.setLayout(new java.awt.GridLayout());

        jLabel15.setText("TOTAL OTROS ");
        jPanel25.add(jLabel15);
        jPanel25.add(txt_total_otros);

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "OTROS", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.TOP));
        jPanel2.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel17.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        jPanel17.setLayout(new java.awt.BorderLayout());

        jLabel6.setText("TOTAL CAJA");
        jPanel17.add(jLabel6, java.awt.BorderLayout.CENTER);

        txt_total_caja.setText("100.0");
        jPanel17.add(txt_total_caja, java.awt.BorderLayout.PAGE_END);

        jPanel2.add(jPanel17, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 60, 228, -1));

        jPanel21.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        jPanel21.setLayout(new java.awt.BorderLayout());

        jLabel10.setText("RESULTADO");
        jPanel21.add(jLabel10, java.awt.BorderLayout.CENTER);
        jPanel21.add(txt_total_reultado, java.awt.BorderLayout.PAGE_END);

        jPanel2.add(jPanel21, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 110, 228, -1));

        jPanel22.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        jPanel22.setLayout(new java.awt.BorderLayout());

        jLabel11.setText("TOTAL ARQUEO        ");
        jPanel22.add(jLabel11, java.awt.BorderLayout.CENTER);
        jPanel22.add(txt_total_arqueo, java.awt.BorderLayout.PAGE_END);

        jPanel2.add(jPanel22, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 20, 228, -1));

        jButton1.setBackground(new java.awt.Color(0, 153, 0));
        jButton1.setText("ACEPTAR VALORES");
        jPanel2.add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 160, 220, 40));

        jCheckBox1.setText("IMPRIMIR CUADRE");

        javax.swing.GroupLayout jPanel7Layout = new javax.swing.GroupLayout(jPanel7);
        jPanel7.setLayout(jPanel7Layout);
        jPanel7Layout.setHorizontalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE)
                    .addComponent(jPanel24, javax.swing.GroupLayout.DEFAULT_SIZE, 246, Short.MAX_VALUE)
                    .addComponent(jPanel25, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel7Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jCheckBox1)
                .addContainerGap())
        );
        jPanel7Layout.setVerticalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 362, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jPanel24, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel25, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, 208, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jCheckBox1)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel7, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addComponent(jPanel7, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(67, Short.MAX_VALUE))
        );

        jpContainer.setBorder(javax.swing.BorderFactory.createTitledBorder("Detalle de Movimientos de Caja"));

        javax.swing.GroupLayout jpContainerLayout = new javax.swing.GroupLayout(jpContainer);
        jpContainer.setLayout(jpContainerLayout);
        jpContainerLayout.setHorizontalGroup(
            jpContainerLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 1163, Short.MAX_VALUE)
        );
        jpContainerLayout.setVerticalGroup(
            jpContainerLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 753, Short.MAX_VALUE)
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jpContainer, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jpContainer, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jTable1KeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTable1KeyTyped
        // TODO add your handling code here:
        operacionFacturauPDATEandAddRowrs();
    }//GEN-LAST:event_jTable1KeyTyped


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JCheckBox jCheckBox1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JPanel jPanel17;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel21;
    private javax.swing.JPanel jPanel22;
    private javax.swing.JPanel jPanel24;
    private javax.swing.JPanel jPanel25;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JPanel jpContainer;
    private javax.swing.JTextField txt_total_arqueo;
    private javax.swing.JTextField txt_total_caja;
    private javax.swing.JTextField txt_total_efectivo;
    private javax.swing.JTextField txt_total_otros;
    private javax.swing.JTextField txt_total_reultado;
    // End of variables declaration//GEN-END:variables
}
