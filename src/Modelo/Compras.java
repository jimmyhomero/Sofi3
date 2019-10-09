/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author USUARIO
 */
public class Compras {

    Integer codigo;
    Date fecha;
    Timestamp hora;
    String iva;
    String iva_valor;
    String subtotaI_con_iva;
    String subtotal_sin_iva;
    String total;
    String utilidad;
    String tipo_documentoID;
    String tipo_documento;
    String descuento;
    Integer proveedores_codigo;
    Integer Usuarios_Codigo;
    String equipo;
    String secuencia;
    boolean anulada;
    String fechain;
    Integer estado;
    String calveAcceso;
    String DescripcionElectronica;
    Integer autorizado;
    String establecimiento;
    String ptoEmision;
    String secfactura;
    String formaPago;
    Double efectivo;
    Double Cambio;
    Integer Nota_Codigo;
    String sustento;
    String sustentoID;

    public Integer getNota_Codigo() {
        return Nota_Codigo;
    }

    public void setNota_Codigo(Integer Nota_Codigo) {
        this.Nota_Codigo = Nota_Codigo;
    }

    public String getSustento() {
        return sustento;
    }

    public void setSustento(String sustento) {
        this.sustento = sustento;
    }

    public String getSustentoID() {
        return sustentoID;
    }

    public void setSustentoID(String sustentoID) {
        this.sustentoID = sustentoID;
    }
    
    
    public String getTipo_documentoID() {
        return tipo_documentoID;
    }

    public void setTipo_documentoID(String tipo_documentoID) {
        this.tipo_documentoID = tipo_documentoID;
    }
    
    
    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Timestamp getHora() {
        return hora;
    }

    public void setHora(Timestamp hora) {
        this.hora = hora;
    }

    public String getIva() {
        return iva;
    }

    public void setIva(String iva) {
        this.iva = iva;
    }

    public String getSubtotaI_con_iva() {
        return subtotaI_con_iva;
    }

    public void setSubtotaI_con_iva(String subtotaI_con_iva) {
        this.subtotaI_con_iva = subtotaI_con_iva;
    }

    public String getSubtotal_sin_iva() {
        return subtotal_sin_iva;
    }

    public void setSubtotal_sin_iva(String subtotal_sin_iva) {
        this.subtotal_sin_iva = subtotal_sin_iva;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getUtilidad() {
        return utilidad;
    }

    public void setUtilidad(String utilidad) {
        this.utilidad = utilidad;
    }

    public String getTipo_documento() {
        return tipo_documento;
    }

    public void setTipo_documento(String tipo_documento) {
        this.tipo_documento = tipo_documento;
    }

    public String getDescuento() {
        return descuento;
    }

    public void setDescuento(String descuento) {
        this.descuento = descuento;
    }

    public Integer getProveedores_codigo() {
        return proveedores_codigo;
    }

    public void setProveedores_codigo(Integer proveedores_codigo) {
        this.proveedores_codigo = proveedores_codigo;
    }


    public Integer getUsuarios_Codigo() {
        return Usuarios_Codigo;
    }

    public void setUsuarios_Codigo(Integer Usuarios_Codigo) {
        this.Usuarios_Codigo = Usuarios_Codigo;
    }

    public String getEquipo() {
        return equipo;
    }

    public void setEquipo(String equipo) {
        this.equipo = equipo;
    }

    public String getSecuencia() {
        return secuencia;
    }

    public void setSecuencia(String secuencia) {
        this.secuencia = secuencia;
    }

    public boolean isAnulada() {
        return anulada;
    }

    public void setAnulada(boolean anulada) {
        this.anulada = anulada;
    }

    public String getFechain() {
        return fechain;
    }

    public void setFechain(String fechain) {
        this.fechain = fechain;
    }

    public String getIva_valor() {
        return iva_valor;
    }

    public void setIva_valor(String iva_valor) {
        this.iva_valor = iva_valor;
    }

    public Integer getEstado() {
        return estado;
    }

    public void setEstado(Integer estado) {
        this.estado = estado;
    }

    public String getCalveAcceso() {
        return calveAcceso;
    }

    public void setCalveAcceso(String calveAcceso) {
        this.calveAcceso = calveAcceso;
    }

    public String getDescripcionElectronica() {
        return DescripcionElectronica;
    }

    public void setDescripcionElectronica(String DescripcionElectronica) {
        this.DescripcionElectronica = DescripcionElectronica;
    }

    public Integer getAutorizado() {
        return autorizado;
    }

    public void setAutorizado(Integer autorizado) {
        this.autorizado = autorizado;
    }

    public String getEstablecimiento() {
        return establecimiento;
    }

    public void setEstablecimiento(String establecimiento) {
        this.establecimiento = establecimiento;
    }

    public String getPtoEmision() {
        return ptoEmision;
    }

    public void setPtoEmision(String ptoEmision) {
        this.ptoEmision = ptoEmision;
    }

    public String getSecfactura() {
        return secfactura;
    }

    public void setSecfactura(String secfactura) {
        this.secfactura = secfactura;
    }

    public String getFormaPago() {
        return formaPago;
    }

    public void setFormaPago(String formaPago) {
        this.formaPago = formaPago;
    }

    public Double getEfectivo() {
        return efectivo;
    }

    public void setEfectivo(Double efectivo) {
        this.efectivo = efectivo;
    }

    public Double getCambio() {
        return Cambio;
    }

    public void setCambio(Double Cambio) {
        this.Cambio = Cambio;
    }
    
    

}
