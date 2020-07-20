package ecx.unomas.guiaremision;

import java.util.Vector;

public class DestinatariosDetalles {
	private String codigoInterno;
	private String codigoAdicional="";
	private String descripcion;
	private Double cantidad;
	private Vector<DestinatariosDetallesAdicional> detAdicionales = new Vector<DestinatariosDetallesAdicional>();
	
	public void setCodigoInterno(String codigoInterno){
		this.codigoInterno = codigoInterno;
	}
	public String getCodigoInterno(){
		return this.codigoInterno;
	}
	
	public void setCodigoAdicional(String codigoAdicional){
		this.codigoAdicional = codigoAdicional;
	}
	public String getCodigoAdicional(){
		return this.codigoAdicional;
	}
	
	public void setDescripcion(String descripcion){
		this.descripcion = descripcion;
	}
	public String getDescripcion(){
		return this.descripcion;
	}
	
	public void setCantidad(Double cantidad){
		this.cantidad = cantidad;
	}
	public Double getCantidad(){
		return this.cantidad;
	}
	
	public void setDetAdicional(Vector<DestinatariosDetallesAdicional> detAdicionales){
		this.detAdicionales = detAdicionales;
	}
	public Vector<DestinatariosDetallesAdicional> getDetAdicional(){
		return this.detAdicionales;
	}
	
}
