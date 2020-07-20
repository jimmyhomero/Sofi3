/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ecx.unomas.elements.ArchivoUtil;
import ecx.unomas.service.Comprobante;
import ecx.unomas.service.Config;
import java.io.File;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author USUARIO
 */
public class Electronica {
    public void crear_firmar_enviar() {
        Coneccion conneccion = new Coneccion();
        String registros = "";
        ResultSet rs;
        try {
            conneccion.conectar();
            PreparedStatement st;
            st = conneccion.getCnx().prepareCall("SELECT calveAcceso, estado FROM facturas WHERE estado= 0");
            System.out.println("Controlador.CUsuarios.Buscar_table()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                registros = rs.getString("calveAcceso");
                File xml_file = new File(Config.GENERADOS_DIR + registros + ".xml");
                byte[] archivoBytes = null;
                try {

                    archivoBytes = ArchivoUtil.convertirArchivoAByteArray(xml_file);
                } catch (IOException ex) {
                    System.out.println("Error Al crear xml en: " + Electronica.class.getName() + "Error tipo: " + ex);
                    //Logger.getLogger(FacturasDao.class.getName()).log(Level.SEVERE, null, ex);                        
                }
                Comprobante c = new Comprobante();
                c.upload(registros, archivoBytes);
                System.out.println("FIRMADO : " + Config.FE_DOCUMENTO_FIRMADO);
                System.out.println("AUTORIZADO : " + Config.FE_DOCUMENTO_AUTORIZADO);
                System.out.println("ENVIADO : " + Config.FE_DOCUMENTO_ENVIADO);
                String sql="UPDATE facturas SET estado =1 WHERE calveAcceso ='" + registros+"'";
                if (Config.FE_DOCUMENTO_FIRMADO) {
                    st = conneccion.getCnx().prepareCall(sql);
                    System.err.println("SSSS" + st.toString());
                    st.executeUpdate();
                    System.out.print("1111111111");
                    try {
                        //sleep 10 seconds
                        System.out.println("Nuevo Barido...");
                        Thread.sleep(1000);

                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }

                }
                if (Config.FE_DOCUMENTO_AUTORIZADO) {
                    st = conneccion.getCnx().prepareCall("UPDATE facturas SET estado =2 WHERE calveAcceso = '" + registros+"'");
                    st.executeUpdate();
                    System.out.print("2222222222222");
                    try {
                        //sleep 10 seconds
                        System.out.println("Nuevo Barido...");
                        Thread.sleep(1000);
                       

                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }

                }
                if (Config.FE_DOCUMENTO_ENVIADO) {
                    st = conneccion.getCnx().prepareCall("UPDATE facturas SET estado =3 WHERE calveAcceso ='" + registros+"'");
                    st.executeUpdate();
                    System.out.print("3333333333333");
                    try {
                        //sleep 10 seconds
                        System.out.println("Nuevo Barido...");
                        Thread.sleep(1000);

                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }

                }
            }
            /* VUELVO A LLAMR RECURSIVAMENTE LA BUSQUEDA*/
            try {
                //sleep 10 seconds
                System.out.println("Nuevo Barido...");
                Thread.sleep(10000);
                crear_firmar_enviar();

            } catch (InterruptedException e) {
                e.printStackTrace();
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "hhhhty");
        } finally {
            conneccion.cerrar();
        }
    }
    private void finddoc() {

        File fichero = new File(Config.GENERADOS_DIR);
        String[] listaArchivos = fichero.list();
        for (int i = 0; i < listaArchivos.length; i++) {
            System.out.println(listaArchivos[i]);
        }
    }

public DefaultTableModel buscarDocElectronicosXFecha(String fecha1, String fecha2) {

        String[] titulos = {"FECHA", "RUC/CEDULA", "NUMERO DOCUMENTO", "ESTADO", "OBSERVACIONES"};
        String[] registros = new String[5];
        DefaultTableModel modelo = new DefaultTableModel(null, titulos) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // make read only fields except column 0,13,14
                return column == 3 || column == 4 || column == 5;
                //  return false;
            }
        };
        Coneccion conneccion = new Coneccion();
        ResultSet rs;
        try {

            conneccion.conectar();
            PreparedStatement st;

            st = conneccion.getCnx().prepareCall("SELECT f.fecha,  c.cedula , f.calveAcceso, f.estado, f.DescripcionElectronica FROM facturas f INNER JOIN  CLIENTES c ON (f.Clientes_Codigo = c.codigo) WHERE f.FECHA BETWEEN '" + fecha1 + "' and '" + fecha2 + "' ");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                registros[0] = rs.getDate("fecha").toString();
                registros[1] = rs.getString("cedula");
                registros[2] = rs.getString("calveAcceso");
                if (rs.getInt("estado") == 0) {
                    registros[3] = "No Autotizada";
                }
                if (rs.getInt("estado") == 1) {
                    registros[3] = "Firmada";
                }
                if (rs.getInt("estado") == 2) {
                    registros[3] = "Autorizada";
                }
                if (rs.getInt("estado") == 3) {
                    registros[3] = "Enviada";
                }
                registros[4] = rs.getString("DescripcionElectronica");
                modelo.addRow(registros);
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "hhhhty");
        } finally {
            conneccion.cerrar();
        }
        return modelo;
    }

