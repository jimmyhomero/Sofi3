/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares.tablas;

import java.awt.Color;
import java.awt.Component;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;

/**
 *
 * @author USUARIO
 */
public class SetRenderJTableCXC extends DefaultTableCellRenderer {

    private int columna;

    public SetRenderJTableCXC(int Colpatron) {
        this.columna = Colpatron;
    }

    @Override
    public Component getTableCellRendererComponent(JTable table, Object value, boolean selected, boolean focused, int row, int column) {
        setBackground(Color.white);
        table.setForeground(Color.black);
        super.getTableCellRendererComponent(table, value, selected, focused, row, column);
        if ((row % 2) != 0) {

            this.setBackground(new java.awt.Color(194, 241, 241));
        }
             
        if (table.getValueAt(row, columna).equals("0")) {
            this.setForeground(Color.BLACK);
        }  else {
            this.setForeground(Color.red);
        }
     
//        if (table.getValueAt(row, columna).equals("0")) {
//            this.setForeground(Color.BLACK);
//        } else if (table.getValueAt(row, columna).equals("B")) {
//            this.setForeground(Color.BLUE);
//        } else if (table.getValueAt(row, columna).equals("C")) {
//            this.setForeground(Color.GREEN);
//        } else {
//            this.setForeground(Color.red);
//        }
        return this;
    }

}
