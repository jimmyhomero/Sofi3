/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares.NewSql.Forms;

import ClasesAuxiliares.KeysEnventos;
import Modelo.Clientes;
import Vista.Principal;
import ClasesAuxiliares.debug.Deb;
import Vlidaciones.ProgressBar;
import Vlidaciones.ValidaNUmeros;
import static com.sun.java.accessibility.util.AWTEventMonitor.addComponentListener;
import com.toedter.calendar.JDateChooser;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.event.KeyEvent;
import java.beans.PropertyVetoException;
import java.text.DecimalFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JInternalFrame;
import javax.swing.JMenuBar;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.RowFilter;
import javax.swing.event.InternalFrameEvent;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableRowSorter;

/**
 *
 * @author USUARIO
 */
public class OperacionesForms {

    public static ecx.unomas.factura.Factura factura = new ecx.unomas.factura.Factura();
    public static String rutadocPDFgeneradook;
    
    public static boolean solocrearFacturaNOgenerrarPDF = false;
    public static String _CONSUMIDIR_FINAL = "CONSUMIDORFINAL";
    public static String _CONSUMIDOR_FINAL_RUC = "9999999999";
    public static String _TITLE_FORM_NOTA_CREDITO = "CREAR_NOTA_DE_CREDITO";
    public static String _TITLE_FORM_FACTURA = "CREAR_NOTA_FACTURA";
    public static DefaultTableModel dm;
    public static Integer _ID_CODIGO_PLAN_CUENTA_0 = 0;
    //////////////FORMAS DE PAGO POR DEFECTO
    public static String _EFECTIVO_TEXT = "EFECTIVO";
    public static String _CREDITO_TEXT = "CREDITO";
    public static String _CHEQUE_TEXT = "CHEQUE";
    public static String _PLAN_ACUMULATIVO_TEXT = "PLAN ACUMULATIVO";
    ////////////PERIDOS DE COBRANZA BASICOS
    public static String _DIARIO_TEXT = "DIARIO";
    public static String _SEMANAL_TEXT = "SEMANAL";
    public static String _QUINCENAL_TEXT = "QUINCENAL";
    public static String _MENSUAL_TEXT = "MENSUAL";
    public static String _ANUAL_TEXT = "ANUAL";
    public static String _FORMA_PAGO_CXC_TEXT = "CXC";
    public static String _FORMA_PAGO_CXP_TEXT = "CXP";

    public static String _BOTON_ACEPTAR_TEXT = "ACEPTAR";
    public static String _COMBO_SELECCIONE_TEXT = "SELECCIONE";
    public static Color _BOTON_COLOR_PRIMARY = new Color(2, 117, 216);
    public static Color _BOTON_COLOR_SUCCES = new Color(92, 184, 92);
    public static Color _BOTON_COLOR_INFO = new Color(91, 192, 222);
    public static Color _BOTON_COLOR_WARNING = new Color(240, 173, 78);
    public static Color _BOTON_COLOR_DANGER = new Color(217, 83, 79);
    public static String _BOTON_CANCELAR_TEXT = "CANCELAR";
    public static Font _TAMANO_LETRA_GRANDE = new Font("Tahoma", 1, 14);
    public static Font _TAMANO_LETRA_NORMAL = new Font("Tahoma", 0, 13);// jButton1.setFont(new java.awt.Font("Tahoma", 1, 14)); 
    String[] a;

    ///////////////consumidor final
    public static Clientes _OBJ_CONSUMIDOR_FINAL = new Clientes();

    //////////////////////////////
    
    
    ///////////////////
    
