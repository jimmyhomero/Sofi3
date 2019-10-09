/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.Pagos;
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
public class PagosDao extends Coneccion {

    ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    String tabla = "pagos";
    private ArrayList<Pagos> lista = new ArrayList<Pagos>();

    public Integer guardar(Pagos tarea) {
        Integer CodigoThisInsert = null;
        try {
            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " ("
                    + "descripcion,"
                    + " total,nota,visible,tipo,cxc_codigo)"
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
            consulta.setInt(6, tarea.getCxc_codigo());
            consulta.executeUpdate();
            ResultSet rs = consulta.getGeneratedKeys();
            if (rs.next()) {
                CodigoThisInsert = rs.getInt(1);
                //System.out.println("Controlador.Usuarios.FacturasDao.guardar()>: " + codigoThisFactura);
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex + "sssddfdfwsssss");
            msg.setProgressBar_mensajae("Error..!! " + ex);

        } finally {
            this.cerrar();
        }
        return CodigoThisInsert;
    }

}
