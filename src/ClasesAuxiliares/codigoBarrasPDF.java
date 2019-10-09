/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares;

import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.Barcode128;
import com.itextpdf.text.pdf.Barcode39;
import com.itextpdf.text.pdf.BarcodePDF417;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfTemplate;
import com.itextpdf.text.pdf.PdfWriter;
import java.awt.Desktop;
import static java.awt.SystemColor.desktop;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author USUARIO
 */
public class codigoBarrasPDF {

    public static void newcodigoBarrasPDF() {

        try {
            Document doc = new Document();
            PdfWriter pdf;
            pdf = PdfWriter.getInstance(doc, new FileOutputStream("file.pdf"));
            doc.open();
            Barcode39 code = new Barcode39();
            code.setCode("1234567890 HELADOS");

            Image img = code.createImageWithBarcode(pdf.getDirectContent(), BaseColor.BLACK, BaseColor.BLACK);
            doc.add(img);
            ////
            PdfPTable table = new PdfPTable(2);
            table.addCell("Change baseline:");
            doc.add(new Paragraph(" "));
            Barcode128 code128 = new Barcode128();
            code128.setCode("1234567890 MAS QUE CASAS");
            code128.setX((float) 0.25);
            Image img128 = code128.createImageWithBarcode(pdf.getDirectContent(), BaseColor.BLACK, BaseColor.BLACK);
            //  img128.scalePercent(200);
            PdfPCell cell = new PdfPCell(img128);
            table.addCell(cell);
            doc.add(table);

            ///
            Barcode39 codex = new Barcode39();
            codex.setCode("1234567890 MAS QUE NADA");

            Image imgxy = code.createImageWithBarcode(pdf.getDirectContent(), BaseColor.BLACK, BaseColor.BLACK);

            doc.add(img);
            doc.add(new Paragraph(String.format("This barcode measures %s by %s user units", img.getScaledWidth(), img.getScaledHeight())));

            doc.close();
            Desktop desktop = Desktop.getDesktop();
            File file = new File("file.pdf");
            try {
                desktop.open(file);
            } catch (IOException ex) {
                Logger.getLogger(codigoBarrasPDF.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (DocumentException ex) {
            Logger.getLogger(codigoBarrasPDF.class.getName()).log(Level.SEVERE, null, ex);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(codigoBarrasPDF.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
