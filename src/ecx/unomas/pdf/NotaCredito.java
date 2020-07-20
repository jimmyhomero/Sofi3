package ecx.unomas.pdf;

import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.Vector;
import javax.servlet.ServletOutputStream;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.Barcode128;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import ecx.unomas.service.Config;

public class NotaCredito {
	
	public void generatePDF(ecx.unomas.notacredito.NotaCredito notaCredito, ServletOutputStream servletOutputStream) throws DocumentException, MalformedURLException, IOException{
		
		Document document = new Document(PageSize.A4, 20, 20, 30, 30);
        
		PdfWriter writer = null;
		if (servletOutputStream!=null)
			writer = PdfWriter.getInstance(document, servletOutputStream);
		else
			writer = PdfWriter.getInstance(document, new FileOutputStream(Config.AUTORIZADOS_DIR+notaCredito.getClaveAcceso()+".pdf"));    
		document.open();
		
		// ALL RADIOUS
		PdfRoundCorners all_radius = new PdfRoundCorners(new BaseColor(0xEE, 0xEE, 0xEE), true, true, true, true);
		PdfRoundCorners all_radius_gray1 = new PdfRoundCorners(new BaseColor(0xDD, 0xDD, 0xDD), true, true, false, true);
		PdfRoundCorners all_radius_gray2 = new PdfRoundCorners(new BaseColor(0xDD, 0xDD, 0xDD), false, false, true, true);
		
		// HEADER
		PdfPTable header = new PdfPTable(2);
		header.setWidthPercentage(100);
		header.setSpacingAfter(5f);
		float[] columnWs = {0.49f, 0.49f};
		header.setWidths(columnWs);
		
		// LOGO
		String logo_img = Config.LOGO;
		Image logo = Image.getInstance(logo_img);
		logo.setAlignment(Image.LEFT);
		logo.scalePercent(60);
		PdfPCell logo_cell = new PdfPCell(logo);
		logo_cell.setBorder(Rectangle.NO_BORDER);
		logo_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		header.addCell(logo_cell);
		
		// FACTURA HEAD
		PdfPTable head = new PdfPTable(1);
		
		PdfPTable head_content = new PdfPTable(1);
		
		PdfPCell ruc = new PdfPCell(new Phrase("RUC: "+notaCredito.getRUC()));
		ruc.setBorder(Rectangle.NO_BORDER);
		ruc.setPaddingTop(5f);
		head_content.addCell(ruc);
		
		PdfPCell factura_text = new PdfPCell(new Phrase("NOTA DE CREDITO", PdfStyle.TABLE_H1_FONT));
		factura_text.setBorder(Rectangle.NO_BORDER);
		factura_text.setPaddingTop(5f);
		head_content.addCell(factura_text);
		
		PdfPCell factura_nro = new PdfPCell(new Phrase("Nro. "+notaCredito.getEstab()+"-"+notaCredito.getPtoEmi()+"-"+notaCredito.getSecuencia(), PdfStyle.TABLE_H3_FONT));
		factura_nro.setBorder(Rectangle.NO_BORDER);
		factura_nro.setPaddingTop(5f);
		head_content.addCell(factura_nro);
		
		PdfPCell nroAut_text = new PdfPCell(new Phrase("NOMERO DE AUTORIZACION", PdfStyle.TABLE_P_FONT));
		nroAut_text.setBorder(Rectangle.NO_BORDER);
		nroAut_text.setPaddingTop(5f);
		head_content.addCell(nroAut_text);
		
		PdfPCell nroAut_val = new PdfPCell(new Phrase(notaCredito.getAuthNumber(), PdfStyle.TABLE_P_FONT));
		nroAut_val.setBorder(Rectangle.NO_BORDER);
		nroAut_val.setPaddingTop(5f);
		head_content.addCell(nroAut_val);
		
		PdfPCell fechaAut_text = new PdfPCell(new Phrase("FECHA Y HORA DE AUTORIZACION", PdfStyle.TABLE_P_FONT));
		fechaAut_text.setBorder(Rectangle.NO_BORDER);
		fechaAut_text.setPaddingTop(5f);
		head_content.addCell(fechaAut_text);
		
		PdfPCell fechaAut_val = new PdfPCell(new Phrase(notaCredito.getAuthDate(), PdfStyle.TABLE_P_FONT));
		fechaAut_val.setBorder(Rectangle.NO_BORDER);
		fechaAut_val.setPaddingTop(5f);
		head_content.addCell(fechaAut_val);
		
		PdfPCell ambiente = new PdfPCell(new Phrase("AMBIENTE: "+notaCredito.getAmbienteName(), PdfStyle.TABLE_P_FONT));
		ambiente.setBorder(Rectangle.NO_BORDER);
		ambiente.setPaddingTop(5f);
		head_content.addCell(ambiente);
		
		PdfPCell emision = new PdfPCell(new Phrase("EMISION: "+notaCredito.getTipoEmisionName(), PdfStyle.TABLE_P_FONT));
		emision.setBorder(Rectangle.NO_BORDER);
		emision.setPaddingTop(5f);
		head_content.addCell(emision);
		
		PdfPCell clave = new PdfPCell(new Phrase("CLAVE DE ACCESO", PdfStyle.TABLE_P_FONT));
		clave.setBorder(Rectangle.NO_BORDER);
		clave.setPaddingTop(5f);
		head_content.addCell(clave);
		
		// BARCODE
		Barcode128 code128 = new Barcode128();
        code128.setGenerateChecksum(true);
        code128.setCode(notaCredito.getClaveAcceso());
        PdfPCell barCode = new PdfPCell(code128.createImageWithBarcode(writer.getDirectContent(), null, null));
		barCode.setBorder(Rectangle.NO_BORDER);
		head_content.addCell(barCode);
		
		// FACTURA HEAD BORDER / BACKGROUND
		PdfPCell head_cell = new PdfPCell(head_content);
		head_cell.setCellEvent(all_radius);
		head_cell.setBorder(Rectangle.NO_BORDER);
		head_cell.setPadding(10f);
		head.addCell(head_cell);
		
		// FACTURA HEAD WRAPPER
		PdfPCell factura_head = new PdfPCell(head);
		factura_head.setBorder(Rectangle.NO_BORDER);
		factura_head.setRowspan(2);
		header.addCell(factura_head);
		
		// FACTURA INFO
		PdfPTable info = new PdfPTable(2);
		info.setWidths(new float[]{9.8f, 0.2f});
		
		PdfPTable info_content = new PdfPTable(1);
		info_content.setSpacingAfter(10f);
		
		PdfPCell empresa = new PdfPCell(new Phrase(notaCredito.getRazonSocial(), PdfStyle.TABLE_H2_FONT));
		empresa.setBorder(Rectangle.NO_BORDER);
		info_content.addCell(empresa);
		
		PdfPCell dirMatriz = new PdfPCell(new Phrase("Dir. Matriz: "+notaCredito.getDirMatriz(), PdfStyle.P_FONT));
		dirMatriz.setBorder(Rectangle.NO_BORDER);
		info_content.addCell(dirMatriz);
		
		PdfPCell dirSucursal = new PdfPCell(new Phrase("Dir. Sucursal: "+notaCredito.getDirEstablecimiento(), PdfStyle.P_FONT));
		dirSucursal.setBorder(Rectangle.NO_BORDER);
		info_content.addCell(dirSucursal);
		
		if (!notaCredito.getContribuyenteEspecial().isEmpty()){
			PdfPCell contribuyente = new PdfPCell(new Phrase("Contribuyente Especial Nro. "+notaCredito.getContribuyenteEspecial(), PdfStyle.P_FONT));
			contribuyente.setBorder(Rectangle.NO_BORDER);
			info_content.addCell(contribuyente);
		}
		
		PdfPCell obligadoConta = new PdfPCell(new Phrase("OBLIGADO A LLEVAR CONTABILIDAD: "+notaCredito.getObligadoContabilidad(), PdfStyle.P_FONT));
		obligadoConta.setBorder(Rectangle.NO_BORDER);
		info_content.addCell(obligadoConta);
		
		// FACTURA INFO BORDER / BRACKGROUND
		PdfPCell info_cell = new PdfPCell(info_content);
		info_cell.setCellEvent(all_radius);
		info_cell.setBorder(Rectangle.NO_BORDER);
		info_cell.setPadding(10f);
		info.addCell(info_cell);
		
		// WHITE SPACE
		PdfPCell white_space = new PdfPCell(new Phrase(""));
		white_space.setBorder(Rectangle.NO_BORDER);
		info.addCell(white_space);
		
		// ADDRESS AND INFO WRAPPER
		PdfPCell factura_info = new PdfPCell(info);
		factura_info.setBorder(Rectangle.NO_BORDER);
		header.addCell(factura_info);
		
		document.add(header);
		
		PdfPTable emisionInfoWrapper = new PdfPTable(1);
		emisionInfoWrapper.setWidthPercentage(100);
		emisionInfoWrapper.setSpacingAfter(5f);
		
		// CLIENTE Y EMISION
		PdfPTable emisionInfo_t = new PdfPTable(2);
		emisionInfo_t.setWidthPercentage(100);
		emisionInfo_t.setWidths(new float[]{0.7f, 0.3f});
        
		// RAZON SOCIAL
        PdfPCell razonSocial = new PdfPCell(new Phrase("Razon Social / Nombres y Apellidos: "+notaCredito.getRazonSocialComprador(), PdfStyle.P_FONT));
        razonSocial.setBorder(Rectangle.NO_BORDER);
        emisionInfo_t.addCell(razonSocial);
        
        // IDENTIFICACION
        PdfPCell identificacion = new PdfPCell(new Phrase("IdentificaciOn: "+notaCredito.getIdentificacionComprador(), PdfStyle.P_FONT));
        identificacion.setBorder(Rectangle.NO_BORDER);
        emisionInfo_t.addCell(identificacion);
        
        // FECHA EMISION
        PdfPCell fechaEmision = new PdfPCell(new Phrase("Fecha EmisiOn: "+notaCredito.getFechaEmision(), PdfStyle.P_FONT));
        fechaEmision.setBorder(Rectangle.NO_BORDER);
        emisionInfo_t.addCell(fechaEmision);
        
        // GUOA REMISION
        PdfPCell guiaRemi = new PdfPCell(new Phrase(" ", PdfStyle.P_FONT));
        guiaRemi.setBorder(Rectangle.NO_BORDER);
        emisionInfo_t.addCell(guiaRemi);
        
        
        // EMISION INFO BORDER / BRACKGROUND
		PdfPCell emision_cell = new PdfPCell(emisionInfo_t);
		emision_cell.setCellEvent(all_radius);
		emision_cell.setBorder(Rectangle.NO_BORDER);
		emision_cell.setPadding(5f);
		
		emisionInfoWrapper.addCell(emision_cell);
		
        document.add(emisionInfoWrapper);
        
        PdfPTable refInfoWrapper = new PdfPTable(1);
        refInfoWrapper.setWidthPercentage(100);
        refInfoWrapper.setSpacingAfter(5f);
		
		// CLIENTE Y EMISION
		PdfPTable refInfo_t = new PdfPTable(2);
		refInfo_t.setWidthPercentage(100);
		refInfo_t.setWidths(new float[]{0.4f, 0.6f});
        
		// COMPROBANTE QUE SE MODIFICA
        PdfPCell codDocModificado_t = new PdfPCell(new Phrase("Comprobante que se modifica: ", PdfStyle.P_FONT));
        codDocModificado_t.setBorder(Rectangle.NO_BORDER);
        refInfo_t.addCell(codDocModificado_t);
        
        PdfPCell codDocModificado = new PdfPCell(new Phrase(notaCredito.getCodDocModificadoName()+"                "+notaCredito.getNumDocModificado(), PdfStyle.P_FONT));
        codDocModificado.setBorder(Rectangle.NO_BORDER);
        refInfo_t.addCell(codDocModificado);
        
        // FECHA EMISION MODIFICADO
        PdfPCell fechaEmisionDocSustento_t = new PdfPCell(new Phrase("Fecha EmisiOn (Comprobante a modificar): ", PdfStyle.P_FONT));
        fechaEmisionDocSustento_t.setBorder(Rectangle.NO_BORDER);
        refInfo_t.addCell(fechaEmisionDocSustento_t);
        
        PdfPCell fechaEmisionDocSustento = new PdfPCell(new Phrase(notaCredito.getFechaEmisionDocSustento(), PdfStyle.P_FONT));
        fechaEmisionDocSustento.setBorder(Rectangle.NO_BORDER);
        refInfo_t.addCell(fechaEmisionDocSustento);
        
        // MOTIVO
        PdfPCell motivo_t = new PdfPCell(new Phrase("RazOn de ModificaciOn: ", PdfStyle.P_FONT));
        motivo_t.setBorder(Rectangle.NO_BORDER);
        refInfo_t.addCell(motivo_t);
        
        PdfPCell motivo = new PdfPCell(new Phrase(notaCredito.getMotivo(), PdfStyle.P_FONT));
        motivo.setBorder(Rectangle.NO_BORDER);
        refInfo_t.addCell(motivo);
        
        // EMISION INFO BORDER / BRACKGROUND
		PdfPCell refInfo_cell = new PdfPCell(refInfo_t);
		refInfo_cell.setCellEvent(all_radius);
		refInfo_cell.setBorder(Rectangle.NO_BORDER);
		refInfo_cell.setPadding(5f);
		
		refInfoWrapper.addCell(refInfo_cell);
		
        document.add(refInfoWrapper);
        
        
        
        // DETALLES
        PdfPTable detallesWrapper = new PdfPTable(1);
        detallesWrapper.setWidthPercentage(100);
        detallesWrapper.setSpacingBefore(0f);
        detallesWrapper.setSpacingAfter(0f);
        
        // DETALLES TABLE
		PdfPTable detalles_t = new PdfPTable(7);
		detalles_t.setWidthPercentage(100f);
		detalles_t.setWidths(new float[]{1f, 1f, 1f, 2f, 1f, 1f, 1f});
        
        // CODIGO PRINCIPAL
        PdfPCell codigoPrincipal_th = new PdfPCell(new Phrase("CODIGO PRINCIPAL", PdfStyle.BOLD_FONT));
        codigoPrincipal_th.setBorder(Rectangle.NO_BORDER);
        codigoPrincipal_th.setHorizontalAlignment(Element.ALIGN_CENTER);
        codigoPrincipal_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
        detalles_t.addCell(codigoPrincipal_th);
        // CODIGO AUXILIAR
        PdfPCell codigoAuxiliar_th = new PdfPCell(new Phrase("CODIGO AUXILIAR", PdfStyle.BOLD_FONT));
        codigoAuxiliar_th.setBorder(Rectangle.NO_BORDER);
        codigoAuxiliar_th.setHorizontalAlignment(Element.ALIGN_CENTER);
        codigoAuxiliar_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
        detalles_t.addCell(codigoAuxiliar_th);
        
        // CODIGO AUXILIAR
        PdfPCell cantidad_th = new PdfPCell(new Phrase("CANT", PdfStyle.BOLD_FONT));
        cantidad_th.setBorder(Rectangle.NO_BORDER);
        cantidad_th.setHorizontalAlignment(Element.ALIGN_CENTER);
        cantidad_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
        detalles_t.addCell(cantidad_th);
        
    	// DESCRIPCION
        PdfPCell descripcion_th = new PdfPCell(new Phrase("DESCRIPCION", PdfStyle.BOLD_FONT));
        descripcion_th.setBorder(Rectangle.NO_BORDER);
        descripcion_th.setHorizontalAlignment(Element.ALIGN_CENTER);
        descripcion_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
        detalles_t.addCell(descripcion_th);
        /*
        // DETALLE ADICIONAL
        PdfPCell adicional_th = new PdfPCell(new Phrase("DETALLE ADICIONAL", PdfStyle.BOLD_FONT));
        adicional_th.setBorder(Rectangle.NO_BORDER);
        adicional_th.setHorizontalAlignment(Element.ALIGN_CENTER);
        adicional_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
        detalles_t.addCell(adicional_th);
        */
        // PRECIO UNITARIO
        PdfPCell precioUnitario_th = new PdfPCell(new Phrase("PRECIO UNITARIO", PdfStyle.BOLD_FONT));
        precioUnitario_th.setBorder(Rectangle.NO_BORDER);
        precioUnitario_th.setHorizontalAlignment(Element.ALIGN_CENTER);
        precioUnitario_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
        detalles_t.addCell(precioUnitario_th);

        // DESCUENTO
        PdfPCell descuento_th = new PdfPCell(new Phrase("DESCUENTO", PdfStyle.BOLD_FONT));
        descuento_th.setBorder(Rectangle.NO_BORDER);
        descuento_th.setHorizontalAlignment(Element.ALIGN_CENTER);
        descuento_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
        detalles_t.addCell(descuento_th);
        
        // PRECIO TOTAL
        PdfPCell precioTotal_th = new PdfPCell(new Phrase("PRECIO TOTAL", PdfStyle.BOLD_FONT));
        precioTotal_th.setBorder(Rectangle.NO_BORDER);
        precioTotal_th.setHorizontalAlignment(Element.ALIGN_CENTER);
        precioTotal_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
        detalles_t.addCell(precioTotal_th);
        
        // DETALLES LOOP
        Vector< ecx.unomas.notacredito.Detalles> detalles = notaCredito.getDetalles();
        for (int i=0; i<detalles.size(); i++){
        	detalles_t.addCell(td_c(detalles.get(i).getCodigoInterno()));
        	detalles_t.addCell(td_c(detalles.get(i).getCodigoAdicional()));
        	detalles_t.addCell(td_c(String.format("%.4f", detalles.get(i).getCantidad())));
        	detalles_t.addCell(td(detalles.get(i).getDescripcion()));
        	// DETALLE ADICIONAL
        	//detalles_t.addCell(td(""));
        	detalles_t.addCell(td_c(String.format("%.4f", detalles.get(i).getPrecioUnitario())));
        	detalles_t.addCell(td_c(String.format("%.4f", detalles.get(i).getDescuento())));
        	detalles_t.addCell(td_r(String.format("%.4f", detalles.get(i).getPrecioTotalSinImpuesto())));
        }
        
        // DETALLES BRACKGROUND
        PdfPCell detalles_gb = new PdfPCell(detalles_t);
        detalles_gb.setCellEvent(all_radius_gray1);
        detalles_gb.setBorder(Rectangle.NO_BORDER);
        detalles_gb.setPadding(10f);
        
        detallesWrapper.addCell(detalles_gb);
        
        document.add(detallesWrapper);
        
        // INFORMACION ADICIONAL Y TOTALES
        PdfPTable bottomTable = new PdfPTable(2);
        bottomTable.setWidthPercentage(100);
        bottomTable.setSpacingBefore(0f);
        bottomTable.setWidths(new float[]{0.6f, 0.4f});
        
        // INFORMACION ADICIONAL WRAPPER
        PdfPTable infoAdicionalWrapper = new PdfPTable(3);
        infoAdicionalWrapper.setWidthPercentage(100);
        infoAdicionalWrapper.setSpacingAfter(5f);
        infoAdicionalWrapper.setWidths(new float[]{0.1f, 0.8f, 0.1f});
        
        // INFORMACION ADICIONAL CONTENT
        PdfPTable infoAdicionalContent = new PdfPTable(2);
        infoAdicionalContent.setWidthPercentage(100f);
        infoAdicionalContent.setWidths(new float[]{0.3f, 0.7f});
        
        PdfPCell infoAdicional_t1 = new PdfPCell(new Phrase("INFORMACION ADICIONAL", PdfStyle.BOLD_FONT));
        infoAdicional_t1.setBorder(Rectangle.NO_BORDER);
        infoAdicional_t1.setHorizontalAlignment(Element.ALIGN_CENTER);
        infoAdicional_t1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        infoAdicional_t1.setColspan(2);
        infoAdicionalContent.addCell(infoAdicional_t1);
        
        Vector< ecx.unomas.notacredito.InfoAdicional> infoAdicional = notaCredito.getInfoAdicional();
        for (int i=0; i<infoAdicional.size(); i++){
        	infoAdicionalContent.addCell(td(infoAdicional.get(i).getNombre()));
	        infoAdicionalContent.addCell(td(infoAdicional.get(i).getValor()));
        }
        
        // INFORMACION ADICIONAL TABLE BACKGROUND
        PdfPCell infoAdicionalBG = new PdfPCell(infoAdicionalContent);
        infoAdicionalBG.setCellEvent(all_radius);
        infoAdicionalBG.setBorder(Rectangle.NO_BORDER);
        infoAdicionalBG.setPadding(5f);
		
        PdfPCell blankCell = new PdfPCell(new Paragraph(" "));
        blankCell.setBorder(Rectangle.NO_BORDER);
        
        infoAdicionalWrapper.addCell(blankCell);
        infoAdicionalWrapper.addCell(blankCell);
        infoAdicionalWrapper.addCell(blankCell);
        
        infoAdicionalWrapper.addCell(blankCell);
		infoAdicionalWrapper.addCell(infoAdicionalBG);
		infoAdicionalWrapper.addCell(blankCell);
		
		infoAdicionalWrapper.addCell(blankCell);
        infoAdicionalWrapper.addCell(blankCell);
        infoAdicionalWrapper.addCell(blankCell);
        
        PdfPCell infoAdicionalCell = new PdfPCell(infoAdicionalWrapper);
        infoAdicionalCell.setBorder(Rectangle.NO_BORDER);
        bottomTable.addCell(infoAdicionalCell);
        
        // TOTALES WRAPPER
        PdfPTable totalesWrapper = new PdfPTable(1);
        totalesWrapper.setWidthPercentage(100);
        totalesWrapper.setSpacingAfter(5f);
        
        // TOTALES CONTENT
        PdfPTable totalesContent = new PdfPTable(2);
        totalesContent.setWidthPercentage(100f);
        totalesContent.setWidths(new float[]{0.7f, 0.3F});
        
        totalesContent.addCell(td("SUBTOTAL 12 %"));
        totalesContent.addCell(td_r(String.format("%.4f", notaCredito.getSubtotal12())));
        
        totalesContent.addCell(td("SUBTOTAL 0 %"));
        totalesContent.addCell(td_r(String.format("%.4f", notaCredito.getSubtotal0())));
        
        totalesContent.addCell(td("SUBTOTAL NO OBJETO DE IVA"));
        totalesContent.addCell(td_r(String.format("%.4f", notaCredito.getSubtotalNoObjetoDeIVA())));
        
        totalesContent.addCell(td("SUBTOTAL SIN IMPUESTOS"));
        totalesContent.addCell(td_r(String.format("%.4f", notaCredito.getTotalSinImpuestos())));
        
        totalesContent.addCell(td("SUBTOTAL EXENTO DE IVA"));
        totalesContent.addCell(td_r(String.format("%.4f", notaCredito.getSubtotalExentoDeIVA())));
        
        totalesContent.addCell(td("DESCUENTO"));
        totalesContent.addCell(td_r(String.format("%.4f", notaCredito.getTotalDescuento())));
        
        totalesContent.addCell(td("ICE"));
        totalesContent.addCell(td_r(String.format("%.4f", notaCredito.getICE())));
        
        totalesContent.addCell(td("IVA 12%"));
        totalesContent.addCell(td_r(String.format("%.4f", notaCredito.getIVA())));
        
        totalesContent.addCell(td("IRBPNR"));
        totalesContent.addCell(td_r(String.format("%.4f", notaCredito.getIRBPNR())));
        
        totalesContent.addCell(td("PROPINA"));
        totalesContent.addCell(td_r(String.format("%.4f", notaCredito.getPropina())));
        
        totalesContent.addCell(td("VALOR TOTAL"));
        totalesContent.addCell(td_r(String.format("%.4f", notaCredito.getImporteTotal())));
        
        // TOTALES BACKGROUND
        PdfPCell totalesBG = new PdfPCell(totalesContent);
        totalesBG.setCellEvent(all_radius_gray2);
        totalesBG.setBorder(Rectangle.NO_BORDER);
        totalesBG.setPadding(5f);
        
        PdfPCell totalesCell = new PdfPCell(totalesBG);
        totalesCell.setBorder(Rectangle.NO_BORDER);
        bottomTable.addCell(totalesCell);
        
        document.add(bottomTable);
        
        document.close();
	}
	
	private PdfPCell td(String str){
		PdfPCell cell = new PdfPCell(new Phrase(str, PdfStyle.P_FONT));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setPaddingTop(5f);
		cell.setPaddingBottom(5f);
		return cell;
	}
	
	private PdfPCell td_c(String str){
		PdfPCell cell = new PdfPCell(new Phrase(str, PdfStyle.P_FONT));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		cell.setPaddingTop(5f);
		cell.setPaddingBottom(5f);
		return cell;
	}
	
	private PdfPCell td_r(String str){
		PdfPCell cell = new PdfPCell(new Phrase(str, PdfStyle.P_FONT));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		cell.setPaddingTop(5f);
		cell.setPaddingBottom(5f);
		return cell;
	}
}