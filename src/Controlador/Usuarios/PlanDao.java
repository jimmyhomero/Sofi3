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

/**
 *
 * @author USUARIO
 */
public class PlanDao  extends Coneccion {
//    String tabla="plan";
//    public void guardar(Plan tarea) {
//        try {
//            this.conectar();
//            PreparedStatement consulta;
//
//            consulta = this.con.prepareStatement("INSERT INTO `plan`(`id`,`cuenta`,`id1`,`id2`,`id3`,`debe`,`haber`,`saldo`,`descripcion`,`plan_codigo`) VALUES ( ?,?,?,?,?,?,?,?,?,?)");
//            consulta.setString(1, tarea.getId());
//            consulta.setString(2, tarea.getCuenta().toUpperCase());
//            consulta.setString(3, tarea.getId1());
//            consulta.setString(4, tarea.getId2());
//            consulta.setString(5, tarea.getI3());
//            consulta.setDouble(6, tarea.getDebe());
//            consulta.setDouble(7, tarea.getHaber());
//            consulta.setDouble(8, tarea.getSaldo());
//            consulta.setString(9, tarea.getDescripcion().toUpperCase());
//            consulta.setInt(10, tarea.getPlan_codigo());
//            
//            System.out.println("Controlador.CUsuadgfdgfdfgrios.guardar()" + consulta);
//            consulta.executeUpdate();
//        } catch (SQLException ex) {
//            
//            System.out.println("Controlador.CUsuardddios.guardar()" + ex);
//        } finally {
//            this.cerrar();
//        }
//    }
//    
//    public DefaultTableModel getListarPlam() {
//        DefaultTableModel modelo = null;
//        
//        String[] titulos
//                = {"codigo", "id","cuenta", "pertenece", "debe",
//                    "haber", "saldo","","",""};
//        String[] registros = new String[10];
//        modelo = new DefaultTableModel(null, titulos) {
//            @Override
//            public boolean isCellEditable(int row, int column) {
//                // make read only fields except column 0,13,14
//                //  return column == 0 || column == 13 || column == 14;
//                return false;
//            }
//        };
//        ResultSet rs;
//        String sql = "SELECT * FROM PLAN";
//        //String sql="SELECT facturas.* ,usuarios.Nombres as usuario, clientes.Nombres as cliente, clientes.Cedula as ruc from facturas inner join clientes on clientes.Codigo=facturas.Clientes_codigo inner JOIN usuarios on usuarios.codigo= facturas.Usuarios_Codigo order BY facturas.secuencia LIMIT 0, 50";
//        try {
//            this.conectar();
//            PreparedStatement st;
//            
//            st = this.getCnx().prepareCall(sql);
//            System.out.println("Controlador.CUsuarios.Buscar_table_Only()" + st.toString());
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {         
//                
//                registros[0] = String.valueOf(rs.getInt("Codigo"));
//                registros[1] = rs.getString("id");                
//                registros[2] = rs.getString("cuenta");
//                registros[3] = rs.getString("id1");                
//                registros[4] = rs.getString("debe");
//                registros[5] = rs.getString("haber");
//                registros[6] = rs.getString("saldo");
//                registros[9] = String.valueOf(rs.getInt("Codigo"));                                                
//                modelo.addRow(registros);
//                System.out.println("Controlador.CUsuarios.Buscar_table_only()" + registros[1]);    
//              
//            }
//            
//        } catch (Exception ex) {
//            JOptionPane.showMessageDialog(null, ex + "rrrrddrrrrrrrrrr");
//        } finally {
//            this.cerrar();
//        }
//        
//        return modelo;
//    }
}
