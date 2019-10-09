/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia.modelos;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author USUARIO
 */
@Entity
@Table(name = "plan")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Plan.findAll", query = "SELECT p FROM Plan p")
    , @NamedQuery(name = "Plan.findByCodigo", query = "SELECT p FROM Plan p WHERE p.codigo = :codigo")
    , @NamedQuery(name = "Plan.findByCodigoCuenta", query = "SELECT p FROM Plan p WHERE p.codigoCuenta = :codigoCuenta")
    , @NamedQuery(name = "Plan.findByVisible", query = "SELECT p FROM Plan p WHERE p.visible = :visible")
    , @NamedQuery(name = "Plan.findByDescripcion", query = "SELECT p FROM Plan p WHERE p.descripcion = :descripcion")
    , @NamedQuery(name = "Plan.findByPertenece", query = "SELECT p FROM Plan p WHERE p.pertenece = :pertenece")
    , @NamedQuery(name = "Plan.findByTipo", query = "SELECT p FROM Plan p WHERE p.tipo = :tipo")
    , @NamedQuery(name = "Plan.findByObservaciones", query = "SELECT p FROM Plan p WHERE p.observaciones = :observaciones")
    , @NamedQuery(name = "Plan.findByOrden", query = "SELECT p FROM Plan p WHERE p.orden = :orden")
    , @NamedQuery(name = "Plan.findByActualizar", query = "SELECT p FROM Plan p WHERE p.actualizar = :actualizar")
    , @NamedQuery(name = "Plan.findBySaldo", query = "SELECT p FROM Plan p WHERE p.saldo = :saldo")
    , @NamedQuery(name = "Plan.findByCentro", query = "SELECT p FROM Plan p WHERE p.centro = :centro")})
public class Plan implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "CODIGO")
    private Integer codigo;
    @Column(name = "CODIGO_CUENTA")
    private String codigoCuenta;
    @Column(name = "VISIBLE")
    private Boolean visible;
    @Column(name = "DESCRIPCION")
    private String descripcion;
    @Column(name = "PERTENECE")
    private String pertenece;
    @Column(name = "TIPO")
    private Boolean tipo;
    @Column(name = "OBSERVACIONES")
    private String observaciones;
    @Column(name = "ORDEN")
    private String orden;
    @Column(name = "ACTUALIZAR")
    private String actualizar;
    @Column(name = "SALDO")
    private String saldo;
    @Column(name = "CENTRO")
    private Boolean centro;

    public Plan() {
    }

    public Plan(Integer codigo) {
        this.codigo = codigo;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getCodigoCuenta() {
        return codigoCuenta;
    }

    public void setCodigoCuenta(String codigoCuenta) {
        this.codigoCuenta = codigoCuenta;
    }

    public Boolean getVisible() {
        return visible;
    }

    public void setVisible(Boolean visible) {
        this.visible = visible;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getPertenece() {
        return pertenece;
    }

    public void setPertenece(String pertenece) {
        this.pertenece = pertenece;
    }

    public Boolean getTipo() {
        return tipo;
    }

    public void setTipo(Boolean tipo) {
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

    public Boolean getCentro() {
        return centro;
    }

    public void setCentro(Boolean centro) {
        this.centro = centro;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codigo != null ? codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Plan)) {
            return false;
        }
        Plan other = (Plan) object;
        if ((this.codigo == null && other.codigo != null) || (this.codigo != null && !this.codigo.equals(other.codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "persistencia.modelos.Plan[ codigo=" + codigo + " ]";
    }
    
}
