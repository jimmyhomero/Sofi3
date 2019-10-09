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
public class CajasDetalle {

    Integer codigo;
    String detalle;
    Double valor;
    String tipo;
    String documento;
    String descripcion;
    Date fecha;    
    Integer codigoDocuemnto;
    Integer Cajas_Codigo;

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    
    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Integer getCodigoDocuemnto() {
        return codigoDocuemnto;
    }

    public void setCodigoDocuemnto(Integer codigoDocuemnto) {
        this.codigoDocuemnto = codigoDocuemnto;
    }

    public Integer getCajas_Codigo() {
        return Cajas_Codigo;
    }

    public void setCajas_Codigo(Integer Cajas_Codigo) {
        this.Cajas_Codigo = Cajas_Codigo;
    }
    

}
