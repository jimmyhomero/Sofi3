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
public class Anticipos {
    Integer codigo;
    String descripcion;
    Double total;
    Date fecha;
    Double usado;
    Double Saldo ;
    Integer clientes_codigo;
    String tipo_movimeinto;
    String documento;
    String secuencia;
    String motivo;
    Integer documeto_codigo;

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Double getUsado() {
        return usado;
    }

    public void setUsado(Double usado) {
        this.usado = usado;
    }

    public Double getSaldo() {
        return Saldo;
    }

    public void setSaldo(Double Saldo) {
        this.Saldo = Saldo;
    }

    public Integer getClientes_codigo() {
        return clientes_codigo;
    }

    public void setClientes_codigo(Integer clientes_codigo) {
        this.clientes_codigo = clientes_codigo;
    }

    public String getTipo_movimeinto() {
        return tipo_movimeinto;
    }

    public void setTipo_movimeinto(String tipo_movimeinto) {
        this.tipo_movimeinto = tipo_movimeinto;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getSecuencia() {
        return secuencia;
    }

    public void setSecuencia(String secuencia) {
        this.secuencia = secuencia;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public Integer getDocumeto_codigo() {
        return documeto_codigo;
    }

    public void setDocumeto_codigo(Integer documeto_codigo) {
        this.documeto_codigo = documeto_codigo;
    }
    
}