    public static void jtableVentascolumnas(JTable tb, int valorClumnas,boolean modoDesarrollo){
    
    
    }
    /////////////////////
///////////////////////combobox
    public static void inicializarJtextFieldMyusculas(JTextField j) {

        j.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                if (evt.getKeyCode() == KeyEvent.VK_HOME || evt.getKeyCode() == KeyEvent.VK_END
                        || evt.getKeyCode() == KeyEvent.VK_SHIFT || evt.getKeyCode() == KeyEvent.VK_CONTROL
                        || evt.getKeyCode() == KeyEvent.VK_LEFT || evt.getKeyCode() == KeyEvent.VK_RIGHT
                        || evt.getKeyCode() == KeyEvent.VK_UP || evt.getKeyCode() == KeyEvent.VK_DOWN) {
                } else {
                    j.setText(j.getText().toUpperCase());
                }
            }
        });
    }

    public static void ocultarComponente(JTextField obj, Integer x, Integer y) {

        obj.addHierarchyBoundsListener(new java.awt.event.HierarchyBoundsListener() {
            public void ancestorMoved(java.awt.event.HierarchyEvent evt) {
            }

            public void ancestorResized(java.awt.event.HierarchyEvent evt) {
                obj.setSize(new Dimension(x, y));
            }
        });

    }

    public static void ocultarComponente(JCheckBox obj, Integer x, Integer y) {

        obj.addHierarchyBoundsListener(new java.awt.event.HierarchyBoundsListener() {
            public void ancestorMoved(java.awt.event.HierarchyEvent evt) {
            }

            public void ancestorResized(java.awt.event.HierarchyEvent evt) {
                obj.setSize(new Dimension(x, y));
            }
        });

    }

    public static void ocultarComponente(JComboBox obj, Integer x, Integer y) {

        obj.addHierarchyBoundsListener(new java.awt.event.HierarchyBoundsListener() {
            public void ancestorMoved(java.awt.event.HierarchyEvent evt) {
            }

            public void ancestorResized(java.awt.event.HierarchyEvent evt) {
                obj.setSize(new Dimension(x, y));
            }
        });

    }

    public static void ocultarComponente(JButton obj, Integer x, Integer y) {

        obj.addHierarchyBoundsListener(new java.awt.event.HierarchyBoundsListener() {
            public void ancestorMoved(java.awt.event.HierarchyEvent evt) {
            }

            public void ancestorResized(java.awt.event.HierarchyEvent evt) {
                obj.setSize(new Dimension(x, y));
            }
        });

    }

    public static void ocultarComponente(JRadioButton obj, Integer x, Integer y) {

        obj.addHierarchyBoundsListener(new java.awt.event.HierarchyBoundsListener() {
            public void ancestorMoved(java.awt.event.HierarchyEvent evt) {
            }

            public void ancestorResized(java.awt.event.HierarchyEvent evt) {
                obj.setSize(new Dimension(x, y));
            }
        });

    }

    public static void ocultarComponente(JPanel obj, Integer x, Integer y) {

        obj.addHierarchyBoundsListener(new java.awt.event.HierarchyBoundsListener() {
            public void ancestorMoved(java.awt.event.HierarchyEvent evt) {
            }

            public void ancestorResized(java.awt.event.HierarchyEvent evt) {
                obj.setSize(new Dimension(x, y));
            }
        });

    }

    public static void ocultarComponente(JTextArea obj, Integer x, Integer y) {

        obj.addHierarchyBoundsListener(new java.awt.event.HierarchyBoundsListener() {
            public void ancestorMoved(java.awt.event.HierarchyEvent evt) {
            }

            public void ancestorResized(java.awt.event.HierarchyEvent evt) {
                obj.setSize(new Dimension(x, y));
            }
        });

    }

    public static void ocultarComponente(JDateChooser obj, Integer x, Integer y) {

        obj.addHierarchyBoundsListener(new java.awt.event.HierarchyBoundsListener() {
            public void ancestorMoved(java.awt.event.HierarchyEvent evt) {
            }

            public void ancestorResized(java.awt.event.HierarchyEvent evt) {
                obj.setSize(new Dimension(x, y));
            }
        });

    }

    public static void inicializarJtextFieldMyusculas(JTextArea j) {

        j.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                if (evt.getKeyCode() == KeyEvent.VK_HOME || evt.getKeyCode() == KeyEvent.VK_END
                        || evt.getKeyCode() == KeyEvent.VK_SHIFT || evt.getKeyCode() == KeyEvent.VK_CONTROL
                        || evt.getKeyCode() == KeyEvent.VK_LEFT || evt.getKeyCode() == KeyEvent.VK_RIGHT
                        || evt.getKeyCode() == KeyEvent.VK_UP || evt.getKeyCode() == KeyEvent.VK_DOWN) {
                } else {
                    j.setText(j.getText().toUpperCase());
                }
            }
        });
    }

    public static void Inicializar_Combobox_Seleccione(JComboBox j) {
        j.setModel(new javax.swing.DefaultComboBoxModel<>(new String[]{_COMBO_SELECCIONE_TEXT}));
        j.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {

            }
        });
    }
    
        public static void Inicializar_Combobox_TamanoCero(JComboBox j) {
            j.setSize(0, 0);       
    }

    //
    public static void inicializadPeriodosCObranza(JComboBox j) {

        j.setModel(new javax.swing.DefaultComboBoxModel<>(new String[]{_DIARIO_TEXT, _SEMANAL_TEXT, _QUINCENAL_TEXT, _MENSUAL_TEXT, _ANUAL_TEXT}));

    }

    //////////////////////
    public OperacionesForms() {

    }

    public static void setbuttonsAceptarCancelar(JButton aceptrar, JButton cancelar) {
        aceptrar.setText(OperacionesForms._BOTON_ACEPTAR_TEXT);
        aceptrar.setBackground(OperacionesForms._BOTON_COLOR_PRIMARY);
        aceptrar.setFont(OperacionesForms._TAMANO_LETRA_GRANDE);
        cancelar.setText(OperacionesForms._BOTON_CANCELAR_TEXT);
        cancelar.setBackground(OperacionesForms._BOTON_COLOR_WARNING);
        cancelar.setFont(OperacionesForms._TAMANO_LETRA_GRANDE);

    }

    public static String validaNumeroFactura3(String cadena) {
        if (ValidaNUmeros.isOnlyNumbers(cadena) && (cadena.length() <= 3)) {
            Integer num = Integer.parseInt(cadena);
            DecimalFormat formateador = new DecimalFormat("000");
            String format = formateador.format(num);
            cadena = (String.valueOf(format));

        } else {
            cadena = "001";
        }
        return cadena;
    }

    public static String validaNumeroFactura9(String cadena) {

        try {
            if (ValidaNUmeros.isOnlyNumbers(cadena) && (cadena.length() <= 9)) {
                Integer num = Integer.parseInt(cadena);
                DecimalFormat formateador = new DecimalFormat("000000000");
                String format = formateador.format(num);
                cadena = (String.valueOf(format));

            } else {
                cadena = "000000001";

            }

        } catch (Exception e) {
            Deb.consola("ClasesAuxiliares.NewSql.Forms.OperacionesForms.validaNumeroFactura9(): " + e);
        }
        return cadena;
    }

    public static String ValidaNumeroFacturaCompraKeyRelesed3(String numfac) {

        if (!ValidaNUmeros.isOnlyNumbers(numfac) || !(numfac.length() <= 3) || numfac.equals("000")) {
            numfac = "001";
        }
        return numfac;
    }

    public static String ValidaNumeroFacturaCompraKeyRelesed9(String numfac) {

        if (!ValidaNUmeros.isOnlyNumbers(numfac) || !(numfac.length() <= 9) || numfac.equals("000000000")) {
            numfac = "000000001";
        }
        return numfac;
    }

    public static String ValidaNumeroFacturaCompraNumeroAutorizacion(String numfac) {

        if (!ValidaNUmeros.isOnlyNumbers(numfac)) {
            //    ValidaNUmeros.buscarNumeroIntoString(numfac)
            numfac = numfac.substring(0, numfac.length() - 1);
        }
        return numfac;
    }

    public static void nuevaVentanaInternalForm(JInternalFrame val, String tituloVentana, boolean maximizado) {
        int numVentana = 0;/// si es cero, significa que no se ha encontrado un frmulario de tipo que ya ecista 
        Deb.consola("ClasesAuxiliares.NewSql.Forms.OperacionesForms.nuevaVentanaInternalForm():nombre:  " + val.getName());
        JInternalFrame v[] = Principal.desktopPane.getAllFrames();
        Principal.controlareduccionPrincilapParamenusuperior = 1;
        if (maximizado) {
            val.addComponentListener(new java.awt.event.ComponentAdapter() {
                public void componentResized(java.awt.event.ComponentEvent evt) {

                    try {
                        Deb.consola("Tamano de la ventana se adapta al Principal");
                        Principal.tananoVentanas(val);
                        val.setSelected(true);
                        Principal.crearBarraBotones(val);
                    } catch (PropertyVetoException ex) {
                        ProgressBar.mostrarMensajeRojo("123a" + ex.toString());
                        Logger.getLogger(OperacionesForms.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            });
        }
        if (v.length >= 1) {

            for (int i = 0; i < v.length; i++) {
                if (v[i].getTitle() == tituloVentana) {
                    Deb.consola("ClasesAuxiliares.NewSql.Forms.OperacionesForms.nuevaVentanaInternalForm()xxxxxxxaas");
                    if (numVentana == 0) {
                        Deb.consola("ClasesAuxiliares.NewSql.Forms.OperacionesForms.nuevaVentanaInternalForm()ventana nueva");
                        numVentana = 100;
                        try {
                            v[i].setSelected(true);
                        } catch (PropertyVetoException ex) {
                            Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    } else {
                        Deb.consola("ClasesAuxiliares.NewSql.Forms.OperacionesForms.nuevaVentanaInternalForm()dispose");
                        v[i].dispose();
                    }
                } else {
                    if (numVentana == 0) {
                        Deb.consola("ClasesAuxiliares.NewSql.Forms.OperacionesForms.nuevaVentanaInternalForm() Hay ventanas abiertas perono no hay abireta la que necesito");
                        try {

                            numVentana = 100;
                            Principal.desktopPane.add(val);
                            if (maximizado) {
                                val.setMaximum(maximizado);
                            }
                            val.setVisible(true);
                        } catch (PropertyVetoException ex) {
                            ProgressBar.mostrarMensajeRojo(ex.toString());
                            Logger.getLogger(OperacionesForms.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }

            }
            numVentana = 0;
        } else {
            try {
                Deb.consola("ClasesAuxiliares.NewSql.Forms.OperacionesForms.nuevaVentanaInternalForm()NUevoooooo");
                Principal.desktopPane.add(val);
                if (maximizado) {
                    val.setMaximum(true);
                    //Principal.tananoVentanas(val);

                }
                val.setVisible(true);

            } catch (PropertyVetoException ex) {
                ProgressBar.mostrarMensajeRojo(ex.toString());
                Logger.getLogger(OperacionesForms.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public static void EliminarJbutonsalcerrarJinternalFrame(JInternalFrame val) {
        int numVentana = 0;/// si es cero, significa que no se ha encontrado un frmulario de tipo que ya ecista 
        Deb.consola("ClasesAuxiliares.NewSql.Forms.OperacionesForms.nuevaVentanaInternalForm():nombre:  " + val.getName());
        JInternalFrame v[] = Principal.desktopPane.getAllFrames();
        Principal.controlareduccionPrincilapParamenusuperior = 1;
        /////////////
        val.addInternalFrameListener(new javax.swing.event.InternalFrameListener() {

            public void internalFrameClosing(javax.swing.event.InternalFrameEvent evt) {
                Principal.elimiarBotonalCerrarVentanas(val);
            }

            @Override
            public void internalFrameOpened(InternalFrameEvent e) {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }

            @Override
            public void internalFrameClosed(InternalFrameEvent e) {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }

            @Override
            public void internalFrameIconified(InternalFrameEvent e) {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }

            @Override
            public void internalFrameDeiconified(InternalFrameEvent e) {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }

            @Override
            public void internalFrameActivated(InternalFrameEvent e) {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }

            @Override
            public void internalFrameDeactivated(InternalFrameEvent e) {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }

        });

        ///////////
        if (v.length >= 1) {
        
        }
    }

    public static void eliminaventanasyorganizabotones(JInternalFrame val, String tituloVentana) {
        int numVentana = 0;/// si es cero, significa que no se ha encontrado un frmulario de tipo que ya ecista 
        Deb.consola("ClasesAuxiliares.NewSql.Forms.OperacionesForms.nuevaVentanaInternalForm():nombre:  " + val.getName());
        JInternalFrame v[] = Principal.desktopPane.getAllFrames();
        Principal.controlareduccionPrincilapParamenusuperior = 1;
        if (v.length >= 1) {

            for (int i = 0; i < v.length; i++) {
                if (v[i].getTitle() == tituloVentana) {

                    Deb.consola("ClasesAuxiliares.NewSql.Forms.OperacionesForms.nuevaVentanaInternalForm()xxxxxxxaas");
                    if (numVentana == 0) {
                        Deb.consola("CasesAuxiliares.NewSql.Forms.OperacionesForms.nuevaVentanaInternalForm()ventana nueva");
                        numVentana = 100;
                        try {
                            v[i].setSelected(true);
                        } catch (PropertyVetoException ex) {
                            Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    } else {
                        Deb.consola("ClasesAuxiliares.NewSql.Forms.OperacionesForms.nuevaVentanaInternalForm()dispose");
                        v[i].dispose();
                    }
                } else {
                    if (numVentana == 0) {
                        Deb.consola("ClasesAuxiliares.NewSql.Forms.OperacionesForms.nuevaVentanaInternalForm() Hay ventanas abiertas perono no hay abireta la que necesito");
                        numVentana = 100;
                        Principal.desktopPane.add(val);
                        val.setVisible(true);
                    }
                }

            }
            numVentana = 0;
        } else {

            Deb.consola("ClasesAuxiliares.NewSql.Forms.OperacionesForms.nuevaVentanaInternalForm()NUevoooooo");
            Principal.desktopPane.add(val);

            val.setVisible(true);

        }
    }

    public static void valitarjtexfieldOnlyDouble(JTextField j) {
        j.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                if (!ValidaNUmeros.isOnlyDouble(j.getText())) {
                    j.setText("0.0");
                    j.selectAll();
                }
            }
        });

        ///////////selectAll Al obtener el foco
        j.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                j.selectAll();
            }
        });
    }

    public static Integer rerurnsiradioButonisCheked(JRadioButton r) {
        if (r.isSelected()) {
            return 1;
        } else {
            return 0;
        }
    }

    public static void filtro(String consulta, JTable jtableBuscar) {
        dm = (DefaultTableModel) jtableBuscar.getModel();
        TableRowSorter<DefaultTableModel> tr = new TableRowSorter<>(dm);
        jtableBuscar.setRowSorter(tr);
        tr.setRowFilter(RowFilter.regexFilter(consulta));
    }
}
