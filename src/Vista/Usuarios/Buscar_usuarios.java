/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista.Usuarios;

import ClasesAuxiliares.Exporter;
import Controlador.Usuarios.Tipo_UsuariosDao;
import Controlador.Usuarios.UsuariosDao;
import Modelo.Tipo_Usuario;
import Modelo.Usuarios;
import Vista.Principal;
import static Vista.Usuarios.Crear_Usuarios.jcb_tipo;
import Vlidaciones.ValidaNUmeros;
import java.awt.Color;
import java.awt.Font;
import java.awt.Point;
import java.awt.Rectangle;
import java.beans.PropertyVetoException;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import javax.swing.text.StyleContext;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author USUARIO
 */
public class Buscar_usuarios extends javax.swing.JInternalFrame {

    /**
     * Creates new form FBUsuarios
     */
    Integer clicJtable = 0;
    Usuarios usuario1 = new Usuarios();
    String sql_allss = "select * from usuarios";
    String sql_all = "select usuarios.*,tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo order BY usuarios.Nombres LIMIT 0, 50";
 public static Integer indexPositiotoolBar;
    //CUsuarios obj = new CUsuarios();
    public Buscar_usuarios() {

        initComponents();

        UsuariosDao obj = new UsuariosDao();
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
        txt_usuarios = new javax.swing.JTextField();
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

        txt_usuarios.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_usuariosKeyReleased(evt);
            }
        });

        jLabel3.setText("Nombre de Usuario");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(24, 24, 24)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 75, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txt_cedula, javax.swing.GroupLayout.PREFERRED_SIZE, 185, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(26, 26, 26)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 75, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txt_nombres, javax.swing.GroupLayout.PREFERRED_SIZE, 211, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(27, 27, 27)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(txt_usuarios)
                    .addComponent(jLabel3, javax.swing.GroupLayout.DEFAULT_SIZE, 170, Short.MAX_VALUE))
                .addContainerGap(308, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(jLabel3)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(txt_usuarios, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(txt_cedula, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(txt_nombres, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );

        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(12, 13, -1, -1));

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
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 1006, Short.MAX_VALUE)
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 335, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(17, Short.MAX_VALUE))
        );

        getContentPane().add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 104, 1030, 390));

        btn_Eliminar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/ShowAll.png"))); // NOI18N
        btn_Eliminar.setText("Mostrar Todo");
        btn_Eliminar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_MostrarTodoActionPerformed(evt);
            }
        });
        getContentPane().add(btn_Eliminar, new org.netbeans.lib.awtextra.AbsoluteConstraints(180, 490, 180, 50));

        btn_mostrarAll1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/deleteUser.png"))); // NOI18N
        btn_mostrarAll1.setText("Eliminar");
        btn_mostrarAll1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_EliminarActionPerformed(evt);
            }
        });
        getContentPane().add(btn_mostrarAll1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 490, 160, 50));

        btn_excel.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/icons8-MS Excel-48.png"))); // NOI18N
        btn_excel.setText("Excel");
        btn_excel.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_excelActionPerformed(evt);
            }
        });
        getContentPane().add(btn_excel, new org.netbeans.lib.awtextra.AbsoluteConstraints(370, 490, 170, 50));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void txt_cedulaKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_cedulaKeyPressed
        // TODO add your handling code here:

    }//GEN-LAST:event_txt_cedulaKeyPressed

    private void ocultarFIlasJtable() {

        jTable1.getColumnModel().getColumn(0).setMaxWidth(0);
        jTable1.getColumnModel().getColumn(0).setMinWidth(0);
        jTable1.getColumnModel().getColumn(0).setPreferredWidth(0);
        jTable1.getColumnModel().getColumn(7).setMaxWidth(0);
        jTable1.getColumnModel().getColumn(7).setMinWidth(0);
        jTable1.getColumnModel().getColumn(7).setPreferredWidth(0);
        

    }

    private void txt_cedulaKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_cedulaKeyReleased
        // TODO add your handling code here:
        UsuariosDao obj = new UsuariosDao();
        jTable1.setModel(obj.Buscar_table("Cedula", txt_cedula.getText()));
        this.ocultarFIlasJtable();///

    }//GEN-LAST:event_txt_cedulaKeyReleased

    private void txt_nombresKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_nombresKeyReleased
        // TODO add your handling code here:
        UsuariosDao obj = new UsuariosDao();
        jTable1.setModel(obj.Buscar_table("Nombres", txt_nombres.getText()));
        this.ocultarFIlasJtable();
        ///
    }//GEN-LAST:event_txt_nombresKeyReleased

    private void txt_usuariosKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_usuariosKeyReleased
        // TODO add your handling code here:
        UsuariosDao obj = new UsuariosDao();
        jTable1.setModel(obj.Buscar_table("Usuario", txt_usuarios.getText()));
        this.ocultarFIlasJtable();
        ///
    }//GEN-LAST:event_txt_usuariosKeyReleased

    private Integer llenarjcbSelectedItem(String name) {
        Integer codigo_Tipo = null;
        Tipo_Usuario onj = new Tipo_Usuario();
        Tipo_UsuariosDao objDao = new Tipo_UsuariosDao();
        ArrayList<Tipo_Usuario> lista = new ArrayList<Tipo_Usuario>();
        lista = objDao.listar();
        for (Tipo_Usuario tipo_Usuario : lista) {
            if (tipo_Usuario.getTipo().equals(name)) {
                codigo_Tipo = tipo_Usuario.getCodigo();
                Object o;
                o = name;
                //Crear_Usuarios.jcb_tipo.setSelectedItem(0);
                Crear_Usuarios.setItemSelect = o;
                
                System.out.println("Vista.Usuarios.Buscar_usuarios.llenarjcbSelectedItem()" + tipo_Usuario.getTipo());
            }

        }

        return codigo_Tipo;
    }
    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        // TODO add your handling code here:
        clicJtable = 1;
        Crear_Usuarios.actualizarSiNO="si";
        //Double clicked
        Usuarios usuario = new Usuarios();
        UsuariosDao objDao = new UsuariosDao();
        Crear_Usuarios obj_crea = new Crear_Usuarios();
