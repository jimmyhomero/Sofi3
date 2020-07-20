package ecx.unomas.notacredito;

import java.net.UnknownHostException;
import java.sql.SQLException;
import java.util.Vector;

import ecx.unomas.elements.ArchivoUtil;

public class NotaCredito {
	private int id;
	private String authNumber;
	private String authDate;
	private int ambiente;
	private String ambienteName;
	private int tipoEmision;
	private String tipoEmisionName;
	private String razonSocial;
	private String nombreComercial;
	private String ruc;
	private String claveAcceso;
	private String codDoc;
	private String estab;
	private String ptoEmi;
	private String secuencia;
	private String dirMatriz;
	private String fechaEmision;
	private String dirEstablecimiento;
	private String tipoIdentificacionComprador;
	private String razonSocialComprador;
	private String identificacionComprador;
	private String contribuyenteEspecial;
	private String obligadoContabilidad;
	private String rise;
	private String codDocModificado;
	private String codDocModificadoName;
	private String numDocModificado;
	private String fechaEmisionDocSustento;
	private Double totalSinImpuestos;
	private Double totalDescuento;
	private Double valorModificacion;
	private String moneda;
	private Vector<TotalConImpuestos> totalConImpuestos = new Vector<TotalConImpuestos>();
	private Double propina;
	private Double importeTotal;
	private String motivo;
	private String estado;
	
	private Vector<Detalles> detalles = new Vector<Detalles>();
	private Vector<InfoAdicional> infoAdicional = new Vector<InfoAdicional>();
	
	public NotaCredito(){
		this.nombreComercial = "";
		this.contribuyenteEspecial ="";
		this.authNumber = "";
		this.authDate = "2015-01-01 00:00:00";
		this.estado = "GENERADO";
		this.rise = "";
		this.totalDescuento = 0.0;
		this.propina = 0.0;
		this.importeTotal = 0.0;
		this.moneda = "DOLAR";
	}
	
	public void setID(int id){
		this.id = id;
	}
	public int getID(){
		return this.id;
	}
	
	public void setAuthNumber(String authNumber){
		this.authNumber = authNumber;
	}
	public String getAuthNumber(){
		return this.authNumber;
	}
	
	public void setAuthDate(String authDate){
		this.authDate = authDate;
	}
	public String getAuthDate(){
		return this.authDate;
	}
	
	public void setAmbiente(int ambiente){
		this.ambiente = ambiente;
	}
	
	public void setAmbienteName(String name){
		this.ambienteName = name;
	}
	
	public String getAmbienteName(){
		return this.ambiente==1? "PRUEBAS":"PRODUCCION";
	}
	
	public void setTipoEmision(int tipoEmision){
		this.tipoEmision = tipoEmision;
	}
	public int getTipoEmision(){
		return this.tipoEmision;
	}
	
	public void setTipoEmisionName(String name){
		this.tipoEmisionName = name;
	}
	public String getTipoEmisionName(){
		return this.tipoEmision==1? "NORMAL":"";
	}
	
	public void setRazonSocial(String razonSocial){
		this.razonSocial = razonSocial;
	}
	public String getRazonSocial(){
		return this.razonSocial;
	}
	
	public void setNombreComercial(String nombreComercial){
		this.nombreComercial = nombreComercial;
	}
	public String getNombreComercial(){
		return this.nombreComercial;
	}
	
	public void setRUC(String ruc){
		this.ruc = ruc;
	}
	public String getRUC(){
		return this.ruc;
	}
	
	public void setClaveAcceso(String claveAcceso){
		this.claveAcceso = claveAcceso;
	}
	public String getClaveAcceso(){
		return this.claveAcceso;
	}
	
	public void setCodDoc(String codDoc){
		this.codDoc = codDoc;
	}
	public String getCodDoc(){
		return this.codDoc;
	}
	
	public void setEstab(String estab){
		this.estab = estab;
	}
	public String getEstab(){
		return this.estab;
	}
	
