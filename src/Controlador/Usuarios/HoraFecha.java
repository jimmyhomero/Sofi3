/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Vista.Usuarios.Modal_CrearFacturas;
import Vlidaciones.ProgressBar;
import com.toedter.calendar.JDateChooser;
import static java.lang.Thread.sleep;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author USUARIO
 */
public class HoraFecha extends Coneccion {

    public   Timestamp getFechaNowTImestampServer() {
        ResultSet rs;
        java.sql.Timestamp t = null;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select current_timestamp as fecha");
            rs = st.executeQuery();

            //this.lista= new ArrayList();
            while (rs.next()) {
                t = (rs.getTimestamp("fecha"));
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConCedula()" + ex);
        } finally {
            this.cerrar();

        }

        return t;
    }
    public  Timestamp getFechaNowDateServer() {
        ResultSet rs;
        java.sql.Timestamp t = null;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("SELECT CURRENT_DATE AS fecha");
            rs = st.executeQuery();

            //this.lista= new ArrayList();
            while (rs.next()) {
                t = (rs.getTimestamp("fecha"));
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConCedula()" + ex);
        } finally {
            this.cerrar();

        }

        return t;
    }

    public static  void getHoraActualmyMachine() {
        Calendar calendario = Calendar.getInstance();

        Thread t;
        t = new Thread() {
            int hora, minutos, segundos;

//Calendar calendario = new GregorianCalendar();
            public void run() {
                try {

                    //  System.out.println(".run()hora");
                    hora = calendario.get(Calendar.HOUR_OF_DAY);
                    minutos = calendario.get(Calendar.MINUTE);
                    segundos = calendario.get(Calendar.SECOND);
                    //Modal_CrearFacturas.txt_hora.setText(hora + ":" + minutos + ":" + segundos);
                    sleep(3000);
                    getHoraActualmyMachine();
                } catch (InterruptedException ex) {
                    Logger.getLogger(ProgressBar.class.getName()).log(Level.SEVERE, null, ex);
                }

            }

        };
        t.start();
//        t.setDaemon(true);

    }

    
    public static String fecha_aa_mm_dd_HH_mm_ss(String fecha) {
        //   String s = "Mon Oct 02 00:00:00 COT 2017";
        System.out.println("Controlador.Usuarios.HoraFecha.fecha()feha que entra: " + fecha);
        String s = fecha;
        String ano = s.substring(24, 28);
        String mes = s.substring(4, 7);
        String dia = s.substring(8, 10);;
        String hora = s.substring(11, 13);
        String minuto = s.substring(14, 16);
        String segundo = s.substring(17, 19);

        String Fechasql = ano + "-" + mes + "-" + dia + " " + hora + ":" + minuto + ":" + segundo;
        switch (mes) {
            case "Jan":
                mes = "01";
                break;
            case "Feb":
                mes = "02";
                break;
            case "Mar":
                mes = "03";
                break;
            case "Apr":
                mes = "04";
                break;
            case "May":
                mes = "05";
                break;
            case "Jun":
                mes = "06";
                break;
            case "Jul":
                mes = "07";
                break;
            case "Aug":
                mes = "08";
                break;
            case "Sep":
                mes = "09";
                break;
            case "Oct":
                mes = "10";
                break;
            case "Nov":
                mes = "11";
                break;
            case "Dec":
                mes = "12";
                break;
        }
        Fechasql = ano + "-" + mes + "-" + dia + " " + hora + ":" + minuto + ":" + segundo;
        System.out.println("Controlador.Usuarios.HoraFecha.fecha(): " + Fechasql);
        return Fechasql;
    }
    public static String fecha_aa_mm_dd_conSlash(String fecha) {
        //   String s = "Mon Oct 02 00:00:00 COT 2017";
        System.out.println("Controlador.Usuarios.HoraFecha.fecha()feha que entra: " + fecha);
        String s = fecha;
        String ano = s.substring(24, 28);
        String mes = s.substring(4, 7);
        String dia = s.substring(8, 10);;
        String hora = s.substring(11, 13);
        String minuto = s.substring(14, 16);
        String segundo = s.substring(17, 19);

        String Fechasql = ano + "-" + mes + "-" + dia + " " + hora + ":" + minuto + ":" + segundo;
        switch (mes) {
            case "Jan":
                mes = "01";
                break;
            case "Feb":
                mes = "02";
                break;
            case "Mar":
                mes = "03";
                break;
            case "Apr":
                mes = "04";
                break;
            case "May":
                mes = "05";
                break;
            case "Jun":
                mes = "06";
                break;
            case "Jul":
                mes = "07";
                break;
            case "Aug":
                mes = "08";
                break;
            case "Sep":
                mes = "09";
                break;
            case "Oct":
                mes = "10";
                break;
            case "Nov":
                mes = "11";
                break;
            case "Dec":
                mes = "12";
                break;
        }
        Fechasql = ano + "/" + mes + "/" + dia ;
        System.out.println("Controlador.Usuarios.HoraFecha.fecha(): " + Fechasql);
        return Fechasql;
    }
    public static String fecha_ddmmaaa_conslash_facElectronica(String fecha) {
        //   String s = "Mon Oct 02 00:00:00 COT 2017";
        System.out.println("Controlador.Usuarios.HoraFecha.fecha()feha que entra: " + fecha);
        String s = fecha;
        String ano = s.substring(24, 28);
        String mes = s.substring(4, 7);
        String dia = s.substring(8, 10);;
        String hora = s.substring(11, 13);
        String minuto = s.substring(14, 16);
        String segundo = s.substring(17, 19);

        String Fechasql = ano + "-" + mes + "-" + dia + " " + hora + ":" + minuto + ":" + segundo;
        switch (mes) {
            case "Jan":
                mes = "01";
                break;
            case "Feb":
                mes = "02";
                break;
            case "Mar":
                mes = "03";
                break;
            case "Apr":
                mes = "04";
                break;
            case "May":
                mes = "05";
                break;
            case "Jun":
                mes = "06";
                break;
            case "Jul":
                mes = "07";
                break;
            case "Aug":
                mes = "08";
                break;
            case "Sep":
                mes = "09";
                break;
            case "Oct":
                mes = "10";
                break;
            case "Nov":
                mes = "11";
                break;
            case "Dec":
                mes = "12";
                break;
        }
        Fechasql = dia +"/" + mes +"/"+ ano;
        System.out.println("Controlador.Usuarios.HoraFecha.fecha(): " + Fechasql);
        return Fechasql;
    }
    
