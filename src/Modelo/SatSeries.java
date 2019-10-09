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
public class SatSeries {
    Integer codigo;
    String serie;
    String color;
    Integer disponible;
    Integer satAparato_codigo;
    String compra_sec;
    String venta_sec;
    String descripcion;
    Date fecha_compra;
    Date fecha_venta;

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    
    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public Integer getDisponible() {
        return disponible;
    }

    public void setDisponible(Integer disponible) {
        this.disponible = disponible;
    }

    public Integer getSatAparato_codigo() {
        return satAparato_codigo;
    }

    public void setSatAparato_codigo(Integer satAparato_codigo) {
        this.satAparato_codigo = satAparato_codigo;
    }

    public String getCompra_sec() {
        return compra_sec;
    }

    public void setCompra_sec(String compra_sec) {
        this.compra_sec = compra_sec;
    }

    public String getVenta_sec() {
        return venta_sec;
    }

    public void setVenta_sec(String venta_sec) {
        this.venta_sec = venta_sec;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFecha_compra() {
        return fecha_compra;
    }

    public void setFecha_compra(Date fecha_compra) {
        this.fecha_compra = fecha_compra;
    }

    public Date getFecha_venta() {
        return fecha_venta;
    }

    public void setFecha_venta(Date fecha_venta) {
        this.fecha_venta = fecha_venta;
    }

    @Override
    public String toString() {
        return serie;
    }
    
}
