/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login;

import AA_MainPruebas.Download;
import ClasesAuxiliares.DaoEmpresaImpl;
import ClasesAuxiliares.Fowiz;
import ClasesAuxiliares.MaquinaDao;
import ClasesAuxiliares.NewConfigfile;
import ClasesAuxiliares.Variables;
import Controlador.Coneccion;
import Controlador.Ejemplo;
import Controlador.Usuarios.DatosEmpresaDao;
import Controlador.Usuarios.EquiposDao;
import Controlador.Usuarios.UsuariosDao;
import Modelo.DatosEmpresa;
import Modelo.Equipos;
import ClasesAuxiliares.debug.Deb;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JRootPane;
import javax.swing.SwingUtilities;
import Modelo.Usuarios;
import Vista.Principal;
import static Vista.Principal.desktopPane;
import Vista.Usuarios.Configuracion;
import Vista.Usuarios.ConfigurarServidor;
import Vista.Usuarios.ErrorConexion;
import Vista.Usuarios.NuevoEquipo;
import Vista.Usuarios.SelectCaja;
import Vista.alertas.MnesajesOption;
import Vista.jc;
import Vlidaciones.ProgressBar;
import ec.gob.sri.comprobantes.ws.Mensaje;
import ecx.unomas.service.Config;
import java.awt.Frame;
import java.io.File;
//import static Vista.Usuarios.DatosEmpresaForm.txt_nombres;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.swing.UIManager;

/**
 *
 * @author USUARIO
 */
public class login extends javax.swing.JFrame {

    boolean conexionFallida = false;
    public static Integer loginok = 0;
    public static String usuario;
    public static String nombresUsuario;
    public static Integer CodigoUsuario;
    public static Integer CodigoTipoUsuario;
    public static String nombreDelEquipo;
    public static Integer CodigoDelEquipo;
    public static String nombreEmpresa;
    public static String rucEmpresa;
    public static String contribuyenteEspecialNUmero = "";
    public static String direccionEmpresa;
    public static String telefonoEmpresa;
    public static String celularEmpresa;
    public static String os;
    public static String ObligadoSiNOEmpresa = "SI";
    public static Integer codigoCaja;
    public static boolean cerrar = false;
    public static String __unidadPersistencia = "pu";
    Map<String, String> persistenceMap = new HashMap<String, String>();

    // public static EntityManagerFactory __factory;
    // public static Persistence p = new Persistence();
    public login() throws ParseException {

        initComponents();

        Variables.trial();

        //envio sms
        Fowiz f = new Fowiz();
        //f.sms();
        ///////seleciona nombre real de equipos
        ////IMPORTANTE INICIALIZAR VARIABLE IP SERVIDOR
        os = Ejemplo.getSistemaOerativo();
        DaoEmpresaImpl DaoEmpx = new DaoEmpresaImpl();
        DaoEmpx.getListEmpresa();
        ////////////////
        
        
        Variables a = new Variables();
        llenarListaEmpresas();

        setLocationRelativeTo(null);
        JRootPane rootPane = SwingUtilities.getRootPane(this.btn_login);
        rootPane.setDefaultButton(this.btn_login);
        
    }

    private boolean validaEquipo() {
        EquiposDao objDao = new EquiposDao();
        EquiposDao objDao2 = new EquiposDao();
        Equipos obj = new Equipos();
        MaquinaDao maqDao = new MaquinaDao();
        boolean equipoRegistrado = false;
        for (Equipos e : objDao.listar()) {

            if (e.getNombreReal().equals(maqDao.getNombreEquipo())) {
                CodigoDelEquipo = e.getCodigo();
                System.err.println("CODIGO DLE EQUIPO: " + CodigoDelEquipo);
                nombreDelEquipo = e.getNombreReal();
                codigoCaja = e.getCajas_Codigo();
                Deb.consola("forms.login.<init>()aaaaaaaaaaaaaaaaaaaa nombre real : " + e.getNombreReal());
                e.setIp(maqDao.getIpEquipo());
                equipoRegistrado = true;
                objDao2.modificar(e);
            }
        }
        nombreDelEquipo = maqDao.getNombreEquipo();
        return equipoRegistrado;
    }

