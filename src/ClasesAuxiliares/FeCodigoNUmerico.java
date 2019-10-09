/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares;

import jdk.nashorn.internal.runtime.regexp.joni.Regex;

/**
 *
 * @author USUARIO
 */
public class FeCodigoNUmerico {

    public static Object[] invertir(Object[] array) {
        Object[] invertir_int = new Object[array.length];
        int maximo = array.length;

        for (int i = 0; i < array.length; i++) {
            Object j = array[maximo - 1];
            invertir_int[maximo - 1] = array[i];
            maximo--;
        }
        return invertir_int;
    }
    
     public static  String invertirCadenaOK(String cadena) {
        String cadenaInvertida = "";
        for (int x = cadena.length() - 1; x >= 0; x--) {
            cadenaInvertida = cadenaInvertida + cadena.charAt(x);
        }
        return cadenaInvertida;
    }
      public static int obtenerSumaPorDigitosOK(String cadena) {
        int pivote = 2;
        int longitudCadena = cadena.length();
        int cantidadTotal = 0;
        int b = 1;
        for (int i = 0; i < longitudCadena; i++) {
            if (pivote == 8) {
                pivote = 2;
            }
            int temporal = Integer.parseInt("" + cadena.substring(i, b));
            b++;
            temporal *= pivote;
            pivote++;
            cantidadTotal += temporal;
        }
        cantidadTotal = 11 - cantidadTotal % 11;
        if(cantidadTotal==11){
          cantidadTotal=0;   
        }
        if(cantidadTotal==10){
          cantidadTotal=1;   
        }
        return cantidadTotal;
    }
 

    public static int getNumeroVerificadorMOd11(Object[] array) {

        int a = 2;
        int rutSumado = 0;
        for (int i = 0; i < array.length; i++) {
            array[i] = Integer.parseInt((String) array[i]) * a;
            rutSumado += Integer.parseInt(String.valueOf(array[i]));
            if (a == 7) {
                a = 1;
            }
            a++;
            
        }
        int mod= rutSumado%11;
        int numeroverificador=11-mod;
        if(numeroverificador==11){
        numeroverificador=0;
        }
        if(numeroverificador==10){
        numeroverificador=1;
        }
        return numeroverificador;
    }
//    
// private static String CreateDigit11(String verifierString)
//{
//int baseMax = 7;
//int multiplicador = 2;
//int total = 0;
//int verificador = 0;
//int numAux = 0;
//
//String[] substrings = Regex.Split(verifierString, "");
//
//for (int i = substrings.length - 1; i >= 1; i--)
//if (substrings[i] != "")
//{
//if (multiplicador > baseMax)
//multiplicador = 2;
//
//numAux = Integer .parseInt(substrings[i]);
//total = total + (numAux * multiplicador);
//multiplicador = multiplicador + 1;
//}
//
//verificador = 11 - (total % 11);
//
//if (verificador == 10)
//verificador = 1;
//else
//if (verificador == 11)
//verificador = 0;
//
//return String.valueOf(verificador);
//}

}
