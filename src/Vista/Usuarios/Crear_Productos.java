/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista.Usuarios;

import Vista.Productos.Buscar_Productos;
import ClasesAuxiliares.CodigodeBarras;
import ClasesAuxiliares.NewSql.Forms.OperacionesForms;
import ClasesAuxiliares.Variables;
import ClasesAuxiliares.http.getUrlFromGoogle;
import Controlador.Usuarios.MarcasDao;
import Controlador.Usuarios.ModelosDao;
import Controlador.Usuarios.ProductosDao;
import Modelo.Marcas;
import ClasesAuxiliares.debug.Deb;
import Modelo.Modelos;
import Modelo.Productos;
import Modelo.Usuarios;
import Vista.Principal;
import Vlidaciones.ProgressBar;
import Vlidaciones.VaciarTexto;
import Vlidaciones.ValidaEmail;
import Vlidaciones.ValidaNUmeros;
import com.mxrck.autocompleter.AutoCompleterCallback;
import com.mxrck.autocompleter.TextAutoCompleter;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Frame;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.net.URL;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.swing.ComboBoxModel;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.JRootPane;
import javax.swing.JTextField;
import javax.swing.SwingUtilities;
import javax.swing.filechooser.FileNameExtensionFilter;
import static Vista.Usuarios.Crear_Clientes.jcb_FormaPagoPredeterminada;
import java.util.Random;

/**
 *
 * @author USUARIO
 */
public class Crear_Productos extends javax.swing.JInternalFrame {

    public static File imageProducto = null;
    public static boolean imagenexitasamentecargadSiNo = false;
    String ruta;
    String nombreFichero;

    TextAutoCompleter autocompleteMarcas = null;
    ArrayList<Marcas> lista_Marcas = new ArrayList<Marcas>();
    TextAutoCompleter autocompleteModelos = null;
    ArrayList<Modelos> lista_Modelos = new ArrayList<Modelos>();
    public static Integer indexPositiotoolBar;
    ValidaEmail obj_valida_email = new ValidaEmail();
    ProgressBar a = new ProgressBar(1000, "Mensaje Inicial");

    ArrayList<Modelos> lista_Modelos_filtrados = new ArrayList<Modelos>();

    Integer codigoMarca = -1;
    Integer codigoModelo = -1;
    String marcaSeleccionada = "";
    String categoriaSeleccionada = "";
    Object items_jcb_maracs;
    Object items_jcb_modleos;
    public static Object setItemSelectModelo;
    public static Object setItemSelectMarcas;
    public static String actualizarSiNO = "no";
    //public static List<String> listJcbModelo = new ArrayList<String>();
    //public static List<String> listJcbMarcas = new ArrayList<String>();
    Modelos modelos = new Modelos();
    ModelosDao modelosDao = new ModelosDao();

    /**
     * Creates new form FCUsuarios
     */
    public Crear_Productos() {

        initComponents();
        OperacionesForms.inicializarJtextFieldMyusculas(txt_producto);
        txt_costo.selectAll();
        txt_garantiameses.setEnabled(false);
        this.setSize(850, 613);
        Deb.consola("Vista.Usuarios.Crear_Productos.<init>()actializarsiNo" + actualizarSiNO);
        Deb.consola("Vista.Usuarios.Crear_Productos.<init>()uuuu" + setItemSelectMarcas);
        Deb.consola("Vista.Usuarios.Crear_Productos.<init>()//" + setItemSelectModelo);
        txt_utilidad.setText(Principal.utilidad);

        ModelosDao objModeloDao = new ModelosDao();
        lista_Modelos = objModeloDao.listar();
        try {

            if (actualizarSiNO.equals("si")) {

            } else {
                if (check_codigoBarras.isSelected()) {
                    crearCodigodeBarras();
                }

            }
        } catch (Exception e) {
            Deb.consola("ssss" + e.toString());
        }
///////////////// marcas

        MarcasDao objMarcasDao = new MarcasDao();
        lista_Marcas = objMarcasDao.listar();
////autocomplete

        autocompleteMarcas = new TextAutoCompleter(txt_marca, new AutoCompleterCallback() {

            @Override
            public void callback(Object selectedItem) {

                if (selectedItem instanceof Marcas) {
                    Marcas c = new Marcas();
                    c = ((Marcas) selectedItem);

                    txt_marca.setText(c.getMarca());
                    txt_categorias.setEditable(true);
                    codigoMarca = c.getCodigo();
                    marcaSeleccionada = c.getMarca();
                    txt_categorias.transferFocus();
                    //Deb.consola(((Clientes) selectedItem).getNombre() + " casas"); // Imprime 25

                } else {
                    Deb.consola("El item es de un tipo desconocido");
                }

            }
        });
        autocompleteMarcas.setCaseSensitive(false);
        autocompleteMarcas.setMode(0);
        for (Marcas p : lista_Marcas) {
            autocompleteMarcas.addItem(p);
        }

        autocompleteModelos = new TextAutoCompleter(txt_categorias, new AutoCompleterCallback() {

            @Override
            public void callback(Object selectedItem) {

                if (selectedItem instanceof Modelos) {
                    Modelos c = new Modelos();
                    c = ((Modelos) selectedItem);
                    codigoModelo = c.getCodigo();
                    txt_categorias.setText(c.getModelo());
                    categoriaSeleccionada = c.getModelo();
                } else {
                    Deb.consola("El item es de un tipo desconocido");
                }

            }
        });

//        ///////////AUTOCOMPLE categria
        autocompleteModelos.setCaseSensitive(false);
        autocompleteModelos.setMode(-1);
        for (Modelos p : lista_Modelos) {
            autocompleteModelos.addItem(p);
        }

        JRootPane rootPane = SwingUtilities.getRootPane(this.jButton1);
        rootPane.setDefaultButton(this.jButton1);

    }

