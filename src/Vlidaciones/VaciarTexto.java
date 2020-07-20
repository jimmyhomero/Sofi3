/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vlidaciones;

import ClasesAuxiliares.debug.Deb;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextArea;
import javax.swing.JTextField;

/**
 *
 * @author USUARIO
 */
public class VaciarTexto {
    
     public static void limpiar_texto(JPanel panel){
        for(int i = 0; panel.getComponents().length > i; i++){
            if(panel.getComponents()[i] instanceof JTextField){
                ((JTextField)panel.getComponents()[i]).setText("");
                Deb.consola("Limpia: JTextField" );
//                                System.out.println("Vlidaciones.VaciarTexto.limpiar_texto() aaaaaaaaaaaaaa");

            }
             if(panel.getComponents()[i] instanceof JPasswordField){
                ((JPasswordField)panel.getComponents()[i]).setText("");
                Deb.consola("Limpia: JPasswordField" );
  //                              System.out.println("Vlidaciones.VaciarTexto.limpiar_texto() bbbbbbbbbbbbbb");

            }
            if(panel.getComponents()[i] instanceof JTextArea){
                ((JTextArea)panel.getComponents()[i]).setText("");
                Deb.consola("Limpia: JTextArea" );
        }
    }
     }   
}
