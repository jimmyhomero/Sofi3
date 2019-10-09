package ec.unomas.factura;

import java.util.Vector;

import ec.unomas.elements.ArchivoUtil;

public class Factura {

    private int id;
    private String fechaAut;
    private String nroAut;
    private String estado;
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

    // EXPORTADOR
    private String comercioExterior;
    private String incoTermFactura;
    private String lugarIncoTerm;
    private int paisOrigen;
    private String puertoEmbarque;
    private String puertoDestino;
    private int paisDestino;
    private int paisAdquisicion;

    private String tipoIdentificacionComprador;
    private String razonSocialComprador;
    private String identificacionComprador;
    private String direccionComprador = "";
    private String guiaRemision;
    private Double totalSinImpuestos;
    private String incoTermTotalSinImpuestos;
    private Double totalDescuento;
    private Vector<TotalImpuesto> totalImpuestos = new Vector<TotalImpuesto>();
    private Double propina;
    private Double fleteInternacional;
    private Double seguroInternacional;
    private Double gastosAduaneros;
    private Double gastosTransporteOtros;
    private Double importeTotal;
    private String moneda;
    private Vector<Pago> pagos = new Vector<Pago>();

    private Vector<Detalle> detalles = new Vector<Detalle>();

    private Vector<InfoAdicional> infoAdicional = new Vector<InfoAdicional>();

    public Factura() {
        this.contribuyenteEspecial = 0;
        this.moneda = "DOLAR";
        this.guiaRemision = "";
        this.totalDescuento = 0.0;
        this.propina = 0.0;
        this.comercioExterior = "";
    }

    public void setID(int id) {
        this.id = id;
    }

    public int getID() {
        return this.id;
    }

    public void setFechaAutorizacion(String fechaAut) {
        this.fechaAut = fechaAut;
    }

    public String getFechaAutorizacion() {
        return this.fechaAut;
    }

    public void setNroAutorizacion(String nroAut) {
        this.nroAut = nroAut;
    }

