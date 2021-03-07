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

    public static Integer jpb_maxvalue = 0;
    public static Integer jpb_incremental = 0;
    private Integer maxValor;
    private String jpb_mensaje;
    private String hora_actual;

    public Integer getMaxValor() {
        return maxValor;
    }

    public void setMaxValor(Integer maxValor) {
        this.maxValor = maxValor;
    }

    public String getMensaje() {
        return jpb_mensaje;
    }

    public void setMensaje(String mensaje) {
        this.jpb_mensaje = mensaje;
    }

    public ProgressBar(Integer maxValor, String Mensaje) {
        this.maxValor = maxValor;
        this.jpb_mensaje = Mensaje;
    }

    public ProgressBar(String Mensaje) {
        this.maxValor = 3000;
        this.jpb_mensaje = Mensaje;
    }

    public ProgressBar() {
        this.maxValor = 3000;
        this.jpb_mensaje = "";
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
        //Principal.jProgressBar2.setForeground(Color.RED);
        Principal.jProgressBar2.setBackground(Color.BLUE);
        //Principal.jProgressBar2.setBackground(Color.red);
        Principal.jProgressBar2.setString("10%");
//        UIManager.put("jProgressBar2.background", Color.BLUE);
//        UIManager.put("jProgressBar2.foreground", Color.BLUE);
//        UIManager.put("jProgressBar2.selectionBackground", Color.BLUE);
//        UIManager.put("jProgressBar2.selectionForeground", Color.BLUE);

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

//                    UIManager.put("jProgressBar2.background", Color.LIGHT_GRAY);
//        UIManager.put("jProgressBar2.foreground", Color.LIGHT_GRAY);
//        UIManager.put("jProgressBar2.selectionBackground", Color.LIGHT_GRAY);
//        UIManager.put("jProgressBar2.selectionForeground", Color.LIGHT_GRAY);
            }
        ;

        };
t.start();

        Principal.jProgressBar2.setForeground(Color.LIGHT_GRAY);
    }

    public static void fillx() {

        Principal.jProgressBar2.setValue(0);
        Principal.jProgressBar2.setMinimum(0);
        Principal.jProgressBar2.setMaximum(jpb_maxvalue);
        Principal.jProgressBar2.setBorderPainted(true);
        Principal.jProgressBar2.setStringPainted(true);

        int i = 0;

        try {

            while (jpb_incremental <= jpb_maxvalue) {
                // set text accoring to the level to which the bar is filled 
                if (jpb_incremental > jpb_maxvalue && jpb_incremental < jpb_maxvalue) {
                    Principal.jProgressBar2.setString("espera un poco mas..");
                    Deb.consola("1111111111111");
                } else if (jpb_incremental > jpb_maxvalue) {
                    Principal.jProgressBar2.setString("Estamos finalizando..");
                    Deb.consola("222222222222222");
                } else {
                    Principal.jProgressBar2.setString("Iniciando..");
                    Deb.consola("44444444444444");
                }

                // fill the menu bar 
                i += 5;
                Principal.jProgressBar2.setValue(jpb_incremental);

                // delay the thread 
                //  Thread.sleep(1000);
            }
            Principal.jProgressBar2.setString("Al fin!, hemos finalizado..");
            Thread.sleep(500);
            Principal.jProgressBar2.setValue(0);
            Principal.jProgressBar2.setString("");

        } catch (Exception e) {
        }
    }

    public static void fillx(Integer max) {

        Principal.jProgressBar2.setValue(0);
        Principal.jProgressBar2.setMinimum(0);
        Principal.jProgressBar2.setMaximum(max);
        Principal.jProgressBar2.setBorderPainted(true);
        Principal.jProgressBar2.setStringPainted(true);
        jpb_incremental = 0;

        try {

            while (jpb_incremental <= max) {
                Deb.consola("1111111111111" + jpb_incremental);
                Principal.jProgressBar2.setString("Procesando...");
                //jpb_incremental += 5;
                Principal.jProgressBar2.setValue(jpb_incremental);
            }
            Principal.jProgressBar2.setString("Al fin!, hemos finalizado..");
              Thread.sleep(500);
            Principal.jProgressBar2.setValue(0);
            Principal.jProgressBar2.setString("");

        } catch (Exception e) {
        }
    }

    public static void fill(Integer maxValor) {
        Thread t = new Thread() {
            public void run() {
                fillx(maxValor);
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
