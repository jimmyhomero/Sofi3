/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ClasesAuxiliares;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Scanner;

/**
 *
 * @author USUARIO
 */
public class leerexcellprobar {
    

    public static void main(String[] args) {
        String fileName = "OtraPruebaExcel.xls";
        String[] data = new String[]{"a", "b", "c", "d", "e"};
        //CreateExcel(fileName, data);
        //ReadExcel(fileName);
        //OverwriteExcel(fileName, data);
    }

    private static void CreateExcel(String fileName, String[] data) {
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("Hoja prueba");

        for (int j = 0; j < 2; j++) {// 2 por el Encabezado y la linea de informacion
            HSSFRow row = sheet.createRow(j);
            for (int i = 0; i < data.length; i++) {// Tantos loops como info en el arreglo
                HSSFCell cell = row.createCell(i);
                if (j == 0) {
                    cell.setCellValue("#" + i);
                } else {
                    cell.setCellValue(data[i]);
                }
            }
        }

        try {
            FileOutputStream fos = null;
            File file;

            file = new File(fileName);
            fos = new FileOutputStream(file);

            workbook.write(fos);
            workbook.close();
            fos.close();
            System.out.println("Finalizado");

        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    }

    private static void ReadExcel(String fileName) {
        try {
            InputStream myFile = new FileInputStream(new File(fileName));
            HSSFWorkbook wb = new HSSFWorkbook(myFile);
            HSSFSheet sheet = wb.getSheetAt(0);

            HSSFCell cell;
            HSSFRow row;

            System.out.println("Apunto de entrar a loops");

            System.out.println("" + sheet.getLastRowNum());

            for (int i = 0; i < sheet.getLastRowNum() + 1; i++) {
                row = sheet.getRow(i);
                for (int j = 0; j < row.getLastCellNum(); j++) {
                    cell = row.getCell(j);
                    System.out.println("Valor: " + cell.toString());
                }
            }
            System.out.println("Finalizado");

        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    }

    private static void OverwriteExcel(String fileName, String[] data) {
        try {
            InputStream inp = new FileInputStream(new File(fileName));
            HSSFWorkbook oldWorkbook = new HSSFWorkbook(inp);

            HSSFSheet oldSheet = oldWorkbook.getSheetAt(0);

            HSSFRow oldRow;

            oldRow = oldSheet.createRow(oldSheet.getLastRowNum() + 1);
            for (int i = 0; i < data.length; i++) {// Tantos loops como info en el arreglo
                HSSFCell cell = oldRow.createCell(i);
                cell.setCellValue(data[i]);
            }

            FileOutputStream fos = null;
            File file;

            file = new File(fileName);
            fos = new FileOutputStream(file);

            oldWorkbook.write(fos);
            oldWorkbook.close();
            fos.close();

            System.out.println("Finalizado");

        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    }
}