    private void crearCodigodeBarras() {
        try {
            txt_codigoBarras.setText(CodigodeBarras.CrearCodigoBarrasAutomaticamente());
            BufferedImage myPicture = CodigodeBarras.CrearCodigoBarrasImagen(txt_codigoBarras.getText());
            img.setIcon(new ImageIcon(myPicture));

        } catch (IOException ex) {
            Logger.getLogger(Crear_Productos.class.getName()).log(Level.SEVERE, null, ex);
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

        jPanel2 = new javax.swing.JPanel();
        jPanel4 = new javax.swing.JPanel();
        txt_codigoBarras = new javax.swing.JTextField();
        jLabel12 = new javax.swing.JLabel();
        txt_producto = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        txt_codigoAlternativo = new javax.swing.JTextField();
        img = new javax.swing.JLabel();
        check_codigoBarras = new javax.swing.JCheckBox();
        jPanel5 = new javax.swing.JPanel();
        txt_pvp = new javax.swing.JTextField();
        jLabel13 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        txt_utilidad = new javax.swing.JTextField();
        txt_costo = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        txt_unidades = new javax.swing.JTextField();
        jLabel9 = new javax.swing.JLabel();
        jPanel6 = new javax.swing.JPanel();
        radIvaSI = new javax.swing.JRadioButton();
        radIvaNo = new javax.swing.JRadioButton();
        jPanel7 = new javax.swing.JPanel();
        txt_bodega = new javax.swing.JTextField();
        txt_pasillo = new javax.swing.JTextField();
        txt_percha = new javax.swing.JTextField();
        jLabel16 = new javax.swing.JLabel();
        jLabel15 = new javax.swing.JLabel();
        jLabel14 = new javax.swing.JLabel();
        radProducto = new javax.swing.JRadioButton();
        radServicio = new javax.swing.JRadioButton();
        radActivoFijo = new javax.swing.JRadioButton();
        jPanel8 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        txt_observacion = new javax.swing.JTextArea();
        jPanel9 = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        txt_marca = new javax.swing.JTextField();
        txt_categorias = new javax.swing.JTextField();
        jPanel10 = new javax.swing.JPanel();
        chekMeses = new javax.swing.JCheckBox();
        txt_garantiameses = new javax.swing.JTextField();
        jButton2 = new javax.swing.JButton();
        jButton1 = new javax.swing.JButton();
        txt_codigo = new javax.swing.JLabel();
        jTabbedPane1 = new javax.swing.JTabbedPane();
        jPanel3 = new javax.swing.JPanel();
        jPanel1 = new javax.swing.JPanel();
        jLabel10 = new javax.swing.JLabel();
        lbl_foto = new javax.swing.JLabel();
        jLabel20 = new javax.swing.JLabel();
        txt_semanas = new javax.swing.JTextField();
        txt_minimos = new javax.swing.JTextField();
        txt_maximos = new javax.swing.JTextField();
        jLabel21 = new javax.swing.JLabel();
        jLabel22 = new javax.swing.JLabel();
        tmaracas = new javax.swing.JTextField();
        jPanel11 = new javax.swing.JPanel();
        lbl_img = new javax.swing.JLabel();
        jButton3 = new javax.swing.JButton();
        jPanel12 = new javax.swing.JPanel();
        txt_maximosok = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        txt_mminimosok = new javax.swing.JTextField();
        jPanel13 = new javax.swing.JPanel();
        jLabel17 = new javax.swing.JLabel();
        txt_p1 = new javax.swing.JTextField();
        jLabel23 = new javax.swing.JLabel();
        txt_p2 = new javax.swing.JTextField();
        txt_p3 = new javax.swing.JTextField();
        jLabel24 = new javax.swing.JLabel();
        lbl_p1 = new javax.swing.JLabel();
        lbl_p3 = new javax.swing.JLabel();
        lbl_p2 = new javax.swing.JLabel();

        setClosable(true);
        setTitle("Crear Productos");
        setToolTipText("");
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
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder("Datos del Producto"));
        jPanel2.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel4.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        txt_codigoBarras.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_codigoBarrasActionPerformed(evt);
            }
        });
        txt_codigoBarras.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txt_codigoBarrasKeyPressed(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_codigoBarrasKeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txt_codigoBarrasKeyTyped(evt);
            }
        });

        jLabel12.setText("Codigo de Barras");

        txt_producto.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                txt_productoFocusLost(evt);
            }
        });

        jLabel5.setText("Producto(*)");

        jLabel4.setText("Codigo Alterno");

        txt_codigoAlternativo.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txt_codigoAlternativoKeyTyped(evt);
            }
        });

        check_codigoBarras.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                check_codigoBarrasItemStateChanged(evt);
            }
        });

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addComponent(jLabel5)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txt_producto)
                        .addContainerGap())
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addGroup(jPanel4Layout.createSequentialGroup()
                                .addComponent(txt_codigoAlternativo, javax.swing.GroupLayout.PREFERRED_SIZE, 110, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(10, 10, 10)
                                .addComponent(txt_codigoBarras, javax.swing.GroupLayout.PREFERRED_SIZE, 133, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel4Layout.createSequentialGroup()
                                .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 110, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(5, 5, 5)
                                .addComponent(check_codigoBarras)
                                .addGap(11, 11, 11)
                                .addComponent(jLabel12, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(img, javax.swing.GroupLayout.DEFAULT_SIZE, 224, Short.MAX_VALUE))))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(jLabel4)
                                .addComponent(jLabel12))
                            .addComponent(check_codigoBarras, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE))
                        .addGap(13, 13, 13)
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txt_codigoAlternativo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txt_codigoBarras, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addComponent(img, javax.swing.GroupLayout.PREFERRED_SIZE, 60, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(txt_producto, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel2.add(jPanel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(12, 20, 500, 110));

        jPanel5.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        txt_pvp.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txt_pvpFocusGained(evt);
            }
        });
        txt_pvp.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_pvpKeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txt_pvpKeyTyped(evt);
            }
        });

        jLabel13.setText("P.V.P");

        jLabel8.setText("Utilidad (%)");

        txt_utilidad.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txt_utilidadFocusGained(evt);
            }
        });
        txt_utilidad.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_utilidadKeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txt_utilidadKeyTyped(evt);
            }
        });

        txt_costo.setText("0.0");
        txt_costo.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txt_costoFocusGained(evt);
            }
        });
        txt_costo.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_costoKeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txt_costoKeyTyped(evt);
            }
        });

        jLabel7.setText("Costo");

        txt_unidades.setText("UNIDADES");
        txt_unidades.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txt_unidadesKeyPressed(evt);
            }
        });

        jLabel9.setText("Unidades");

        jPanel6.setBorder(javax.swing.BorderFactory.createTitledBorder("Graba IVA ?"));

        radIvaSI.setSelected(true);
        radIvaSI.setText("Si");
        radIvaSI.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                radIvaSIItemStateChanged(evt);
            }
        });
        radIvaSI.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                radIvaSIActionPerformed(evt);
            }
        });

        radIvaNo.setText("No");
        radIvaNo.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                radIvaNoItemStateChanged(evt);
            }
        });

        javax.swing.GroupLayout jPanel6Layout = new javax.swing.GroupLayout(jPanel6);
        jPanel6.setLayout(jPanel6Layout);
        jPanel6Layout.setHorizontalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(radIvaSI)
                    .addComponent(radIvaNo))
                .addContainerGap(53, Short.MAX_VALUE))
        );
        jPanel6Layout.setVerticalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addComponent(radIvaSI)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(radIvaNo))
        );

        javax.swing.GroupLayout jPanel5Layout = new javax.swing.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel9)
                    .addComponent(txt_unidades, javax.swing.GroupLayout.PREFERRED_SIZE, 84, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(txt_costo)
                    .addComponent(jLabel7, javax.swing.GroupLayout.DEFAULT_SIZE, 84, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel5Layout.createSequentialGroup()
                        .addComponent(txt_utilidad, javax.swing.GroupLayout.PREFERRED_SIZE, 57, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(txt_pvp, javax.swing.GroupLayout.PREFERRED_SIZE, 83, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel5Layout.createSequentialGroup()
                        .addComponent(jLabel8)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel13, javax.swing.GroupLayout.PREFERRED_SIZE, 83, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(18, 18, 18)
                .addComponent(jPanel6, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addComponent(jPanel6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 11, Short.MAX_VALUE))
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel9)
                    .addComponent(jLabel7)
                    .addComponent(jLabel8)
                    .addComponent(jLabel13))
                .addGap(4, 4, 4)
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txt_costo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txt_unidades, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txt_utilidad, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txt_pvp, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel2.add(jPanel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 240, 500, 90));

        jPanel7.setBorder(javax.swing.BorderFactory.createTitledBorder("UBICACION"));
        jPanel7.setLayout(null);
        jPanel7.add(txt_bodega);
        txt_bodega.setBounds(70, 50, 129, 22);
        jPanel7.add(txt_pasillo);
        txt_pasillo.setBounds(70, 80, 129, 22);
        jPanel7.add(txt_percha);
        txt_percha.setBounds(70, 110, 129, 22);

        jLabel16.setText("Percha");
        jPanel7.add(jLabel16);
        jLabel16.setBounds(18, 114, 39, 16);

        jLabel15.setText("Pasillo");
        jPanel7.add(jLabel15);
        jLabel15.setBounds(18, 88, 36, 16);

        jLabel14.setText("Bodega");
        jPanel7.add(jLabel14);
        jLabel14.setBounds(18, 59, 42, 16);

        radProducto.setSelected(true);
        radProducto.setText("Producto");
        radProducto.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                radProductoItemStateChanged(evt);
            }
        });
        jPanel7.add(radProducto);
        radProducto.setBounds(10, 20, 80, 25);

        radServicio.setText("Servicio");
        radServicio.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                radServicioItemStateChanged(evt);
            }
        });
        jPanel7.add(radServicio);
        radServicio.setBounds(90, 20, 73, 25);

        radActivoFijo.setText("A Fijo");
        radActivoFijo.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                radActivoFijoItemStateChanged(evt);
            }
        });
        jPanel7.add(radActivoFijo);
        radActivoFijo.setBounds(170, 20, 70, 25);

        jPanel2.add(jPanel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(260, 330, 250, 150));

        jPanel8.setBorder(javax.swing.BorderFactory.createTitledBorder("Descripcion"));

        txt_observacion.setColumns(20);
        txt_observacion.setRows(5);
        jScrollPane1.setViewportView(txt_observacion);

        javax.swing.GroupLayout jPanel8Layout = new javax.swing.GroupLayout(jPanel8);
        jPanel8.setLayout(jPanel8Layout);
        jPanel8Layout.setHorizontalGroup(
            jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 228, Short.MAX_VALUE)
        );
        jPanel8Layout.setVerticalGroup(
            jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel8Layout.createSequentialGroup()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 112, Short.MAX_VALUE)
                .addContainerGap())
        );

        jPanel2.add(jPanel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 330, 240, 150));

        jPanel9.setBorder(javax.swing.BorderFactory.createTitledBorder("Marcas / Categorias"));

        jLabel3.setText("Marca");

        jLabel6.setText("Categria");

        txt_marca.setText("GENERAL");
        txt_marca.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txt_marcaFocusGained(evt);
            }
            public void focusLost(java.awt.event.FocusEvent evt) {
                txt_marcaFocusLost(evt);
            }
        });
        txt_marca.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                txt_marcaMouseClicked(evt);
            }
        });
        txt_marca.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txt_marcaKeyPressed(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_marcaKeyReleased(evt);
            }
        });

        txt_categorias.setText("GENERAL");
        txt_categorias.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txt_categoriasFocusGained(evt);
            }
            public void focusLost(java.awt.event.FocusEvent evt) {
                txt_categoriasFocusLost(evt);
            }
        });
        txt_categorias.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_categoriasActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel9Layout = new javax.swing.GroupLayout(jPanel9);
        jPanel9.setLayout(jPanel9Layout);
        jPanel9Layout.setHorizontalGroup(
            jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel9Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel9Layout.createSequentialGroup()
                        .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 84, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(66, 66, 66)
                        .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 94, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addContainerGap(82, Short.MAX_VALUE))
                    .addGroup(jPanel9Layout.createSequentialGroup()
                        .addComponent(txt_marca)
                        .addGap(18, 18, 18)
                        .addComponent(txt_categorias, javax.swing.GroupLayout.PREFERRED_SIZE, 151, javax.swing.GroupLayout.PREFERRED_SIZE))))
        );
        jPanel9Layout.setVerticalGroup(
            jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel9Layout.createSequentialGroup()
                .addGroup(jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(jLabel6))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel9Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txt_marca, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txt_categorias, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(20, Short.MAX_VALUE))
        );

        jPanel2.add(jPanel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 140, 350, 90));

        jPanel10.setBorder(javax.swing.BorderFactory.createTitledBorder("Garantia ?"));

        chekMeses.setText("Meses");
        chekMeses.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                chekMesesItemStateChanged(evt);
            }
        });

        txt_garantiameses.setText("12");
        txt_garantiameses.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_garantiamesesActionPerformed(evt);
            }
        });
        txt_garantiameses.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txt_garantiamesesKeyTyped(evt);
            }
        });

        javax.swing.GroupLayout jPanel10Layout = new javax.swing.GroupLayout(jPanel10);
        jPanel10.setLayout(jPanel10Layout);
        jPanel10Layout.setHorizontalGroup(
            jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel10Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(chekMeses)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txt_garantiameses, javax.swing.GroupLayout.DEFAULT_SIZE, 50, Short.MAX_VALUE)
                .addContainerGap())
        );
        jPanel10Layout.setVerticalGroup(
            jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel10Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(chekMeses)
                    .addComponent(txt_garantiameses, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(18, Short.MAX_VALUE))
        );

        jPanel2.add(jPanel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(360, 140, 150, 80));

        getContentPane().add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 10, 520, 490));

        jButton2.setBackground(new java.awt.Color(255, 102, 102));
        jButton2.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        jButton2.setText("Cerrar");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton2, new org.netbeans.lib.awtextra.AbsoluteConstraints(280, 500, 221, 66));

        jButton1.setBackground(new java.awt.Color(102, 153, 255));
        jButton1.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jButton1.setText("Guardar");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        jButton1.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                jButton1PropertyChange(evt);
            }
        });
        getContentPane().add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 500, 218, 66));
        getContentPane().add(txt_codigo, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 0, 130, 30));

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 285, Short.MAX_VALUE)
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 420, Short.MAX_VALUE)
        );

        jTabbedPane1.addTab("Detalles", jPanel3);

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder("Datos de eUsuario"));

        jLabel10.setText("Modelo");

        lbl_foto.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/Usuarios1.png"))); // NOI18N

        jLabel20.setText("Semanas");

        jLabel21.setText("Maximos");

        jLabel22.setText("Minimos");

        tmaracas.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                tmaracasKeyPressed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(tmaracas, javax.swing.GroupLayout.PREFERRED_SIZE, 151, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(72, 72, 72))
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(147, 147, 147)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txt_semanas, javax.swing.GroupLayout.PREFERRED_SIZE, 39, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel20, javax.swing.GroupLayout.PREFERRED_SIZE, 72, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(448, 448, 448)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                .addComponent(jLabel10)
                                .addGap(153, 153, 153))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                .addComponent(lbl_foto, javax.swing.GroupLayout.PREFERRED_SIZE, 311, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(58, 58, 58))))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txt_minimos, javax.swing.GroupLayout.PREFERRED_SIZE, 39, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel22, javax.swing.GroupLayout.PREFERRED_SIZE, 47, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txt_maximos, javax.swing.GroupLayout.PREFERRED_SIZE, 39, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel21, javax.swing.GroupLayout.PREFERRED_SIZE, 72, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(tmaracas, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(30, 30, 30)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel20)
                    .addComponent(jLabel22)
                    .addComponent(jLabel21)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(23, 23, 23)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txt_semanas, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txt_minimos, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txt_maximos, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addGap(30, 30, 30)
                .addComponent(jLabel10)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 32, Short.MAX_VALUE)
                .addComponent(lbl_foto, javax.swing.GroupLayout.PREFERRED_SIZE, 207, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        jTabbedPane1.addTab("Avanzado", jPanel1);

        getContentPane().add(jTabbedPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(840, 70, 290, 450));

        jPanel11.setBorder(javax.swing.BorderFactory.createTitledBorder("Fotografia"));

        lbl_img.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/producto.jpg"))); // NOI18N
        lbl_img.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                lbl_imgMouseClicked(evt);
            }
        });

        javax.swing.GroupLayout jPanel11Layout = new javax.swing.GroupLayout(jPanel11);
        jPanel11.setLayout(jPanel11Layout);
        jPanel11Layout.setHorizontalGroup(
            jPanel11Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(lbl_img, javax.swing.GroupLayout.DEFAULT_SIZE, 278, Short.MAX_VALUE)
        );
        jPanel11Layout.setVerticalGroup(
            jPanel11Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(lbl_img, javax.swing.GroupLayout.DEFAULT_SIZE, 215, Short.MAX_VALUE)
        );

        getContentPane().add(jPanel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(540, 20, 290, 240));

        jButton3.setText("Seleccionar");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton3, new org.netbeans.lib.awtextra.AbsoluteConstraints(630, 260, -1, -1));

        jPanel12.setBorder(javax.swing.BorderFactory.createTitledBorder("Maximo y Minimos"));

        txt_maximosok.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txt_maximosokKeyTyped(evt);
            }
        });

        jLabel2.setText("Maximos");

        jLabel11.setText("Minimos");

        txt_mminimosok.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txt_mminimosokKeyTyped(evt);
            }
        });

        javax.swing.GroupLayout jPanel12Layout = new javax.swing.GroupLayout(jPanel12);
        jPanel12.setLayout(jPanel12Layout);
        jPanel12Layout.setHorizontalGroup(
            jPanel12Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel12Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel12Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanel12Layout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addGap(18, 18, 18)
                        .addComponent(txt_maximosok, javax.swing.GroupLayout.PREFERRED_SIZE, 52, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel12Layout.createSequentialGroup()
                        .addComponent(jLabel11)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(txt_mminimosok, javax.swing.GroupLayout.PREFERRED_SIZE, 52, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(136, Short.MAX_VALUE))
        );
        jPanel12Layout.setVerticalGroup(
            jPanel12Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel12Layout.createSequentialGroup()
                .addGroup(jPanel12Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txt_maximosok, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel12Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txt_mminimosok, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel11))
                .addGap(0, 14, Short.MAX_VALUE))
        );

        getContentPane().add(jPanel12, new org.netbeans.lib.awtextra.AbsoluteConstraints(550, 290, 280, 90));

        jPanel13.setBorder(javax.swing.BorderFactory.createTitledBorder("% de Utilidad con repecto al costo"));

        jLabel17.setText("% Precio 1");

        txt_p1.setText("10");
        txt_p1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txt_p1KeyPressed(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_p1KeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txt_p1KeyTyped(evt);
            }
        });

        jLabel23.setText("% Precio 2");

        txt_p2.setText("20");
        txt_p2.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txt_p2KeyPressed(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_p2KeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txt_p2KeyTyped(evt);
            }
        });

        txt_p3.setText("30");
        txt_p3.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txt_p3KeyPressed(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_p3KeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txt_p3KeyTyped(evt);
            }
        });

        jLabel24.setText("% Precio 3");

        javax.swing.GroupLayout jPanel13Layout = new javax.swing.GroupLayout(jPanel13);
        jPanel13.setLayout(jPanel13Layout);
        jPanel13Layout.setHorizontalGroup(
            jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel13Layout.createSequentialGroup()
                .addGroup(jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel13Layout.createSequentialGroup()
                        .addGroup(jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(jLabel24, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jLabel23, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addGap(14, 14, 14)
                        .addGroup(jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txt_p2)
                            .addComponent(txt_p3)))
                    .addGroup(jPanel13Layout.createSequentialGroup()
                        .addComponent(jLabel17, javax.swing.GroupLayout.DEFAULT_SIZE, 69, Short.MAX_VALUE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txt_p1, javax.swing.GroupLayout.PREFERRED_SIZE, 51, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(24, 24, 24)
                .addGroup(jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(lbl_p2, javax.swing.GroupLayout.DEFAULT_SIZE, 76, Short.MAX_VALUE)
                    .addComponent(lbl_p1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(lbl_p3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(33, 33, 33))
        );
        jPanel13Layout.setVerticalGroup(
            jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel13Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(lbl_p1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel17)
                        .addComponent(txt_p1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel23)
                        .addComponent(txt_p2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(lbl_p2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanel13Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(txt_p3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(jLabel24))
                    .addComponent(lbl_p3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );

        getContentPane().add(jPanel13, new org.netbeans.lib.awtextra.AbsoluteConstraints(550, 390, 270, 130));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void txt_codigoAlternativoKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_codigoAlternativoKeyTyped
        // TODO add your handling code here:
//        ValidaNUmeros val = new ValidaNUmeros();
//        val.keyTyped(evt);
//        ValidaCedula vc = new ValidaCedula();
//        //Deb.consola("Vista.Usuarios.FCUsuarios.txt_cedulaKeyTyped()"+txt_cedula.getSize().width);
//        //if(txt_cedula.getText().length()==10){
//        try {
//            vc.isCedula(txt_codigoAlternativo.getText());
//        } catch (Exception ex) {
//            Logger.getLogger(Crear_Productos.class.getName()).log(Level.SEVERE, null, ex);
//        }

    }//GEN-LAST:event_txt_codigoAlternativoKeyTyped

    private void txt_unidadesKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_unidadesKeyPressed
        // TODO add your handling code here:
//        if (obj_valida_email.validaEmail(txt_mail.getText())) {
//            txt_mail.setBackground(Color.white);
//        } else {
//            txt_mail.setBackground(Color.cyan);
    }//GEN-LAST:event_txt_unidadesKeyPressed
    //if(txt_cedula.get>= 10 ||txt_cedula.getSize()==13)


    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:
        this.dispose();

    }//GEN-LAST:event_jButton2ActionPerformed

    public static void cargarListasAutocomplete() {

//        if (autocomplete == null) {
//            autocomplete = new TextAutoCompleter(tmaracas);
//        }
//        autocomplete.addItems(listJcbMarcas.toArray());
    }
    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:        
        ProductosDao obj = new ProductosDao();
        Productos u = new Productos();

        //if (!txt_producto.getText().isEmpty()) {
        if (!txt_producto.getText().isEmpty() && !txt_costo.getText().isEmpty() && !txt_utilidad.getText().isEmpty() && !txt_pvp.getText().isEmpty() && !txt_p1.getText().isEmpty() && !txt_p2.getText().isEmpty() && !txt_p3.getText().isEmpty()) {
            //     if (codigoMarca != -1 && codigoModelo != -1) {
            u.setCodigoAlterno(txt_codigoAlternativo.getText());
            // u.setImagen(imageProducto);
            u.setProducto(txt_producto.getText());
            u.setCodigoAlterno(txt_codigoAlternativo.getText());
            u.setCodigoBarras(txt_codigoBarras.getText());

            if (radIvaSI.isSelected()) {
                u.setImpuesto(Principal.iva);

                Double base = Double.parseDouble(txt_costo.getText().replace(",", ".")) / ((Double.parseDouble(Principal.iva) / 100) + 1);
                Double iva = Double.parseDouble(txt_costo.getText().replace(",", ".")) - base;
                u.setIva12(Double.parseDouble(String.format("%.4f", iva).replace(",", ".")));
                u.setIva0(Double.valueOf(0.00));

                u.setBase(Double.parseDouble(String.format("%.4f", base).replace(",", ".")));
            }
            if (radIvaNo.isSelected()) {
                u.setImpuesto("0");
                u.setIva0(Double.valueOf(0.00));
                u.setIva12(Double.valueOf(0.00));
                u.setBase(Double.parseDouble(txt_costo.getText().replace(",", ".")));
            }

            if (radProducto.isSelected()) {
                u.setProductoOServicio(1);
            } else if (radServicio.isSelected()) {
                u.setProductoOServicio(2);
            } else if (radActivoFijo.isSelected()) {
                u.setProductoOServicio(3);
            }
            u.setCosto(txt_costo.getText().replace(",", "."));
            u.setUtilidad(txt_utilidad.getText().replace(",", "."));
            u.setPvp(txt_pvp.getText().replace(",", "."));

            u.setUnidades(txt_unidades.getText());            
            u.setUbicacion(txt_bodega.getText().concat(txt_pasillo.getText().concat(txt_percha.getText())));            
            u.setObservacion(txt_observacion.getText());
            u.setMinimo(txt_mminimosok.getText().replace(",", "."));
            u.setMaximo(txt_maximosok.getText().replace(",", "."));
            if (chekMeses.isSelected()) {
                u.setGarantia(txt_garantiameses.getText());

            }else{
                u.setGarantia("0");
            }
            
            
            if (txt_p1.getText().isEmpty()) {
                u.setP1(0.0);
            } else {
                u.setP1(Double.parseDouble(txt_p1.getText().replace(",", ".")));
            }

            if (txt_p2.getText().isEmpty()) {
                u.setP2(0.0);
            } else {
                u.setP2(Double.parseDouble(txt_p2.getText().replace(",", ".")));
            }

            if (txt_p3.getText().isEmpty()) {
                u.setP3(0.0);
            } else {
                u.setP3(Double.parseDouble(txt_p3.getText().replace(",", ".")));
            }

////////////////// MARCAS Y CATEGORIAS CODIGO 
            if (!txt_marca.getText().isEmpty()) {
                codigoMarca = -1;
                for (Marcas marca : lista_Marcas) {
                    if (marca.getMarca().equalsIgnoreCase(txt_marca.getText())) {
                        codigoMarca = marca.getCodigo();
                    }

                }
                if (codigoMarca == -1) {
                    Marcas m = new Marcas();
                    MarcasDao mDao = new MarcasDao();
                    m.setMarca(txt_marca.getText());
                    m.setDescripcion("Auto");
                    codigoMarca = mDao.guardar(m);

                    /////////////////categorias
                    if (!txt_categorias.getText().isEmpty()) {
                        codigoModelo = -1;
                        for (Modelos mo : lista_Modelos) {
                            if (mo.getModelo().equalsIgnoreCase(txt_categorias.getText())) {
                                codigoModelo = mo.getCodigo();
                            }

                        }
                        if (codigoModelo == -1) {
                            Modelos mod = new Modelos();
                            ModelosDao modDao = new ModelosDao();
                            mod.setModelo(txt_categorias.getText());
                            mod.setMarcas_Codigo(codigoMarca);
                            mod.setDescripcion("Auto");
                            codigoModelo = modDao.guardar(mod);
                        }
                    }
/////////////////////////

                } else {

                    /////////////////categorias
                    if (!txt_categorias.getText().isEmpty()) {
                        codigoModelo = -1;
                        for (Modelos m : lista_Modelos) {
                            if (m.getModelo().equals(txt_categorias.getText())) {
                                codigoModelo = m.getCodigo();
                            }

                        }
                        if (codigoModelo == -1) {
                            Modelos mod = new Modelos();
                            ModelosDao modDao = new ModelosDao();
                            mod.setModelo(txt_categorias.getText());
                            mod.setMarcas_Codigo(codigoMarca);
                            mod.setDescripcion("Auto");
                            codigoModelo = modDao.guardar(mod);
                        }

                    }
/////////////////////////
                }
            }

            u.setModelo_codigo(codigoModelo);
            u.setModelos_marcas_codigo(codigoMarca);
            if (evt.getActionCommand().equals("Actualizar")) {
                Deb.consola("Vista.Usuarios.CrearUsuarios.jButton1ActionPerformed()");
                u.setCodigo(Integer.parseInt(txt_codigo.getText()));

                ///si no se ha seleccionado una imagen solo se guarada con el segundo metodo de guardar
                if (imagenexitasamentecargadSiNo) {
                    obj.modificar(u, imageProducto);
                } else {
                    obj.modificarSinImagen(u);
                }

                this.dispose();
                ProductosDao cu = new ProductosDao();
                Buscar_Productos.jTable1.setModel(cu.Buscar_table_only_Activos());

            } else {
                ///si no se ha seleccionado una imagen solo se guarada con el segundo metodo de guardar
                if (imagenexitasamentecargadSiNo) {
                    obj.guardarConImagen(u, imageProducto);
                } else {
                    obj.guardar(u);
                }

            }

            VaciarTexto limpiar = new VaciarTexto();
            limpiar.limpiar_texto(jPanel1);
            limpiar.limpiar_texto(jPanel2);
            txt_garantiameses.setText("12");
            chekMeses.setSelected(false);            
            limpiar.limpiar_texto(jPanel5);
            txt_utilidad.setText(Principal.utilidad);
            txt_unidades.setText("UNIDADES");
            txt_marca.setText("GENERAL");
            txt_categorias.setText("GENERAL");
            txt_codigoAlternativo.setText("");
            txt_producto.setText("");
            imageProducto = null;
            imagenexitasamentecargadSiNo = false;
            lbl_img.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/producto.jpg")));

            crearCodigodeBarras();

        } else {

            a.setProgressBar_mensajae("Debes LLenar los campos Obligatorios");
            Color color = Color.orange;
            txt_costo.setBackground(color);
            txt_producto.setBackground(color);
            txt_costo.setBackground(color);
            txt_utilidad.setBackground(color);
            txt_p1.setBackground(color);
            txt_p2.setBackground(color);
            txt_p3.setBackground(color);
            txt_pvp.setBackground(color);
        }


    }//GEN-LAST:event_jButton1ActionPerformed

    private void formInternalFrameClosed(javax.swing.event.InternalFrameEvent evt) {//GEN-FIRST:event_formInternalFrameClosed
        // TODO add your handling code here:
//        Principal.toolbar.remove(indexPositiotoolBar);
    }//GEN-LAST:event_formInternalFrameClosed

    private void jButton1PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_jButton1PropertyChange
        // TODO add your handling code here:
        //if(evt.getPropertyName())
        if (jButton1.getText().equals("Actualizar")) {
//            jcb_Categoorias.setSelectedItem("");
//            jcb_modelo.setSelectedItem("");
        }
        Deb.consola("Vista.Usuarios.Crear_Usuarios.jButton1Prop,,,,,,,,ertyChange()" + evt.getNewValue());
    }//GEN-LAST:event_jButton1PropertyChange

    private void txt_costoKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_costoKeyReleased
        // TODO add your handling code here:

        try {
            if (ValidaNUmeros.isOnlyDouble(txt_costo.getText())) {
                Double utilidad1 = Double.valueOf(txt_utilidad.getText().replace(",", "."));
                Double costo = Double.valueOf(txt_costo.getText().replace(",", "."));
                //Double pvp1 = Double.valueOf(txt_pvp.getText().replace(",", "."));
                Double pvp = (costo + (utilidad1 * costo) / 100);
                txt_pvp.setText(String.valueOf(String.format("%.4f", pvp)).replace(",", "."));

                /////p1
                if (ValidaNUmeros.isOnlyDouble(txt_p1.getText()));
                {
                    if (!txt_costo.getText().isEmpty()) {
                        //Double costo = Double.parseDouble(txt_costo.getText().replace(",", "."));
                        Double p1 = Double.parseDouble(txt_p1.getText().replace(",", "."));
                        Double tot = ((costo * p1) / 100) + costo;
                        lbl_p1.setText(String.valueOf(String.format("%.4f", tot)));
                    }
                }

                //////////P2
                if (ValidaNUmeros.isOnlyDouble(txt_p2.getText()));
                {
                    if (!txt_costo.getText().isEmpty()) {
                        //       Double costo = Double.parseDouble(txt_costo.getText().replace(",", "."));
                        Double p2 = Double.parseDouble(txt_p2.getText().replace(",", "."));
                        Double tot = ((costo * p2) / 100) + costo;
                        lbl_p2.setText(String.valueOf(String.format("%.4f", tot)));
                    }
                }
                /////////P3
                if (ValidaNUmeros.isOnlyDouble(txt_p3.getText()));
                {
                    if (!txt_costo.getText().isEmpty()) {
                        //       Double costo = Double.parseDouble(txt_costo.getText().replace(",", "."));
                        Double p3 = Double.parseDouble(txt_p3.getText().replace(",", "."));
                        Double tot = ((costo * p3) / 100) + costo;
                        lbl_p3.setText(String.valueOf(String.format("%.4f", tot)));
                    }
                }
            } else {
                txt_costo.setText("0.0");
//            txt_p1.setText("0.0");
//            txt_p2.setText("0.0");
//            txt_p3.setText("0.0");
                txt_pvp.setText("0.0");

                txt_costo.selectAll();

            }
        } catch (Exception e) {
        }

    }//GEN-LAST:event_txt_costoKeyReleased

    private void txt_utilidadKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_utilidadKeyReleased
        // TODO add your handling code here:
        try {
            if (ValidaNUmeros.isOnlyDouble(txt_utilidad.getText())) {

                Double utilidad1 = Double.valueOf(txt_utilidad.getText());
                Double costo = Double.valueOf(txt_costo.getText().replace(",", "."));
                Double pvp1 = Double.valueOf(txt_pvp.getText().replace(",", "."));
                if (!txt_costo.getText().isEmpty()) {
                    pvp1 = (costo + (utilidad1 * costo) / 100);
                    if (Double.isInfinite(pvp1) || Double.isNaN(pvp1)) {
                        pvp1 = 0.0;
                    }
                    txt_pvp.setText(String.valueOf(String.format("%.4f", pvp1)));
                } else {
                    txt_pvp.setText("0.0");
                }
            } else {
                txt_utilidad.setText("0.0");
                txt_utilidad.selectAll();
            }

        } catch (Exception e) {
        }


    }//GEN-LAST:event_txt_utilidadKeyReleased

    private void txt_costoKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_costoKeyTyped
        //    ValidaNUmeros.keyTyped(evt);
    }//GEN-LAST:event_txt_costoKeyTyped

    private void txt_utilidadKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_utilidadKeyTyped
        // TODO add your handling code here:
        //  ValidaNUmeros.keyTyped(evt);

    }//GEN-LAST:event_txt_utilidadKeyTyped

    private void txt_pvpKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_pvpKeyTyped
        // TODO add your handling code here:
        // ValidaNUmeros.keyTyped(evt);

    }//GEN-LAST:event_txt_pvpKeyTyped

    private void txt_pvpKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_pvpKeyReleased
        // TODO add your handling code here:
        try {
            if (ValidaNUmeros.isOnlyDouble(txt_pvp.getText())) {
                Double utilidad1 = Double.valueOf(txt_utilidad.getText().replace(",", "."));
                Double costo = Double.valueOf(txt_costo.getText().replace(",", "."));
                Double pvp1 = Double.valueOf(txt_pvp.getText().replace(",", "."));
                if (costo <= pvp1) {
                    Double util = ((pvp1 - costo) * 100) / costo;
                    if (Double.isInfinite(util) || Double.isNaN(util)) {
                        util = 0.0;
                    }
                    txt_utilidad.setText(String.valueOf(String.format("%.4f", util)));
                }
            } else {
                txt_pvp.setText("0.0");
                txt_pvp.selectAll();
            }
        } catch (Exception e) {
        }
    }//GEN-LAST:event_txt_pvpKeyReleased

    private void txt_marcaKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_marcaKeyPressed
        // TODO add your handling code here:
        if (evt.getKeyCode() == KeyEvent.VK_ENTER) {

//        Object itemSelected = autocomplete.getItemSelected();  
//            System.err.println("marca seleccionada: " +itemSelected.toString());
//              if (itemSelected instanceof Marcas) {
//                  Deb.consola(((Marcas) itemSelected).getMarca());
//              } else {
//                  Deb.consola("El item es de un tipo desconocido");
////            Deb.consola(((Marcas) itemSelected).getMarca());
//              }
        }
        //jcb_marca.removeAllItems();

