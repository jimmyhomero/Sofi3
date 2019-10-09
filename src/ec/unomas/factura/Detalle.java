package ec.unomas.factura;

import java.util.Vector;

public class Detalle {
	private String codigoPrincipal;
	private String codigoSecundario="";
	private String descripcion;
	private Double cantidad;
	private Double precioUnitario;
	private Double descuento;
	private Double precioTotalSinImpuesto;
	private Vector<Impuesto> impuestos = new Vector<Impuesto>();
	private Vector<DetAdicional> detAdicionales = new Vector<DetAdicional>(); 
	
	public void setCodigoPrincipal(String codigoPrincipal){
		this.codigoPrincipal = codigoPrincipal;
	}
	public String getCodigoPrincipal(){
		return this.codigoPrincipal;
	}
	
	public void setCodigoSecundario(String codigoSecundario){
		this.codigoSecundario = codigoSecundario;
	}
	public String getCodigoSecundario(){
		return this.codigoSecundario;
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
	
	public void setImpuesto(Vector<Impuesto> impuestos){
		this.impuestos = impuestos;
	}
	public Vector<Impuesto> getImpuestos(){
		return this.impuestos;
	}
	
	public void setDetAdicional(Vector<DetAdicional> detAdicionales){
		this.detAdicionales = detAdicionales;
	}
	public Vector<DetAdicional> getDetAdicional(){
		return this.detAdicionales;
	}
	
}
