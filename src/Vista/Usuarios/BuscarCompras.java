/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista.Usuarios;

import ClasesAuxiliares.Exporter;
import Controlador.Ejemplo;
import ClasesAuxiliares.debug.Deb;
import Controlador.ComitsAll;
import Controlador.Usuarios.ClientesDao;
import Controlador.Usuarios.ComprasDao;
import Controlador.Usuarios.DetalleComprasDao;
import Controlador.Usuarios.DetalleFacturaDao;
import Controlador.Usuarios.FormasPagoCVDao;
import Controlador.Usuarios.HoraFecha;
import Controlador.Usuarios.ImpresionDao;
import Controlador.Usuarios.MarcasDao;
import Controlador.Usuarios.ModelosDao;
import Controlador.Usuarios.ProductosDao;
import Controlador.Usuarios.ProveedoresDao;
import Controlador.Usuarios.RetencionCDao;
import Modelo.Clientes;
import Modelo.Compras;
import Modelo.DetalleCompra;
import Modelo.Facturas;
import Modelo.FormasPagoCV;
import Modelo.FormasPagoV;
import Modelo.Kardex;
import Modelo.Marcas;
import Modelo.Modelos;
import Modelo.Proveedores;
import Vista.Principal;
import Vlidaciones.ProgressBar;
import com.toedter.calendar.JDateChooser;
import java.awt.event.KeyEvent;
import java.awt.event.MouseEvent;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.jdatepicker.impl.JDatePanelImpl;
import org.jdatepicker.impl.JDatePickerImpl;
import org.jdatepicker.impl.UtilDateModel;

/**
 *
 * @author USUARIO
 */
public class BuscarCompras extends javax.swing.JInternalFrame {

    /**
     * Creates new form FBUsuarios
     */
    Integer clicJtable = 0;
    public static boolean buscaCompradesderegistrarRetencion = false;
    ArrayList<FormasPagoCV> listaFormasDePago = new ArrayList<FormasPagoCV>();
    Compras compra1 = new Compras();
    ProgressBar msg = new ProgressBar(3000, "");
    DefaultTableModel modelo = null;
    public static Integer indexPositiotoolBar;
    Integer codigoSeleccionado = null;
    //String sql_allss = "select * from usuarios";
    // String sql_all = "select usuarios.*,tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo order BY usuarios.Nombres LIMIT 0, 50";