//jTable1.setShowHorizontalLines(true);
//jTable1.setSelectionForeground(Color.ORANGE);
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
        obj_crea.txt_pass.setText(usuario.getPassword());
        obj_crea.txt_telefono.setText(usuario.getTelefono());
        obj_crea.txt_user.setText(usuario.getUsuario());
        //obj_crea.jcb_estado.addItem(usuario.getEstado());
        Tipo_Usuario obj = new Tipo_Usuario();
        Tipo_UsuariosDao a = new Tipo_UsuariosDao();
        obj = a.buscarConID(usuario.getTipo_Usuario_codigo());
        this.llenarjcbSelectedItem(obj.getTipo());
        //  obj_crea.jcb_estado.setSelectedItem(llenarjcbSelectedItem());
        //  obj_crea.jcb_estado.setSelectedItem();
//        List<Tipo_Usuario> listaTU = new ArrayList<Tipo_Usuario>();
//
//        Tipo_UsuariosDao tipoUDao = new Tipo_UsuariosDao();
//        //Tipo_Usuario objTU= new Tipo_Usuario ();
//        listaTU = tipoUDao.listar();
//        for (Tipo_Usuario objTU : listaTU) {
//            tipoUDao.Buscar_table("", "");
//        }
//        obj_crea.jcb_tipo.setSelectedItem(usuario.getTipo_Usuario_codigo());

        //obj_crea.jcb_estado.setSelectedIndex(usuario.geobtTipo());
        if (evt.getClickCount() == 2) {
            obj_crea.jButton1.setName("Actualizar");
            obj_crea.jButton1.setText("Actualizar");
            
            Principal.desktopPane.add(obj_crea);
            obj_crea.setVisible(true);

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

                fila.createCell(0).setCellValue("Cedula");
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
                        Logger.getLogger(Buscar_usuarios.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                Principal.jProgressBar2.setValue(0);
                Principal.jProgressBar2.setString("");

                try {

                    workbook.write(new FileOutputStream(new File("D:\\Excel.xlsx")));

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
        UsuariosDao objDao = new UsuariosDao();

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
        UsuariosDao obj1 = new UsuariosDao();
        try {
            if (clicJtable == 1) {
                obj1.eliminar(usuario1);
                UsuariosDao obj = new UsuariosDao();

                jTable1.setModel(obj.Buscar_table_only_Activos(sql_all));
                this.ocultarFIlasJtable();
            }
        } catch (Exception ex) {
            Logger.getLogger(Buscar_usuarios.class.getName()).log(Level.SEVERE, null, ex);
        }

    }//GEN-LAST:event_btn_EliminarActionPerformed

    private void formInternalFrameClosed(javax.swing.event.InternalFrameEvent evt) {//GEN-FIRST:event_formInternalFrameClosed
        // TODO add your handling code here:
        
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
    private javax.swing.JTextField txt_nombres;
    private javax.swing.JTextField txt_usuarios;
    // End of variables declaration//GEN-END:variables

}