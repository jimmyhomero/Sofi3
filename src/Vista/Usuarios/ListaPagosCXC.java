/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista.Usuarios;

import ClasesAuxiliares.debug.Deb;
import ClasesAuxiliares.tablas.SetRenderJTableCXC;
import Controlador.Usuarios.ComprasDao;
import Controlador.Usuarios.FacturasDao;
import Controlador.Usuarios.HoraFecha;
import Controlador.Usuarios.cxcDao;
import Modelo.Clientes;
import Modelo.Cxc;
import Vlidaciones.ProgressBar;
import com.mxrck.autocompleter.AutoCompleterCallback;
import com.mxrck.autocompleter.TextAutoCompleter;
import java.awt.Dimension;
import java.awt.event.KeyEvent;
import java.util.ArrayList;
import java.util.Date;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author USUARIO
 */
public class ListaPagosCXC extends javax.swing.JInternalFrame {

    /**
     * Creates new form clientes
     */
    
    ArrayList<Clientes> listaClientes = new ArrayList<Clientes>();
    TextAutoCompleter clienteAutoCompleter;
    Clientes clienteseleccionadoAutocomplete = new Clientes();
    Integer clicJtable = -1;
    Integer rowSeleccionadaJTable = -1;
    Integer codigoCxcSeleccionada = -1;
    Cxc cxc1 = new Cxc();
    ProgressBar msg = new ProgressBar(3000, "");
    DefaultTableModel modelo = null;
    public static Integer indexPositiotoolBar;
    public static boolean restropagocxcCxpexitoso = false;

    public ListaPagosCXC() {
        initComponents();
        
        clienteAutoCompleter = new TextAutoCompleter(txt_xcliente, new AutoCompleterCallback() {

            @Override
            public void callback(Object selectedItem) {

                Clientes c = new Clientes();
                if (selectedItem instanceof Clientes) {

                    c = ((Clientes) selectedItem);
                    clienteseleccionadoAutocomplete = c;
                    txt_xcliente.setText(c.getNombre());
                    cxcDao cxcdao = new cxcDao();
                    modelo = cxcdao.getCxCnow(4, 0.0, c.getCodigo());
                    jTable1.setModel(modelo);
                    SetancocolumnasFIlasJtable();
                    //Deb.consola(((Clientes) selectedItem).getNombre() + " casas"); // Imprime 25
                } else {
                    Deb.consola("El item es de un tipo desconocido");
                }
                txt_xcliente.setText(c.getNombre());
            }
        });

        clienteAutoCompleter.setCaseSensitive(false);
        clienteAutoCompleter.setMode(0);

//this.setSize(1024, 720);
        String[] titulos
                = {"Codigo", "Fecha", "Numero de Factura", "Total",
                    "Vendedor", "Terminal",
                    "Cliente", "Ruc", "Estado"};

        modelo = new DefaultTableModel(null, titulos) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // make read only fields except column 0,13,14
                return column == 3 || column == 4 || column == 5 || column == 7;
                //  return false;
            }
        };
        jTable1.setModel(modelo);
        jTable1.setRowHeight(25);

        setFechayHoraActualJDChooser();
        FacturasDao obj = new FacturasDao();
        String fechaInicio = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserdesde.getDate().toString());
        String fechaFIn = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserhasta.getDate().toString());
        jTable1.setModel(obj.listarFacturasTbModel(fechaInicio, fechaFIn,"FACTURA"));

//this.setMaximum(true);
        cxcDao cxcdao = new cxcDao();
        modelo = cxcdao.getCxCnow(1, 0.0, 1);
        jTable1.setModel(modelo);
        SetRenderJTableCXC rendcxc = new SetRenderJTableCXC(6);
        jTable1.setDefaultRenderer(Object.class, rendcxc);
        this.SetancocolumnasFIlasJtable();
        
    }

    
    private void setFechayHoraActualJDChooser() {
        HoraFecha ob = new HoraFecha();
        ob.getHoraActualmyMachine();
        Date inicio = ob.fechaActual_00_00_00();
        Date fin = ob.fechaActual_23_59_59();
        jdchoserdesde.setDate(inicio);
        jdchoserhasta.setDate(fin);

    }