    //CUsuarios obj = new CUsuarios();
    public BuscarCompras() {

        initComponents();
        this.setSize(1024, 720);
        FormasPagoCV fp = new FormasPagoCV();
        FormasPagoCVDao objFdPDao = new FormasPagoCVDao();
        listaFormasDePago = objFdPDao.listar();
        for (FormasPagoCV f : listaFormasDePago) {
            jcb_formaPago.addItem(f.getFormaPago());
        }
        String[] titulos
                = {"Codigo", "Fecha", "Numero de Factura", "Total",
                    "Vendedor", "Terminal",
                    "Provvedor", "Ruc", "Estado"};

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
        ComprasDao obj = new ComprasDao();
        String fechaInicio = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserdesde.getDate().toString());
        String fechaFIn = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserhasta.getDate().toString());
        jTable1.setModel(obj.listarComprasTbModelok(fechaInicio, fechaFIn));
        this.ocultarFIlasJtable();
        sumartotales();

    }

    private void sumartotales() {
        Integer filas = jTable1.getRowCount();
        Double total = 0.0;
        Double cantidad = 0.0;

        for (int j = 0; j < filas; j++) {
            cantidad = Double.parseDouble(jTable1.getValueAt(j, 3).toString());
            total = total + cantidad;
        }
        txt_total.setText(String.format("%.2f", total).replace(",", "."));
    }

    private void setFechayHoraActualJDChooser() {
        HoraFecha.getHoraActualmyMachine();
        Date inicio = HoraFecha.fechaActual_00_00_00();
        Date fin = HoraFecha.fechaActual_23_59_59();
        jdchoserdesde.setDate(inicio);
        jdchoserhasta.setDate(fin);

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
        jdchoserdesde = new com.toedter.calendar.JDateChooser();
        jdchoserhasta = new com.toedter.calendar.JDateChooser();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        btn_hoy = new javax.swing.JButton();
        btn_buscar = new javax.swing.JButton();
        fec = new javax.swing.JLabel();
        jPanel3 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        txt_xcliente = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        txt_xMonto = new javax.swing.JTextField();
        jPanel4 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        txt_xnumeroFactura = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        jcb_formaPago = new javax.swing.JComboBox<>();
        jPanel2 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        btn_Eliminar = new javax.swing.JButton();
        btn_mostrarAll1 = new javax.swing.JButton();
        btn_excel = new javax.swing.JButton();
        jLabel7 = new javax.swing.JLabel();
        txt_total = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();

        setClosable(true);
        setMaximizable(true);
        setResizable(true);
        setTitle("Buscar Compras");
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

        jdchoserhasta.setDateFormatString("yyyy-MM-dd");

        jLabel4.setText("Desde:");

        jLabel5.setText("Hasta:");

        btn_hoy.setText("HOY");
        btn_hoy.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_hoyActionPerformed(evt);
            }
        });

        btn_buscar.setText("Buscar");
        btn_buscar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_buscarActionPerformed(evt);
            }
        });

        jPanel3.setBorder(javax.swing.BorderFactory.createEtchedBorder());

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

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 230, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txt_xcliente, javax.swing.GroupLayout.PREFERRED_SIZE, 230, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txt_xMonto, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(44, Short.MAX_VALUE))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txt_xcliente, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(txt_xMonto, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        jPanel4.setBorder(javax.swing.BorderFactory.createEtchedBorder());

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

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 184, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jcb_formaPago, 0, 231, Short.MAX_VALUE)
                    .addComponent(txt_xnumeroFactura)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addGap(4, 4, 4)
                        .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 189, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(23, Short.MAX_VALUE))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txt_xnumeroFactura, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel6)
                .addGap(5, 5, 5)
                .addComponent(jcb_formaPago, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel4)
                    .addComponent(jdchoserdesde, javax.swing.GroupLayout.PREFERRED_SIZE, 190, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel5)
                    .addComponent(jdchoserhasta, javax.swing.GroupLayout.PREFERRED_SIZE, 190, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(10, 10, 10)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(btn_hoy, javax.swing.GroupLayout.PREFERRED_SIZE, 82, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btn_buscar, javax.swing.GroupLayout.PREFERRED_SIZE, 82, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(10, 10, 10)
                        .addComponent(fec, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(10, 10, 10)
                .addComponent(jPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(10, 10, 10)
                        .addComponent(jLabel4)
                        .addGap(4, 4, 4)
                        .addComponent(jdchoserdesde, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(8, 8, 8)
                        .addComponent(jLabel5)
                        .addGap(4, 4, 4)
                        .addComponent(jdchoserhasta, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(30, 30, 30)
                        .addComponent(btn_hoy)
                        .addGap(15, 15, 15)
                        .addComponent(btn_buscar, javax.swing.GroupLayout.PREFERRED_SIZE, 38, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(80, 80, 80)
                        .addComponent(fec, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(10, 10, 10)
                        .addComponent(jPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder("Listar Productos"));

        jScrollPane1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jScrollPane1MouseClicked(evt);
            }
        });

        jTable1.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jTable1.setColumnSelectionAllowed(true);
        jTable1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTable1MouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(jTable1);
        jTable1.getColumnModel().getSelectionModel().setSelectionMode(javax.swing.ListSelectionModel.SINGLE_SELECTION);

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1)
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 600, Short.MAX_VALUE)
        );

        btn_Eliminar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/ShowAll.png"))); // NOI18N
        btn_Eliminar.setText("Mostrar Todo");
        btn_Eliminar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_MostrarTodoActionPerformed(evt);
            }
        });

        btn_mostrarAll1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/deleteUser.png"))); // NOI18N
        btn_mostrarAll1.setText("Eliminar");
        btn_mostrarAll1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_EliminarActionPerformed(evt);
            }
        });

        btn_excel.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/icons8-MS Excel-48.png"))); // NOI18N
        btn_excel.setText("Excel");
        btn_excel.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_excelActionPerformed(evt);
            }
        });

        txt_total.setEditable(false);

        jLabel8.setText("TOTAL COMPRAS");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGap(9, 9, 9))
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(10, 10, 10)
                        .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(33, 33, 33)
                        .addComponent(btn_mostrarAll1, javax.swing.GroupLayout.PREFERRED_SIZE, 160, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(btn_Eliminar, javax.swing.GroupLayout.PREFERRED_SIZE, 180, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(btn_excel, javax.swing.GroupLayout.PREFERRED_SIZE, 170, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(txt_total)
                            .addComponent(jLabel8, javax.swing.GroupLayout.DEFAULT_SIZE, 153, Short.MAX_VALUE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel7, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(0, 171, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(10, 10, 10)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 138, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(31, 31, 31)
                        .addComponent(jLabel7, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(btn_excel, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(btn_Eliminar, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(btn_mostrarAll1, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(5, 5, 5)
                        .addComponent(jLabel8)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txt_total, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void txt_xclienteKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_xclienteKeyPressed
        // TODO add your handling code here:

    }//GEN-LAST:event_txt_xclienteKeyPressed

    private void ocultarFIlasJtable() {

//        jTable1.getColumnModel().getColumn(0).setMaxWidth(0);
//        jTable1.getColumnModel().getColumn(0).setMinWidth(0);
//        jTable1.getColumnModel().getColumn(0).setPreferredWidth(0);
//        jTable1.getColumnModel().getColumn(7).setMaxWidth(0);
//        jTable1.getColumnModel().getColumn(7).setMinWidth(0);
//        jTable1.getColumnModel().getColumn(7).setPreferredWidth(0);
    }

    private void txt_xclienteKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_xclienteKeyReleased
        // TODO add your handling code here:
        ComprasDao obj = new ComprasDao();
        jTable1.setModel(obj.Buscar_table_compras("CLIENTES.nombres", txt_xcliente.getText()));
        this.ocultarFIlasJtable();///
        sumartotales();

    }//GEN-LAST:event_txt_xclienteKeyReleased

    private void txt_xnumeroFacturaKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_xnumeroFacturaKeyReleased
        // TODO add your handling code here:
        ComprasDao obj = new ComprasDao();
        jTable1.setModel(obj.Buscar_table_compras("compras.secuencia", txt_xnumeroFactura.getText()));
        this.ocultarFIlasJtable();
        sumartotales();
        ///
    }//GEN-LAST:event_txt_xnumeroFacturaKeyReleased

    private void txt_xMontoKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_xMontoKeyReleased
        // TODO add your handling code here:
        ComprasDao obj = new ComprasDao();
        jTable1.setModel(obj.Buscar_table_compras("compras.total", txt_xMonto.getText()));
        this.ocultarFIlasJtable();
        sumartotales();
        ///
    }//GEN-LAST:event_txt_xMontoKeyReleased

    private Integer llenarjcbSelectedItemMarca(String name) {
        Integer codigo_Mrca = null;
        //Productos onj = new Productos();
        MarcasDao objDao = new MarcasDao();
        ArrayList<Marcas> lista = new ArrayList<Marcas>();
        lista = (ArrayList<Marcas>) objDao.listar();
        for (Marcas marca1 : lista) {
            if (marca1.getMarca().equals(name)) {
                codigo_Mrca = marca1.getCodigo();
                Object ob;
                ob = name;
                //Crear_Usuarios.jcb_tipo.setSelectedItem(0);
                Crear_Productos.setItemSelectMarcas = ob;

                //    Deb.consola("Vista.Usuarios.Buscar_usuarios.llenarjcbSelectedItem()" + tipo_Usuario.getTipo());
            }

        }

        return codigo_Mrca;
    }

    private Integer llenarjcbSelectedItemModelo(String name) {
        Integer codigo_Modelo = null;
        //Productos onj = new Productos();
        ModelosDao objDao = new ModelosDao();
        ArrayList<Modelos> lista = new ArrayList<Modelos>();
        lista = (ArrayList<Modelos>) objDao.listar();
        for (Modelos obj2 : lista) {
            if (obj2.getModelo().equals(name)) {
                codigo_Modelo = obj2.getCodigo();
                Object ob;
                ob = name;
                //Crear_Usuarios.jcb_tipo.setSelectedItem(0);
                Crear_Productos.setItemSelectModelo = ob;

                //  Deb.consola("Vista.Usuarios.Buscar_usuarios.llenarjcbSelectedItem()" + mode.getTipo());
            }

        }

        return codigo_Modelo;
    }

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        // TODO add your handling code here:
        JTable table = (JTable) evt.getSource();
        clicJtable = 1;
        this.modelo = (DefaultTableModel) jTable1.getModel();
        int row = jTable1.getSelectedRow();
        int col = jTable1.getSelectedColumn();
        modelo = (DefaultTableModel) jTable1.getModel();
        Deb.consola("row: " + row);
        Deb.consola("col: " + col);
        codigoSeleccionado = Integer.parseInt(modelo.getValueAt(row, 0).toString());
        Deb.consola("Vista.Usuarios.BuscarFacturas.jTable1MouseClicked()codiggo>:" + modelo.getValueAt(row, 0));
        Deb.consola("Vista.Usuarios.BuscarFacturas.jTable1MouseClicked()codigo seleccionado: " + codigoSeleccionado);
        if (evt.getClickCount() == 2) {
            Compras fac = new Compras();
            ComprasDao facDao = new ComprasDao();
            fac = facDao.buscarConID(codigoSeleccionado);
            compra1 = fac;
            RetencionCDao r = new RetencionCDao();
            Boolean existe = r.Buscar_siExisteRetenciondelDocumento(compra1.getSecuencia());

            if (buscaCompradesderegistrarRetencion == true && existe == false) {
                ClientesDao pbDao = new ClientesDao();
                Clientes p = new Clientes();
                Crear_RetencionC.proveerdor = p = pbDao.buscarConID(compra1.getProveedores_codigo(),1);
                Crear_RetencionC.tProveedor.setText(p.getNombre());
                Crear_RetencionC.tRUc.setText(p.getCedula());
                Crear_RetencionC.txtSec1Compra.setText(compra1.getSecuencia());
                Crear_RetencionC.jdfechacaducidadFac.setDate(compra1.getFecha());
                Crear_RetencionC.compra = compra1;
                Double base = Double.parseDouble(compra1.getSubtotaI_con_iva()) + Double.parseDouble(compra1.getSubtotal_sin_iva());
                Crear_RetencionC.txtBaseFac.setText(String.valueOf(base));
                Crear_RetencionC.txtIvaFac.setText(compra1.getIva_valor());
                buscaCompradesderegistrarRetencion = false;
                Crear_RetencionC.jButton1.setEnabled(false);
                Crear_RetencionC.tsec1.setEnabled(false);
                Crear_RetencionC.tsec2.setEnabled(false);
                Crear_RetencionC.tsec3.setEnabled(false);
                Crear_RetencionC.jdfechacaducidadFac.setEnabled(false);
                Crear_RetencionC.txtSec1Compra.setEnabled(false);
                Crear_RetencionC.jcbtipoDocumento.setSelectedItem(compra1.getTipo_documento());
                buscaCompradesderegistrarRetencion = false;

                dispose();
            } else {
                if (existe) {
                    JOptionPane.showMessageDialog(null, "ya existe una retencion registrada sobre esa factura!!", "Retenicion ya Existe", 3);
                }

            }
        }

        if (evt.getButton() == MouseEvent.BUTTON1) {
            Deb.consola("BOTON 1");
            Deb.consola("Vista.Usuarios.BuscarFacturas.jTable1MouseClicked()secuecnaia  :" + modelo.getValueAt(row, 2).toString());
            // operacionFacturauPDATEandAddRowrs();
        }
        if (evt.getButton() == MouseEvent.BUTTON2) {
            Deb.consola("BOTON 2");
        }
        if (evt.getButton() == MouseEvent.BUTTON3) {
            Deb.consola("BOTON 3");
        }
        try {
            Deb.consola("Vista.Usuarios.BuscarFacturas.jTable1MouseClicked()secuecnaia  :" + modelo.getValueAt(row, 2).toString());
            if (evt.getClickCount() == 2) {

                if (jTable1.getSelectedRow() != -1) {
                    // remove selected row from the model
                    if (jTable1.getRowCount() > 0) {
////////////////
////////////////                        String rutaInforme = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\FACTURA.jasper";
////////////////                        Map parametros = new HashMap();
////////////////                        parametros.put("numeroFactura", modelo.getValueAt(row, 2).toString());
////////////////                        Deb.consola("Vista.Usuarios.BuscarFacturas.jTable1MouseClicked()secuecnaia  :" + modelo.getValueAt(row, 2).toString());
////////////////                        //JOptionPane.showConfirmDialog(rootPane, a +"--"+b);
////////////////                        ImpresionDao imp = new ImpresionDao();
////////////////                        imp.impresionShowReport(parametros, rutaInforme);

                        ///eliminamos la fila seleccionada y actualizamos el total de la factura
                        //int row = jTable1.getSelectedRow();
////////////////
////////////////                        Crear_Usuarios.actualizarSiNO = "si";
////////////////                        //Double clicked
////////////////                        Clientes cli = new Clientes();
////////////////                        ClientesDao cliDao = new ClientesDao();
////////////////                        cli = cliDao.buscarConID(fac.getUsuarios_Codigo());
////////////////                        Usuarios usu = new Usuarios();
////////////////                        UsuariosDao usuDao = new UsuariosDao();
////////////////                        usu = usuDao.buscarConID(fac.getUsuarios_Codigo());
////////////////                        cli = cliDao.buscarConID(fac.getUsuarios_Codigo());
////////////////                        DetalleFactura df = new DetalleFactura();
////////////////                        DetalleFacturaDao dfDao = new DetalleFacturaDao();
////////////////                        Crear_Facturas obj_crea = new Crear_Facturas();
////////////////                        //lleno el fomulario 
////////////////                        obj_crea.txt_cedula.setText(String.valueOf(cli.getCedula()));
////////////////                        obj_crea.txt_celular.setText(cli.getCelular());
////////////////                        obj_crea.txt_dir.setText(cli.getDireccion());
////////////////                        obj_crea.txt_hora.setText("");
////////////////                        obj_crea.txt_nombres.setText(cli.getNombre());
//                        //obj_crea.txt_sec1.setText(fac.getSecuencia());
//                        obj_crea  .setText(usuario.getMaximo());
//                        obj_crea.txt_maximos.setText(usuario.getMinimo());
//                        obj_crea.txt_observacion.setText(usuario.getObservacion());
//                        obj_crea.txt_pvp.setText(usuario.getPvp());
//                        obj_crea.txt_percha.setText(usuario.getUbicacion());
//                        obj_crea.txt_unidades.setText(usuario.getUnidades());
//                        obj_crea.txt_utilidad.setText(usuario.getUtilidad());
//                        Double costo = Double.valueOf(modelo.getValueAt(row, 0).toString().replace(",", "."));
//                        Double cantidad = Double.valueOf(modelo.getValueAt(row, 4).toString().replace(",", "."));
//                        Double Ptotal = Double.valueOf(modelo.getValueAt(row, 8).toString().replace(",", "."));
//                        Double costoxFila = costo * cantidad;
//                        Double totaltemp = Double.valueOf(txt_total.getText().toString().replace(",", "."));
//                        Double Utilidadtemp = Double.valueOf(txt_utilidad.getText().toString().replace(",", "."));
//
//                        total = totaltemp - Double.valueOf(jTable1.getValueAt(row, 8).toString().replace(",", "."));
//                        utilidad = Utilidadtemp - (Ptotal - costoxFila);
//                        //Double.valueOf(modelo.getValueAt(row, 7).toString().replace(",", "."));
//                        //txt_pvp.setText(String.valueOf(String.format("%.4f", pvp1)));
//                        txt_total.setText(String.valueOf(String.format("%.4f", total)).replace(",", "."));
//                        txt_total_.setText(String.valueOf(String.format("%.4f", total)).replace(",", "."));
//                        txt_utilidad.setText(String.valueOf(String.format("%.4f", utilidad)).replace(",", "."));
//                        Double ivadecimal = (this.iva / 100) + 1;
//                        subtotal = total / ivadecimal;
//                        txt_subtotal.setText(String.valueOf(String.format("%.4f", subtotal)).replace(",", "."));
//                        txt_subtotalIvaValor.setText(String.valueOf(String.format("%.4f", subtotal)).replace(",", "."));
//
//                        modelo.removeRow(row);
                    }

                }
            }
        } catch (Exception e) {
            msg.setMensaje(e.toString());
        }

        if (evt.getClickCount() == 2) {
//llenasmos JCBOX marcas        
            Marcas obj = new Marcas();
            MarcasDao a = new MarcasDao();
//            obj = a.buscarConID(usuario.getModelos_marcas_codigo());
            Crear_Productos.setItemSelectMarcas = obj.getMarca();
            //this.llenarjcbSelectedItemMarca(obj.getMarca());
//llenasmos JCBOX Modelos
            Modelos objm = new Modelos();
            ModelosDao abjmDao = new ModelosDao();
            //          objm = abjmDao.buscarConID(usuario.getModelo_codigo());
            Crear_Productos.setItemSelectModelo = objm.getModelo();
            //this.llenarjcbSelectedItemMarca(objm.getModelo());

            // obj_crea.jButton1.setName("Actualizar");
            //        obj_crea.jButton1.setText("Actualizar");
            //      Principal.desktopPane.add(obj_crea);
            //    obj_crea.setVisible(true);
        }
    }//GEN-LAST:event_jTable1MouseClicked

    private void txt_xclienteKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_xclienteKeyTyped
        // TODO add your handling code here:
//        ValidaNUmeros val = new ValidaNUmeros();
//        val.keyTyped(evt);
    }//GEN-LAST:event_txt_xclienteKeyTyped

    private void btn_excelActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_excelActionPerformed
//        // TODO add your handling code here:
        Date date1 = new Date();
        Date date2 = new Date();
        String fechaInicio = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserdesde.getDate().toString());

        String fechaFIn = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserhasta.getDate().toString());

        String rutaInforme = Ejemplo.listaComprasFilepdf;
        Map parametros = new HashMap();
        java.util.Date utilDate1 = new java.util.Date();
        java.util.Date utilDate2 = new java.util.Date();
        utilDate1 = jdchoserdesde.getDate();
        utilDate2 = jdchoserhasta.getDate();
        java.sql.Timestamp a = new java.sql.Timestamp(utilDate1.getTime());
        java.sql.Timestamp b = new java.sql.Timestamp(utilDate2.getTime());

        parametros.put("s1", a);
        parametros.put("s2", b);
        //JOptionPane.showConfirmDialog(rootPane, a +"--"+b);
        ImpresionDao imp = new ImpresionDao();
        imp.impresionShowReport(parametros, rutaInforme);
//        Thread t = new Thread() {
//
//            public void run() {
//                XSSFWorkbook workbook = new XSSFWorkbook();
//                XSSFSheet hoja = workbook.createSheet();
//                XSSFRow fila = hoja.createRow(0);
//
//                fila.createCell(0).setCellValue("Cedula");
//                fila.setHeightInPoints(23);
//                fila.createCell(1).setCellValue("Nombres");
//                fila.createCell(2).setCellValue("Direccion");
//
//                Principal.jProgressBar2.setMaximum(jTable1.getRowCount());
//                XSSFRow filas;
//                Principal.jProgressBar2.setStringPainted(true);
//
//                for (int i = 0; i < jTable1.getRowCount(); i++) {
//                    jTable1.setRowSelectionInterval(i, i);
//
//                    Principal.jProgressBar2.setValue(i + 1);
//                    filas = hoja.createRow(i + 1);
//                    filas.createCell(0).setCellValue(jTable1.getValueAt(i, 0).toString());
//                    filas.createCell(1).setCellValue(jTable1.getValueAt(i, 1).toString());
//                    filas.createCell(2).setCellValue(jTable1.getValueAt(i, 2).toString());
//
//                    Principal.jProgressBar2.setString("Esxportando Usuarios del Sistema a Excel...");
//                    try {
//                        Thread.sleep(20);
//                    } catch (InterruptedException ex) {
//                        Logger.getLogger(Buscar_usuarios.class.getName()).log(Level.SEVERE, null, ex);
//                    }
//                }
//                Principal.jProgressBar2.setValue(0);
//                Principal.jProgressBar2.setString("");
//
//                try {
//
//                    workbook.write(new FileOutputStream(new File("D:\\Excel.xlsx")));
//
//                } catch (Exception e) {
//                }
//
//            }
//        ;
//
//        };
//        t.start();

////        if (jTable1.getRowCount() < 0) {
////            JFileChooser chooser = new JFileChooser();
////            FileNameExtensionFilter filter = new FileNameExtensionFilter("Archivos de excel", "xls");
////            chooser.setFileFilter(filter);
////            chooser.setDialogTitle("Guardar archivo");
////            chooser.setAcceptAllFileFilterUsed(false);
////            if (chooser.showSaveDialog(null) == JFileChooser.APPROVE_OPTION) {
////                List<JTable> tb = new ArrayList();
////                List<String> nom = new ArrayList();
////                tb.add(jTable1);
////                nom.add("Compras por factura");
////                String file = chooser.getSelectedFile().toString().concat(".xls");
////                try {
////                    Exporter e = new Exporter(new File(file), tb, nom);
////
////                    if (e.export()) {
////                        JOptionPane.showMessageDialog(null, "Los datos fueron exportados a excel en el directorio seleccionado", "Mensaje de Informacion", JOptionPane.INFORMATION_MESSAGE);
////                    }
////                } catch (Exception e) {
////                    JOptionPane.showMessageDialog(null, "Hubo un error " + e.getMessage(), " Error", JOptionPane.ERROR_MESSAGE);
////                }
////            }
////        } else {
////            JOptionPane.showMessageDialog(this, "No hay datos para exportar", "Mensaje de error", JOptionPane.ERROR_MESSAGE);
////        }
    }//GEN-LAST:event_btn_excelActionPerformed

    private void btn_MostrarTodoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_MostrarTodoActionPerformed
        // TODO add your handling code here:
        ComprasDao objDao = new ComprasDao();
