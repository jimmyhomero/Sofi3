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
@Table(name = "formaspagoc")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Formaspagoc.findAll", query = "SELECT f FROM Formaspagoc f")
    , @NamedQuery(name = "Formaspagoc.findByCodigo", query = "SELECT f FROM Formaspagoc f WHERE f.codigo = :codigo")
    , @NamedQuery(name = "Formaspagoc.findByFormaPago", query = "SELECT f FROM Formaspagoc f WHERE f.formaPago = :formaPago")
    , @NamedQuery(name = "Formaspagoc.findByDescripcion", query = "SELECT f FROM Formaspagoc f WHERE f.descripcion = :descripcion")
    , @NamedQuery(name = "Formaspagoc.findByTipoPago", query = "SELECT f FROM Formaspagoc f WHERE f.tipoPago = :tipoPago")
    , @NamedQuery(name = "Formaspagoc.findByPlanCodigo", query = "SELECT f FROM Formaspagoc f WHERE f.planCodigo = :planCodigo")
    , @NamedQuery(name = "Formaspagoc.findByAfectaACaja", query = "SELECT f FROM Formaspagoc f WHERE f.afectaACaja = :afectaACaja")
    , @NamedQuery(name = "Formaspagoc.findByNumeroCuotas", query = "SELECT f FROM Formaspagoc f WHERE f.numeroCuotas = :numeroCuotas")
    , @NamedQuery(name = "Formaspagoc.findByPorcentajeEntrada", query = "SELECT f FROM Formaspagoc f WHERE f.porcentajeEntrada = :porcentajeEntrada")
    , @NamedQuery(name = "Formaspagoc.findByPeridoCobranza", query = "SELECT f FROM Formaspagoc f WHERE f.peridoCobranza = :peridoCobranza")
    , @NamedQuery(name = "Formaspagoc.findByEsCxcCxp", query = "SELECT f FROM Formaspagoc f WHERE f.esCxcCxp = :esCxcCxp")})
public class Formaspagoc implements Serializable {

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
    @Basic(optional = false)
    @Column(name = "tipo_pago")
    private String tipoPago;
    @Column(name = "plan_codigo")
    private Integer planCodigo;
    @Column(name = "afecta_a_caja")
    private Integer afectaACaja;
    @Column(name = "numero_cuotas")
    private Integer numeroCuotas;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "porcentaje_entrada")
    private Double porcentajeEntrada;
    @Column(name = "perido_cobranza")
    private String peridoCobranza;
    @Column(name = "es_cxc_cxp")
    private String esCxcCxp;
    @JoinColumn(name = "sri_forma_pago_codigo", referencedColumnName = "codigo")
    @ManyToOne
    private SriFormasPago sriFormaPagoCodigo;

    public Formaspagoc() {
    }

    public Formaspagoc(Integer codigo) {
        this.codigo = codigo;
    }

    public Formaspagoc(Integer codigo, String tipoPago) {
        this.codigo = codigo;
        this.tipoPago = tipoPago;
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

    public String getTipoPago() {
        return tipoPago;
    }

    public void setTipoPago(String tipoPago) {
        this.tipoPago = tipoPago;
    }

    public Integer getPlanCodigo() {
        return planCodigo;
    }

    public void setPlanCodigo(Integer planCodigo) {
        this.planCodigo = planCodigo;
    }

    public Integer getAfectaACaja() {
        return afectaACaja;
    }

    public void setAfectaACaja(Integer afectaACaja) {
        this.afectaACaja = afectaACaja;
    }

    public Integer getNumeroCuotas() {
        return numeroCuotas;
    }

    public void setNumeroCuotas(Integer numeroCuotas) {
        this.numeroCuotas = numeroCuotas;
    }

    public Double getPorcentajeEntrada() {
        return porcentajeEntrada;
    }

    public void setPorcentajeEntrada(Double porcentajeEntrada) {
        this.porcentajeEntrada = porcentajeEntrada;
    }

    public String getPeridoCobranza() {
        return peridoCobranza;
    }

    public void setPeridoCobranza(String peridoCobranza) {
        this.peridoCobranza = peridoCobranza;
    }

    public String getEsCxcCxp() {
        return esCxcCxp;
    }

    public void setEsCxcCxp(String esCxcCxp) {
        this.esCxcCxp = esCxcCxp;
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
        if (!(object instanceof Formaspagoc)) {
            return false;
        }
        Formaspagoc other = (Formaspagoc) object;
        if ((this.codigo == null && other.codigo != null) || (this.codigo != null && !this.codigo.equals(other.codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "persistencia.modelos.Formaspagoc[ codigo=" + codigo + " ]";
    }
    
}
