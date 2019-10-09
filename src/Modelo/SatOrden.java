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
public class SatOrden {
    Integer codigo;
    String numero;       
    Integer clientes_codigo;
    Integer usuarios_codigo;
    String  descripcion;
    Date fecha_ingreso;

    public Date getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(Date fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }

    
    
    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public Integer getClientes_codigo() {
        return clientes_codigo;
    }

    public void setClientes_codigo(Integer clientes_codigo) {
        this.clientes_codigo = clientes_codigo;
    }

    public Integer getUsuarios_codigo() {
        return usuarios_codigo;
    }

    public void setUsuarios_codigo(Integer usuarios_codigo) {
        this.usuarios_codigo = usuarios_codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    
}
