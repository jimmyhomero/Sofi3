/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.math.BigInteger;
import java.util.Date;

/**
 *
 * @author USUARIO
 */
public class Modelos {
    Integer codigo;
    String modelo;
    String Descripcion;
    Integer Marcas_Codigo;

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public Integer getMarcas_Codigo() {
        return Marcas_Codigo;
    }

    public void setMarcas_Codigo(Integer Marcas_Codigo) {
        this.Marcas_Codigo = Marcas_Codigo;
    }

    @Override
    public String toString() {
        return modelo;
    }
    
    
}
