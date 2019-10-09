package ec.unomas.factura;

public class Pago {
	private String formaPago;
	private Double total;
	private int plazo;
	private String unidadTiempo;
	
	public String getFormaPago() {
		if (formaPago.equals("01")){
			return "SIN UTILIZACION DEL SISTEMA FINANCIERO";
		}else if (formaPago.equals("16")){
			return "TARJETA DE DEBITO";
		}else if (formaPago.equals("17")){
			return "DINERO ELECTRONICO";
		}else if (formaPago.equals("18")){
			return "TARJETA PREPAGO";
		}else if (formaPago.equals("19")){
			return "TARJETA DE CREDITO";
		}else if (formaPago.equals("20")){
			return "OTROS CON UTILIZACION DEL SISTEMA FINANCIERO";
		}else if (formaPago.equals("21")){
			return "ENDOSO DE TITULOS";
		}
		return formaPago;
	}
	public void setFormaPago(String formaPago) {
		this.formaPago = formaPago;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public int getPlazo() {
		return plazo;
	}
	public void setPlazo(int plazo) {
		this.plazo = plazo;
	}
	public String getUnidadTiempo() {
		return unidadTiempo;
	}
	public void setUnidadTiempo(String unidadTiempo) {
		this.unidadTiempo = unidadTiempo;
	}
	
	
}
