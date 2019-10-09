/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia.modelos;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author USUARIO
 */
@Entity
@Table(name = "sri_formas_pago")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "SriFormasPago.findAll", query = "SELECT s FROM SriFormasPago s")
    , @NamedQuery(name = "SriFormasPago.findByCodigo", query = "SELECT s FROM SriFormasPago s WHERE s.codigo = :codigo")
    , @NamedQuery(name = "SriFormasPago.findById", query = "SELECT s FROM SriFormasPago s WHERE s.id = :id")
    , @NamedQuery(name = "SriFormasPago.findByFormaPago", query = "SELECT s FROM SriFormasPago s WHERE s.formaPago = :formaPago")})
public class SriFormasPago implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "codigo")
    private Integer codigo;
    @Column(name = "id")
    private String id;
    @Column(name = "formaPago")
    private String formaPago;
    @OneToMany(mappedBy = "sriFormaPagoCodigo")
    private List<Formaspagov> formaspagovList;
    @OneToMany(mappedBy = "sriFormaPagoCodigo")
    private List<Formaspagoc> formaspagocList;

    public SriFormasPago() {
    }

    public SriFormasPago(Integer codigo) {
        this.codigo = codigo;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFormaPago() {
        return formaPago;
    }

    public void setFormaPago(String formaPago) {
        this.formaPago = formaPago;
    }

    @XmlTransient
    public List<Formaspagov> getFormaspagovList() {
        return formaspagovList;
    }

    public void setFormaspagovList(List<Formaspagov> formaspagovList) {
        this.formaspagovList = formaspagovList;
    }

    @XmlTransient
    public List<Formaspagoc> getFormaspagocList() {
        return formaspagocList;
    }

    public void setFormaspagocList(List<Formaspagoc> formaspagocList) {
        this.formaspagocList = formaspagocList;
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
        if (!(object instanceof SriFormasPago)) {
            return false;
        }
        SriFormasPago other = (SriFormasPago) object;
        if ((this.codigo == null && other.codigo != null) || (this.codigo != null && !this.codigo.equals(other.codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "persistencia.modelos.SriFormasPago[ codigo=" + codigo + " ]";
    }
    
}