    public static String fecha_ddmmaaa(String fecha) {
        //   String s = "Mon Oct 02 00:00:00 COT 2017";
        System.out.println("Controlador.Usuarios.HoraFecha.fecha()feha que entra: " + fecha);
        String s = fecha;
        String ano = s.substring(24, 28);
        String mes = s.substring(4, 7);
        String dia = s.substring(8, 10);;
        String hora = s.substring(11, 13);
        String minuto = s.substring(14, 16);
        String segundo = s.substring(17, 19);

        String Fechasql = ano + "-" + mes + "-" + dia + " " + hora + ":" + minuto + ":" + segundo;
        switch (mes) {
            case "Jan":
                mes = "01";
                break;
            case "Feb":
                mes = "02";
                break;
            case "Mar":
                mes = "03";
                break;
            case "Apr":
                mes = "04";
                break;
            case "May":
                mes = "05";
                break;
            case "Jun":
                mes = "06";
                break;
            case "Jul":
                mes = "07";
                break;
            case "Aug":
                mes = "08";
                break;
            case "Sep":
                mes = "09";
                break;
            case "Oct":
                mes = "10";
                break;
            case "Nov":
                mes = "11";
                break;
            case "Dec":
                mes = "12";
                break;
        }
        Fechasql = dia  + mes + ano;
        System.out.println("Controlador.Usuarios.HoraFecha.fecha(): " + Fechasql);
        return Fechasql;
    }
  

