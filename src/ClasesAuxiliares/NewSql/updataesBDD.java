/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares.NewSql;

import ClasesAuxiliares.debug.Deb;
import Controlador.Coneccion;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author USUARIO
 */
public class updataesBDD extends Coneccion {
       public void execSql(String sql) {
        try {
            this.conectar();
            PreparedStatement st;
            //String sql = "ALTER TABLE `USUARIOS` ADD COLUMN `USU_PRESUPUESTO` DOUBLE DEFAULT '5000' NULL AFTER `USU_TARJETA_CONTROL_MONTO`;";
            String a="CREATE TABLE IF NOT EXISTS `precios`( `codigo` INT NOT NULL AUTO_INCREMENT , `nombre` VARCHAR(500) , `valor` DOUBLE DEFAULT '0.0' , PRIMARY KEY (`codigo`));";
            st = this.getCnx().prepareCall(sql);
            Deb.consola("Controlador.CUsuarios.Buscar_table_Only()" + st.toString());
            st.execute();
            st.close();

        } catch (SQLException sqle) {
            Deb.consola("Error en la ejecución: "
                    + sqle.getErrorCode() + " " + sqle.getMessage());
        }
    }

}
