/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import ClasesAuxiliares.debug.Deb;
import Controlador.Coneccion;
import Modelo.Cxp;
import Modelo.Pagoscxp;
import Vlidaciones.ProgressBar;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author USUARIO
 */
public class PagoscxpDao extends Coneccion {

    ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    String tabla = "pagoscxp";
    private ArrayList<Pagoscxp> lista = new ArrayList<Pagoscxp>();

    public Integer guardar(Pagoscxp tarea) {
        Integer CodigoThisInsert = null;
        try {
            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " ("
                    + "descripcion,"
                    + " total,nota,visible,tipo,cxp_codigo)"
                    + " VALUES(?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            if (tarea.getDescripcion().equalsIgnoreCase("")) {
                tarea.setDescripcion("sin descripcion");
            }
            consulta.setString(1, tarea.getDescripcion().toUpperCase());
            consulta.setDouble(2, tarea.getTotal());
//            long d = tarea.getFechaVencimiento().getTime();
//            java.sql.Date fecha = new java.sql.Date(d);
//            consulta.setDate(3, fecha);
            consulta.setString(3, tarea.getNota());
            consulta.setInt(4, tarea.getVisible());
            consulta.setString(5, tarea.getTipo());
            consulta.setInt(6, tarea.getCxp_codigo());
            consulta.executeUpdate();
            ResultSet rs = consulta.getGeneratedKeys();
            if (rs.next()) {
                CodigoThisInsert = rs.getInt(1);
                //Deb.consola("Controlador.Usuarios.FacturasDao.guardar()>: " + codigoThisFactura);
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex + "pasgoscpx sssddfdfwsssss");
            msg.setProgressBar_mensajae("Error..!! " + ex);

        } finally {
            this.cerrar();
        }
        return CodigoThisInsert;
    }

    public void modificar(Cxp c) {
        try {
            this.conectar();

            PreparedStatement st = this.con.prepareStatement("UPDATE " + tabla + " SET "
                    + "Descripcion = ? ,"
                    + "abono = ? ,"
                    + "saldo = ? "
                    + "where codigo = ?");

            st.setString(1, c.getDescripcion());

            st.setString(2, c.getAbono());
            st.setString(3, c.getSaldo());

            st.setInt(4, c.getCodigo());

            String sql = st.toString();

            st.executeUpdate();

            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
        } catch (SQLException e) {
            //msg.setProgressBar_mensajae(e.toString());
            Deb.consola("Controlador.Usuarios.cxcDao.modificar(): errir modificar cxp: " + e.toString());
        } finally {
            this.cerrar();
        }

    }
}
