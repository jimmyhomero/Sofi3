/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista.Usuarios;

import AA_MainPruebas.JtableconBotonesComprasMasivasRelacionPorductos;
import ClasesAuxiliares.Leertxt;
import ClasesAuxiliares.NewSql.Forms.OperacionesForms;
import ClasesAuxiliares.debug.Deb;
import Controlador.Usuarios.ClientesDao;
import Controlador.Usuarios.ComprasDao;
import Controlador.Usuarios.ProductosTempDao;
import Vista.Dialogs.BuscarProductosDialog;
import Modelo.Clientes;
import Modelo.ProductosTemp;
import Vista.Principal;

import Vlidaciones.ProgressBar;
import Vlidaciones.ValidaNUmeros;
import ecx.unomas.factura.Detalle;
import ecx.unomas.factura.Factura;
import ecx.unomas.service.Comprobante;
import java.awt.Dimension;
import java.awt.Frame;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;

/**
 *
 * @author USUARIO
 */
public class Modal_fac_electronica_relacionarProductos extends javax.swing.JInternalFrame {

    private static DefaultTableModel modelo = null;
    public static Integer codigoProducto = null;
    private static Integer codigoProveedor = null;
    public static String codigoAlternoProducto = null;
    public static String NombreProducto = null;
    JtableconBotonesComprasMasivasRelacionPorductos rendcxc = new JtableconBotonesComprasMasivasRelacionPorductos(4);

    /**
     * Creates new form clientes
     */
    public Modal_fac_electronica_relacionarProductos() {
        initComponents();
        jTable1.setModel(JtableconBotonesComprasMasivasRelacionPorductos.setTabla(jTable1));

        modelo = JtableconBotonesComprasMasivasRelacionPorductos.modelo;
        jTable1.setModel(modelo);

        //////////////COLORES
        jTable1.setDefaultRenderer(Object.class, rendcxc);

        //////////COLORES
        setAnchoColumnas();

    }

    private static TableColumnModel setAnchoColumnas() {
        TableColumnModel columnModel;
        columnModel = jTable1.getColumnModel();
        columnModel.getColumn(0).setPreferredWidth(100);
        columnModel.getColumn(0).setWidth(10);
        columnModel.getColumn(0).setMaxWidth(100);
        columnModel.getColumn(1).setMaxWidth(150);
        columnModel.getColumn(1).setPreferredWidth(150);
        columnModel.getColumn(2).setMaxWidth(200);
        columnModel.getColumn(2).setPreferredWidth(200);
        columnModel.getColumn(3).setMaxWidth(800);
        columnModel.getColumn(3).setPreferredWidth(800);
        columnModel.getColumn(4).setMaxWidth(200);
        columnModel.getColumn(4).setPreferredWidth(200);
        columnModel.getColumn(5).setMaxWidth(800);
        columnModel.getColumn(5).setPreferredWidth(800);
        columnModel.getColumn(6).setMaxWidth(200);
        columnModel.getColumn(6).setPreferredWidth(200);
        return columnModel;
    }

