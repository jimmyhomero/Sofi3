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
public class Precios {
    
    Integer codigo;
    String nombre;
    Double valor;
    Double utilidad;
    Integer codigo_centrocosto;
   Integer codigo_tipo_usuario;
   Integer eliminaDescuentos;
   Double cantidadMinima;
   Double utilidadRespectoAlcosto;
   Double utilidadRespectoAlPvp;
   Integer actualizaPrecioRespectoalCOSTOalPVP;
   Integer requiereClavaAdministrador;

    
    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public Double getUtilidad() {
        return utilidad;
    }

    public void setUtilidad(Double utilidad) {
        this.utilidad = utilidad;
    }

    public Integer getCodigo_centrocosto() {
        return codigo_centrocosto;
    }

    public void setCodigo_centrocosto(Integer codigo_centrocosto) {
        this.codigo_centrocosto = codigo_centrocosto;
    }

    public Integer getCodigo_tipo_usuario() {
        return codigo_tipo_usuario;
    }

    public void setCodigo_tipo_usuario(Integer codigo_tipo_usuario) {
        this.codigo_tipo_usuario = codigo_tipo_usuario;
    }

    public Integer getEliminaDescuentos() {
        return eliminaDescuentos;
    }

    public void setEliminaDescuentos(Integer eliminaDescuentos) {
        this.eliminaDescuentos = eliminaDescuentos;
    }

    public Double getCantidadMinima() {
        return cantidadMinima;
    }

    public void setCantidadMinima(Double cantidadMinima) {
        this.cantidadMinima = cantidadMinima;
    }

    public Double getUtilidadRespectoAlcosto() {
        return utilidadRespectoAlcosto;
    }

    public void setUtilidadRespectoAlcosto(Double utilidadRespectoAlcosto) {
        this.utilidadRespectoAlcosto = utilidadRespectoAlcosto;
    }

    public Double getUtilidadRespectoAlPvp() {
        return utilidadRespectoAlPvp;
    }

    public void setUtilidadRespectoAlPvp(Double utilidadRespectoAlPvp) {
        this.utilidadRespectoAlPvp = utilidadRespectoAlPvp;
    }

    public Integer getActualizaPrecioRespectoalCOSTOalPVP() {
        return actualizaPrecioRespectoalCOSTOalPVP;
    }

    public void setActualizaPrecioRespectoalCOSTOalPVP(Integer actualizaPrecioRespectoalCOSTOalPVP) {
        this.actualizaPrecioRespectoalCOSTOalPVP = actualizaPrecioRespectoalCOSTOalPVP;
    }

    public Integer getRequiereClavaAdministrador() {
        return requiereClavaAdministrador;
    }

    public void setRequiereClavaAdministrador(Integer requiereClavaAdministrador) {
        this.requiereClavaAdministrador = requiereClavaAdministrador;
    }
    
    
}
