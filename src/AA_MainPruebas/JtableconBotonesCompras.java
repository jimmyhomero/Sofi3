/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AA_MainPruebas;

import ClasesAuxiliares.NewSql.Forms.OperacionesForms;
import Vista.Principal;
import Vista.Productos.Buscar_Productos;
import Vista.Usuarios.Crear_Productos;
import java.awt.Color;
import java.awt.Component;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellRenderer;
import javax.swing.table.TableColumn;
import javax.swing.table.TableColumnModel;
import javax.swing.table.TableModel;

/**
 *
 * @author USUARIO
 */
public class JtableconBotonesCompras {

    public static DefaultTableModel modelo;//= new DefaultTableModel() ;
    private static String[] columnas;
    private static Class[] tiposColumnas;

    private static TableColumnModel setModeloColumnasCompras(JTable tb) {
        TableColumnModel columnModel;
        columnModel = tb.getColumnModel();
        columnModel.getColumn(0).setPreferredWidth(1);
        columnModel.getColumn(1).setPreferredWidth(1);
        columnModel.getColumn(2).setPreferredWidth(3);
        columnModel.getColumn(3).setPreferredWidth(300);
        columnModel.getColumn(4).setPreferredWidth(10);
        columnModel.getColumn(5).setPreferredWidth(10);
        columnModel.getColumn(6).setPreferredWidth(10);
        columnModel.getColumn(7).setPreferredWidth(10);
        columnModel.getColumn(8).setPreferredWidth(10);
        columnModel.getColumn(9).setPreferredWidth(10);
        if (Principal.obligaoSINO.equalsIgnoreCase("si")) {
            columnModel.getColumn(10).setPreferredWidth(10);
            columnModel.getColumn(11).setPreferredWidth(3);
        }

        return columnModel;
    }

    public static DefaultTableModel setTabla(JTable jTableEjemplo) {

        // Esta lista contiene los nombres que se mostrarán en el encabezado de cada columna de la grilla
        if (Principal.obligaoSINO.equalsIgnoreCase("NO")) {
            columnas = new String[]{
                "COSTO",
                "#",
                "CODIGO",
                "ARTICULO",
                "CANTIDAD",
                "DESCUENTO",
                "BODEGA",
                "P. UNIT",
                "P. TOTAL",
                "CANTIDAD"};
            tiposColumnas = new Class[]{
                java.lang.String.class,
                java.lang.String.class,
                java.lang.String.class,
                java.lang.String.class,
                java.lang.String.class,
                java.lang.String.class,
                java.lang.String.class,
                java.lang.String.class,
                java.lang.String.class,
                java.lang.String.class,
                JButton.class // <- noten que aquí se especifica que la última columna es un botón
            };
        } else {
            columnas = new String[]{
                "COSTO",
                "#",
                "CODIGO",
                "ARTICULO",
                "CANTIDAD",
                "DESCUENTO",
                "BODEGA",
                "P. UNIT",
                "P. TOTAL",
                "CANTIDAD",
                "AIR",
                "Buscar Air"};
            tiposColumnas = new Class[]{
                java.lang.String.class,
                java.lang.String.class,
                java.lang.String.class,
                java.lang.String.class,
                java.lang.String.class,
                java.lang.String.class,
                java.lang.String.class,
                java.lang.String.class,
                java.lang.String.class,
                java.lang.String.class,
                java.lang.String.class,
                JButton.class // <- noten que aquí se especifica que la última columna es un botón
            };

        }

        modelo = new DefaultTableModel(
                null,
                columnas) {
            // Esta variable nos permite conocer de antemano los tipos de datos de cada columna, dentro del TableModel
            Class[] tipos = tiposColumnas;

            @Override
            public Class getColumnClass(int columnIndex) {
                // Este método es invocado por el CellRenderer para saber que dibujar en la celda,
                // observen que estamos retornando la clase que definimos de antemano.
                return tipos[columnIndex];
            }

            @Override
            public boolean isCellEditable(int row, int column) {
                // Sobrescribimos este método para evitar que la columna que contiene los botones sea editada.
                return (column == 3 || column == 4 || column == 5 || column == 7 || column == 8); //this.getColumnClass(column).equals(JButton.class));
            }
        };

        // El objetivo de la siguiente línea es indicar el CellRenderer que será utilizado para dibujar el botón
        jTableEjemplo.setDefaultRenderer(JButton.class, new TableCellRenderer() {
            @Override
            public Component getTableCellRendererComponent(JTable jtable, Object objeto, boolean estaSeleccionado, boolean tieneElFoco, int fila, int columna) {
                /**
                 * Observen que todo lo que hacemos en éste método es retornar
                 * el objeto que se va a dibujar en la celda. Esto significa que
                 * se dibujará en la celda el objeto que devuelva el TableModel.
                 * También significa que este renderer nos permitiría dibujar
                 * cualquier objeto gráfico en la grilla, pues retorna el objeto
                 * tal y como lo recibe.
                 */
                return (Component) objeto;
            }
        });

        /**
         * Por último, agregamos un listener que nos permita saber cuando fue
         * pulsada la celda que contiene el botón. Noten que estamos capturando
         * el clic sobre JTable, no el clic sobre el JButton. Esto también
         * implica que en lugar de poner un botón en la celda, simplemente
         * pudimos definir un CellRenderer que hiciera parecer que la celda
         * contiene un botón. Es posible capturar el clic del botón, pero a mi
         * parecer el efecto es el mismo y hacerlo de esta forma es más "simple"
         */
        jTableEjemplo.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                int fila = jTableEjemplo.rowAtPoint(e.getPoint());
                int columna = jTableEjemplo.columnAtPoint(e.getPoint());

                /**
                 * Preguntamos si hicimos clic sobre la celda que contiene el
                 * botón, si tuviéramos más de un botón por fila tendríamos que
                 * además preguntar por el contenido del botón o el nombre de la
                 * columna
                 */
                if (jTableEjemplo.getModel().getColumnClass(columna).equals(JButton.class)) {
                    /**
                     * Aquí pueden poner lo que quieran, para efectos de este
                     * ejemplo, voy a mostrar en un cuadro de dialogo todos los
                     * campos de la fila que no sean un botón.
                     */

                    StringBuilder sb = new StringBuilder();
                    for (int i = 0; i < jTableEjemplo.getModel().getColumnCount(); i++) {
                        if (jTableEjemplo.getModel().getColumnClass(i).equals(JButton.class)) {
                            //   sb.append("\n").append(jTableEjemplo.getModel().getColumnName(i)).append(": ").append(jTableEjemplo.getModel().getValueAt(fila, i));
                            ////    Buscar_Productos c = new Buscar_Productos();
                            /////    c.acturlziarProductos(jTableEjemplo.getValueAt(fila, 2).toString());
                        }
                    }
                    // JOptionPane.showMessageDialog(null, "Seleccionada la fila " + fila + sb.toString());
                }
            }
        });
        jTableEjemplo.setModel(modelo);
        setModeloColumnasCompras(jTableEjemplo);
        return modelo;
    }
}
