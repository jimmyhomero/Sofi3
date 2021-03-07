/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Vista.Principal;
import java.awt.Image;
import java.math.BigInteger;
import javax.swing.Icon;
import javax.swing.ImageIcon;

/**
 *
 * @author USUARIO
 */
public class ProductosTemp {
    Integer codigo;
    String nombreI;
    String nombreE;
    String codigoProductoI;
    String codigoProductoE;
    Integer CodigoProveedor;
    Double costo;
    String fechaCompra;    
    String numeroFactura;

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getNombreI() {
        return nombreI;
    }

    public void setNombreI(String nombreI) {
        this.nombreI = nombreI;
    }

    public String getNombreE() {
        return nombreE;
    }

    public void setNombreE(String nombreE) {
        this.nombreE = nombreE;
    }

    public String getCodigoProductoI() {
        return codigoProductoI;
    }

    public void setCodigoProductoI(String codigoProductoI) {
        this.codigoProductoI = codigoProductoI;
    }

    public String getCodigoProductoE() {
        return codigoProductoE;
    }

    public void setCodigoProductoE(String codigoProductoE) {
        this.codigoProductoE = codigoProductoE;
    }

    public Integer getCodigoProveedor() {
        return CodigoProveedor;
    }

    public void setCodigoProveedor(Integer CodigoProveedor) {
        this.CodigoProveedor = CodigoProveedor;
    }

    public Double getCosto() {
        return costo;
    }

    public void setCosto(Double costo) {
        this.costo = costo;
    }

    public String getFechaCompra() {
        return fechaCompra;
    }

    public void setFechaCompra(String fechaCompra) {
        this.fechaCompra = fechaCompra;
    }

    public String getNumeroFactura() {
        return numeroFactura;
    }

    public void setNumeroFactura(String numeroFactura) {
        this.numeroFactura = numeroFactura;
    }


}