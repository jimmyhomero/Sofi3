/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Sat;

import ClasesAuxiliares.debug.Deb;
import Controlador.Usuarios.*;
import Controlador.Coneccion;
import Modelo.Clientes;
import Modelo.SatAparato;
import Modelo.Usuarios;
import Vista.Principal;
import Vlidaciones.ProgressBar;
import java.awt.Font;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;

/**
 *
 * @author USUARIO
 */
public class SatAparatoDao extends Coneccion {
ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    private List<SatAparato> lista = new ArrayList<SatAparato>();
    private final String tabla = "SatAparato";
    //private Conec mysql = new conexion(); //Instanciando la clase conexion
    //private Connection cn = mysql.conectar();

    public Integer  guardar(SatAparato tarea) {
        Integer codigo=null;
        try {
            this.conectar();
            PreparedStatement consulta;
            consulta = this.con.prepareStatement("INSERT INTO SatAparato (descripcion,parte,categoria,marca,modelo,observaciones,satorden_codigo) VALUES (?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            Deb.consola("Controlador.satAparato.guardar()" + consulta);
            consulta.setString(1, tarea.getDescripcion()); 
            consulta.setString(2, tarea.getParte());
            consulta.setString(3, tarea.getCategria());
            consulta.setString(4, tarea.getMarca());
            consulta.setString(5, tarea.getModelo());            
            consulta.setString(6, tarea.getObservaciones());
            consulta.setInt(7, tarea.getSatOrden_codigo());
            Deb.consola("Controlador.satAparato.guardar()" + consulta);
            Deb.consola("Controlador.Sat.SatAparatoDao.guardar():  "+consulta);
                   consulta.executeUpdate();
            ResultSet rs = consulta.getGeneratedKeys();
            if (rs.next()) {
                codigo = rs.getInt(1);
                
            }
        } catch (SQLException ex) {
            
            Deb.consola("Controlador.Sat.SatAparatoDao.guardar():  "+ex);
            msg.setProgressBar_mensajae(ex.toString());
            Deb.consola("Controlador.satAparato.guardar() : " + ex);
        } finally {
            this.cerrar();
        }
    return codigo;
    }
    

//    public void modificar(Clientes persona)  {
//        try {
//            this.conectar();
//            PreparedStatement st = this.con.prepareStatement("UPDATE Clientes SET "
//                    + "Cedula = ?, "
//                    + "Nombres = ?, "
//                    + "Telefono = ?, "
//                    + "Celular= ?, "
//                    + "Mail= ?, "
//                    + "Direccion = ?, "
//                    + "Provincia = ?, "
//                    + "Ciudad = ?, "
//                    + "Nacionalidad = ?, "  
//                    + "PagoPredeterminado = ?, " 
//                    + "TipoCliente = ?, "
//                    + "VendedorPredeterminado = ?, " 
//                    + "Observaciones = ? " 
//                    + "WHERE Codigo=?");
//            st.setString(1, persona.getCedula().toUpperCase());
//            st.setString(2, persona.getNombre().toUpperCase());
//            st.setString(3, persona.getTelefono());
//            st.setString(4, persona.getCelular());
//            st.setString(5, persona.getMail().toLowerCase());
//            st.setString(6, persona.getDireccion().toUpperCase());
//            st.setString(7, persona.getProvincia().toUpperCase());
//            st.setString(8, persona.getCiudad().toUpperCase());
//            st.setString(9, persona.getNacionalidad().toUpperCase());
//            st.setInt(10, 1);
//            st.setInt(11, 1);
//            st.setInt(12, 1);
//            st.setString(13, "obsercvaciones");
//            st.setInt(14, persona.getCodigo());
//             String sql = st.toString();
//            Deb.consola("Controlador.Usuarios.CUsuarios.modificar()"+ sql);
//            st.executeUpdate();
//            Principal.jProgressBar2.setString("eeeeeeeeeeeee");
//            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
//        } catch (SQLException e) {
//            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error" + e + sql, "Error al modificar Registro" + e.toString()));
//Deb.consola("Controlador.CUsuarios.guardar()" + e);
//        } finally {
//            this.cerrar();
//        }
//
//    }

    public List<SatAparato> listar() {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from SatAparato  order BY fechaIngreso" );
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                SatAparato per = new SatAparato();
                per.setCodigo(rs.getInt("Codigo"));
                per.setDescripcion(rs.getString("descripcion"));
                per.setParte(rs.getString("parte"));
                per.setCategria(rs.getString("categoria"));
                per.setMarca(rs.getString("marca"));
                per.setModelo(rs.getString("modelo"));
                per.setFechaIngreso(rs.getDate("fechaIngreso"));
                per.setSatOrden_codigo(rs.getInt("satorden_codigo"));
                per.setObservaciones(rs.getString("observaciones"));                
                this.lista.add(per);
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }

    public SatAparato  buscarAparatoConID(Integer id) {
        ResultSet rs;
                SatAparato u = new SatAparato();
        try {
            this.conectar();
            PreparedStatement st;
//            select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo
//            select usuarios.*, tipos_usuarios.codigo,tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo where usuarios.codigo = 1
//SELECT * , a.codigo AS cod_aparato FROM sataparato a INNER JOIN satseries s  ON a.codigo=s.satAparato_codigo INNER JOIN satD WHERE a.codigo=1
//SELECT * , a.codigo AS cod_aparato FROM satorden so INNER JOIN satDetalle sd  ON so.codigo=sd.SatOrden_Codigo INNER JOIN sataparato a  ON sd.sarorden_codigo = a.satorden_codigo WHERE a.codigo=1
        
            st = this.getCnx().prepareCall("SELECT  * , a.codigo AS cod_aparato FROM sataparato a INNER JOIN satseries s  ON a.codigo=s.satAparato_codigo WHERE a.codigo="+id);
            //select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo

            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                SatAparato per = new SatAparato();
                per.setCodigo(rs.getInt("cod_aparato"));
                per.setDescripcion(rs.getString("descripcion"));                
                per.setParte(rs.getString("parte"));
                per.setCategria(rs.getString("categoria"));
                per.setMarca(rs.getString("marca"));
                per.setModelo(rs.getString("modelo"));                
                per.setFechaIngreso(rs.getDate("fechaIngreso"));
                per.setSatOrden_codigo(rs.getInt("satorden_codigo"));                                
                per.setObservaciones(rs.getString("observaciones"));                
                ///series
                per.setCodigo(rs.getInt("Codigo"));
                per.setCompra_sec(rs.getString("compra_sec"));
                per.setVenta_sec(rs.getString("venta_sec"));
                per.setDescripcion(rs.getString("descripcion"));
                per.setDisponible(rs.getInt("disponible"));
                per.setFecha_compra(rs.getDate("fecha_compra"));
                per.setFecha_venta(rs.getDate("fecha_venta"));
                per.setSatAparato_codigo(rs.getInt("satAparato_codigo"));
                per.setSerie(rs.getString("serie"));                
                
                u = per;
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }

    public SatAparato  buscarAparatoSerie(String serie) {
        ResultSet rs;
                SatAparato u = new SatAparato();
        try {
            this.conectar();
            PreparedStatement st;
//            select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo
//            select usuarios.*, tipos_usuarios.codigo,tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo where usuarios.codigo = 1
//SELECT * , a.codigo AS cod_aparato FROM sataparato a INNER JOIN satseries s  ON a.codigo=s.satAparato_codigo INNER JOIN satD WHERE a.codigo=1
//SELECT * , a.codigo AS cod_aparato FROM satorden so INNER JOIN satDetalle sd  ON so.codigo=sd.SatOrden_Codigo INNER JOIN sataparato a  ON sd.sarorden_codigo = a.satorden_codigo WHERE a.codigo=1
        
            st = this.getCnx().prepareCall("SELECT  * , a.codigo AS cod_aparato FROM sataparato a INNER JOIN satseries s  ON a.codigo=s.satAparato_codigo WHERE s.serie='"+serie+"'");
            //select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo
Deb.consola("Controlador.Sat.SatAparatoDao.buscarAparatoSerie()ssss: "+st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                SatAparato per = new SatAparato();
                per.setCodigo(rs.getInt("cod_aparato"));
                per.setDescripcion(rs.getString("descripcion"));                
                per.setParte(rs.getString("parte"));
                per.setCategria(rs.getString("categoria"));
                per.setMarca(rs.getString("marca"));
                per.setModelo(rs.getString("modelo"));                
                per.setFechaIngreso(rs.getDate("fechaIngreso"));
                per.setSatOrden_codigo(rs.getInt("satorden_codigo"));                                
                per.setObservaciones(rs.getString("observaciones"));                
                ///series
                per.setCodigo(rs.getInt("Codigo"));
                per.setCompra_sec(rs.getString("compra_sec"));
                per.setVenta_sec(rs.getString("venta_sec"));
                per.setDescripcion(rs.getString("descripcion"));
                per.setDisponible(rs.getInt("disponible"));
                per.setFecha_compra(rs.getDate("fecha_compra"));
                per.setFecha_venta(rs.getDate("fecha_venta"));
                per.setSatAparato_codigo(rs.getInt("satAparato_codigo"));
                per.setSerie(rs.getString("serie"));                
                
                u = per;
            }

        } catch (Exception ex) {
            Deb.consola("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }

    
     public  ArrayList<SatAparato> buscarAparatoLikeDescripcion(String nombre) {
         ArrayList<SatAparato> c= new ArrayList<>();
        ResultSet rs;
        SatAparato u = new SatAparato();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from SatAparato "
              + "where descripcion like '%"+nombre+ "%' order BY descripcion LIMIT 0, 50");
            rs = st.executeQuery();
            
            //this.lista= new ArrayList();
            while (rs.next()) {
                SatAparato per = new SatAparato();
                per.setCodigo(rs.getInt("Codigo"));
                per.setDescripcion(rs.getString("descripcion"));                
                per.setParte(rs.getString("parte"));
                per.setCategria(rs.getString("categoria"));
                per.setMarca(rs.getString("marca"));
                per.setModelo(rs.getString("modelo"));                
                per.setFechaIngreso(rs.getDate("fechaIngreso"));
                per.setSatOrden_codigo(rs.getInt("satorden_codigo"));                                
                per.setObservaciones(rs.getString("observaciones"));                
                u = per;
                c.add(per);
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
     
     public  ArrayList<SatAparato> buscarAparatoLikeSerie(String nombre) {
         ArrayList<SatAparato> c= new ArrayList<>();
        ResultSet rs;
        SatAparato u = new SatAparato();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from SatAparato "
              + "where serie like '%"+nombre+ "%' order BY descripcion LIMIT 0, 50");
            rs = st.executeQuery();
            
            //this.lista= new ArrayList();
            while (rs.next()) {
                SatAparato per = new SatAparato();
                per.setCodigo(rs.getInt("Codigo"));
                per.setDescripcion(rs.getString("descripcion"));                
                per.setParte(rs.getString("parte"));
                per.setCategria(rs.getString("categoria"));
                per.setMarca(rs.getString("marca"));
                per.setModelo(rs.getString("modelo"));                
                per.setFechaIngreso(rs.getDate("fechaIngreso"));
                per.setSatOrden_codigo(rs.getInt("satorden_codigo"));                                
                per.setObservaciones(rs.getString("observaciones"));                
                u = per;
                c.add(per);
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
          public  ArrayList<SatAparato> buscarAparatoPorIDCliente(String codigo) {
         ArrayList<SatAparato> c= new ArrayList<>();
        ResultSet rs;
        SatAparato u = new SatAparato();
        try {
            this.conectar();
            PreparedStatement st;
            String sql1="SELECT " +
"     sataparato.`codigo` AS sataparato_codiogo," +
"     sataparato.`descripcion` AS sataparato_descripcion," +
"     sataparato.`parte` AS sataparato_parte," +
"     sataparato.`observaciones` AS sataparato_observaciones,"+
"     sataparato.`categoria` AS sataparato_categoria," +
"     sataparato.`marca` AS sataparato_marca," +
"     sataparato.`modelo` AS sataparato_modelo," +
"     sataparato.`fechaIngreso` AS sataparato_fechaIngreso," +
"     satorden.`numero` AS satorden_numero," +
"     satorden.`fecha_ingreso` AS satorden_fecha_ingreso," +
"     satorden.`codigo` AS satorden_codigo,"+
"     satseries.`serie` AS satseries_serie," +
"     satseries.`disponible` AS satseries_disponible," +
"     clientes.`Nombres` AS clientes_Nombres" +
"     FROM " +
"    `satorden` satorden INNER JOIN `CLIENTES` clientes ON clientes.codigo= satorden.clientes_codigo  INNER JOIN `satordendetalle` satordendetalle ON satorden.`codigo` = satordendetalle.`SatOrden_Codigo`\n" +
"     INNER JOIN `sataparato` sataparato ON satordendetalle.`SatAparato_codigo` = sataparato.`codigo`\n" +
"     INNER JOIN `satseries` satseries ON sataparato.`codigo` = satseries.`satAparato_codigo`"+
"     where clientes.codigo=" +codigo;
            String sql=sql1;
            System.err.println("sql: "+sql);
            st = this.getCnx().prepareCall(sql);
            rs = st.executeQuery();                        
            while (rs.next()) {
                SatAparato per = new SatAparato();
                per.setCodigo(rs.getInt("sataparato_codiogo"));
                per.setDescripcion(rs.getString("sataparato_descripcion"));
                per.setObservaciones(rs.getString("sataparato_observaciones"));              
                per.setParte(rs.getString("sataparato_parte"));
                per.setCategria(rs.getString("sataparato_categoria"));
                per.setMarca(rs.getString("sataparato_marca"));
                per.setModelo(rs.getString("sataparato_modelo"));              
                per.setFechaIngreso(rs.getDate("satorden_fecha_ingreso"));
                per.setSatOrden_codigo(rs.getInt("satorden_codigo"));                         
                per.setSerie(rs.getString("satseries_serie"));   
               
                u = per;
                c.add(per);
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
    public void eliminar(SatAparato persona) throws Exception {
        try {             
            this.conectar();
            PreparedStatement st =this.con.prepareStatement("DELETE from SatAparato "
				+ "WHERE Codigo=?");			            
            st.setDouble(1,persona.getCodigo());
            st.executeUpdate();
        } catch (SQLException e) {
      msg.setProgressBar_mensajae("Error..!! "+ e);            
        } finally {
            this.cerrar();
        }
        
    }   

    
    public DefaultTableModel Buscar_table(String columna, String value) {
        DefaultTableModel modelo = null;
  String[] titulos
                = {"CODIGO", "CLIENTE","APARATO", "MARCA","MODELO", "SERIE",};
        String[] registros = new String[6];
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
            st = this.getCnx().prepareCall("select * from SatAparato where "+columna+"  like '%"+value+ "%' order BY descripcion" );

          //  st = this.getCnx().prepareCall("Select * from " + tabla + " where " + columna + " like '%" + value + "%'");
            Deb.consola("Controlador.CUsuarios.Buscar_table()" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {

                registros[0]=String.valueOf(rs.getInt("Codigo"));
                registros[1]=rs.getString("descripcion");                
                registros[2]=rs.getString("parte");
                registros[3]=rs.getString("categoria");
                registros[4]=rs.getString("marca");
                registros[5]=rs.getString("modelo");
                registros[6]=String.valueOf(rs.getDate("fechacompra"));                
                registros[7]=String.valueOf(rs.getInt("satorden_codigo"));                
                registros[8]=rs.getString("observaciones");
                modelo.addRow(registros);
                Deb.consola("Controlador.CUsuarios.Buscar_table()" + registros[1]);

                //per.setObservaciones(rs.getString("PersonaObservaciones"));
                //per.setFechaN(rs.getDate("PersonaFN").toString());
                //Deb.consola("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex+"wehhhh");
        } finally {
            this.cerrar();
        }

        return modelo;
    }
    
}
