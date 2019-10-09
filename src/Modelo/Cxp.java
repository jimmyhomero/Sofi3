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
public class Cxp {
  Integer codigo;
  String tipo;
  String descripcion; 
  String total;
  String abono;
  String saldo;
  Integer compras_codigo;
  Integer formasPagoc_codigo;
  Date fechaVencimiento;
  String diasCredito;
  String diasAtrazo;
  Integer proveedores_Codigo;

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

    public Integer getCompras_codigo() {
        return compras_codigo;
    }

    public void setCompras_codigo(Integer compras_codigo) {
        this.compras_codigo = compras_codigo;
    }

    public Integer getFormasPagoc_codigo() {
        return formasPagoc_codigo;
    }

    public void setFormasPagoc_codigo(Integer formasPagoc_codigo) {
        this.formasPagoc_codigo = formasPagoc_codigo;
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

    public Integer getProveedores_Codigo() {
        return proveedores_Codigo;
    }

    public void setProveedores_Codigo(Integer proveedores_Codigo) {
        this.proveedores_Codigo = proveedores_Codigo;
    }

    
}
