/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares.http;

import Vlidaciones.ProgressBar;
import ecx.unomas.elements.CertificadosSSL;
import ecx.unomas.service.Config;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import org.json.JSONObject;
import ClasesAuxiliares.debug.Deb;
import ClasesAuxiliares.debug.Deb;

public class ConsultaCedulas {

    static {
        System.setProperty("javax.net.ssl.trustStore", Config.CACERT);
        System.setProperty("javax.net.ssl.trustStorePassword", "changeit");
        System.setProperty("javax.net.ssl.keyStore", Config.CACERT);
        System.setProperty("javax.net.ssl.keyStorePassword", "changeit");
    }

    private final String USER_AGENT = "Mozilla/5.0";

    public static void main(String[] args) {
        try {
            CertificadosSSL.instalarCertificados();
            // httpreq1.call_me();
            //  sendPost();
            //getinfoSRI("1722239967001");
            //getinfoSRI("2390021227001");
            // getInfoSheylaGetokok("1722239967");
           getInfoSheylaGetokok("2351331364");///cedula sofia
           getInfoSheylaGetokok("2390021227001");
           // getInfoSheylaGetokok("1718730193");
            
            //getAntecedentesPenalesEcuatorianos("1722239967", "SI");
            //getInfoRegistroCivil("ee");
            //okokoko sendPostOK2();
            //  call_me2();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static JSONObject getInfoRegistroCivil(String cedula) throws Exception {

        String url = "http://www.mdi.gob.ec/gestorcertificados/antecedentes/data.php";

        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("User-Agent", "Mozilla/5.0");
        con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
        String urlParameters = "tipo=getDataWsRc&ci=" + cedula + "&tp=C&ise=SI";
        Deb.consola("URL: { " + url + " }   parametros post { " + urlParameters + " }");
        // Send post request
        con.setDoOutput(true);
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        wr.writeBytes(urlParameters);
        wr.flush();
        wr.close();

        int responseCode = con.getResponseCode();

        BufferedReader in = new BufferedReader(
                new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();
        String a = response.toString();
        a = a.substring(1, a.length());
        a = a.substring(0, a.length() - 1);
        Deb.consola(response.toString());
        JSONObject myResponse = new JSONObject(a);
        Deb.consola("Nacionalodad: " + myResponse.getString("nationality"));
        Deb.consola("Direccion: " + myResponse.getString("streets"));
        Deb.consola("Cedula: " + myResponse.getString("identity"));
        Deb.consola("Nacimiento: " + myResponse.getString("dob"));
        Deb.consola("Nombre: " + myResponse.getString("name"));
        Deb.consola("Genero: " + myResponse.getString("genre"));
        Deb.consola("huella digital: " + myResponse.getString("fingerprint"));
        Deb.consola("estado civil: " + myResponse.getString("civilstate"));
        Deb.consola("provinvia " + myResponse.getString("residence"));

        return myResponse;
    }

    public static HashMap<String, String> getInfoSheylaGetokok(String cedula) throws Exception {
        HttpURLConnection con = null;
        String url = "http://sheyla2.dyndns.info/SRI/SRI.php?ruc=".concat(cedula);
        HashMap<String, String> hm = new HashMap<String, String>();
        try {

            URL myurl = new URL(url);
            con = (HttpURLConnection) myurl.openConnection();

            con.setRequestMethod("GET");

            StringBuilder content;

            try (BufferedReader in = new BufferedReader(
                    new InputStreamReader(con.getInputStream()))) {

                String line;
                content = new StringBuilder();

                while ((line = in.readLine()) != null) {
                    content.append(line);
                    content.append(System.lineSeparator());
                }
            }

            String cad = content.toString();
            cad = cad.trim();
            Deb.consola("cc: " + cad);
            cad = cad.replace("******", ",");
            Deb.consola("org:" + cad);
            cad = cad.replace("***", ",");
            Deb.consola("cc:" + cad);

            String[] parts = cad.split(",");
            String actividades="";
            for (int i = 0; i < parts.length; i++) {
                
                if(i==1){
                        hm.put("nombre", parts[i]);
                }
                if(i==3 && parts[i].equalsIgnoreCase("cedula") ){
                        hm.put("fecha", parts[7]);
                }else{
                if(i>=7 && i<=parts.length-2){
                    actividades=actividades.concat(parts[i]);
                       
                }
                hm.put("actividad", actividades);
                }
                
                if(i==4){
                        hm.put("provincia", parts[i]);
                }
                if(i==5){
                        hm.put("ciudad", parts[i]);
                }
                if(i==6){
                        hm.put("parroquia", parts[i]);
                }
                if(i==parts.length-1){
                        hm.put("direccion", parts[6]+", "+parts[i]);
                }
                
//                switch (i) {
//                    case 0:
//                        hm.put("cedula", parts[0]);
//                        break;
//                    case 1:
//                        hm.put("nombre", parts[1]);
//                        break;
//                    case 2:
//                        hm.put("nombreComercial", parts[2]);
//                        break;
//                    case 3:
//                        hm.put("cedulaRuc", parts[3]);
//                        break;
//                    case 4:
//                        hm.put("provincia", parts[4]);
//                        break;
//                    case 5:
//                        hm.put("ciudad", parts[5]);
//                        break;
//                    case 6:
//                        hm.put("canton", parts[6]);
//                        break;
//                    case 7:
//                        hm.put("actividadFecha", parts[7]);
//                        break;
//                    case 8:
//                        hm.put("direccion1", parts[8]);
//                        break;
//                    case 9:
//                        hm.put("direccion2", parts[9]);
//                        break;
//
//                    default:
//                        break;
//                }
                Deb.consola(i + " - " + parts[i] + "\n");
            }
            Deb.consola("ccccc: "+hm.toString());
        } finally {

            con.disconnect();
        }
        return hm;
    }

//    public static void getInfoSheyla(String cedula) throws Exception {
//
//        String url = "http://sheyla2.dyndns.info/SRI/SRI.php?ruc=";
//        HashMap<Integer, String> hm = new HashMap<Integer, String>();
//        String resp = "";
//        URL obj = new URL(url);
//        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
//        con.setRequestMethod("GET");
//        con.setRequestProperty("User-Agent", "Mozilla/5.0");
//        con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
//        String urlParameters = url + cedula;
//        Deb.consola("URL: " + urlParameters);
//        // Send post request
//        con.setDoOutput(true);
//        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
//        wr.writeBytes(urlParameters);
//        wr.flush();
//        wr.close();
//
//        // int responseCode = con.getResponseCode();
//        BufferedReader in = new BufferedReader(
//                new InputStreamReader(con.getInputStream()));
//        String inputLine;
//        StringBuffer response = new StringBuffer();
//
//        while ((inputLine = in.readLine()) != null) {
//            response.append(inputLine);
//        }
//        in.close();
//        String a = response.toString();
//        Deb.consola("XXX: " + a);
//        a = a.substring(1, a.length()); 
//        a = a.substring(0, a.length() - 1);
//        Deb.consola(response.toString());
//       JSONObject myResponse = new JSONObject(a);
//        Deb.consola("Nacionalodad: " + myResponse.getString("nationality"));
//        Deb.consola("Direccion: " + myResponse.getString("streets"));
//        Deb.consola("Cedula: " + myResponse.getString("identity"));
//        Deb.consola("Nacimiento: " + myResponse.getString("dob"));
//        Deb.consola("Nombre: " + myResponse.getString("name"));
//        Deb.consola("Genero: " + myResponse.getString("genre"));
//        Deb.consola("huella digital: " + myResponse.getString("fingerprint"));
//        Deb.consola("estado civil: " + myResponse.getString("civilstate"));
//        Deb.consola("provinvia " + myResponse.getString("residence"));
//
////        return resp;
//    }

    public static JSONObject getAntecedentesPenalesEcuatorianos(String cedula, String esEcuatoriano) throws Exception {

        String url = "http://www.mdi.gob.ec/gestorcertificados/antecedentes/data.php";
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("User-Agent", "Mozilla/5.0");
        con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
        String urlParameters = "";
        if (esEcuatoriano.equals("SI")) {
            urlParameters = "ci=" + cedula + "&tp=C&ise=SI";
        } else if (esEcuatoriano.equals("NO")) {
            urlParameters = "tipo=getDataWs&ci=" + cedula + "&tp=P&ise=NO";
        }

        con.setDoOutput(true);
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        wr.writeBytes(urlParameters);
        wr.flush();
        wr.close();

        int responseCode = con.getResponseCode();
        Deb.consola("ClasesAuxiliares.http.ConsultaCedulas.getAntecedentesPenalesEcuatorianos(): " + responseCode);

        BufferedReader in = new BufferedReader(
                new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();
        String a = response.toString();
        Deb.consola("" + a);
//        a = a.substring(1, a.length());        
//        a = a.substring(0, a.length() - 1);        
        Deb.consola(response.toString());
        JSONObject myResponse = new JSONObject(a);
        Deb.consola("Cedula: " + myResponse.getString("identity"));
        Deb.consola("Antecedentes: " + myResponse.getString("antecedent"));
        Deb.consola("Cedula: " + myResponse.getString("identity"));
        Deb.consola("Nacimiento: " + myResponse.getString("dob"));
        Deb.consola("Nombre: " + myResponse.getString("name"));
        Deb.consola("Genero: " + myResponse.getString("genre"));
        Deb.consola("huella digital: " + myResponse.getString("fingerprint"));
        Deb.consola("estado civil: " + myResponse.getString("civilstate"));
        Deb.consola("provinvia " + myResponse.getString("residence"));

        return myResponse;
    }

    public static JSONObject getinfoSRI(String cedula) throws Exception {

        //String url = "https://api.1mas.ec/sri/"+cedula;
        String url = "http://compueconomia.com.ec/ruc1.php?ruc=" + cedula;
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
//HttpsURLConnection con =  (HttpsURLConnection) obj.openConnection();
        //add reuqest header
        con.setRequestMethod("GET");
        con.setRequestProperty("User-Agent", "Mozilla/5.0");
        con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
        con.setDoOutput(true);
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        wr.flush();
        wr.close();

        int responseCode = con.getResponseCode();
        BufferedReader in = new BufferedReader(
                new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();
        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();
        String a = response.toString();
        a = a.substring(1, a.length());
        a = a.substring(0, a.length() - 7);
        JSONObject myResponse = new JSONObject(a);

        Deb.consola(myResponse);
        Deb.consola("razonSocial: " + myResponse.getString("razonSocial"));

        if (!myResponse.isNull("nombreComercial")) {
            Deb.consola("Nombre Comercial: " + myResponse.getString("nombreComercial"));
        }

        if (!myResponse.isNull("estadoPersonaNatural")) {
            Deb.consola("EstadoPersonaNatural: " + myResponse.getString("estadoPersonaNatural"));
        }
        Deb.consola("Obligado: " + myResponse.getString("obligado"));
        Deb.consola("Actividad del Contribuyente: " + myResponse.getString("actividadContribuyente"));
        // Deb.consola("Inicio de Actividades: " + myResponse.getString("fechaInicioActividades"));

        if (!myResponse.isNull("agenteRepresentante")) {
            Deb.consola("Representante Nombre: " + myResponse.getString("agenteRepresentante"));
        }
        if (!myResponse.isNull("representanteLegal")) {
            Deb.consola("Representante CI: " + myResponse.getString("representanteLegal"));
        }
        Deb.consola("Sociedad: " + myResponse.getString("personaSociedad"));
        return myResponse;
    }

    public static JSONObject getinfoSRIDireccion(String cedula) throws Exception {

        //String url = "https://api.1mas.ec/sri/"+cedula;
        String url = "http://45.77.161.33/ruc2.php?ruc=" + cedula;
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
//HttpsURLConnection con =  (HttpsURLConnection) obj.openConnection();
        //add reuqest header
        con.setRequestMethod("GET");
        con.setRequestProperty("User-Agent", "Mozilla/5.0");
        con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
        con.setDoOutput(true);
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        wr.flush();
        wr.close();

        int responseCode = con.getResponseCode();
        BufferedReader in = new BufferedReader(
                new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();
        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();
        String a = response.toString();
        Deb.consola(a);
        a = a.substring(1, a.length());
        a = a.substring(0, a.length() - 7);
        JSONObject myResponse = new JSONObject(a);

        if (!myResponse.isNull("nombreFantasiaComercial")) {
            Deb.consola("Nombre Comercial: " + myResponse.getString("nombreFantasiaComercial"));
        }

        if (!myResponse.isNull("direccionCompleta")) {
            Deb.consola("direccionCompleta: " + myResponse.getString("direccionCompleta"));
        }
        return myResponse;
    }

}
