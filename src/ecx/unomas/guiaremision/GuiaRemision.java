package ecx.unomas.guiaremision;

import java.net.UnknownHostException;
import java.sql.SQLException;
import java.util.Vector;

import ecx.unomas.elements.ArchivoUtil;

public class GuiaRemision {
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
	private String dirEstablecimiento;
	private String dirPartida;
	private String razonSocialTransportista;
	private String tipoIdentificacionTransportista;
	private String rucTransportista;
	private String rise;
	private String obligadoContabilidad;
	private String contribuyenteEspecial;
	private String fechaIniTransporte;
	private String fechaFinTransporte;
	private String placa;
	private String estado;
	
	private Vector<Destinatarios> destinatarios = new Vector<Destinatarios>();
	private Vector<InfoAdicional> infoAdicional = new Vector<InfoAdicional>();
	
	public GuiaRemision(){
		this.nombreComercial = "";
		this.contribuyenteEspecial = "";
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
	
	public void setDirEstablecimiento(String dirEstablecimiento){
		this.dirEstablecimiento = dirEstablecimiento;
	}
	public String getDirEstablecimiento(){
		return this.dirEstablecimiento;
	}
	
	public void setDirPartida(String dirPartida){
		this.dirPartida = dirPartida;
	}
	public String getDirPartida(){
		return this.dirPartida;
	}
	
	public void setRazonSocialTransportista(String razonSocialTransportista){
		this.razonSocialTransportista = razonSocialTransportista;
	}
	public String getRazonSocialTransportista(){
		return this.razonSocialTransportista;
	}
	
	public void setTipoIdentificacionTransportista(String tipoIdentificacionTransportista){
		this.tipoIdentificacionTransportista = tipoIdentificacionTransportista;
	}
	public String getTipoIdentificacionTransportista(){
		return this.tipoIdentificacionTransportista;
	}
	
	public void setRucTransportista(String rucTransportista){
		this.rucTransportista = rucTransportista;
	}
	public String getRucTransportista(){
		return this.rucTransportista;
	}
	
	public void setRISE(String rise){
		this.rise = rise;
	}
	public String getRISE(){
		return this.rise;
	}
	
	public void setObligadoContabilidad(String obligadoContabilidad){
		this.obligadoContabilidad = obligadoContabilidad;
	}
	public String getObligadoContabilidad(){
		return this.obligadoContabilidad;
	}
	
	public void setContribuyenteEspecial(String contribuyenteEspecial){
		this.contribuyenteEspecial = contribuyenteEspecial;
	}
	public String getContribuyenteEspecial(){
		return this.contribuyenteEspecial;
	}
	
	public void setFechaIniTransporte(String fechaIniTransporte){
		this.fechaIniTransporte = fechaIniTransporte;
	}
	public String getFechaIniTransporte(){
		return this.fechaIniTransporte;
	}
	
	public void setFechaFinTransporte(String fechaFinTransporte){
		this.fechaFinTransporte = fechaFinTransporte;
	}
	public String getFechaFinTransporte(){
		return this.fechaFinTransporte;
	}
	
	public void setPlaca(String placa){
		this.placa = placa;
	}
	public String getPlaca(){
		return this.placa;
	}
	
	public void setEstado(String estado){
		this.estado = estado;
	}
	public String getEstado(){
		return this.estado;
	}
	
	public void setDestinatarios(Destinatarios destinatarios){
		this.destinatarios.add(destinatarios);
	}
	public Vector<Destinatarios> getDestinatarios(){
		return this.destinatarios;
	}
	
	public void setInfAdicional(InfoAdicional infoAdicional){
		this.infoAdicional.add(infoAdicional);
	}
	
	public Vector<InfoAdicional> getInfoAdicional(){
		return this.infoAdicional;
	}
	/*
	public GuiaRemision save(){
		this.comprobante = new MySQLdao();
		return this.comprobante.saveGuiaRemision(this);
	}
	
	public void loadData(int id) throws SQLException, IllegalAccessException, InstantiationException, ClassNotFoundException, UnknownHostException{
		this.id = id;
		this.comprobante = new MySQLdao();
		this.comprobante.getGuiaRemision(this);
	}
	
	public void emailed() throws SQLException{
		this.comprobante = new MySQLdao();
		this.comprobante.guiaRemisionEmailed(this);
	}
	*/
	public String getXML(){
		String respuesta = "";
		respuesta += "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
		respuesta += System.getProperty("line.separator");
        respuesta += "<guiaRemision id=\"comprobante\" version=\"1.0.0\">";
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
        respuesta += "  <infoGuiaRemision>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <dirEstablecimiento>"+ArchivoUtil.parsear(this.dirEstablecimiento)+"</dirEstablecimiento>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <dirPartida>"+ArchivoUtil.parsear(this.dirPartida)+"</dirPartida>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <razonSocialTransportista>"+ArchivoUtil.parsear(this.razonSocialTransportista)+"</razonSocialTransportista>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <tipoIdentificacionTransportista>"+this.tipoIdentificacionTransportista+"</tipoIdentificacionTransportista>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <rucTransportista>"+this.rucTransportista+"</rucTransportista>";
        respuesta += System.getProperty("line.separator");
        if (this.rise!=null){
	        respuesta += "    <rise>"+this.rise+"</rise>";
	        respuesta += System.getProperty("line.separator");
        }
        respuesta += "    <obligadoContabilidad>"+this.obligadoContabilidad+"</obligadoContabilidad>";
        respuesta += System.getProperty("line.separator");
        if (!this.contribuyenteEspecial.isEmpty()){
        	respuesta += "    <contribuyenteEspecial>"+this.contribuyenteEspecial+"</contribuyenteEspecial>";
            respuesta += System.getProperty("line.separator");
        }
        respuesta += "    <fechaIniTransporte>"+this.fechaIniTransporte+"</fechaIniTransporte>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <fechaFinTransporte>"+this.fechaFinTransporte+"</fechaFinTransporte>";
        respuesta += System.getProperty("line.separator");
        respuesta += "    <placa>"+this.placa+"</placa>";
        respuesta += System.getProperty("line.separator");
        respuesta += "  </infoGuiaRemision>";
        
        respuesta += System.getProperty("line.separator");
        respuesta += "  <destinatarios>";
        for (int i=0; i<this.destinatarios.size(); i++){
        	respuesta += System.getProperty("line.separator");
        	respuesta += "    <destinatario>";
        	respuesta += System.getProperty("line.separator");
        	respuesta += "      <identificacionDestinatario>"+this.destinatarios.get(i).getIdentificacionDestinatario()+"</identificacionDestinatario>";
        	respuesta += System.getProperty("line.separator");
        	respuesta += "      <razonSocialDestinatario>"+ArchivoUtil.parsear(this.destinatarios.get(i).getRazonSocialDestinatario()).toUpperCase()+"</razonSocialDestinatario>";
        	respuesta += System.getProperty("line.separator");
        	respuesta += "      <dirDestinatario>"+ArchivoUtil.parsear(this.destinatarios.get(i).getDirDestinatario())+"</dirDestinatario>";
        	respuesta += System.getProperty("line.separator");
        	respuesta += "      <motivoTraslado>"+ArchivoUtil.parsear(this.destinatarios.get(i).getMotivoTraslado())+"</motivoTraslado>";
        	respuesta += System.getProperty("line.separator");
        	if(!this.destinatarios.get(i).getDocAduaneroUnico().equals("")){
	        	respuesta += "      <docAduaneroUnico>"+this.destinatarios.get(i).getDocAduaneroUnico()+"</docAduaneroUnico>";
	        	respuesta += System.getProperty("line.separator");
        	}
        	if (!this.destinatarios.get(i).getCodEstabDestino().equals("")){
	        	respuesta += "      <codEstabDestino>"+this.destinatarios.get(i).getCodEstabDestino()+"</codEstabDestino>";
	        	respuesta += System.getProperty("line.separator");
        	}
        	if (!this.destinatarios.get(i).getRuta().equals("")){
	        	respuesta += "      <ruta>"+this.destinatarios.get(i).getRuta()+"</ruta>";
	        	respuesta += System.getProperty("line.separator");
        	}
        	if (!this.destinatarios.get(i).getCodDocSustento().equals("")){
	        	respuesta += "      <codDocSustento>"+this.destinatarios.get(i).getCodDocSustento()+"</codDocSustento>";
	        	respuesta += System.getProperty("line.separator");
        	}
        	if (!this.destinatarios.get(i).getNumDocSustento().equals("")){
	        	respuesta += "      <numDocSustento>"+this.destinatarios.get(i).getNumDocSustento()+"</numDocSustento>";
	        	respuesta += System.getProperty("line.separator");
        	}
        	if (!this.destinatarios.get(i).getNumAutDocSustento().equals("")){
	        	respuesta += "      <numAutDocSustento>"+this.destinatarios.get(i).getNumAutDocSustento()+"</numAutDocSustento>";
	        	respuesta += System.getProperty("line.separator");
        	}
        	if (!this.destinatarios.get(i).getFechaEmisionDocSustento().equals("")){
	        	respuesta += "      <fechaEmisionDocSustento>"+this.destinatarios.get(i).getFechaEmisionDocSustento()+"</fechaEmisionDocSustento>";
	        	respuesta += System.getProperty("line.separator");
        	}
        	respuesta += "      <detalles>";
            respuesta += System.getProperty("line.separator");
        	Vector<DestinatariosDetalles> detalles = this.destinatarios.get(i).getDetalle();
        	for (int j=0; j<detalles.size(); j++){
            	respuesta += "        <detalle>";
    	        respuesta += System.getProperty("line.separator");
    	        respuesta += "          <codigoInterno>"+detalles.get(j).getCodigoInterno()+"</codigoInterno>";
    	        respuesta += System.getProperty("line.separator");
    	        if (!detalles.get(j).getCodigoAdicional().equals("")){
    	        	respuesta += "          <codigoAdicional>"+detalles.get(j).getCodigoAdicional()+"</codigoAdicional>";
    	        	respuesta += System.getProperty("line.separator");
    	        }
    	        respuesta += "          <descripcion>"+ArchivoUtil.parsear(detalles.get(j).getDescripcion())+"</descripcion>";
    	        respuesta += System.getProperty("line.separator");
    	        respuesta += "          <cantidad>"+detalles.get(j).getCantidad()+"</cantidad>";
    	        respuesta += System.getProperty("line.separator");
    	        Vector<DestinatariosDetallesAdicional> detAdicional = detalles.get(j).getDetAdicional();
    	        if (detAdicional.size()>0){
    	        	respuesta += "          <detallesAdicionales>";
    	        	respuesta += System.getProperty("line.separator");
    	        	for (int l=0; l<detAdicional.size(); l++){
    	        		respuesta += "            <detAdicional nombre=\""+ArchivoUtil.parsear(detAdicional.get(l).getNombre())+"\" valor=\""+ArchivoUtil.parsear(detAdicional.get(l).getValor())+"\"/>";
    	        		respuesta += System.getProperty("line.separator");
    	        	}
    	        	respuesta += "          </detallesAdicionales>";
    	        	respuesta += System.getProperty("line.separator");
    	        }
    	        respuesta += "        </detalle>";
    	        respuesta += System.getProperty("line.separator");
        	}
        	respuesta += "      </detalles>";
            respuesta += System.getProperty("line.separator");
        	respuesta += "    </destinatario>";
        }
        respuesta += System.getProperty("line.separator");
        respuesta += "  </destinatarios>";
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
        respuesta += "</guiaRemision>";
        return respuesta;
	}
	/*
	public void saveGenerated(){
		this.comprobante = new MySQLdao();
		comprobante.saveGuiaRemisionGenerated(this);
	}
	
	public void saveRecibe(){
		this.comprobante = new MySQLdao();
		comprobante.saveGuiaRemisionRecibe(this);
	}
	
	public void saveNoRecibe(){
		this.comprobante = new MySQLdao();
		comprobante.saveGuiaRemisionNoRecibe(this);
	}
	
	public void saveAutorizacion() throws IllegalAccessException, InstantiationException, ClassNotFoundException, SQLException{
		this.comprobante = new MySQLdao();
		comprobante.saveGuiaRemisionAutorizacion(this);
	}
	
	public void saveNotAutorized() throws IllegalAccessException, InstantiationException, ClassNotFoundException, SQLException{
		this.comprobante = new MySQLdao();
		comprobante.saveGuiaRemisionNotAutorized(this);
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
