
import ClasesAuxiliares.http.ConsultaCedulas;
import java.awt.Dimension;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author USUARIO
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    private static void fecha(String sss) {
        String s = "Mon Oct 02 00:00:00 COT 2017";

        String ano = s.substring(24, 28);
        String mes = s.substring(4, 7);
        String dia = s.substring(0, 3);;
        String hora = s.substring(11, 13);
        String minuto = s.substring(14, 16);
        String segundo = s.substring(17, 19);
        System.out.println("NewMain.fecha()fechA; " + ano + "-" + mes + "-" + dia + " " + hora + ":" + minuto + ":" + segundo);
        String typeOfDay;
        switch (dia) {
            case "Mon":
                dia = "01";
                break;
            case "Tue":
                dia = "02";
                break;
            case "Wed":
                dia = "03";
                break;
            case "Thu":
                dia = "04";
                break;
            case "Fri":
                dia = "05";
                break;
            case "Sat":
                dia = "06";
                break;
            case "Sun":
                dia = "07";
                break;
         
        }
        switch (mes) {
            case "Jua":
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
System.out.println("NewMain.fecha()fechA; " + ano + "-" + mes + "-" + dia + " " + hora + ":" + minuto + ":" + segundo);
    }

  
    public static void main(String[] args) {
        try {
            JFrame frame = new JFrame();
        JPanel panel = new JPanel();
        for (int i = 0; i < 10; i++) {
            panel.add(new JButton("Hello-" + i));
        }
        JScrollPane scrollPane = new JScrollPane(panel);
        scrollPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
        scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED);
        scrollPane.setBounds(50, 30, 300, 50);
        JPanel contentPane = new JPanel(null);
        contentPane.setPreferredSize(new Dimension(500, 400));
        contentPane.add(scrollPane);
        frame.setContentPane(contentPane);
        frame.pack();
        frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        frame.setVisible(true);  
            
            // TODO code application logic here
            //fecha("w");
//            ConsultaCedulas.getInfoRegistroCivil("1722239967");
        } catch (Exception ex) {
            Logger.getLogger(NewMain.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
