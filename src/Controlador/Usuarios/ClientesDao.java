/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.Clientes;
import Modelo.Usuarios;
import Vista.Principal;
import Vista.Usuarios.Crear_Clientes;
import Vista.Usuarios.Crear_Facturas;
import Vlidaciones.ProgressBar;
import com.mxrck.autocompleter.TextAutoCompleter;
import java.awt.Font;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;

/**
 *
 * @author USUARIO
 */
public class ClientesDao extends Coneccion {

    ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    private List<Clientes> lista = new ArrayList<Clientes>();
    private final String tabla = "Clientes";
    //private Conec mysql = new conexion(); //Instanciando la clase conexion
    //private Connection cn = mysql.conectar();

    public void Auto_CompletarClientes(JTextField j) {
        

        TextAutoCompleter textAutoAcompleter = new TextAutoCompleter(j);//Le pasan el nombre del campo de texto.

         ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from Clientes "
                    + "where cedula like '%" + j.getText() + "%' order BY Nombres LIMIT 0, 50");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Clientes per = new Clientes();
                per.setCodigo(rs.getInt("Codigo"));
                per.setCedula(rs.getString("Cedula"));
                per.setNombre(rs.getString("Nombres"));
                per.setTelefono(rs.getString("telefono"));
                per.setCelular(rs.getString("celular"));
                per.setMail(rs.getString("Mail"));
                per.setDireccion(rs.getString("Direccion"));
                per.setProvincia(rs.getString("Provinvia"));
                per.setCiudad(rs.getString("Ciudad"));
                per.setNacionalidad(rs.getString("Nacionalidad"));
                per.setPagoPredeterminado(rs.getInt("PagoPredeterminado"));
                per.setTipoCliente(rs.getInt("TipoCliente"));
                per.setVendedorPredeterminado(rs.getInt("VendedorPredeterminado"));
                per.setObservaciones(rs.getString("Observaciones"));
                per.setEstadoCivil(rs.getString("estadoCivil"));
                per.setHuella(rs.getString("huella"));
                per.setGenereo(rs.getString("genero"));
                per.setNacimiento(rs.getString("Nacimiento"));
                
