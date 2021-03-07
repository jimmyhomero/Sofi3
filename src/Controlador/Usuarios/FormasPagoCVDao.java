/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import ClasesAuxiliares.debug.Deb;
import Controlador.Coneccion;
import Modelo.FormasPagoCV;
import Modelo.FormasPagoV;
import Vista.Principal;
import Vlidaciones.ProgressBar;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author USUARIO
 */
public class FormasPagoCVDao extends Coneccion {

    private ArrayList<FormasPagoCV> lista = new ArrayList<FormasPagoCV>();

    public Integer guardarFormaPagook(FormasPagoCV tarea) {
        Deb.consola("AD-> :" + tarea);
        Integer codigoInsert = null;
        this.conectar();
        PreparedStatement consulta;
        try {
            consulta = this.con.prepareStatement("INSERT INTO `formaspagoc`(`FormaPago`,`descripcion`,`tipo_pago`,`plan_codigo`,`sri_forma_pago_codigo`,`afecta_a_caja`,`numero_cuotas`,`porcentaje_entrada`,`perido_cobranza`,`es_cxc_cxp`,codigo_precio_a_usar,dias_credito) VALUES ( ?,?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            codigoInsert = setUpdateSave(tarea, consulta);
        } catch (SQLException ex) {
            ProgressBar.mostrarMensajeAzul("Error..!! " + ex);

        } finally {
            this.cerrar();
        }
        return codigoInsert;
    }

    private Integer setUpdateSave(FormasPagoCV tarea, PreparedStatement consulta) throws SQLException {

        Integer CodigoThisInsert = null;
        if (!tarea.getFormaPago().isEmpty()) {
            consulta.setString(1, tarea.getFormaPago().toUpperCase());
        }else{
            consulta.setString(1, tarea.getFormaPago());
        }
        if (!tarea.getDescripcion().isEmpty()) {
            consulta.setString(2, tarea.getDescripcion().toUpperCase());
        }else{
        consulta.setString(2, tarea.getDescripcion());
        }
        consulta.setString(3, tarea.getTipoPago());
        consulta.setInt(4, tarea.getPlanCodigo());
        consulta.setInt(5, tarea.getSriFormaPagoCodigo());
        consulta.setInt(6, tarea.getAfectaACaja());
        consulta.setInt(7, tarea.getNumeroCuotas());
        consulta.setDouble(8, tarea.getPorcentajeEntrada());
        consulta.setString(9, tarea.getPeridoCobranza());
        consulta.setString(10, tarea.getEsCxcCxp());        
        consulta.setInt(11, 0);
        if(tarea.getCodigo_tipoPrecio()!=null){
        consulta.setInt(11, tarea.getCodigo_tipoPrecio());
        
        }
        consulta.setInt(12, tarea.getDias_credito());
        Deb.consola("--> codigoInsertxxxxxcinsulta" + consulta); 
        consulta.executeUpdate();
         
        ResultSet rs = consulta.getGeneratedKeys();
        if (rs.next()) {
            CodigoThisInsert = rs.getInt(1);
            Deb.consola("--> codigoInsert" + CodigoThisInsert);   //Deb.consola("Controlador.Usuarios.FacturasDao.guardar()>: " + codigoThisFactura);
        }

        return CodigoThisInsert;
    }

    private ArrayList<FormasPagoCV> setListar(PreparedStatement st) {
        ResultSet rs;
        try {
            this.conectar();

            rs = st.executeQuery();
            while (rs.next()) {
                FormasPagoCV per = new FormasPagoCV();
                per.setCodigo(rs.getInt("Codigo"));
                per.setFormaPago(rs.getString("FormaPago"));
                per.setDescripcion(rs.getString("Descripcion"));
                per.setTipoPago(rs.getString("tipo_pago"));
                per.setPlanCodigo(rs.getInt("plan_codigo"));
                per.setSriFormaPagoCodigo(rs.getInt("sri_forma_pago_codigo"));
                per.setAfectaACaja(rs.getInt("afecta_a_caja"));
                per.setNumeroCuotas(rs.getInt("numero_cuotas"));
                per.setPorcentajeEntrada(rs.getDouble("porcentaje_entrada"));
                per.setPeridoCobranza(rs.getString("perido_cobranza"));
                per.setEsCxcCxp(rs.getString("es_cxc_cxp"));
                this.lista.add(per);
            }
        } catch (Exception ex) {
            ProgressBar.mostrarMensajeAzul("Errordddsdwerwesdgfgrtgs..!! " + ex);

        } finally {
            this.cerrar();
        }
        return lista;
    }
    private FormasPagoCV setFormaPago(PreparedStatement st) {
        ResultSet rs;
        FormasPagoCV per2 = new FormasPagoCV();
        try {
            this.conectar();

            rs = st.executeQuery();
            while (rs.next()) {
                FormasPagoCV per = new FormasPagoCV();
                per.setCodigo(rs.getInt("Codigo"));
                per.setFormaPago(rs.getString("FormaPago"));
                per.setDescripcion(rs.getString("Descripcion"));
                per.setTipoPago(rs.getString("tipo_pago"));
                per.setPlanCodigo(rs.getInt("plan_codigo"));
                per.setSriFormaPagoCodigo(rs.getInt("sri_forma_pago_codigo"));
                per.setAfectaACaja(rs.getInt("afecta_a_caja"));
                per.setNumeroCuotas(rs.getInt("numero_cuotas"));
                per.setPorcentajeEntrada(rs.getDouble("porcentaje_entrada"));
                per.setPeridoCobranza(rs.getString("perido_cobranza"));
                per.setEsCxcCxp(rs.getString("es_cxc_cxp"));
               per2=per;
            }
        } catch (Exception ex) {
            ProgressBar.mostrarMensajeAzul("Errordddsdwerwesdgfgrtgs..!! " + ex);

        } finally {
            this.cerrar();
        }
        return per2;
    }

    public ArrayList<FormasPagoCV> listarBuscarConCodigo(Integer cod) {
        PreparedStatement st;
        try {
            this.conectar();
            st = this.getCnx().prepareCall("Select * from formaspagoc  where codigo = " + cod + "");
            lista = setListar(st);
        } catch (SQLException ex) {
            ProgressBar.mostrarMensajeAzul("Error..!! " + ex);
        }
        return lista;
    }

    public ArrayList<FormasPagoCV> listar() {
        PreparedStatement st;
        try {
            this.conectar();
            st = this.getCnx().prepareCall("Select * from formaspagoc ");
            lista = setListar(st);
        } catch (SQLException ex) {
            ProgressBar.mostrarMensajeAzul("Error..!! " + ex);
        }
        return lista;
    }

    public ArrayList<FormasPagoCV> listarFormaPagoVentas() {
        PreparedStatement st;
        try {
            this.conectar();
            st = this.getCnx().prepareCall("Select * from formaspagoc where  es_cxc_cxp = 'ventas' ");
            lista = setListar(st);
        } catch (SQLException ex) {
            ProgressBar.mostrarMensajeAzul("Error..!! " + ex);
        }
        return lista;
    }

    public ArrayList<FormasPagoCV> listarFormaPagoCompras() {
        PreparedStatement st;
        try {
            this.conectar();
            st = this.getCnx().prepareCall("Select * from formaspagoc where  es_cxc_cxp = 'COMPRAS' ");
            lista = setListar(st);
        } catch (SQLException ex) {
            ProgressBar.mostrarMensajeAzul("Error..!! " + ex);
        }
        return lista;
    }

    public ArrayList<FormasPagoCV> buscarConFormaPago(String formaPago) {
        PreparedStatement st;
        try {
            this.conectar();
            st = this.getCnx().prepareCall("Select * from formaspagoc where formaPago = '" + formaPago + "'");
            lista = setListar(st);
        } catch (SQLException ex) {
            ProgressBar.mostrarMensajeAzul("Error..!! " + ex);
        }
        return lista;
    }
  public FormasPagoCV buscarConFormaPagobynombre(String formaPagoNombre) {
      FormasPagoCV fp= new FormasPagoCV();
        PreparedStatement st;
        try {
            this.conectar();
            st = this.getCnx().prepareCall("Select * from formaspagoc where formaPago = '" + formaPagoNombre + "'");
            fp = setFormaPago(st);
        } catch (SQLException ex) {
            ProgressBar.mostrarMensajeAzul("Error..!! al buscar formas de pago " + ex);
        }
        return fp;
    }  

    public ResultSet listar_table(String sql) {
        //
        ResultSet rs = null;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall(sql);
            rs = st.executeQuery();
        } catch (Exception ex) {
            ProgressBar.mostrarMensajeAzul("Error..!! " + ex);
        } finally {
            //  this.cerrar();
        }

        return rs;

    }

    public void eliminar(FormasPagoCV persona) throws Exception {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("DELETE from formaspagoc WHERE Codigo=?");
            st.setInt(1, persona.getCodigo());
            st.executeUpdate();
        } catch (SQLException e) {
            ProgressBar.mostrarMensajeAzul("Error..!! " + e);
        } finally {
            this.cerrar();
        }

    }

}
