/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista.Usuarios;

import ClasesAuxiliares.tablas.SetRenderJTableCXC;
import Controlador.Ejemplo;
import Controlador.Usuarios.ClientesDao;
import Controlador.Usuarios.DetalleFacturaDao;
import Controlador.Usuarios.FacturasDao;
import Controlador.Usuarios.HoraFecha;
import Controlador.Usuarios.ImpresionDao;
import Controlador.Usuarios.MarcasDao;
import Controlador.Usuarios.ModelosDao;
import Controlador.Usuarios.ProductosDao;
import Controlador.Usuarios.cxcDao;
import ClasesAuxiliares.debug.Deb;
import Modelo.Clientes;
import Modelo.Cxc;
import Modelo.DetalleFactura;
import Modelo.Facturas;
import Modelo.Marcas;
import Modelo.Modelos;
import Vista.Principal;
import static Vista.Principal.desktopPane;
import Vlidaciones.ProgressBar;
import Vlidaciones.ValidaNUmeros;
import com.mxrck.autocompleter.AutoCompleterCallback;
import com.mxrck.autocompleter.TextAutoCompleter;
import java.awt.Frame;
import java.awt.event.KeyEvent;
import java.awt.event.MouseEvent;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultListModel;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author USUARIO
 */
public class Buscar_cxc extends javax.swing.JInternalFrame {

