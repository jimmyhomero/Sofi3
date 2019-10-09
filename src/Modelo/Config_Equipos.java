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
public class Config_Equipos {
    Integer codigo;
    String nombre;    
    String valor1;    
    Integer equipos_codigo;
    Integer config2_codigo;

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

    public String getValor1() {
        return valor1;
    }

    public void setValor1(String valor1) {
        this.valor1 = valor1;
    }

    public Integer getEquipos_codigo() {
        return equipos_codigo;
    }

    public void setEquipos_codigo(Integer equipos_codigo) {
        this.equipos_codigo = equipos_codigo;
    }

    public Integer getConfig2_codigo() {
        return config2_codigo;
    }

    public void setConfig2_codigo(Integer config2_codigo) {
        this.config2_codigo = config2_codigo;
    }

    @Override
    public String toString() {
        return "Config_Equipos{" + "codigo=" + codigo + ", nombre=" + nombre + ", valor1=" + valor1 + ", equipos_codigo=" + equipos_codigo + ", config2_codigo=" + config2_codigo + '}';
    }

    }
