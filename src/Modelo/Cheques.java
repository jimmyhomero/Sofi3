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
public class Cheques {

Integer codigo;
Integer codigo_banco;
Date fecha_e;
Date fecha_c;
Double valor;
String paguesea;
String titular;
Integer numero;
String referencia; 
Integer codigo_cliente;
Integer codigo_proveedor;
String estado;

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }


    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public Integer getCodigo_banco() {
        return codigo_banco;
    }

    public void setCodigo_banco(Integer codigo_banco) {
        this.codigo_banco = codigo_banco;
    }

    public Date getFecha_e() {
        return fecha_e;
    }

    public void setFecha_e(Date fecha_e) {
        this.fecha_e = fecha_e;
    }

    public Date getFecha_c() {
        return fecha_c;
    }

    public void setFecha_c(Date fecha_c) {
        this.fecha_c = fecha_c;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public String getPaguesea() {
        return paguesea;
    }

    public void setPaguesea(String paguesea) {
        this.paguesea = paguesea;
    }

    public String getTitular() {
        return titular;
    }

    public void setTitular(String titular) {
        this.titular = titular;
    }

    public Integer getNumero() {
        return numero;
    }

    public void setNumero(Integer numero) {
        this.numero = numero;
    }

    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }

    public Integer getCodigo_cliente() {
        return codigo_cliente;
    }

    public void setCodigo_cliente(Integer codigo_cliente) {
        this.codigo_cliente = codigo_cliente;
    }

    public Integer getCodigo_proveedor() {
        return codigo_proveedor;
    }

    public void setCodigo_proveedor(Integer codigo_proveedor) {
        this.codigo_proveedor = codigo_proveedor;
    }


}
