/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.Cajas;
import Modelo.Equipos;
import Vlidaciones.ProgressBar;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import ClasesAuxiliares.debug.Deb;

/**
 *
 * @author USUARIO
 */
public class EquiposDao extends Coneccion {

    ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    String tabla = "Equipos";
    private ArrayList<Equipos> lista = new ArrayList<Equipos>();
    
    public Integer guardar(Equipos tarea) {
        Integer codigoThisEquipo=null;
        try {
            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (NombreReal,nombreSoft,Ubicacion,Descripcion,usuario,responsable,serie,secuencia1,secuencia2,secuencia3,ip,cajas_codigo,cajas_nombre) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            consulta.setString(1, tarea.getNombreReal());
            consulta.setString(2, tarea.getNombreSof());
            consulta.setString(3, tarea.getUbicacion());
            consulta.setString(4, tarea.getDescipcion());
            consulta.setString(5, tarea.getUsuario());
            consulta.setString(6, tarea.getResponsable());
            consulta.setString(7, tarea.getSerie());
            consulta.setString(8, tarea.getSecuencia1());
            consulta.setString(9, tarea.getSecuencia2());
            consulta.setString(10, tarea.getSecuencia3());
            consulta.setString(11, tarea.getIp());
            consulta.setInt(12, tarea.getCajas_Codigo());
            consulta.setString(13, tarea.getCajas_Nombre());  
               consulta.executeUpdate();
            ResultSet rs = consulta.getGeneratedKeys();
            if (rs.next()) {
                codigoThisEquipo = rs.getInt(1);
                Deb.consola("Controlador.Usuarios.EquiposDao.guardar()>: " + codigoThisEquipo);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null,ex);
            msg.setProgressBar_mensajae("Error..!! " + ex);

        } finally {
            this.cerrar();
        }
        return codigoThisEquipo;
    }

    public DefaultTableModel Buscar_table_like(String columna, String value) {
        DefaultTableModel modelo = null;

        String[] titulos
                = {"Codigo", "Nombre Real", "Nombre Soft", "Usuario", "Responsable", "Ip", "Ubicacion", "Descripcion"};
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
            rs = st.executeQuery();
            while (rs.next()) {
                registros[0] = String.valueOf(rs.getInt("Codigo"));
                registros[1] = rs.getString("NombreReal");
                registros[2] = rs.getString("NombreSof");
                registros[3] = rs.getString("Usuario");
                registros[4] = rs.getString("responsable");
                registros[5] = rs.getString("Ip");
                registros[6] = rs.getString("Ubicacion");
                registros[7] = rs.getString("Descripcion");
                

                modelo.addRow(registros);

            }

        } catch (Exception ex) {
            msg.setProgressBar_mensajae(ex.toString());
        } finally {
            this.cerrar();
        }

        return modelo;
    }

    public Equipos Buscar_conID(Integer codigo) {
        
        ResultSet rs;
        Equipos registros = new Equipos();
        try {
            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall("Select * from " + tabla + " where codigo =" + codigo );
            rs = st.executeQuery();
            while (rs.next()) {
                
                registros.setCodigo(rs.getInt("Codigo"));
                registros.setNombreReal(rs.getString("NombreReal"));
                registros.setNombreSof(rs.getString("nombreSoft"));
                registros.setUsuario(rs.getString("Usuario"));
                registros.setResponsable(rs.getString("responsable"));
                registros.setIp(rs.getString("Ip"));
                registros.setUbicacion( rs.getString("Ubicacion"));
                registros.setDescipcion(rs.getString("Descripcion"));                              
                registros.setCajas_Codigo(rs.getInt("cajas_codigo"));                              
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex.toString());
            msg.setProgressBar_mensajae(ex.toString());
        } finally {
            this.cerrar();
        }

        return registros;
    }
    public Equipos Buscar_by_NombreSoft(String nombresoft) {
        
        ResultSet rs;
        Equipos registros = new Equipos();
        try {
            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall("Select * from " + tabla + " where nombresoft ='" + nombresoft+ "'" );
            rs = st.executeQuery();
            while (rs.next()) {
                
                registros.setCodigo(rs.getInt("Codigo"));
                registros.setNombreReal(rs.getString("NombreReal"));
                registros.setNombreSof(rs.getString("nombreSoft"));
                registros.setUsuario(rs.getString("Usuario"));
                registros.setResponsable(rs.getString("responsable"));
                registros.setIp(rs.getString("Ip"));
                registros.setUbicacion( rs.getString("Ubicacion"));
                registros.setDescipcion(rs.getString("Descripcion"));                              
                registros.setCajas_Codigo(rs.getInt("cajas_codigo"));                              
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex.toString());
            msg.setProgressBar_mensajae(ex.toString());
        } finally {
            this.cerrar();
        }

        return registros;
    }
