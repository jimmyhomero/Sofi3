/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista.Usuarios;

import ClasesAuxiliares.Exporter;
import Controlador.Usuarios.ClientesDao;
import Controlador.Usuarios.ProveedoresDao;
import Modelo.Clientes;
import Modelo.Proveedores;
import Vista.Principal;
import static Vista.Usuarios.Crear_Proveedores.jcb_tipo;
import Vlidaciones.ValidaNUmeros;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JTable;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author USUARIO
 */
public class Buscar_Proveedores extends javax.swing.JInternalFrame {

    /**
     * Creates new form FBUsuarios
     */
    public static Integer indexPositiotoolBar;
    public static boolean consultadesdeCrearRetencio = false;
    Integer clicJtable = 0;
    Proveedores usuario1 = new Proveedores();
    //String sql_allss = "select * from usuarios";
    String sql_all = "select * from Proveedores  order BY Nombres";

    //CUsuarios obj = new CUsuarios();
    public Buscar_Proveedores() {

        initComponents();

        ProveedoresDao obj = new ProveedoresDao();
        //String sql = "select * from usuarios where estado = 'Activo'";
        jTable1.setModel(obj.Buscar_table_only_Activos(sql_all));
        this.ocultarFIlasJtable();

        ///
        // jTable1.setModel(null);
        //jTable1.setEnabled(false);
//        for(Usuarios p: cu.listar() ){            
//    }
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
        txt_cedula = new javax.swing.JTextField();
        txt_nombres = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        txt_nomComercial = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        jPanel2 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        btn_Eliminar = new javax.swing.JButton();
        btn_mostrarAll1 = new javax.swing.JButton();
        btn_excel = new javax.swing.JButton();

        setClosable(true);
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

        jLabel1.setText("Cedula");

        txt_cedula.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txt_cedulaKeyPressed(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_cedulaKeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txt_cedulaKeyTyped(evt);
            }
        });

        txt_nombres.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_nombresKeyReleased(evt);
            }
        });

        jLabel2.setText("Nombes");

        txt_nomComercial.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_nomComercialKeyReleased(evt);
            }
        });

        jLabel3.setText("Nombre Comercial");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(24, 24, 24)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 75, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txt_cedula, javax.swing.GroupLayout.PREFERRED_SIZE, 143, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 75, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txt_nombres, javax.swing.GroupLayout.PREFERRED_SIZE, 212, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 246, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txt_nomComercial, javax.swing.GroupLayout.PREFERRED_SIZE, 195, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(297, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(txt_cedula, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel2)
                            .addComponent(jLabel3))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(txt_nombres, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txt_nomComercial, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addContainerGap())
        );

        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(28, 13, -1, -1));

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder("Listar Usuarios"));

        jTable1.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
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
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 1012, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 6, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 568, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(14, Short.MAX_VALUE))
        );

        getContentPane().add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(12, 104, 1030, -1));

        btn_Eliminar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/ShowAll.png"))); // NOI18N
        btn_Eliminar.setText("Mostrar Todo");
        btn_Eliminar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_MostrarTodoActionPerformed(evt);
            }
        });
        getContentPane().add(btn_Eliminar, new org.netbeans.lib.awtextra.AbsoluteConstraints(220, 720, 180, 50));

        btn_mostrarAll1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/deleteUser.png"))); // NOI18N
        btn_mostrarAll1.setText("Eliminar");
        btn_mostrarAll1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_EliminarActionPerformed(evt);
            }
        });
        getContentPane().add(btn_mostrarAll1, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 720, 160, 50));

        btn_excel.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/icons8-MS Excel-48.png"))); // NOI18N
        btn_excel.setText("Excel");
        btn_excel.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_excelActionPerformed(evt);
            }
        });
        getContentPane().add(btn_excel, new org.netbeans.lib.awtextra.AbsoluteConstraints(410, 720, 170, 50));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void txt_cedulaKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_cedulaKeyPressed
        // TODO add your handling code here:

    }//GEN-LAST:event_txt_cedulaKeyPressed

    private void ocultarFIlasJtable() {

        jTable1.getColumnModel().getColumn(0).setMaxWidth(0);
        jTable1.getColumnModel().getColumn(0).setMinWidth(0);
        jTable1.getColumnModel().getColumn(0).setPreferredWidth(0);
//        jTable1.getColumnModel().getColumn(7).setMaxWidth(0);
//        jTable1.getColumnModel().getColumn(7).setMinWidth(0);
//        jTable1.getColumnModel().getColumn(7).setPreferredWidth(0);

    }

    private void txt_cedulaKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_cedulaKeyReleased
        // TODO add your handling code here:
        ClientesDao obj = new ClientesDao();
        jTable1.setModel(obj.Buscar_table("Cedula", txt_cedula.getText()));
        this.ocultarFIlasJtable();///

    }//GEN-LAST:event_txt_cedulaKeyReleased

    private void txt_nombresKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_nombresKeyReleased
        // TODO add your handling code here:
        ClientesDao obj = new ClientesDao();
        jTable1.setModel(obj.Buscar_table("Nombres", txt_nombres.getText()));
        this.ocultarFIlasJtable();
        ///
    }//GEN-LAST:event_txt_nombresKeyReleased

    private void txt_nomComercialKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_nomComercialKeyReleased
        // TODO add your handling code here:
        ClientesDao obj = new ClientesDao();
        jTable1.setModel(obj.Buscar_table("NombreComercial", txt_nomComercial.getText()));
        this.ocultarFIlasJtable();
        ///
    }//GEN-LAST:event_txt_nomComercialKeyReleased
