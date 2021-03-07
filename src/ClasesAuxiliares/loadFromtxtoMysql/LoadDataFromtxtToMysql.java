/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares.loadFromtxtoMysql;

import ClasesAuxiliares.debug.Deb;
import Modelo.Equipos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;
/**
 *
 * @author USUARIO
 */
public class LoadDataFromtxtToMysql extends Controlador.Coneccion{
    
        public Integer guardar() {
        Integer codigoThisEquipo=null;
        try {
            this.conectar();
            PreparedStatement consulta;
         String sqlx="LOAD DATA LOCAL INFILE 'D:/importar3.cvs' INTO TABLE sriDatos FIELDS TERMINATED BY ';' IGNORE 1 LINES  LINES TERMINATED BY ' '";
         String sql="LOAD DATA LOCAL INFILE 'D:/importar3.txt' INTO TABLE sriDatos FIELDS TERMINATED BY ';' LINES TERMINATED BY ' '";
            consulta = this.con.prepareStatement(sql);
            
               consulta.executeUpdate();
            
        } catch (SQLException ex) {
            Deb.consola("ClasesAuxiliares.loadFromtxtoMysql.LoadDataFromtxtToMysql.guardar()"+ex);
            JOptionPane.showMessageDialog(null,ex);
            

        } finally {
            this.cerrar();
        }
        return codigoThisEquipo;
    }

}