private void SetancocolumnasFIlasJtable() {
//        // JOptionPane.showMessageDialog(null,"acho col: "+ jTable1.getColumnModel().getColumn(0).getPreferredWidth());
//        jTable1.getColumnModel().getColumn(0).setMaxWidth(0);
//        jTable1.getColumnModel().getColumn(0).setMinWidth(0);
//        jTable1.getColumnModel().getColumn(0).setPreferredWidth(0);
//        jTable1.getColumnModel().getColumn(1).setMaxWidth(75);
//        jTable1.getColumnModel().getColumn(1).setMinWidth(45);
//        jTable1.getColumnModel().getColumn(1).setPreferredWidth(50);
//        jTable1.getColumnModel().getColumn(2).setMaxWidth(600);
//        jTable1.getColumnModel().getColumn(2).setMinWidth(100);
//        jTable1.getColumnModel().getColumn(2).setPreferredWidth(350);
//        jTable1.getColumnModel().getColumn(3).setPreferredWidth(80);
//        jTable1.getColumnModel().getColumn(4).setPreferredWidth(125);
//        jTable1.getColumnModel().getColumn(5).setPreferredWidth(100);
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
        jPanel3 = new javax.swing.JPanel();
        btn_hoy = new javax.swing.JButton();
        jdchoserdesde = new com.toedter.calendar.JDateChooser();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jdchoserhasta = new com.toedter.calendar.JDateChooser();
        btn_buscar = new javax.swing.JButton();
        jPanel4 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        txt_xcliente = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        txt_xMonto = new javax.swing.JTextField();
        jPanel6 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        txt_xnumeroFactura = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        jcb_formaPago = new javax.swing.JComboBox<>();
        jPanel2 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jPanel5 = new javax.swing.JPanel();

        setClosable(true);
        setIconifiable(true);
        setMaximizable(true);
        setResizable(true);

        jPanel1.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        jPanel3.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        btn_hoy.setText("HOY");
        btn_hoy.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_hoyActionPerformed(evt);
            }
        });

        jdchoserdesde.setDateFormatString("yyyy-MM-dd");
        jdchoserdesde.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jdchoserdesdeMouseClicked(evt);
            }
        });
        jdchoserdesde.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jdchoserdesdeKeyPressed(evt);
            }
        });

        jLabel4.setText("Desde:");

        jLabel5.setText("Hasta:");

        jdchoserhasta.setDateFormatString("yyyy-MM-dd");

        btn_buscar.setText("Buscar");
        btn_buscar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_buscarActionPerformed(evt);
            }
        });

        jPanel4.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        jLabel1.setText("Proveedor");

        txt_xcliente.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_xclienteActionPerformed(evt);
            }
        });
        txt_xcliente.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txt_xclienteKeyPressed(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_xclienteKeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txt_xclienteKeyTyped(evt);
            }
        });

        jLabel3.setText("Buscar por Monto");

        txt_xMonto.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_xMontoKeyReleased(evt);
            }
        });

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 230, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txt_xcliente, javax.swing.GroupLayout.PREFERRED_SIZE, 230, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txt_xMonto, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(44, Short.MAX_VALUE))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txt_xcliente, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(txt_xMonto, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel6.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        jLabel2.setText("Buscar por Numero de Factura");

        txt_xnumeroFactura.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_xnumeroFacturaKeyReleased(evt);
            }
        });

        jLabel6.setText("Buscar por Forma de Pago");

        jcb_formaPago.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jcb_formaPagoItemStateChanged(evt);
            }
        });

        javax.swing.GroupLayout jPanel6Layout = new javax.swing.GroupLayout(jPanel6);
        jPanel6.setLayout(jPanel6Layout);
        jPanel6Layout.setHorizontalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 184, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jcb_formaPago, 0, 231, Short.MAX_VALUE)
                    .addComponent(txt_xnumeroFactura)
                    .addGroup(jPanel6Layout.createSequentialGroup()
                        .addGap(4, 4, 4)
                        .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 189, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(23, Short.MAX_VALUE))
        );
        jPanel6Layout.setVerticalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txt_xnumeroFactura, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 15, Short.MAX_VALUE)
                .addComponent(jLabel6)
                .addGap(5, 5, 5)
                .addComponent(jcb_formaPago, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(jdchoserdesde, javax.swing.GroupLayout.PREFERRED_SIZE, 190, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(btn_hoy, javax.swing.GroupLayout.PREFERRED_SIZE, 82, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(jdchoserhasta, javax.swing.GroupLayout.PREFERRED_SIZE, 190, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(btn_buscar, javax.swing.GroupLayout.PREFERRED_SIZE, 82, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel4)
                            .addComponent(jLabel5))))
                .addGap(18, 18, 18)
                .addComponent(jPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jPanel6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(500, Short.MAX_VALUE))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGap(15, 15, 15)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jPanel6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addComponent(btn_hoy)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(btn_buscar, javax.swing.GroupLayout.PREFERRED_SIZE, 38, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addComponent(jLabel4)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jdchoserdesde, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(9, 9, 9)
                                .addComponent(jLabel5)
                                .addGap(13, 13, 13)
                                .addComponent(jdchoserhasta, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addComponent(jPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane1.setViewportView(jTable1);

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1)
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 511, Short.MAX_VALUE)
        );

        jPanel5.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        javax.swing.GroupLayout jPanel5Layout = new javax.swing.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 0, Short.MAX_VALUE)
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 46, Short.MAX_VALUE)
        );

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(jPanel5, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel5, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btn_hoyActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_hoyActionPerformed
        // TODO add your handling code here:
        setFechayHoraActualJDChooser();
        ComprasDao obj = new ComprasDao();
        String fechaInicio = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserdesde.getDate().toString());
        String fechaFIn = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserhasta.getDate().toString());
        jTable1.setModel(obj.listarComprasTbModelok(fechaInicio, fechaFIn));
        //this.ocultarFIlasJtable();
      //  sumartotales();
    }//GEN-LAST:event_btn_hoyActionPerformed

    private void jdchoserdesdeMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jdchoserdesdeMouseClicked
        // TODO add your handling code here:
        //jdchoserdesde
    }//GEN-LAST:event_jdchoserdesdeMouseClicked

    private void jdchoserdesdeKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jdchoserdesdeKeyPressed
        // TODO add your handling code here:
        if(evt.getKeyChar()==KeyEvent.VK_ENTER){
            if (jdchoserdesde.getDate().before(jdchoserhasta.getDate())) {

                ComprasDao obj = new ComprasDao();
                String fechaInicio = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserdesde.getDate().toString());
                String fechaFIn = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserhasta.getDate().toString());
                jTable1.setModel(obj.listarComprasTbModelok(fechaInicio, fechaFIn));
