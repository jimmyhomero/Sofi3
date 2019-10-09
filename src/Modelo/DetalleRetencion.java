/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author USUARIO
 */
public class DetalleRetencion {
    Integer codigo;
    String ejercicio;
    Double base;
    String impuesto;
    String id;
    int porcentaje;
   Double retenido;
    Integer Retencion_codigo;

    public Double getRetenido() {
        return retenido;
    }

    public void setRetenido(Double retenido) {
        this.retenido = retenido;
    }

    
    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getEjercicio() {
        return ejercicio;
    }

    public void setEjercicio(String ejercicio) {
        this.ejercicio = ejercicio;
    }

    public Double getBase() {
        return base;
    }

    public void setBase(Double base) {
        this.base = base;
    }

    public String getImpuesto() {
        return impuesto;
    }

    public void setImpuesto(String impuesto) {
        this.impuesto = impuesto;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(int porcentaje) {
        this.porcentaje = porcentaje;
    }

    public Integer getRetencion_codigo() {
        return Retencion_codigo;
    }

    public void setRetencion_codigo(Integer Retencion_codigo) {
        this.Retencion_codigo = Retencion_codigo;
    }
    
    
}
