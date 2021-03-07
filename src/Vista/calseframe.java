/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista;

import Controlador.Usuarios.Permisos_UsuariosDao;
import Controlador.Usuarios.Tipo_UsuariosDao;
import ClasesAuxiliares.debug.Deb;
import Modelo.Menu;
import Modelo.Permisos_Usuarios;
import Modelo.Tipo_Usuario;
import Vista.Usuarios.Modal_CrearFacturas;
import static Vista.jc.X;
import static Vista.jc.X2;
import static Vista.jc.Y;
import java.awt.Dimension;
import java.util.ArrayList;
import javax.swing.DefaultListModel;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeModel;
import javax.swing.tree.TreePath;
import static Vista.jc.desktopPane;

/**
 *
 * @author USUARIO
 */
public class calseframe extends javax.swing.JInternalFrame {

    private static final long serialVersionUID = 4648172894076113183L;
    ArrayList<Menu> listaMenus = new ArrayList<Menu>();
    DefaultListModel modelista = new DefaultListModel();
    DefaultMutableTreeNode abuelo = new DefaultMutableTreeNode("PERMISOS");
    DefaultTreeModel modelo = new DefaultTreeModel(abuelo);

    public calseframe() {
        initComponents();
        ////////close
        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        ////////////
        jTree1.addCheckChangeEventListener(new JCheckBoxTree.CheckChangeEventListener() {
            public void checkStateChanged(JCheckBoxTree.CheckChangeEvent event) {
                Deb.consola("event");
                TreePath[] paths = jTree1.getCheckedPaths();
                for (TreePath tp : paths) {
                    for (Object pathPart : tp.getPath()) {
                        System.out.print(pathPart + ",");
                    }
                    Deb.consola();
                }
            }
        });
        llenarJtree();
        jTree1.setModel(modelo);
        for (int i = 0; i < jTree1.getRowCount(); i++) {
            jTree1.expandRow(i);
            //jTree1.collapseRow(i);
        }

    }

    private void sss() {

        for (TreePath checkedPath : jTree1.getCheckedPaths()) {

            Deb.consola("Vista.calseframe.sss():  " + checkedPath.getPath());
        }
    }

    private void llenarJtree() {
        ArrayList<Menu> listamenu = new ArrayList<Menu>();
        menuDao mDao = new menuDao();
        listamenu = mDao.listarMenus();
        int i = 0;
        for (Menu m : listamenu) {

            if (m.getPadre() == 0) {
                DefaultMutableTreeNode p = new DefaultMutableTreeNode(m.getNombre());
                modelo.insertNodeInto(p, abuelo, i);
                i++;
                int j = 0;
                for (Menu n : listamenu) {
                    if (m.getCodigo() == n.getPadre()) {
                        DefaultMutableTreeNode q = new DefaultMutableTreeNode(n.getNombre());
                        modelo.insertNodeInto(q, p, j);
                        j++;
                    }
                }
                jTree1.expandRow(i);
            }

        }
    }

////////////////////////////////////////////////
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTextField1 = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        Guardar = new javax.swing.JButton();
        Cancelar = new javax.swing.JButton();

        jScrollPane1.setViewportView(jTree1);

        jLabel1.setText("Nuevo Perfil");

