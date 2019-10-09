/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.math.BigInteger;

/**
 *
 * @author USUARIO
 */
public class Proveedores {
    Integer codigo;
    String cedula;
    String nombre;
    String celular;
    String telefono;
    String Direccion;
    String mail;
    String provincia;
    String Ciudad;    
    String nacionalidad;
    String NombreComercial;
    String Vendedor;    
    String observaciones;
    String extension;
    String PagoPredeterminado;
    Integer credito;
    String tiempoCredito;

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public String getCiudad() {
        return Ciudad;
    }

    public void setCiudad(String Ciudad) {
        this.Ciudad = Ciudad;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public String getNombreComercial() {
        return NombreComercial;
    }

    public void setNombreComercial(String NombreComercial) {
        this.NombreComercial = NombreComercial;
    }

    public String getVendedor() {
        return Vendedor;
    }

    public void setVendedor(String Vendedor) {
        this.Vendedor = Vendedor;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    public String getPagoPredeterminado() {
        return PagoPredeterminado;
    }

    public void setPagoPredeterminado(String PagoPredeterminado) {
        this.PagoPredeterminado = PagoPredeterminado;
    }

    public Integer getCredito() {
        return credito;
    }

    public void setCredito(Integer credito) {
        this.credito = credito;
    }

    public String getTiempoCredito() {
        return tiempoCredito;
    }

    public void setTiempoCredito(String tiempoCredito) {
        this.tiempoCredito = tiempoCredito;
    }

    @Override
    public String toString() {
        return  nombre;
    }
    
}
