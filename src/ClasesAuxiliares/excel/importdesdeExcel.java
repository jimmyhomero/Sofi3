/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares.excel;

import java.io.File;
import java.io.FileInputStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author USUARIO
 */
public class importdesdeExcel {

    public static DefaultTableModel modelonuevo;

    public static void Prueba(File fileName) throws ParseException {
        List cellDataList = new ArrayList();
        try {
            FileInputStream fileInputStream = new FileInputStream(fileName);
            XSSFWorkbook workBook = new XSSFWorkbook(fileInputStream);
            XSSFSheet hssfSheet = workBook.getSheetAt(0);
            Iterator rowIterator = hssfSheet.rowIterator();
            while (rowIterator.hasNext()) {
                XSSFRow hssfRow = (XSSFRow) rowIterator.next();
                Iterator iterator = hssfRow.cellIterator();
                List cellTempList = new ArrayList();
                while (iterator.hasNext()) {
                    XSSFCell hssfCell = (XSSFCell) iterator.next();
                    cellTempList.add(hssfCell);
                }
                cellDataList.add(cellTempList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        Leer2(cellDataList);
    }
    //modelonuevo = new DefaultTableModel(datos, nomcolumnas);

    private static void Leer2(List cellDataList) {
        for (int row = 0; row < cellDataList.size(); row++) {
            List cellTempList = (List) cellDataList.get(row);
            for (int col = 0; col < cellTempList.size(); col++) {               
                XSSFCell hssfCell = (XSSFCell) cellTempList.get(col);
                String stringCellValue = hssfCell.toString();
                System.out.print(stringCellValue + " ");
            }
            System.out.println();
        }
    }

    private static DefaultTableModel Leer(List cellDataList) {

        try {
            int totalColumnas = 0;
            List cellTempList = null;
            String[][] datos = null;
            String[] nombrecolumnas = null;
            //if (totalColumnas == 0) {
            List cellTempList1 = (List) cellDataList.get(0);
            datos = new String[cellDataList.size()][cellTempList1.size()];
            nombrecolumnas = new String[cellTempList1.size()];
//            }

            ///   nomcolumnas = new String[hoja1.getColumns()];
            for (int fila = 0; fila < cellDataList.size(); fila++) {
//                if (totalColumnas == 0) {
//                    cellTempList = (List) cellDataList.get(fila);                      
//                    totalColumnas = cellTempList.size();
//                }

                for (int columna = 0; columna < cellTempList.size(); columna++) {
                    XSSFCell hssfCell = (XSSFCell) cellTempList.get(columna);
                    if (fila == 0) {
                        datos[fila][columna] = null;
                        nombrecolumnas[columna] = hssfCell.toString();
                        String stringCellValue = hssfCell.toString();
                        System.out.print(stringCellValue + " ** ");
                    } else {
                        datos[fila - 1][columna] = hssfCell.toString();
                        String stringCellValue = hssfCell.toString();
                        System.out.print(stringCellValue + " ");
                    }
                }
                System.out.println();
            }
            modelonuevo = new DefaultTableModel(datos, nombrecolumnas);

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
        return modelonuevo;
    }
}