        Guardar.setText("Guardar");
        Guardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                GuardarActionPerformed(evt);
            }
        });

        Cancelar.setText("Cancelar");
        Cancelar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                CancelarActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
                jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(jPanel1Layout.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                        .addComponent(jScrollPane1)
                                        .addGroup(jPanel1Layout.createSequentialGroup()
                                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                                        .addComponent(jTextField1)
                                                        .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, 256, Short.MAX_VALUE))
                                                .addGap(0, 0, Short.MAX_VALUE))
                                        .addGroup(jPanel1Layout.createSequentialGroup()
                                                .addComponent(Guardar)
                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 92, Short.MAX_VALUE)
                                                .addComponent(Cancelar)
                                                .addGap(15, 15, 15)))
                                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
                jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                .addGap(0, 0, Short.MAX_VALUE)
                                .addComponent(jLabel1)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 412, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(Guardar)
                                        .addComponent(Cancelar))
                                .addGap(18, 18, 18))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
                layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(layout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addContainerGap(825, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
                layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(layout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addContainerGap())
        );

        pack();
    }// </editor-fold>                        

    private void CancelarActionPerformed(java.awt.event.ActionEvent evt) {
        // TODO add your handling code here:
        //this.dispose();
        // this.setBounds(jc.X+5, jc.Y+10, jc.X2, jc.Y2);
        jc.X =jc.desktopPane.getBounds().x;
        jc.Y =jc.desktopPane.getBounds().y;
        jc.X2 =jc.desktopPane.getBounds().width;
        jc.Y2 =jc.desktopPane.getBounds().height;
        
        Deb.consola("ANTES: "+this.getBounds().toString());
         Deb.consola("DIMENSION: " + jc.X + "-" + jc.Y + "-" + jc.X2 + "-" + jc.Y2);
     //   this.setSize(new Dimension(jc.X2, jc.Y2));
        Deb.consola("DESPUES: "+this.getBounds().toString());
        Deb.consola("atamaÑ "+jc.desktopPane.getBounds().toString());
        //Principal p = new Principal();
        
        Modal_CrearFacturas cx = new Modal_CrearFacturas();
        jc.desktopPane.add(cx);
        
        cx.setSize(new Dimension(jc.X2, jc.Y2));
        cx.setVisible(true);

    }

    private void GuardarActionPerformed(java.awt.event.ActionEvent evt) {
        Integer codigoTipoUsuario = null;
        Integer codigoMenuPadre = null;
        if (!jTextField1.getText().isEmpty()) {
            Tipo_Usuario tipoU = new Tipo_Usuario();
            Tipo_UsuariosDao tipoUDao = new Tipo_UsuariosDao();
            tipoU.setDescripcion("Descripcion");
            tipoU.setTipo(jTextField1.getText());
            codigoTipoUsuario = tipoUDao.guardar(tipoU);
            //tipoU.setCodigo(codigoTipoUsuario);
            TreePath[] paths = jTree1.getCheckedPaths();
            menuDao menudao = new menuDao();
            listaMenus = menudao.listarMenus();
            Permisos_Usuarios permisosUsuario = new Permisos_Usuarios();
            String nombreMenu;
            for (TreePath tp : paths) {
                nombreMenu = (String) tp.getLastPathComponent().toString();
                //  for (Object pathPart : tp.getPath()) {
                for (Menu men : listaMenus) {
                    //Deb.consola("AAAAAAAAAAA : " + nombreMenu);
                    if (men.getNombre().equalsIgnoreCase(nombreMenu)) {
                        if (men.getPadre() == 0) {
                            Deb.consola("AAAAAAAAAAA : " + nombreMenu);
                            permisosUsuario.setNombre(nombreMenu);
                            permisosUsuario.setOrden(0);
                            permisosUsuario.setPadre(0);
                            permisosUsuario.setTipoUsuario(codigoTipoUsuario);
                            permisosUsuario.setVisible(1);
                            Permisos_UsuariosDao perUsuDao = new Permisos_UsuariosDao();
                            if (codigoTipoUsuario != null) {
                                codigoMenuPadre = null;
                                ///GUARDAR MENU PRINCIAPAL
                                codigoMenuPadre = perUsuDao.guardar(permisosUsuario);
                                if (codigoMenuPadre != null) {
                                    for (Menu men2 : listaMenus) {
                                        if (men.getCodigo() == men2.getPadre() && !men.getNombre().equalsIgnoreCase(men2.getNombre())) {
                                            permisosUsuario.setNombre(men2.getNombre());
                                            permisosUsuario.setOrden(0);
                                            permisosUsuario.setPadre(men.getCodigo());
                                            permisosUsuario.setTipoUsuario(codigoTipoUsuario);
                                            permisosUsuario.setVisible(1);
                                            Permisos_UsuariosDao perUsuDao2 = new Permisos_UsuariosDao();
                                            codigoMenuPadre = perUsuDao2.guardar(permisosUsuario);
                                        }
                                    }
                                }

                            }
                            Deb.consola("Vista.calseframe.GuardarActionPerformed(): " + nombreMenu);
                        }
                    }
                }
                //}

            }
        } else {
            jTextField1.grabFocus();

        }
    }

    // Variables declaration - do not modify                     
    private javax.swing.JButton Cancelar;
    private javax.swing.JButton Guardar;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextField jTextField1;

    // End of variables declaration    
    final JCheckBoxTree jTree1 = new JCheckBoxTree();
}