                this.lista.add(per);
                       textAutoAcompleter.addItem(per);
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }
         
    }

    public void guardar(Clientes tarea) {
        try {
            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (Cedula, nombres, telefono, celular, mail, direccion, Provincia, Ciudad,Nacionalidad,PagoPredeterminado,TipoCliente,VendedorPredeterminado,Observaciones,estadoCivil,huella,genero,Nacimiento) VALUES(?,?,?,?,?,?,?,?,?,?,?, ?, ?,?, ?, ?,?)");
            consulta.setString(1, tarea.getCedula());
            consulta.setString(2, tarea.getNombre());
            consulta.setString(3, tarea.getTelefono());
            consulta.setString(4, tarea.getCelular());
            consulta.setString(5, tarea.getMail());
            consulta.setString(6, tarea.getDireccion());
            consulta.setString(7, tarea.getProvincia());
            consulta.setString(8, tarea.getCiudad());
            consulta.setString(9, tarea.getNacionalidad());
            consulta.setInt(10, 0);
            consulta.setInt(11, 0);
            consulta.setInt(12, 0);
            consulta.setString(13, tarea.getObservaciones());
            consulta.setString(14, tarea.getEstadoCivil());
            consulta.setString(15, tarea.getHuella());
            consulta.setString(16, String.valueOf(tarea.getGenereo()));
            if (!tarea.getNacimiento().isEmpty()) {
                String f = HoraFecha.fecha_ddmmaaa_conSlash_to_aa_mm_dd(tarea.getNacimiento());
                consulta.setString(17, f);
            } else {
                consulta.setString(17, "1000-01-01");
            }
            System.out.println("Controlador.CUsuarios.guardar()" + consulta);
            consulta.executeUpdate();
        } catch (SQLException ex) {
            msg.setProgressBar_mensajae(ex.toString());
            System.out.println("Controlador.CUsuarios.guardar()" + ex);
        } finally {
            this.cerrar();
        }
    }

    public void modificar(Clientes persona) {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("UPDATE Clientes SET "
                    + "Cedula = ?, "
                    + "Nombres = ?, "
                    + "Telefono = ?, "
                    + "Celular= ?, "
                    + "Mail= ?, "
                    + "Direccion = ?, "
                    + "Provincia = ?, "
                    + "Ciudad = ?, "
                    + "Nacionalidad = ?, "
                    + "PagoPredeterminado = ?, "
                    + "TipoCliente = ?, "
                    + "VendedorPredeterminado = ?, "
                    + "Observaciones = ?, "
                    + "estadoCivil = ?, "
                    + "huella = ?, "
                    + "genero = ?, "
                    + "Nacimiento = ? "
                    + "WHERE Codigo=?");
            st.setString(1, persona.getCedula());
            st.setString(2, persona.getNombre());
            st.setString(3, persona.getTelefono());
            st.setString(4, persona.getCelular());
            st.setString(5, persona.getMail());
            st.setString(6, persona.getDireccion());
            st.setString(7, persona.getProvincia());
            st.setString(8, persona.getCiudad());
            st.setString(9, persona.getNacionalidad());
            st.setInt(10, 1);
            st.setInt(11, 1);
            st.setInt(12, 1);
            st.setString(13, persona.getObservaciones());
            st.setString(14, persona.getEstadoCivil());
            st.setString(15, persona.getHuella());
            st.setString(16, String.valueOf(persona.getGenereo()));
            st.setString(17, persona.getNacimiento());
            st.setInt(18, persona.getCodigo());
            String sql = st.toString();
            System.out.println("Controlador.Usuarios.CUsuarios.modificar()" + sql);
            st.executeUpdate();
            Principal.jProgressBar2.setString("eeeeeeeeeeeee");
            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
        } catch (SQLException e) {
            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error" + e + sql, "Error al modificar Registro" + e.toString()));
            System.out.println("Controlador.CUsuarios.guardar()" + e);
        } finally {
            this.cerrar();
        }

    }

    public List<Clientes> listar() {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from Clientes  order BY Nombres LIMIT 0, 50");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Clientes per = new Clientes();
                per.setCodigo(rs.getInt("Codigo"));
                per.setCedula(rs.getString("Cedula"));
                per.setNombre(rs.getString("Nombres"));
                per.setTelefono(rs.getString("telefono"));
                per.setCelular(rs.getString("celular"));
                per.setMail(rs.getString("Mail"));
                per.setDireccion(rs.getString("Direccion"));
                per.setProvincia(rs.getString("Provinvia"));
                per.setCiudad(rs.getString("Ciudad"));
                per.setNacionalidad(rs.getString("Nacionalidad"));
                per.setPagoPredeterminado(rs.getInt("PagoPredeterminado"));
                per.setTipoCliente(rs.getInt("TipoCliente"));
                per.setVendedorPredeterminado(rs.getInt("VendedorPredeterminado"));
                per.setObservaciones(rs.getString("Observaciones"));
                per.setEstadoCivil(rs.getString("estadoCivil"));
                per.setHuella(rs.getString("huella"));
                per.setGenereo(rs.getString("genero"));
                per.setNacimiento(rs.getString("Nacimiento"));
                //per.setObservaciones(rs.getString("PersonaObservaciones"));
                //per.setFechaN(rs.getDate("PersonaFN").toString());
                //System.out.println("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
                this.lista.add(per);
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }

    public Clientes buscarConID(Integer id) {
        ResultSet rs;
        Clientes u = new Clientes();
        try {
            this.conectar();
            PreparedStatement st;
//            select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo
//            select usuarios.*, tipos_usuarios.codigo,tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo where usuarios.codigo = 1

            st = this.getCnx().prepareCall("select * from Clientes where codigo= " + id + " order BY Nombres LIMIT 0, 50");
            //select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo

            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Clientes per = new Clientes();
                per.setCodigo(rs.getInt("Codigo"));
                per.setCedula(rs.getString("Cedula"));
                per.setNombre(rs.getString("Nombres"));
                per.setTelefono(rs.getString("telefono"));
                per.setCelular(rs.getString("celular"));
                per.setMail(rs.getString("Mail"));
                per.setDireccion(rs.getString("Direccion"));
                per.setProvincia(rs.getString("Provincia"));
                per.setCiudad(rs.getString("Ciudad"));
                per.setNacionalidad(rs.getString("Nacionalidad"));
                per.setPagoPredeterminado(rs.getInt("PagoPredeterminado"));
                per.setTipoCliente(rs.getInt("TipoCliente"));
                per.setVendedorPredeterminado(rs.getInt("VendedorPredeterminado"));
                per.setObservaciones(rs.getString("Observaciones"));
                per.setEstadoCivil(rs.getString("estadoCivil"));
                per.setHuella(rs.getString("huella"));
                per.setGenereo(rs.getString("genero"));
                per.setNacimiento(rs.getString("Nacimiento"));
                //per.setObservaciones(rs.getString("PersonaObservaciones"));
                //per.setFechaN(rs.getDate("PersonaFN").toString());
                //System.out.println("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
                u = per;
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }

    public Clientes buscarConCedula(String cedula) {
        ResultSet rs;
        Clientes u = new Clientes();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from Clientes "
                    + "where cedula like '%" + cedula + "%' order BY Nombres LIMIT 0, 50");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Clientes per = new Clientes();
                per.setCodigo(rs.getInt("Codigo"));
                per.setCedula(rs.getString("Cedula"));
                per.setNombre(rs.getString("Nombres"));
                per.setTelefono(rs.getString("telefono"));
                per.setCelular(rs.getString("celular"));
                per.setMail(rs.getString("Mail"));
                per.setDireccion(rs.getString("Direccion"));
                per.setProvincia(rs.getString("Provinvia"));
                per.setCiudad(rs.getString("Ciudad"));
                per.setNacionalidad(rs.getString("Nacionalidad"));
                per.setPagoPredeterminado(rs.getInt("PagoPredeterminado"));
                per.setTipoCliente(rs.getInt("TipoCliente"));
                per.setVendedorPredeterminado(rs.getInt("VendedorPredeterminado"));
                per.setObservaciones(rs.getString("Observaciones"));
                per.setEstadoCivil(rs.getString("estadoCivil"));
                per.setHuella(rs.getString("huella"));
                per.setGenereo(rs.getString("genero"));
                per.setNacimiento(rs.getString("Nacimiento"));
                u = per;
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConCedula()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }

    public boolean buscarClienteRegistrado(String cedula) {
        ResultSet rs;
        Clientes u = new Clientes();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from Clientes "
                    + "where cedula =" + cedula);
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                return true;
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConCedula()" + ex);
        } finally {
            this.cerrar();
        }

        return false;
    }

    public Clientes buscarConCedulaLike(String cedula) {
        ResultSet rs;
        Clientes u = new Clientes();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from Clientes "
                    + "where cedula = " + cedula + " order BY Nombres LIMIT 0, 50");
            rs = st.executeQuery();

            //this.lista= new ArrayList();
            while (rs.next()) {
                Clientes per = new Clientes();
                per.setCodigo(rs.getInt("Codigo"));
                per.setCedula(rs.getString("Cedula"));
                per.setNombre(rs.getString("Nombres"));
                per.setTelefono(rs.getString("telefono"));
                per.setCelular(rs.getString("celular"));
                per.setMail(rs.getString("Mail"));
                per.setDireccion(rs.getString("Direccion"));
                per.setProvincia(rs.getString("Provincia"));
                per.setCiudad(rs.getString("Ciudad"));
                per.setNacionalidad(rs.getString("Nacionalidad"));
                per.setPagoPredeterminado(rs.getInt("PagoPredeterminado"));
                per.setTipoCliente(rs.getInt("TipoCliente"));
                per.setVendedorPredeterminado(rs.getInt("VendedorPredeterminado"));
                per.setObservaciones(rs.getString("Observaciones"));
                per.setEstadoCivil(rs.getString("estadoCivil"));
                per.setHuella(rs.getString("huella"));
                per.setGenereo(rs.getString("genero"));
                per.setNacimiento(rs.getString("Nacimiento"));
                u = per;
            }
            System.out.println("Controlador.Usuarios.ClientesDao.buscarConCedulaLike()usuario: " + u.getNombre());
        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConCedula()" + ex);
        } finally {   
            this.cerrar();

        }

        return u;
    }

    public ArrayList<Clientes> BuscarClietneslikokokok(String nombre) {
        ArrayList<Clientes> c = new ArrayList<>();
        ResultSet rs;
        Clientes u = new Clientes();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from Clientes "
                    + "where NOMBRES like '%" + nombre + "%' order BY Nombres LIMIT 0, 50");
            rs = st.executeQuery();
            System.out.println("enta por cada txt movidasssxxxxxxxxxxxxxxsss");
            //this.lista= new ArrayList();
            while (rs.next()) {
                Clientes per = new Clientes();
                per.setCodigo(rs.getInt("Codigo"));
                per.setCedula(rs.getString("Cedula"));
                per.setNombre(rs.getString("Nombres"));
                per.setTelefono(rs.getString("telefono"));
                per.setCelular(rs.getString("celular"));
                per.setMail(rs.getString("Mail"));
                per.setDireccion(rs.getString("Direccion"));
                per.setProvincia(rs.getString("Provincia"));
                per.setCiudad(rs.getString("Ciudad"));
                per.setNacionalidad(rs.getString("Nacionalidad"));
                per.setPagoPredeterminado(rs.getInt("PagoPredeterminado"));
                per.setTipoCliente(rs.getInt("TipoCliente"));
                per.setVendedorPredeterminado(rs.getInt("VendedorPredeterminado"));
                per.setObservaciones(rs.getString("Observaciones"));
                per.setEstadoCivil(rs.getString("estadoCivil"));
                per.setHuella(rs.getString("huella"));
                per.setGenereo(rs.getString("genero"));
                per.setNacimiento(rs.getString("Nacimiento"));

                u = per;
                c.add(per);
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConCedula()sss" + ex);
        } finally {
            this.cerrar();
//             if(){
//            u.setCodigo(-100);
//            }

        }

        return c;
    }
