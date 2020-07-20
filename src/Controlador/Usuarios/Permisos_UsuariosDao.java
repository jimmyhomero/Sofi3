/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.Permisos_Usuarios;
import Modelo.Tipo_Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author USUARIO
 */
public class Permisos_UsuariosDao  extends Coneccion{
    
    public Integer guardar(Permisos_Usuarios tarea) {
    Integer codigo=0;
        try {
            
            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement("INSERT INTO permisos_usuario (nombre, visible,tipo_usuario_codigo,padre,orden) VALUES(?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
            consulta.setString(1, tarea.getNombre().toUpperCase());
            consulta.setInt(2, 1);
            consulta.setInt(3, tarea.getTipoUsuario());
            consulta.setInt(4, tarea.getPadre());
            consulta.setInt(5, tarea.getOrden());            
            consulta.executeUpdate();
             ResultSet rs = consulta.getGeneratedKeys();
               System.out.println("Controlador.CUsuarios.guardar()xxxx:  " + consulta);
            if (rs.next()) {
                codigo = rs.getInt(1);
                System.out.println("Controlador.Usuarios.Tipo_UsuariosDao.guardar(): "+ codigo);                
            }
        } catch (SQLException ex) {
            System.out.println("Controlador.Usuarios.Permisos_UsuariosDao.guardar(): "+ex);
           // msg.setProgressBar_mensajae("Error..!! " + ex);
        } finally {
            this.cerrar();
        }
        return codigo ;
    }
}
