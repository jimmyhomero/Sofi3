/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares.tablas;

import Vlidaciones.ValidaNUmeros;
import java.awt.Color;
import java.awt.Component;
import javax.swing.JTable;
import javax.swing.table.TableCellRenderer;

/**
 *
 * @author USUARIO
 */
public class JTableJC extends JTable {

    @Override
    public void setAutoResizeMode(int mode) {
        super.setAutoResizeMode(0); //To change body of generated methods, choose Tools | Templates.
    }
      private static boolean isOnlyDouble(String str) {
        try {
            Double.parseDouble(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    @Override
    public Component prepareRenderer(TableCellRenderer renderer, int rowIndex, int columnIndex) {
        Component componente = super.prepareRenderer(renderer, rowIndex, columnIndex);
        componente.setBackground(Color.WHITE);
        componente.setForeground(Color.BLACK);
        //   if ((float.class.equals(this.getColumnClass(columnIndex))) && getValueAt(rowIndex, columnIndex) != null) {
        boolean isdouble=false;
     isdouble=  isOnlyDouble(getValueAt(rowIndex, columnIndex).toString());
        if (isdouble && getValueAt(rowIndex, columnIndex) != null) {
            Float val = Float.parseFloat(getValueAt(rowIndex, columnIndex).toString());
            if (val <= 0) {
                componente.setBackground(Color.ORANGE);
                componente.setForeground(Color.WHITE);
            }
        }
        if ((Double.class.equals(this.getColumnClass(columnIndex))) && getValueAt(rowIndex, columnIndex) != null) {
            Double val = Double.parseDouble(getValueAt(rowIndex, columnIndex).toString());
            if (val <= 0) {
                componente.setBackground(Color.ORANGE);
                componente.setForeground(Color.black);
            }
        }
        return componente;
    }

}
