/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ClasesAuxiliares;

import Vista.Principal;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author USUARIO
 */
public class Progressbarok extends Thread {

    Integer maximo = 0;
    Integer valorIncremento = 0;
    String textinicio = "";
    String textFin = "";

    public Progressbarok() {

    }

    public void llenado(Integer val, String textinicio, String textfin) {        
        Principal.jProgressBar2.setValue(val);
        Principal.jProgressBar2.setString(textinicio);
    }

    public void inciar(Integer max) {
        Principal.jProgressBar2.setStringPainted(true);
        Principal.jProgressBar2.setIndeterminate(false);
        maximo = max;
        Principal.jProgressBar2.setMinimum(0);
        Principal.jProgressBar2.setMaximum(max);
    }

    @Override
    public void run() {
        
        
        try {
            System.out.println("Descargando...");
            while (valorIncremento <= maximo-1) {
                System.out.println("max: "+maximo+ " -- "+valorIncremento);                               
//                Principal.jProgressBar2.setValue(valorIncremento);
//                Principal.jProgressBar2.setString(textinicio);
                if (valorIncremento == maximo-1) {
                    valorIncremento = maximo+100;
                    try {
                        Principal.jProgressBar2.setString(textFin);
                        sleep(2000);
                        Principal.jProgressBar2.setValue(0);
                        Principal.jProgressBar2.setString("");
                    } catch (InterruptedException ex) {
                        Principal.jProgressBar2.setString(textFin);
                        sleep(2000);
                        Principal.jProgressBar2.setValue(0);
                        Principal.jProgressBar2.setString(ex.toString());
                    }

                }
            }

        } catch (Exception ioException) {
            ioException.printStackTrace();
        } finally {

        }
    }
}
