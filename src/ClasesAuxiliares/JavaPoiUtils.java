/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ClasesAuxiliares;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import javax.swing.table.DefaultTableModel;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;

/**
 *
 * @author USUARIO
 */
public class JavaPoiUtils {

    private DefaultTableModel modelo = null;
    private int columas = 0;
    private int filas = 0;
    private int filauno = 0;
    File excelFile = null;
    InputStream excelStream = null;

    public DefaultTableModel leerExce97(File file) {
        try {
            if (file != null) {

                excelFile = file;
                excelStream = new FileInputStream(excelFile);
                HSSFWorkbook hssfWorkbook = new HSSFWorkbook(excelStream);
                HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);
                HSSFRow hssfRow = null;
                HSSFCell cell;
                filauno = hssfSheet.getFirstRowNum();
                filas = hssfSheet.getLastRowNum();
                columas = hssfSheet.getRow(filas).getPhysicalNumberOfCells();
                System.out.println("Filas: " + filas);
                System.out.println("Columnas: " + columas);
                String[] titulos = new String[16];
                String[] registros = new String[16];
                String cellValue;

                for (int r = 0; r < filas; r++) {
                    hssfRow = hssfSheet.getRow(r);
                    if (hssfRow == null) {
                        break;
                    } else {
                        System.out.print("Row: " + r + " -> ");

                        for (int c = 0; c < (16); c++) {
                            /* 
                            We have those cell types (tenemos estos tipos de celda): 
                                CELL_TYPE_BLANK, CELL_TYPE_NUMERIC, CELL_TYPE_BLANK, CELL_TYPE_FORMULA, CELL_TYPE_BOOLEAN, CELL_TYPE_ERROR
                             */
                            cellValue = hssfRow.getCell(c) == null ? ""
                                    : (hssfRow.getCell(c).getCellType() == Cell.CELL_TYPE_STRING) ? hssfRow.getCell(c).getStringCellValue()
                                    : (hssfRow.getCell(c).getCellType() == Cell.CELL_TYPE_NUMERIC) ? "" + hssfRow.getCell(c).getNumericCellValue()
                                    : (hssfRow.getCell(c).getCellType() == Cell.CELL_TYPE_BOOLEAN) ? "" + hssfRow.getCell(c).getBooleanCellValue()
                                    : (hssfRow.getCell(c).getCellType() == Cell.CELL_TYPE_BLANK) ? "BLANK"
                                    : (hssfRow.getCell(c).getCellType() == Cell.CELL_TYPE_FORMULA) ? "FORMULA"
                                    : (hssfRow.getCell(c).getCellType() == Cell.CELL_TYPE_ERROR) ? "ERROR" : "";

                            if (r == filauno) {
                                if (cellValue.equalsIgnoreCase("BLANK") || cellValue.equalsIgnoreCase("FORMULA") || cellValue.equalsIgnoreCase("ERROR")) {
                                } else {
                                    titulos[c] = c + "-" + cellValue;
                                }

                            } else {
                                if (cellValue.equalsIgnoreCase("BLANK") || cellValue.equalsIgnoreCase("FORMULA") || cellValue.equalsIgnoreCase("ERROR")) {
                                } else {
                                    registros[c] = cellValue;
                                }
                            }
                        }
                        if (r == filauno) {
                            System.out.print("titulos: " + titulos[1]);
                            modelo = new DefaultTableModel(null, titulos) {
                                private static final long serialVersionUID = 1L;

                                @Override
                                public Class<?> getColumnClass(int column) {
                                    switch (column) {
                                        
//                                           case 7:
//                                            return Double.class;
//                                            case 8:
//                                            return Double.class;
//                                            case 9:
//                                            return Double.class;
//                                            case 11:
//                                            return Double.class;
                                        default:
                                            return String.class;
                                    }
                                }

                                @Override
                                public boolean isCellEditable(int row, int column
                                ) {
                                    // make read only fields except column 0,13,14
                                    //return column == 3 || column == 4 || column == 5 || column == 6 || column == 7 || column == 8 || column == 9 || column == 10;
                                    return false;
                                }
                            };
                        } else {
                            System.out.print("Registros: " + registros[3]);
                            modelo.addRow(registros);
                        }
                        System.out.println();
                    }
                }
            } else {
                System.out.println("archivo invalido");
            }

        } catch (FileNotFoundException ex) {
            System.out.println(ex);
        } catch (IOException ex) {
            System.out.println(ex);

        }
        return modelo;
    }
}
