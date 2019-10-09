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
public class Cajas {

    Integer codigo;
    String caja;
    String descripcion;
    Integer estado;
    Date fechaApertura;
    Date fechaCierre;
    Double SaldoInicial;
    Double totalCierre;
    String cajer;

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getCaja() {
        return caja;
    }

    public void setCaja(String caja) {
        this.caja = caja;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Integer getEstado() {
        return estado;
    }

    public void setEstado(Integer estado) {
        this.estado = estado;
    }

    public Date getFechaApertura() {
        return fechaApertura;
    }

    public void setFechaApertura(Date fechaApertura) {
        this.fechaApertura = fechaApertura;
    }

    public Date getFechaCierre() {
        return fechaCierre;
    }

    public void setFechaCierre(Date fechaCierre) {
        this.fechaCierre = fechaCierre;
    }

    public Double getSaldoInicial() {
        return SaldoInicial;
    }

    public void setSaldoInicial(Double SaldoInicial) {
        this.SaldoInicial = SaldoInicial;
    }

    public Double getTotalCierre() {
        return totalCierre;
    }

    public void setTotalCierre(Double totalCierre) {
        this.totalCierre = totalCierre;
    }

    public String getCajer() {
        return cajer;
    }

    public void setCajer(String cajer) {
        this.cajer = cajer;
    }
    

}
