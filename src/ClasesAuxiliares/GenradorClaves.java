/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares;

/**
 *
 * @author USUARIO
 */
public class GenradorClaves {

    public static String NUMEROS1 = "1722239967001";
    public static String NUMEROS2 = "JIMMYHOMERO";
    public static String NUMEROS3 = "SOFIA";
    public static String NUMEROS4 = "CARRION";
    public static String NUMEROS5 = "FACILITO";

    public static String NUMEROS = "0123456789";

    public static String MAYUSCULAS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    public static String MINUSCULAS = "abcdefghijklmnopqrstuvwxyz";

    public static String ESPECIALES = "ñÑ";

    //
    public static String getCodigo() {

        String pi = String.valueOf(Math.PI);
        pi=pi.substring(0, 3);
        String e = String.valueOf(Math.E);
        e=e.substring(0, 3);
        String c = pi + e;
        String pswd = "";
        for (int i = 0; i < c.length(); i++) {
            pswd += (c.charAt((int) (c.length())));
        }
        return pswd.toUpperCase();

    }

    public static String getPinNumber() {
        return getPassword(NUMEROS, 4);
    }

    public static String getPassword() {
        return getPassword(8);
    }

    public static String getPassword(int length) {
        return getPassword(NUMEROS + MAYUSCULAS + MINUSCULAS, length);
    }

    public static String getPassword(String key, int length) {
        String pswd = "";

        for (int i = 0; i < length; i++) {
            pswd += (key.charAt((int) (Math.random() * key.length())));
        }
        return pswd.toUpperCase();
    }
}
