/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Date;

/**
 *
 * @author USUARIO
 */
public class Retencion_ {
    Integer codig;
    Integer proveedor_codigo;
    Integer compras_codigo;
    Integer usuario_codigo;
    String tipo_comprobante;
    String autorizacion;
    String compra_seceuncia;
    String secuencia;
    Date fecha;
    Date caducidad;
    Double total;
    String concepto;
    String sec1;
    String sec2;
    String sec3;
    int estado;

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    

    public String getSec1() {
        return sec1;
    }

    public void setSec1(String sec1) {
        this.sec1 = sec1;
    }

    public String getSec2() {
        return sec2;
    }

    public void setSec2(String sec2) {
        this.sec2 = sec2;
    }

    public String getSec3() {
        return sec3;
    }

    public void setSec3(String sec3) {
        this.sec3 = sec3;
    }

    
    public Integer getCodig() {
        return codig;
    }

    public void setCodig(Integer codig) {
        this.codig = codig;
    }

    public Integer getProveedor_codigo() {
        return proveedor_codigo;
    }

    public void setProveedor_codigo(Integer proveedor_codigo) {
        this.proveedor_codigo = proveedor_codigo;
    }

    public Integer getCompras_codigo() {
        return compras_codigo;
    }

    public void setCompras_codigo(Integer compras_codigo) {
        this.compras_codigo = compras_codigo;
    }

    public Integer getUsuario_codigo() {
        return usuario_codigo;
    }

    public void setUsuario_codigo(Integer usuario_codigo) {
        this.usuario_codigo = usuario_codigo;
    }

    public String getTipo_comprobante() {
        return tipo_comprobante;
    }

    public void setTipo_comprobante(String tipo_comprobante) {
        this.tipo_comprobante = tipo_comprobante;
    }

    public String getAutorizacion() {
        return autorizacion;
    }

    public void setAutorizacion(String autorizacion) {
        this.autorizacion = autorizacion;
    }

    public String getCompra_seceuncia() {
        return compra_seceuncia;
    }

    public void setCompra_seceuncia(String compra_seceuncia) {
        this.compra_seceuncia = compra_seceuncia;
    }

    public String getSecuencia() {
        return secuencia;
    }

    public void setSecuencia(String secuencia) {
        this.secuencia = secuencia;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Date getCaducidad() {
        return caducidad;
    }

    public void setCaducidad(Date caducidad) {
        this.caducidad = caducidad;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public String getConcepto() {
        return concepto;
    }

    public void setConcepto(String concepto) {
        this.concepto = concepto;
    }
    
}