public DefaultTableModel BuscarDocumentosElectronicosFac(String value) {
        DefaultTableModel modelo = null;
        Coneccion conneccion = new Coneccion();
        String[] titulos = {"FECHA", "RUC/CEDULA", "NUMERO DOCUMENTO", "ESTADO", "OBSERVACIONES"};
        String[] registros = new String[5];
        modelo = new DefaultTableModel(null, titulos) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // make read only fields except column 0,13,14
                //  return column == 0 || column == 13 || column == 14;
                return false;
            }
        };

        ResultSet rs;
        try {
            conneccion.conectar();
            PreparedStatement st;
            if (value.length() <= 13) {
                st = conneccion.getCnx().prepareCall("SELECT f.fecha,  c.cedula , f.calveAcceso, f.estado, f.DescripcionElectronica FROM facturas f INNER JOIN  CLIENTES c ON (f.Clientes_Codigo = c.codigo) WHERE c.Cedula  like '%" + value + "%'");
            } else {
                st = conneccion.getCnx().prepareCall("SELECT f.fecha,  c.cedula , f.calveAcceso, f.estado, f.DescripcionElectronica FROM facturas f INNER JOIN  CLIENTES c ON (f.Clientes_Codigo = c.codigo) WHERE f.calveAcceso  like '%" + value + "%'");
            }
            System.out.println("Controlador.CUsuarios.Buscar_table()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                registros[0] = rs.getDate("fecha").toString();
                registros[1] = rs.getString("cedula");
                registros[2] = rs.getString("calveAcceso");
                if (rs.getInt("estado") == 0) {
                    registros[3] = "No Autotizada";
                }
                if (rs.getInt("estado") == 1) {
                    registros[3] = "Firmada";
                }
                if (rs.getInt("estado") == 2) {
                    registros[3] = "Autorizada";
                }
                if (rs.getInt("estado") == 3) {
                    registros[3] = "Enviada";
                }
                registros[4] = rs.getString("DescripcionElectronica");
                modelo.addRow(registros);
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "hhhhty");
        } finally {
            conneccion.cerrar();
        }
//        File fichero = new File(Config.GENERADOS_DIR);
//        String[] listaArchivos = fichero.list();
//        for (int i = 0; i < listaArchivos.length; i++) {
//            registros[0] = listaArchivos[i];
//            System.out.println(listaArchivos[i]);

        //}
        return modelo;
    }
public DefaultTableModel listaAutorizadosdesdeCarpetaAutorizados() {
        DefaultTableModel modelo = null;
        String[] titulos = {"FECHA", "RUC/CEDULA", "NUMERO DOCUMENTO", "ESTADO", "OBSERVACIONES"};
        String[] registros = new String[4];
        modelo = new DefaultTableModel(null, titulos) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // make read only fields except column 0,13,14
                //  return column == 0 || column == 13 || column == 14;
                return false;
            }
        };
        File fichero = new File(Config.GENERADOS_DIR);
        String[] listaArchivos = fichero.list();
        for (int i = 0; i < listaArchivos.length; i++) {
            registros[0] = listaArchivos[i];
            System.out.println(listaArchivos[i]);
            modelo.addRow(registros);
        }
        return modelo;
    }
}