//
//    private Integer llenarjcbSelectedItem(String name) {
//        Integer codigo_Tipo = null;
//        Tipo_Usuario onj = new Tipo_Usuario();
//        Tipo_UsuariosDao objDao = new Tipo_UsuariosDao();
//        ArrayList<Tipo_Usuario> lista = new ArrayList<Tipo_Usuario>();
//        lista = objDao.listar();
//        for (Tipo_Usuario tipo_Usuario : lista) {
//            if (tipo_Usuario.getTipo().equals(name)) {
//                codigo_Tipo = tipo_Usuario.getCodigo();
//                Object o;
//                o = name;
//                //Crear_Usuarios.jcb_tipo.setSelectedItem(0);
//                Crear_Usuarios.setItemSelect = o;
//                
//                System.out.println("Vista.Usuarios.Buscar_usuarios.llenarjcbSelectedItem()" + tipo_Usuario.getTipo());
//            }
//
//        }
//
//        return codigo_Tipo;
//    }

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        // TODO add your handling code here:
        clicJtable = 1;
        // Crear_Clientes.actualizarSiNO="si";
        //Double clicked
        Proveedores usuario = new Proveedores();
        ProveedoresDao objDao = new ProveedoresDao();
        Crear_Proveedores obj_crea = new Crear_Proveedores();
        JTable table = (JTable) evt.getSource();
        int row = table.getSelectedRow();
        int col = table.getSelectedColumn();
        //obtengo el codigo del usuario
        String Valor = table.getValueAt(row, 0).toString();
        //mando a buscar la informacion del usuaruio con el codigo obtenido dle evento click
        usuario = objDao.buscarConID(Integer.parseInt(Valor));
        usuario1 = usuario;

        //lleno el fomulario 
        obj_crea.txt_codigo.setText(String.valueOf(usuario.getCodigo()));
        obj_crea.txt_cedula.setText(usuario.getCedula());
        obj_crea.txt_nombres.setText(usuario.getNombre());
        obj_crea.txt_celular.setText(usuario.getCelular());
        obj_crea.txt_dir.setText(usuario.getDireccion());
        obj_crea.txt_mail.setText(usuario.getMail());
        obj_crea.txt_provincia.setText(usuario.getProvincia());
        obj_crea.txt_telefono.setText(usuario.getTelefono());
        obj_crea.txt_ciudad.setText(usuario.getCiudad());
        obj_crea.t_extension.setText(usuario.getExtension());
        obj_crea.t_nacionalidad.setText(usuario.getNacionalidad());
        obj_crea.t_vendedor.setText(usuario.getVendedor());
        obj_crea.txt_nombreComercial.setText(usuario.getNombreComercial());
        obj_crea.t_Observaciones.setTabSize(10);
        obj_crea.t_Observaciones.setText(usuario.getObservaciones());
        if (usuario.getCredito() == 1) {
            obj_crea.chek.setSelected(true);
            obj_crea.t_diasCredito.setText(usuario.getTiempoCredito());
        } else {
            obj_crea.chek.setSelected(false);
            obj_crea.t_diasCredito.setText(usuario.getTiempoCredito());
        }
        obj_crea.jcb_tipo.setSelectedItem(usuario.getPagoPredeterminado());
        if (evt.getClickCount() == 2) {

            if (consultadesdeCrearRetencio) {
                Crear_RetencionC.proveerdor = usuario;
                Crear_RetencionC.tRUc.setText(usuario.getCedula());
                Crear_RetencionC.tProveedor.setText(usuario.getNombre());

                this.dispose();
            } else {
                obj_crea.jButton1.setName("Actualizar");
                obj_crea.jButton1.setText("Actualizar");
                Principal.desktopPane.add(obj_crea);
                obj_crea.setVisible(true);
                obj_crea.requestFocus();
            }

        }
    }//GEN-LAST:event_jTable1MouseClicked

    private void txt_cedulaKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_cedulaKeyTyped
        // TODO add your handling code here:
        ValidaNUmeros val = new ValidaNUmeros();
        val.keyTyped(evt);
    }//GEN-LAST:event_txt_cedulaKeyTyped

    private void btn_excelActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_excelActionPerformed
        // TODO add your handling code here:
        Thread t = new Thread() {

            public void run() {
                XSSFWorkbook workbook = new XSSFWorkbook();
                XSSFSheet hoja = workbook.createSheet();
                XSSFRow fila = hoja.createRow(0);

                fila.createCell(0).setCellValue("RUC");
                fila.setHeightInPoints(23);
                fila.createCell(1).setCellValue("Nombres");
                fila.createCell(2).setCellValue("Direccion");

                Principal.jProgressBar2.setMaximum(jTable1.getRowCount());
                XSSFRow filas;
                Principal.jProgressBar2.setStringPainted(true);

                for (int i = 0; i < jTable1.getRowCount(); i++) {
                    jTable1.setRowSelectionInterval(i, i);

                    Principal.jProgressBar2.setValue(i + 1);
                    filas = hoja.createRow(i + 1);
                    filas.createCell(0).setCellValue(jTable1.getValueAt(i, 0).toString());
                    filas.createCell(1).setCellValue(jTable1.getValueAt(i, 1).toString());
                    filas.createCell(2).setCellValue(jTable1.getValueAt(i, 2).toString());

                    Principal.jProgressBar2.setString("Esxportando Usuarios del Sistema a Excel...");
                    try {
                        Thread.sleep(20);
                    } catch (InterruptedException ex) {
                        Logger.getLogger(Buscar_Proveedores.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                Principal.jProgressBar2.setValue(0);
                Principal.jProgressBar2.setString("");

                try {

                    workbook.write(new FileOutputStream(new File("D:\\ListadeCLientes.xlsx")));

                } catch (Exception e) {
                }

            }
        ;

        };
        t.start();

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
        ClientesDao objDao = new ClientesDao();

        jTable1.setModel(objDao.Buscar_table_only_Activos(sql_all));
//        for (int i = 0; i <= jTable1.getRowCount(); i++) {
//             if (jTable1.getValueAt(i, 7).equals("Inactivo")) {
//                //jTable1.setBackground(Color.MAGENTA);
//            } else {
//                //jTable1.setBackground(Color.GREEN);
//            }

        //oculta la columna CERO,  q es la que contiene el codido del elemnto pk
        this.ocultarFIlasJtable();
        ///
    }//GEN-LAST:event_btn_MostrarTodoActionPerformed

    private void btn_EliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_EliminarActionPerformed
        // TODO add your handling code here:
        ProveedoresDao obj1 = new ProveedoresDao();
        try {
            if (clicJtable == 1) {
                obj1.eliminar(usuario1);
                ClientesDao obj = new ClientesDao();

                jTable1.setModel(obj.Buscar_table_only_Activos(sql_all));
                this.ocultarFIlasJtable();
            }
        } catch (Exception ex) {
            Logger.getLogger(Buscar_Proveedores.class.getName()).log(Level.SEVERE, null, ex);
        }

    }//GEN-LAST:event_btn_EliminarActionPerformed

    private void formInternalFrameClosed(javax.swing.event.InternalFrameEvent evt) {//GEN-FIRST:event_formInternalFrameClosed
        // TODO add your handling code here:
//        Principal.toolbar.remove(indexPositiotoolBar);
    }//GEN-LAST:event_formInternalFrameClosed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btn_Eliminar;
    private javax.swing.JButton btn_excel;
    private javax.swing.JButton btn_mostrarAll1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    public static javax.swing.JTable jTable1;
    private javax.swing.JTextField txt_cedula;
    private javax.swing.JTextField txt_nomComercial;
    private javax.swing.JTextField txt_nombres;
    // End of variables declaration//GEN-END:variables

}
