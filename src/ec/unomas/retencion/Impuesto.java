package ec.unomas.retencion;

public class Impuesto {
	private int codigo;
	private String codigoRetencion;
	private String codigoRetencionName;
	private Double baseImponible;
	private int porcentajeRetener;
	private double valorRetenido;
	private String codDocSustento;
	private String numDocSustento;
	private String fechaEmisionDocSustento;
	
	public void setCodigo(int codigo){
		this.codigo = codigo;
	}
	public int getCodigo(){
		return this.codigo;
	}
	
	public void setCodigoRetencion(String codigoRetencion){
		this.codigoRetencion = codigoRetencion;
	}
	public String getCodigoRetencion(){
		return this.codigoRetencion;
	}
	
	public void setCodigoRetencionName(String codigoRetencionName){
		this.codigoRetencionName = codigoRetencionName;
	}
	public String getCodigoRetencionName(){
		String name = "";
		if (this.codigo==1){
			name = "RENTA";
		}else if (this.codigo==2){
			name = "IVA";
		}else if (this.codigo==6){
			name = "ISD";
		}
		return name;
	}
	
	public void setBaseImponible(Double baseImponible){
		this.baseImponible = baseImponible;
	}
	public Double getBaseImponible(){
		return this.baseImponible;
	}
	
	public void setPorcentajeRetener(int porcentajeRetener){
		this.porcentajeRetener = porcentajeRetener;
	}
	public int getPorcentajeRetener(){
		return this.porcentajeRetener;
	}
	
	public void setValorRetenido(Double valorRetenido){
		this.valorRetenido = valorRetenido;
	}
	public Double getValorRetenido(){
		return this.valorRetenido;
	}
	
	public void setCodDocSustento(String codDocSustento){
		this.codDocSustento = codDocSustento;
	}
	public String getCodDocSustento(){
		return this.codDocSustento;
	}
	
	public void setNumDocSustento(String numDocSustento){
		this.numDocSustento = numDocSustento;
	}
	public String getNumDocSustento(){
		return this.numDocSustento;
	}
	
	public void setFechaEmisionDocSustento(String fechaEmisionDocSustento){
		this.fechaEmisionDocSustento = fechaEmisionDocSustento;
	}
	public String getFechaEmisionDocSustento(){
		return this.fechaEmisionDocSustento;
	}

}
