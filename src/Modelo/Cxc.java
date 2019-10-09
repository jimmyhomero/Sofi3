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
public class Cxc {
  Integer codigo;
  String tipo;
  String descripcion; 
  String total;
  String abono;
  String saldo;
  Integer facturas_codigo;
  Integer formasPagoV_codigo;
  Date fechaVencimiento;
  String diasCredito;
  String diasAtrazo;
  Integer clientes_Codigo;
  String estado;
  Integer visible;

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Integer getVisible() {
        return visible;
    }

    public void setVisible(Integer visible) {
        this.visible = visible;
    }
  
  
    public Integer getClientes_Codigo() {
        return clientes_Codigo;
    }

    
    public void setClientes_Codigo(Integer clientes_Codigo) {
        this.clientes_Codigo = clientes_Codigo;
    }

  
  
    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

  
    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getAbono() {
        return abono;
    }

    public void setAbono(String abono) {
        this.abono = abono;
    }

    public String getSaldo() {
        return saldo;
    }

    public void setSaldo(String saldo) {
        this.saldo = saldo;
    }

    public Integer getFacturas_codigo() {
        return facturas_codigo;
    }

    public void setFacturas_codigo(Integer facturas_codigo) {
        this.facturas_codigo = facturas_codigo;
    }

    public Integer getFormasPagoV_codigo() {
        return formasPagoV_codigo;
    }

    public void setFormasPagoV_codigo(Integer formasPagoV_codigo) {
        this.formasPagoV_codigo = formasPagoV_codigo;
    }

    public Date getFechaVencimiento() {
        return fechaVencimiento;
    }

    public void setFechaVencimiento(Date fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }

    public String getDiasCredito() {
        return diasCredito;
    }

    public void setDiasCredito(String diasCredito) {
        this.diasCredito = diasCredito;
    }

    public String getDiasAtrazo() {
        return diasAtrazo;
    }

    public void setDiasAtrazo(String diasAtrazo) {
        this.diasAtrazo = diasAtrazo;
    }
    
}
