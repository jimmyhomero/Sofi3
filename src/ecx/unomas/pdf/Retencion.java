package ecx.unomas.pdf;

import ecx.unomas.retencion.Impuesto;
import ecx.unomas.retencion.InfoAdicional;
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

public class Retencion {
	
	public void generatePDF(ecx.unomas.retencion.Retencion retencion, ServletOutputStream servletOutputStream) throws DocumentException, MalformedURLException, IOException{
	
		Document document = new Document(PageSize.A4, 20, 20, 30, 30);
    
		PdfWriter writer = null;
		if (servletOutputStream!=null)
			writer = PdfWriter.getInstance(document, servletOutputStream);
		else
			writer = PdfWriter.getInstance(document, new FileOutputStream(Config.AUTORIZADOS_DIR+retencion.getClaveAcceso()+".pdf"));    
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
		
		PdfPCell ruc = new PdfPCell(new Phrase("RUC: "+retencion.getRUC()));
		ruc.setBorder(Rectangle.NO_BORDER);
		ruc.setPaddingTop(5f);
		head_content.addCell(ruc);
		
		PdfPCell factura_text = new PdfPCell(new Phrase("COMPROBANTE DE RETENCION", PdfStyle.TABLE_H1_FONT));
		factura_text.setBorder(Rectangle.NO_BORDER);
		factura_text.setPaddingTop(5f);
		head_content.addCell(factura_text);
		
		PdfPCell factura_nro = new PdfPCell(new Phrase("Nro. "+retencion.getEstab()+"-"+retencion.getPtoEmi()+"-"+retencion.getSecuencia(), PdfStyle.TABLE_H3_FONT));
		factura_nro.setBorder(Rectangle.NO_BORDER);
		factura_nro.setPaddingTop(5f);
		head_content.addCell(factura_nro);
		
		PdfPCell nroAut_text = new PdfPCell(new Phrase("N�MERO DE AUTORIZACI�N", PdfStyle.TABLE_P_FONT));
		nroAut_text.setBorder(Rectangle.NO_BORDER);
		nroAut_text.setPaddingTop(5f);
		head_content.addCell(nroAut_text);
		
		PdfPCell nroAut_val = new PdfPCell(new Phrase(retencion.getAuthNumber(), PdfStyle.TABLE_P_FONT));
		nroAut_val.setBorder(Rectangle.NO_BORDER);
		nroAut_val.setPaddingTop(5f);
		head_content.addCell(nroAut_val);
		
		PdfPCell fechaAut_text = new PdfPCell(new Phrase("FECHA Y HORA DE AUTORIZACI�N", PdfStyle.TABLE_P_FONT));
		fechaAut_text.setBorder(Rectangle.NO_BORDER);
		fechaAut_text.setPaddingTop(5f);
		head_content.addCell(fechaAut_text);
		
		PdfPCell fechaAut_val = new PdfPCell(new Phrase(retencion.getAuthDate(), PdfStyle.TABLE_P_FONT));
		fechaAut_val.setBorder(Rectangle.NO_BORDER);
		fechaAut_val.setPaddingTop(5f);
		head_content.addCell(fechaAut_val);
		
		PdfPCell ambiente = new PdfPCell(new Phrase("AMBIENTE: "+retencion.getAmbienteName(), PdfStyle.TABLE_P_FONT));
		ambiente.setBorder(Rectangle.NO_BORDER);
		ambiente.setPaddingTop(5f);
		head_content.addCell(ambiente);
		
		PdfPCell emision = new PdfPCell(new Phrase("EMISION: "+retencion.getTipoEmisionName(), PdfStyle.TABLE_P_FONT));
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
	    code128.setCode(retencion.getClaveAcceso());
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
		
		PdfPCell empresa = new PdfPCell(new Phrase(retencion.getRazonSocial(), PdfStyle.TABLE_H2_FONT));
		empresa.setBorder(Rectangle.NO_BORDER);
		info_content.addCell(empresa);
		
		PdfPCell dirMatriz = new PdfPCell(new Phrase("Dir. Matriz: "+retencion.getDirMatriz(), PdfStyle.P_FONT));
		dirMatriz.setBorder(Rectangle.NO_BORDER);
		info_content.addCell(dirMatriz);
		
		PdfPCell dirSucursal = new PdfPCell(new Phrase("Dir. Sucursal: "+retencion.getDirEstablecimiento(), PdfStyle.P_FONT));
		dirSucursal.setBorder(Rectangle.NO_BORDER);
		info_content.addCell(dirSucursal);
		
		if (!retencion.getContribuyenteEspecial().isEmpty()){
			PdfPCell contribuyente = new PdfPCell(new Phrase("Contribuyente Especial Nro. "+retencion.getContribuyenteEspecial(), PdfStyle.P_FONT));
			contribuyente.setBorder(Rectangle.NO_BORDER);
			info_content.addCell(contribuyente);
		}
		
		PdfPCell obligadoConta = new PdfPCell(new Phrase("OBLIGADO A LLEVAR CONTABILIDAD: "+retencion.getObligadoContabilidad(), PdfStyle.P_FONT));
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
	    PdfPCell razonSocial = new PdfPCell(new Phrase("Razon Social / Nombres y Apellidos: "+retencion.getRazonSocialSujetoRetenido(), PdfStyle.P_FONT));
	    razonSocial.setBorder(Rectangle.NO_BORDER);
	    emisionInfo_t.addCell(razonSocial);
	    
	    // IDENTIFICACION
	    PdfPCell identificacion = new PdfPCell(new Phrase("Identificaci�n: "+retencion.getIdentificacionSujetoRetenido(), PdfStyle.P_FONT));
	    identificacion.setBorder(Rectangle.NO_BORDER);
	    emisionInfo_t.addCell(identificacion);
	    
	    // FECHA EMISION
	    PdfPCell fechaEmision = new PdfPCell(new Phrase("Fecha Emisi�n: "+retencion.getFechaEmision(), PdfStyle.P_FONT));
	    fechaEmision.setBorder(Rectangle.NO_BORDER);
	    emisionInfo_t.addCell(fechaEmision);
	    
	    // empty
	    PdfPCell empty = new PdfPCell(new Phrase(" ", PdfStyle.P_FONT));
	    empty.setBorder(Rectangle.NO_BORDER);
	    emisionInfo_t.addCell(empty);
	    
	    // EMISION INFO BORDER / BRACKGROUND
		PdfPCell emision_cell = new PdfPCell(emisionInfo_t);
		emision_cell.setCellEvent(all_radius);
		emision_cell.setBorder(Rectangle.NO_BORDER);
		emision_cell.setPadding(5f);
		
		emisionInfoWrapper.addCell(emision_cell);
		
	    document.add(emisionInfoWrapper);
	    
	    // DETALLES
	    PdfPTable detallesWrapper = new PdfPTable(1);
	    detallesWrapper.setWidthPercentage(100);
	    detallesWrapper.setSpacingBefore(0f);
	    detallesWrapper.setSpacingAfter(0f);
	    
	    // DETALLES TABLE
		PdfPTable detalles_t = new PdfPTable(8);
		detalles_t.setWidthPercentage(100f);
		detalles_t.setWidths(new float[]{1f, 1f, 1f, 1f, 1f, 1f, 1f, 1f});
	    
	    // COMPROBANTE
	    PdfPCell codigoPrincipal_th = new PdfPCell(new Phrase("COMPROBANTE", PdfStyle.BOLD_FONT6));
	    codigoPrincipal_th.setBorder(Rectangle.NO_BORDER);
	    codigoPrincipal_th.setHorizontalAlignment(Element.ALIGN_CENTER);
	    codigoPrincipal_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
	    detalles_t.addCell(codigoPrincipal_th);
	    
	    // N�MERO
	    PdfPCell codigoAuxiliar_th = new PdfPCell(new Phrase("N�MERO", PdfStyle.BOLD_FONT6));
	    codigoAuxiliar_th.setBorder(Rectangle.NO_BORDER);
	    codigoAuxiliar_th.setHorizontalAlignment(Element.ALIGN_CENTER);
	    codigoAuxiliar_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
	    detalles_t.addCell(codigoAuxiliar_th);
	    
	    // FECHA EMISION
	    PdfPCell cantidad_th = new PdfPCell(new Phrase("FECHA EMISI�N", PdfStyle.BOLD_FONT6));
	    cantidad_th.setBorder(Rectangle.NO_BORDER);
	    cantidad_th.setHorizontalAlignment(Element.ALIGN_CENTER);
	    cantidad_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
	    detalles_t.addCell(cantidad_th);
	    
		// EJERCICIO FISCAL
	    PdfPCell descripcion_th = new PdfPCell(new Phrase("EJERCICIO FISCAL", PdfStyle.BOLD_FONT6));
	    descripcion_th.setBorder(Rectangle.NO_BORDER);
	    descripcion_th.setHorizontalAlignment(Element.ALIGN_CENTER);
	    descripcion_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
	    detalles_t.addCell(descripcion_th);
	    
	    // BASE IMPONIBLE PARA LA RETENCION
	    PdfPCell adicional_th = new PdfPCell(new Phrase("BASE IMPONIBLE PARA LA RETENCION", PdfStyle.BOLD_FONT6));
	    adicional_th.setBorder(Rectangle.NO_BORDER);
	    adicional_th.setHorizontalAlignment(Element.ALIGN_CENTER);
	    adicional_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
	    detalles_t.addCell(adicional_th);
	    
	    // IMPUESTO
	    PdfPCell precioUnitario_th = new PdfPCell(new Phrase("IMPUESTO", PdfStyle.BOLD_FONT6));
	    precioUnitario_th.setBorder(Rectangle.NO_BORDER);
	    precioUnitario_th.setHorizontalAlignment(Element.ALIGN_CENTER);
	    precioUnitario_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
	    detalles_t.addCell(precioUnitario_th);
	
	    // PORCENTAJE RETENCION
	    PdfPCell descuento_th = new PdfPCell(new Phrase("PORCENTAJE RETENCION", PdfStyle.BOLD_FONT6));
	    descuento_th.setBorder(Rectangle.NO_BORDER);
	    descuento_th.setHorizontalAlignment(Element.ALIGN_CENTER);
	    descuento_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
	    detalles_t.addCell(descuento_th);
	    
	    // VALOR RETENIDO
	    PdfPCell precioTotal_th = new PdfPCell(new Phrase("VALOR RETENIDO", PdfStyle.BOLD_FONT6));
	    precioTotal_th.setBorder(Rectangle.NO_BORDER);
	    precioTotal_th.setHorizontalAlignment(Element.ALIGN_CENTER);
	    precioTotal_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
	    detalles_t.addCell(precioTotal_th);
	    
	    // IMPUESTOS
	    Vector<Impuesto> impuestos = retencion.getImpuesto();
	    for (int i=0; i<impuestos.size(); i++){
	    	detalles_t.addCell(td_c7(String.valueOf(impuestos.get(i).getCodDocSustento())));
	    	detalles_t.addCell(td_c7(String.valueOf(impuestos.get(i).getNumDocSustento())));
	    	detalles_t.addCell(td_c7(String.valueOf(impuestos.get(i).getFechaEmisionDocSustento())));
	    	detalles_t.addCell(td_c7(String.valueOf(retencion.getPeriodoFiscal())));
	    	detalles_t.addCell(td_c7(String.format("%.4f", impuestos.get(i).getBaseImponible())));
	    	detalles_t.addCell(td_c7(impuestos.get(i).getCodigoRetencionName()));
	    	detalles_t.addCell(td_c7(String.valueOf(impuestos.get(i).getPorcentajeRetener())));
	    	detalles_t.addCell(td_r7(String.format("%.4f", impuestos.get(i).getValorRetenido())));
	    }
	    
	    // DETALLES BRACKGROUND
	    PdfPCell detalles_gb = new PdfPCell(detalles_t);
	    detalles_gb.setCellEvent(all_radius_gray1);
	    detalles_gb.setBorder(Rectangle.NO_BORDER);
	    detalles_gb.setPadding(10f);
	    
	    detallesWrapper.addCell(detalles_gb);
	    
	    document.add(detallesWrapper);
	    
	    // INFORMACION ADICIONAL Y TOTALES
	    PdfPTable bottomTable = new PdfPTable(1);
	    bottomTable.setWidthPercentage(100);
	    bottomTable.setSpacingBefore(0f);
	    bottomTable.setWidths(new float[]{1f});
	    
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
	    
	    Vector<InfoAdicional> infoAdicional = retencion.getInfoAdicional();
	    for (int i=0; i<infoAdicional.size(); i++){
	    	infoAdicionalContent.addCell(td(infoAdicional.get(i).getNombre()));
	        infoAdicionalContent.addCell(td(infoAdicional.get(i).getValor()));
	    }
	    //infoAdicionalContent.addCell(td("Res. NAC."));
        //infoAdicionalContent.addCell(td("EXPORTADOR HABITUAL DE BIENES"));
	    
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
	
	private PdfPCell td_c7(String str){
		PdfPCell cell = new PdfPCell(new Phrase(str, PdfStyle.P_FONT7));
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
	
	private PdfPCell td_r7(String str){
		PdfPCell cell = new PdfPCell(new Phrase(str, PdfStyle.P_FONT7));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		cell.setPaddingTop(5f);
		cell.setPaddingBottom(5f);
		return cell;
	}
}