    public static String fecha_ddmmaaa_conSlash(String fecha_aa_mm_dd) {
        
        //   String s = "2018-12-01";
        System.out.println("Controlador.Usuarios.HoraFecha.fecha()feha que entra: " + fecha_aa_mm_dd);
        String s = fecha_aa_mm_dd;
        String ano = s.substring(0, 4);
        String mes = s.substring(5, 7);
        String dia = s.substring(8, 10);
        String Fechasql = dia  + "/"+mes +"/"+ ano ;
        
        
       
        System.out.println("Controlador.Usuarios.HoraFecha.fecha(): " + Fechasql);
        return Fechasql;
    }
        public static String fecha_ddmmaaa_conSlash_to_aa_mm_dd(String fecha_dd_mm_aaaa) {
        
        //   String s = "2018-12-01";
        System.out.println("Controlador.Usuarios.HoraFecha.fecha()feha que entra: " + fecha_dd_mm_aaaa);
        String s = fecha_dd_mm_aaaa;
        String ano = s.substring(0, 2);
        String mes = s.substring(3, 5);
        String dia = s.substring(6, 10);
        String Fechasql = ano  + "-"+mes +"-"+ dia ;
        
        
       
        System.out.println("Controlador.Usuarios.HoraFecha.fecha(): " + Fechasql);
        return Fechasql;
    }
    
public static String fecha_mmaaConSlash(String fecha) {
           String s = "Mon Oct 02 00:00:00 COT 2017";
        //    "2018-02-28"
           
        System.out.println("Controlador.Usuarios.HoraFecha.fecha()feha que entra: " + fecha);
        s = fecha;
        String ano = s.substring(0, 4);
        String mes = s.substring(5, 7);

        String Fechasql = mes + "/" + ano ;
        
        System.out.println("Controlador.Usuarios.HoraFecha.fecha(): " + Fechasql);
        return Fechasql;
    }
public static String fecha_aaMMdd_to_ddMMaa(String fecha) {
           String s = "Mon Oct 02 00:00:00 COT 2017";
        //    "2018/02/28"
           
        System.out.println("Controlador.Usuarios.HoraFecha.fecha()feha que entra: " + fecha);
        s = fecha;
        String ano = s.substring(0, 4);
        String mes = s.substring(5, 7);
        String dia = s.substring(8, 10);

        String Fechasql = dia+ "/" + mes +"/"+ano ;
        
        System.out.println("Controlador.Usuarios.HoraFecha.fecha(): " + Fechasql);
        return Fechasql;
    }

    public Timestamp obtenerFechaHorasMinutosSegundo() {
        Date fecha = null;
        java.sql.Timestamp sqlTimestamp2 = null;
        java.sql.Time sqlTime = null;
        ResultSet rs;
        try {

            PreparedStatement st;
            st = this.conectar().prepareCall("select now()");
            rs = st.executeQuery();
            while (rs.next()) {
                fecha = rs.getDate("now()");
                sqlTimestamp2 = rs.getTimestamp("now()");
                sqlTime = rs.getTime("now()");
                System.out.println("Controlador.Usuarios.HoraFecha.obtenerFechaHorasMinutosSegundo()feha: " + fecha);
                System.out.println("Controlador.Usuarios.HoraFecha.obtenerFechaHorasMinutosSegundo()feha: " + sqlTime);
                System.out.println("Controlador.Usuarios.HoraFecha.obtenerFechaHorasMinutosSegundo()feha: " + sqlTimestamp2);

            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "aakkkk");
        } finally {
            this.cerrar();
        }

        return sqlTimestamp2;
    }

    public Timestamp fechaActual_Now() {

        java.sql.Timestamp currentTimestamp;
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0); // zeroize seconds 
        // cal.set(Calendar.MILLISECOND, 0);
        java.util.Date now = cal.getTime();
        currentTimestamp = new java.sql.Timestamp(now.getTime());

        return currentTimestamp;
    }

    public static Timestamp fechaActual_00_00_00() {
        java.sql.Timestamp currentTimestamp;
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0); // zeroize seconds 
        // cal.set(Calendar.MILLISECOND, 0);
        java.util.Date now = cal.getTime();
        currentTimestamp = new java.sql.Timestamp(now.getTime());

        return currentTimestamp;
    }

    public static  Timestamp fechaActual_23_59_59() {
        java.sql.Timestamp currentTimestamp;

        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY, 23);
        cal.set(Calendar.MINUTE, 59);
        cal.set(Calendar.SECOND, 59); // zeroize seconds 
        //   cal.set(Calendar.MILLISECOND, 0);
        java.util.Date now = cal.getTime();
        currentTimestamp = new java.sql.Timestamp(now.getTime());
        return currentTimestamp;
    }

    public  Date obtenerFecha() {
        Date fecha = null;
        ResultSet rs;

        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select now()");
            rs = st.executeQuery();

            while (rs.next()) {
                fecha = rs.getDate("now()");
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "objkkkk");
        } finally {
            this.cerrar();
        }

        return fecha;
    }
}