    public static boolean llenarCompraviaclaveAccesoVerificaExistenciadexxxxxxxx() {
        boolean ok = false;
        if (txtNumeroAutorizacion.getText().trim().length() == 49) {
            if (ValidaNUmeros.isOnlyNumbers(txtNumeroAutorizacion.getText()) && (txtNumeroAutorizacion.getText().trim().length() == 49)) {
                //limpiarIntefazVentas();
                {
                    OperacionesForms.solocrearFacturaNOgenerrarPDF = false;
                    // String rpta = "s";
                    String rpta = Leertxt.descargarXMLformSRItoFileXMLandPFDenUnSoloPasoEMITIDOSlista(txtNumeroAutorizacion.getText().trim());
                    if (!rpta.equalsIgnoreCase("error")) {
                        Factura f = new Factura();
                        f = Leertxt.facturaElectronica;
                        // Leertxt.registrarcompradesdesriconCLavedeAcceso(f);
                        txtRuc.setText(f.getRUC());
                        //  pROVE
                        txtDireccion.setText(f.getDirMatriz());
                        txtNombres.setText(f.getRazonSocial());
                        txtNumeroDocumento.setText(f.getEstab() + "-" + f.getPtoEmi() + "-" + f.getSecuencia());
                        //jdfecha.setDateFormatString(f.getFechaEmision());
                        txtFecahaEmision.setText(f.getFechaAutorizacion());
                        total_fac.setText(f.getImporteTotal().toString());
                        ///compras
                        ComprasDao facDao = new ComprasDao();
                        Clientes c = new Clientes();
                        ClientesDao cdao = new ClientesDao();
                        c = cdao.buscarConCedulaRUC(f.getRUC(), 1);
                        //FacturasDao facDao = new FacturasDao();
                        if (!c.getCedula().equalsIgnoreCase("XX")) {
                            codigoProveedor = c.getCodigo();
                            for (Detalle d : f.getDetalles()) {
                                modelo.addRow(facDao.Buscar_registrosfacxml_comprarX1(d, c.getCodigo()));

                            }
                            jTable1.setModel(modelo);
                            setAnchoColumnas();
                            ok = true;
                        } else {
                            JOptionPane.showMessageDialog(null, "Proveedor No existe, favor crearlo");
                            Crear_Clientes obj = new Crear_Clientes();
                            obj.setTitle("Nuevo Proveedor");
                            ///false valor por defeccto, para cleintes
                            obj.isllamadoDesdeNuevoProveedor = true;
                            obj.txt_cedulax.setText(f.getRUC());
                            OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), true);
                            ok = false;
                        }

                        ////
                        /// valida si exite registrador el proveedor
                    } else {
                        ProgressBar.mostrarMensajeAzul("SRI NO DEVOLVIO NADA..");
                        ok = false;
                        //txt_numAutorizacion.selectAll();
                    }

                }

            } else {
                ProgressBar.mostrarMensajeAzul("clave de acceso mal fomada");
                ok = false;
                /// txt_numAutorizacion.selectAll();
            }

        }
        return ok;
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
        jPanel4 = new javax.swing.JPanel();
        txtDireccion = new javax.swing.JLabel();
        txtNombres = new javax.swing.JLabel();
        txtRuc = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        total_fac = new javax.swing.JLabel();
        jPanel6 = new javax.swing.JPanel();
        txtFecahaEmision = new javax.swing.JLabel();
        txtNumeroDocumento = new javax.swing.JLabel();
        txtNumeroAutorizacion = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jPanel7 = new javax.swing.JPanel();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jPanel2 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jPanel5 = new javax.swing.JPanel();

        setClosable(true);
        setIconifiable(true);
        setMaximizable(true);
        setResizable(true);
        setTitle("registrofacElectronicaProductdosRelacionesdos");

        jPanel1.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        jPanel3.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        jPanel4.setBorder(javax.swing.BorderFactory.createTitledBorder(""));

        jLabel1.setText("RUC/CEDULA :");

        jLabel2.setText("NOMBRES: ");

        jLabel3.setText("DIRECCION");

        jLabel7.setText("TOTAL FACTURA");

        total_fac.setFont(new java.awt.Font("Tahoma", 1, 16)); // NOI18N

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addGroup(jPanel4Layout.createSequentialGroup()
                                .addComponent(jLabel3)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(txtDireccion, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                            .addGroup(jPanel4Layout.createSequentialGroup()
                                .addComponent(jLabel1)
                                .addGap(32, 32, 32)
                                .addComponent(txtRuc, javax.swing.GroupLayout.PREFERRED_SIZE, 254, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel4Layout.createSequentialGroup()
                                .addComponent(jLabel2)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(txtNombres, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addComponent(jLabel7)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(total_fac, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                .addContainerGap())
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(txtRuc, javax.swing.GroupLayout.PREFERRED_SIZE, 16, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel2)
                    .addComponent(txtNombres, javax.swing.GroupLayout.PREFERRED_SIZE, 16, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel3)
                    .addComponent(txtDireccion, javax.swing.GroupLayout.PREFERRED_SIZE, 16, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addComponent(jLabel7)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addComponent(total_fac, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );

        jPanel6.setBorder(javax.swing.BorderFactory.createTitledBorder(""));

        jLabel4.setText("NUMERO AUTORIZACION");

        jLabel5.setText("NUMERO DOCUMENTO");

        jLabel6.setText("FECHA EMISION");

        javax.swing.GroupLayout jPanel6Layout = new javax.swing.GroupLayout(jPanel6);
        jPanel6.setLayout(jPanel6Layout);
        jPanel6Layout.setHorizontalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addComponent(jLabel6)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(txtFecahaEmision, javax.swing.GroupLayout.PREFERRED_SIZE, 238, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(68, 68, 68))
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addComponent(jLabel4)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtNumeroAutorizacion, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGap(37, 37, 37))
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addComponent(jLabel5)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(txtNumeroDocumento, javax.swing.GroupLayout.PREFERRED_SIZE, 175, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(94, 94, 94))
        );
        jPanel6Layout.setVerticalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel6Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jLabel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(txtNumeroAutorizacion, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel5)
                    .addComponent(txtNumeroDocumento, javax.swing.GroupLayout.PREFERRED_SIZE, 16, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel6)
                    .addComponent(txtFecahaEmision, javax.swing.GroupLayout.PREFERRED_SIZE, 16, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel7.setBorder(javax.swing.BorderFactory.createTitledBorder(""));

        jButton1.setText("CONVERTIR COMPRA");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jButton2.setText("VER RIFE");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jButton3.setText("NEEVO PRODUCTO");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel7Layout = new javax.swing.GroupLayout(jPanel7);
        jPanel7.setLayout(jPanel7Layout);
        jPanel7Layout.setHorizontalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jButton1, javax.swing.GroupLayout.DEFAULT_SIZE, 187, Short.MAX_VALUE)
                    .addComponent(jButton3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButton2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap(27, Short.MAX_VALUE))
        );
        jPanel7Layout.setVerticalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel7Layout.createSequentialGroup()
                .addComponent(jButton1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButton3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButton2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGap(15, 15, 15))
        );

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addComponent(jPanel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jPanel6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel7, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jPanel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jPanel7, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addComponent(jPanel6, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );

        jPanel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        jTable1.setFont(new java.awt.Font("Tahoma", 1, 15)); // NOI18N
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
        jTable1.setRowHeight(25);
        jTable1.setSelectionForeground(new java.awt.Color(255, 0, 255));
        jTable1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTable1MouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(jTable1);

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.TRAILING)
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 531, Short.MAX_VALUE)
                .addContainerGap())
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
            .addComponent(jPanel5, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGap(7, 7, 7))
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
public static void lanzarBuscarProducto() {

    }
    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        // TODO add your handling code here:   Frame framec = JOptionPane.getFrameForComponent(Modal_fac_electronica_relacionarProductos);
        Integer fila = jTable1.getSelectedRow();
        Integer colcodgoAlterno = 4;
        Integer colnombreProducto = 5;

        for (int i = 0; i < jTable1.getRowCount(); i++) {
            if (jTable1.getValueAt(i, 4).toString().trim().equals("") || jTable1.getValueAt(i, 5).toString().trim().equalsIgnoreCase("")) {
                jTable1.setValueAt("NA", i, 4);
                jTable1.setValueAt("NA", i, 5);
            }
        }

        if (evt.getClickCount() == 2) {
            if (jTable1.getSelectedRow() != -1) {
                // remove selected row from the model
                if (jTable1.getRowCount() > 0) {
                    if (jTable1.getSelectedColumn() == 6) {
                        Frame framec = JOptionPane.getFrameForComponent(this);
                        BuscarProductosDialog pcd = new BuscarProductosDialog(framec, true);
                        pcd.setLocationRelativeTo(null);
                        pcd.setVisible(true);
                        for (int i = 0; i < jTable1.getRowCount(); i++) {
                            if (jTable1.getValueAt(i, 4).toString().equals("") || jTable1.getValueAt(i, 5).toString().equalsIgnoreCase("")) {
                                jTable1.setValueAt("NA", i, 4);
                                jTable1.setValueAt("NA", i, 5);
                                Deb.consola("::::::::::::::::::::::::::::YYYYYYYYYYYYYYYYYY:::::::::::::::::::::::::::::::::");
                            }
                        }
                        if ((jTable1.getValueAt(fila, colcodgoAlterno).equals("NA") && jTable1.getValueAt(fila, colnombreProducto).equals("NA")) || (jTable1.getValueAt(fila, colcodgoAlterno).equals("") && jTable1.getValueAt(fila, colnombreProducto).equals(""))) {
                            if (codigoAlternoProducto != "NA") {
                                jTable1.setValueAt(codigoAlternoProducto, fila, colcodgoAlterno);
                                jTable1.setValueAt(NombreProducto, fila, colnombreProducto);
                                ProductosTemp pt = new ProductosTemp();
                                ProductosTempDao ptDao = new ProductosTempDao();
                                pt.setCodigoProductoI(jTable1.getValueAt(fila, 4).toString());
                                pt.setNombreI(jTable1.getValueAt(fila, 5).toString());
                                pt.setCodigoProductoE(jTable1.getValueAt(fila, 2).toString());
                                pt.setNombreE(jTable1.getValueAt(fila, 3).toString());
                                pcd.txt_NombreProducto.setText(jTable1.getValueAt(fila, 3).toString());
                                pt.setCodigoProveedor(codigoProveedor);
                                Double costo = Double.parseDouble(jTable1.getValueAt(fila, 1).toString().replace(",", "."));
                                pt.setCosto(Double.parseDouble(String.format("%.3f", costo).replace(",", ".")));
                                //modelo.setValueAt(String.valueOf(String.format("%.3f", Ptotal)).replace(",", "."), i, 8);
                                pt.setFechaCompra(txtFecahaEmision.getText());

                                ptDao.guardar(pt);
                            }

                        } else {
                            if (codigoAlternoProducto != "NA") {
                                jTable1.setValueAt(codigoAlternoProducto, fila, colcodgoAlterno);
                                jTable1.setValueAt(NombreProducto, fila, colnombreProducto);
                                ProductosTemp pt = new ProductosTemp();
                                ProductosTempDao ptDao = new ProductosTempDao();
                                pt.setCodigoProductoI(jTable1.getValueAt(fila, 4).toString());
                                pt.setNombreI(jTable1.getValueAt(fila, 5).toString());
                                pt.setCodigoProductoE(jTable1.getValueAt(fila, 2).toString());
                                pt.setNombreE(jTable1.getValueAt(fila, 3).toString());
                                pt.setCodigoProveedor(codigoProveedor);
                                Double costo = Double.parseDouble(jTable1.getValueAt(fila, 1).toString().replace(",", "."));
                                pt.setCosto(Double.parseDouble(String.format("%.3f", costo).replace(",", ".")));
                                pt.setFechaCompra(txtFecahaEmision.getText());
                                Deb.consola("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTÑ : " + jTable1.getValueAt(fila, 7).toString());
                                pt.setCodigo(Integer.parseInt(jTable1.getValueAt(fila, 7).toString()));

                                ptDao.modificar(pt);
                            }

                        }
                            for (int i = 0; i < jTable1.getRowCount(); i++) {
                            if (jTable1.getValueAt(i, 4).toString().equals("") || jTable1.getValueAt(i, 5).toString().equalsIgnoreCase("")) {
                                jTable1.setValueAt("NA", i, 4);
                                jTable1.setValueAt("NA", i, 5);
                                Deb.consola("::::::::::::::::::::::::::::YYYYYYYYYYYYYYYYYY:::::::::::::::::::::::::::::::::");
                            }
                        }
                        ////pinta de color la fila que este el codigo repetido
                        
                        jTable1.setDefaultRenderer(Object.class, rendcxc);
                    }

                }
            }
        }


    }//GEN-LAST:event_jTable1MouseClicked

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
                        for (int i = 0; i < jTable1.getRowCount(); i++) {
                            if (jTable1.getValueAt(i, 4).toString().trim().equals("") || jTable1.getValueAt(i, 5).toString().trim().equals("")) {
                                jTable1.setValueAt("NA", i, 4);
                                jTable1.setValueAt("NA", i, 5);
                                Deb.consola("::::::::::::::::::::::::::::YYYYYYYYYYYYYYYYYY:::::::::::::::::::::::::::::::::");
                            }
        }
                
        Integer fallas = 0;
        for (int i = 0; i < jTable1.getRowCount(); i++) {

            if (jTable1.getValueAt(i, 4).toString().equalsIgnoreCase("NA") || jTable1.getValueAt(i, 5).toString().equalsIgnoreCase("NA")) {
                fallas++;
            }

        }

        if (fallas == 0) {

            Modal_Crear_compras mcc = new Modal_Crear_compras();
            mcc.txt_numAutorizacion.setText(txtNumeroAutorizacion.getText().trim());
            mcc.llenarCompraviaclaveAccesoVerificaExistenciadePRoveedor();
            OperacionesForms.nuevaVentanaInternalForm(mcc, mcc.getTitle(), true);

        } else {
            ProgressBar.mostrarMensajeAzul("PARA CONTINUAR DEBE REACIONAR TODOS LOS ITEMS");
        }

    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:
        OperacionesForms.solocrearFacturaNOgenerrarPDF = true;
        Leertxt.descargarXMLformSRItoFileXMLandPFDenUnSoloPasoclickjtable(txtNumeroAutorizacion.getText());

        String file = OperacionesForms.rutadocPDFgeneradook;//Config.AUTORIZADOS_DIR +claveAcceso + ".pdf";
        JOptionPane.showMessageDialog(null, file);
        //definiendo la ruta en la propiedad file
        try {
            Deb.consola("ruta file pdf:  " + file);
            Runtime.getRuntime().exec("cmd /c start " + file);
        } catch (Exception e) {
            ProgressBar.mostrarMensajeRojo("Error al abrir el PDF :" + e.toString());
        }
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        // TODO add your handling code here:
        Crear_Productos obj = new Crear_Productos();
        OperacionesForms.nuevaVentanaInternalForm(obj, obj.getTitle(), false);
    }//GEN-LAST:event_jButton3ActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JScrollPane jScrollPane1;
    public static javax.swing.JTable jTable1;
    public static javax.swing.JLabel total_fac;
    public static javax.swing.JLabel txtDireccion;
    public static javax.swing.JLabel txtFecahaEmision;
    public static javax.swing.JLabel txtNombres;
    public static javax.swing.JLabel txtNumeroAutorizacion;
    public static javax.swing.JLabel txtNumeroDocumento;
    public static javax.swing.JLabel txtRuc;
    // End of variables declaration//GEN-END:variables
}
