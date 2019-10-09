package ec.unomas.pdf;

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


import ec.unomas.factura.Detalle;
import ec.unomas.factura.InfoAdicional;
import ec.unomas.factura.Pago;
import ec.unomas.service.Config;

public class Factura {
	
	public void generatePDF(ec.unomas.factura.Factura factura, ServletOutputStream servletOutputStream) throws DocumentException, MalformedURLException, IOException{
		
		Document document = new Document(PageSize.A4, 20, 20, 30, 30);
        
		PdfWriter writer = null;
		if (servletOutputStream!=null)
			writer = PdfWriter.getInstance(document, servletOutputStream);
		else
			writer = PdfWriter.getInstance(document, new FileOutputStream(Config.AUTORIZADOS_DIR+factura.getClaveAcceso()+".pdf"));    
		document.open();
		
		// ALL RADIOUS
		PdfRoundCorners blue_bg = new PdfRoundCorners(new BaseColor(0x00, 0x00, 0xFF), false, false, false, false);
		PdfRoundCorners no_radius = new PdfRoundCorners(new BaseColor(0xFF, 0xFF, 0xFF), false, false, false, false);
		PdfRoundCorners all_radius = new PdfRoundCorners(new BaseColor(0xFF, 0xFF, 0xFF), true, true, true, true);
		PdfRoundCorners all_radius_gray1 = new PdfRoundCorners(new BaseColor(0xDD, 0xDD, 0xDD), true, true, false, true);
		PdfRoundCorners all_radius_gray2 = new PdfRoundCorners(new BaseColor(0xDD, 0xDD, 0xDD), false, false, true, true);
				
		// HEADER
		PdfPTable header = new PdfPTable(2);
		header.setWidthPercentage(100);
		header.setSpacingAfter(10f);
		float[] columnWs = {0.49f, 0.49f};
		header.setWidths(columnWs);
		
		// LOGO
		Image logo = Image.getInstance(Config.LOGO);
		logo.setAlignment(Image.LEFT);
		logo.scalePercent(60);
		PdfPCell logo_cell = new PdfPCell(logo);
		logo_cell.setBorder(Rectangle.NO_BORDER);
		logo_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		logo_cell.setPadding(10f);
		header.addCell(logo_cell);
		
		// FACTURA HEAD
		PdfPTable head = new PdfPTable(1);
		
		PdfPTable head_content = new PdfPTable(1);
		
		PdfPCell ruc = new PdfPCell(new Phrase("RUC: "+factura.getRUC()));
		ruc.setBorder(Rectangle.NO_BORDER);
		ruc.setPaddingTop(5f);
		head_content.addCell(ruc);
		
		PdfPCell factura_text = new PdfPCell(new Phrase("FACTURA", PdfStyle.TABLE_H1_FONT));
		factura_text.setBorder(Rectangle.NO_BORDER);
		factura_text.setPaddingTop(5f);
		head_content.addCell(factura_text);
		
		PdfPCell factura_nro = new PdfPCell(new Phrase("Nro. "+factura.getEstab()+"-"+factura.getPtoEmi()+"-"+factura.getSecuencia(), PdfStyle.TABLE_H3_FONT));
		factura_nro.setBorder(Rectangle.NO_BORDER);
		factura_nro.setPaddingTop(5f);
		head_content.addCell(factura_nro);
		
		PdfPCell nroAut_text = new PdfPCell(new Phrase("NOMERO DE AUTORIZACION", PdfStyle.TABLE_P_FONT));
		nroAut_text.setBorder(Rectangle.NO_BORDER);
		nroAut_text.setPaddingTop(5f);
		head_content.addCell(nroAut_text);
		
		PdfPCell nroAut_val = new PdfPCell(new Phrase(factura.getNroAutorizacion(), PdfStyle.TABLE_P_FONT));
		nroAut_val.setBorder(Rectangle.NO_BORDER);
		nroAut_val.setPaddingTop(5f);
		head_content.addCell(nroAut_val);
		
		PdfPCell fechaAut_text = new PdfPCell(new Phrase("FECHA Y HORA DE AUTORIZACION", PdfStyle.TABLE_P_FONT));
		fechaAut_text.setBorder(Rectangle.NO_BORDER);
		fechaAut_text.setPaddingTop(5f);
		head_content.addCell(fechaAut_text);
		
		PdfPCell fechaAut_val = new PdfPCell(new Phrase(factura.getFechaAutorizacion(), PdfStyle.TABLE_P_FONT));
		fechaAut_val.setBorder(Rectangle.NO_BORDER);
		fechaAut_val.setPaddingTop(5f);
		head_content.addCell(fechaAut_val);
		
		PdfPCell ambiente = new PdfPCell(new Phrase("AMBIENTE: "+factura.getAmbienteName(), PdfStyle.TABLE_P_FONT));
		ambiente.setBorder(Rectangle.NO_BORDER);
		ambiente.setPaddingTop(5f);
		head_content.addCell(ambiente);
		
		PdfPCell emision = new PdfPCell(new Phrase("EMISION: "+factura.getTipoEmisionName(), PdfStyle.TABLE_P_FONT));
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
        code128.setCode(factura.getClaveAcceso());
        PdfPCell barCode = new PdfPCell(code128.createImageWithBarcode(writer.getDirectContent(), null, null));
		barCode.setBorder(Rectangle.NO_BORDER);
		head_content.addCell(barCode);
		
		// FACTURA HEAD BORDER / BACKGROUND
		PdfPCell head_cell = new PdfPCell(head_content);
		head_cell.setCellEvent(all_radius);
		head_cell.setBorder(Rectangle.BOX);
		head_cell.setBorderColor(new BaseColor(0x00, 0x00, 0xFF));
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
		
		PdfPCell empresa = new PdfPCell(new Phrase(factura.getRazonSocial(), PdfStyle.TABLE_H2_FONT));
		empresa.setBorder(Rectangle.NO_BORDER);
		info_content.addCell(empresa);
		
		PdfPCell dirMatriz = new PdfPCell(new Phrase("Dir. Matriz: "+factura.getDirMatriz(), PdfStyle.P_FONT));
		dirMatriz.setBorder(Rectangle.NO_BORDER);
		info_content.addCell(dirMatriz);
		
		PdfPCell dirSucursal = new PdfPCell(new Phrase("Dir. Sucursal: "+factura.getDirEstablecimiento(), PdfStyle.P_FONT));
		dirSucursal.setBorder(Rectangle.NO_BORDER);
		info_content.addCell(dirSucursal);
		
		if (factura.getContribuyenteEspecial()>0){
			PdfPCell contribuyente = new PdfPCell(new Phrase("Contribuyente Especial Nro. "+factura.getContribuyenteEspecial(), PdfStyle.P_FONT));
			contribuyente.setBorder(Rectangle.NO_BORDER);
			info_content.addCell(contribuyente);
		}
		
		PdfPCell obligadoConta = new PdfPCell(new Phrase("OBLIGADO A LLEVAR CONTABILIDAD: "+factura.getObligadoContabilidad(), PdfStyle.P_FONT));
		obligadoConta.setBorder(Rectangle.NO_BORDER);
		info_content.addCell(obligadoConta);
		
		// FACTURA INFO BORDER / BRACKGROUND
		PdfPCell info_cell = new PdfPCell(info_content);
		info_cell.setCellEvent(all_radius);
		info_cell.setBorder(Rectangle.BOX);
		info_cell.setBorderColor(new BaseColor(0x00, 0x00, 0xFF));
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
        PdfPCell razonSocial = new PdfPCell(new Phrase("Razon Social / Nombres y Apellidos: "+factura.getRazonSocialComprador(), PdfStyle.P_FONT));
        razonSocial.setBorder(Rectangle.NO_BORDER);
        emisionInfo_t.addCell(razonSocial);
        
        // IDENTIFICACION
        PdfPCell identificacion = new PdfPCell(new Phrase("IdentificaciOn: "+factura.getIdentificacionComprador(), PdfStyle.P_FONT));
        identificacion.setBorder(Rectangle.NO_BORDER);
        emisionInfo_t.addCell(identificacion);
        
        // FECHA EMISION
        PdfPCell fechaEmision = new PdfPCell(new Phrase("Fecha EmisiOn: "+factura.getFechaEmision(), PdfStyle.P_FONT));
        fechaEmision.setBorder(Rectangle.NO_BORDER);
        emisionInfo_t.addCell(fechaEmision);
        
        // GUOA REMISION
        PdfPCell guiaRemi = new PdfPCell(new Phrase("GuOa RemisiOn:"+factura.getGuiaRemision(), PdfStyle.P_FONT));
        guiaRemi.setBorder(Rectangle.NO_BORDER);
        emisionInfo_t.addCell(guiaRemi);

        // DIRECCION COMPRADOR
        if (!factura.getDireccionComprador().equals("")){
        	PdfPCell direccionComprador = new PdfPCell(new Phrase("DirecciOn: "+factura.getDireccionComprador(), PdfStyle.P_FONT));
        	direccionComprador.setBorder(Rectangle.NO_BORDER);
        	emisionInfo_t.addCell(direccionComprador);
        	
        	PdfPCell empty = new PdfPCell(new Phrase("", PdfStyle.P_FONT));
        	empty.setBorder(Rectangle.NO_BORDER);
        	emisionInfo_t.addCell(empty);
        }
        
        // EMISION INFO BORDER / BRACKGROUND
		PdfPCell emision_cell = new PdfPCell(emisionInfo_t);
		emision_cell.setCellEvent(no_radius);
		emision_cell.setBorder(Rectangle.BOX);
		emision_cell.setBorderColor(new BaseColor(0x00, 0x00, 0xFF));
		emision_cell.setPadding(5f);
		
		emisionInfoWrapper.addCell(emision_cell);
		
        document.add(emisionInfoWrapper);
        
        // DETALLES
        PdfPTable detallesWrapper = new PdfPTable(1);
        detallesWrapper.setWidthPercentage(100);
        detallesWrapper.setSpacingBefore(0f);
        detallesWrapper.setSpacingAfter(0f);
        
        // DETALLES TABLE
		PdfPTable detalles_t = new PdfPTable(7);
		detalles_t.setWidthPercentage(100f);
		detalles_t.setWidths(new float[]{1f, 1f, 3f, 1f, 1f, 1f, 1f});
        
        // CODIGO PRINCIPAL
        PdfPCell codigoPrincipal_th = new PdfPCell(new Phrase("CODIGO PRINCIPAL", PdfStyle.BOLD_FONT));
        codigoPrincipal_th.setBorder(Rectangle.NO_BORDER);
        codigoPrincipal_th.setCellEvent(blue_bg);
        codigoPrincipal_th.setHorizontalAlignment(Element.ALIGN_CENTER);
        codigoPrincipal_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
        detalles_t.addCell(codigoPrincipal_th);
        // CODIGO AUXILIAR
        /*PdfPCell codigoAuxiliar_th = new PdfPCell(new Phrase("CODIGO AUXILIAR", PdfStyle.BOLD_FONT));
        codigoAuxiliar_th.setBorder(Rectangle.NO_BORDER);
        codigoAuxiliar_th.setHorizontalAlignment(Element.ALIGN_CENTER);
        codigoAuxiliar_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
        detalles_t.addCell(codigoAuxiliar_th);
        */
        // CODIGO AUXILIAR
        PdfPCell cantidad_th = new PdfPCell(new Phrase("CANT", PdfStyle.BOLD_FONT));
        cantidad_th.setBorder(Rectangle.NO_BORDER);
        cantidad_th.setCellEvent(blue_bg);
        cantidad_th.setHorizontalAlignment(Element.ALIGN_CENTER);
        cantidad_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
        detalles_t.addCell(cantidad_th);
        
    	// DESCRIPCION
        PdfPCell descripcion_th = new PdfPCell(new Phrase("DESCRIPCION", PdfStyle.BOLD_FONT));
        descripcion_th.setBorder(Rectangle.NO_BORDER);
        descripcion_th.setCellEvent(blue_bg);
        descripcion_th.setHorizontalAlignment(Element.ALIGN_CENTER);
        descripcion_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
        detalles_t.addCell(descripcion_th);
        
        // DETALLE ADICIONAL
        PdfPCell adicional_th = new PdfPCell(new Phrase("DETALLE ADICIONAL", PdfStyle.BOLD_FONT));
        adicional_th.setBorder(Rectangle.NO_BORDER);
        adicional_th.setCellEvent(blue_bg);
        adicional_th.setHorizontalAlignment(Element.ALIGN_CENTER);
        adicional_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
        detalles_t.addCell(adicional_th);
        
        // PRECIO UNITARIO
        PdfPCell precioUnitario_th = new PdfPCell(new Phrase("PRECIO UNITARIO", PdfStyle.BOLD_FONT));
        precioUnitario_th.setBorder(Rectangle.NO_BORDER);
        precioUnitario_th.setCellEvent(blue_bg);
        precioUnitario_th.setHorizontalAlignment(Element.ALIGN_CENTER);
        precioUnitario_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
        detalles_t.addCell(precioUnitario_th);

        // DESCUENTO
        PdfPCell descuento_th = new PdfPCell(new Phrase("DESCUENTO", PdfStyle.BOLD_FONT));
        descuento_th.setBorder(Rectangle.NO_BORDER);
        descuento_th.setCellEvent(blue_bg);
        descuento_th.setHorizontalAlignment(Element.ALIGN_CENTER);
        descuento_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
        detalles_t.addCell(descuento_th);
        
        // PRECIO TOTAL
        PdfPCell precioTotal_th = new PdfPCell(new Phrase("PRECIO TOTAL", PdfStyle.BOLD_FONT));
        precioTotal_th.setBorder(Rectangle.NO_BORDER);
        precioTotal_th.setCellEvent(blue_bg);
        precioTotal_th.setHorizontalAlignment(Element.ALIGN_CENTER);
        precioTotal_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
        detalles_t.addCell(precioTotal_th);
        
        // DETALLES LOOP
        Vector<Detalle> detalles = factura.getDetalles();
        for (int i=0; i<detalles.size(); i++){
        	detalles_t.addCell(td_c(detalles.get(i).getCodigoPrincipal()));
        	//detalles_t.addCell(td_c(detalles.get(i).getCodigoSecundario()));
        	detalles_t.addCell(td_c(String.format("%.4f", detalles.get(i).getCantidad())));
        	detalles_t.addCell(td(detalles.get(i).getDescripcion()));
        	// DETALLE ADICIONAL
        	detalles_t.addCell(td(""));
        	detalles_t.addCell(td_c(String.format("%.4f", detalles.get(i).getPrecioUnitario())));
        	detalles_t.addCell(td_c(String.format("%.4f", detalles.get(i).getDescuento())));
        	detalles_t.addCell(td_r(String.format("%.4f", detalles.get(i).getPrecioTotalSinImpuesto())));
        }
        
        // DETALLES BRACKGROUND
        PdfPCell detalles_gb = new PdfPCell(detalles_t);
        detalles_gb.setCellEvent(no_radius);
        detalles_gb.setBorder(Rectangle.BOX);
        detalles_gb.setBorderColor(new BaseColor(0x00, 0x00, 0xFF));
        detalles_gb.setPadding(10f);
        
        detallesWrapper.addCell(detalles_gb);
        
        // EXPORTADOR
        if (!factura.getComercioExterior().equals("")){

            // EXPORTADOR TABLE
    		PdfPTable exportador_t = new PdfPTable(4);
    		exportador_t.setWidthPercentage(100f);
    		exportador_t.setWidths(new float[]{1f, 1f, 1f, 1f});
    		
            PdfPCell datosExportacion = new PdfPCell(new Phrase("- DATOS EXPORTACION -", PdfStyle.BOLD_FONT));
            datosExportacion.setBorder(Rectangle.NO_BORDER);
            datosExportacion.setHorizontalAlignment(Element.ALIGN_CENTER);
            datosExportacion.setVerticalAlignment(Element.ALIGN_MIDDLE);
            datosExportacion.setColspan(4);
            exportador_t.addCell(datosExportacion);
            
            exportador_t.addCell(td("IncoTerm Factura:"));
            exportador_t.addCell(td(factura.getIncoTermFactura()));
            exportador_t.addCell(td("Lugar IncoTerm:"));
            exportador_t.addCell(td(factura.getLugarIncoTerm()));
            
            exportador_t.addCell(td("Pais Origen:"));
            exportador_t.addCell(td(String.valueOf(factura.getPaisOrigen())));
            exportador_t.addCell(td("Puerto Embarque:"));
            exportador_t.addCell(td(factura.getPuertoEmbarque()));

            exportador_t.addCell(td("Pais Destino:"));
            exportador_t.addCell(td(String.valueOf(factura.getPaisDestino())));
            exportador_t.addCell(td("Puerto Destino:"));
            exportador_t.addCell(td(factura.getPuertoDestino()));

            exportador_t.addCell(td("Pais AdquisiciOn:"));
            exportador_t.addCell(td(String.valueOf(factura.getPaisAdquisicion())));
            exportador_t.addCell(td("IncoTerm Tota sin Impuestos:"));
            exportador_t.addCell(td(factura.getIncoTermTotalSinImpuestos()));

            exportador_t.addCell(td("Flete Internacional:"));
            exportador_t.addCell(td(String.valueOf(factura.getFleteInternacional())));
            exportador_t.addCell(td(""));
            exportador_t.addCell(td(""));

            exportador_t.addCell(td("Seguro Internacional:"));
            exportador_t.addCell(td(String.valueOf(factura.getSeguroInternacional())));
            exportador_t.addCell(td(""));
            exportador_t.addCell(td(""));

            exportador_t.addCell(td("Gastos Aduaneros:"));
            exportador_t.addCell(td(String.valueOf(factura.getGastosAduaneros())));
            exportador_t.addCell(td(""));
            exportador_t.addCell(td(""));

            exportador_t.addCell(td("Gastos Transporte Otros:"));
            exportador_t.addCell(td(String.valueOf(factura.getGastosTransporteOtros())));
            exportador_t.addCell(td(""));
            exportador_t.addCell(td(""));

        	// EXPORTADOR BRACKGROUND
            PdfPCell exportador_gb = new PdfPCell(exportador_t);
            exportador_gb.setCellEvent(no_radius);
            exportador_gb.setBorder(Rectangle.BOX);
            exportador_gb.setBorderColor(new BaseColor(0x00, 0x00, 0xFF));
            exportador_gb.setPadding(10f);
            
        	detallesWrapper.addCell(exportador_gb);
        }
        
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
        
        Vector<InfoAdicional> infoAdicional = factura.getInfoAdicional();
        for (int i=0; i<infoAdicional.size(); i++){
        	infoAdicionalContent.addCell(td(infoAdicional.get(i).getNombre()));
	        infoAdicionalContent.addCell(td(infoAdicional.get(i).getValor()));
        }
        // AGROEDEN ONLY //
        /*
        infoAdicionalContent.addCell(td("PAYMENT TERMS"));
        infoAdicionalContent.addCell(td("Bank Transfer\n"+
        	"Banco del Pichincha Miami Agency\n"+
        	"1111 Brickell Avenue Piso 26\n"+
        	"Miami, Florida 33131\n"+
        	"ABA 066012867\n"+
        	"SWIFT: PICHUS3M\n"+
        	"ACCOUNT: 23118842\n"+
        	"BENEFICIARY: AGROEDEN"));
        */
        // INFORMACION ADICIONAL TABLE BACKGROUND
        PdfPCell infoAdicionalBG = new PdfPCell(infoAdicionalContent);
        infoAdicionalBG.setCellEvent(no_radius);
        infoAdicionalBG.setBorder(Rectangle.BOX);
        infoAdicionalBG.setBorderColor(new BaseColor(0x00, 0x00, 0xFF));
        infoAdicionalBG.setPadding(2f);
        

        // PAGOS CONTENT
        PdfPTable pagosContent = new PdfPTable(2);
        pagosContent.setWidthPercentage(100f);
        pagosContent.setWidths(new float[]{0.7f, 0.3f});
        
        pagosContent.addCell(th("Forma de Pago"));
    	pagosContent.addCell(th("Valor"));
    	
        Vector<Pago> pago = factura.getPagos();
        for (int i=0; i<pago.size(); i++){
        	pagosContent.addCell(td(pago.get(i).getFormaPago()));
        	pagosContent.addCell(td("$ "+String.format("%.4f", pago.get(i).getTotal())));
        }
        										
        PdfPCell pagosBG = new PdfPCell(pagosContent);
        pagosBG.setCellEvent(no_radius);
        pagosBG.setBorder(Rectangle.BOX);
        pagosBG.setBorderColor(new BaseColor(0x00, 0x00, 0xFF));
        pagosBG.setPadding(2f);
		
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
        
        if (pago.size()>0){
			infoAdicionalWrapper.addCell(blankCell);
	        infoAdicionalWrapper.addCell(pagosBG);
	        infoAdicionalWrapper.addCell(blankCell);
	
			infoAdicionalWrapper.addCell(blankCell);
	        infoAdicionalWrapper.addCell(blankCell);
	        infoAdicionalWrapper.addCell(blankCell);
        }
        
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
        double subTotal14 = factura.getSubtotal14();
        if (subTotal14>0){
	        totalesContent.addCell(td("SUBTOTAL 14 %"));
	        totalesContent.addCell(td_r("$ "+String.format("%.4f", subTotal14)));
        }
        double subTotal12 = factura.getSubtotal12();
        if (subTotal12>0){
	        totalesContent.addCell(td("SUBTOTAL 12 %"));
	        totalesContent.addCell(td_r("$ "+String.format("%.4f", subTotal12)));
        }
        totalesContent.addCell(td("SUBTOTAL 0 %"));
        totalesContent.addCell(td_r("$ "+String.format("%.4f", factura.getSubtotal0())));
        
        totalesContent.addCell(td("SUBTOTAL NO OBJETO DE IVA"));
        totalesContent.addCell(td_r("$ "+String.format("%.4f", factura.getSubtotalNoObjetoDeIVA())));
        
        totalesContent.addCell(td("SUBTOTAL SIN IMPUESTOS"));
        totalesContent.addCell(td_r("$ "+String.format("%.4f", factura.getTotalSinImpuestos())));
        
        totalesContent.addCell(td("SUBTOTAL EXENTO DE IVA"));
        totalesContent.addCell(td_r("$ "+String.format("%.4f", factura.getSubtotalExentoDeIVA())));
        
        totalesContent.addCell(td("DESCUENTO"));
        totalesContent.addCell(td_r("$ "+String.format("%.4f", factura.getTotalDescuento())));
        
        totalesContent.addCell(td("ICE"));
        totalesContent.addCell(td_r("$ "+String.format("%.4f", factura.getICE())));
        double iva14 = factura.getIVA14();
        if (iva14>0){
	        totalesContent.addCell(td("IVA 14%"));
	        totalesContent.addCell(td_r("$ "+String.format("%.4f", iva14)));
        }
        double iva12 = factura.getIVA12();
        if (iva12>0){
	        totalesContent.addCell(td("IVA 12%"));
	        totalesContent.addCell(td_r("$ "+String.format("%.4f", iva12)));
        }
        totalesContent.addCell(td("IRBPNR"));
        totalesContent.addCell(td_r("$ "+String.format("%.4f", factura.getIRBPNR())));
        
        totalesContent.addCell(td("PROPINA"));
        totalesContent.addCell(td_r("$ "+String.format("%.4f", factura.getPropina())));
        
        totalesContent.addCell(td("VALOR TOTAL"));
        totalesContent.addCell(td_r("USD $ "+String.format("%.4f", factura.getImporteTotal())));
        
        // TOTALES BACKGROUND
        PdfPCell totalesBG = new PdfPCell(totalesContent);
        totalesBG.setCellEvent(no_radius);
        totalesBG.setBorder(Rectangle.BOX);
        totalesBG.setBorderColor(new BaseColor(0x00, 0x00, 0xFF));
        totalesBG.setPadding(2f);
        
        PdfPCell totalesCell = new PdfPCell(totalesBG);
        totalesCell.setBorder(Rectangle.BOX);
        totalesCell.setBorderColor(new BaseColor(0x00, 0x00, 0xFF));
        bottomTable.addCell(totalesCell);
        
        document.add(bottomTable);
        
        document.close();
	}
	
	private PdfPCell th(String str){
		PdfPCell cell = new PdfPCell(new Phrase(str, PdfStyle.BOLD_FONT));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setPaddingTop(2f);
		cell.setPaddingBottom(2f);
		return cell;
	}
	
	private PdfPCell td(String str){
		PdfPCell cell = new PdfPCell(new Phrase(str, PdfStyle.P_FONT));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setPaddingTop(2f);
		cell.setPaddingBottom(2f);
		return cell;
	}

	private PdfPCell td2(String str){
		PdfPCell cell = new PdfPCell(new Phrase(str, PdfStyle.P_FONT));
		cell.setBorder(Rectangle.BOX);
		cell.setPaddingTop(2f);
		cell.setPaddingBottom(2f);
		return cell;
	}
	
	private PdfPCell td_c(String str){
		PdfPCell cell = new PdfPCell(new Phrase(str, PdfStyle.P_FONT));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		cell.setPaddingTop(2f);
		cell.setPaddingBottom(2f);
		return cell;
	}
	
	private PdfPCell td_r(String str){
		PdfPCell cell = new PdfPCell(new Phrase(str, PdfStyle.P_FONT));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		cell.setPaddingTop(2f);
		cell.setPaddingBottom(2f);
		return cell;
	}
}