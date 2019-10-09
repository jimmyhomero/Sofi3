/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package impresoras;

/**
 *
 * @author USUARIO
 */
import java.io.FileInputStream;
import java.io.FileNotFoundException;
 
import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintException;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;
import javax.print.attribute.standard.Copies;
import javax.print.attribute.standard.MediaSizeName;
 
public class PrintGif {
 
	public static void main(String args[]) {
 
		// tu archivo a imprimir
		String file = "d:\\descarga.png";
 
		// definimos el tipo a imprimir
		DocFlavor docFlavor = DocFlavor.INPUT_STREAM.GIF;
 
		// establecemos algunos atributos de la impresora
		PrintRequestAttributeSet aset = new HashPrintRequestAttributeSet();
		aset.add(MediaSizeName.ISO_A4);
		aset.add(new Copies(1));
 
		// mi impresora por default
		PrintService service = PrintServiceLookup.lookupDefaultPrintService();
 
		Doc docPrint;
		try {
			docPrint = new SimpleDoc(new FileInputStream(file), docFlavor, null);
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
			return;
		}
 
		// inicio el proceso de impresion...
		DocPrintJob printJob = service.createPrintJob();
		try {
			printJob.print(docPrint, aset);
		} catch (PrintException e) {
			e.printStackTrace();
			return;
		}
	}
}