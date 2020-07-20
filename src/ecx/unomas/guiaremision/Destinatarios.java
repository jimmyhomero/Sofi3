package ecx.unomas.guiaremision;

import java.util.Vector;

public class Destinatarios {
	private String identificacionDestinatario;
	private String razonSocialDestinatario;
	private String dirDestinatario;
	private String motivoTraslado;
	private String docAduaneroUnico="";
	private String codEstabDestino="";
	private String ruta="";
	private String codDocSustento="";
	private String codDocSustentoName="";
	private String numDocSustento="";
	private String numAutDocSustento="";
	private String fechaEmisionDocSustento="";
	private Vector<DestinatariosDetalles> detalles = new Vector<DestinatariosDetalles>();
	
	public void setIdentificacionDestinatario(String identificacionDestinatario){
		this.identificacionDestinatario = identificacionDestinatario;
	}
	public String getIdentificacionDestinatario(){
		return this.identificacionDestinatario;
	}
	
	public void setRazonSocialDestinatario(String razonSocialDestinatario){
		this.razonSocialDestinatario = razonSocialDestinatario;
	}
	public String getRazonSocialDestinatario(){
		return this.razonSocialDestinatario;
	}
	
	public void setDirDestinatario(String dirDestinatario){
		this.dirDestinatario = dirDestinatario;
	}
	public String getDirDestinatario(){
		return this.dirDestinatario;
	}
	
	public void setMotivoTraslado(String motivoTraslado){
		this.motivoTraslado = motivoTraslado;
	}
	public String getMotivoTraslado(){
		return this.motivoTraslado;
	}
	
	public void setDocAduaneroUnico(String docAduaneroUnico){
		this.docAduaneroUnico = docAduaneroUnico;
	}
	public String getDocAduaneroUnico(){
		return this.docAduaneroUnico;
	}
	
	public void setCodEstabDestino(String codEstabDestino){
		this.codEstabDestino = codEstabDestino;
	}
	public String getCodEstabDestino(){
		return this.codEstabDestino;
	}
	
	public void setRuta(String ruta){
		this.ruta = ruta;
	}
	public String getRuta(){
		return this.ruta;
	}
	
	public void setCodDocSustento(String codDocSustento){
		this.codDocSustento = codDocSustento;
	}
	public String getCodDocSustento(){
		return this.codDocSustento;
	}
	
	public void setCodDocSustentoName(String codDocSustentoName){
		this.codDocSustentoName = codDocSustentoName;
	}
	public String getCodDocSustentoName(){
		String docName="";
		if (this.codDocSustento.equals("01"))
			docName = "FACTURA";
		else if (this.codDocSustento.equals("04"))
			docName = "NOTA DE CREDITO";
		else if (this.codDocSustento.equals("05"))
			docName = "NOTA DE DEBITO";
		else if (this.codDocSustento.equals("06"))
			docName = "GUIA DE REMISION";
		else if (this.codDocSustento.equals("07"))
			docName = "COMPROBANTE DE RETENCION";
		return docName;
	}
	
	public void setNumDocSustento(String numDocSustento){
		this.numDocSustento = numDocSustento;
	}
	public String getNumDocSustento(){
		return this.numDocSustento;
	}
	
	public void setNumAutDocSustento(String numAutDocSustento){
		this.numAutDocSustento = numAutDocSustento;
	}
	public String getNumAutDocSustento(){
		return this.numAutDocSustento;
	}
	
	public void setFechaEmisionDocSustento(String fechaEmisionDocSustento){
		this.fechaEmisionDocSustento = fechaEmisionDocSustento;
	}
	public String getFechaEmisionDocSustento(){
		return this.fechaEmisionDocSustento;
	}
	
	public void setDetalle(Vector<DestinatariosDetalles> detalles){
		this.detalles = detalles;
	}
	public Vector<DestinatariosDetalles> getDetalle(){
		return this.detalles;
	}
	
}
