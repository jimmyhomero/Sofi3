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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author USUARIO
 */
@Entity
@Table(name = "clientes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Clientes.findAll", query = "SELECT c FROM Clientes c")
    , @NamedQuery(name = "Clientes.findByCodigo", query = "SELECT c FROM Clientes c WHERE c.codigo = :codigo")
    , @NamedQuery(name = "Clientes.findByCedula", query = "SELECT c FROM Clientes c WHERE c.cedula = :cedula")
    , @NamedQuery(name = "Clientes.findByNombres", query = "SELECT c FROM Clientes c WHERE c.nombres = :nombres")
    , @NamedQuery(name = "Clientes.findByTelefono", query = "SELECT c FROM Clientes c WHERE c.telefono = :telefono")
    , @NamedQuery(name = "Clientes.findByCelular", query = "SELECT c FROM Clientes c WHERE c.celular = :celular")
    , @NamedQuery(name = "Clientes.findByMail", query = "SELECT c FROM Clientes c WHERE c.mail = :mail")
    , @NamedQuery(name = "Clientes.findByDireccion", query = "SELECT c FROM Clientes c WHERE c.direccion = :direccion")
    , @NamedQuery(name = "Clientes.findByProvincia", query = "SELECT c FROM Clientes c WHERE c.provincia = :provincia")
    , @NamedQuery(name = "Clientes.findByCiudad", query = "SELECT c FROM Clientes c WHERE c.ciudad = :ciudad")
    , @NamedQuery(name = "Clientes.findByNacionalidad", query = "SELECT c FROM Clientes c WHERE c.nacionalidad = :nacionalidad")
    , @NamedQuery(name = "Clientes.findByPagoPredeterminado", query = "SELECT c FROM Clientes c WHERE c.pagoPredeterminado = :pagoPredeterminado")
    , @NamedQuery(name = "Clientes.findByTipoCliente", query = "SELECT c FROM Clientes c WHERE c.tipoCliente = :tipoCliente")
    , @NamedQuery(name = "Clientes.findByVendedorPredeterminado", query = "SELECT c FROM Clientes c WHERE c.vendedorPredeterminado = :vendedorPredeterminado")
    , @NamedQuery(name = "Clientes.findByObservaciones", query = "SELECT c FROM Clientes c WHERE c.observaciones = :observaciones")
    , @NamedQuery(name = "Clientes.findByNacimiento", query = "SELECT c FROM Clientes c WHERE c.nacimiento = :nacimiento")
    , @NamedQuery(name = "Clientes.findByGenero", query = "SELECT c FROM Clientes c WHERE c.genero = :genero")
    , @NamedQuery(name = "Clientes.findByHuella", query = "SELECT c FROM Clientes c WHERE c.huella = :huella")
    , @NamedQuery(name = "Clientes.findByEstadoCivil", query = "SELECT c FROM Clientes c WHERE c.estadoCivil = :estadoCivil")
    , @NamedQuery(name = "Clientes.findByEmpresa", query = "SELECT c FROM Clientes c WHERE c.empresa = :empresa")})
public class Clientes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "codigo")
    private Integer codigo;
    @Basic(optional = false)
    @Column(name = "Cedula")
    private String cedula;
    @Basic(optional = false)
    @Column(name = "Nombres")
    private String nombres;
    @Column(name = "Telefono")
    private String telefono;
    @Column(name = "Celular")
    private String celular;
    @Column(name = "mail")
    private String mail;
    @Column(name = "Direccion")
    private String direccion;
    @Column(name = "Provincia")
    private String provincia;
    @Column(name = "Ciudad")
    private String ciudad;
    @Column(name = "Nacionalidad")
    private String nacionalidad;
    @Column(name = "PagoPredeterminado")
    private Integer pagoPredeterminado;
    @Column(name = "TipoCliente")
    private Integer tipoCliente;
    @Column(name = "VendedorPredeterminado")
    private Integer vendedorPredeterminado;
    @Column(name = "Observaciones")
    private String observaciones;
    @Column(name = "Nacimiento")
    private String nacimiento;
    @Column(name = "genero")
    private String genero;
    @Column(name = "huella")
    private String huella;
    @Column(name = "estadoCivil")
    private String estadoCivil;
    @Column(name = "empresa")
    private String empresa;

    public Clientes() {
    }

    public Clientes(Integer codigo) {
        this.codigo = codigo;
    }

    public Clientes(Integer codigo, String cedula, String nombres) {
        this.codigo = codigo;
        this.cedula = cedula;
        this.nombres = nombres;
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

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
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
        return vendedorPredeterminado;
    }

    public void setVendedorPredeterminado(Integer vendedorPredeterminado) {
        this.vendedorPredeterminado = vendedorPredeterminado;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public String getNacimiento() {
        return nacimiento;
    }

    public void setNacimiento(String nacimiento) {
        this.nacimiento = nacimiento;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getHuella() {
        return huella;
    }

    public void setHuella(String huella) {
        this.huella = huella;
    }

    public String getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public String getEmpresa() {
        return empresa;
    }

    public void setEmpresa(String empresa) {
        this.empresa = empresa;
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
        if (!(object instanceof Clientes)) {
            return false;
        }
        Clientes other = (Clientes) object;
        if ((this.codigo == null && other.codigo != null) || (this.codigo != null && !this.codigo.equals(other.codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "persistencia.modelos.Clientes[ codigo=" + codigo + " ]";
    }
    
}
