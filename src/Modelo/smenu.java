/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Vista.Interfaces.dao;
import ClasesAuxiliares.debug.Deb;

/**
 *
 * @author USUARIO
 */
public class smenu {
    private Integer codigo;
    private String  menu;
    private String url;
    private String visible;
    private Integer codigo_menu;

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getVisible() {
        return visible;
    }

    public void setVisible(String visible) {
        this.visible = visible;
    }

    public Integer getCodigo_menu() {
         
        return codigo_menu;
    }

    public void setCodigo_menu(Integer codigo_menu) {
        this.codigo_menu = codigo_menu;
         Deb.consola("Modelo.smenu.setCodigo_menu()xxxxxxxx> : "+this.codigo.getClass().getName());
      
                
                
    }
   
    
}
