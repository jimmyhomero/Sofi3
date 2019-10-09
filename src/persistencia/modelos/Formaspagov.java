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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author USUARIO
 */
@Entity
@Table(name = "formaspagov")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Formaspagov.findAll", query = "SELECT f FROM Formaspagov f")
    , @NamedQuery(name = "Formaspagov.findByCodigo", query = "SELECT f FROM Formaspagov f WHERE f.codigo = :codigo")
    , @NamedQuery(name = "Formaspagov.findByFormaPago", query = "SELECT f FROM Formaspagov f WHERE f.formaPago = :formaPago")
    , @NamedQuery(name = "Formaspagov.findByDescripcion", query = "SELECT f FROM Formaspagov f WHERE f.descripcion = :descripcion")
    , @NamedQuery(name = "Formaspagov.findByTipo", query = "SELECT f FROM Formaspagov f WHERE f.tipo = :tipo")
    , @NamedQuery(name = "Formaspagov.findByPlanCodigo", query = "SELECT f FROM Formaspagov f WHERE f.planCodigo = :planCodigo")})
public class Formaspagov implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "codigo")
    private Integer codigo;
    @Column(name = "FormaPago")
    private String formaPago;
    @Column(name = "descripcion")
    private String descripcion;
    @Column(name = "tipo")
    private String tipo;
    @Column(name = "plan_codigo")
    private Integer planCodigo;
    @JoinColumn(name = "sri_forma_pago_codigo", referencedColumnName = "codigo")
    @ManyToOne
    private SriFormasPago sriFormaPagoCodigo;

    public Formaspagov() {
    }

    public Formaspagov(Integer codigo) {
        this.codigo = codigo;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getFormaPago() {
        return formaPago;
    }

    public void setFormaPago(String formaPago) {
        this.formaPago = formaPago;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Integer getPlanCodigo() {
        return planCodigo;
    }

    public void setPlanCodigo(Integer planCodigo) {
        this.planCodigo = planCodigo;
    }

    public SriFormasPago getSriFormaPagoCodigo() {
        return sriFormaPagoCodigo;
    }

    public void setSriFormaPagoCodigo(SriFormasPago sriFormaPagoCodigo) {
        this.sriFormaPagoCodigo = sriFormaPagoCodigo;
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
        if (!(object instanceof Formaspagov)) {
            return false;
        }
        Formaspagov other = (Formaspagov) object;
        if ((this.codigo == null && other.codigo != null) || (this.codigo != null && !this.codigo.equals(other.codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "persistencia.modelos.Formaspagov[ codigo=" + codigo + " ]";
    }
    
}
