/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista.Usuarios;

import ClasesAuxiliares.FeCodigoNUmerico;
import ClasesAuxiliares.NewSql.Forms.OperacionesForms;
import ClasesAuxiliares.Variables;
import ClasesAuxiliares.debug.Deb;
import Controlador.Usuarios.ComprasDao;
import Controlador.Usuarios.DetalleRetencionDao;
import Controlador.Usuarios.HoraFecha;
import Controlador.Usuarios.PagoscxpDao;
import Controlador.Usuarios.RetencionCDao;
import Controlador.Usuarios.SeriesRetencionsDao;
import Controlador.Usuarios.cxpDao;
import Modelo.Clientes;
import Modelo.Compras;
import Modelo.Cxp;
import Modelo.DetalleRetencion;
import Modelo.Pagoscxp;
import Modelo.Proveedores;
import Modelo.Retencion_;
import Modelo.SeriesRetencion;
import Modelo.Sri_porcentajes_retencion;
import Modelo.sri_tipocomprobante;
import Vista.Principal;
import static Vista.Principal.desktopPane;
import Vlidaciones.ValidaNUmeros;
import java.awt.Frame;
import java.sql.Date;
import java.text.DecimalFormat;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;
import login.login;

/**
 *
 * @author USUARIO
 */
public class Crear_RetencionC extends javax.swing.JInternalFrame {

    /**
     * Creates new form Crear_RetencionC1
     */
    private static ArrayList<sri_tipocomprobante> listaTipoComporabante = new ArrayList<sri_tipocomprobante>();
    private static ArrayList<Sri_porcentajes_retencion> listaporcentajesRetencion = new ArrayList<Sri_porcentajes_retencion>();
    public static Clientes proveerdor = new Clientes();
    public static Compras compra = new Compras();
    public static boolean isOpenfromCrearRetencion = false;
    
    private String claveAcceso;
    private String tipoDocID;

    /////tabla de impuestos
    Integer numero = 1;
    Integer indexnoselected = -1;
    public static DefaultTableModel modelo = null;
    String[] titulos
            = {"NUMERO", "ANO", "BASE", "IMPUESTO",
                "CODIGO", " % ",
                "RETENIDO"};
    public static String[] registros = new String[7];

    ////
    private void generarClaveAcceso() {
        HoraFecha ob2 = new HoraFecha();
        jdfecha1.setDate(ob2.obtenerFecha());

//////////
        jdfechacaducidadFac.setDate(OperacionesForms.getFechaCaducidadDocumentoElectronico());
        
        claveAcceso = HoraFecha.fecha_ddmmaaa(jdfecha1.getDate().toString());
        claveAcceso = claveAcceso + Variables.FE_FACTURA + login.rucEmpresa + Variables.FE_TIPO_AMBIENTE + tsec1.getText() + tsec2.getText() + tsec3.getText() + Variables.FE_CODIGO_NUMERICO + Variables.FE_TIPO_EMISION;
        Variables.FE_DIGITO_VERIFICADOR = String.valueOf(FeCodigoNUmerico.obtenerSumaPorDigitosOK(FeCodigoNUmerico.invertirCadenaOK(claveAcceso)));
        claveAcceso = claveAcceso + Variables.FE_DIGITO_VERIFICADOR;
        t_ClaveAcceso.setText(claveAcceso);
        
    }
    
    public Crear_RetencionC() {
        initComponents();
        modelo = new DefaultTableModel(null, titulos) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // make read only fields except column 0,13,14
                //  return column == 0 || column == 13 || column == 14;
                return false;
            }
        };
