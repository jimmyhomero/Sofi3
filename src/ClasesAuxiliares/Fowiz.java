/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares;

import ClasesAuxiliares.debug.Deb;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

/**
 *
 * @author USUARIO
 */
public class Fowiz {

    private String validaCadenaHTTP(String cadena) {

        int i, longitud, aux = 0;
        longitud = cadena.length();
        String x = " ";
        String cad = "";
        //    System.out.print("La cadena sin espacios en blanco quedaria asi: ");
        for (i = 0; i < longitud; i++) {
            if (x.charAt(0) != cadena.charAt(i)) {

            } else {
                cad = cadena.replace(" ", "%20");
            }            
        }

        return cad;
    }

    public void sms() {
        String myPasscode = "homerito";
        String myUsername = "jimmyhomero";
        String toPhoneNumber = "0997125959";
        String myMessage = " MENSAJE DE PRUEBAAA   http://cloud.fowiz.com/api/message_http_api.php ";

        try {
            myMessage = validaCadenaHTTP(myMessage);
            HttpClient client = new DefaultHttpClient();
            HttpGet request = new HttpGet("http://cloud.fowiz.com/api/message_http_api.php?username=" + myUsername
                    + "&phonenumber=" + toPhoneNumber + "&message=" + myMessage + "&passcode=" + myPasscode);
            HttpResponse response = null;
            Deb.consola("Cadena emviada: "+request);
            response = client.execute(request);

            BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));

            String line = "";
            StringBuilder response2 = new StringBuilder();
            while ((line = rd.readLine()) != null) {
                response2.append(line);
            }
            Deb.consola(response.toString());
        } catch (Exception e) {
            Deb.consola("ClasesAuxiliares.Fowiz.sms(): " + e.toString());
        }

    }
    
}
