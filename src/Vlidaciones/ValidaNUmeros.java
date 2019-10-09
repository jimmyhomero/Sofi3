/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vlidaciones;

import static com.sun.javafx.tk.Toolkit.getToolkit;
import java.awt.event.KeyEvent;
import javax.swing.JOptionPane;

/**
 *
 * @author USUARIO
 */
public class ValidaNUmeros {

    public static boolean keyTyped(KeyEvent ke) {
        System.out.println("Vlidaciones.ValidaNUmeros.keyTyped():" + ke.getKeyChar());
         boolean a = false;
        char c = ke.getKeyChar();    
        if (Character.isDigit(c)) {
            //getToolkit(). 
            a = true;
        } else {
            ke.consume();
        }
        return a;
    }

    public static String buscarNumeroIntoString(String cadena) {
        String cad = "";
        String numeros = "";   
        
        try {
            char[] arreglo = cadena.toCharArray();
        int i = 0;
        for (char caracter : arreglo) {
            if (Character.isDigit(caracter)) {
              numeros=numeros.concat(  cadena.substring(i, i+1));
            }
          i++; 
        }
     
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
        
        return numeros;
    }

    public static boolean isOnlyNumbers(String cadena) {
        boolean isdigit = true;
        for (int i = 0; i < cadena.length(); i++) {
            if (Character.isDigit(cadena.charAt(i))) {

            } else {
                isdigit = false;
            }
        }
        return isdigit;
    }

    public static boolean isOnlyDouble(String str) {
        try {
            Double.parseDouble(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}
