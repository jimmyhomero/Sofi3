/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista;

import Controlador.Coneccion;
import Modelo.Menu;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JMenu;
import javax.swing.JMenuItem;

/**
 *
 * @author USUARIO
 */
public class menuDao extends Coneccion {

    public ArrayList<JMenu> listar(Integer tipoUsuarioCodigo) {
        ResultSet rs;
        ResultSet rs2;
        ArrayList<JMenu> listaMenus = new ArrayList<JMenu>();
        ArrayList<Menu> lista = new ArrayList<Menu>();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from permisos_usuario where tipo_usuario_codigo="+tipoUsuarioCodigo);
            rs = st.executeQuery();
            rs2 = rs;
            while (rs.next()) {
                Menu m = new Menu();
                m.setCodigo(rs.getInt("codigo"));
                m.setNombre(rs.getString("nombre"));
                m.setPadre(rs.getInt("padre"));
                lista.add(m);

            }
            for (Menu menu : lista) {
                if (menu.getPadre() == 0) {
                    JMenu per = new JMenu();
                    per.setName(menu.getNombre());
                    per.setText(menu.getNombre());
                    for (Menu menu2 : lista) {
                        if (menu.getCodigo() == menu2.getPadre()) {
                            JMenuItem item = new JMenuItem();
                            item.setName(menu2.getNombre());
                            item.setText(menu2.getNombre());
                            per.add(item);
                        }
                    }
                    listaMenus.add(per);
                }
                

            }            

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return listaMenus;
    }

    public ArrayList<Menu> listarMenus() {
        ResultSet rs;
        ArrayList<Menu> listaMenus = new ArrayList<Menu>();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from menu");
            rs = st.executeQuery();
            while (rs.next()) {

                Menu per = new Menu();
                per.setCodigo(rs.getInt("codigo"));
                per.setNombre(rs.getString("nombre"));
                per.setPadre(rs.getInt("padre"));
                listaMenus.add(per);
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return listaMenus;
    }

    public static void accionesMenus(ActionEvent e) {

    }
}
