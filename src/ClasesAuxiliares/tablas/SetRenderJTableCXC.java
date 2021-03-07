/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares.tablas;

import ClasesAuxiliares.Leertxt;
import ClasesAuxiliares.debug.Deb;
import Modelo.Clientes;
import java.awt.Color;
import java.awt.Component;
import javax.swing.CellRendererPane;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.TableCellRenderer;
import org.jespxml.gui.CellRender;

/**
 *
 * @author USUARIO
 */
public class SetRenderJTableCXC extends DefaultTableCellRenderer {

    private int columna;
    private int row;
    private int colClaveaccso;

    public SetRenderJTableCXC(int Colpatron) {
        this.columna = Colpatron;
        colClaveaccso = 8;
    }

    public SetRenderJTableCXC(int row, int col) {
        this.columna = col;
        this.row = row;
    }

    @Override
    public Component getTableCellRendererComponent(JTable table, Object value, boolean selected, boolean focused, int row, int column) {
        setBackground(Color.white);
        table.setForeground(Color.black);
        super.getTableCellRendererComponent(table, value, selected, focused, row, column);
        if ((row % 2) != 0) {

            this.setBackground(new java.awt.Color(245,245,245));
        }

        //
        if (column == columna) {
            if ((String.valueOf(table.getValueAt(row, columna))).equals("NO")) {
                this.setForeground(Color.BLACK);
                this.setBackground(new java.awt.Color(255, 102, 178));
            }

        }
        
        if (column == 11) {
             if ((String.valueOf(table.getValueAt(row,11))).equals("SI")) {
                this.setBackground(new java.awt.Color(153, 255, 51));
            }

        }

        return this;
    }

    public static Component get_jtable_cell_component(JTable table, int row, int column) {
        TableCellRenderer renderer =  table.getCellRenderer(row, column);
        Object value = table.getModel().getValueAt(row, column);
        boolean selectedColor = table.getSelectionModel().isSelectedIndex(row);
        boolean hasFocus = true;
        Component component = renderer.getTableCellRendererComponent (table, value, selectedColor, hasFocus, row, column);
        return component;
    }
    

}