//                this.ocultarFIlasJtable();
  //              sumartotales();
            } else {
                msg.setProgressBar(3000, "Ranngo Errado!! Fecha de Inicio es Mayor a la del Final...");
            }
        }
    }//GEN-LAST:event_jdchoserdesdeKeyPressed

    private void btn_buscarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_buscarActionPerformed
        // TODO add your handling code here:
        if (jdchoserdesde.getDate().before(jdchoserhasta.getDate())) {

            ComprasDao obj = new ComprasDao();
            String fechaInicio = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserdesde.getDate().toString());
            String fechaFIn = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserhasta.getDate().toString());
            jTable1.setModel(obj.listarComprasTbModelok(fechaInicio, fechaFIn));
//            this.ocultarFIlasJtable();
  //          sumartotales();
        } else {
            msg.setProgressBar(3000, "Ranngo Errado!! Fecha de Inicio es Mayor a la del Final...");
        }
    }//GEN-LAST:event_btn_buscarActionPerformed

    private void txt_xclienteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_xclienteActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_xclienteActionPerformed

    private void txt_xclienteKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_xclienteKeyPressed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_xclienteKeyPressed

    private void txt_xclienteKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_xclienteKeyReleased
        // TODO add your handling code here:
        ComprasDao obj = new ComprasDao();
        jTable1.setModel(obj.Buscar_table_compras("CLIENTES.nombres", txt_xcliente.getText()));
    //    this.ocultarFIlasJtable();///
      //  sumartotales();
    }//GEN-LAST:event_txt_xclienteKeyReleased

    private void txt_xclienteKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_xclienteKeyTyped
        // TODO add your handling code here:
        //        ValidaNUmeros val = new ValidaNUmeros();
        //        val.keyTyped(evt);
    }//GEN-LAST:event_txt_xclienteKeyTyped

    private void txt_xMontoKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_xMontoKeyReleased
        // TODO add your handling code here:
        ComprasDao obj = new ComprasDao();
        jTable1.setModel(obj.Buscar_table_compras("compras.total", txt_xMonto.getText()));
        //this.ocultarFIlasJtable();
        //sumartotales();
        ///
    }//GEN-LAST:event_txt_xMontoKeyReleased

    private void txt_xnumeroFacturaKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_xnumeroFacturaKeyReleased
        // TODO add your handling code here:
        ComprasDao obj = new ComprasDao();
        jTable1.setModel(obj.Buscar_table_compras("compras.secuencia", txt_xnumeroFactura.getText()));
        //this.ocultarFIlasJtable();
        //sumartotales();
        ///
    }//GEN-LAST:event_txt_xnumeroFacturaKeyReleased

    private void jcb_formaPagoItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcb_formaPagoItemStateChanged
        // TODO add your handling code here:
        ComprasDao obj = new ComprasDao();
        jTable1.setModel(obj.Buscar_table_compras("compras.formaPago", evt.getItem().toString()));
        // this.ocultarFIlasJtable();///
        // sumartotales();

    }//GEN-LAST:event_jcb_formaPagoItemStateChanged


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btn_buscar;
    private javax.swing.JButton btn_hoy;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JComboBox<String> jcb_formaPago;
    private com.toedter.calendar.JDateChooser jdchoserdesde;
    private com.toedter.calendar.JDateChooser jdchoserhasta;
    private javax.swing.JTextField txt_xMonto;
    private javax.swing.JTextField txt_xcliente;
    private javax.swing.JTextField txt_xnumeroFactura;
    // End of variables declaration//GEN-END:variables
}
