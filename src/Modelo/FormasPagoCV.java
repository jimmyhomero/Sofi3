/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author USUARIO
 */
public class FormasPagoCV {

    private Integer codigo;
    private String formaPago;
    private String descripcion;
    private String tipoPago;
    private Integer planCodigo;
    private Integer afectaACaja;
    private Integer numeroCuotas;
    private Double porcentajeEntrada;
    private String peridoCobranza;
    private String esCxcCxp;
    private Integer sriFormaPagoCodigo;
    private Integer codigo_tipoPrecio;
    private Integer dias_credito;

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getFormaPago() {
        return formaPago;
    }

    public void setFormaPago(String formaPago) {
        this.formaPago = formaPago;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getTipoPago() {
        return tipoPago;
    }

    public void setTipoPago(String tipoPago) {
        this.tipoPago = tipoPago;
    }

    public Integer getPlanCodigo() {
        return planCodigo;
    }

    public void setPlanCodigo(Integer planCodigo) {
        this.planCodigo = planCodigo;
    }

    public Integer getAfectaACaja() {
        return afectaACaja;
    }

    public void setAfectaACaja(Integer afectaACaja) {
        this.afectaACaja = afectaACaja;
    }

    public Integer getNumeroCuotas() {
        return numeroCuotas;
    }

    public void setNumeroCuotas(Integer numeroCuotas) {
        this.numeroCuotas = numeroCuotas;
    }

    public Double getPorcentajeEntrada() {
        return porcentajeEntrada;
    }

    public void setPorcentajeEntrada(Double porcentajeEntrada) {
        this.porcentajeEntrada = porcentajeEntrada;
    }

    public String getPeridoCobranza() {
        return peridoCobranza;
    }

    public void setPeridoCobranza(String peridoCobranza) {
        this.peridoCobranza = peridoCobranza;
    }

    public String getEsCxcCxp() {
        return esCxcCxp;
    }

    public void setEsCxcCxp(String esCxcCxp) {
        this.esCxcCxp = esCxcCxp;
    }

    public Integer getSriFormaPagoCodigo() {
        return sriFormaPagoCodigo;
    }

    public void setSriFormaPagoCodigo(Integer sriFormaPagoCodigo) {
        this.sriFormaPagoCodigo = sriFormaPagoCodigo;
    }

    public Integer getCodigo_tipoPrecio() {
        return codigo_tipoPrecio;
    }

    public void setCodigo_tipoPrecio(Integer codigo_tipoPrecio) {
        this.codigo_tipoPrecio = codigo_tipoPrecio;
    }

    @Override
    public String toString() {
        return "FormasPagoCV{" + "codigo=" + codigo + ", formaPago=" + formaPago + ", descripcion=" + descripcion + ", tipoPago=" + tipoPago + ", planCodigo=" + planCodigo + ", afectaACaja=" + afectaACaja + ", numeroCuotas=" + numeroCuotas + ", porcentajeEntrada=" + porcentajeEntrada + ", peridoCobranza=" + peridoCobranza + ", esCxcCxp=" + esCxcCxp + ", sriFormaPagoCodigo=" + sriFormaPagoCodigo + ", codigo_tipoPrecio=" + codigo_tipoPrecio + '}';
    }

    public Integer getDias_credito() {
        return dias_credito;
    }

    public void setDias_credito(Integer dias_credito) {
        this.dias_credito = dias_credito;
    }
    
}
