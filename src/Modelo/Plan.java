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
public class Plan {
    Integer id;
    String codigo_cuenta;
    Integer visble;
    String descricion;
    String pertenece;
    Integer tipo;
    String observaciones;
    String orden;
    String actualizar;
    String saldo;    
    Integer centro;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCodigo_cuenta() {
        return codigo_cuenta;
    }

    public void setCodigo_cuenta(String codigo_cuenta) {
        this.codigo_cuenta = codigo_cuenta;
    }

    public Integer getVisble() {
        return visble;
    }

    public void setVisble(Integer visble) {
        this.visble = visble;
    }

    public String getDescricion() {
        return descricion;
    }

    public void setDescricion(String descricion) {
        this.descricion = descricion;
    }

    public String getPertenece() {
        return pertenece;
    }

    public void setPertenece(String pertenece) {
        this.pertenece = pertenece;
    }

    public Integer getTipo() {
        return tipo;
    }

    public void setTipo(Integer tipo) {
        this.tipo = tipo;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public String getOrden() {
        return orden;
    }

    public void setOrden(String orden) {
        this.orden = orden;
    }

    public String getActualizar() {
        return actualizar;
    }

    public void setActualizar(String actualizar) {
        this.actualizar = actualizar;
    }

    public String getSaldo() {
        return saldo;
    }

    public void setSaldo(String saldo) {
        this.saldo = saldo;
    }

    public Integer getCentro() {
        return centro;
    }

    public void setCentro(Integer centro) {
        this.centro = centro;
    }

}