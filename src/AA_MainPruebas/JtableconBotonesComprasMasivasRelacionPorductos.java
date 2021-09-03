/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AA_MainPruebas;

import ClasesAuxiliares.debug.Deb;
import Vista.Principal;
import Vista.Usuarios.Modal_fac_electronica_relacionarProductos;
import java.awt.Color;

import java.awt.Component;
import java.awt.Frame;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellRenderer;
import javax.swing.table.TableColumnModel;

/**
 *
 * @author USUARIO
 */
public class JtableconBotonesComprasMasivasRelacionPorductos extends DefaultTableCellRenderer {

    ////////////
    ////PINTAR FILAS 
    private int columna;
    private int row;
    private int colClaveaccso;

    public JtableconBotonesComprasMasivasRelacionPorductos(int Colpatron) {
        this.columna = Colpatron;
        colClaveaccso = 8;
    }

    public JtableconBotonesComprasMasivasRelacionPorductos(int row, int col) {
        this.columna = col;
        this.row = row;
    }

    ////////////
    public static DefaultTableModel modelo;//= new DefaultTableModel() ;
    private static String[] columnas;
    private static Class[] tiposColumnas;

    public static DefaultTableModel setTabla(JTable jTableEjemplo) {

        // Esta lista contiene los nombres que se mostrarán en el encabezado de cada columna de la grilla
        columnas = new String[]{
            "#",
            "COSTO",
            "CODIGO",
            "PRODUCTO",
            "COD. INTERNO",
            "PRODUCTO INTERNO",
            "BUSCAR",
            "CODIGO"};
        tiposColumnas = new Class[]{
            java.lang.String.class,
            java.lang.String.class,
            java.lang.String.class,
            java.lang.String.class,
            java.lang.String.class,
            java.lang.String.class,
            JButton.class, // <- noten que aquí se especifica que la última columna es un botón
            java.lang.String.class
        };

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
                return (column == 3 || column == 4 || column == 5); //this.getColumnClass(column).equals(JButton.class));
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

//                    JOptionPane.showMessageDialog(null, "Seleccionada la fila " + fila + sb.toString());
                }
            }
        });
        jTableEjemplo.setModel(modelo);
        //JtableconBotonesComprasMasivasRelacionPorductos(jTableEjemplo);
        return modelo;
    }

    @Override
    public Component getTableCellRendererComponent(JTable table, Object value, boolean selected, boolean focused, int row, int column) {
        //Deb.consola("sssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaalllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");
        setBackground(Color.white);
        table.setForeground(Color.black);
        super.getTableCellRendererComponent(table, value, selected, focused, row, column);
        if ((row % 2) != 0) {
            this.setBackground(new java.awt.Color(245, 245, 245));
            table.setForeground(Color.red);
        }

        if (column == 4) {
            if (row >= 1) {
                if ((String.valueOf(table.getValueAt(row, 4))).equals(String.valueOf(table.getValueAt(row - 1, 4)))) {
                    
                    if(!String.valueOf(table.getValueAt(row, 4)).equals("NA")){
                    this.setBackground(new java.awt.Color(153, 255, 51));
                    }
                    
                }
            }

        }
        return this;
    }
}
