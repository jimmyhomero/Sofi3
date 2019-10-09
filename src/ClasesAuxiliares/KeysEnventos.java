/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares;

import java.awt.event.KeyEvent;
import javax.swing.JTextArea;
import javax.swing.JTextField;

/**
 *
 * @author USUARIO
 */
public class KeysEnventos {
/**
AL precionar una tecla cambia mayusculas, permite seleccionar el texto
**/
    public static void uperCaseJTextField(JTextField jt, KeyEvent evt) {
        if (evt.getKeyCode() == KeyEvent.VK_HOME || evt.getKeyCode() == KeyEvent.VK_END || 
                evt.getKeyCode() == KeyEvent.VK_SHIFT ||evt.getKeyCode() == KeyEvent.VK_CONTROL
                ||evt.getKeyCode() == KeyEvent.VK_LEFT||evt.getKeyCode() == KeyEvent.VK_RIGHT
                ||evt.getKeyCode() == KeyEvent.VK_UP||evt.getKeyCode() == KeyEvent.VK_DOWN) {
        } else {
            jt.setText(jt.getText().toUpperCase());
        }

    }
    public static void uperCaseJTextaArea(JTextArea jt, KeyEvent evt) {
        if (evt.getKeyCode() == KeyEvent.VK_HOME || evt.getKeyCode() == KeyEvent.VK_END || 
                evt.getKeyCode() == KeyEvent.VK_SHIFT ||evt.getKeyCode() == KeyEvent.VK_CONTROL
                ||evt.getKeyCode() == KeyEvent.VK_LEFT||evt.getKeyCode() == KeyEvent.VK_RIGHT
                ||evt.getKeyCode() == KeyEvent.VK_UP||evt.getKeyCode() == KeyEvent.VK_DOWN) {
        } else {
            jt.setText(jt.getText().toUpperCase());
        }

    }
    
    

}