	public void setPtoEmi(String ptoEmi){
		this.ptoEmi = ptoEmi;
	}
	public String getPtoEmi(){
		return this.ptoEmi;
	}
	
	public void setSecuencia(String secuencia){
		this.secuencia = secuencia;
	}
	public String getSecuencia(){
		return this.secuencia;
	}
	
	public void setDirMatriz(String dirMatriz){
		this.dirMatriz = dirMatriz;
	}
	public String getDirMatriz(){
		return this.dirMatriz;
	}
	
	public void setFechaEmision(String fechaEmision){
		this.fechaEmision = fechaEmision;
	}
	public String getFechaEmision(){
		return this.fechaEmision;
	}
	
	public void setDirEstablecimiento(String dirEstablecimiento){
		this.dirEstablecimiento = dirEstablecimiento;
	}
	public String getDirEstablecimiento(){
		return this.dirEstablecimiento;
	}
	
	public void setTipoIdentificacionComprador(String tipoIdentificacionComprador){
		this.tipoIdentificacionComprador = tipoIdentificacionComprador;
	}
	public String getTipoIdentificacionComprador(){
		return this.tipoIdentificacionComprador;
	}
	
	public void setRazonSocialComprador(String razonSocialComprador){
		this.razonSocialComprador = razonSocialComprador;
	}
	public String getRazonSocialComprador(){
		return this.razonSocialComprador;
	}
	
	public void setIdentificacionComprador(String identificacionComprador){
		this.identificacionComprador = identificacionComprador;
	}
	public String getIdentificacionComprador(){
		return this.identificacionComprador;
	}
	
	public void setContribuyenteEspecial(String contribuyenteEspecial){
		this.contribuyenteEspecial = contribuyenteEspecial;
	}
	public String getContribuyenteEspecial(){
		return this.contribuyenteEspecial;
	}
	
	public void setObligadoContabilidad(String obligadoContabilidad){
		this.obligadoContabilidad = obligadoContabilidad;
	}
	public String getObligadoContabilidad(){
		return this.obligadoContabilidad;
	}
	
	public void setRISE(String rise){
		this.rise = rise;
	}
	public String getRISE(){
		return this.rise;
	}
	
	public void setCodDocModificado(String codDocModificado){
		this.codDocModificado = codDocModificado;
	}
	public String getCodDocModificado(){
		return this.codDocModificado;
	}
	
	public void setCodDocModificadoName(String codDocModificadoName){
		this.codDocModificadoName = codDocModificadoName;
	}
	public String getCodDocModificadoName(){
		if (this.codDocModificado.equals("01")) return "FACTURA";
		else if (this.codDocModificado.equals("04")) return "NOTA DE CREDITO";
		else if (this.codDocModificado.equals("05")) return "NOTA DE DEBITO";
		else if (this.codDocModificado.equals("06")) return "GUIA DE REMISION";
		else if (this.codDocModificado.equals("07")) return "COMPROBANTE DE RETENCION";
		else return "";
	}
	
	public void setNumDocModificado(String numDocModificado){
		this.numDocModificado = numDocModificado;
	}
	public String getNumDocModificado(){
		return this.numDocModificado;
	}
	
	public void setFechaEmisionDocSustento(String fechaEmisionDocSustento){
		this.fechaEmisionDocSustento = fechaEmisionDocSustento;
	}
	public String getFechaEmisionDocSustento(){
		return this.fechaEmisionDocSustento;
	}
	
	public void setTotalSinImpuestos(Double totalSinImpuestos){
		this.totalSinImpuestos = totalSinImpuestos;
	}
	public Double getTotalSinImpuestos(){
		return this.totalSinImpuestos;
	}
	
	public void setTotalDescuento(Double totalDescuento){
		this.totalDescuento = totalDescuento;
	}
	public Double getTotalDescuento(){
		return this.totalDescuento;
	}
	
	public void setValorModificacion(Double valorModificacion){
		this.valorModificacion = valorModificacion;
	}
	public Double getValorModificacion(){
		return this.valorModificacion;
	}
	
