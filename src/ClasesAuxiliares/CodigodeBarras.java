/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares;

import Controlador.Usuarios.HoraFecha;
import Controlador.Usuarios.ProductosDao;
import Controlador.Usuarios.SeriesFacturasDao;
import Modelo.Productos;
import Modelo.SeriesFacturas;
import com.toedter.calendar.JDateChooser;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import jbarcodebean.JBarcodeBean;
import login.login;
import net.sourceforge.jbarcodebean.model.Interleaved25;

/**
 *
 * @author USUARIO
 */
public class CodigodeBarras {

    public static String CrearCodigoBarras(String cadena) throws IOException {

        JBarcodeBean barcode = new JBarcodeBean();
//        
//        Random aleatorio = new Random(System.currentTimeMillis());
//// Producir nuevo int aleatorio entre 0 y 99
//        int intAletorio = aleatorio.nextInt(100680066);
//
//        DecimalFormat formateador = new DecimalFormat("000000000");
//        String format = formateador.format(intAletorio);
//        Calendar c = new GregorianCalendar();
//        Integer dia = c.get(Calendar.DATE);
//        Integer mes = c.get(Calendar.MONTH);
//        Integer annio = c.get(Calendar.YEAR);
//        String ss = dia.toString() + mes.toString() + format;
//        // nuestro tipo de codigo de barra
        barcode.setCodeType(new Interleaved25());
        //barcode.setCodeType(new Code39());

        // nuestro valor a codificar y algunas configuraciones mas
        barcode.setCode(cadena);
        barcode.setCheckDigit(true);
        String codigo = barcode.toString();
//
//        BufferedImage bufferedImage = barcode.draw(new BufferedImage(400, 400, BufferedImage.TYPE_INT_RGB));
//
//        // guardar en disco como png
//        File file = new File("codebar.png");
//
//        ImageIO.write(bufferedImage, "png", file);
//
        return codigo;
    }
    public static String CrearCodigoBarrasAutomaticamente() throws IOException {

        JBarcodeBean barcode = new JBarcodeBean();
        Random aleatorio = new Random(System.currentTimeMillis());
// Producir nuevo int aleatorio entre 0 y 99
        int intAletorio = aleatorio.nextInt(100680066);

        DecimalFormat formateador = new DecimalFormat("000000000");
        String format = formateador.format(intAletorio);
        Calendar c = new GregorianCalendar();
        Integer dia = c.get(Calendar.DATE);
        Integer mes = c.get(Calendar.MONTH);
        Integer annio = c.get(Calendar.YEAR);
        String ss = dia.toString() + mes.toString() + format;
        // nuestro tipo de codigo de barra
        barcode.setCodeType(new Interleaved25());
        //barcode.setCodeType(new Code39());

        // nuestro valor a codificar y algunas configuraciones mas
        barcode.setCode(ss);
        barcode.setCheckDigit(true);
        String codigo = barcode.toString();
//
//        BufferedImage bufferedImage = barcode.draw(new BufferedImage(400, 400, BufferedImage.TYPE_INT_RGB));
//
//        // guardar en disco como png
//        File file = new File("codebar.png");
//
//        ImageIO.write(bufferedImage, "png", file);
//
        return codigo;
    }

    public static BufferedImage CrearCodigoBarrasImagen(String codigo) throws IOException {

        JBarcodeBean barcode = new JBarcodeBean();

        // nuestro tipo de codigo de barra
        barcode.setCodeType(new Interleaved25());
        //barcode.setCodeType(new Code39());

        // nuestro valor a codificar y algunas configuraciones mas
        barcode.setCode(codigo);
        barcode.setCheckDigit(true);
         barcode.toString();
//
        BufferedImage bufferedImage = barcode.draw(new BufferedImage(150, 70, BufferedImage.TYPE_INT_RGB));
//
//        // guardar en disco como png
//        File file = new File("codebar.png");
//
//        ImageIO.write(bufferedImage, "png", file);
//
return bufferedImage;
    }

}
