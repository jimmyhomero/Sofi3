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
public class SatOrdenDetalle {
    Integer codigo;
    String estado;
    String diagnostico;
    String recomendaciones ;
    String accesorios;
    Double presupuesto;
    String retiradoPor;
    Integer cerrado;
    Date ingresado;
    Integer SatAparato_codigo;
    Integer satorden_codigo;

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getDiagnostico() {
        return diagnostico;
    }

    public void setDiagnostico(String diagnostico) {
        this.diagnostico = diagnostico;
    }

    public String getRecomendaciones() {
        return recomendaciones;
    }

    public void setRecomendaciones(String recomendaciones) {
        this.recomendaciones = recomendaciones;
    }

    public String getAccesorios() {
        return accesorios;
    }

    public void setAccesorios(String accesorios) {
        this.accesorios = accesorios;
    }

    public Double getPresupuesto() {
        return presupuesto;
    }

    public void setPresupuesto(Double presupuesto) {
        this.presupuesto = presupuesto;
    }

    public String getRetiradoPor() {
        return retiradoPor;
    }

    public void setRetiradoPor(String retiradoPor) {
        this.retiradoPor = retiradoPor;
    }

    public Integer getCerrado() {
        return cerrado;
    }

    public void setCerrado(Integer cerrado) {
        this.cerrado = cerrado;
    }

    public Date getIngresado() {
        return ingresado;
    }

    public void setIngresado(Date ingresado) {
        this.ingresado = ingresado;
    }

    public Integer getSatAparato_codigo() {
        return SatAparato_codigo;
    }

    public void setSatAparato_codigo(Integer SatAparato_codigo) {
        this.SatAparato_codigo = SatAparato_codigo;
    }

    public Integer getSatorden_codigo() {
        return satorden_codigo;
    }

    public void setSatorden_codigo(Integer satorden_codigo) {
        this.satorden_codigo = satorden_codigo;
    }

}