	public void setPropina(Double propina){
		this.propina = propina;
	}
	public Double getPropina(){
		return this.propina;
	}
	
	public void setImporteTotal(Double importeTotal){
		this.importeTotal = importeTotal;
	}
	public Double getImporteTotal(){
		this.importeTotal = this.getTotalSinImpuestos() + this.getICE() + this.getIRBPNR() + this.getIVA() + this.getPropina();
		return this.importeTotal;
	}
	
	public void setMoneda(String moneda){
		this.moneda = moneda;
	}
	public String getMoneda(){
		return this.moneda;
	}
	
	public void setTotalConImpuesto(TotalConImpuestos totalConImpuesto){
		this.totalConImpuestos.add(totalConImpuesto);
	}
	public Vector<TotalConImpuestos> getTotalConImpuestos(){
		return this.totalConImpuestos;
	}
	
	public void setMotivo(String motivo){
		this.motivo = motivo;
	}
	public String getMotivo(){
		return this.motivo;
	}
	
	public void setEstado(String estado){
		this.estado = estado;
	}
	public String getEstado(){
		return this.estado;
	}
	
	public void setDetalle(Detalles detalle){
		this.detalles.add(detalle);
	}
	public Vector<Detalles> getDetalles(){
		return this.detalles;
	}
	
	public void setInfAdicional(InfoAdicional infoAdicional){
		this.infoAdicional.add(infoAdicional);
	}
	
	public Vector<InfoAdicional> getInfoAdicional(){
		return this.infoAdicional;
	}

