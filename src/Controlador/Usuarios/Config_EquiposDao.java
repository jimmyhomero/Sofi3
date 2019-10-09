/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.Config_Equipos;
import Vista.Principal;
import Vista.alertas.alerta;
import Vlidaciones.ProgressBar;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author USUARIO
 */
public class Config_EquiposDao extends Coneccion {

    ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    String tabla = "Config_Equipos";
    private ArrayList<Config_Equipos> lista = new ArrayList<Config_Equipos>();

    public boolean guardar(Config_Equipos tarea) {
        boolean estado = false;
        try {
            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (nombre,valor1,Equipos_codigo,Config2_codigo) VALUES(?,?,?,?)");
            consulta.setString(1, tarea.getNombre());
            consulta.setString(2, tarea.getValor1());
            consulta.setInt(3, tarea.getEquipos_codigo());
            consulta.setInt(4, tarea.getConfig2_codigo());

            consulta.executeUpdate();
            estado = true;
        } catch (SQLException ex) {
            estado = false;
            if (ex.toString().contains("duplicate entry")) {
                //alerta.menajes(ex.toString());
            } else {

                alerta.menajes(ex.toString());
            }

        } finally {
            this.cerrar();
        }
        return estado;
    }

    public DefaultTableModel Buscar_table_like(String columna, String value) {
        DefaultTableModel modelo = null;

        String[] titulos
                = {"Codigo", "Nombre de Config", "Valor1", "Valor2", "Valor3", "Valor4", "Valor5", "Valor6"};
        String[] registros = new String[8];
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
            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall("Select * from " + tabla + " where " + columna + " like '%" + value + "%'");
            //System.out.println("Controlador.CUsuarios.Buscar_table()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {

                registros[0] = String.valueOf(rs.getInt("Codigo"));
                registros[1] = rs.getString("Nombre");
                registros[2] = rs.getString("valor1");
                registros[3] = rs.getString("valor2");
                registros[4] = rs.getString("valor3");
                registros[5] = rs.getString("valor4");
                registros[6] = rs.getString("valor5");
                registros[7] = rs.getString("valor6");

                modelo.addRow(registros);

            }

        } catch (Exception ex) {
            msg.setProgressBar_mensajae(ex.toString());
        } finally {
            this.cerrar();
        }

        return modelo;
    }

    public DefaultTableModel Buscar_table_only_Activos() {
        DefaultTableModel modelo = null;
        String sql = "select * from " + tabla + "  order BY nombre ";

        String[] titulos
                = {"Codigo", "Nombre de Config", "Valor1", "Valor2", "Valor3", "Valor4", "Valor5", "Valor6"};
        String[] registros = new String[8];
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
            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall(sql);
            System.out.println("Controlador.CUsuarios.Buscar_table()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {

                registros[0] = String.valueOf(rs.getInt("Codigo"));
                registros[1] = rs.getString("Nombre");
                registros[2] = rs.getString("valor1");
                registros[3] = rs.getString("valor2");
                registros[4] = rs.getString("valor3");
                registros[5] = rs.getString("valor4");
                registros[6] = rs.getString("valor5");
                registros[7] = rs.getString("valor6");
                modelo.addRow(registros);

            }

        } catch (Exception ex) {

            msg.setProgressBar_mensajae("Error..!! " + ex);

        } finally {
            this.cerrar();
        }

        return modelo;
    }

    public DefaultTableModel getFormatosFacturasyMas() {
        DefaultTableModel modelo = null;
        String sql = "select * from " + tabla + " where valor6='formato' order BY nombre  ";

        String[] titulos
                = {"CODIGO", "DOCUMENTO", "NOMBRE", "RUTA ARCHIVO", "ARCHIVO"};
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
            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall(sql);
            System.out.println("Controlador.CUsuarios.Buscar_table()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {

                registros[0] = String.valueOf(rs.getInt("Codigo"));
                registros[1] = rs.getString("Nombre");
                registros[2] = rs.getString("valor1");
                registros[3] = rs.getString("valor2");
                registros[4] = rs.getString("valor3");
                registros[5] = rs.getString("valor4");
                registros[6] = rs.getString("valor5");
                registros[7] = rs.getString("valor6");
                modelo.addRow(registros);

            }

        } catch (Exception ex) {

            msg.setProgressBar_mensajae("Error..!! " + ex);

        } finally {
            this.cerrar();
        }

        return modelo;
    }

    public void modificar(Config_Equipos persona) {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("UPDATE " + tabla + " SET "
                    + "valor1 = ? "
                    + "where nombre = ? and  Equipos_Codigo=?");
            st.setString(1, persona.getValor1());
            st.setString(2, persona.getNombre());
            st.setInt(3, persona.getEquipos_codigo());
            String sql = st.toString();
            System.out.println("XXXXXXXXXXXXÑ "+sql);
            //JOptionPane.showMessageDialog(null, sql);
            st.executeUpdate();
            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
        } catch (SQLException e) {
            alerta.menajes(e.toString());
            //JOptionPane.showMessageDialog(null, e);
            //msg.setProgressBar_mensajae(e.toString());
        } finally {
            this.cerrar();
        }

    }

    public ArrayList<Config_Equipos> listarBuscarConCodigo(Integer cod) {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla + " where codigo = " + cod + " order BY nombre ");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Config_Equipos per = new Config_Equipos();
                per.setCodigo(rs.getInt("Codigo"));
                per.setNombre(rs.getString("nombre"));
                per.setValor1(rs.getString("valor1"));
                per.setEquipos_codigo(rs.getInt("Equipos_codigo"));
                per.setConfig2_codigo(rs.getInt("config2_codigo"));

                this.lista.add(per);
            }

        } catch (Exception ex) {
            alerta.menajes(ex.toString());
            msg.setMensaje(ex.toString());
            //System.out.println("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }

    public ArrayList<Config_Equipos> listar() {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla + " order BY nombre");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Config_Equipos per = new Config_Equipos();
                per.setCodigo(rs.getInt("Codigo"));
                per.setNombre(rs.getString("nombre"));
                per.setValor1(rs.getString("valor1"));
                per.setEquipos_codigo(rs.getInt("Equipos_codigo"));
                per.setConfig2_codigo(rs.getInt("config2_codigo"));
                this.lista.add(per);
            }

        } catch (Exception ex) {

            alerta.menajes(ex.toString());
            msg.setMensaje(ex.toString());
            //System.out.println("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }

    public ArrayList<Config_Equipos> listarByID(Integer idEquipo) {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            //SELECT * FROM config_equipos WHERE equipos_Codigo=67 
            st = this.getCnx().prepareCall("Select * from config_equipos where Equipos_codigo=" + idEquipo);
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Config_Equipos per = new Config_Equipos();
                per.setCodigo(rs.getInt("Codigo"));
                per.setNombre(rs.getString("nombre"));
                per.setValor1(rs.getString("valor1"));
                per.setEquipos_codigo(rs.getInt("Equipos_codigo"));
                per.setConfig2_codigo(rs.getInt("config2_codigo"));
                this.lista.add(per);
            }

        } catch (Exception ex) {
            alerta.menajes(ex.toString());
            // msg.setMensaje(ex.toString());
            //System.out.println("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }

    public Config_Equipos buscarConID(Integer id) {
        ResultSet rs;
        Config_Equipos u = new Config_Equipos();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla + " where codigo = " + id);
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Config_Equipos per = new Config_Equipos();
                per.setCodigo(rs.getInt("Codigo"));
                per.setNombre(rs.getString("nombre"));
                per.setValor1(rs.getString("valor1"));
                per.setEquipos_codigo(rs.getInt("Equipos_codigo"));
                per.setConfig2_codigo(rs.getInt("config2_codigo"));
                u = per;
            }

        } catch (Exception ex) {

            msg.setMensaje(ex.toString());
            msg.setProgressBar_mensajae(ex.toString());
        } finally {
            this.cerrar();
        }

        return u;
    }

    public Config_Equipos buscarConfiguracionesdeEquipos(Integer ID_EQUIPO,Integer codigo_config2) {
        ResultSet rs;
        Config_Equipos u = new Config_Equipos();
        try {
            this.conectar();
            PreparedStatement st;
            String sql="SELECT * FROM Config_equipos  WHERE equipos_codigo=" +ID_EQUIPO +" and config2_codigo="+codigo_config2;
            System.out.println("swl: "+sql);
            st = this.getCnx().prepareCall(sql);
            rs = st.executeQuery();
            
            //this.lista= new ArrayList();
            while (rs.next()) {
                Config_Equipos per = new Config_Equipos();
                per.setCodigo(rs.getInt("Codigo"));
                per.setNombre(rs.getString("nombre"));
                per.setValor1(rs.getString("valor1"));
                per.setEquipos_codigo(rs.getInt("Equipos_codigo"));
                per.setConfig2_codigo(rs.getInt("config2_codigo"));
                u = per;
            }

        } catch (Exception ex) {

            alerta.menajes(ex.toString());
        } finally {
            this.cerrar();
        }

        return u;
    }

    public boolean ActualizarValor1deConfiguracion(Config_Equipos cequipo) {
        ResultSet rs;
        boolean estado = false;
        Config_Equipos u = new Config_Equipos();
        try {
            this.conectar();

            PreparedStatement st = this.con.prepareStatement("UPDATE config_equipos SET "
                    + "valor1 = ? "
                    + "where codigo = ?");
            st.setString(1, cequipo.getValor1());
            st.setInt(2, cequipo.getCodigo());

            //st = this.getCnx().prepareCall("UPDATE config_equipos SET valor1=" + cequipo.getValor1() + " WHERE codigo=" + cequipo.getCodigo());
            st.executeUpdate();
            estado = true;

        } catch (Exception ex) {
            estado = false;
            alerta.menajes(ex.toString());
        } finally {
            this.cerrar();
        }

        return estado;
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

    public void eliminar(Config_Equipos persona) throws Exception {
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
