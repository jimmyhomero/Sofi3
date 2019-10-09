/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.nube;

import java.util.Date;

/**
 *
 * @author USUARIO
 */
public class Clientes {
    Integer codigo;
    String ruc;
    String nombre;
    String secret;
    String activo;
    Date activoFecha;
    String electronica;
    Date electronicaFecha;
    String telefono;
    String celular;
    String email; 

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getSecret() {
        return secret;
    }

    public void setSecret(String secret) {
        this.secret = secret;
    }

    public String getActivo() {
        return activo;
    }

    public void setActivo(String activo) {
        this.activo = activo;
    }

    public Date getActivoFecha() {
        return activoFecha;
    }

    public void setActivoFecha(Date activoFecha) {
        this.activoFecha = activoFecha;
    }

    public String getElectronica() {
        return electronica;
    }

    public void setElectronica(String electronica) {
        this.electronica = electronica;
    }

    public Date getElectronicaFecha() {
        return electronicaFecha;
    }

    public void setElectronicaFecha(Date electronicaFecha) {
        this.electronicaFecha = electronicaFecha;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
}