	public String getXML(){
		String respuesta = "";
		respuesta += "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
		respuesta += System.getProperty("line.separator");
        respuesta += "<notaCredito id=\"comprobante\" version=\"1.0.0\">";
        respuesta += System.getProperty("line.separator");
        respuesta += "  <infoTributaria>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <ambiente>"+this.ambiente+"</ambiente>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <tipoEmision>"+this.tipoEmision+"</tipoEmision>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <razonSocial>"+ArchivoUtil.parsear(this.razonSocial)+"</razonSocial>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <nombreComercial>"+ArchivoUtil.parsear(this.nombreComercial)+"</nombreComercial>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <ruc>"+this.ruc+"</ruc>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <claveAcceso>"+this.claveAcceso+"</claveAcceso>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <codDoc>"+this.codDoc+"</codDoc>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <estab>"+this.estab+"</estab>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <ptoEmi>"+this.ptoEmi+"</ptoEmi>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <secuencial>"+this.secuencia+"</secuencial>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <dirMatriz>"+ArchivoUtil.parsear(this.dirMatriz)+"</dirMatriz>";
        respuesta += System.getProperty("line.separator");
        respuesta += "  </infoTributaria>";
        respuesta += System.getProperty("line.separator");
        respuesta += "  <infoNotaCredito>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <fechaEmision>"+this.fechaEmision+"</fechaEmision>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <dirEstablecimiento>"+ArchivoUtil.parsear(this.dirEstablecimiento)+"</dirEstablecimiento>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <tipoIdentificacionComprador>"+this.tipoIdentificacionComprador+"</tipoIdentificacionComprador>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <razonSocialComprador>"+ArchivoUtil.parsear(this.razonSocialComprador)+"</razonSocialComprador>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <identificacionComprador>"+this.identificacionComprador+"</identificacionComprador>";
        respuesta += System.getProperty("line.separator");
        if (!this.contribuyenteEspecial.isEmpty()){
        	respuesta += "    <contribuyenteEspecial>"+this.contribuyenteEspecial+"</contribuyenteEspecial>";
            respuesta += System.getProperty("line.separator");
        }
        respuesta += "    <obligadoContabilidad>"+this.obligadoContabilidad+"</obligadoContabilidad>";
        respuesta += System.getProperty("line.separator");
        if (!this.rise.equals("")){
        	respuesta += "    <rise>"+this.rise+"</rise>";
        	respuesta += System.getProperty("line.separator");
        }
        respuesta += "    <codDocModificado>"+this.codDocModificado+"</codDocModificado>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <numDocModificado>"+this.numDocModificado+"</numDocModificado>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <fechaEmisionDocSustento>"+this.fechaEmisionDocSustento+"</fechaEmisionDocSustento>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <totalSinImpuestos>"+this.totalSinImpuestos+"</totalSinImpuestos>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <valorModificacion>"+this.valorModificacion+"</valorModificacion>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <moneda>"+this.moneda+"</moneda>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <totalConImpuestos>";
        respuesta += System.getProperty("line.separator");
        Vector<TotalConImpuestos> totalImpuestos = this.getTotalConImpuestos();
        for (int i=0; i<totalImpuestos.size(); i++){
	        respuesta += "      <totalImpuesto>";
	        respuesta += System.getProperty("line.separator");
	        respuesta += "        <codigo>"+totalImpuestos.get(i).getCodigo()+"</codigo>";
	        respuesta += System.getProperty("line.separator");
	        respuesta += "        <codigoPorcentaje>"+totalImpuestos.get(i).getCodigoPorcentaje()+"</codigoPorcentaje>";
	        respuesta += System.getProperty("line.separator");
	        respuesta += "        <baseImponible>"+totalImpuestos.get(i).getBaseImponible()+"</baseImponible>";
	        respuesta += System.getProperty("line.separator");
	        respuesta += "        <valor>"+totalImpuestos.get(i).getValor()+"</valor>";
	        respuesta += System.getProperty("line.separator");
	        respuesta += "      </totalImpuesto>";
	        respuesta += System.getProperty("line.separator");
        }
        respuesta += "    </totalConImpuestos>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <motivo>"+this.motivo+"</motivo>";
        respuesta += System.getProperty("line.separator");
        respuesta += "  </infoNotaCredito>";
        respuesta += System.getProperty("line.separator");
        respuesta += "  <detalles>";
        respuesta += System.getProperty("line.separator");
    	for (int i=0; i<this.detalles.size(); i++){
        	respuesta += "    <detalle>";
	        respuesta += System.getProperty("line.separator");
	        respuesta += "      <codigoInterno>"+detalles.get(i).getCodigoInterno()+"</codigoInterno>";
	        respuesta += System.getProperty("line.separator");
	        if (!detalles.get(i).getCodigoAdicional().equals("")){
	        	respuesta += "      <codigoAdicional>"+detalles.get(i).getCodigoAdicional()+"</codigoAdicional>";
	        	respuesta += System.getProperty("line.separator");
	        }
	        respuesta += "      <descripcion>"+ArchivoUtil.parsear(detalles.get(i).getDescripcion())+"</descripcion>";
	        respuesta += System.getProperty("line.separator");
	        respuesta += "      <cantidad>"+detalles.get(i).getCantidad()+"</cantidad>";
	        respuesta += System.getProperty("line.separator");
	        respuesta += "      <precioUnitario>"+detalles.get(i).getPrecioUnitario()+"</precioUnitario>";
	        respuesta += System.getProperty("line.separator");
	        respuesta += "      <descuento>"+detalles.get(i).getDescuento()+"</descuento>";
	        respuesta += System.getProperty("line.separator");
	        respuesta += "      <precioTotalSinImpuesto>"+detalles.get(i).getPrecioTotalSinImpuesto()+"</precioTotalSinImpuesto>";
	        respuesta += System.getProperty("line.separator");
	        Vector<DetAdicional> detAdicional = detalles.get(i).getDetAdicional();
	        if (detAdicional.size()>0){
	        	respuesta += "      <detallesAdicionales>";
	        	respuesta += System.getProperty("line.separator");
	        	for (int j=0; j<detAdicional.size(); j++){
	        		respuesta += "        <detAdicional nombre=\""+ArchivoUtil.parsear(detAdicional.get(j).getNombre())+"\" valor=\""+ArchivoUtil.parsear(detAdicional.get(j).getValor())+"\"/>";
	        		respuesta += System.getProperty("line.separator");
	        	}
	        	respuesta += "      </detallesAdicionales>";
	        	respuesta += System.getProperty("line.separator");
	        }
	        Vector<DetImpuestos> impuestos = detalles.get(i).getImpuestos();
	        if (impuestos.size()>0){
		        respuesta += "      <impuestos>";
		        respuesta += System.getProperty("line.separator");
		        for (int j=0; j<impuestos.size(); j++){
			        respuesta += "        <impuesto>";
			        respuesta += System.getProperty("line.separator");
			        respuesta += "          <codigo>"+impuestos.get(j).getCodigo()+"</codigo>";
			        respuesta += System.getProperty("line.separator");
			        respuesta += "          <codigoPorcentaje>"+impuestos.get(j).getCodigoPorcentaje()+"</codigoPorcentaje>";
			        respuesta += System.getProperty("line.separator");
			        respuesta += "          <tarifa>"+impuestos.get(j).getTarifa()+"</tarifa>";
			        respuesta += System.getProperty("line.separator");
			        respuesta += "          <baseImponible>"+impuestos.get(j).getBaseImponible()+"</baseImponible>";
			        respuesta += System.getProperty("line.separator");
			        respuesta += "          <valor>"+impuestos.get(j).getValor()+"</valor>";
			        respuesta += System.getProperty("line.separator");
			        respuesta += "        </impuesto>";
			        respuesta += System.getProperty("line.separator");
		        }
		        respuesta += "      </impuestos>";
		        respuesta += System.getProperty("line.separator");
	        }
	        respuesta += "    </detalle>";
	        respuesta += System.getProperty("line.separator");
        }
        respuesta += "  </detalles>";
        respuesta += System.getProperty("line.separator");
        if (infoAdicional.size()>0){
	        respuesta += "  <infoAdicional>";
	        respuesta += System.getProperty("line.separator");
	        Vector<InfoAdicional> infoAdicional = this.getInfoAdicional();
	        for (int i=0; i<infoAdicional.size(); i++){
	        	respuesta += "    <campoAdicional nombre=\""+ArchivoUtil.parsear(infoAdicional.get(i).getNombre())+"\">"+ArchivoUtil.parsear(infoAdicional.get(i).getValor())+"</campoAdicional>";
	        	respuesta += System.getProperty("line.separator");
	        }
	        respuesta += "  </infoAdicional>";
	        respuesta += System.getProperty("line.separator");
        }
        respuesta += "</notaCredito>";
        return respuesta;
	}
	
