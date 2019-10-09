/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista.Sat;

import Controlador.Sat.SatAparatoDao;
import Controlador.Sat.SatSerieDao;
import Controlador.Usuarios.CategoriasDao;
import Controlador.Usuarios.ColorDao;
import Controlador.Usuarios.MarcasDao;
import Controlador.Usuarios.ModelosDao;
import Modelo.Clientes;
import Modelo.Color;
import Modelo.Marcas;
import Modelo.Modelos;
import Modelo.SatAparato;
import Modelo.SatSeries;
import Modelo.categorias;
import com.mxrck.autocompleter.AutoCompleterCallback;
import com.mxrck.autocompleter.TextAutoCompleter;
import java.awt.event.KeyEvent;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JRootPane;
import javax.swing.SwingUtilities;

/**
 *
 * @author USUARIO
 */
public class New_Aparato extends javax.swing.JDialog {

    /**
     * Creates new form New_Aparato
     */
    TextAutoCompleter autocompleteMarcas = null;
    ArrayList<Marcas> lista_Marcas = new ArrayList<Marcas>();
        TextAutoCompleter autocompleteSeries = null;
    ArrayList<SatSeries> lista_Series = new ArrayList<SatSeries>();
    TextAutoCompleter autocompleteModelos = null;
    ArrayList<categorias> lista_Categorias = new ArrayList<categorias>();
    TextAutoCompleter autocompleteCategorias = null;
    ArrayList<Color> lista_Color = new ArrayList<Color>();
    TextAutoCompleter autocompleteColor = null;

    ArrayList<Modelos> lista_Modelos = new ArrayList<Modelos>();
    private List<SatAparato> listaAparatos = new ArrayList<SatAparato>();
    public static Clientes cliente = new Clientes();
    Integer codigoMarca = -1;
    String marcaSeleccionada = "";
    Integer codigoModelo = -1;
    String modeloSeleccionada = "";
    Integer codigoSerie = -1;
    String SerieSeleccionada = "";
    Integer codigoCategoria = -1;
    String categoriaSeleccionada = ""; 
    Integer codigoColor = -1;
    String colorSeleccionado = ""; 
    