//        jcbPorcenajes.setSize(325, 22);
//        jcbtipoDocumento.setSize(325, 22);
//        jcbComceptoRtetencionFac.setSize(267,22);
        addOrDeleteRowTable(jTable1);
        //llenarSecuenciaFacura();
        getNuevonumeroRetencion();
        generarClaveAcceso();
        ComprasDao cpDao = new ComprasDao();
        
        listaTipoComporabante = cpDao.getlistaTipoComprobate();
        for (sri_tipocomprobante object : listaTipoComporabante) {
            jcbtipoDocumento.addItem(object.getId() + "-" + object.getTipocomprobante());
            tipoDocID = object.getId();
            
        }
        
    }
    
    private void llenarSecuenciaFacura() {
        DecimalFormat formateador = new DecimalFormat("000000000");
        SeriesRetencion objSF = new SeriesRetencion();
        SeriesRetencionsDao objDaoSF = new SeriesRetencionsDao();
        
        objSF = objDaoSF.getMaxNUumeroFactura(login.CodigoDelEquipo);
        if (objSF.getFac3() != null) {
            Integer nfac = Integer.parseInt(objSF.getFac3());
            nfac = nfac + 1;
            String format = formateador.format(nfac);
            tsec1.setText(objSF.getSec1());
            tsec2.setText(objSF.getSec2());
            tsec3.setText(String.valueOf(format));
        } else {
            tsec1.setText("001");
            tsec2.setText("001");
            tsec3.setText("000000001");
        }
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
        tProveedor = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        tRUc = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        btnComprobante = new javax.swing.JButton();
        jPanel2 = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        tsec1 = new javax.swing.JTextField();
        tsec2 = new javax.swing.JTextField();
        tsec3 = new javax.swing.JTextField();
        t_ClaveAcceso = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        jdfecha1 = new com.toedter.calendar.JDateChooser();
        jLabel8 = new javax.swing.JLabel();
        jPanel3 = new javax.swing.JPanel();
        jcbtipoDocumento = new javax.swing.JComboBox<>();
        jLabel6 = new javax.swing.JLabel();
        txtSec1Compra = new javax.swing.JTextField();
        jdfechacaducidadFac = new com.toedter.calendar.JDateChooser();
        jLabel5 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        txtconcepto = new javax.swing.JTextField();
        jPanel4 = new javax.swing.JPanel();
        jPanel5 = new javax.swing.JPanel();
        jButton4 = new javax.swing.JButton();
        jButton5 = new javax.swing.JButton();
        jPanel6 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jPanel7 = new javax.swing.JPanel();
        jButton3 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jPanel8 = new javax.swing.JPanel();
        txtBaseFac = new javax.swing.JLabel();
        txtIvaFac = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        txtTotal = new javax.swing.JTextField();

        setBorder(null);
        setClosable(true);
        setTitle("Retencion");

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder("Datos del Proveedor"));

        jLabel1.setText("Proveedor");

        jLabel2.setText("RUC");

        jButton1.setText("Buscar");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        btnComprobante.setText("Comprobante");
        btnComprobante.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnComprobanteActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel2)
                    .addComponent(jLabel1))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(tProveedor, javax.swing.GroupLayout.DEFAULT_SIZE, 145, Short.MAX_VALUE)
                    .addComponent(tRUc))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(btnComprobante, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButton1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(tProveedor, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1)
                    .addComponent(jButton1))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(tRUc, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2)
                    .addComponent(btnComprobante))
                .addContainerGap())
        );

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder("Datos del Comprobante de Retencion"));

        jLabel3.setText("Secuencial");

        tsec1.setText("001");
        tsec1.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                tsec1FocusLost(evt);
            }
        });
        tsec1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                tsec1KeyPressed(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                tsec1KeyReleased(evt);
            }
        });

        tsec2.setText("002");
        tsec2.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                tsec2FocusLost(evt);
            }
        });
        tsec2.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                tsec2KeyPressed(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                tsec2KeyReleased(evt);
            }
        });

        tsec3.setText("000000009");
        tsec3.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                tsec3FocusLost(evt);
            }
        });
        tsec3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                tsec3ActionPerformed(evt);
            }
        });
        tsec3.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                tsec3KeyPressed(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                tsec3KeyReleased(evt);
            }
        });

        t_ClaveAcceso.setText("ELectronica");
        t_ClaveAcceso.setEnabled(false);

        jLabel4.setText("Clave de Acceso / Numero de Autorizacion");

        jdfecha1.setEnabled(false);

        jLabel8.setText("Fecha de Emision:");

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(t_ClaveAcceso)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                        .addComponent(jLabel4)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel3)
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addComponent(tsec1, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(tsec2, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(tsec3, javax.swing.GroupLayout.PREFERRED_SIZE, 77, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jdfecha1, javax.swing.GroupLayout.PREFERRED_SIZE, 134, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel8))))
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jLabel3)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(tsec1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(tsec2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(tsec3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jLabel8, javax.swing.GroupLayout.PREFERRED_SIZE, 12, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jdfecha1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel4)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(t_ClaveAcceso, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        jPanel3.setBorder(javax.swing.BorderFactory.createTitledBorder("Datos del Comprobante de Compra"));

        jcbtipoDocumento.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jcbtipoDocumentoItemStateChanged(evt);
            }
        });

        jLabel6.setText("Numero de Comprobante");

        jLabel5.setText("Caducidad");

        jLabel7.setText("Concepto");

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jcbtipoDocumento, javax.swing.GroupLayout.Alignment.TRAILING, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel6)
                                    .addComponent(txtSec1Compra, javax.swing.GroupLayout.PREFERRED_SIZE, 154, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 86, Short.MAX_VALUE)
                                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jdfechacaducidadFac, javax.swing.GroupLayout.PREFERRED_SIZE, 149, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jLabel5))))
                        .addContainerGap())
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(jLabel7)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addComponent(txtconcepto)))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jcbtipoDocumento, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(jLabel6)
                        .addGap(13, 13, 13))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                        .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 12, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)))
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(txtSec1Compra, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jdfechacaducidadFac, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel7)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtconcepto, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(4, 4, 4))
        );

        jPanel4.setBorder(javax.swing.BorderFactory.createTitledBorder("Porcentajes de Retencion"));

        jPanel5.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        jButton4.setText("IVA");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });

        jButton5.setText(" RENTA");
        jButton5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel5Layout = new javax.swing.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jButton4, javax.swing.GroupLayout.PREFERRED_SIZE, 75, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jButton5)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButton4)
                    .addComponent(jButton5))
                .addGap(32, 32, 32))
        );

        jPanel6.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {

            }
        ));
        jTable1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTable1MouseClicked(evt);
            }
        });
        jTable1.addInputMethodListener(new java.awt.event.InputMethodListener() {
            public void inputMethodTextChanged(java.awt.event.InputMethodEvent evt) {
                jTable1InputMethodTextChanged(evt);
            }
            public void caretPositionChanged(java.awt.event.InputMethodEvent evt) {
            }
        });
        jTable1.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                jTable1PropertyChange(evt);
            }
        });
        jTable1.addVetoableChangeListener(new java.beans.VetoableChangeListener() {
            public void vetoableChange(java.beans.PropertyChangeEvent evt)throws java.beans.PropertyVetoException {
                jTable1VetoableChange(evt);
            }
        });
        jScrollPane1.setViewportView(jTable1);

        javax.swing.GroupLayout jPanel6Layout = new javax.swing.GroupLayout(jPanel6);
        jPanel6.setLayout(jPanel6Layout);
        jPanel6Layout.setHorizontalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel6Layout.createSequentialGroup()
                .addContainerGap(23, Short.MAX_VALUE)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 452, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        jPanel6Layout.setVerticalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 146, Short.MAX_VALUE)
                .addContainerGap())
        );

        jPanel7.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        jButton3.setText("Cancelar");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        jButton2.setText("Guardar");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jPanel8.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        txtBaseFac.setBackground(new java.awt.Color(204, 255, 0));
        txtBaseFac.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txtBaseFac.setForeground(new java.awt.Color(0, 0, 255));
        txtBaseFac.setText("0.0");

        txtIvaFac.setBackground(new java.awt.Color(204, 204, 0));
        txtIvaFac.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txtIvaFac.setText("0.0");

        jLabel10.setText("Base");

        jLabel11.setText("IVA");

        jLabel9.setText("Total Retenido");

        txtTotal.setBackground(new java.awt.Color(204, 255, 204));
        txtTotal.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        txtTotal.setText("0.0");
        txtTotal.setEnabled(false);

        javax.swing.GroupLayout jPanel8Layout = new javax.swing.GroupLayout(jPanel8);
        jPanel8.setLayout(jPanel8Layout);
        jPanel8Layout.setHorizontalGroup(
            jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel8Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel11, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel10, javax.swing.GroupLayout.DEFAULT_SIZE, 72, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(txtIvaFac, javax.swing.GroupLayout.PREFERRED_SIZE, 96, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtBaseFac, javax.swing.GroupLayout.PREFERRED_SIZE, 96, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 25, Short.MAX_VALUE)
                .addGroup(jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(txtTotal, javax.swing.GroupLayout.PREFERRED_SIZE, 95, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel9))
                .addContainerGap())
        );
        jPanel8Layout.setVerticalGroup(
            jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel8Layout.createSequentialGroup()
                .addGap(0, 13, Short.MAX_VALUE)
                .addGroup(jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtBaseFac, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel10)
                    .addComponent(jLabel9))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtIvaFac, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel11)
                    .addComponent(txtTotal, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        javax.swing.GroupLayout jPanel7Layout = new javax.swing.GroupLayout(jPanel7);
        jPanel7.setLayout(jPanel7Layout);
        jPanel7Layout.setHorizontalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addComponent(jPanel8, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jButton3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButton2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanel7Layout.setVerticalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel8, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanel7Layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jButton2)
                        .addGap(18, 18, 18)
                        .addComponent(jButton3)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel5, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(jPanel6, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(jPanel7, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                .addComponent(jPanel5, javax.swing.GroupLayout.PREFERRED_SIZE, 48, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel7, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jPanel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 84, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void tsec3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_tsec3ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_tsec3ActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        Buscar_Proveedores bp = new Buscar_Proveedores();
        bp.consultadesdeCrearRetencio = true;
        Principal.desktopPane.add(bp);
        bp.setVisible(true);
//            tRUc.setText(proveerdor.getCedula());
//            tProveedor.setText(proveerdor.getNombre());


    }//GEN-LAST:event_jButton1ActionPerformed

    private void btnComprobanteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnComprobanteActionPerformed
        // TODO add your handling code here:
        Compras com = new Compras();
        ComprasDao compDao = new ComprasDao();
        BuscarCompras cc = new BuscarCompras();
        cc.buscaCompradesderegistrarRetencion = true;
        Principal.desktopPane.add(cc);
        cc.setVisible(true);
        indexnoselected = 10;
        

    }//GEN-LAST:event_btnComprobanteActionPerformed
    
    public static DefaultTableModel llenartableIva() {
        
        RetencionCDao rtDao = new RetencionCDao();
        
        listaporcentajesRetencion = rtDao.getlistaPorcentajesdeRetencion();
        
        DefaultTableModel modelo = null;
        String[] titulos
                = {"NUMERO", "ID", "PORCENTAJE", "TIPO", "DESCRIPCION"};
        String[] registros = new String[5];
        modelo = new DefaultTableModel(null, titulos) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // make read only fields except column 0,13,14
                //  return column == 0 || column == 13 || column == 14;
                return false;
            }
        };
        while (modelo.getRowCount() > 0) {
            modelo.removeRow(0);
        }
        for (Sri_porcentajes_retencion P : listaporcentajesRetencion) {
            
            if (P.getTipo().equalsIgnoreCase("IVA") && SelectPorcentajesRetencion.isChekiva) {
                
                registros[0] = P.getCodigo().toString();
                registros[1] = P.getId();
                registros[2] = P.getPorcentaje().toString();
                registros[3] = P.getTipo();
                registros[4] = P.getDescripcion();
                modelo.addRow(registros);
                
            }
            
        }
        
        return modelo;
    }
    
    public static DefaultTableModel llenartableRENTA() {
        
        RetencionCDao rtDao = new RetencionCDao();
        
        listaporcentajesRetencion = rtDao.getlistaPorcentajesdeRetencion();
        
        DefaultTableModel modelo = null;
        String[] titulos
                = {"NUMERO", "ID", "PORCENTAJE", "TIPO", "DESCRIPCION"};
        String[] registros = new String[5];
        modelo = new DefaultTableModel(null, titulos) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // make read only fields except column 0,13,14
                //  return column == 0 || column == 13 || column == 14;
                return false;
            }
        };
        while (modelo.getRowCount() > 0) {
            modelo.removeRow(0);
        }
        for (Sri_porcentajes_retencion P : listaporcentajesRetencion) {
            
            if (P.getTipo().equalsIgnoreCase("RENTA") && SelectPorcentajesRetencion.isCheckrenta) {
                
                registros[0] = P.getCodigo().toString();
                registros[1] = P.getId();
                registros[2] = P.getPorcentaje().toString();
                registros[3] = P.getTipo();
                registros[4] = P.getDescripcion();
                modelo.addRow(registros);
                
            }
            
        }
        
        return modelo;
    }

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
        // TODO add your handling code here:
        isOpenfromCrearRetencion = true;
        Frame f = JOptionPane.getFrameForComponent(this);
        SelectPorcentajesRetencion dialog = new SelectPorcentajesRetencion(f, true);
        dialog.isChekiva = true;
        
        dialog.jTable11.setModel(llenartableIva());
        dialog.setLocationRelativeTo(null);
        dialog.setVisible(true);
        

    }//GEN-LAST:event_jButton4ActionPerformed

    private void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5ActionPerformed
        // TODO add your handling code here:
        Frame f = JOptionPane.getFrameForComponent(this);
        isOpenfromCrearRetencion = true;
        SelectPorcentajesRetencion dialog2 = new SelectPorcentajesRetencion(f, true);
        dialog2.isCheckrenta = true;
        dialog2.jTable11.setModel(llenartableRENTA());
        dialog2.setLocationRelativeTo(null);
        dialog2.setVisible(true);
        //