    private void llenarListaEmpresas() {
        ArrayList<String> lst = new ArrayList();

        try {

            DaoEmpresaImpl DaoEmp = new DaoEmpresaImpl();

            lst = DaoEmp.getListEmpresa();
            if (lst != null) {
                cerrar = true;
                for (String usr : lst) {
                    cb_empresas.addItem(usr);
                }
            } else {
                MnesajesOption m = new MnesajesOption();
                m.tipoMensajeError(1, "");
                m.setVisible(false);
                System.exit(0);

//
            }

        } catch (Exception ex) {
            MnesajesOption m = new MnesajesOption();
            m.tipoMensajeError(2, "Error al conectarse a la Base de Datos.. ");
            m.setVisible(false);
            System.exit(0);

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

        jScrollPane1 = new javax.swing.JScrollPane();
        jTextArea1 = new javax.swing.JTextArea();
        jPanel1 = new javax.swing.JPanel();
        jLabel4 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jPanel2 = new javax.swing.JPanel();
        txt_user = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        txt_pass = new javax.swing.JPasswordField();
        jLabel3 = new javax.swing.JLabel();
        btn_login = new javax.swing.JButton();
        cb_empresas = new javax.swing.JComboBox<>();
        btn_login1 = new javax.swing.JButton();
        jPanel3 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();

        jTextArea1.setColumns(20);
        jTextArea1.setRows(5);
        jScrollPane1.setViewportView(jTextArea1);

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setIconImages(getIconImages());
        setUndecorated(true);
        addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                formFocusGained(evt);
            }
        });
        addWindowFocusListener(new java.awt.event.WindowFocusListener() {
            public void windowGainedFocus(java.awt.event.WindowEvent evt) {
                formWindowGainedFocus(evt);
            }
            public void windowLostFocus(java.awt.event.WindowEvent evt) {
            }
        });
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel1.setBackground(java.awt.Color.orange);
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel4.setFont(new java.awt.Font("Tahoma", 1, 36)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText("LOGIN");
        jPanel1.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 0, 140, 60));

        jLabel6.setFont(new java.awt.Font("Tahoma", 1, 36)); // NOI18N
        jLabel6.setForeground(new java.awt.Color(255, 255, 255));
        jLabel6.setText("X");
        jLabel6.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel6MouseClicked(evt);
            }
        });
        jPanel1.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(400, 0, 30, 60));

        jLabel8.setFont(new java.awt.Font("Tahoma", 1, 36)); // NOI18N
        jLabel8.setForeground(new java.awt.Color(255, 255, 255));
        jLabel8.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel8MouseClicked(evt);
            }
        });
        jPanel1.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 50, 60));

        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 440, 60));

        jPanel2.setBackground(new java.awt.Color(0, 102, 102));
        jPanel2.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        txt_user.setBackground(new java.awt.Color(204, 204, 204));
        txt_user.setFont(new java.awt.Font("Tahoma", 0, 15)); // NOI18N
        txt_user.setForeground(new java.awt.Color(255, 255, 255));
        txt_user.setText("ADMIN");
        txt_user.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_userActionPerformed(evt);
            }
        });
        jPanel2.add(txt_user, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 30, 230, 30));

        jLabel2.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jLabel2.setText("Usuario:");
        jPanel2.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 40, 90, -1));

        txt_pass.setBackground(new java.awt.Color(204, 204, 204));
        txt_pass.setForeground(new java.awt.Color(255, 255, 255));
        txt_pass.setText("ADMIN");
        txt_pass.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_passActionPerformed(evt);
            }
        });
        jPanel2.add(txt_pass, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 70, 230, 30));

        jLabel3.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(255, 255, 255));
        jLabel3.setText("Password:");
        jPanel2.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 80, 100, -1));

        btn_login.setBackground(java.awt.SystemColor.textHighlight);
        btn_login.setFont(new java.awt.Font("Tahoma", 1, 20)); // NOI18N
        btn_login.setForeground(new java.awt.Color(255, 255, 255));
        btn_login.setText("Login");
        btn_login.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_loginActionPerformed(evt);
            }
        });
        jPanel2.add(btn_login, new org.netbeans.lib.awtextra.AbsoluteConstraints(250, 110, 110, 30));

        cb_empresas.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        cb_empresas.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                cb_empresasItemStateChanged(evt);
            }
        });
        cb_empresas.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cb_empresasActionPerformed(evt);
            }
        });
        jPanel2.add(cb_empresas, new org.netbeans.lib.awtextra.AbsoluteConstraints(80, 160, 320, 30));

        btn_login1.setBackground(new java.awt.Color(255, 102, 0));
        btn_login1.setFont(new java.awt.Font("Tahoma", 1, 20)); // NOI18N
        btn_login1.setForeground(new java.awt.Color(255, 255, 255));
        btn_login1.setText("Cerrar");
        btn_login1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_login1ActionPerformed(evt);
            }
        });
        jPanel2.add(btn_login1, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 110, 110, 30));

        getContentPane().add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 60, 440, 250));

        jPanel3.setBackground(java.awt.Color.orange);
        jPanel3.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jPanel3MouseClicked(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 13)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("Ingreso de Credenciales...");
        jPanel3.add(jLabel1);

        getContentPane().add(jPanel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 310, 440, 30));

        pack();
    }// </editor-fold>//GEN-END:initComponents


    private void btn_loginActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_loginActionPerformed