    public New_Aparato(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        txtDescripcion.setLineWrap(true);
        txtDescripcion.setWrapStyleWord(true);
        txtObsevaciones.setWrapStyleWord(true);
        txtObsevaciones.setLineWrap(true);
        ///////////////// marcas

        MarcasDao objMarcasDao = new MarcasDao();
        lista_Marcas = objMarcasDao.listar();
////autocomplete

        autocompleteMarcas = new TextAutoCompleter(txtMarca, new AutoCompleterCallback() {

            @Override
            public void callback(Object selectedItem) {

                if (selectedItem instanceof Marcas) {
                    Marcas c = new Marcas();
                    c = ((Marcas) selectedItem);
                    txtMarca.setText(c.getMarca());
                    codigoMarca = c.getCodigo();
                    marcaSeleccionada = c.getMarca();
                    txtModelo.transferFocus();

                } else {
                    System.out.println("El item es de un tipo desconocido");
                }

            }
        });
        autocompleteMarcas.setCaseSensitive(false);
        autocompleteMarcas.setMode(0);
        for (Marcas p : lista_Marcas) {
            autocompleteMarcas.addItem(p);
        }
////////////categorais
        CategoriasDao catDao = new CategoriasDao();
        lista_Categorias = catDao.listar();
////autocomplete

        autocompleteCategorias = new TextAutoCompleter(txtcategoria, new AutoCompleterCallback() {

            @Override
            public void callback(Object selectedItem) {

                if (selectedItem instanceof categorias) {
                    categorias c = new categorias();
                    c = ((categorias) selectedItem);
                    txtMarca.setText(c.getCategoria());
                    codigoCategoria = c.getCodigo();
                    categoriaSeleccionada = c.getCategoria();
                    txtModelo.transferFocus();

                } else {
                    System.out.println("El item es de un tipo desconocido");
                }

            }
        });
        autocompleteCategorias.setCaseSensitive(false);
        autocompleteCategorias.setMode(0);
        for (categorias p : lista_Categorias) {
            autocompleteCategorias.addItem(p);
        }

///////

////////////color
        ColorDao colDao = new ColorDao();
        lista_Color = colDao.listar();
////autocomplete

        autocompleteColor = new TextAutoCompleter(txtColor, new AutoCompleterCallback() {

            @Override
            public void callback(Object selectedItem) {

                if (selectedItem instanceof Color) {
                    Color c = new Color();
                    c = ((Color) selectedItem);
                    txtColor.setText(c.getColor());
                    codigoColor = c.getCodigo();
                    colorSeleccionado = c.getColor();
                    txtColor.transferFocus();

                } else {
                    System.out.println("El item es de un tipo desconocido");
                }

            }
        });
        autocompleteColor.setCaseSensitive(false);
        autocompleteColor.setMode(0);
        for (Color p : lista_Color) {
            autocompleteColor.addItem(p);
        }

///////

        autocompleteModelos = new TextAutoCompleter(txtModelo, new AutoCompleterCallback() {

            @Override
            public void callback(Object selectedItem) {

                if (selectedItem instanceof Modelos) {
                    Modelos c = new Modelos();
                    c = ((Modelos) selectedItem);
                    codigoModelo = c.getCodigo();
                    txtModelo.setText(c.getModelo());
                    modeloSeleccionada = c.getModelo();
                } else {
                    System.out.println("El item es de un tipo desconocido");
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
        txtMarca = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        txtModelo = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        txtNumParte = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        txtcategoria = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        jScrollPane3 = new javax.swing.JScrollPane();
        txtObsevaciones = new javax.swing.JTextArea();
        jLabel9 = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        txtColor = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        txtseries = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        txtDescripcion = new javax.swing.JTextArea();
        jPanel7 = new javax.swing.JPanel();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder("Nuevo Aparato"));

        jPanel3.setBorder(javax.swing.BorderFactory.createTitledBorder("Aparatos Registrados"));

        txtMarca.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtMarcaKeyTyped(evt);
            }
        });

        jLabel4.setText("Marca");

        jLabel5.setText("Modelo: ");

        txtModelo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtModeloActionPerformed(evt);
            }
        });
        txtModelo.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtModeloKeyTyped(evt);
            }
        });

        jLabel6.setText("N. Pate");

        txtNumParte.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtNumParteKeyTyped(evt);
            }
        });

        jLabel7.setText("Categoria");

        txtcategoria.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtcategoriaKeyTyped(evt);
            }
        });

        jLabel8.setText("Descripcion");

        txtObsevaciones.setColumns(20);
        txtObsevaciones.setRows(5);
        jScrollPane3.setViewportView(txtObsevaciones);

        jLabel9.setText("Observaciones");

        jLabel1.setText("Color");

        txtColor.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtColorKeyTyped(evt);
            }
        });

        jLabel3.setText("Serie");

        txtseries.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txtseriesKeyPressed(evt);
            }
        });

        txtDescripcion.setColumns(20);
        txtDescripcion.setRows(5);
        jScrollPane1.setViewportView(txtDescripcion);

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                    .addComponent(jScrollPane3, javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel3Layout.createSequentialGroup()
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel3Layout.createSequentialGroup()
                                    .addContainerGap()
                                    .addComponent(jLabel7)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addComponent(txtcategoria))
                                .addGroup(jPanel3Layout.createSequentialGroup()
                                    .addComponent(jLabel6)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                        .addGroup(jPanel3Layout.createSequentialGroup()
                                            .addComponent(txtNumParte, javax.swing.GroupLayout.PREFERRED_SIZE, 138, javax.swing.GroupLayout.PREFERRED_SIZE)
                                            .addGap(18, 18, 18)
                                            .addComponent(jLabel3))
                                        .addComponent(txtMarca))))
                            .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 52, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txtseries, javax.swing.GroupLayout.PREFERRED_SIZE, 183, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addComponent(jLabel1)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(txtColor, javax.swing.GroupLayout.PREFERRED_SIZE, 144, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addComponent(jLabel5)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(txtModelo, javax.swing.GroupLayout.PREFERRED_SIZE, 123, javax.swing.GroupLayout.PREFERRED_SIZE))))
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel8, javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel9, javax.swing.GroupLayout.Alignment.LEADING))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGap(7, 7, 7)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel7)
                    .addComponent(txtcategoria, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1)
                    .addComponent(txtColor, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtMarca, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4)
                    .addComponent(jLabel5)
                    .addComponent(txtModelo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(15, 15, 15)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6)
                    .addComponent(txtNumParte, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3)
                    .addComponent(txtseries, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel8)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 10, Short.MAX_VALUE)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel9)
                .addGap(3, 3, 3)
                .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        jPanel7.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        jButton1.setBackground(new java.awt.Color(0, 153, 153));
        jButton1.setText("Guardar");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jButton2.setBackground(new java.awt.Color(255, 102, 102));
        jButton2.setText("Cancelar");

        javax.swing.GroupLayout jPanel7Layout = new javax.swing.GroupLayout(jPanel7);
        jPanel7.setLayout(jPanel7Layout);
        jPanel7Layout.setHorizontalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 212, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 154, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel7Layout.setVerticalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(0, 24, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel7, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel7, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(26, 26, 26))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void txtModeloActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtModeloActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtModeloActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        Integer codigoEquipo = null;
        if (!txtseries.getText().equals("") && !txtMarca.getText().equals("") && !txtMarca.getText().equals("") && !txtModelo.getText().equals("") && !txtDescripcion.getText().equals("")) {

            ////////////////////////MARCAS MODELO Y CATEGORIAS
            ////////////////// MARCAS Y MODLEOS CODIGO 
            if (!txtMarca.getText().isEmpty()) {
                codigoMarca = -1;
                for (Marcas marca : lista_Marcas) {
                    if (marca.getMarca().equalsIgnoreCase(txtMarca.getText())) {
                        codigoMarca = marca.getCodigo();
                    }

                }
                if (codigoMarca == -1) {
                    Marcas m = new Marcas();
                    MarcasDao mDao = new MarcasDao();
                    m.setMarca(txtMarca.getText());
                    m.setDescripcion("Auto");
                    codigoMarca = mDao.guardar(m);

                    /////////////////categorias
                    if (!txtModelo.getText().isEmpty()) {
                        codigoModelo = -1;
                        for (Modelos mo : lista_Modelos) {
                            if (mo.getModelo().equalsIgnoreCase(txtModelo.getText())) {
                                codigoModelo = mo.getCodigo();
                            }

                        }
                        if (codigoModelo == -1) {
                            Modelos mod = new Modelos();
                            ModelosDao modDao = new ModelosDao();
                            mod.setModelo(txtModelo.getText());
                            mod.setMarcas_Codigo(codigoMarca);
                            mod.setDescripcion("Auto");
                            codigoModelo = modDao.guardar(mod);
                        }
                    }
/////////////////////////

                } else {

                    /////////////////modleos
                    if (!txtModelo.getText().isEmpty()) {
                        codigoModelo = -1;
                        for (Modelos m : lista_Modelos) {
                            if (m.getModelo().equals(txtModelo.getText())) {
                                codigoModelo = m.getCodigo();
                            }

                        }
                        if (codigoModelo == -1) {
                            Modelos mod = new Modelos();
                            ModelosDao modDao = new ModelosDao();
                            mod.setModelo(txtModelo.getText());
                            mod.setMarcas_Codigo(codigoMarca);
                            mod.setDescripcion("Auto");
                            codigoModelo = modDao.guardar(mod);
                        }

                    }
                }
            }
            ///INICIO CATEGORIAS
            if (!txtcategoria.getText().isEmpty()) {
                codigoModelo = -1;
                for (categorias m : lista_Categorias) {
                    if (m.getCategoria().equals(txtcategoria.getText())) {
                        codigoCategoria = m.getCodigo();
                    }
                }
                if (codigoCategoria == -1) {
                    categorias mod = new categorias();
                    CategoriasDao modDao = new CategoriasDao();
                    mod.setCategoria(txtcategoria.getText());                    
                    mod.setDescripcion("Auto");
                    codigoCategoria = modDao.guardar(mod);
                }

            }
////////////FIN CATEGORIAS

///INICIO COLOR
            if (!txtColor.getText().isEmpty()) {
                codigoModelo = -1;
                for (Color m : lista_Color) {
                    if (m.getColor().equals(txtColor.getText())) {
                        codigoColor= m.getCodigo();
                    }
                }
                if (codigoColor == -1) {
                    Color mod = new Color();
                    ColorDao modDao = new ColorDao();
                    mod.setColor(txtcategoria.getText());                    
                    
                    codigoCategoria = modDao.guardar(mod);
                }

            }
////////////FIN COLOR
            ///////////////////////FIN MARCAS MODELOS Y CATEGORAIS
            SatAparatoDao aparatoDao = new SatAparatoDao();
            SatAparato aparato = new SatAparato();
            aparato.setCategria(txtModelo.getText());
            aparato.setDescripcion(txtDescripcion.getText());
            aparato.setMarca(txtMarca.getText());
            aparato.setModelo(txtModelo.getText());
            aparato.setParte(txtNumParte.getText());
            aparato.setObservaciones(txtObsevaciones.getText());
            aparato.setCategria(marcaSeleccionada);
            aparato.setSatOrden_codigo(0);
            codigoEquipo = aparatoDao.guardar(aparato);
            Crear_Orden.aparatoCodigo = codigoEquipo;
            if (codigoEquipo != null) {
                SatSeries serie = new SatSeries();
                SatSerieDao serieDao = new SatSerieDao();
                serie.setDisponible(0);
                serie.setSatAparato_codigo(codigoEquipo);
                serie.setSerie(txtseries.getText());
                serie.setColor(txtColor.getText());
                serieDao.guardar(serie);
            }
            Crear_Orden.txtColor.setText(txtColor.getText());
            Crear_Orden.txtMarca.setText(txtMarca.getText());
            Crear_Orden.txtModelo.setText(txtModelo.getText());

            this.dispose();
        }
    }//GEN-LAST:event_jButton1ActionPerformed

    private void txtseriesKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtseriesKeyPressed
        // TODO add your handling code here:
        if (evt.getKeyCode() == KeyEvent.VK_ENTER) {
            SatSeries serie = new SatSeries();
            SatSerieDao serieDao = new SatSerieDao();
            serie = serieDao.buscarSerieAparato(txtseries.getText());
            if (serie.getCodigo() != null) {

            }
        }
        lleanaDecripccion();
    }//GEN-LAST:event_txtseriesKeyPressed

    private void lleanaDecripccion() {
        //if(txtDescripcion.getText().length()==48){

        //}
        txtDescripcion.setTabSize(48);
        txtDescripcion.setColumns(3);
        txtDescripcion.setText(txtcategoria.getText() + " MARCA: " + txtMarca.getText() + " MODELO: " + txtModelo.getText() + " COLOR: " + txtColor.getText() + " SERIE: " + txtseries.getText() + " N.- PARTE :" + txtNumParte.getText());
    }
    private void txtMarcaKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtMarcaKeyTyped
        // TODO add your handling code here:
        lleanaDecripccion();
    }//GEN-LAST:event_txtMarcaKeyTyped

    private void txtModeloKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtModeloKeyTyped
        // TODO add your handling code here:
        lleanaDecripccion();
    }//GEN-LAST:event_txtModeloKeyTyped

    private void txtNumParteKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtNumParteKeyTyped
        // TODO add your handling code here:
        lleanaDecripccion();
    }//GEN-LAST:event_txtNumParteKeyTyped

    private void txtcategoriaKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtcategoriaKeyTyped
        // TODO add your handling code here:
        lleanaDecripccion();
    }//GEN-LAST:event_txtcategoriaKeyTyped

    private void txtColorKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtColorKeyTyped
        // TODO add your handling code here:
        lleanaDecripccion();
    }//GEN-LAST:event_txtColorKeyTyped

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
            java.util.logging.Logger.getLogger(New_Aparato.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(New_Aparato.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(New_Aparato.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(New_Aparato.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the dialog */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                New_Aparato dialog = new New_Aparato(new javax.swing.JFrame(), true);
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
    private javax.swing.JButton jButton2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JTextField txtColor;
    private javax.swing.JTextArea txtDescripcion;
    private javax.swing.JTextField txtMarca;
    private javax.swing.JTextField txtModelo;
    private javax.swing.JTextField txtNumParte;
    private javax.swing.JTextArea txtObsevaciones;
    private javax.swing.JTextField txtcategoria;
    public static javax.swing.JTextField txtseries;
    // End of variables declaration//GEN-END:variables
}