//
//        jTable1.setModel(objDao.Buscar_table_only_Activos());
//        this.ocultarFIlasJtable();
        ///
    }//GEN-LAST:event_btn_MostrarTodoActionPerformed

    private void btn_EliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_EliminarActionPerformed
        // TODO add your handling code here:

        if (codigoSeleccionado != null && clicJtable == 1) {
            Compras fac = new Compras();
            ComprasDao facDao = new ComprasDao();
            compra1 = fac = facDao.buscarConID(codigoSeleccionado);

            int dialogButton = JOptionPane.YES_NO_OPTION;
            int dialogResult = JOptionPane.showConfirmDialog(this, "Confirmar la Eliminacion de la Factura numero: " + compra1.getSecuencia(), "Eliminar Factura", dialogButton);
            if (dialogResult == 0) {

                ComprasDao obj1 = new ComprasDao();
                try {
                    if (clicJtable == 1) {
                        DetalleComprasDao cdDao = new DetalleComprasDao();
                        List<DetalleCompra> d;
                        ArrayList<Kardex> kardex = new ArrayList<>();
                        d = cdDao.buscarConIDFact(compra1.getCodigo());
                        for (DetalleCompra dc : d) {
                            Kardex k = new Kardex();
                            k.setBodega(Principal.bodegaPredeterminadaenCOmpra.subSequence(0, 1).toString());
                            k.setDetalle("EGRESO ELIMINACION -- " + compra1.getTipo_documento() + " DE COMPRA " + compra1.getSecuencia());
                            k.setOutcantidad(dc.getCantidad());
                            k.setOutpvp(dc.getValorUnitario());
                            k.setOutcosto(dc.getValorUnitario());
                            k.setIncantidad("0");
                            k.setIncosto("0");
                            k.setInpvp("0");
                            k.setProductos_Codigo(dc.getProductos_codigo());
                            kardex.add(k);
                        }

                        ComitsAll c = new ComitsAll();
                        c.ElimiarCompras(codigoSeleccionado, d, kardex);

                        codigoSeleccionado = null;
                        //setFechayHoraActualJDChooser();
                        ComprasDao obj = new ComprasDao();
                        String fechaInicio = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserdesde.getDate().toString());
                        String fechaFIn = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserhasta.getDate().toString());
                        jTable1.setModel(obj.listarComprasTbModelok(fechaInicio, fechaFIn));
                        this.ocultarFIlasJtable();
                        sumartotales();
                    }
                } catch (Exception ex) {
                    Logger.getLogger(Buscar_usuarios.class.getName()).log(Level.SEVERE, null, ex);
                }

            } else {

            }
        }
    }//GEN-LAST:event_btn_EliminarActionPerformed

    private void txt_xclienteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_xclienteActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_xclienteActionPerformed

    private void btn_hoyActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_hoyActionPerformed
        // TODO add your handling code here:
        setFechayHoraActualJDChooser();
        ComprasDao obj = new ComprasDao();
        String fechaInicio = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserdesde.getDate().toString());
        String fechaFIn = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserhasta.getDate().toString());
        jTable1.setModel(obj.listarComprasTbModelok(fechaInicio, fechaFIn));
        this.ocultarFIlasJtable();
        sumartotales();

    }//GEN-LAST:event_btn_hoyActionPerformed

    private void jdchoserdesdeMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jdchoserdesdeMouseClicked
        // TODO add your handling code here:
        //jdchoserdesde
    }//GEN-LAST:event_jdchoserdesdeMouseClicked

    private void btn_buscarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_buscarActionPerformed
        // TODO add your handling code here:
        if (jdchoserdesde.getDate().before(jdchoserhasta.getDate())) {

            ComprasDao obj = new ComprasDao();
            String fechaInicio = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserdesde.getDate().toString());
            String fechaFIn = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserhasta.getDate().toString());
            jTable1.setModel(obj.listarComprasTbModelok(fechaInicio, fechaFIn));
            this.ocultarFIlasJtable();
            sumartotales();
        } else {
            msg.setProgressBar(3000, "Ranngo Errado!! Fecha de Inicio es Mayor a la del Final...");
        }
    }//GEN-LAST:event_btn_buscarActionPerformed

    private void jScrollPane1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jScrollPane1MouseClicked
        // TODO add your handling code here:


    }//GEN-LAST:event_jScrollPane1MouseClicked

    private void formInternalFrameClosed(javax.swing.event.InternalFrameEvent evt) {//GEN-FIRST:event_formInternalFrameClosed
        // TODO add your handling code here:

    }//GEN-LAST:event_formInternalFrameClosed

    private void jcb_formaPagoItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcb_formaPagoItemStateChanged
        // TODO add your handling code here:
        ComprasDao obj = new ComprasDao();
        jTable1.setModel(obj.Buscar_table_compras("compras.formaPago", evt.getItem().toString()));
        this.ocultarFIlasJtable();///
        sumartotales();
        
        

    }//GEN-LAST:event_jcb_formaPagoItemStateChanged

    private void jdchoserdesdeKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jdchoserdesdeKeyPressed
        // TODO add your handling code here:
        if(evt.getKeyChar()==KeyEvent.VK_ENTER){
        if (jdchoserdesde.getDate().before(jdchoserhasta.getDate())) {

            ComprasDao obj = new ComprasDao();
            String fechaInicio = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserdesde.getDate().toString());
            String fechaFIn = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserhasta.getDate().toString());
            jTable1.setModel(obj.listarComprasTbModelok(fechaInicio, fechaFIn));
            this.ocultarFIlasJtable();
            sumartotales();
        } else {
            msg.setProgressBar(3000, "Ranngo Errado!! Fecha de Inicio es Mayor a la del Final...");
        }
        }
    }//GEN-LAST:event_jdchoserdesdeKeyPressed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btn_Eliminar;
    private javax.swing.JButton btn_buscar;
    private javax.swing.JButton btn_excel;
    private javax.swing.JButton btn_hoy;
    private javax.swing.JButton btn_mostrarAll1;
    private javax.swing.JLabel fec;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JScrollPane jScrollPane1;
    public static javax.swing.JTable jTable1;
    private javax.swing.JComboBox<String> jcb_formaPago;
    private com.toedter.calendar.JDateChooser jdchoserdesde;
    private com.toedter.calendar.JDateChooser jdchoserhasta;
    private javax.swing.JTextField txt_total;
    private javax.swing.JTextField txt_xMonto;
    private javax.swing.JTextField txt_xcliente;
    private javax.swing.JTextField txt_xnumeroFactura;
    // End of variables declaration//GEN-END:variables

}
