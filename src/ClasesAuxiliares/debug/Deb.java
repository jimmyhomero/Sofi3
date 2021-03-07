package ClasesAuxiliares.debug;

import Vista.Principal;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author USUARIO
 */
public class Deb {

    public static void consola(Object cad) {

        if (Principal.modoDesarrollo == 1) {
            System.out.println("Sofi:--> " + cad.toString());
        }

    }

    public static void consola(String cad) {
        if (Principal.modoDesarrollo == 1) {
            System.out.println("Sofi:--> " + cad);
        }
    }

    public static void consola() {
        if (Principal.modoDesarrollo == 1) {
            System.out.println("Vacio :(");
        }
    }

}
