/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.smenu;
import Vista.Interfaces.dao;
import Vlidaciones.ProgressBar;
import java.io.IOException;
import java.lang.reflect.Field;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.FileSystemNotFoundException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Stream;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author USUARIO
 */
public class SmenuDao extends Coneccion implements dao<smenu> {

    @Override
    public List<smenu> listar() {
        return null;
       
    }
    
    

    @Override
    public Integer guardar(smenu obj) {
        try {
            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement("INSERT INTO smenu (menu,url,visble,"
                    + "codigo_menu) VALUES(?,?,?,?)");
            consulta.setString(1, obj.getMenu());
            consulta.setString(2, obj.getUrl());
            consulta.setString(3, obj.getVisible());
            consulta.setInt(4, obj.getCodigo_menu());

            consulta.executeUpdate();
        } catch (SQLException ex) {
            ProgressBar.mostrarMensajeAzul("Error..!! " + ex);

        } finally {
            this.cerrar();
        }
        
        return 1;
    }

    
    @Override
    public DefaultTableModel listarDefacultTableModel() {
       DefaultTableModel modelo = null;
        String sql = "select * from smenu  order BY codigo  ";

        String[] titulos
                = {"Codigo", "menu", "url", "visible", "Menu" };
        String[] registros = new String[5];
        modelo = new DefaultTableModel(null, titulos) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // make read only fields except column 0,13,14
                //  return column == 0 || column == 13 || column == 14;
                return false;
            }
        };

        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall(sql);           
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {

                registros[0] = String.valueOf(rs.getInt("Codigo"));
                registros[1] = rs.getString("menu");
                registros[2] = rs.getString("url");
                registros[3] = rs.getString("visible");
                registros[4] = rs.getString("codigo_menu");
                modelo.addRow(registros);

            }

        } catch (Exception ex) {

            ProgressBar.mostrarMensajeAzul("Error..!! " + ex);

        } finally {
            this.cerrar();
        }

        return modelo;
    }
// String sql = "select * from Cajas  where codigo = "+codigo;
    @Override
    public smenu BuscarById(Integer id) {

        String sql = "select * from smenu  where codigo = "+id;
            smenu objx = new smenu();

        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall(sql);           
            rs = st.executeQuery();
            
            while (rs.next()) {
                smenu obj = new smenu();
                obj.setCodigo(rs.getInt("Codigo"));
                obj.setMenu(rs.getString("menu"));
                obj.setUrl(rs.getString("url"));
                obj.setVisible(rs.getString("visible"));
                obj.setCodigo_menu(rs.getInt("codigo_menu"));
                objx=obj;
            }

        } catch (Exception ex) {
           ProgressBar.mostrarMensajeAzul("Error..!! " + ex);

        } finally {
            this.cerrar();
        }

        return objx;
    }

    @Override
    public void Modificar(smenu obj) {
try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("UPDATE smenu SET "
                    + "menu = ?, "
                    + "url = ?, "
                    + "visible = ?, "
                    + "codigo_menu = ? "                    
                    + "where codigo = ?");
            st.setString(1, obj.getMenu());
            st.setString(2, obj.getUrl());
            st.setString(3, obj.getVisible());
            st.setInt(4, obj.getCodigo_menu());
            st.executeUpdate();
        } catch (SQLException e) {
            ProgressBar.mostrarMensajeAzul(e.toString());
        } finally {
            this.cerrar();
        }

    }

    @Override
    public void Eliminar(smenu obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
