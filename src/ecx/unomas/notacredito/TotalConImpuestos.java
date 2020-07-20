package ecx.unomas.notacredito;

public class TotalConImpuestos {
	private int codigo;
	private int codigoPorcentaje;
	private Double baseImponible;
	private Double valor;
	
	public void setCodigo(int codigo){
		this.codigo = codigo;
	}
	public int getCodigo(){
		return this.codigo;
	}
	
	public void setCodigoPorcentaje(int codigoPorcentaje){
		this.codigoPorcentaje = codigoPorcentaje;
	}
	public int getCodigoPorcentaje(){
		return this.codigoPorcentaje;
	}
	
	public void setBaseImponible(Double baseImponible){
		this.baseImponible = baseImponible;
	}
	public Double getBaseImponible(){
		return this.baseImponible;
	}
	
	public void setValor(Double valor){
		this.valor = valor;
	}
	public Double getValor(){
		return this.valor;
	}

}