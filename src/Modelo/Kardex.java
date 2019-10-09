/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.Date;

/**
 *
 * @author USUARIO
 */
public class Kardex {
      Integer codigo;
  Date fecha;
  
  String bodega;
  String detalle;
  String incantidad;
  String incosto;
  String inpvp;
  String outcantidad;
  String outcosto;
  String outpvp;
  String saldocantidad;
  String saldocosto;
  String saldopvp;
  Integer productos_Codigo; 

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

    public String getBodega() {
        return bodega;
    }

    public void setBodega(String bodega) {
        this.bodega = bodega;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public String getIncantidad() {
        return incantidad;
    }

    public void setIncantidad(String incantidad) {
        this.incantidad = incantidad;
    }

    public String getIncosto() {
        return incosto;
    }

    public void setIncosto(String incosto) {
        this.incosto = incosto;
    }

    public String getInpvp() {
        return inpvp;
    }

    public void setInpvp(String inpvp) {
        this.inpvp = inpvp;
    }

    public String getOutcantidad() {
        return outcantidad;
    }

    public void setOutcantidad(String outcantidad) {
        this.outcantidad = outcantidad;
    }

    public String getOutcosto() {
        return outcosto;
    }

    public void setOutcosto(String outcosto) {
        this.outcosto = outcosto;
    }

    public String getOutpvp() {
        return outpvp;
    }

    public void setOutpvp(String outpvp) {
        this.outpvp = outpvp;
    }

    public String getSaldocantidad() {
        return saldocantidad;
    }

    public void setSaldocantidad(String saldocantidad) {
        this.saldocantidad = saldocantidad;
    }

    public String getSaldocosto() {
        return saldocosto;
    }

    public void setSaldocosto(String saldocosto) {
        this.saldocosto = saldocosto;
    }

    public String getSaldopvp() {
        return saldopvp;
    }

    public void setSaldopvp(String saldopvp) {
        this.saldopvp = saldopvp;
    }

    public Integer getProductos_Codigo() {
        return productos_Codigo;
    }

    public void setProductos_Codigo(Integer productos_Codigo) {
        this.productos_Codigo = productos_Codigo;
    }

    
}