    /**
     * Creates new form FBUsuarios
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
    //String sql_allss = "select * from usuarios";
    // String sql_all = "select usuarios.*,tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo order BY usuarios.Nombres LIMIT 0, 50";

    //CUsuarios obj = new CUsuarios();
    public Buscar_cxc() {

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

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        buttonGroup1 = new javax.swing.ButtonGroup();
        buttonGroup2 = new javax.swing.ButtonGroup();
        jPanel1 = new javax.swing.JPanel();
        jPanel3 = new javax.swing.JPanel();
        jPanel8 = new javax.swing.JPanel();
        txt_xMonto = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        txt_xcliente = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        jPanel5 = new javax.swing.JPanel();
        jrpendientes = new javax.swing.JRadioButton();
        jretrasadas = new javax.swing.JRadioButton();
        jracanceladas = new javax.swing.JRadioButton();
        jPanel6 = new javax.swing.JPanel();
        jdchoserhasta = new com.toedter.calendar.JDateChooser();
        jLabel5 = new javax.swing.JLabel();
        jdchoserdesde = new com.toedter.calendar.JDateChooser();
        btn_buscar = new javax.swing.JButton();
        jLabel4 = new javax.swing.JLabel();
        btn_hoy = new javax.swing.JButton();
        jPanel7 = new javax.swing.JPanel();
        jrsolohoy = new javax.swing.JRadioButton();
        jrtodas = new javax.swing.JRadioButton();
        jButton1 = new javax.swing.JButton();
        jPanel2 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        btn_mostrarAll1 = new javax.swing.JButton();
        btn_excel = new javax.swing.JButton();
        jLabel7 = new javax.swing.JLabel();
        jButton2 = new javax.swing.JButton();

        buttonGroup1.add(jretrasadas);
        buttonGroup1.add(jracanceladas);
        buttonGroup1.add(jrpendientes);

        buttonGroup2.add(jrsolohoy);
        buttonGroup2.add(jrtodas);

        setClosable(true);
        setMaximizable(true);
        setTitle("BUSCAR CUENTAS POR COBRAR");
        setMaximumSize(new java.awt.Dimension(1098, 696));
        setMinimumSize(new java.awt.Dimension(1098, 696));
        setPreferredSize(new java.awt.Dimension(1098, 696));
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

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(""));

        jPanel3.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        jPanel8.setBorder(javax.swing.BorderFactory.createTitledBorder(""));

        txt_xMonto.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_xMontoKeyReleased(evt);
            }
        });

        jLabel3.setText("Buscar por Monto: ");

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

        jLabel8.setText("Clientes");

        javax.swing.GroupLayout jPanel8Layout = new javax.swing.GroupLayout(jPanel8);
        jPanel8.setLayout(jPanel8Layout);
        jPanel8Layout.setHorizontalGroup(
            jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel8Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanel8Layout.createSequentialGroup()
                        .addComponent(jLabel3)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txt_xMonto))
                    .addComponent(jLabel8)
                    .addComponent(txt_xcliente, javax.swing.GroupLayout.PREFERRED_SIZE, 259, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(56, Short.MAX_VALUE))
        );
        jPanel8Layout.setVerticalGroup(
            jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel8Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel8)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txt_xcliente, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(txt_xMonto, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        jPanel5.setBorder(javax.swing.BorderFactory.createTitledBorder(""));

        jrpendientes.setText("Pendientes");
        jrpendientes.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jrpendientesItemStateChanged(evt);
            }
        });

        jretrasadas.setForeground(new java.awt.Color(255, 0, 0));
        jretrasadas.setText("Atrasadas");
        jretrasadas.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jretrasadasItemStateChanged(evt);
            }
        });

        jracanceladas.setText("Canceladas");
        jracanceladas.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jracanceladasItemStateChanged(evt);
            }
        });

        javax.swing.GroupLayout jPanel5Layout = new javax.swing.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jrpendientes)
                    .addComponent(jretrasadas)
                    .addComponent(jracanceladas))
                .addContainerGap(84, Short.MAX_VALUE))
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jrpendientes)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jretrasadas)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jracanceladas)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel8, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGap(18, 18, 18)
                .addComponent(jPanel5, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGap(126, 126, 126))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel5, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jPanel8, javax.swing.GroupLayout.PREFERRED_SIZE, 94, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel6.setBorder(javax.swing.BorderFactory.createTitledBorder(""));

        jdchoserhasta.setDateFormatString("yyyy-MM-dd");

        jLabel5.setText("Hasta:");

        jdchoserdesde.setDateFormatString("yyyy-MM-dd");
        jdchoserdesde.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jdchoserdesdeMouseClicked(evt);
            }
        });

        btn_buscar.setText("Buscar");
        btn_buscar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_buscarActionPerformed(evt);
            }
        });

        jLabel4.setText("Desde:");

        btn_hoy.setText("HOY");
        btn_hoy.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_hoyActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel6Layout = new javax.swing.GroupLayout(jPanel6);
        jPanel6.setLayout(jPanel6Layout);
        jPanel6Layout.setHorizontalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel6Layout.createSequentialGroup()
                        .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel4)
                            .addComponent(jLabel5))
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel6Layout.createSequentialGroup()
                        .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jdchoserdesde, javax.swing.GroupLayout.DEFAULT_SIZE, 124, Short.MAX_VALUE)
                            .addComponent(jdchoserhasta, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(btn_buscar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(btn_hoy, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
                .addContainerGap())
        );
        jPanel6Layout.setVerticalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel6Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel4)
                .addGap(4, 4, 4)
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jdchoserdesde, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btn_hoy))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel6Layout.createSequentialGroup()
                        .addComponent(jLabel5)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jdchoserhasta, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(btn_buscar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel7.setBorder(javax.swing.BorderFactory.createTitledBorder(""));

        jrsolohoy.setSelected(true);
        jrsolohoy.setText("SOLO HOY");
        jrsolohoy.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jrsolohoyItemStateChanged(evt);
            }
        });

        jrtodas.setText("TODAS");
        jrtodas.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jrtodasActionPerformed(evt);
            }
        });

        jButton1.setText("BUSCAR");

        javax.swing.GroupLayout jPanel7Layout = new javax.swing.GroupLayout(jPanel7);
        jPanel7.setLayout(jPanel7Layout);
        jPanel7Layout.setHorizontalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jrsolohoy)
                    .addComponent(jrtodas))
                .addGap(0, 0, Short.MAX_VALUE))
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jButton1)
                .addContainerGap(25, Short.MAX_VALUE))
        );
        jPanel7Layout.setVerticalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addGap(18, 18, 18)
                .addComponent(jrsolohoy)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jrtodas)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButton1)
                .addContainerGap(14, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(8, 8, 8)
                .addComponent(jPanel6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(10, 10, 10)
                .addComponent(jPanel7, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(10, 10, 10)
                .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(8, 8, 8)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel6, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jPanel7, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)))
        );

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder("LISTADO DE CUENTAS POR COBRAR"));
        jPanel2.setAutoscrolls(true);

        jScrollPane1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jScrollPane1MouseClicked(evt);
            }
        });

        jTable1.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {

            }
        ));
        jTable1.setAutoResizeMode(javax.swing.JTable.AUTO_RESIZE_NEXT_COLUMN);
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
            .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 579, Short.MAX_VALUE)
        );

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

        jButton2.setBackground(new java.awt.Color(0, 204, 0));
        jButton2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/images/pago.png"))); // NOI18N
        jButton2.setText("RECEPTAR PAGO");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(btn_mostrarAll1, javax.swing.GroupLayout.PREFERRED_SIZE, 160, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(10, 10, 10)
                .addComponent(btn_excel, javax.swing.GroupLayout.PREFERRED_SIZE, 170, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(10, 10, 10)
                .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 180, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel7, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE))
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(10, 10, 10)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(10, 10, 10)
                .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel7, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(btn_mostrarAll1, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(btn_excel, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addContainerGap())))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void txt_xclienteKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_xclienteKeyPressed
        // TODO add your handling code here:

    }//GEN-LAST:event_txt_xclienteKeyPressed

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

    private void txt_xclienteKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_xclienteKeyReleased
        // TODO add your handling code here:
//        ProductosDao obj = new ProductosDao();
//        jTable1.setModel(obj.Buscar_table("Producto", txt_xcliente.getText()));
//        this.SetancocolumnasFIlasJtable();///
        if (evt.getKeyCode() == KeyEvent.VK_ENTER) {

        } else {
            ClientesDao cd = new ClientesDao();

            listaClientes = cd.BuscarClietneslikokokok(txt_xcliente.getText(),0);
            clienteAutoCompleter.removeAllItems();
            for (Clientes p : listaClientes) {
                //     Deb.consola("Vista.Usuarios.Crear_Facturas.<init>()asdasdasdasdasdasdasvccccccccccccccccc");
                clienteAutoCompleter.addItem(p);
            }

        }

    }//GEN-LAST:event_txt_xclienteKeyReleased

    private void txt_xMontoKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_xMontoKeyReleased
        // TODO add your handling code here:
        if (ValidaNUmeros.isOnlyDouble(txt_xMonto.getText())) {
            if (evt.getKeyCode() == KeyEvent.VK_ENTER) {
                cxcDao cxcdao = new cxcDao();
                modelo = cxcdao.getCxCnow(5, Double.valueOf(txt_xMonto.getText()), 1);
                jTable1.setModel(modelo);
                SetancocolumnasFIlasJtable();
            }
        } else {
            evt.consume();
        }

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

    public void registrapagocxc() {

        if (codigoCxcSeleccionada != -1) {
            Cxc c = new Cxc();
            cxcDao cdao = new cxcDao();
            String[] registros = new String[13];
            registros = cdao.getCxcxcInfo(codigoCxcSeleccionada);
            Frame frame = JOptionPane.getFrameForComponent(this);
            registrarPacocxc pcdialog = new registrarPacocxc(frame, true);
            pcdialog.txt_total.setText(registros[9]);
            pcdialog.txt_entrada.setText("0.0");
            //                               formaPagoSeelccionada = jcbFormasPago.getSelectedItem().toString();
            pcdialog.txt_saldo.setText(registros[9]);
            pcdialog.txtDetalle.setText(registros[11] + " \n");
            pcdialog.txtDetalle.append("#FACTURA: " + registros[12] + " #TOTAL CREDITO: " + registros[7] + " #SALDO: " + registros[10] + "\n");
            pcdialog.txt_nombre.setText(registros[2]);
            pcdialog.codigocxc = codigoCxcSeleccionada;
            pcdialog.setLocationRelativeTo(frame);
            pcdialog.setVisible(true);
            if (restropagocxcCxpexitoso) {
                cxcDao cxcdao = new cxcDao();
                modelo = cxcdao.getCxCnow(0, 0.0, 1);
                jTable1.setModel(modelo);
                SetancocolumnasFIlasJtable();

            } else {
                //            JOptionPane.showMessageDialog(null, "Ha ocurrido un error al registrar el Pago");

            }
        }

    }
    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        // TODO add your handling code here:

        JTable table = (JTable) evt.getSource();
        clicJtable = 1;
        this.modelo = (DefaultTableModel) jTable1.getModel();
        int row = jTable1.getSelectedRow();
        rowSeleccionadaJTable = row;
        int col = jTable1.getSelectedColumn();
        modelo = (DefaultTableModel) jTable1.getModel();
        Deb.consola("row: " + row);
        Deb.consola("col: " + col);
        Integer codigoSeleccionado = Integer.parseInt(modelo.getValueAt(row, 0).toString());
        codigoCxcSeleccionada = codigoSeleccionado;
        Deb.consola("Vista.Usuarios.BuscarFacturas.jTable1MouseClicked()codiggo>:" + modelo.getValueAt(row, 0));
//////////////////// abrir ventana para registrar pago
        if (!jracanceladas.isSelected()&& evt.getClickCount()==2) {            
            registrapagocxc();
        }

//////////////////////////////
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

                        //String rutaInforme = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\FACTURA.jasper";
                        //String rutaInforme = Ejemplo.factura1;
                        String rutaInforme = Ejemplo.factura2;
                        Map parametros = new HashMap();
                        parametros.put("numeroFactura", modelo.getValueAt(row, 2).toString());
                        Deb.consola("Vista.Usuarios.BuscarFacturas.jTable1MouseClicked()secuecnaia  :" + modelo.getValueAt(row, 2).toString());
                        //JOptionPane.showConfirmDialog(rootPane, a +"--"+b);
                        ImpresionDao imp = new ImpresionDao();
                        imp.getShowReport(parametros, rutaInforme);

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

        //String rutaInforme = "C:\\Users\\USUARIO\\OneDrive\\NetBeansProjects\\Sofi\\src\\Reportes\\report1.jasper";
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

    private void btn_EliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_EliminarActionPerformed
        // TODO add your handling code here:
        if (codigoCxcSeleccionada != -1) {
            int dialogButton = JOptionPane.YES_NO_OPTION;
            int dialogResult = JOptionPane.showConfirmDialog(this, "Confirmar la Eliminacion de la CXC de valor: " + codigoCxcSeleccionada, "Eliminar Cuenta Por Cobrar", dialogButton);
            if (dialogResult == 0) {
                cxcDao obj1 = new cxcDao();
                try {
                    if (clicJtable == 1) {
                        obj1.eliminar(codigoCxcSeleccionada);
//                        setFechayHoraActualJDChooser();
//                        FacturasDao obj = new FacturasDao();
//                        String fechaInicio = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserdesde.getDate().toString());
//                        String fechaFIn = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserhasta.getDate().toString());
//                        jTable1.setModel(obj.listarFacturasTbModel(fechaInicio, fechaFIn));
                        cxcDao cxcdao = new cxcDao();
                        modelo = cxcdao.getCxCnow(0, 0.0, 1);
                        jTable1.setModel(modelo);
                        SetancocolumnasFIlasJtable();
                        codigoCxcSeleccionada = -1;
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

        cxcDao cxcdao = new cxcDao();
        modelo = cxcdao.getCxCnow(1, 0.0, 1);
        jTable1.setModel(modelo);
        SetancocolumnasFIlasJtable();
        //        setFechayHoraActualJDChooser();
        //        FacturasDao obj = new FacturasDao();
        //        String fechaInicio = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserdesde.getDate().toString());
        //        String fechaFIn = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserhasta.getDate().toString());
        //        jTable1.setModel(obj.listarFacturasTbModel(fechaInicio, fechaFIn));
        //        this.SetancocolumnasFIlasJtable();

    }//GEN-LAST:event_btn_hoyActionPerformed

    private void jdchoserdesdeMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jdchoserdesdeMouseClicked
        // TODO add your handling code here:
        //jdchoserdesde
    }//GEN-LAST:event_jdchoserdesdeMouseClicked

    private void btn_buscarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_buscarActionPerformed
        // TODO add your handling code here:
//        if (jdchoserdesde.getDate().before(jdchoserhasta.getDate())) {
//
//            FacturasDao obj = new FacturasDao();
//            String fechaInicio = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserdesde.getDate().toString());
//            String fechaFIn = HoraFecha.fecha_aa_mm_dd_HH_mm_ss(jdchoserhasta.getDate().toString());
//            jTable1.setModel(obj.listarFacturasTbModel(fechaInicio, fechaFIn));
//            this.SetancocolumnasFIlasJtable();
//        } else {
//            msg.setProgressBar(3000, "Ranngo Errado!! Fecha de Inicio es Mayor a la del Final...");
//        }
    }//GEN-LAST:event_btn_buscarActionPerformed

    private void jScrollPane1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jScrollPane1MouseClicked
        // TODO add your handling code here:


    }//GEN-LAST:event_jScrollPane1MouseClicked

    private void formInternalFrameClosed(javax.swing.event.InternalFrameEvent evt) {//GEN-FIRST:event_formInternalFrameClosed
        // TODO add your handling code here:

    }//GEN-LAST:event_formInternalFrameClosed

    private void jrsolohoyItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jrsolohoyItemStateChanged
        // TODO add your handling code here:
        if (jrsolohoy.isSelected()) {

            cxcDao cxcdao = new cxcDao();
            modelo = cxcdao.getCxCnow(1, 0.0, 1);
            jTable1.setModel(modelo);
            SetancocolumnasFIlasJtable();
        }
    }//GEN-LAST:event_jrsolohoyItemStateChanged

    private void jrtodasActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jrtodasActionPerformed
        // TODO add your handling code here:
        cxcDao cxcdao = new cxcDao();
        modelo = cxcdao.getCxCnow(0, 0.0, 1);
        jTable1.setModel(modelo);
        SetancocolumnasFIlasJtable();

    }//GEN-LAST:event_jrtodasActionPerformed

    private void jrpendientesItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jrpendientesItemStateChanged
        // TODO add your handling code here:
        if (jrpendientes.isSelected()) {
            cxcDao cxcdao = new cxcDao();
            modelo = cxcdao.getCxCnow(0, 0.0, 1);
            jTable1.setModel(modelo);
            SetancocolumnasFIlasJtable();
        }
    }//GEN-LAST:event_jrpendientesItemStateChanged

    private void jretrasadasItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jretrasadasItemStateChanged

        if (jretrasadas.isSelected()) {
            cxcDao cxcdao = new cxcDao();
            modelo = cxcdao.getCxCnow(3, 0.0, 1);
            jTable1.setModel(modelo);
            SetancocolumnasFIlasJtable();
        }
    }//GEN-LAST:event_jretrasadasItemStateChanged

    private void jracanceladasItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jracanceladasItemStateChanged

        if (jracanceladas.isSelected()) {

            cxcDao cxcdao = new cxcDao();
            modelo = cxcdao.getCxCnow(2, 0.0, 1);
            jTable1.setModel(modelo);
            SetancocolumnasFIlasJtable();
        }
    }//GEN-LAST:event_jracanceladasItemStateChanged

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        if (!jracanceladas.isSelected()) {
            registrapagocxc();
        }

    }//GEN-LAST:event_jButton2ActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btn_buscar;
    private javax.swing.JButton btn_excel;
    private javax.swing.JButton btn_hoy;
    private javax.swing.JButton btn_mostrarAll1;
    private javax.swing.ButtonGroup buttonGroup1;
    private javax.swing.ButtonGroup buttonGroup2;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JPanel jPanel8;
    private javax.swing.JScrollPane jScrollPane1;
    public static javax.swing.JTable jTable1;
    private com.toedter.calendar.JDateChooser jdchoserdesde;
    private com.toedter.calendar.JDateChooser jdchoserhasta;
    private javax.swing.JRadioButton jracanceladas;
    private javax.swing.JRadioButton jretrasadas;
    private javax.swing.JRadioButton jrpendientes;
    private javax.swing.JRadioButton jrsolohoy;
    private javax.swing.JRadioButton jrtodas;
    private javax.swing.JTextField txt_xMonto;
    private javax.swing.JTextField txt_xcliente;
    // End of variables declaration//GEN-END:variables

}
