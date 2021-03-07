/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.SeriesRetencion;
import Vista.Principal;
import Vlidaciones.ProgressBar;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import ClasesAuxiliares.debug.Deb;

/**
 * SeriesFacturas
 *
 * @author USUARIO
 */
public class SeriesRetencionsDao extends Coneccion {

    ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    String tabla = "SeriesRetencion";
    private ArrayList<SeriesRetencion> lista = new ArrayList<SeriesRetencion>();

    public void guardar(SeriesRetencion tarea) {
        try {
            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (sec1,sec2,fac3,Equipos_codigo) VALUES(?,?,?,?)");
            consulta.setString(1, tarea.getSec1());
            consulta.setString(2, tarea.getSec2());
            consulta.setString(3, tarea.getFac3());
            consulta.setInt(4, tarea.getEquipos_Codigo());

            consulta.executeUpdate();
        } catch (SQLException ex) {
            msg.setProgressBar_mensajae("Error..!! " + ex);

        } finally {
            this.cerrar();
        }
    }
// 
//    public DefaultTableModel Buscar_table_like(String columna, String value) {
//        DefaultTableModel modelo = null;
//
//        String[] titulos
//                = {"Codigo", "Nombre de SeriesFacturas", "Valor1", "Valor2", "Valor3", "Valor4", "Valor5", "Valor6"};
//        String[] registros = new String[8];
//        modelo = new DefaultTableModel(null, titulos) {
//            @Override
//            public boolean isCellEditable(int row, int column) {
//                // make read only fields except column 0,13,14
//                //  return column == 0 || column == 13 || column == 14;
//                return false;
//            }
//        };
//
//        ResultSet rs;
//        try {
//            this.conectar();
//            PreparedStatement st;
//
//            st = this.getCnx().prepareCall("Select * from " + tabla + " where " + columna + " like '%" + value + "%'");
//            //Deb.consola("Controlador.CUsuarios.Buscar_table()" + st.toString());
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//
//                registros[0] = String.valueOf(rs.getInt("Codigo"));
//                registros[1] = rs.getString("Nombre");
//                registros[2] = rs.getString("valor1");
//                registros[3] = rs.getString("valor2");
//                registros[4] = rs.getString("valor3");
//                registros[5] = rs.getString("valor4");
//                registros[6] = rs.getString("valor5");
//                registros[7] = rs.getString("valor6");
//                
//                
//                modelo.addRow(registros);
//                
//                }
//
//        } catch (Exception ex) {
//            msg.setProgressBar_mensajae(ex.toString());
//        } finally {
//            this.cerrar();
//        }
//
//        return modelo;
//    }

//    public DefaultTableModel Buscar_table_only_Activos() {
//        DefaultTableModel modelo = null;
//        String sql="select * from SeriesFacturas  order BY nombre LIMIT 0, 50";
//        
//        String[] titulos
//                = {"Codigo", "Nombre de SeriesFacturas", "Valor1", "Valor2", "Valor3", "Valor4", "Valor5", "Valor6"};
//        String[] registros = new String[8];
//        modelo = new DefaultTableModel(null, titulos) {
//            @Override
//            public boolean isCellEditable(int row, int column) {
//                // make read only fields except column 0,13,14
//                //  return column == 0 || column == 13 || column == 14;
//                return false;
//            }
//        };
//        
//        ResultSet rs;
//        try {
//            this.conectar();
//            PreparedStatement st;
//            
//            st = this.getCnx().prepareCall(sql);
//            Deb.consola("Controlador.CUsuarios.Buscar_table()" + st.toString());
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//                
//                registros[0] = String.valueOf(rs.getInt("Codigo"));
//                registros[1] = rs.getString("Nombre");
//                registros[2] = rs.getString("valor1");
//                registros[3] = rs.getString("valor2");
//                registros[4] = rs.getString("valor3");
//                registros[5] = rs.getString("valor4");
//                registros[6] = rs.getString("valor5");
//                registros[7] = rs.getString("valor6");
//                modelo.addRow(registros);
//                
//            }
//            
//        } catch (Exception ex) {
//            
//            msg.setProgressBar_mensajae("Error..!! " + ex);
//            
//        } finally {
//            this.cerrar();
//        }
//        
//        return modelo;
//    }
    public void modificar(SeriesRetencion persona) {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("UPDATE " + tabla + " SET "
                    + "sec1 = ?, "
                    + "sec2 = ?, "
                    + "fac3 = ? "
                    + "where codigo = ?");
            st.setString(1, persona.getSec1());
            st.setString(2, persona.getSec2());
            st.setString(3, persona.getFac3());
            st.setDouble(4, persona.getCodigo());
            String sql = st.toString();

            st.executeUpdate();

            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
        } catch (SQLException e) {
            msg.setProgressBar_mensajae(e.toString());
        } finally {
            this.cerrar();
        }

    }

    public ArrayList<SeriesRetencion> listarBuscarConCodigo(Integer cod) {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla + " where codigo = " + cod + " order BY fac3");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                SeriesRetencion per = new SeriesRetencion();
                per.setCodigo(rs.getInt("Codigo"));
                per.setSec1(rs.getString("sec1"));
                per.setSec2(rs.getString("sec2"));
                per.setFac3(rs.getString("fac3"));
                per.setFac3(rs.getString("equipos_Codigo"));

                this.lista.add(per);
            }

        } catch (Exception ex) {
            msg.setMensaje(ex.toString());
            //Deb.consola("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }

    public ArrayList<SeriesRetencion> listar() {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla + " order BY fac3 ");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                SeriesRetencion per = new SeriesRetencion();
                per.setCodigo(rs.getInt("Codigo"));
                per.setSec1(rs.getString("sec1"));
                per.setSec2(rs.getString("sec2"));
                per.setFac3(rs.getString("fac3"));
                per.setFac3(rs.getString("equipos_Codigo"));
                this.lista.add(per);
            }

        } catch (Exception ex) {
            msg.setMensaje(ex.toString());
            //Deb.consola("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }

    public SeriesRetencion getMaxNUumeroFactura(Integer codigEquipo) {
        ResultSet rs;
        SeriesRetencion serieFac = new SeriesRetencion();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("SELECT  * , MAX(fac3)  as maximo FROM SeriesRetencion WHERE equipos_Codigo= " + codigEquipo);
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                SeriesRetencion per = new SeriesRetencion();
                per.setCodigo(rs.getInt("Codigo"));
                per.setSec1(rs.getString("sec1"));
                per.setSec2(rs.getString("sec2"));
                per.setFac3(rs.getString("maximo"));
                per.setEquipos_Codigo(rs.getInt("equipos_Codigo"));
                serieFac = per;
            }

        } catch (Exception ex) {
            msg.setMensaje(ex.toString());
           Deb.consola("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return serieFac;
    }

    

    public SeriesRetencion buscarConID(Integer id) {
        ResultSet rs;
        SeriesRetencion u = new SeriesRetencion();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla + " where codigo = " + id);
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                SeriesRetencion per = new SeriesRetencion();
                per.setCodigo(rs.getInt("Codigo"));
                per.setSec1(rs.getString("sec1"));
                per.setSec2(rs.getString("sec2"));
                per.setFac3(rs.getString("fac3"));
                per.setFac3(rs.getString("equipos_Codigo"));
                u = per;
            }

        } catch (Exception ex) {
            msg.setProgressBar_mensajae(ex.toString());
        } finally {
            this.cerrar();
        }

        return u;
    }
//     public ResultSet listar_table(String sql) {
//        //
//        ResultSet rs = null;
//        try {
//            this.conectar();
//            PreparedStatement st;
//            st = this.getCnx().prepareCall(sql  );
//            rs = st.executeQuery();
//        } catch (Exception ex) {
//          msg.setProgressBar_mensajae(ex.toString());
//        } finally {
//          //  this.cerrar();
//        }
//
//        return rs;
//        
//    }

    public void eliminar(SeriesRetencion persona) throws Exception {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("DELETE from " + tabla
                    + " WHERE Codigo=?");
            st.setInt(1, persona.getCodigo());
            st.executeUpdate();
        } catch (SQLException e) {
            msg.setProgressBar_mensajae("Error..!! " + e);
        } finally {
            this.cerrar();
        }

    }

}