//        if (txt_marca.getText().isEmpty()) {
//            listMarcasTemp = lista_Marcas;
//        }
        //   a.addItems(listMarcasTemp);
        // a.setItems(listMarcasTemp);
        ///a.addItems(al);
//            if (p.getMarca().contains(txt_marca.getText())) {
//                codigoMarca = p.getCodigo();
//                ModelosDao mDao = new ModelosDao();
//                jcb_marca.setPopupVisible(true);
//                jcb_marca.addItem(p.getMarca());
//                jcb_modelo.removeAllItems();
//                //        listMarcasTemp.add(p);
//                lista_Modelos_filtrados = mDao.listarConIDForeinkey(p.getCodigo());
//                for (Modelos m : lista_Modelos_filtrados) {
//                    jcb_modelo.addItem(m.getModelo());
//
//                }
//
//            } else {
//                listMarcasTemp.remove(p);
//            }
        //}
//
//        Marcas personSelected = (Marcas) a.getItemSelected();
//        Deb.consola(personSelected.getMarca()); // Imprime 25

    }//GEN-LAST:event_txt_marcaKeyPressed

    private void txt_codigoBarrasKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_codigoBarrasKeyTyped
        // TODO add your handling code here:
        if (txt_codigoBarras.getText().length() >= 13 || !ValidaNUmeros.isOnlyNumbers(txt_codigoBarras.getText())) {
            evt.consume();
        }
    }//GEN-LAST:event_txt_codigoBarrasKeyTyped

    private void txt_garantiamesesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_garantiamesesActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_garantiamesesActionPerformed

    private void txt_codigoBarrasActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_codigoBarrasActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_codigoBarrasActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        // TODO add your handling code here:
        // TODO add your handling code here:
//Deb.consola("irteddsasdasd : "+txt_marca.getText());
        int resultado;
        CargarFoto ventana = new CargarFoto();
        FileNameExtensionFilter filtro = new FileNameExtensionFilter("JPG y PNG", "jpg", "png");
        ventana.jFileChooser1.setFileFilter(filtro);
        resultado = ventana.jFileChooser1.showOpenDialog(null);
        if (JFileChooser.APPROVE_OPTION == resultado) {
            imageProducto = ventana.jFileChooser1.getSelectedFile();
            String rutaImagen = ventana.jFileChooser1.getSelectedFile().getPath();
            String nombreImagen = ventana.jFileChooser1.getSelectedFile().getName();

            try {
                ImageIcon icon = new ImageIcon(imageProducto.toString());
                Icon icono = new ImageIcon(icon.getImage().getScaledInstance(lbl_img.getWidth(), lbl_img.getHeight(), Image.SCALE_DEFAULT));
                Deb.consola("Vista.Usuarios.Crear_Productos.jButton3ActionPerformed()with :" + lbl_img.getWidth() + " heig : " + lbl_img.getHeight());
                lbl_img.setText(null);
                lbl_img.setIcon(icono);
                imagenexitasamentecargadSiNo = true;
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(null, "Error abriendo la   imagen " + ex);
            }

        }

    }//GEN-LAST:event_jButton3ActionPerformed

    private void txt_marcaKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_marcaKeyReleased
        // TODO add your handling code here:


    }//GEN-LAST:event_txt_marcaKeyReleased

    private void txt_marcaMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_txt_marcaMouseClicked
        // TODO add your handling code here:

    }//GEN-LAST:event_txt_marcaMouseClicked

    private void txt_marcaFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_marcaFocusGained
        // TODO add your handling code here:


    }//GEN-LAST:event_txt_marcaFocusGained

    private void txt_categoriasActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_categoriasActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_categoriasActionPerformed

    private void tmaracasKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_tmaracasKeyPressed
        // TODO add your handling code here:
        //    TextAutoCompleter textAutoCompleter = new TextAutoCompleter(jTextField1);
        //  textAutoCompleter.addItem(new Marcas.(1,"Marco", "dd"));
        //    autocomplete.findItem(tmaracas.getText());
    }//GEN-LAST:event_tmaracasKeyPressed

    private void chekMesesItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_chekMesesItemStateChanged
        // TODO add your handling code here:
        if (chekMeses.isSelected()) {
           
            txt_garantiameses.setEnabled(true);             
            txt_garantiameses.grabFocus();
            txt_garantiameses.selectAll();
        } else {
            txt_garantiameses.setEnabled(false);
            
            //   txt_garantia.setEnabled(false);
        }
    }//GEN-LAST:event_chekMesesItemStateChanged

    private void radProductoItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_radProductoItemStateChanged
        // TODO add your handling code here:
        if (radProducto.isSelected()) {
            radServicio.setSelected(false);
            radActivoFijo.setSelected(false);
        }

    }//GEN-LAST:event_radProductoItemStateChanged

    private void radServicioItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_radServicioItemStateChanged
        // TODO add your handling code here:
        if (radServicio.isSelected()) {
            radProducto.setSelected(false);
            radActivoFijo.setSelected(false);
        }
    }//GEN-LAST:event_radServicioItemStateChanged

    private void radActivoFijoItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_radActivoFijoItemStateChanged
        // TODO add your handling code here:
        if (radActivoFijo.isSelected()) {
            radServicio.setSelected(false);
            radProducto.setSelected(false);
        }
    }//GEN-LAST:event_radActivoFijoItemStateChanged

    private void txt_p1KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_p1KeyPressed
        // TODO add your handling code here:

    }//GEN-LAST:event_txt_p1KeyPressed

    private void txt_p2KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_p2KeyPressed
        // TODO add your handling code here:

    }//GEN-LAST:event_txt_p2KeyPressed

    private void txt_p3KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_p3KeyPressed
        // TODO add your handling code here:

    }//GEN-LAST:event_txt_p3KeyPressed

    private void radIvaSIItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_radIvaSIItemStateChanged
        // TODO add your handling code here:
        if (radIvaSI.isSelected()) {
            radIvaNo.setSelected(false);
        }

    }//GEN-LAST:event_radIvaSIItemStateChanged

    private void radIvaNoItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_radIvaNoItemStateChanged
        // TODO add your handling code here:

        if (radIvaNo.isSelected()) {
            radIvaSI.setSelected(false);

        }
    }//GEN-LAST:event_radIvaNoItemStateChanged

    private void txt_categoriasFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_categoriasFocusLost
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_categoriasFocusLost

    private void txt_marcaFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_marcaFocusLost
        // TODO add your handling code here:

    }//GEN-LAST:event_txt_marcaFocusLost

    private void radIvaSIActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_radIvaSIActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_radIvaSIActionPerformed

    private void txt_categoriasFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_categoriasFocusGained
        // TODO add your handling code here:
        // txt_categorias.selectAll();
    }//GEN-LAST:event_txt_categoriasFocusGained

    private void txt_p1KeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_p1KeyTyped
        // TODO add your handling code here:
        //  ValidaNUmeros.keyTyped(evt);

    }//GEN-LAST:event_txt_p1KeyTyped

    private void txt_p3KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_p3KeyReleased
        // TODO add your handling code here:

        if (ValidaNUmeros.isOnlyDouble(txt_p3.getText())) {

            if (!txt_p3.getText().isEmpty()) {
                if (ValidaNUmeros.isOnlyDouble(txt_p3.getText())) {
                    if (!txt_costo.getText().isEmpty() && !txt_p3.getText().isEmpty()) {
                        Double costo = Double.parseDouble(txt_costo.getText().replace(",", "."));
                        Double p3 = Double.parseDouble(txt_p3.getText().replace(",", "."));
                        Double tot = ((costo * p3) / 100) + costo;
                        lbl_p3.setText(String.valueOf(String.format("%.4f", tot)));
                    }
                } else {
                    txt_p3.selectAll();
                    txt_p3.setText("0.0");

                    if (!txt_costo.getText().isEmpty() && !txt_p3.getText().isEmpty()) {
                        Double costo = Double.parseDouble(txt_costo.getText().replace(",", "."));
                        Double p3 = Double.parseDouble(txt_p3.getText().replace(",", "."));
                        Double tot = ((costo * p3) / 100) + costo;
                        lbl_p3.setText(String.valueOf(String.format("%.4f", tot)));
                    }

                }
            }
        } else {
            txt_p3.setText("0.0");
            txt_p3.selectAll();
        }
    }//GEN-LAST:event_txt_p3KeyReleased

    private void txt_garantiamesesKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_garantiamesesKeyTyped
        // TODO add your handling code here:
        ValidaNUmeros.keyTyped(evt);
    }//GEN-LAST:event_txt_garantiamesesKeyTyped

    private void txt_maximosokKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_maximosokKeyTyped
        // TODO add your handling code here:
        ValidaNUmeros.keyTyped(evt);
    }//GEN-LAST:event_txt_maximosokKeyTyped

    private void txt_mminimosokKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_mminimosokKeyTyped
        // TODO add your handling code here:
        ValidaNUmeros.keyTyped(evt);
    }//GEN-LAST:event_txt_mminimosokKeyTyped

    private void txt_p2KeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_p2KeyTyped
        // TODO add your handling code here:
        //    ValidaNUmeros.keyTyped(evt);
    }//GEN-LAST:event_txt_p2KeyTyped

    private void txt_p3KeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_p3KeyTyped
        // TODO add your handling code here:
        //    ValidaNUmeros.keyTyped(evt);
    }//GEN-LAST:event_txt_p3KeyTyped

    private void txt_p2KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_p2KeyReleased
        // TODO add your handling code here:

        if (ValidaNUmeros.isOnlyDouble(txt_p2.getText())) {

            if (!txt_p2.getText().isEmpty()) {
                if (ValidaNUmeros.isOnlyDouble(txt_p2.getText())) {
                    if (!txt_costo.getText().isEmpty() && !txt_p2.getText().isEmpty()) {
                        Double costo = Double.parseDouble(txt_costo.getText().replace(",", "."));
                        Double p2 = Double.parseDouble(txt_p2.getText().replace(",", "."));
                        Double tot = ((costo * p2) / 100) + costo;
                        lbl_p2.setText(String.valueOf(String.format("%.4f", tot)));
                    }
                } else {
                    txt_p2.selectAll();
                    txt_p2.setText("0.0");

                    if (!txt_costo.getText().isEmpty() && !txt_p2.getText().isEmpty()) {
                        Double costo = Double.parseDouble(txt_costo.getText().replace(",", "."));
                        Double p2 = Double.parseDouble(txt_p2.getText().replace(",", "."));
                        Double tot = ((costo * p2) / 100) + costo;
                        lbl_p2.setText(String.valueOf(String.format("%.4f", tot)));
                    }

                }
            }
        } else {
            txt_p2.setText("0.0");
            txt_p2.selectAll();
        }
    }//GEN-LAST:event_txt_p2KeyReleased

    private void txt_p1KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_p1KeyReleased
        // TODO add your handling code here:
        if (ValidaNUmeros.isOnlyDouble(txt_p1.getText())) {
            if (!txt_p1.getText().isEmpty()) {
                if (ValidaNUmeros.isOnlyDouble(txt_p1.getText())) {
                    if (!txt_costo.getText().isEmpty() && !txt_p1.getText().isEmpty()) {
                        Double costo = Double.parseDouble(txt_costo.getText().replace(",", "."));
                        Double p1 = Double.parseDouble(txt_p1.getText().replace(",", "."));
                        Double tot = ((costo * p1) / 100) + costo;
                        lbl_p1.setText(String.valueOf(String.format("%.4f", tot)));
                    }
                } else {
                    txt_p1.selectAll();
                    txt_p1.setText("0.0");

                    if (!txt_costo.getText().isEmpty() && !txt_p1.getText().isEmpty()) {
                        Double costo = Double.parseDouble(txt_costo.getText().replace(",", "."));
                        Double p1 = Double.parseDouble(txt_p1.getText().replace(",", "."));
                        Double tot = ((costo * p1) / 100) + costo;
                        lbl_p1.setText(String.valueOf(String.format("%.4f", tot)));
                    }

                }
            }
        } else {
            txt_p1.setText("0.0");
            txt_p1.selectAll();
        }
    }//GEN-LAST:event_txt_p1KeyReleased

    private void check_codigoBarrasItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_check_codigoBarrasItemStateChanged
        // TODO add your handling code here:
        if (check_codigoBarras.isSelected()) {
            crearCodigodeBarras();
        }
    }//GEN-LAST:event_check_codigoBarrasItemStateChanged

    private void lbl_imgMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_lbl_imgMouseClicked
        // TODO add your handling code here:

        Frame ff = JOptionPane.getFrameForComponent(this);
        busquedaGoogle dialog = new busquedaGoogle(ff, true);
        dialog.setVisible(true);

    }//GEN-LAST:event_lbl_imgMouseClicked

    private void txt_costoFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_costoFocusGained
        // TODO add your handling code here:
        txt_costo.selectAll();
    }//GEN-LAST:event_txt_costoFocusGained

    private void txt_utilidadFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_utilidadFocusGained
        // TODO add your handling code here:
        txt_utilidad.selectAll();
    }//GEN-LAST:event_txt_utilidadFocusGained

    private void txt_pvpFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_pvpFocusGained
        // TODO add your handling code here:
        txt_pvp.selectAll();
    }//GEN-LAST:event_txt_pvpFocusGained

    private void txt_codigoBarrasKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_codigoBarrasKeyReleased
        // TODO add your handling code here:
        if (txt_codigoBarras.getText().isEmpty()) {
            img.setVisible(false);
        } else {
            if (!img.isVisible()) {
                img.setVisible(true);
            }
            ValidaNUmeros val = new ValidaNUmeros();
            if (val.keyTyped(evt)) {
                if (txt_codigoBarras.getText().length() <= 13) {
                    try {

                        String cod = CodigodeBarras.CrearCodigoBarras(txt_codigoBarras.getText());
                        BufferedImage myPicture = CodigodeBarras.CrearCodigoBarrasImagen(cod);
                        img.setIcon(new ImageIcon(myPicture));

                    } catch (IOException ex) {
                        Logger.getLogger(Crear_Productos.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else {
                    evt.consume();
                }
            }
        }
    }//GEN-LAST:event_txt_codigoBarrasKeyReleased

    private void txt_codigoBarrasKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_codigoBarrasKeyPressed
        // TODO add your handling code here:

    }//GEN-LAST:event_txt_codigoBarrasKeyPressed

    private void txt_productoFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txt_productoFocusLost
        // TODO add your handling code here:
        
        if(txt_codigoAlternativo.isEnabled()){
        txt_codigoAlternativo.setText("");
       
        String codigo = "";
        String cad = txt_producto.getText();
        String codex[];
        String r[] = cad.split(" ");
        for (String s : r) {
            if (s.length() >= 2 && !ValidaNUmeros.isOnlyNumbers(s) ) {                
              txt_codigoAlternativo.setText(txt_codigoAlternativo.getText().concat(s.substring(0, 1)));

            }

        }
       
        txt_codigoAlternativo.setText(txt_codigoAlternativo.getText().concat(String.valueOf( Math.round(Math.random()*9995899+1))));
        Deb.consola(codigo);
        }
    }//GEN-LAST:event_txt_productoFocusLost