/////
//////
    }//GEN-LAST:event_jButton5ActionPerformed

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        // TODO add your handling code here:
        if (evt.getClickCount() == 2) {
            
            try {
                
                if (evt.getClickCount() == 2) {
                    if (jTable1.getSelectedRow() != -1) {
                        // remove selected row from the model
                        if (jTable1.getRowCount() > 0) {
                            ///eliminamos la fila seleccionada y actualizamos el total de la factura
                            int row = jTable1.getSelectedRow();
                            modelo.removeRow(row);
                            int i = 0;
                            Double val = 0.0;
                            Crear_RetencionC.txtTotal.setText("0.0");
                            while (i <= Crear_RetencionC.modelo.getRowCount()) {
                                val = val + Double.parseDouble(Crear_RetencionC.modelo.getValueAt(i, 6).toString());
                                String totalret = String.valueOf(String.format("%.4f", val).replace(",", "."));
                                Crear_RetencionC.txtTotal.setText(totalret);
                                i++;
                            }
                        }
                        
                    }
                }
                jTable1.setModel(modelo);
                
            } catch (Exception e) {
                Deb.consola("Vista.Usuarios.Crear_RetencionC.jTable1MouseClicked()" + e);
            }
        }
    }//GEN-LAST:event_jTable1MouseClicked
    
    private void operacionesSumaColumnasOnJtablet() {
        Deb.consola("aaaaaaaaaaaaentraaaaaaaa");
        if (jTable1.getRowCount() > 0) {
            ///eliminamos la fila seleccionada y actualizamos el total de la factura
            Double costo = 0.0;
            for (int i = 0; i < modelo.getRowCount(); i++) {
                costo = costo + Double.valueOf(modelo.getValueAt(i + 1, 6).toString().replace(",", "."));
                txtTotal.setText(String.valueOf(costo));
            }
            
        }
        
    }
    
    private void addOrDeleteRowTable(JTable table) {
        table.getModel().addTableModelListener(new TableModelListener() {
            @Override
            public void tableChanged(TableModelEvent e) {
                boolean esNUmero = false;
                Deb.consola(".tableChanged()ssentro en ek jtatableeee");
//                if (e.getType() == TableModelEvent.UPDATE) {
//
//                    int col = e.getColumn();
//                    int fila = e.getFirstRow();
//                    if (col == 3 || col == 4 || col == 5 || col == 7) {
//
//                        if (!ValidaNUmeros.isOnlyDouble(jTable1.getValueAt(fila, 4).toString())) {
//                            jTable1.setValueAt("1.0", fila, 4);
//                        }
//                        if (!ValidaNUmeros.isOnlyDouble(jTable1.getValueAt(fila, 5).toString())) {
//                            jTable1.setValueAt("0.0", fila, 5);
//                        }
//                        if (!ValidaNUmeros.isOnlyDouble(jTable1.getValueAt(fila, 7).toString())) {
//                            Double precio = Double.valueOf(modelo.getValueAt(fila, 8).toString().replace(",", "."));
//                            jTable1.setValueAt(precio, fila, 7);
//
//                        }
//                        operacionFacturauPDATEandAddRowrs();
//                        jTable1.setValueAt(fila, fila, 1);
//
////                        
////                        for (int i = 0; i < jTable1.getModel().getRowCount(); i++) {
////                            //  Deb.consola("Vista.Usuarios.Crear_Facturas.addOrDeleteRowTable(): " + jTable1.getRowCount());
////                            jTable1.setValueAt("dd", i, 1);
////                        }
//                    }
//                }
                if (e.getType() == TableModelEvent.UPDATE) {
                    operacionesSumaColumnasOnJtablet();
                }
                if (e.getType() == TableModelEvent.INSERT) {
                    
                    operacionesSumaColumnasOnJtablet();
                    
                }
                if (e.getType() == TableModelEvent.DELETE) {
                    operacionesSumaColumnasOnJtablet();
                    
                }
                
            }
        });
/// pongo numero de item en columna1 en cada evento depus de que  se hya realizado cuaaquier accion sea update
        //delete or add row

    }
    private void jTable1PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_jTable1PropertyChange
        // TODO add your handling code here:

        Deb.consola("Vista.Usuarios.Crear_RetencionC.jTable1PropertyChange()sssssssssssssssssssssss");
    }//GEN-LAST:event_jTable1PropertyChange

    private void jTable1InputMethodTextChanged(java.awt.event.InputMethodEvent evt) {//GEN-FIRST:event_jTable1InputMethodTextChanged
        // TODO add your handling code here:
        Deb.consola("sssssssffff");
    }//GEN-LAST:event_jTable1InputMethodTextChanged

    private void jTable1VetoableChange(java.beans.PropertyChangeEvent evt)throws java.beans.PropertyVetoException {//GEN-FIRST:event_jTable1VetoableChange
        // TODO add your handling code here:
        Deb.consola("sssssssfffwwwwwwwwwwwwwf");
    }//GEN-LAST:event_jTable1VetoableChange

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        // TODO add your handling code here:
        dispose();
    }//GEN-LAST:event_jButton3ActionPerformed
    private void getNuevonumeroRetencion() {
        RetencionCDao tdao = new RetencionCDao();
        ArrayList<String> sec = new ArrayList<String>();
        sec = tdao.getNextumeroDeRetencionbyEquipo(login.CodigoDelEquipo);
        if (!sec.isEmpty()) {
            
            int i = 1;
            Deb.consola("XXXXXXXXXXXXXXXXXXXXXX SECUENCIA ret: " + sec);
            for (String partSecuencua : sec) {
                
                Deb.consola("XXXXXXXXXXXXXXXXXXXXXX SECUENCIA ret: " + partSecuencua);
                if (i == 1) {
                    tsec1.setText(partSecuencua);
                }
                if (i == 2) {
                    tsec2.setText(partSecuencua);
                }
                if (i == 3) {
                    Integer num = Integer.valueOf(partSecuencua);
                    num = num + 1;
                    DecimalFormat formateador = new DecimalFormat("000000000");
                    String format = formateador.format(num);
                    tsec3.setText(String.valueOf(format));
                }
                i++;
            }
        } else {
//            tsec1.setText("001");
//            tsec2.setText("001");

            if (ValidaNUmeros.isOnlyNumbers(tsec3.getText())) {
                tsec1.setText(OperacionesForms.validaNumeroFactura3(tsec1.getText()));
                Integer num = Integer.valueOf(tsec3.getText());
                num = num + 1;
                DecimalFormat formateador = new DecimalFormat("000000000");
                String format = formateador.format(num);
                tsec3.setText(String.valueOf(format));
                if (tsec3.getText().equals("000000000")) {
                    tsec3.setText("000000001");
                }
                
            }
        }
    }
    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        
        if (jTable1.getRowCount() > 0) {
//////////// CONSULTO SI EXISTE CXP, SI ES ASI, REGISTRAMOS ANTICIPO A OLA CXP
            cxpDao cDao = new cxpDao();
            Cxp c = new Cxp();
            c = cDao.BuscarConNumeroDocumentoCompraID(compra.getCodigo());

//////////////
            Retencion_ r = new Retencion_();
            RetencionCDao rdao = new RetencionCDao();
            r.setAutorizacion(t_ClaveAcceso.getText());
            long d = jdfechacaducidadFac.getDate().getTime();
            java.sql.Date fecha = new java.sql.Date(d);
            r.setCaducidad(fecha);
            long d2 = jdfecha1.getDate().getTime();
            java.sql.Date fecha2 = new java.sql.Date(d2);
            r.setFecha(fecha2);
            
            r.setCompra_seceuncia(txtSec1Compra.getText());
            r.setCompras_codigo(compra.getCodigo());
            r.setConcepto(txtconcepto.getText());
            r.setProveedor_codigo(compra.getProveedores_codigo());
            r.setSecuencia(tsec1.getText().toString() + "-" + tsec2.getText().toString() + "-" + tsec3.getText().toString());
            r.setTipo_comprobante(jcbtipoDocumento.getSelectedItem().toString());
            
            r.setTotal(Double.parseDouble(txtTotal.getText()));
            r.setUsuario_codigo(compra.getUsuarios_Codigo());
            r.setSec1(tsec1.getText());
            r.setSec2(tsec2.getText());
            r.setSec3(tsec3.getText());
            r.setEquipo_codigo(login.CodigoDelEquipo);
            getNuevonumeroRetencion();
            Integer codigoRetencion = rdao.guardar(r);
            
            int rows = jTable1.getRowCount();
            for (int i = 0; i < rows; i++) {
                
                DetalleRetencion det = new DetalleRetencion();
                DetalleRetencionDao detDao = new DetalleRetencionDao();
                det.setBase(Double.parseDouble(jTable1.getValueAt(i, 2).toString()));
                det.setEjercicio(Principal.periodo);
                det.setId(jTable1.getValueAt(i, 4).toString());
                det.setImpuesto(jTable1.getValueAt(i, 3).toString());
                
                det.setPorcentaje(Integer.parseInt(jTable1.getValueAt(i, 5).toString()));
                det.setRetencion_codigo(codigoRetencion);
                det.setRetenido(Double.parseDouble(jTable1.getValueAt(i, 6).toString()));
                detDao.guardar(det);
            }
            if (Double.parseDouble(c.getSaldo()) > 0.0) {
                Pagoscxp p = new Pagoscxp();
                PagoscxpDao pdao = new PagoscxpDao();
                p.setCxp_codigo(c.getCodigo());
                p.setDescripcion("REGISTRO DE PAGO DESDE " + login.nombreDelEquipo + " usuario: " + login.nombresUsuario + " POR RETENCION # " + tsec1.getText() + "-" + tsec2.getText() + "-" + tsec3.getText());
                p.setTipo(OperacionesForms._RETENCION_TEXT);
                p.setTotal(Double.parseDouble(txtTotal.getText()));
                p.setVisible(1);
                pdao.guardar(p);
                Cxp cp = new Cxp();
                cxpDao cpdao = new cxpDao();
                Double saldo = Double.parseDouble(c.getSaldo());
                Double nuevosaldo = saldo - Double.parseDouble(txtTotal.getText());
                String tc = String.format("%.2f", nuevosaldo).replace(",", ".");
                c.setSaldo(tc);
                cpdao.modificar(c);
            } else {
                ///registrar anticipo a proveedor
            }
            this.dispose();
        }

    }//GEN-LAST:event_jButton2ActionPerformed

    private void jcbtipoDocumentoItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jcbtipoDocumentoItemStateChanged
        // TODO add your handling code here:

        for (sri_tipocomprobante object : listaTipoComporabante) {
            //   jcbtipoDocumento.addItem(object.getId() + " - " + object.getTipocomprobante());
            if (jcbtipoDocumento.getSelectedItem().toString().contains(object.getTipocomprobante()));
            tipoDocID = object.getId();
        }
    }//GEN-LAST:event_jcbtipoDocumentoItemStateChanged

    private void tsec1KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_tsec1KeyPressed
        // TODO add your handling code here:


    }//GEN-LAST:event_tsec1KeyPressed

    private void tsec2KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_tsec2KeyPressed
        // TODO add your handling code here:

    }//GEN-LAST:event_tsec2KeyPressed

    private void tsec3KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_tsec3KeyPressed
        // TODO add your handling code here:

    }//GEN-LAST:event_tsec3KeyPressed

    private void tsec1KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_tsec1KeyReleased
        // TODO add your handling code here:
        generarClaveAcceso();
    }//GEN-LAST:event_tsec1KeyReleased

    private void tsec2KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_tsec2KeyReleased
        // TODO add your handling code here:
        //getNuevonumeroRetencion();
        tsec1.setText(OperacionesForms.validaNumeroFactura3(tsec1.getText()));
        generarClaveAcceso();
    }//GEN-LAST:event_tsec2KeyReleased

    private void tsec3KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_tsec3KeyReleased
        // TODO add your handling code here:
        // getNuevonumeroRetencion();
        tsec1.setText(OperacionesForms.validaNumeroFactura3(tsec1.getText()));
        generarClaveAcceso();
    }//GEN-LAST:event_tsec3KeyReleased

    private void tsec1FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_tsec1FocusLost
        // TODO add your handling code here:
        tsec1.setText(OperacionesForms.validaNumeroFactura3(tsec1.getText()));
        // getNuevonumeroRetencion();
        generarClaveAcceso();

    }//GEN-LAST:event_tsec1FocusLost

    private void tsec2FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_tsec2FocusLost
        // TODO add your handling code here:
        tsec2.setText(OperacionesForms.validaNumeroFactura3(tsec2.getText()));
        //getNuevonumeroRetencion();
        generarClaveAcceso();
    }//GEN-LAST:event_tsec2FocusLost

    private void tsec3FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_tsec3FocusLost
        // TODO add your handling code here:
        tsec3.setText(OperacionesForms.validaNumeroFactura9(tsec3.getText()));
        getNuevonumeroRetencion();
        generarClaveAcceso();
    }//GEN-LAST:event_tsec3FocusLost


    // Variables declaration - do not modify//GEN-BEGIN:variables
    public static javax.swing.JButton btnComprobante;
    public static javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JButton jButton5;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JPanel jPanel8;
    private javax.swing.JScrollPane jScrollPane1;
    public static javax.swing.JTable jTable1;
    public static javax.swing.JComboBox<String> jcbtipoDocumento;
    private com.toedter.calendar.JDateChooser jdfecha1;
    public static com.toedter.calendar.JDateChooser jdfechacaducidadFac;
    public static javax.swing.JTextField tProveedor;
    public static javax.swing.JTextField tRUc;
    public static javax.swing.JTextField t_ClaveAcceso;
    public static javax.swing.JTextField tsec1;
    public static javax.swing.JTextField tsec2;
    public static javax.swing.JTextField tsec3;
    public static javax.swing.JLabel txtBaseFac;
    public static javax.swing.JLabel txtIvaFac;
    public static javax.swing.JTextField txtSec1Compra;
    public static javax.swing.JTextField txtTotal;
    private javax.swing.JTextField txtconcepto;
    // End of variables declaration//GEN-END:variables
}
