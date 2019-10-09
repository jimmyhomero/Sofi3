package ec.unomas.retencion;

import java.util.Vector;

import ec.unomas.elements.ArchivoUtil;

public class Retencion {
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
	private int contribuyenteEspecial;
	private String obligadoContabilidad;
	private String tipoIdentificacionSujetoRetenido;
	private String razonSocialSujetoRetenido;
	private String identificacionSujetoRetenido;
	private String periodoFiscal;
	private String estado;
	private Vector<Impuesto> impuesto = new Vector<Impuesto>();
	private Vector<InfoAdicional> infoAdicional = new Vector<InfoAdicional>();
	
	public Retencion(){
		this.nombreComercial = "";
		this.contribuyenteEspecial = 0;
		this.authNumber = "";
		this.authDate = "2015-01-01 00:00:00";
		this.estado = "GENERADO";
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
	
	public void setContribuyenteEspecial(int contribuyenteEspecial){
		this.contribuyenteEspecial = contribuyenteEspecial;
	}
	public int getContribuyenteEspecial(){
		return this.contribuyenteEspecial;
	}
	
	public void setObligadoContabilidad(String obligadoContabilidad){
		this.obligadoContabilidad = obligadoContabilidad;
	}
	public String getObligadoContabilidad(){
		return this.obligadoContabilidad;
	}
	
	public void setTipoIdentificacionSujetoRetenido(String tipoIdentificacionSujetoRetenido){
		this.tipoIdentificacionSujetoRetenido = tipoIdentificacionSujetoRetenido;
	}
	public String getTipoIdentificacionSujetoRetenido(){
		return this.tipoIdentificacionSujetoRetenido;
	}
	
	public void setRazonSocialSujetoRetenido(String razonSocialSujetoRetenido){
		this.razonSocialSujetoRetenido = razonSocialSujetoRetenido;
	}
	public String getRazonSocialSujetoRetenido(){
		return this.razonSocialSujetoRetenido;
	}
	
	public void setIdentificacionSujetoRetenido(String identificacionSujetoRetenido){
		this.identificacionSujetoRetenido = identificacionSujetoRetenido;
	}
	public String getIdentificacionSujetoRetenido(){
		return this.identificacionSujetoRetenido;
	}
	
	public void setPeriodoFiscal(String periodoFiscal){
		this.periodoFiscal = periodoFiscal;
	}
	public String getPeriodoFiscal(){
		return this.periodoFiscal;
	}
	
	public void setEstado(String estado){
		this.estado = estado;
	}
	public String getEstado(){
		return this.estado;
	}
	
	public void setImpuesto(Impuesto impuesto){
		this.impuesto.add(impuesto);
	}
	public Vector<Impuesto> getImpuesto(){
		return this.impuesto;
	}
	
	public void setInfAdicional(InfoAdicional infoAdicional){
		this.infoAdicional.add(infoAdicional);
	}
	public Vector<InfoAdicional> getInfoAdicional(){
		return this.infoAdicional;
	}
	/*
	public Retencion save(){
		this.comprobante = new MySQLdao();
		return this.comprobante.saveRetencion(this);
	}
	
	public void loadData(int id) throws SQLException, IllegalAccessException, InstantiationException, ClassNotFoundException, UnknownHostException{
		this.id = id;
		this.comprobante = new MySQLdao();
		this.comprobante.getRetencion(this);
	}
	
	public void emailed() throws SQLException{
		this.comprobante = new MySQLdao();
		this.comprobante.retencionEmailed(this);
	}
	*/
	public String getXML(){
		String respuesta = "";
		respuesta += "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
		respuesta += System.getProperty("line.separator");
        respuesta += "<comprobanteRetencion id=\"comprobante\" version=\"1.0.0\">";
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
        respuesta += "  <infoCompRetencion>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <fechaEmision>"+this.fechaEmision+"</fechaEmision>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <dirEstablecimiento>"+ArchivoUtil.parsear(this.dirEstablecimiento)+"</dirEstablecimiento>";
        respuesta += System.getProperty("line.separator");
        if (this.contribuyenteEspecial>0){
        	respuesta += "    <contribuyenteEspecial>"+this.contribuyenteEspecial+"</contribuyenteEspecial>";
            respuesta += System.getProperty("line.separator");
        }
        respuesta += "    <obligadoContabilidad>"+this.obligadoContabilidad+"</obligadoContabilidad>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <tipoIdentificacionSujetoRetenido>"+this.tipoIdentificacionSujetoRetenido+"</tipoIdentificacionSujetoRetenido>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <razonSocialSujetoRetenido>"+ArchivoUtil.parsear(this.razonSocialSujetoRetenido)+"</razonSocialSujetoRetenido>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <identificacionSujetoRetenido>"+this.identificacionSujetoRetenido+"</identificacionSujetoRetenido>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <periodoFiscal>"+this.periodoFiscal+"</periodoFiscal>";
        respuesta += System.getProperty("line.separator");
        respuesta += "  </infoCompRetencion>";
        respuesta += System.getProperty("line.separator");
        respuesta += "  <impuestos>";
        for (int i=0; i<this.impuesto.size(); i++){
        	respuesta += System.getProperty("line.separator");
        	respuesta += "    <impuesto>";
        	respuesta += System.getProperty("line.separator");
        	respuesta += "      <codigo>"+this.impuesto.get(i).getCodigo()+"</codigo>";
        	respuesta += System.getProperty("line.separator");
        	respuesta += "      <codigoRetencion>"+this.impuesto.get(i).getCodigoRetencion()+"</codigoRetencion>";
        	respuesta += System.getProperty("line.separator");
        	respuesta += "      <baseImponible>"+this.impuesto.get(i).getBaseImponible()+"</baseImponible>";
        	respuesta += System.getProperty("line.separator");
        	respuesta += "      <porcentajeRetener>"+this.impuesto.get(i).getPorcentajeRetener()+"</porcentajeRetener>";
        	respuesta += System.getProperty("line.separator");
        	respuesta += "      <valorRetenido>"+this.impuesto.get(i).getValorRetenido()+"</valorRetenido>";
        	respuesta += System.getProperty("line.separator");
        	respuesta += "      <codDocSustento>"+this.impuesto.get(i).getCodDocSustento()+"</codDocSustento>";
        	respuesta += System.getProperty("line.separator");
        	respuesta += "      <numDocSustento>"+this.impuesto.get(i).getNumDocSustento()+"</numDocSustento>";
        	respuesta += System.getProperty("line.separator");
        	respuesta += "      <fechaEmisionDocSustento>"+this.impuesto.get(i).getFechaEmisionDocSustento()+"</fechaEmisionDocSustento>";
        	respuesta += System.getProperty("line.separator");
        	respuesta += "    </impuesto>";
        }
        respuesta += System.getProperty("line.separator");
        respuesta += "  </impuestos>";
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
        respuesta += "</comprobanteRetencion>";
        return respuesta;
	}
	/*
	public void saveGenerated() throws IllegalAccessException, InstantiationException, ClassNotFoundException, SQLException{
		this.comprobante = new MySQLdao();
		comprobante.saveRetencionGenerated(this);
	}
	
	public void saveRecibe(){
		this.comprobante = new MySQLdao();
		comprobante.saveRetencionRecibe(this);
	}
	
	public void saveNoRecibe(){
		this.comprobante = new MySQLdao();
		comprobante.saveRetencionNoRecibe(this);
	}
	
	public void saveAutorizacion() throws IllegalAccessException, InstantiationException, ClassNotFoundException, SQLException{
		this.comprobante = new MySQLdao();
		comprobante.saveRetencionAutorizacion(this);
	}
	
	public void saveNotAutorized() throws IllegalAccessException, InstantiationException, ClassNotFoundException, SQLException{
		this.comprobante = new MySQLdao();
		comprobante.saveRetencionNotAutorized(this);
	}
	*/
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
}
