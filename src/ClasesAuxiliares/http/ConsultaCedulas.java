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
        System.out.println("URL: { " + url + " }   parametros post { " + urlParameters + " }");
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
        System.out.println(response.toString());
        JSONObject myResponse = new JSONObject(a);
        System.out.println("Nacionalodad: " + myResponse.getString("nationality"));
        System.out.println("Direccion: " + myResponse.getString("streets"));
        System.out.println("Cedula: " + myResponse.getString("identity"));
        System.out.println("Nacimiento: " + myResponse.getString("dob"));
        System.out.println("Nombre: " + myResponse.getString("name"));
        System.out.println("Genero: " + myResponse.getString("genre"));
        System.out.println("huella digital: " + myResponse.getString("fingerprint"));
        System.out.println("estado civil: " + myResponse.getString("civilstate"));
        System.out.println("provinvia " + myResponse.getString("residence"));

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
            System.out.println("cc: " + cad);
            cad = cad.replace("******", ",");
            System.out.println("org:" + cad);
            cad = cad.replace("***", ",");
            System.out.println("cc:" + cad);

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
                System.out.println(i + " - " + parts[i] + "\n");
            }
            System.out.println("ccccc: "+hm.toString());
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
//        System.out.println("URL: " + urlParameters);
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
//        System.out.println("XXX: " + a);
//        a = a.substring(1, a.length()); 
//        a = a.substring(0, a.length() - 1);
//        System.out.println(response.toString());
//       JSONObject myResponse = new JSONObject(a);
//        System.out.println("Nacionalodad: " + myResponse.getString("nationality"));
//        System.out.println("Direccion: " + myResponse.getString("streets"));
//        System.out.println("Cedula: " + myResponse.getString("identity"));
//        System.out.println("Nacimiento: " + myResponse.getString("dob"));
//        System.out.println("Nombre: " + myResponse.getString("name"));
//        System.out.println("Genero: " + myResponse.getString("genre"));
//        System.out.println("huella digital: " + myResponse.getString("fingerprint"));
//        System.out.println("estado civil: " + myResponse.getString("civilstate"));
//        System.out.println("provinvia " + myResponse.getString("residence"));
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
        System.out.println("ClasesAuxiliares.http.ConsultaCedulas.getAntecedentesPenalesEcuatorianos(): " + responseCode);

        BufferedReader in = new BufferedReader(
                new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();
        String a = response.toString();
        System.out.println("" + a);
//        a = a.substring(1, a.length());        
//        a = a.substring(0, a.length() - 1);        
        System.out.println(response.toString());
        JSONObject myResponse = new JSONObject(a);
        System.out.println("Cedula: " + myResponse.getString("identity"));
        System.out.println("Antecedentes: " + myResponse.getString("antecedent"));
        System.out.println("Cedula: " + myResponse.getString("identity"));
        System.out.println("Nacimiento: " + myResponse.getString("dob"));
        System.out.println("Nombre: " + myResponse.getString("name"));
        System.out.println("Genero: " + myResponse.getString("genre"));
        System.out.println("huella digital: " + myResponse.getString("fingerprint"));
        System.out.println("estado civil: " + myResponse.getString("civilstate"));
        System.out.println("provinvia " + myResponse.getString("residence"));

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

        System.out.println(myResponse);
        System.out.println("razonSocial: " + myResponse.getString("razonSocial"));

        if (!myResponse.isNull("nombreComercial")) {
            System.out.println("Nombre Comercial: " + myResponse.getString("nombreComercial"));
        }

        if (!myResponse.isNull("estadoPersonaNatural")) {
            System.out.println("EstadoPersonaNatural: " + myResponse.getString("estadoPersonaNatural"));
        }
        System.out.println("Obligado: " + myResponse.getString("obligado"));
        System.out.println("Actividad del Contribuyente: " + myResponse.getString("actividadContribuyente"));
        // System.out.println("Inicio de Actividades: " + myResponse.getString("fechaInicioActividades"));

        if (!myResponse.isNull("agenteRepresentante")) {
            System.out.println("Representante Nombre: " + myResponse.getString("agenteRepresentante"));
        }
        if (!myResponse.isNull("representanteLegal")) {
            System.out.println("Representante CI: " + myResponse.getString("representanteLegal"));
        }
        System.out.println("Sociedad: " + myResponse.getString("personaSociedad"));
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
        System.out.println(a);
        a = a.substring(1, a.length());
        a = a.substring(0, a.length() - 7);
        JSONObject myResponse = new JSONObject(a);

        if (!myResponse.isNull("nombreFantasiaComercial")) {
            System.out.println("Nombre Comercial: " + myResponse.getString("nombreFantasiaComercial"));
        }

        if (!myResponse.isNull("direccionCompleta")) {
            System.out.println("direccionCompleta: " + myResponse.getString("direccionCompleta"));
        }
        return myResponse;
    }

}