public Equipos Buscar_by_NombreReal(String nombreReal) {
        
        ResultSet rs;
        Equipos registros = new Equipos();
        try {
            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall("Select * from " + tabla + " where nombreReal ='" + nombreReal+ "'" );
            rs = st.executeQuery();
            while (rs.next()) {
                
                registros.setCodigo(rs.getInt("Codigo"));
                registros.setNombreReal(rs.getString("NombreReal"));
                registros.setNombreSof(rs.getString("nombreSoft"));
                registros.setUsuario(rs.getString("Usuario"));
                registros.setResponsable(rs.getString("responsable"));
                registros.setIp(rs.getString("Ip"));
                registros.setUbicacion( rs.getString("Ubicacion"));
                registros.setDescipcion(rs.getString("Descripcion"));                              
                registros.setCajas_Codigo(rs.getInt("cajas_codigo"));                              
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex.toString());
            msg.setProgressBar_mensajae(ex.toString());
        } finally {
            this.cerrar();
        }

        return registros;
    }
    public DefaultTableModel Buscar_table_All() {
        DefaultTableModel modelo = null;
        String sql = "select * from Equipos  order BY nombrereal LIMIT 0, 50";

        String[] titulos
                = {"Codigo", "Nombre Real", "Nombre Soft", "Caja", "Usuario", "Responsable", "Ip", "Ubicacion", "Descripcion"};
        String[] registros = new String[9];
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
            Deb.consola("Controlador.CUsuarios.Buscar_table()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {

                registros[0] = String.valueOf(rs.getInt("Codigo"));
                registros[1] = rs.getString("NombreReal");
                registros[2] = rs.getString("NombreSoft");  
                CajasDao cajaDao = new CajasDao();
                Cajas caja = new Cajas();
                caja=cajaDao.Buscar_Cajas_ID(rs.getInt("Cajas_codigo"));
                registros[3] = caja.getCaja();
                registros[4] = rs.getString("Usuario");
                registros[5] = rs.getString("responsable");
                registros[6] = rs.getString("Ip");
                registros[7] = rs.getString("Ubicacion");
                registros[8] = rs.getString("Descripcion");
                modelo.addRow(registros);

            }

        } catch (Exception ex) {

            msg.setProgressBar_mensajae("Error..!! " + ex);

        } finally {
            this.cerrar();
        }

        return modelo;
    }

    
    public void modificar(Equipos persona) {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("UPDATE " + tabla + " SET "
                    + "NombreReal = ?, "
                    + "Nombresoft = ?, "
                    + "Ubicacion = ?, "
                    + "Descripcion = ?, "
                    + "usuario = ?, "
                    + "responsable = ?,"
                    + "serie = ?, "
                    + "secuencia1 = ?, "
                    + "secuencia2 = ?, "
                    + "secuencia3 = ?, "
                    + "ip = ?, "
                    + "cajas_codigo = ?, "
                    + "cajas_nombre = ? "
                    + "where codigo = ?");
            st.setString(1, persona.getNombreReal());
            st.setString(2, persona.getNombreSof());
            st.setString(3, persona.getUbicacion());
            st.setString(4, persona.getDescipcion());
            st.setString(5, persona.getUsuario());
            st.setString(6, persona.getResponsable());
            st.setString(7, persona.getSerie());
            st.setString(8, persona.getSecuencia1());
            st.setString(9, persona.getSecuencia2());
            st.setString(10, persona.getSecuencia3());
            st.setString(11, persona.getIp());
            st.setInt(12, persona.getCajas_Codigo());
            st.setString(13, persona.getCajas_Nombre());
            st.setInt(14, persona.getCodigo());
            String sql = st.toString();

            st.executeUpdate();

            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
        } catch (SQLException e) {
            
            JOptionPane.showMessageDialog(null, e.toString());
            msg.setProgressBar_mensajae(e.toString());
        } finally {
            this.cerrar();
        }

    }
    
    public ArrayList<Equipos> listar() {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("SELECT * FROM equipos ");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Equipos per = new Equipos();
                per.setCodigo(rs.getInt("Codigo"));
                per.setNombreReal(rs.getString("nombrereal"));
                per.setNombreSof(rs.getString("nombreSoft"));
                per.setUbicacion(rs.getString("Ubicacion"));
                per.setDescipcion(rs.getString("descripcion"));
                per.setUsuario(rs.getString("Usuario"));
                per.setResponsable((rs.getString("Responsable")));
                per.setSerie(rs.getString("serie"));
                per.setSecuencia1(rs.getString("secuencia1"));
                per.setSecuencia2(rs.getString("secuencia2"));
                per.setSecuencia3(rs.getString("secuencia3"));
                per.setIp(rs.getString("ip"));
                per.setCajas_Codigo(rs.getInt("cajas_codigo"));
                per.setCajas_Nombre(rs.getString("cajas_nombre"));
                
                this.lista.add(per);
            }
            
        } catch (Exception ex) {
            msg.setMensaje(ex.toString());
            Deb.consola("Controlador.CUsuarios.listar() ++listar equipos " + ex);
        } finally {
            this.cerrar();
        }
        
        return lista;
    }

}
