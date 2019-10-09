/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista.alertas;

import java.awt.Color;
import java.awt.Frame;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JProgressBar;
import javax.swing.JTextField;
import org.eclipse.persistence.internal.libraries.antlr.runtime.tree.Tree;

/**
 *
 * @author USUARIO
 */
public class alerta {

    public static Frame framec;

    public static void menajes(String mensaje) {
        framec = JOptionPane.getFrameForComponent(null);
        AlertaError pcdialogc = new AlertaError(framec, true);
        pcdialogc.texto.setTabSize(8);
        pcdialogc.texto.setText(mensaje);
        pcdialogc.setVisible(true);
    }

    public static void  progressbar(JProgressBar p,String msg){
    
        try {
            p.setMaximum(100);
            p.setStringPainted(true);            
            p.setString(msg);
            p.repaint();
            Thread.sleep(3000);
            p.setMaximum(0);
            p.setString("");
            p.repaint();
        } catch (InterruptedException ex) {
            Logger.getLogger(alerta.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public  static void esperarXsegundos(int segundos) {
        try {
            Thread.sleep(segundos * 1000);
        } catch (InterruptedException ex) {
            Thread.currentThread().interrupt();
        }
    }

    public static void mensjesInferior(JLabel text, Integer tipo, int segundos) {
        ///////////exito

        if (tipo == 1) {
            text.setBackground(Color.GREEN);
            esperarXsegundos(segundos);
            text.setBackground(null);
            text.setText("");
        } else if (tipo == 2) {
            ///////error
            text.setBackground(Color.RED);
            esperarXsegundos(segundos);
            text.setBackground(null);
            text.setText("");

        }
    }
}
