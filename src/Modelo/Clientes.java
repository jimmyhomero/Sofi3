/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.math.BigInteger;
import java.sql.Date;

/**
 *
 * @author USUARIO
 */
public class Clientes {
    Integer codigo;
    String empresa; 
    String cedula;
    String nombre;
    String celular;
    String telefono;
    String Direccion;
    String mail;
    String provincia;
    String Ciudad;    
    String nacionalidad;
    Integer pagoPredeterminado;
    Integer tipoCliente;
    Integer VendedorPredeterminado;
    String observaciones;
    String estadoCivil;
    String huella;
    String genereo;
    String Nacimiento;

    public String getEmpresa() {
        return empresa;
    }

    public void setEmpresa(String empresa) {
        this.empresa = empresa;
    }

    
    public String getEstadoCivil() {
        return estadoCivil;
    }

    public String getNacimiento() {
        return Nacimiento;
    }

    public void setNacimiento(String Nacimiento) {
        this.Nacimiento = Nacimiento;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public String getHuella() {
        return huella;
    }

    public void setHuella(String huella) {
        this.huella = huella;
    }

    public String getGenereo() {
        return genereo;
    }

    public void setGenereo(String genereo) {
        this.genereo = genereo;
    }

   

    
    
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

    public Integer getPagoPredeterminado() {
        return pagoPredeterminado;
    }

    public void setPagoPredeterminado(Integer pagoPredeterminado) {
        this.pagoPredeterminado = pagoPredeterminado;
    }

    public Integer getTipoCliente() {
        return tipoCliente;
    }

    public void setTipoCliente(Integer tipoCliente) {
        this.tipoCliente = tipoCliente;
    }

    public Integer getVendedorPredeterminado() {
        return VendedorPredeterminado;
    }

    public void setVendedorPredeterminado(Integer VendedorPredeterminado) {
        this.VendedorPredeterminado = VendedorPredeterminado;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    @Override
    public String toString() {
        return nombre+ " "+cedula;
    }
            
    
    
    
}