public ArrayList<Clientes> buscarAllCLientes() {
        ArrayList<Clientes> c = new ArrayList<>();
        ResultSet rs;
        Clientes u = new Clientes();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from Clientes");
            rs = st.executeQuery();
            System.out.println("enta por cada txt movidassssss");
            //this.lista= new ArrayList();
            while (rs.next()) {
                Clientes per = new Clientes();
                per.setCodigo(rs.getInt("Codigo"));
                per.setCedula(rs.getString("Cedula"));
                per.setNombre(rs.getString("Nombres"));
                per.setTelefono(rs.getString("telefono"));
                per.setCelular(rs.getString("celular"));
                per.setMail(rs.getString("Mail"));
                per.setDireccion(rs.getString("Direccion"));
                per.setProvincia(rs.getString("Provincia"));
                per.setCiudad(rs.getString("Ciudad"));
                per.setNacionalidad(rs.getString("Nacionalidad"));
                per.setPagoPredeterminado(rs.getInt("PagoPredeterminado"));
                per.setTipoCliente(rs.getInt("TipoCliente"));
                per.setVendedorPredeterminado(rs.getInt("VendedorPredeterminado"));
                per.setObservaciones(rs.getString("Observaciones"));
                per.setEstadoCivil(rs.getString("estadoCivil"));
                per.setHuella(rs.getString("huella"));
                per.setGenereo(rs.getString("genero"));
                per.setNacimiento(rs.getString("Nacimiento"));

                u = per;
                c.add(per);
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConCedula()sss" + ex);
        } finally {
            this.cerrar();
//             if(){
//            u.setCodigo(-100);
//            }

        }

        return c;
    }
    public void eliminar(Clientes persona) throws Exception {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("DELETE from Clientes "
                    + "WHERE Codigo=?");
            st.setDouble(1, persona.getCodigo());
            st.executeUpdate();
        } catch (SQLException e) {
            msg.setProgressBar_mensajae("Error..!! " + e);
        } finally {
            this.cerrar();
        }

    }

    public DefaultTableModel Buscar_table(String columna, String value) {
        DefaultTableModel modelo = null;
        String[] titulos
                = {"Codigo", "Cedula", "Nombres",
                    "Usuario", "Telefono",
                    "E-Mail", "Direccion", "Provincia", "Ciudad"};
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
            st = this.getCnx().prepareCall("select * from Clientes where " + columna + "  like '%" + value + "%' order BY Nombres LIMIT 0, 50");

            //  st = this.getCnx().prepareCall("Select * from " + tabla + " where " + columna + " like '%" + value + "%'");
            System.out.println("Controlador.CUsuarios.Buscar_table()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {

                registros[0] = String.valueOf(rs.getInt("Codigo"));
                registros[1] = String.valueOf(rs.getDouble("Cedula"));
                registros[2] = rs.getString("Nombres");
                registros[3] = rs.getString("Celular");
                registros[4] = rs.getString("telefono");
                registros[5] = rs.getString("Mail");
                registros[6] = rs.getString("Direccion");
                registros[7] = rs.getString("Provincia");
                registros[8] = rs.getString("Ciudad");
                modelo.addRow(registros);
                System.out.println("Controlador.CUsuarios.Buscar_table()" + registros[1]);

                //per.setObservaciones(rs.getString("PersonaObservaciones"));
                //per.setFechaN(rs.getDate("PersonaFN").toString());
                //System.out.println("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "wehhhh");
        } finally {
            this.cerrar();
        }

        return modelo;
    }

    public DefaultTableModel Buscar_table_only_Activos(String sql) {
        DefaultTableModel modelo = null;

        String[] titulos
                = {"Codigo", "Cedula", "Nombres",
                    "Celular", "Telefono",
                    "E-Mail", "Direccion", "Provincia", "Ciudad","Eliminar","SELECCIONAR"};
        Object[] registros = new Object[11];
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
            System.out.println("Controlador.CUsuarios.Buscar_table_Only()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            JButton btn1 =new JButton("ELIMINAR");
            while (rs.next()) {

                registros[0] = String.valueOf(rs.getInt("Codigo"));
                registros[1] = String.valueOf(rs.getDouble("Cedula"));
                registros[2] = rs.getString("Nombres");
                registros[3] = rs.getString("Celular");
                registros[4] = rs.getString("telefono");
                registros[5] = rs.getString("Mail");
                registros[6] = rs.getString("Direccion");
                registros[7] = rs.getString("Provincia");
                registros[8] = rs.getString("Ciudad");
                 registros[9]= btn1;
                modelo.addRow(registros);
                System.out.println("Controlador.CUsuarios.Buscar_table_only()" + registros[1]);

            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "rrrrrrrrrrrrrraqqq");
        } finally {
            this.cerrar();
        }

        return modelo;
    }
}