    public String getNroAutorizacion() {
        return this.nroAut;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getEstado() {
        return this.estado;
    }

    public void setAmbiente(int ambiente) {
        this.ambiente = ambiente;
    }

    public int getAmbiente() {
        return this.ambiente;
    }

    public void setAmbienteName(String name) {
        this.ambienteName = name;
    }

    public String getAmbienteName() {
        return this.ambiente == 1 ? "PRUEBAS" : "PRODUCCION";
    }

    public void setTipoEmision(int tipoEmision) {
        this.tipoEmision = tipoEmision;
    }

    public int getTipoEmision() {
        return this.tipoEmision;
    }

    public void setTipoEmisionName(String name) {
        this.tipoEmisionName = name;
    }

    public String getTipoEmisionName() {
        return this.tipoEmision == 1 ? "NORMAL" : "";
    }

    public void setRazonSocial(String razonSocial) {
        this.razonSocial = razonSocial;
    }

    public String getRazonSocial() {
        return this.razonSocial;
    }

    public void setNombreComercial(String nombreComercial) {
        this.nombreComercial = nombreComercial;
    }

    public String getNombreComercial() {
        return this.nombreComercial;
    }

    public void setRUC(String ruc) {
        this.ruc = ruc;
    }

    public String getRUC() {
        return this.ruc;
    }

    public void setClaveAcceso(String claveAcceso) {
        this.claveAcceso = claveAcceso;
    }

    public String getClaveAcceso() {
        return this.claveAcceso;
    }

    public void setCodDoc(String codDoc) {
        this.codDoc = codDoc;
    }

    public String getCodDoc() {
        return this.codDoc;
    }

    public void setEstab(String estab) {
        this.estab = estab;
    }

    public String getEstab() {
        return this.estab;
    }

    public void setPtoEmi(String ptoEmi) {
        this.ptoEmi = ptoEmi;
    }

    public String getPtoEmi() {
        return this.ptoEmi;
    }

    public void setSecuencia(String secuencia) {
        this.secuencia = secuencia;
    }

    public String getSecuencia() {
        return this.secuencia;
    }

    public void setDirMatriz(String dirMatriz) {
        this.dirMatriz = dirMatriz;
    }

    public String getDirMatriz() {
        return this.dirMatriz;
    }

    public void setFechaEmision(String fechaEmision) {
        this.fechaEmision = fechaEmision;
    }

    public String getFechaEmision() {
        return this.fechaEmision;
    }

    public void setDirEstablecimiento(String dirEstablecimiento) {
        this.dirEstablecimiento = dirEstablecimiento;
    }

    public String getDirEstablecimiento() {
        return this.dirEstablecimiento;
    }

    public void setContribuyenteEspecial(int contribuyenteEspecial) {
        this.contribuyenteEspecial = contribuyenteEspecial;
    }

    public int getContribuyenteEspecial() {
        return this.contribuyenteEspecial;
    }

    public void setObligadoContabilidad(String obligadoContabilidad) {
        this.obligadoContabilidad = obligadoContabilidad;
    }

    public String getObligadoContabilidad() {
        return this.obligadoContabilidad;
    }

    public void setTipoIdentificacionComprador(String tipoIdentificacionComprador) {
        this.tipoIdentificacionComprador = tipoIdentificacionComprador;
    }

    public String getTipoIdentificacionComprador() {
        return this.tipoIdentificacionComprador;
    }

    public void setRazonSocialComprador(String razonSocialComprador) {
        this.razonSocialComprador = razonSocialComprador;
    }

    public String getRazonSocialComprador() {
        return this.razonSocialComprador;
    }

    public void setIdentificacionComprador(String identificacionComprador) {
        this.identificacionComprador = identificacionComprador;
    }

    public String getIdentificacionComprador() {
        return this.identificacionComprador;
    }

    public void setGuiaRemision(String guia) {
        this.guiaRemision = guia;
    }

    public String getGuiaRemision() {
        return this.guiaRemision;
    }

    public void setTotalSinImpuestos(Double totalSinImpuestos) {
        this.totalSinImpuestos = totalSinImpuestos;
    }

    public Double getTotalSinImpuestos() {
        return this.totalSinImpuestos;
    }

    public void setTotalDescuento(Double totalDescuento) {
        this.totalDescuento = totalDescuento;
    }

    public Double getTotalDescuento() {
        return this.totalDescuento;
    }

    public void setTotalImpuestos(TotalImpuesto totalImpuesto) {
        this.totalImpuestos.add(totalImpuesto);
    }

    public Vector<TotalImpuesto> getTotalImpuestos() {
        return this.totalImpuestos;
    }

    public void setPropina(Double propina) {
        this.propina = propina;
    }

    public Double getPropina() {
        return this.propina;
    }

    public void setImporteTotal(Double importeTotal) {
        this.importeTotal = importeTotal;
    }

    public Double getImporteTotal() {
        return this.importeTotal;
    }

    public void setMoneda(String moneda) {
        this.moneda = moneda;
    }

    public String getMoneda() {
        return this.moneda;
    }

    public Vector<Pago> getPagos() {
        return pagos;
    }

    public void setPagos(Vector<Pago> pagos) {
        this.pagos = pagos;
    }

    public void setDetalle(Detalle detalle) {
        this.detalles.add(detalle);
    }

    public Vector<Detalle> getDetalles() {
        return this.detalles;
    }

    public void setInfAdicional(InfoAdicional infoAdicional) {
        if (!infoAdicional.getValor().equals("")) {
            this.infoAdicional.add(infoAdicional);
        }
    }

    public Vector<InfoAdicional> getInfoAdicional() {
        return this.infoAdicional;
    }

    public boolean hasEmail() {
        boolean foo = false;
        for (int i = 0; i < infoAdicional.size(); i++) {
            if (infoAdicional.get(i).getNombre().toUpperCase().equals("MAIL") || infoAdicional.get(i).getNombre().toUpperCase().equals("CORREO") || infoAdicional.get(i).getNombre().toUpperCase().equals("CORREORECEPTOR") || infoAdicional.get(i).getNombre().toUpperCase().equals("EMAIL") || infoAdicional.get(i).getNombre().toUpperCase().equals("E-MAIL")) {
                foo = true;
            }
        }
        return foo;
    }

    public String getInfoAdicionalEmail() {
        String email = "";
        for (int i = 0; i < infoAdicional.size(); i++) {
            if (infoAdicional.get(i).getNombre().toUpperCase().equals("MAIL") || infoAdicional.get(i).getNombre().toUpperCase().equals("CORREO") || infoAdicional.get(i).getNombre().toUpperCase().equals("CORREORECEPTOR") || infoAdicional.get(i).getNombre().toUpperCase().equals("EMAIL") || infoAdicional.get(i).getNombre().toUpperCase().equals("E-MAIL")) {
                email = infoAdicional.get(i).getValor();
            }
        }
        return email;
    }

    public String getInfoAdicionalEmailCC() {
        String email = "";
        for (int i = 0; i < infoAdicional.size(); i++) {
            if (infoAdicional.get(i).getNombre().toUpperCase().equals("CC")) {
                email = infoAdicional.get(i).getValor();
            }
        }
        return email;
    }

    public String getXML() {
        String respuesta = "";
        try {
            respuesta += "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
            respuesta += System.getProperty("line.separator");
            respuesta += "<factura id=\"comprobante\" version=\"1.1.0\">";
            respuesta += System.getProperty("line.separator");
            respuesta += "  <infoTributaria>";
            respuesta += System.getProperty("line.separator");
            respuesta += "    <ambiente>" + this.ambiente + "</ambiente>";
            respuesta += System.getProperty("line.separator");
            respuesta += "    <tipoEmision>" + this.tipoEmision + "</tipoEmision>";
            respuesta += System.getProperty("line.separator");
            respuesta += "    <razonSocial>" + ArchivoUtil.parsear(this.razonSocial) + "</razonSocial>";
            respuesta += System.getProperty("line.separator");
            respuesta += "    <nombreComercial>" + ArchivoUtil.parsear(this.nombreComercial) + "</nombreComercial>";
            respuesta += System.getProperty("line.separator");
            respuesta += "    <ruc>" + this.ruc + "</ruc>";
            respuesta += System.getProperty("line.separator");
            respuesta += "    <claveAcceso>" + this.claveAcceso + "</claveAcceso>";
            respuesta += System.getProperty("line.separator");
            respuesta += "    <codDoc>" + this.codDoc + "</codDoc>";
            respuesta += System.getProperty("line.separator");
            respuesta += "    <estab>" + this.estab + "</estab>";
            respuesta += System.getProperty("line.separator");
            respuesta += "    <ptoEmi>" + this.ptoEmi + "</ptoEmi>";
            respuesta += System.getProperty("line.separator");
            respuesta += "    <secuencial>" + this.secuencia + "</secuencial>";
            respuesta += System.getProperty("line.separator");
            respuesta += "    <dirMatriz>" + ArchivoUtil.parsear(this.dirMatriz) + "</dirMatriz>";
            respuesta += System.getProperty("line.separator");
            respuesta += "  </infoTributaria>";
            respuesta += System.getProperty("line.separator");
            respuesta += "  <infoFactura>";
            respuesta += System.getProperty("line.separator");
            respuesta += "    <fechaEmision>" + this.fechaEmision + "</fechaEmision>";
            respuesta += System.getProperty("line.separator");
            respuesta += "    <dirEstablecimiento>" + ArchivoUtil.parsear(this.dirEstablecimiento) + "</dirEstablecimiento>";
            respuesta += System.getProperty("line.separator");
            if (this.contribuyenteEspecial > 0) {
                respuesta += "    <contribuyenteEspecial>" + this.contribuyenteEspecial + "</contribuyenteEspecial>";
                respuesta += System.getProperty("line.separator");
            }
            respuesta += "    <obligadoContabilidad>" + this.obligadoContabilidad + "</obligadoContabilidad>";
            respuesta += System.getProperty("line.separator");
            respuesta += "    <tipoIdentificacionComprador>" + this.tipoIdentificacionComprador + "</tipoIdentificacionComprador>";
            respuesta += System.getProperty("line.separator");
            if(this.guiaRemision.equals("")){
            
            }else{
            respuesta += "    <guiaRemision>" + this.guiaRemision + "</guiaRemision>";
            respuesta += System.getProperty("line.separator");
            }            
            respuesta += "    <razonSocialComprador>" + ArchivoUtil.parsear(this.razonSocialComprador) + "</razonSocialComprador>";
            respuesta += System.getProperty("line.separator");
            respuesta += "    <identificacionComprador>" + this.identificacionComprador + "</identificacionComprador>";
            respuesta += System.getProperty("line.separator");
            respuesta += "    <totalSinImpuestos>" + this.totalSinImpuestos + "</totalSinImpuestos>";
            respuesta += System.getProperty("line.separator");
            respuesta += "    <totalDescuento>" + this.totalDescuento + "</totalDescuento>";
            respuesta += System.getProperty("line.separator");
            respuesta += "    <totalConImpuestos>";
            respuesta += System.getProperty("line.separator");
            Vector<TotalImpuesto> totalImpuestos = this.getTotalImpuestos();
            for (int i = 0; i < totalImpuestos.size(); i++) {
                respuesta += "      <totalImpuesto>";
                respuesta += System.getProperty("line.separator");
                respuesta += "        <codigo>" + totalImpuestos.get(i).getCodigo() + "</codigo>";
                respuesta += System.getProperty("line.separator");
                respuesta += "        <codigoPorcentaje>" + totalImpuestos.get(i).getCodigoPorcentaje() + "</codigoPorcentaje>";
                respuesta += System.getProperty("line.separator");
                respuesta += "        <baseImponible>" + totalImpuestos.get(i).getBaseImponible() + "</baseImponible>";
                respuesta += System.getProperty("line.separator");
                respuesta += "        <valor>" + totalImpuestos.get(i).getValor() + "</valor>";
                respuesta += System.getProperty("line.separator");
                respuesta += "      </totalImpuesto>";
                respuesta += System.getProperty("line.separator");
            }
            respuesta += "    </totalConImpuestos>";
            respuesta += System.getProperty("line.separator");
            respuesta += "    <propina>" + this.propina + "</propina>";
            respuesta += System.getProperty("line.separator");
            respuesta += "    <importeTotal>" + this.importeTotal + "</importeTotal>";
            respuesta += System.getProperty("line.separator");
            respuesta += "    <moneda>" + this.moneda + "</moneda>";
            respuesta += System.getProperty("line.separator");
            respuesta += "  </infoFactura>";
            respuesta += System.getProperty("line.separator");
            respuesta += "  <detalles>";
            for (int i = 0; i < this.detalles.size(); i++) {
                respuesta += System.getProperty("line.separator");
                respuesta += "    <detalle>";
                respuesta += System.getProperty("line.separator");
                respuesta += "      <codigoPrincipal>" + detalles.get(i).getCodigoPrincipal() + "</codigoPrincipal>";
                respuesta += System.getProperty("line.separator");
                if (!detalles.get(i).getCodigoSecundario().equals("")) {
                    respuesta += "      <codigoAuxiliar>" + detalles.get(i).getCodigoSecundario() + "</codigoAuxiliar>";
                    respuesta += System.getProperty("line.separator");
                }
                respuesta += "      <descripcion>" + ArchivoUtil.parsear(detalles.get(i).getDescripcion()) + "</descripcion>";
                respuesta += System.getProperty("line.separator");
                respuesta += "      <cantidad>" + detalles.get(i).getCantidad() + "</cantidad>";
                respuesta += System.getProperty("line.separator");
                respuesta += "      <precioUnitario>" + detalles.get(i).getPrecioUnitario() + "</precioUnitario>";
                respuesta += System.getProperty("line.separator");
                respuesta += "      <descuento>" + detalles.get(i).getDescuento() + "</descuento>";
                respuesta += System.getProperty("line.separator");
                respuesta += "      <precioTotalSinImpuesto>" + detalles.get(i).getPrecioTotalSinImpuesto() + "</precioTotalSinImpuesto>";
                respuesta += System.getProperty("line.separator");
                respuesta += "      <impuestos>";
                respuesta += System.getProperty("line.separator");
                Vector<Impuesto> impuestos = detalles.get(i).getImpuestos();
                for (int j = 0; j < impuestos.size(); j++) {
                    respuesta += "        <impuesto>";
                    respuesta += System.getProperty("line.separator");
                    respuesta += "          <codigo>" + impuestos.get(j).getCodigo() + "</codigo>";
                    respuesta += System.getProperty("line.separator");
                    respuesta += "          <codigoPorcentaje>" + impuestos.get(j).getCodigoPorcentaje() + "</codigoPorcentaje>";
                    respuesta += System.getProperty("line.separator");
                    respuesta += "          <tarifa>" + impuestos.get(j).getTarifa() + "</tarifa>";
                    respuesta += System.getProperty("line.separator");
                    respuesta += "          <baseImponible>" + impuestos.get(j).getBaseImponible() + "</baseImponible>";
                    respuesta += System.getProperty("line.separator");
                    respuesta += "          <valor>" + impuestos.get(j).getValor() + "</valor>";
                    respuesta += System.getProperty("line.separator");
                    respuesta += "        </impuesto>";
                    respuesta += System.getProperty("line.separator");
                }
                respuesta += "      </impuestos>";
                respuesta += System.getProperty("line.separator");
                respuesta += "    </detalle>";
                respuesta += System.getProperty("line.separator");
            }
            respuesta += "  </detalles>";
            respuesta += System.getProperty("line.separator");
            respuesta += "  <infoAdicional>";
            respuesta += System.getProperty("line.separator");
            Vector<InfoAdicional> infoAdicional = this.getInfoAdicional();
            for (int i = 0; i < infoAdicional.size(); i++) {
                respuesta += "    <campoAdicional nombre=\"" + ArchivoUtil.parsear(infoAdicional.get(i).getNombre()) + "\">" + ArchivoUtil.parsear(infoAdicional.get(i).getValor()) + "</campoAdicional>";
                respuesta += System.getProperty("line.separator");
            }
            respuesta += "  </infoAdicional>";
            respuesta += System.getProperty("line.separator");
            respuesta += "</factura>";
        } catch (Exception e) {
            respuesta += e.getMessage();
        }
        return respuesta;
    }

    public String getXML2plano() {
        String respuesta = "";
        try {
            respuesta += "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
            
            respuesta += "<factura id=\"comprobante\" version=\"1.1.0\">";
            
            respuesta += "  <infoTributaria>";
            
            respuesta += "    <ambiente>" + this.ambiente + "</ambiente>";
            
            respuesta += "    <tipoEmision>" + this.tipoEmision + "</tipoEmision>";
            
            respuesta += "    <razonSocial>" + ArchivoUtil.parsear(this.razonSocial) + "</razonSocial>";
            
            respuesta += "    <nombreComercial>" + ArchivoUtil.parsear(this.nombreComercial) + "</nombreComercial>";
            
            respuesta += "    <ruc>" + this.ruc + "</ruc>";
            
            respuesta += "    <claveAcceso>" + this.claveAcceso + "</claveAcceso>";
            
            respuesta += "    <codDoc>" + this.codDoc + "</codDoc>";
            
            respuesta += "    <estab>" + this.estab + "</estab>";
            
            respuesta += "    <ptoEmi>" + this.ptoEmi + "</ptoEmi>";
            
            respuesta += "    <secuencial>" + this.secuencia + "</secuencial>";
            
            respuesta += "    <dirMatriz>" + ArchivoUtil.parsear(this.dirMatriz) + "</dirMatriz>";
            
            respuesta += "  </infoTributaria>";
            
            respuesta += "  <infoFactura>";
            
            respuesta += "    <fechaEmision>" + this.fechaEmision + "</fechaEmision>";
            
            respuesta += "    <dirEstablecimiento>" + ArchivoUtil.parsear(this.dirEstablecimiento) + "</dirEstablecimiento>";
            
            if (this.contribuyenteEspecial > 0) {
                respuesta += "    <contribuyenteEspecial>" + this.contribuyenteEspecial + "</contribuyenteEspecial>";
                
            }
            respuesta += "    <obligadoContabilidad>" + this.obligadoContabilidad + "</obligadoContabilidad>";
            
            respuesta += "    <tipoIdentificacionComprador>" + this.tipoIdentificacionComprador + "</tipoIdentificacionComprador>";
            
            if(this.guiaRemision.equals("")){
            
            }else{
            respuesta += "    <guiaRemision>" + this.guiaRemision + "</guiaRemision>";
            
            }            
            respuesta += "    <razonSocialComprador>" + ArchivoUtil.parsear(this.razonSocialComprador) + "</razonSocialComprador>";
            
            respuesta += "    <identificacionComprador>" + this.identificacionComprador + "</identificacionComprador>";
            
            respuesta += "    <totalSinImpuestos>" + this.totalSinImpuestos + "</totalSinImpuestos>";
            
            respuesta += "    <totalDescuento>" + this.totalDescuento + "</totalDescuento>";
            
            respuesta += "    <totalConImpuestos>";
            
            Vector<TotalImpuesto> totalImpuestos = this.getTotalImpuestos();
            for (int i = 0; i < totalImpuestos.size(); i++) {
                respuesta += "      <totalImpuesto>";
                
                respuesta += "        <codigo>" + totalImpuestos.get(i).getCodigo() + "</codigo>";
                
                respuesta += "        <codigoPorcentaje>" + totalImpuestos.get(i).getCodigoPorcentaje() + "</codigoPorcentaje>";
                
                respuesta += "        <baseImponible>" + totalImpuestos.get(i).getBaseImponible() + "</baseImponible>";
                
                respuesta += "        <valor>" + totalImpuestos.get(i).getValor() + "</valor>";
                
                respuesta += "      </totalImpuesto>";
                
            }
            respuesta += "    </totalConImpuestos>";
            
            respuesta += "    <propina>" + this.propina + "</propina>";
            
            respuesta += "    <importeTotal>" + this.importeTotal + "</importeTotal>";
            
            respuesta += "    <moneda>" + this.moneda + "</moneda>";
            
            respuesta += "  </infoFactura>";
            
            respuesta += "  <detalles>";
            for (int i = 0; i < this.detalles.size(); i++) {
                
                respuesta += "    <detalle>";
                
                respuesta += "      <codigoPrincipal>" + detalles.get(i).getCodigoPrincipal() + "</codigoPrincipal>";
                
                if (!detalles.get(i).getCodigoSecundario().equals("")) {
                    respuesta += "      <codigoAuxiliar>" + detalles.get(i).getCodigoSecundario() + "</codigoAuxiliar>";
                    
                }
                respuesta += "      <descripcion>" + ArchivoUtil.parsear(detalles.get(i).getDescripcion()) + "</descripcion>";
                
                respuesta += "      <cantidad>" + detalles.get(i).getCantidad() + "</cantidad>";
                
                respuesta += "      <precioUnitario>" + detalles.get(i).getPrecioUnitario() + "</precioUnitario>";
                
                respuesta += "      <descuento>" + detalles.get(i).getDescuento() + "</descuento>";
                
                respuesta += "      <precioTotalSinImpuesto>" + detalles.get(i).getPrecioTotalSinImpuesto() + "</precioTotalSinImpuesto>";
                
                respuesta += "      <impuestos>";
                
                Vector<Impuesto> impuestos = detalles.get(i).getImpuestos();
                for (int j = 0; j < impuestos.size(); j++) {
                    respuesta += "        <impuesto>";
                    
                    respuesta += "          <codigo>" + impuestos.get(j).getCodigo() + "</codigo>";
                    
                    respuesta += "          <codigoPorcentaje>" + impuestos.get(j).getCodigoPorcentaje() + "</codigoPorcentaje>";
                    
                    respuesta += "          <tarifa>" + impuestos.get(j).getTarifa() + "</tarifa>";
                    
                    respuesta += "          <baseImponible>" + impuestos.get(j).getBaseImponible() + "</baseImponible>";
                    
                    respuesta += "          <valor>" + impuestos.get(j).getValor() + "</valor>";
                    
                    respuesta += "        </impuesto>";
                    
                }
                respuesta += "      </impuestos>";
                
                respuesta += "    </detalle>";
                
            }
            respuesta += "  </detalles>";
            
            respuesta += "  <infoAdicional>";
            
            Vector<InfoAdicional> infoAdicional = this.getInfoAdicional();
            for (int i = 0; i < infoAdicional.size(); i++) {
                respuesta += "    <campoAdicional nombre=\"" + ArchivoUtil.parsear(infoAdicional.get(i).getNombre()) + "\">" + ArchivoUtil.parsear(infoAdicional.get(i).getValor()) + "</campoAdicional>";
                
            }
            respuesta += "  </infoAdicional>";
            
            respuesta += "</factura>";
        } catch (Exception e) {
            respuesta += e.getMessage();
        }
        return respuesta;
    }

    public double getSubtotal14() {
        double total = 0.0;
        Vector<Detalle> detalles = this.getDetalles();
        for (int i = 0; i < detalles.size(); i++) {
            boolean foo = false;
            Vector<Impuesto> impuestos = detalles.get(i).getImpuestos();
            for (int j = 0; j < impuestos.size(); j++) {
                if (impuestos.get(j).getCodigo() == 2) {
                    if (impuestos.get(j).getCodigoPorcentaje() == 3) {
                        foo = true;
                    }
                }
            }
            if (foo) {
                total += detalles.get(i).getPrecioTotalSinImpuesto();
            }
        }
        return total;
    }

    public double getSubtotal12() {
        double total = 0.0;
        Vector<Detalle> detalles = this.getDetalles();
        for (int i = 0; i < detalles.size(); i++) {
            boolean foo = false;
            Vector<Impuesto> impuestos = detalles.get(i).getImpuestos();
            for (int j = 0; j < impuestos.size(); j++) {
                if (impuestos.get(j).getCodigo() == 2) {
                    if (impuestos.get(j).getCodigoPorcentaje() == 2) {
                        foo = true;
                    }
                }
            }
            if (foo) {
                total += detalles.get(i).getPrecioTotalSinImpuesto();
            }
        }
        return total;
    }

    public double getSubtotal0() {
        double total = 0.0;
        Vector<Detalle> detalles = this.getDetalles();
        for (int i = 0; i < detalles.size(); i++) {
            boolean foo = false;
            Vector<Impuesto> impuestos = detalles.get(i).getImpuestos();
            for (int j = 0; j < impuestos.size(); j++) {
                if (impuestos.get(j).getCodigo() == 2) {
                    if (impuestos.get(j).getCodigoPorcentaje() == 0) {
                        foo = true;
                    }
                }
            }
            if (foo) {
                total += detalles.get(i).getPrecioTotalSinImpuesto();
            }
        }
        return total;
    }

    public double getSubtotalNoObjetoDeIVA() {
        double total = 0.0;
        Vector<Detalle> detalles = this.getDetalles();
        for (int i = 0; i < detalles.size(); i++) {
            boolean foo = false;
            Vector<Impuesto> impuestos = detalles.get(i).getImpuestos();
            for (int j = 0; j < impuestos.size(); j++) {
                if (impuestos.get(j).getCodigo() == 2) {
                    if (impuestos.get(j).getCodigoPorcentaje() == 6) {
                        foo = true;
                    }
                }
            }
            if (foo) {
                total += detalles.get(i).getPrecioTotalSinImpuesto();
            }
        }
        return total;
    }

    public double getSubtotalExentoDeIVA() {
        double total = 0.0;
        Vector<Detalle> detalles = this.getDetalles();
        for (int i = 0; i < detalles.size(); i++) {
            boolean foo = false;
            Vector<Impuesto> impuestos = detalles.get(i).getImpuestos();
            for (int j = 0; j < impuestos.size(); j++) {
                if (impuestos.get(j).getCodigo() == 2) {
                    if (impuestos.get(j).getCodigoPorcentaje() == 7) {
                        foo = true;
                    }
                }
            }
            if (foo) {
                total += detalles.get(i).getPrecioTotalSinImpuesto();
            }
        }
        return total;
    }

    public double getICE() {
        double total = 0.0;
        Vector<TotalImpuesto> impuestos = this.getTotalImpuestos();
        for (int i = 0; i < impuestos.size(); i++) {
            if (impuestos.get(i).getCodigo() == 3) {
                total += impuestos.get(i).getValor();
            }
        }
        return total;
    }

    public double getIVA14() {
        double total = this.getSubtotal14() * 0.14;
        return total;
    }

    public double getIVA12() {
        double total = this.getSubtotal12() * 0.12;
        return total;
    }

    public double getIRBPNR() {
        double total = 0.0;
        Vector<TotalImpuesto> impuestos = this.getTotalImpuestos();
        for (int i = 0; i < impuestos.size(); i++) {
            if (impuestos.get(i).getCodigo() == 5) {
                total += impuestos.get(i).getValor();
            }
        }
        return total;
    }

    public String getComercioExterior() {
        return comercioExterior;
    }

    public void setComercioExterior(String comercioExterior) {
        this.comercioExterior = comercioExterior;
    }

    public String getIncoTermFactura() {
        return incoTermFactura;
    }

    public void setIncoTermFactura(String incoTermFactura) {
        this.incoTermFactura = incoTermFactura;
    }

    public String getLugarIncoTerm() {
        return lugarIncoTerm;
    }

    public void setLugarIncoTerm(String lugarIncoTerm) {
        this.lugarIncoTerm = lugarIncoTerm;
    }

    public int getPaisOrigen() {
        return paisOrigen;
    }

    public void setPaisOrigen(int paisOrigen) {
        this.paisOrigen = paisOrigen;
    }

    public String getPuertoEmbarque() {
        return puertoEmbarque;
    }

    public void setPuertoEmbarque(String puertoEmbarque) {
        this.puertoEmbarque = puertoEmbarque;
    }

    public String getPuertoDestino() {
        return puertoDestino;
    }

    public void setPuertoDestino(String puertoDestino) {
        this.puertoDestino = puertoDestino;
    }

    public int getPaisDestino() {
        return paisDestino;
    }

    public void setPaisDestino(int paisDestino) {
        this.paisDestino = paisDestino;
    }

    public int getPaisAdquisicion() {
        return paisAdquisicion;
    }

    public void setPaisAdquisicion(int paisAdquisicion) {
        this.paisAdquisicion = paisAdquisicion;
    }

    public String getDireccionComprador() {
        return direccionComprador;
    }

    public void setDireccionComprador(String dirComprador) {
        this.direccionComprador = dirComprador;
    }

    public String getIncoTermTotalSinImpuestos() {
        return incoTermTotalSinImpuestos;
    }

    public void setIncoTermTotalSinImpuestos(String incoTermTotalSinImpuestos) {
        this.incoTermTotalSinImpuestos = incoTermTotalSinImpuestos;
    }

    public Double getFleteInternacional() {
        return fleteInternacional;
    }

    public void setFleteInternacional(Double fleteInternacional) {
        this.fleteInternacional = fleteInternacional;
    }

    public Double getSeguroInternacional() {
        return seguroInternacional;
    }

    public void setSeguroInternacional(Double seguroInternacional) {
        this.seguroInternacional = seguroInternacional;
    }

    public Double getGastosAduaneros() {
        return gastosAduaneros;
    }

    public void setGastosAduaneros(Double gastosAduaneros) {
        this.gastosAduaneros = gastosAduaneros;
    }

    public Double getGastosTransporteOtros() {
        return gastosTransporteOtros;
    }

    public void setGastosTransporteOtros(Double gastosTransporteOtros) {
        this.gastosTransporteOtros = gastosTransporteOtros;
    }

}
