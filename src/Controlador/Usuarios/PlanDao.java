/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.Clientes;
import Modelo.Plan;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import ClasesAuxiliares.debug.Deb;

/**
 *
 * @author USUARIO
 */
public class PlanDao  extends Coneccion {
    String tabla="plan";
    public void guardar(Plan tarea) {
        try {
            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement("INSERT INTO `plan`(`CODIGO_CUENTA`,`VISIBLE`,`DESCRIPCION`,`PERTENECE`,`TIPO`,`OBSERVACIONES`,`ORDEN`,`ACTUALIZAR`,`SALDO`,CENTRO) VALUES ( ?,?,?,?,?,?,?,?,?,?)");
            consulta.setString(1, tarea.getCodigo_cuenta());
            consulta.setInt(2, tarea.getVisble());
            consulta.setString(3, tarea.getDescricion());
            consulta.setString(4, tarea.getPertenece());
            consulta.setInt(5, tarea.getTipo());
            consulta.setString(6, tarea.getObservaciones());
            consulta.setString(7, tarea.getOrden());
            consulta.setString(8, tarea.getActualizar());
            consulta.setString(9, tarea.getSaldo());
            consulta.setInt(10, tarea.getCentro());
            
            Deb.consola("PlanDaoxinser" + consulta);
            consulta.executeUpdate();
        } catch (SQLException ex) {
            
            Deb.consola("PlanDaoxinser.guardar()" + ex);
        } finally {
            this.cerrar();
        }
    }
    
    public DefaultTableModel getListarPlan() {
        DefaultTableModel modelo = null;
        
        String[] titulos
                = {"codigo", "id","cuenta", "pertenece", "debe",
                    "haber", "saldo","","",""};
        String[] registros = new String[10];
        modelo = new DefaultTableModel(null, titulos) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // make read only fields except column 0,13,14
                //  return column == 0 || column == 13 || column == 14;
                return false;
            }
        };
        ResultSet rs;
        String sql = "SELECT * FROM PLAN order by orden asc ";
        //String sql="SELECT facturas.* ,usuarios.Nombres as usuario, clientes.Nombres as cliente, clientes.Cedula as ruc from facturas inner join clientes on clientes.Codigo=facturas.Clientes_codigo inner JOIN usuarios on usuarios.codigo= facturas.Usuarios_Codigo order BY facturas.secuencia LIMIT 0, 50";
        try {
            this.conectar();
            PreparedStatement st;
            
            st = this.getCnx().prepareCall(sql);
            Deb.consola("Controlador.CUsuarios.Buscar_table_Only()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {         
                
                registros[0] = String.valueOf(rs.getInt("Codigo_cuenta"));
                registros[1] = rs.getString("codigo");                
                registros[2] = rs.getString("orden").replace("0", " ")+ " "+rs.getString("descripcion");
                registros[3] = rs.getString("pertenece");                
                registros[4] = rs.getString("tipo");
                registros[5] = rs.getString("orden");
                registros[6] = rs.getString("saldo");
                registros[9] = String.valueOf(rs.getInt("Codigo_cuenta"));                                                
                modelo.addRow(registros);
                //Deb.consola("Controlador.CUsuarios.Buscar_table_only()" + registros[1]);    
              
            }
            
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "rrrrddrrrrrrrrrr");
        } finally {
            this.cerrar();
        }
        
        return modelo;
    }
}
