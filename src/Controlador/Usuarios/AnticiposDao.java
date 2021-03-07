/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.Anticipos;
import Modelo.Usuarios;
import Vista.Principal;
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
public class AnticiposDao extends Coneccion {

    ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    private List<Anticipos> lista = new ArrayList<Anticipos>();
    private final String tabla = "Anticipos";
    //private Conec mysql = new conexion(); //Instanciando la clase conexion
    //private Connection cn = mysql.conectar();

    private Anticipos getAnticipos(ResultSet rs) {
        Anticipos per = new Anticipos();
        try {
            per.setCodigo(rs.getInt("Codigo"));
            per.setClientes_codigo(rs.getInt("clientes_codigo"));
            per.setDescripcion(rs.getString("descripcion"));
            per.setTotal(rs.getDouble("total"));
            per.setFecha(rs.getDate("Fecha"));
            per.setUsado(rs.getDouble("usado"));
            per.setSaldo(rs.getDouble("saldo"));
            per.setTipo_movimeinto(rs.getString("tipo_movimeinto"));
            per.setDocumento(rs.getString("documento"));
            per.setSecuencia(rs.getString("secuencia"));
            per.setMotivo(rs.getString("motivo"));
            per.setDocumeto_codigo(rs.getInt("documeto_codigo"));
        } catch (SQLException ex) {
            Deb.consola(ex.toString());
            Logger.getLogger(AnticiposDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return per;
    }

    public void Auto_CompletarAnticipos(JTextField j) {

        TextAutoCompleter textAutoAcompleter = new TextAutoCompleter(j);//Le pasan el nombre del campo de texto.

        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from Anticipos "
                    + "where secuencia like '%" + j.getText() + "%' order BY fecha LIMIT 0, 50");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Anticipos per = new Anticipos();
                per = getAnticipos(rs);
                this.lista.add(per);
                textAutoAcompleter.addItem(per);
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

    }

    private int setpreparedstatemen(PreparedStatement consulta, Anticipos tarea) {
        int codigoThisFactura = 0;
        try {

            consulta.setString(1, tarea.getDescripcion());
            consulta.setDouble(2, tarea.getTotal());
            consulta.setDouble(3, tarea.getUsado());
            consulta.setDouble(4, tarea.getSaldo());
            consulta.setInt(5, tarea.getClientes_codigo());
            consulta.setString(6, tarea.getTipo_movimeinto());
            consulta.setString(7, tarea.getDocumento());
            consulta.setString(8, tarea.getSecuencia());
            consulta.setString(9, tarea.getMotivo());
            consulta.setInt(10, tarea.getDocumeto_codigo());
            Deb.consola("Controlador.CUsuarios.guardar()" + consulta);
            consulta.executeUpdate();
            ResultSet rs = consulta.getGeneratedKeys();
            if (rs.next()) {
                codigoThisFactura = rs.getInt(1);
                Deb.consola("Controlador.Usuarios.FacturasDao.guardar()>: " + codigoThisFactura);
            }
        } catch (SQLException ex) {
            Deb.consola("Cdasdsdf" + ex);
            Logger.getLogger(AnticiposDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

        }
        return codigoThisFactura;
    }

    public Integer guardar(Anticipos tarea) {
        int codigoThisFactura = 0;
        PreparedStatement consulta;
        try {
            this.conectar();
            consulta = this.con.prepareStatement("INSERT INTO `anticipos`(`descripcion`,`total`,`usado`,`saldo`,`clientes_codigo`,`tipo_movimeinto`,`documento`,`secuencia`,`motivo`,`documeto_codigo`) VALUES ( ?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            codigoThisFactura = setpreparedstatemen(consulta, tarea);
        } catch (SQLException ex) {
            Logger.getLogger(AnticiposDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.cerrar();
        }

        return codigoThisFactura;
    }

    public void modificar(Anticipos persona) {

        try {
            PreparedStatement consulta = this.con.prepareStatement("UPDATE Anticipos SET "
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
            setpreparedstatemen(consulta, persona);
        } catch (SQLException ex) {
            Logger.getLogger(AnticiposDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<Anticipos> listarAnticiposOprovedores() {
        ResultSet rs;
        try {
            String sql = null;
            this.conectar();
            PreparedStatement st;
            sql = "select * from Anticipos  order BY fecha LIMIT 0, 50";

            st = this.getCnx().prepareCall(sql);
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                this.lista.add(getAnticipos(rs));
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }

    public Anticipos buscarConID(Integer id) {
        ResultSet rs;
        Anticipos u = new Anticipos();
        try {

            this.conectar();
            PreparedStatement st;
            String sql = null;
            sql = "select * from Anticipos where codigo= " + id;
            st = this.getCnx().prepareCall(sql);
            //select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo

            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                u = getAnticipos(rs);
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }

//    public DefaultTableModel Buscar_table(String columna, String value, Integer val) {
//        DefaultTableModel modelo = null;
//        String[] titulos
//                = {"Codigo", "Cedula", "Nombres",
//                    "Usuario", "Telefono",
//                    "E-Mail", "Direccion", "Provincia", "Ciudad"};
//        String[] registros = new String[9];
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
//            String sql = null;
//            if (val == 1) {
//                ///provedores
//                sql = "select * from Anticipos where " + columna + "  like '%" + value + "%' and proveedor =1 order BY Nombres LIMIT 0, 50";
//            } else if (val == 0) {
//                ///clientes
//                sql = "select * from Anticipos where " + columna + "  like '%" + value + "%' order BY Nombres LIMIT 0, 50";
//            }
//            st = this.getCnx().prepareCall(sql);
//
//            //  st = this.getCnx().prepareCall("Select * from " + tabla + " where " + columna + " like '%" + value + "%'");
//            Deb.consola("Controlador.CUsuarios.Buscar_table()" + st.toString());
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//
//                registros[0] = String.valueOf(rs.getInt("Codigo"));
//                registros[1] = String.valueOf(rs.getDouble("Cedula"));
//                registros[2] = rs.getString("Nombres");
//                registros[3] = rs.getString("Celular");
//                registros[4] = rs.getString("telefono");
//                registros[5] = rs.getString("Mail");
//                registros[6] = rs.getString("Direccion");
//                registros[7] = rs.getString("Provincia");
//                registros[8] = rs.getString("Ciudad");
//                modelo.addRow(registros);
//                Deb.consola("Controlador.CUsuarios.Buscar_table()" + registros[1]);
//
//                //per.setObservaciones(rs.getString("PersonaObservaciones"));
//                //per.setFechaN(rs.getDate("PersonaFN").toString());
//                //Deb.consola("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
//            }
//
//        } catch (Exception ex) {
//            JOptionPane.showMessageDialog(null, ex + "wehhhh");
//        } finally {
//            this.cerrar();
//        }
//
//        return modelo;
//    }
//
//    public DefaultTableModel Buscar_table_only_Activos(Integer val) {
//        DefaultTableModel modelo = null;
//
//        String[] titulos
//                = {"Codigo", "Cedula", "Nombres",
//                    "Celular", "Telefono",
//                    "E-Mail", "Direccion", "Provincia", "Ciudad", "Eliminar", "SELECCIONAR"};
//        Object[] registros = new Object[11];
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
//            String sql = null;
//            if (val == 1) {
//                ///provedores
//                sql = "select * from clientes where proveedor=1 order by nombres";
//            } else if (val == 0) {
//                ///clientes
//                sql = "select * from clientes order by nombres";
//            }
//            st = this.getCnx().prepareCall(sql);
//            Deb.consola("Controlador.CUsuarios.Buscar_table_Only()" + st.toString());
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            JButton btn1 = new JButton("ELIMINAR");
//            while (rs.next()) {
//
//                registros[0] = String.valueOf(rs.getInt("Codigo"));
//                registros[1] = String.valueOf(rs.getDouble("Cedula"));
//                registros[2] = rs.getString("Nombres");
//                registros[3] = rs.getString("Celular");
//                registros[4] = rs.getString("telefono");
//                registros[5] = rs.getString("Mail");
//                registros[6] = rs.getString("Direccion");
//                registros[7] = rs.getString("Provincia");
//                registros[8] = rs.getString("Ciudad");
//                registros[9] = btn1;
//                modelo.addRow(registros);
//                Deb.consola("Controlador.CUsuarios.Buscar_table_only()" + registros[1]);
//
//            }
//
//        } catch (Exception ex) {
//            JOptionPane.showMessageDialog(null, ex + "rrrrrrrrrrrrrraqqq");
//        } finally {
//            this.cerrar();
//        }
//
//        return modelo;
//    }
}
