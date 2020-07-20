/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vlidaciones;

import ClasesAuxiliares.debug.Deb;
import Vista.Dialogs.dialogPrgressBar;
import Vista.Principal;
import Vista.Usuarios.Buscar_usuarios;
import java.awt.Color;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.UIManager;

/**
 *
 * @author USUARIO
 */
public class ProgressBar {

    private Integer maxValor;
    private String mensaje;
    private String hora_actual;

    public Integer getMaxValor() {
        return maxValor;
    }

    public void setMaxValor(Integer maxValor) {
        this.maxValor = maxValor;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public ProgressBar(Integer maxValor, String Mensaje) {
        this.maxValor = maxValor;
        this.mensaje = Mensaje;
    }

    public ProgressBar(String Mensaje) {
        this.maxValor = 3000;
        this.mensaje = Mensaje;
    }

    public ProgressBar() {
        this.maxValor = 3000;
        this.mensaje = "";
    }

    public void setProgressBarDialog(Integer maximovalor, String mensaje) {
        Thread t = new Thread() {

            public void run() {
                dialogPrgressBar.jProgressBar1.setMaximum(maximovalor);

                dialogPrgressBar.jProgressBar1.setStringPainted(true);
                for (int i = 0; i < maximovalor; i++) {
                    //dialogPrgressBar.jProgressBar1.pa
                    dialogPrgressBar.jProgressBar1.setValue(i + 1);
                    dialogPrgressBar.jProgressBar1.setString(mensaje);
                    try {
                        Thread.sleep(2);
                    } catch (InterruptedException ex) {
                        Logger.getLogger(Buscar_usuarios.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                dialogPrgressBar.jProgressBar1.setValue(0);
                dialogPrgressBar.jProgressBar1.setString("");
                System.exit(0);
            }
        ;

        };
t.start();
    }

    public void setProgressBar(Integer maximovalor, String mensaje) {
        Thread t = new Thread() {

            public void run() {
                Principal.jProgressBar2.setMaximum(maximovalor);

                Principal.jProgressBar2.setStringPainted(true);
                for (int i = 0; i < maximovalor; i++) {
                    Principal.jProgressBar2.setValue(i + 1);
                    Principal.jProgressBar2.setString(mensaje);
                    try {
                        Thread.sleep(2);
                    } catch (InterruptedException ex) {
                        Logger.getLogger(Buscar_usuarios.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                Principal.jProgressBar2.setValue(0);
                Principal.jProgressBar2.setString("");
            }
        ;

        };
t.start();
    }

    public void setProgressBar_mensajae(String mensaje) {
        Thread t = new Thread() {
            public void run() {
                Principal.jProgressBar2.setValue(maxValor);
                Principal.jProgressBar2.setStringPainted(true);
                for (int i = 0; i < maxValor; i++) {

                    Principal.jProgressBar2.setString(mensaje);
                    try {
                        Thread.sleep(2);
                    } catch (InterruptedException ex) {
                        Logger.getLogger(Buscar_usuarios.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                Principal.jProgressBar2.setValue(0);
                Principal.jProgressBar2.setString("");
            }
        ;

        };
t.start();
    }

    public void setProgressBar_mensajaeRojo(String mensaje) {
        Thread t = new Thread() {

            public void run() {
                Principal.jProgressBar2.setBackground(Color.red);
                Principal.jProgressBar2.setValue(maxValor);
                Principal.jProgressBar2.setStringPainted(true);
                for (int i = 0; i < maxValor; i++) {

                    Principal.jProgressBar2.setString(mensaje);
                    try {
                        Thread.sleep(2);
                    } catch (InterruptedException ex) {
                        Logger.getLogger(Buscar_usuarios.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                Principal.jProgressBar2.setValue(0);
                Principal.jProgressBar2.setString("");
            }
        ;

        };
t.start();
    }

    public void setProgressBar_mensajaeVerde(String mensaje) {
        Thread t = new Thread() {

            public void run() {
                Principal.jProgressBar2.setBackground(Color.GREEN);
                Principal.jProgressBar2.setValue(maxValor);
                Principal.jProgressBar2.setStringPainted(true);
                for (int i = 0; i < maxValor; i++) {

                    Principal.jProgressBar2.setString(mensaje);
                    try {
                        Thread.sleep(2);
                    } catch (InterruptedException ex) {
                        Logger.getLogger(Buscar_usuarios.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                Principal.jProgressBar2.setValue(0);
                Principal.jProgressBar2.setString("");
            }
        ;

        };
t.start();
    }

    public void setProgressBar_mensajaeAzul(String mensaje) {
        Principal.jProgressBar2.setStringPainted(true);
        Principal.jProgressBar2.setBorderPainted(true);
        Principal.jProgressBar2.setForeground(Color.blue);
        Principal.jProgressBar2.setBackground(Color.red);
        Principal.jProgressBar2.setString("10%");
        UIManager.put("jProgressBar2.background", Color.BLUE);
        UIManager.put("jProgressBar2.foreground", Color.BLUE);
        UIManager.put("jProgressBar2.selectionBackground", Color.BLUE);
        UIManager.put("jProgressBar2.selectionForeground", Color.BLUE);

        Thread t = new Thread() {

            public void run() {
                Principal.jProgressBar2.setBackground(Color.BLUE);
                Principal.jProgressBar2.setValue(maxValor);
                Principal.jProgressBar2.setStringPainted(true);
                for (int i = 0; i < maxValor; i++) {

                    Principal.jProgressBar2.setString(mensaje);
                    try {
                        Thread.sleep(2);
                    } catch (InterruptedException ex) {
                        Logger.getLogger(Buscar_usuarios.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                Principal.jProgressBar2.setValue(0);
                Principal.jProgressBar2.setString("");
            }
        ;

        };
t.start();
    }

    public static void mostrarMensajeNaranja(String mensaje) {
        ProgressBar a = new ProgressBar();
        Deb.consola(mensaje);
        a.setProgressBar_mensajae(mensaje);
    }

    public static void mostrarMensajeRojo(String mensaje) {
        ProgressBar a = new ProgressBar();
        Deb.consola(mensaje);
        a.setProgressBar_mensajaeRojo(mensaje);
    }

    public static void mostrarMensajeVerde(String mensaje) {
        ProgressBar a = new ProgressBar();
        Deb.consola(mensaje);
        a.setProgressBar_mensajaeVerde(mensaje);
    }

    public static void mostrarMensajeAzul(String mensaje) {
        ProgressBar a = new ProgressBar();
        Deb.consola(mensaje);
        a.setProgressBar_mensajaeAzul(mensaje);

    }

    public void setProgressBar_mensajaex(String mensaje) {
        Thread t = new Thread() {

            public void run() {
//                Principal.jProgressBar2.setMaximum(maxValor);
                Principal.jProgressBar2.setValue(maxValor);
                Principal.jProgressBar2.setStringPainted(true);
                for (int i = 0; i < maxValor; i++) {

                    Principal.jProgressBar2.setString(mensaje);
                    try {
                        Thread.sleep(2);
                    } catch (InterruptedException ex) {
                        Logger.getLogger(Buscar_usuarios.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                Principal.jProgressBar2.setValue(0);
                Principal.jProgressBar2.setString("");
            }
        ;

        };
t.start();
    }

}
