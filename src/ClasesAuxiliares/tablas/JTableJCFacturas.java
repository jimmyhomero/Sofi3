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
public class JTableJCFacturas extends JTable {

    @Override
    public void setAutoResizeMode(int mode) {
        super.setAutoResizeMode(AUTO_RESIZE_SUBSEQUENT_COLUMNS);
    }

    private static boolean isOnlyDouble(String str) {
        try {
            Double.parseDouble(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    private static boolean isOnlyInteger(String str) {
        try {
            Integer.valueOf(str);
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
        boolean isdouble = false;
        isdouble = isOnlyDouble(getValueAt(rowIndex, columnIndex).toString());
        if (isdouble && getValueAt(rowIndex, columnIndex) != null) {
            Float val = Float.parseFloat(getValueAt(rowIndex, columnIndex).toString());
            if (val <= 0) {
                componente.setBackground(Color.ORANGE);
                componente.setForeground(Color.black);
                //   componente.setBackground(Color.RED);
                //   componente.setForeground(Color.WHITE);
            }
        }
        
        boolean isInt = false;
        isInt = isOnlyInteger(getValueAt(rowIndex, columnIndex).toString());
        if (isInt && getValueAt(rowIndex, columnIndex) != null) {
            Double val = Double.parseDouble(getValueAt(rowIndex, columnIndex).toString());
            if (val <= 0) {
                componente.setBackground(Color.PINK);
                componente.setForeground(Color.white);
            }
        }
        return componente;
    }

}
