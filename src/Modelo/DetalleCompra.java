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
public class DetalleCompra {
    Integer codigo;
    String cantidad;
    String detalle;
    String iva;
    String descuento;
    String valorUnitario;
    String valorTotal;
    Integer compra_Codigo;
    Integer productos_codigo;
    String observaciones;

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public String getIva() {
        return iva;
    }

    public void setIva(String iva) {
        this.iva = iva;
    }

    public String getDescuento() {
        return descuento;
    }

    public void setDescuento(String descuento) {
        this.descuento = descuento;
    }

    public String getValorUnitario() {
        return valorUnitario;
    }

    public void setValorUnitario(String valorUnitario) {
        this.valorUnitario = valorUnitario;
    }

    public String getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(String valorTotal) {
        this.valorTotal = valorTotal;
    }

    public Integer getCompra_Codigo() {
        return compra_Codigo;
    }

    public void setCompra_Codigo(Integer compra_Codigo) {
        this.compra_Codigo = compra_Codigo;
    }


    public Integer getProductos_codigo() {
        return productos_codigo;
    }

    public void setProductos_codigo(Integer productos_codigo) {
        this.productos_codigo = productos_codigo;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }
    
}