/////////////////inicializa la condiguracion de los direcctorios detectando si el equipos es linux o Windows
        Config.iniciarConfig();
//   Persona per = new Persona();
        //JOptionPane.showMessageDialog(null,Config.GENERADOS_DIR );
        String u = txt_user.getText();
        String p = String.valueOf(txt_pass.getPassword());
        ArrayList<Usuarios> lst = new ArrayList();

        try {
            UsuariosDao DaoUser = new UsuariosDao();
            lst = DaoUser.GetLoginOk(u, p);
            boolean estaregistrado = validaEquipo();
            if (!lst.isEmpty()) {
                for (Usuarios usr : lst) {

                    if (usr.getPassword().equals(p) && usr.getUsuario().equals(u)) {
                        nombresUsuario = usr.getNombre();
                        CodigoUsuario = usr.getCodigo();
                        CodigoTipoUsuario = usr.getTipo_Usuario_codigo();
                        usuario = usr.getUsuario();
                        if (estaregistrado) {
                            DatosEmpresa obj = new DatosEmpresa();
                            DatosEmpresaDao objDao = new DatosEmpresaDao();
                            obj = objDao.getEepresaNUmero1();
                            nombreEmpresa = obj.getNombre();
                            direccionEmpresa = obj.getNombre();
                            rucEmpresa = obj.getRuc();
                            telefonoEmpresa = obj.getTelefono();
                            celularEmpresa = obj.getCelular();
                            persistenceMap.put("javax.persistence.jdbc.url", "jdbc:mysql://localhost:3306/" + Coneccion.bdd + "?zeroDateTimeBehavior=convertToNull");
                            persistenceMap.put("javax.persistence.jdbc.user", "root");
                            persistenceMap.put("javax.persistence.jdbc.password", "miguel66677710101418/2=golosos");
                            persistenceMap.put("javax.persistence.jdbc.driver", "com.mysql.jdbc.Driver");
                            Deb.consola("Base seleccionada Persistence " + Coneccion.bdd);
///////                            __factory=Persistence.createEntityManagerFactory("pu", persistenceMap);

//                            jc principal2 = new jc();
//                            
//                            principal2.setVisible(true);
                            Principal m = new Principal();
                            m.setVisible(true);
                            this.setVisible(false);
                            
                        } else {
                      //      this.setVisible(false);

                            JOptionPane.showMessageDialog(null, "Este equipo ** " + nombreDelEquipo + " ** no esta registrado");
                            Configuracion.esteesequipoNuevo = 1;
                            Principal m = new Principal();
                            m.menuBar.setVisible(false);
                            m.setVisible(true);
                            this.setVisible(false);
                            Configuracion obj = new Configuracion();
                            desktopPane.add(obj);
                            obj.setVisible(true);

//                            Frame f = JOptionPane.getFrameForComponent(this);
//                            NuevoEquipo dialog = new NuevoEquipo(f, true);
//                            dialog.setLocationRelativeTo(null);
//                            dialog.setVisible(true);
                            //   System.exit(0);
                        }
                        //   Deb.consola("forms.login.btn_loginActionPerformed():" this.);
                    } else {
                        txt_user.setText("");
                        txt_pass.setText("");
                    }
                }
            } else {
                txt_user.setText("");
                txt_pass.setText("");
            }

        } catch (Exception ex) {
            Deb.consola(ex + "  :  ssssssssssssa*asd-EN Lodasdgin");
            Deb.consola(ex+" loguin kakc");
           // JOptionPane.showMessageDialog(null, ex + "sdasdassdasvvvvv");
        }
    }//GEN-LAST:event_btn_loginActionPerformed

    private void txt_passActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_passActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_passActionPerformed

    private void cb_empresasItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_cb_empresasItemStateChanged
        // TODO add your handling code here:
        Deb.consola("forms.login.cb_empresasItemStateChanged()" + cb_empresas.getSelectedItem().toString());
        // Coneccion a = new Coneccion();
        Coneccion.bdd = cb_empresas.getSelectedItem().toString();

    }//GEN-LAST:event_cb_empresasItemStateChanged

    private void txt_userActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_userActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_userActionPerformed

    private void formFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_formFocusGained
        // TODO add your handling code here:
