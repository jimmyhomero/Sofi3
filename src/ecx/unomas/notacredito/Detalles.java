package ecx.unomas.notacredito;

import java.util.Vector;

public class Detalles {
	private String codigoInterno;
	private String codigoAdicional="";
	private String descripcion;
	private Double cantidad;
	private Double precioUnitario;
	private Double descuento;
	private Double precioTotalSinImpuesto;
	private Vector<DetImpuestos> impuestos = new Vector<DetImpuestos>();
	private Vector<DetAdicional> detAdicionales = new Vector<DetAdicional>();
	
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
	
	public void setPrecioUnitario(Double precioUnitario){
		this.precioUnitario = precioUnitario;
	}
	public Double getPrecioUnitario(){
		return this.precioUnitario;
	}
	
	public void setDescuento(Double descuento){
		this.descuento = descuento;
	}
	public Double getDescuento(){
		return this.descuento;
	}
	
	public void setPrecioTotalSinImpuesto(Double precioTotalSinImpuesto){
		this.precioTotalSinImpuesto = precioTotalSinImpuesto;
	}
	public Double getPrecioTotalSinImpuesto(){
		return this.precioTotalSinImpuesto;
	}
	
	public void setImpuesto(Vector<DetImpuestos> impuestos){
		this.impuestos = impuestos;
	}
	public Vector<DetImpuestos> getImpuestos(){
		return this.impuestos;
	}
	
	public void setDetAdicional(Vector<DetAdicional> detAdicionales){
		this.detAdicionales = detAdicionales;
	}
	public Vector<DetAdicional> getDetAdicional(){
		return this.detAdicionales;
	}

}