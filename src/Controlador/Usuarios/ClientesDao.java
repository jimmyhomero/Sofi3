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
import ClasesAuxiliares.debug.Deb;
import Vlidaciones.ProgressBar;
import com.mxrck.autocompleter.TextAutoCompleter;
import java.awt.Font;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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

    private Clientes getCliente(ResultSet rs) {
        Clientes per = new Clientes();
        try {
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
            per.setProveedor(rs.getInt("proveedor"));
        } catch (SQLException ex) {
            Logger.getLogger(ClientesDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return per;
    }

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
            Deb.consola("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

    }

    private int setpreparedstatemen(PreparedStatement consulta, Clientes tarea) {
        int codigoThisFactura = 0;
        try {
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
            consulta.setInt(18, tarea.getProveedor());
            Deb.consola("Controlador.CUsuarios.guardar()" + consulta);
            consulta.executeUpdate();
            ResultSet rs = consulta.getGeneratedKeys();
            if (rs.next()) {
                codigoThisFactura = rs.getInt(1);
                Deb.consola("Controlador.Usuarios.FacturasDao.guardar()>: " + codigoThisFactura);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClientesDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return codigoThisFactura;
    }

    public Integer guardar(Clientes tarea) {
        int codigoThisFactura = 0;
        try {
            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (Cedula, nombres, telefono, celular, mail, direccion, Provincia, Ciudad,Nacionalidad,PagoPredeterminado,TipoCliente,VendedorPredeterminado,Observaciones,estadoCivil,huella,genero,Nacimiento,proveedor) VALUES(?,?,?,?,?,?,?,?,?,?,?, ?, ?,?, ?, ?,?,?)", Statement.RETURN_GENERATED_KEYS);

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
            consulta.setInt(18, tarea.getProveedor());
            Deb.consola("Controlador.CUsuarios.guardar()" + consulta);
            consulta.executeUpdate();
            ResultSet rs = consulta.getGeneratedKeys();
            if (rs.next()) {
                codigoThisFactura = rs.getInt(1);
                Deb.consola("Controlador.Usuarios.FacturasDao.guardar()>: " + codigoThisFactura);
            }
        } catch (SQLException ex) {
            msg.setProgressBar_mensajae(ex.toString());
            Deb.consola("Controlador.CUsuarios.guardar()" + ex);
        } finally {
            this.cerrar();
        }
        return codigoThisFactura;
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
            Deb.consola("Controlador.Usuarios.CUsuarios.modificar()" + sql);
            st.executeUpdate();
//            Principal.jProgressBar2.setString("eeeeeeeeeeeee");
            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
        } catch (SQLException e) {
            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error" + e + sql, "Error al modificar Registro" + e.toString()));
            Deb.consola("Controlador.CUsuarios.guardar()" + e);
        } finally {
            this.cerrar();
        }
    }

    public List<Clientes> listarClientesOprovedores(Integer val) {
        ResultSet rs;
        try {
            String sql = null;
            this.conectar();
            PreparedStatement st;

            if (val == 1) {
                sql = "select * from Clientes  order BY Nombres LIMIT 0, 50";
            } else if (val == 0) {
                sql = "select * from Clientes where proveedor=1  order BY Nombres LIMIT 0, 50";
            }
            st = this.getCnx().prepareCall(sql);
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                this.lista.add(getCliente(rs));
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }

    public Clientes buscarConID(Integer id, Integer val) {
        ResultSet rs;
        Clientes u = new Clientes();
        try {

            this.conectar();
            PreparedStatement st;
            String sql = null;
            if (val == 1) {
                ///provedores
                sql = "select * from Clientes where codigo= " + id + " order BY Nombres LIMIT 0, 50";
            } else if (val == 0) {
                ///clientes
                sql = "select * from Clientes where codigo= " + id + " order BY Nombres LIMIT 0, 50";
            }
//            select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo
//            select usuarios.*, tipos_usuarios.codigo,tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo where usuarios.codigo = 1

            st = this.getCnx().prepareCall(sql);
            //select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo

            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                u = getCliente(rs);
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }
        return u;
    }
        public Clientes buscarConID(Integer id) {
        ResultSet rs;
        Clientes u = new Clientes();
        try {

            this.conectar();
            PreparedStatement st;
            String sql = null;
            sql = "select * from Clientes where codigo= " + id + " order BY Nombres LIMIT 0, 50";
//            select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo
//            select usuarios.*, tipos_usuarios.codigo,tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo where usuarios.codigo = 1

            st = this.getCnx().prepareCall(sql);
            //select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo

            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                u = getCliente(rs);
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }

        public Clientes buscarConCedula(String cedula, Integer val) {
        ResultSet rs;
        Clientes u = new Clientes();
        u.setCedula("XX");
        u.setNombre("XX");
        
        try {
            this.conectar();
            PreparedStatement st;
            String sql = null;
            if (val == 1) {
                ///provedores
                sql = "select * from Clientes " + "where cedula like '%" + cedula + "%' and proveedor=1 order BY Nombres LIMIT 0, 50";
            } else if (val == 0) {
                ///clientes
                sql = "select * from Clientes " + "where cedula like '%" + cedula + "%' order BY Nombres LIMIT 0, 50";
            }

            st = this.getCnx().prepareCall(sql);
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                u = getCliente(rs);

            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConCedula()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }
    public Clientes buscarConCedulaRUC(String cedula, Integer val) {
        ResultSet rs;
        Clientes u = new Clientes();
        u.setCedula("XX");
        u.setNombre("XX");
        
        try {
            this.conectar();
            PreparedStatement st;
            String sql = null;
            if (val == 1) {
                ///provedores
                sql = "select * from Clientes " + "where cedula = " + cedula + " and proveedor=1 order BY Nombres LIMIT 0, 50";
            } else if (val == 0) {
                ///clientes
                sql = "select * from Clientes " + "where cedula = " + cedula + " order BY Nombres LIMIT 0, 50";
            }

            st = this.getCnx().prepareCall(sql);
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                u = getCliente(rs);

            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConCedula()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }

    public boolean buscarClienteRegistrado(String cedula, Integer val) {
        ResultSet rs;
        Clientes u = new Clientes();
        try {
            this.conectar();
            PreparedStatement st;
            String sql = null;
            if (val == 1) {
                ///provedores
                sql = "select * from Clientes " + "where proveedor=1 and cedula =" + cedula;
            } else if (val == 0) {
                ///clientes
                sql = "select * from Clientes " + "where cedula =" + cedula;
            }

            st = this.getCnx().prepareCall(sql);
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                return true;
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConCedula()" + ex);
        } finally {
            this.cerrar();
        }

        return false;
    }

    public Clientes buscarConCedulaLike(String cedula, Integer val) {
        ResultSet rs;
        Clientes u = new Clientes();
        u = null;
        try {
            this.conectar();
            PreparedStatement st;

            String sql = null;
            if (val == 1) {
                ///provedores
                sql = "select * from Clientes where cedula = " + cedula + " and proveedor=1 order BY Nombres LIMIT 0, 50";
            } else if (val == 0) {
                ///clientes
                sql = "select * from Clientes where cedula = " + cedula + " order BY Nombres LIMIT 0, 50";
            }
            Deb.consola("Controlador.Usuarios.ClientesDao.buscarConCedulaLike()sda_ ;" + sql);
            st = this.getCnx().prepareCall(sql);
            rs = st.executeQuery();

            //this.lista= new ArrayList();
            while (rs.next()) {
                u = getCliente(rs);
            }

            //
        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConCedula()" + ex);
        } finally {
            this.cerrar();

        }

        return u;
    }

    public ArrayList<Clientes> BuscarClietneslikokokok(String nombre, Integer val) {
        ArrayList<Clientes> c = new ArrayList<>();
        ResultSet rs;
        Clientes u = new Clientes();
        try {
            this.conectar();
            PreparedStatement st;
            String sql = null;
            if (val == 1) {
                ///provedores
                sql = "select * from Clientes " + "where NOMBRES like '%" + nombre + "%' and proveedor =1 order BY Nombres LIMIT 0, 50";
            } else if (val == 0) {
                ///clientes
                sql = "select * from Clientes " + "where NOMBRES like '%" + nombre + "%' order BY Nombres LIMIT 0, 50";
            }

            st = this.getCnx().prepareCall(sql);
            rs = st.executeQuery();
            Deb.consola("enta por cada txt movidasssxxxxxxxxxxxxxxsss");
            //this.lista= new ArrayList();
            while (rs.next()) {
                c.add(getCliente(rs));
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConCedula()sss" + ex);
        } finally {
            this.cerrar();
//             if(){
//            u.setCodigo(-100);
//            }

        }

        return c;
    }

    public ArrayList<Clientes> buscarAllCLientes(Integer val) {
        ArrayList<Clientes> c = new ArrayList<>();
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            String sql = null;
            if (val == 1) {
                ///provedores
                sql = "select * from Clientes where proveedor =1 ";
            } else if (val == 0) {
                ///clientes
                sql = "select * from Clientes";
            }
            st = this.getCnx().prepareCall(sql);
            rs = st.executeQuery();
            Deb.consola("enta por cada txt movidassssss");
            //this.lista= new ArrayList();
            while (rs.next()) {
                c.add(getCliente(rs));
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConCedula()sss" + ex);
        } finally {
            this.cerrar();
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

    public DefaultTableModel Buscar_table(String columna, String value, Integer val) {
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
            String sql = null;
            if (val == 1) {
                ///provedores
                sql = "select * from Clientes where " + columna + "  like '%" + value + "%' and proveedor =1 order BY Nombres LIMIT 0, 50";
            } else if (val == 0) {
                ///clientes
                sql = "select * from Clientes where " + columna + "  like '%" + value + "%' order BY Nombres LIMIT 0, 50";
            }
            st = this.getCnx().prepareCall(sql);

            //  st = this.getCnx().prepareCall("Select * from " + tabla + " where " + columna + " like '%" + value + "%'");
            Deb.consola("Controlador.CUsuarios.Buscar_table()" + st.toString());
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
                Deb.consola("Controlador.CUsuarios.Buscar_table()" + registros[1]);

                //per.setObservaciones(rs.getString("PersonaObservaciones"));
                //per.setFechaN(rs.getDate("PersonaFN").toString());
                //Deb.consola("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "wehhhh");
        } finally {
            this.cerrar();
        }

        return modelo;
    }

    public DefaultTableModel Buscar_table_only_Activos(Integer val) {
        DefaultTableModel modelo = null;

        String[] titulos
                = {"Codigo", "Cedula", "Nombres",
                    "Celular", "Telefono",
                    "E-Mail", "Direccion", "Provincia", "Ciudad", "Eliminar", "SELECCIONAR"};
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
            String sql = null;
            if (val == 1) {
                ///provedores
                sql = "select * from clientes where proveedor=1 order by nombres";
            } else if (val == 0) {
                ///clientes
                sql = "select * from clientes order by nombres";
            }
            st = this.getCnx().prepareCall(sql);
            Deb.consola("Controlador.CUsuarios.Buscar_table_Only()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            JButton btn1 = new JButton("ELIMINAR");
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
                registros[9] = btn1;
                modelo.addRow(registros);
                Deb.consola("Controlador.CUsuarios.Buscar_table_only()" + registros[1]);

            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex + "rrrrrrrrrrrrrraqqq");
        } finally {
            this.cerrar();
        }

        return modelo;
    }
}