	public boolean hasEmail(){
		boolean foo = false;
		for (int i=0; i<infoAdicional.size(); i++){
			if (infoAdicional.get(i).getNombre().toUpperCase().equals("MAIL") || infoAdicional.get(i).getNombre().toUpperCase().equals("CORREO") || infoAdicional.get(i).getNombre().toUpperCase().equals("CORREORECEPTOR") || infoAdicional.get(i).getNombre().toUpperCase().equals("EMAIL") || infoAdicional.get(i).getNombre().toUpperCase().equals("E-MAIL")){
				foo = true;
			}
		}
		return foo;
	}
	
	public String getInfoAdicionalEmail(){
		String email="";
		for (int i=0; i<infoAdicional.size(); i++){
			if (infoAdicional.get(i).getNombre().toUpperCase().equals("MAIL") || infoAdicional.get(i).getNombre().toUpperCase().equals("CORREO") || infoAdicional.get(i).getNombre().toUpperCase().equals("CORREORECEPTOR") || infoAdicional.get(i).getNombre().toUpperCase().equals("EMAIL") || infoAdicional.get(i).getNombre().toUpperCase().equals("E-MAIL")){
				email = infoAdicional.get(i).getValor();
			}
		}
		return email;
	}
	public String getInfoAdicionalEmailCC(){
		String email="";
		for (int i=0; i<infoAdicional.size(); i++){
			if (infoAdicional.get(i).getNombre().toUpperCase().equals("CC")){
				email = infoAdicional.get(i).getValor();
			}
		}
		return email;
	}
	public double getSubtotal12(){
		double total = 0.0;
		Vector<Detalles> detalles = this.getDetalles();
		for (int i=0; i<detalles.size(); i++){
			Vector<DetImpuestos> impuestos = detalles.get(i).getImpuestos();
	        for (int j=0; j<impuestos.size(); j++){
	        	if (impuestos.get(j).getCodigo()==2){
	        		if (impuestos.get(j).getCodigoPorcentaje()==2){
	        			total += impuestos.get(j).getBaseImponible();
	        		}
	        	}
	        }
		}
        return total;
	}
	
