/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista.Usuarios;

import ClasesAuxiliares.http.getUrlFromGoogle;
import Controlador.Ejemplo;
import static Vista.Usuarios.Crear_Productos.txt_producto;
import java.awt.Image;
import java.awt.event.KeyEvent;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import javax.imageio.ImageIO;
import javax.mail.Message;
import ClasesAuxiliares.debug.Deb;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;

/**
 *
 * @author USUARIO
 */
public class busquedaGoogle extends javax.swing.JDialog {

    /**
     * Creates new form busquedaGoogle
     */
    File f1;
    File f2;
    File f3;
    File f4;
    int contadorImgs = 0;
    int numImgs = 4;
    List<String> listaurl = null;
    //verifica si la cadena de busqueda es la misma que se envia, evita enviar varioas busquedas de lo mismo por falta de paciencia
    String yabuscado = "";

    public busquedaGoogle(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        listaurl = getUrlFromGoogle.getImagesFromGoogle(txt_producto.getText());
        setimgLabel(numImgs);
        setLocationRelativeTo(null);

    }

    public void setimgLabel(int numImagenes) {
        int i = 1;
        for (String link : listaurl) {

            if (contadorImgs < numImagenes) {
                try {
                    Image image = null;

                    URL url = new URL(listaurl.get(contadorImgs));
                    image = ImageIO.read(url);
                    if (image != null) {
                        ImageIcon icon = new ImageIcon(image);
                        Icon icono = new ImageIcon(icon.getImage().getScaledInstance(297, 190, Image.SCALE_DEFAULT));
                        if (i == 1) {
                            limg1.setText(null);
                            limg1.setIcon(icono);
                            try (InputStream in = new URL(listaurl.get(contadorImgs)).openStream()) {
                                File fs= new File(Ejemplo.dirIMGtempgoogleSearch+"i1.jpg");
                               if(fs.exists()){
                               fs.delete();
                               }
                                Files.copy(in, Paths.get(Ejemplo.dirIMGtempgoogleSearch+"i1.jpg"));
                                f1 = new File(Ejemplo.dirIMGtempgoogleSearch+"i1.jpg");
                                Deb.consola("f1: "+f1.getAbsolutePath());
                            }
                            

                        }
                        if (i == 2) {
                            limg2.setText(null);
                            limg2.setIcon(icono);
                            try (InputStream in = new URL(listaurl.get(contadorImgs)).openStream()) {
                               File fs= new File(Ejemplo.dirIMGtempgoogleSearch+"i2.jpg");
                               if(fs.exists()){
                               fs.delete();
                               }
                                Files.copy(in, Paths.get(Ejemplo.dirIMGtempgoogleSearch+"i2.jpg"));
                                f2 = new File(Ejemplo.dirIMGtempgoogleSearch+"i2.jpg");
                                Deb.consola("f2: "+f2.getAbsolutePath());
                            }
                        }
                        if (i == 3) {
                            limg3.setText(null);
                            limg3.setIcon(icono);
                            try (InputStream in = new URL(listaurl.get(contadorImgs)).openStream()) {
                                File fs= new File(Ejemplo.dirIMGtempgoogleSearch+"i3.jpg");
                               if(fs.exists()){
                               fs.delete();
                               }
                                Files.copy(in, Paths.get(Ejemplo.dirIMGtempgoogleSearch+"i3.jpg"));
                                f3 = new File(Ejemplo.dirIMGtempgoogleSearch+"i3.jpg");
                                Deb.consola("f3: "+f3.getAbsolutePath());
                            }
                        }
                        if (i == 4) {
                            limg4.setText(null);
                            limg4.setIcon(icono);
                            try (InputStream in = new URL(listaurl.get(contadorImgs)).openStream()) {
                                File fs= new File(Ejemplo.dirIMGtempgoogleSearch+"i4.jpg");
                               if(fs.exists()){
                               fs.delete();
                               }
                                Files.copy(in, Paths.get(Ejemplo.dirIMGtempgoogleSearch+"i4.jpg"));
                                f4 = new File(Ejemplo.dirIMGtempgoogleSearch+"i4.jpg");
                                Deb.consola("f4: "+f4.getAbsolutePath());
                            }
                        }

//                        Crear_Productos.lbl_img.setText(null);
//                        Crear_Productos.lbl_img.setIcon(icono);
                    } else {
                        limg1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/producto.jpg")));

                    }
                    //   Crear_Productos.lbl_img.setIcon(image);

                } catch (IOException e) {
                }
                contadorImgs++;
                i++;
            }

        }
//        if(contadorImgs==numImagenes-1){
//            con
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
        img2 = new javax.swing.JPanel();
        limg2 = new javax.swing.JLabel();
        img3 = new javax.swing.JPanel();
        limg3 = new javax.swing.JLabel();
        img4 = new javax.swing.JPanel();
        limg4 = new javax.swing.JLabel();
        img1 = new javax.swing.JPanel();
        limg1 = new javax.swing.JLabel();
        jPanel7 = new javax.swing.JPanel();
        txtbuscar = new javax.swing.JTextField();
        buscar = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        next = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        jPanel2.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        img2.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        limg2.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                limg2MouseClicked(evt);
            }
        });

        javax.swing.GroupLayout img2Layout = new javax.swing.GroupLayout(img2);
        img2.setLayout(img2Layout);
        img2Layout.setHorizontalGroup(
            img2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(limg2, javax.swing.GroupLayout.DEFAULT_SIZE, 297, Short.MAX_VALUE)
        );
        img2Layout.setVerticalGroup(
            img2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(limg2, javax.swing.GroupLayout.DEFAULT_SIZE, 190, Short.MAX_VALUE)
        );

        img3.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        limg3.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                limg3MouseClicked(evt);
            }
        });

        javax.swing.GroupLayout img3Layout = new javax.swing.GroupLayout(img3);
        img3.setLayout(img3Layout);
        img3Layout.setHorizontalGroup(
            img3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(limg3, javax.swing.GroupLayout.DEFAULT_SIZE, 297, Short.MAX_VALUE)
        );
        img3Layout.setVerticalGroup(
            img3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(limg3, javax.swing.GroupLayout.DEFAULT_SIZE, 190, Short.MAX_VALUE)
        );

        img4.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        limg4.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                limg4MouseClicked(evt);
            }
        });

        javax.swing.GroupLayout img4Layout = new javax.swing.GroupLayout(img4);
        img4.setLayout(img4Layout);
        img4Layout.setHorizontalGroup(
            img4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(limg4, javax.swing.GroupLayout.DEFAULT_SIZE, 297, Short.MAX_VALUE)
        );
        img4Layout.setVerticalGroup(
            img4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(limg4, javax.swing.GroupLayout.DEFAULT_SIZE, 190, Short.MAX_VALUE)
        );

        img1.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        limg1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                limg1MouseClicked(evt);
            }
        });

        javax.swing.GroupLayout img1Layout = new javax.swing.GroupLayout(img1);
        img1.setLayout(img1Layout);
        img1Layout.setHorizontalGroup(
            img1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(limg1, javax.swing.GroupLayout.DEFAULT_SIZE, 297, Short.MAX_VALUE)
        );
        img1Layout.setVerticalGroup(
            img1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(limg1, javax.swing.GroupLayout.DEFAULT_SIZE, 190, Short.MAX_VALUE)
        );

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(img1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(img2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(img3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(img4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(img1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(img2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(img3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(img4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(0, 12, Short.MAX_VALUE))
        );

        jPanel7.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        txtbuscar.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txtbuscarKeyPressed(evt);
            }
        });

        buscar.setText("Buscar");
        buscar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                buscarActionPerformed(evt);
            }
        });

        jLabel1.setText("Buscar en Google");

        next.setText("Mas resultados");
        next.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                nextActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel7Layout = new javax.swing.GroupLayout(jPanel7);
        jPanel7.setLayout(jPanel7Layout);
        jPanel7Layout.setHorizontalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel7Layout.createSequentialGroup()
                        .addGap(20, 20, 20)
                        .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 136, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txtbuscar, javax.swing.GroupLayout.PREFERRED_SIZE, 586, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(jPanel7Layout.createSequentialGroup()
                        .addGap(162, 162, 162)
                        .addComponent(buscar, javax.swing.GroupLayout.PREFERRED_SIZE, 122, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(30, 30, 30)
                        .addComponent(next)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel7Layout.setVerticalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtbuscar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(buscar)
                    .addComponent(next))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addComponent(jPanel7, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel7, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(14, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void nextActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_nextActionPerformed
        // TODO add your handling code here:
        if ((contadorImgs + 4) < listaurl.size()) {
            setimgLabel(contadorImgs + 4);
        } else {

            JOptionPane.showMessageDialog(null, "Ya no existen mas resultados, genrear nueva busqueda con otro criterio", "AVISO FIN DE  RESULTADOS", JOptionPane.WARNING_MESSAGE);
        }

    }//GEN-LAST:event_nextActionPerformed

    private void buscarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_buscarActionPerformed
        // TODO add your handling code here:

    }//GEN-LAST:event_buscarActionPerformed

    private void limg1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_limg1MouseClicked
        // TODO add your handling code here:
        Crear_Productos.lbl_img.setIcon(limg1.getIcon());
        Crear_Productos.imageProducto = f1;
        Crear_Productos.imagenexitasamentecargadSiNo = true;
        if (evt.getClickCount() == 2) {
            this.dispose();
        }
    }//GEN-LAST:event_limg1MouseClicked

    private void limg2MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_limg2MouseClicked
        // TODO add your handling code here:
        Crear_Productos.lbl_img.setIcon(limg2.getIcon());
        Crear_Productos.imageProducto = f2;
        Crear_Productos.imagenexitasamentecargadSiNo = true;
        if (evt.getClickCount() == 2) {
            this.dispose();
        }
    }//GEN-LAST:event_limg2MouseClicked

    private void limg3MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_limg3MouseClicked
        // TODO add your handling code here:
        Crear_Productos.lbl_img.setIcon(limg3.getIcon());
        Crear_Productos.imageProducto = f3;
        Crear_Productos.imagenexitasamentecargadSiNo = true;
        if (evt.getClickCount() == 2) {
            this.dispose();
        }
    }//GEN-LAST:event_limg3MouseClicked

    private void limg4MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_limg4MouseClicked
        // TODO add your handling code here:
        Crear_Productos.lbl_img.setIcon(limg4.getIcon());
        Crear_Productos.imageProducto = f4;
        Crear_Productos.imagenexitasamentecargadSiNo = true;
        if (evt.getClickCount() == 2) {
            this.dispose();
        }
    }//GEN-LAST:event_limg4MouseClicked

    private void txtbuscarKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtbuscarKeyPressed
        // TODO add your handling code here:

        if (evt.getKeyCode() == KeyEvent.VK_ENTER) {
            if (!yabuscado.equalsIgnoreCase(txtbuscar.getText())) {
                listaurl = getUrlFromGoogle.getImagesFromGoogle(txtbuscar.getText());
                yabuscado = txtbuscar.getText();
                contadorImgs = 0;
                numImgs = 4;
                setimgLabel(numImgs);
            } else {
                JOptionPane.showMessageDialog(null, "Procesando Por favor sea paciente..");
            }

        }
    }//GEN-LAST:event_txtbuscarKeyPressed

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
            java.util.logging.Logger.getLogger(busquedaGoogle.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(busquedaGoogle.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(busquedaGoogle.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(busquedaGoogle.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the dialog */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                busquedaGoogle dialog = new busquedaGoogle(new javax.swing.JFrame(), true);
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
    private javax.swing.JButton buscar;
    private javax.swing.JPanel img1;
    private javax.swing.JPanel img2;
    private javax.swing.JPanel img3;
    private javax.swing.JPanel img4;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JLabel limg1;
    private javax.swing.JLabel limg2;
    private javax.swing.JLabel limg3;
    private javax.swing.JLabel limg4;
    private javax.swing.JButton next;
    private javax.swing.JTextField txtbuscar;
    // End of variables declaration//GEN-END:variables
}
