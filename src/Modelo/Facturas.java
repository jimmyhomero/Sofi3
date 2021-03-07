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
public class Facturas {

    Integer codigo;
    Date fecha;
    Timestamp hora;
    String iva;
    String iva_valor;
    String subtotaI_con_iva;
    String subtotal_sin_iva;
    String total;
    String utilidad;
    String tipo_documento;
    String descuento;
    Integer Clientes_codigo;
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
    Integer equipos_codigo;
    Integer codigo_doc_afectado_nc;
    String secuencia_doc_afectado_nc;
    String fecha_doc_afectado_nc;
    String valorAfectadoxNCenFactura;

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

    public Integer getClientes_codigo() {
        return Clientes_codigo;
    }

    public void setClientes_codigo(Integer Clientes_codigo) {
        this.Clientes_codigo = Clientes_codigo;
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
        if (formaPago.equals("EFECTIVO")) {
            return "SIN UTILIZACION DEL SISTEMA FINANCIERO";
        } else if (formaPago.equals("CHEQUE")) {
            return "CHEQUE PROPIO";
        } else {
            return formaPago;
        }

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

    public Integer getEquipos_codigo() {
        return equipos_codigo;
    }

    public void setEquipos_codigo(Integer equipos_codigo) {
        this.equipos_codigo = equipos_codigo;
    }

    public Integer getCodigo_doc_afectado_nc() {
        return codigo_doc_afectado_nc;
    }

    public void setCodigo_doc_afectado_nc(Integer codigo_doc_afectado_nc) {
        this.codigo_doc_afectado_nc = codigo_doc_afectado_nc;
    }

    public String getSecuencia_doc_afectado_nc() {
        return secuencia_doc_afectado_nc;
    }

    public void setSecuencia_doc_afectado_nc(String secuencia_doc_afectado_nc) {
        this.secuencia_doc_afectado_nc = secuencia_doc_afectado_nc;
    }
    

    public String getFecha_doc_afectado_nc() {
        return fecha_doc_afectado_nc;
    }

    public void setFecha_doc_afectado_nc(String fecha_doc_afectado_nc) {
        this.fecha_doc_afectado_nc = fecha_doc_afectado_nc;
    }

    public void setValorAfectadoxNCenFactura(String valorAfectadoxNCenFactura) {
        this.valorAfectadoxNCenFactura = valorAfectadoxNCenFactura;
    }

    public String getValorAfectadoxNCenFactura() {
        return valorAfectadoxNCenFactura;
    }

    @Override
    public String toString() {
        return "Facturas{" + "codigo=" + codigo + ", fecha=" + fecha + ", hora=" + hora + ", iva=" + iva + ", iva_valor=" + iva_valor + ", subtotaI_con_iva=" + subtotaI_con_iva + ", subtotal_sin_iva=" + subtotal_sin_iva + ", total=" + total + ", utilidad=" + utilidad + ", tipo_documento=" + tipo_documento + ", descuento=" + descuento + ", Clientes_codigo=" + Clientes_codigo + ", Usuarios_Codigo=" + Usuarios_Codigo + ", equipo=" + equipo + ", secuencia=" + secuencia + ", anulada=" + anulada + ", fechain=" + fechain + ", estado=" + estado + ", calveAcceso=" + calveAcceso + ", DescripcionElectronica=" + DescripcionElectronica + ", autorizado=" + autorizado + ", establecimiento=" + establecimiento + ", ptoEmision=" + ptoEmision + ", secfactura=" + secfactura + ", formaPago=" + formaPago + ", efectivo=" + efectivo + ", Cambio=" + Cambio + ", equipos_codigo=" + equipos_codigo + ", codigo_doc_afectado_nc=" + codigo_doc_afectado_nc + ", secuencia_doc_afectado_nc=" + secuencia_doc_afectado_nc + ", fecha_doc_afectado_nc=" + fecha_doc_afectado_nc + ", valorAfectadoxNCenFactura=" + valorAfectadoxNCenFactura + '}';
    }
    
    

}
