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

import ec.unomas.guiaremision.InfoAdicional;
import ec.unomas.service.Config;

public class GuiaRemision {
	public void generatePDF(ec.unomas.guiaremision.GuiaRemision guiaRemision, ServletOutputStream servletOutputStream) throws DocumentException, MalformedURLException, IOException{
		
		Document document = new Document(PageSize.A4, 20, 20, 30, 30);
    
		PdfWriter writer = null;
		if (servletOutputStream!=null)
			writer = PdfWriter.getInstance(document, servletOutputStream);
		else
			writer = PdfWriter.getInstance(document, new FileOutputStream(Config.AUTORIZADOS_DIR+guiaRemision.getClaveAcceso()+".pdf"));    
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
		
		PdfPCell ruc = new PdfPCell(new Phrase("RUC: "+guiaRemision.getRUC()));
		ruc.setBorder(Rectangle.NO_BORDER);
		ruc.setPaddingTop(5f);
		head_content.addCell(ruc);
		
		PdfPCell factura_text = new PdfPCell(new Phrase("GUIA DE REMISION", PdfStyle.TABLE_H1_FONT));
		factura_text.setBorder(Rectangle.NO_BORDER);
		factura_text.setPaddingTop(5f);
		head_content.addCell(factura_text);
		
		PdfPCell factura_nro = new PdfPCell(new Phrase("Nro. "+guiaRemision.getEstab()+"-"+guiaRemision.getPtoEmi()+"-"+guiaRemision.getSecuencia(), PdfStyle.TABLE_H3_FONT));
		factura_nro.setBorder(Rectangle.NO_BORDER);
		factura_nro.setPaddingTop(5f);
		head_content.addCell(factura_nro);
		
		PdfPCell nroAut_text = new PdfPCell(new Phrase("NOMERO DE AUTORIZACION", PdfStyle.TABLE_P_FONT));
		nroAut_text.setBorder(Rectangle.NO_BORDER);
		nroAut_text.setPaddingTop(5f);
		head_content.addCell(nroAut_text);
		
		PdfPCell nroAut_val = new PdfPCell(new Phrase(guiaRemision.getAuthNumber(), PdfStyle.TABLE_P_FONT));
		nroAut_val.setBorder(Rectangle.NO_BORDER);
		nroAut_val.setPaddingTop(5f);
		head_content.addCell(nroAut_val);
		
		PdfPCell fechaAut_text = new PdfPCell(new Phrase("FECHA Y HORA DE AUTORIZACION", PdfStyle.TABLE_P_FONT));
		fechaAut_text.setBorder(Rectangle.NO_BORDER);
		fechaAut_text.setPaddingTop(5f);
		head_content.addCell(fechaAut_text);
		
		PdfPCell fechaAut_val = new PdfPCell(new Phrase(guiaRemision.getAuthDate(), PdfStyle.TABLE_P_FONT));
		fechaAut_val.setBorder(Rectangle.NO_BORDER);
		fechaAut_val.setPaddingTop(5f);
		head_content.addCell(fechaAut_val);
		
		PdfPCell ambiente = new PdfPCell(new Phrase("AMBIENTE: "+guiaRemision.getAmbienteName(), PdfStyle.TABLE_P_FONT));
		ambiente.setBorder(Rectangle.NO_BORDER);
		ambiente.setPaddingTop(5f);
		head_content.addCell(ambiente);
		
		PdfPCell emision = new PdfPCell(new Phrase("EMISION: "+guiaRemision.getTipoEmisionName(), PdfStyle.TABLE_P_FONT));
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
	    code128.setCode(guiaRemision.getClaveAcceso());
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
		
		PdfPCell empresa = new PdfPCell(new Phrase(guiaRemision.getRazonSocial(), PdfStyle.TABLE_H2_FONT));
		empresa.setBorder(Rectangle.NO_BORDER);
		info_content.addCell(empresa);
		
		PdfPCell dirMatriz = new PdfPCell(new Phrase("Dir. Matriz: "+guiaRemision.getDirMatriz(), PdfStyle.P_FONT));
		dirMatriz.setBorder(Rectangle.NO_BORDER);
		info_content.addCell(dirMatriz);
		
		PdfPCell dirSucursal = new PdfPCell(new Phrase("Dir. Sucursal: "+guiaRemision.getDirEstablecimiento(), PdfStyle.P_FONT));
		dirSucursal.setBorder(Rectangle.NO_BORDER);
		info_content.addCell(dirSucursal);
		
		if (guiaRemision.getContribuyenteEspecial()>0){
			PdfPCell contribuyente = new PdfPCell(new Phrase("Contribuyente Especial Nro. "+guiaRemision.getContribuyenteEspecial(), PdfStyle.P_FONT));
			contribuyente.setBorder(Rectangle.NO_BORDER);
			info_content.addCell(contribuyente);
		}
		
		PdfPCell obligadoConta = new PdfPCell(new Phrase("OBLIGADO A LLEVAR CONTABILIDAD: "+guiaRemision.getObligadoContabilidad(), PdfStyle.P_FONT));
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
		
		PdfPTable transportistaInfoWrapper = new PdfPTable(1);
		transportistaInfoWrapper.setWidthPercentage(100);
		transportistaInfoWrapper.setSpacingAfter(5f);
		
		// INFO TRANSPORTISTA
		PdfPTable transportistaInfo_t = new PdfPTable(2);
		transportistaInfo_t.setWidthPercentage(100);
		transportistaInfo_t.setWidths(new float[]{0.5f, 0.5f});
	    
		// IDENTIFICACION TRANSPORTISTA
	    PdfPCell rucTransportista = new PdfPCell(new Phrase("IdentificaciOn (Transportista): ", PdfStyle.P_FONT));
	    rucTransportista.setBorder(Rectangle.NO_BORDER);
	    transportistaInfo_t.addCell(rucTransportista);
	    
	    PdfPCell rucTransportista_t = new PdfPCell(new Phrase(guiaRemision.getRucTransportista(), PdfStyle.P_FONT));
	    rucTransportista_t.setBorder(Rectangle.NO_BORDER);
	    transportistaInfo_t.addCell(rucTransportista_t);
	    
	    // RAZON SOCIAL TRANSPORTISTA
	    PdfPCell razonSocial = new PdfPCell(new Phrase("RazOn Social / Nombres y Apellidos: ", PdfStyle.P_FONT));
	    razonSocial.setBorder(Rectangle.NO_BORDER);
	    transportistaInfo_t.addCell(razonSocial);
	    
	    PdfPCell razonSocial_t = new PdfPCell(new Phrase(guiaRemision.getRazonSocialTransportista(), PdfStyle.P_FONT));
	    razonSocial_t.setBorder(Rectangle.NO_BORDER);
	    transportistaInfo_t.addCell(razonSocial_t);
	    
	    // PLACA
	    PdfPCell placa = new PdfPCell(new Phrase("Placa: ", PdfStyle.P_FONT));
	    placa.setBorder(Rectangle.NO_BORDER);
	    transportistaInfo_t.addCell(placa);
	    
	    PdfPCell placa_t = new PdfPCell(new Phrase(guiaRemision.getPlaca(), PdfStyle.P_FONT));
	    placa_t.setBorder(Rectangle.NO_BORDER);
	    transportistaInfo_t.addCell(placa_t);
	    
	    // PUNTO DE PARTIDA
	    PdfPCell ptoPartida = new PdfPCell(new Phrase("Punto de Partida: ", PdfStyle.P_FONT));
	    ptoPartida.setBorder(Rectangle.NO_BORDER);
	    transportistaInfo_t.addCell(ptoPartida);
	    
	    PdfPCell ptoPartida_ = new PdfPCell(new Phrase(guiaRemision.getDirPartida(), PdfStyle.P_FONT));
	    ptoPartida_.setBorder(Rectangle.NO_BORDER);
	    transportistaInfo_t.addCell(ptoPartida_);
	    
	    // FECHA INICIO TRANSPORTE
	    PdfPCell fechaIniTransporte = new PdfPCell(new Phrase("Fecha inicio Transporte:              "+guiaRemision.getFechaIniTransporte(), PdfStyle.P_FONT));
	    fechaIniTransporte.setBorder(Rectangle.NO_BORDER);
	    transportistaInfo_t.addCell(fechaIniTransporte);
	    
	    // FECHA FIN TRANSPORTE
	    PdfPCell fechaFinTransporte = new PdfPCell(new Phrase("Fecha fin Transporte:              "+guiaRemision.getFechaFinTransporte(), PdfStyle.P_FONT));
	    fechaFinTransporte.setBorder(Rectangle.NO_BORDER);
	    transportistaInfo_t.addCell(fechaFinTransporte);
	    
	    // INFO TRANSPORTISTA / BRACKGROUND
		PdfPCell transportista_cell = new PdfPCell(transportistaInfo_t);
		transportista_cell.setCellEvent(all_radius);
		transportista_cell.setBorder(Rectangle.NO_BORDER);
		transportista_cell.setPadding(5f);
		
		transportistaInfoWrapper.addCell(transportista_cell);
		
	    document.add(transportistaInfoWrapper);
	    
	    Vector<ec.unomas.guiaremision.Destinatarios> destinatarios = guiaRemision.getDestinatarios();
	    for (int i=0; i< destinatarios.size(); i++){
		    
		    // DESTINATARIOS
		    PdfPTable destinatariosWrapper = new PdfPTable(1);
		    destinatariosWrapper.setWidthPercentage(100);
		    destinatariosWrapper.setSpacingBefore(0f);
		    destinatariosWrapper.setSpacingAfter(0f);
		    
		    PdfPTable destinatariosBG = new PdfPTable(1);
		    destinatariosBG.setWidthPercentage(100);
		    destinatariosBG.setSpacingBefore(0f);
		    destinatariosBG.setSpacingAfter(0f);
		    
		    // DESTINATARIO
		    PdfPTable destino_t = new PdfPTable(3);
		    destino_t.setWidthPercentage(100f);
		    destino_t.setWidths(new float[]{1f, 1f, 1f});
		    
		    int foo2 = 0;
		    // COMPROBANTE DE VENTA
		    if (!destinatarios.get(i).getNumDocSustento().equals("")){
			    PdfPCell comprobante_t = new PdfPCell(new Phrase("Comprobante de Venta", PdfStyle.P_FONT));
			    comprobante_t.setBorder(Rectangle.NO_BORDER);
			    destino_t.addCell(comprobante_t);
			    
			    PdfPCell comprobante = new PdfPCell(new Phrase(destinatarios.get(i).getCodDocSustentoName()+"     "+destinatarios.get(i).getNumDocSustento(), PdfStyle.P_FONT));
			    comprobante.setBorder(Rectangle.NO_BORDER);
			    destino_t.addCell(comprobante);
			    foo2 = 1;
		    }
		    
		    // FECHA DE EMISION
		    if (!destinatarios.get(i).getFechaEmisionDocSustento().equals("")){
			    PdfPCell fechaEmision = new PdfPCell(new Phrase("Fecha de EmisiOn:     "+destinatarios.get(i).getFechaEmisionDocSustento(), PdfStyle.P_FONT));
			    fechaEmision.setBorder(Rectangle.NO_BORDER);
			    destino_t.addCell(fechaEmision);
			    foo2 = 2;
		    }
		    
		    // NUMERO DE AUTORIZACION
		    if (!destinatarios.get(i).getNumAutDocSustento().equals("")){
			    PdfPCell nroAutorizacino_t = new PdfPCell(new Phrase("NOmero de AutorizaciOn:", PdfStyle.P_FONT));
			    nroAutorizacino_t.setBorder(Rectangle.NO_BORDER);
			    destino_t.addCell(nroAutorizacino_t);
			    
			    PdfPCell nroAutorizacino = new PdfPCell(new Phrase(destinatarios.get(i).getNumAutDocSustento(), PdfStyle.P_FONT));
			    nroAutorizacino.setBorder(Rectangle.NO_BORDER);
			    destino_t.addCell(nroAutorizacino);
			    foo2 = 3;
		    }
		    PdfPCell blanco = new PdfPCell(new Phrase(" ", PdfStyle.P_FONT));
		    blanco.setBorder(Rectangle.NO_BORDER);
		    if (foo2>0){
			    destino_t.addCell(blanco);
			    destino_t.addCell(blanco);
			    destino_t.addCell(blanco);
			    destino_t.addCell(blanco);
		    }
		    // MOTIVO TRASLADO
		    PdfPCell motivoTraslado_t = new PdfPCell(new Phrase("Motivo Traslado:", PdfStyle.P_FONT));
		    motivoTraslado_t.setBorder(Rectangle.NO_BORDER);
		    destino_t.addCell(motivoTraslado_t);
		    
		    PdfPCell motivoTraslado = new PdfPCell(new Phrase(destinatarios.get(i).getMotivoTraslado(), PdfStyle.P_FONT));
		    motivoTraslado.setBorder(Rectangle.NO_BORDER);
		    destino_t.addCell(motivoTraslado);
		    
		    destino_t.addCell(blanco);
		    
		    // DESTINO
		    PdfPCell ptoLlegada_t = new PdfPCell(new Phrase("Destino (Punto de llegada):", PdfStyle.P_FONT));
		    ptoLlegada_t.setBorder(Rectangle.NO_BORDER);
		    destino_t.addCell(ptoLlegada_t);
		    
		    PdfPCell ptoLlegada = new PdfPCell(new Phrase(destinatarios.get(i).getDirDestinatario(), PdfStyle.P_FONT));
		    ptoLlegada.setBorder(Rectangle.NO_BORDER);
		    destino_t.addCell(ptoLlegada);
		    
		    destino_t.addCell(blanco);
		    
		    // IDENTIFICACION DESTINATARIO
		    PdfPCell idDestinatario_t = new PdfPCell(new Phrase("IdentificaciOn (Destinatario):", PdfStyle.P_FONT));
		    idDestinatario_t.setBorder(Rectangle.NO_BORDER);
		    destino_t.addCell(idDestinatario_t);
		    
		    PdfPCell idDestinatario = new PdfPCell(new Phrase(destinatarios.get(i).getIdentificacionDestinatario(), PdfStyle.P_FONT));
		    idDestinatario.setBorder(Rectangle.NO_BORDER);
		    destino_t.addCell(idDestinatario);
		    
		    destino_t.addCell(blanco);
		    
		    // RAZON SOCIAL DESTINATARIO
		    PdfPCell razonSocialDestinatario_t = new PdfPCell(new Phrase("RazOn Social / Nombres Apellidos:", PdfStyle.P_FONT));
		    razonSocialDestinatario_t.setBorder(Rectangle.NO_BORDER);
		    destino_t.addCell(razonSocialDestinatario_t);
		    
		    PdfPCell razonSocialDestinatario = new PdfPCell(new Phrase(destinatarios.get(i).getRazonSocialDestinatario(), PdfStyle.P_FONT));
		    razonSocialDestinatario.setBorder(Rectangle.NO_BORDER);
		    destino_t.addCell(razonSocialDestinatario);
		    
		    destino_t.addCell(blanco);
		    
		    // DOCUMENTO ADUANERO
		    PdfPCell documentoAduanero_t = new PdfPCell(new Phrase("Documento Aduanero:", PdfStyle.P_FONT));
		    documentoAduanero_t.setBorder(Rectangle.NO_BORDER);
		    destino_t.addCell(documentoAduanero_t);
		    
		    PdfPCell documentoAduanero = new PdfPCell(new Phrase(destinatarios.get(i).getDocAduaneroUnico(), PdfStyle.P_FONT));
		    documentoAduanero.setBorder(Rectangle.NO_BORDER);
		    destino_t.addCell(documentoAduanero);
		    
		    destino_t.addCell(blanco);
		    
		    // CODIGO ESTABLECIMIENTO DESTINO
		    PdfPCell codEstDestino_t = new PdfPCell(new Phrase("COdigo Establecimiento Destino:", PdfStyle.P_FONT));
		    codEstDestino_t.setBorder(Rectangle.NO_BORDER);
		    destino_t.addCell(codEstDestino_t);
		    
		    PdfPCell codEstDestino = new PdfPCell(new Phrase(destinatarios.get(i).getCodEstabDestino(), PdfStyle.P_FONT));
		    codEstDestino.setBorder(Rectangle.NO_BORDER);
		    destino_t.addCell(codEstDestino);
		    
		    destino_t.addCell(blanco);
		    
		    destino_t.addCell(blanco);
		    destino_t.addCell(blanco);
		    destino_t.addCell(blanco);
	    
	    	// DETALLES TABLE
			PdfPTable detalles_t = new PdfPTable(4);
			detalles_t.setWidthPercentage(80f);
			detalles_t.setWidths(new float[]{1f, 1f, 1f, 1f});
		    
		    // COMPROBANTE
		    PdfPCell cantidad_th = new PdfPCell(new Phrase("Cantidad", PdfStyle.BOLD_FONT));
		    cantidad_th.setBorder(Rectangle.NO_BORDER);
		    cantidad_th.setHorizontalAlignment(Element.ALIGN_CENTER);
		    cantidad_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    detalles_t.addCell(cantidad_th);
		    
		    // NOMERO
		    PdfPCell descripcion_th = new PdfPCell(new Phrase("DescripciOn", PdfStyle.BOLD_FONT));
		    descripcion_th.setBorder(Rectangle.NO_BORDER);
		    descripcion_th.setHorizontalAlignment(Element.ALIGN_CENTER);
		    descripcion_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    detalles_t.addCell(descripcion_th);
		    
		    // FECHA EMISION
		    PdfPCell codigoPrincipal_th = new PdfPCell(new Phrase("COdigo Principal", PdfStyle.BOLD_FONT));
		    codigoPrincipal_th.setBorder(Rectangle.NO_BORDER);
		    codigoPrincipal_th.setHorizontalAlignment(Element.ALIGN_CENTER);
		    codigoPrincipal_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    detalles_t.addCell(codigoPrincipal_th);
		    
			// EJERCICIO FISCAL
		    PdfPCell codigoAuxiliar_th = new PdfPCell(new Phrase("COdigo Auxiliar", PdfStyle.BOLD_FONT));
		    codigoAuxiliar_th.setBorder(Rectangle.NO_BORDER);
		    codigoAuxiliar_th.setHorizontalAlignment(Element.ALIGN_CENTER);
		    codigoAuxiliar_th.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    detalles_t.addCell(codigoAuxiliar_th);
		    
		    Vector<ec.unomas.guiaremision.DestinatariosDetalles> destDetalles = destinatarios.get(i).getDetalle();
		    for (int j=0; j<destDetalles.size(); j++){
		    	detalles_t.addCell(td_c7(String.valueOf(destDetalles.get(j).getCantidad())));
		    	detalles_t.addCell(td_c7(String.valueOf(destDetalles.get(j).getDescripcion())));
		    	detalles_t.addCell(td_c7(String.valueOf(destDetalles.get(j).getCodigoInterno())));
		    	detalles_t.addCell(td_c7(String.valueOf(destDetalles.get(j).getCodigoAdicional())));
		    }
		    
		    // DESTINATARIO BRACKGROUND
		    PdfPCell destinatario_gb = new PdfPCell(destino_t);
		    destinatario_gb.setBorder(Rectangle.NO_BORDER);
		    
		    destinatariosBG.addCell(destinatario_gb);
		    
		    // DETALLES BRACKGROUND
		    PdfPCell detalles_gb = new PdfPCell(detalles_t);
		    detalles_gb.setPadding(10f);
		    
		    destinatariosBG.addCell(detalles_gb);
		    
		    PdfPCell destinatarioCell = new PdfPCell(destinatariosBG);
		    destinatarioCell.setBorder(Rectangle.NO_BORDER);
		    destinatarioCell.setCellEvent(all_radius);
		    destinatarioCell.setPadding(10f);
		    
		    destinatariosWrapper.addCell(destinatarioCell);
		    document.add(destinatariosWrapper);
	    }
	    
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
	    
	    Vector<InfoAdicional> infoAdicional = guiaRemision.getInfoAdicional();
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