	public double getSubtotal0(){
		double total = 0.0;
		Vector<Detalles> detalles = this.getDetalles();
		for (int i=0; i<detalles.size(); i++){
			Vector<DetImpuestos> impuestos = detalles.get(i).getImpuestos();
	        for (int j=0; j<impuestos.size(); j++){
	        	if (impuestos.get(j).getCodigo()==2){
	        		if (impuestos.get(j).getCodigoPorcentaje()==0){
	        			total += impuestos.get(j).getBaseImponible();
	        		}
	        	}
	        }
		}
        return total;
	}
	
	public double getSubtotalNoObjetoDeIVA(){
		double total = 0.0;
		Vector<Detalles> detalles = this.getDetalles();
		for (int i=0; i<detalles.size(); i++){
			Vector<DetImpuestos> impuestos = detalles.get(i).getImpuestos();
	        for (int j=0; j<impuestos.size(); j++){
	        	if (impuestos.get(j).getCodigo()==2){
	        		if (impuestos.get(j).getCodigoPorcentaje()==6){
	        			total += impuestos.get(j).getBaseImponible();
	        		}
	        	}
	        }
		}
        return total;
	}
	
	public double getSubtotalExentoDeIVA(){
		double total = 0.0;
		Vector<Detalles> detalles = this.getDetalles();
		for (int i=0; i<detalles.size(); i++){
			boolean foo = false;
			Vector<DetImpuestos> impuestos = detalles.get(i).getImpuestos();
	        for (int j=0; j<impuestos.size(); j++){
	        	if (impuestos.get(j).getCodigo()==2){
	        		if (impuestos.get(j).getCodigoPorcentaje()==7){
	        			foo = true;
	        		}
	        	}
	        }
	        if (foo)
	        	total += detalles.get(i).getPrecioTotalSinImpuesto();
		}
        return Math.round(total/100)*100;
	}
	
	public double getICE(){
		double total = 0.0;
		Vector<TotalConImpuestos> impuestos = this.getTotalConImpuestos();
        for (int i=0; i<impuestos.size(); i++){
        	if (impuestos.get(i).getCodigo()==3){
        		total += impuestos.get(i).getValor();
        	}
        }
        return Math.round(total/100)*100;
	}
	
	public double getIVA(){
		double total = 0.0;
		Vector<Detalles> detalles = this.getDetalles();
		for (int i=0; i<detalles.size(); i++){
			Vector<DetImpuestos> impuestos = detalles.get(i).getImpuestos();
	        for (int j=0; j<impuestos.size(); j++){
	        	if (impuestos.get(j).getCodigo()==2){
	        		if (impuestos.get(j).getCodigoPorcentaje()==2){
	        			total += impuestos.get(j).getValor();
	        		}
	        	}
	        }
		}
        return total;
	}
	
	public double getIRBPNR(){
		double total = 0.0;
		Vector<TotalConImpuestos> impuestos = this.getTotalConImpuestos();
        for (int i=0; i<impuestos.size(); i++){
        	if (impuestos.get(i).getCodigo()==5){
        		total += impuestos.get(i).getValor();
        	}
        }
        return total;
	}
	
}