//        Deb.consola("forms.login.formFocusGained()coneccion faliiida : " +conexionFallida);
//        if(conexionFallida){
//                    
//            ConfigConn cn = new ConfigConn();
//            cn.setVisible(true);
//            this.setVisible(false);
//            this.dispose();
//                    }
    }//GEN-LAST:event_formFocusGained

    private void formWindowGainedFocus(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowGainedFocus
        // TODO add your handling code here:
        if (!cerrar) {
            this.dispose();
        }
    }//GEN-LAST:event_formWindowGainedFocus

    private void jLabel6MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel6MouseClicked
        // TODO add your handling code here:        
        System.exit(0);        
    }//GEN-LAST:event_jLabel6MouseClicked

    private void jLabel8MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel8MouseClicked
        // TODO add your handling code here:
        if (evt.getClickCount() == 3) {
            MnesajesOption m = new MnesajesOption();
            m.tipoMensajeError(1, "");
            m.setVisible(false);
        }

//        Frame ff = JOptionPane.getFrameForComponent(this);
//        ConfigurarServidor dialog = new ConfigurarServidor(ff, true);
//        dialog.setVisible(true);
//        dispose();
    }//GEN-LAST:event_jLabel8MouseClicked

    private void cb_empresasActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cb_empresasActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cb_empresasActionPerformed

    private void btn_login1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_login1ActionPerformed
        // TODO add your handling code here:
        System.exit(0);
    }//GEN-LAST:event_btn_login1ActionPerformed

    private void jPanel3MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jPanel3MouseClicked
        // TODO add your handling code here:
        if(evt.getClickCount()==2){
        ConfigurarServidor c = new ConfigurarServidor(this, false);
        c.setVisible(true);
        }
    }//GEN-LAST:event_jPanel3MouseClicked

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
            //UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
            // UIManager.setLookAndFeel("javax.swing.plaf.metal.MetalLookAndFeel");
            //UIManager.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
            UIManager.setLookAndFeel("com.sun.java.swing.plaf.motif.MotifLookAndFeel");

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                Deb.consola("lookkkkkkkkk:  " + info.getName());
            
            }
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                Deb.consola("lookkkkkkkkk:  " + info.getName());
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    new login().setVisible(cerrar);
                } catch (ParseException ex) {
                    Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
        });
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btn_login;
    private javax.swing.JButton btn_login1;
    private javax.swing.JComboBox<String> cb_empresas;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextArea jTextArea1;
    private javax.swing.JPasswordField txt_pass;
    private javax.swing.JTextField txt_user;
    // End of variables declaration//GEN-END:variables
}
