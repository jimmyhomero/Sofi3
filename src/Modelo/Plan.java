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
    String CODIGO_CUENTA;
    Integer VISIBLE;
    String DESCRIPCION;
    String PERTENECE;
    Integer TIPO;
    String OBSERVACIONES;
    String ORDEN;
    String ACTUALIZAR;
    String SALDO;    
    Integer CENTRO;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCODIGO_CUENTA() {
        return CODIGO_CUENTA;
    }

    public void setCODIGO_CUENTA(String CODIGO_CUENTA) {
        this.CODIGO_CUENTA = CODIGO_CUENTA;
    }

    public Integer getVISIBLE() {
        return VISIBLE;
    }

    public void setVISIBLE(Integer VISIBLE) {
        this.VISIBLE = VISIBLE;
    }

    public String getDESCRIPCION() {
        return DESCRIPCION;
    }

    public void setDESCRIPCION(String DESCRIPCION) {
        this.DESCRIPCION = DESCRIPCION;
    }

    public String getPERTENECE() {
        return PERTENECE;
    }

    public void setPERTENECE(String PERTENECE) {
        this.PERTENECE = PERTENECE;
    }

    public Integer getTIPO() {
        return TIPO;
    }

    public void setTIPO(Integer TIPO) {
        this.TIPO = TIPO;
    }

    public String getOBSERVACIONES() {
        return OBSERVACIONES;
    }

    public void setOBSERVACIONES(String OBSERVACIONES) {
        this.OBSERVACIONES = OBSERVACIONES;
    }

    public String getORDEN() {
        return ORDEN;
    }

    public void setORDEN(String ORDEN) {
        this.ORDEN = ORDEN;
    }

    public String getACTUALIZAR() {
        return ACTUALIZAR;
    }

    public void setACTUALIZAR(String ACTUALIZAR) {
        this.ACTUALIZAR = ACTUALIZAR;
    }

    public String getSALDO() {
        return SALDO;
    }

    public void setSALDO(String SALDO) {
        this.SALDO = SALDO;
    }

    public Integer getCENTRO() {
        return CENTRO;
    }

    public void setCENTRO(Integer CENTRO) {
        this.CENTRO = CENTRO;
    }

}