//    public boolean guardarImagen(String ruta, String nombre) {
////        String insert = "insert into Imagenes(imagen,nombre) values(?,?)";
////        FileInputStream fis = null;
////        PreparedStatement ps = null;
////        try {
////            conexion.setAutoCommit(false);
////            File file = new File(ruta);
////            fis = new FileInputStream(file);
////            ps = conexion.prepareStatement(insert);
////            ps.setBinaryStream(1, fis, (int) file.length());
////            ps.setString(2, nombre);
////            ps.executeUpdate();
////            conexion.commit();
////            return true;
////        } catch (Exception ex) {
////            Logger.getLogger(BaseDatos.class.getName()).log(Level.SEVERE, null, ex);
////        } finally {
////            try {
////                ps.close();
////                fis.close();
////            } catch (Exception ex) {
////                Logger.getLogger(BaseDatos.class.getName()).log(Level.SEVERE, null, ex);
////            }
////        }
////        return false;
//}

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JCheckBox check_codigoBarras;
    public static javax.swing.JCheckBox chekMeses;
    private javax.swing.JLabel img;
    public static javax.swing.JButton jButton1;
    public static javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel16;
    private javax.swing.JLabel jLabel17;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel20;
    private javax.swing.JLabel jLabel21;
    private javax.swing.JLabel jLabel22;
    private javax.swing.JLabel jLabel23;
    private javax.swing.JLabel jLabel24;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel10;
    private javax.swing.JPanel jPanel11;
    private javax.swing.JPanel jPanel12;
    private javax.swing.JPanel jPanel13;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JPanel jPanel8;
    private javax.swing.JPanel jPanel9;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTabbedPane jTabbedPane1;
    private javax.swing.JLabel lbl_foto;
    public static javax.swing.JLabel lbl_img;
    public static javax.swing.JLabel lbl_p1;
    public static javax.swing.JLabel lbl_p2;
    public static javax.swing.JLabel lbl_p3;
    public static javax.swing.JRadioButton radActivoFijo;
    public static javax.swing.JRadioButton radIvaNo;
    public static javax.swing.JRadioButton radIvaSI;
    public static javax.swing.JRadioButton radProducto;
    public static javax.swing.JRadioButton radServicio;
    public static javax.swing.JTextField tmaracas;
    public static javax.swing.JTextField txt_bodega;
    public static javax.swing.JTextField txt_categorias;
    public static javax.swing.JLabel txt_codigo;
    public static javax.swing.JTextField txt_codigoAlternativo;
    public static javax.swing.JTextField txt_codigoBarras;
    public static javax.swing.JTextField txt_costo;
    public static javax.swing.JTextField txt_garantiameses;
    public static javax.swing.JTextField txt_marca;
    public static javax.swing.JTextField txt_maximos;
    public static javax.swing.JTextField txt_maximosok;
    public static javax.swing.JTextField txt_minimos;
    public static javax.swing.JTextField txt_mminimosok;
    public static javax.swing.JTextArea txt_observacion;
    public static javax.swing.JTextField txt_p1;
    public static javax.swing.JTextField txt_p2;
    public static javax.swing.JTextField txt_p3;
    public static javax.swing.JTextField txt_pasillo;
    public static javax.swing.JTextField txt_percha;
    public static javax.swing.JTextField txt_producto;
    public static javax.swing.JTextField txt_pvp;
    public static javax.swing.JTextField txt_semanas;
    public static javax.swing.JTextField txt_unidades;
    public static javax.swing.JTextField txt_utilidad;
    // End of variables declaration//GEN-END:variables
}
