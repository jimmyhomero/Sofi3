/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Sat;


import Controlador.Coneccion;

import Modelo.SatSeries;
import Vlidaciones.ProgressBar;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;

/**
 *
 * @author USUARIO
 */
public class SatSerieDao extends Coneccion {
ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    private ArrayList<SatSeries>  lista = new ArrayList<SatSeries>();
    private final String tabla = "SatSeries";
    //private Conec mysql = new conexion(); //Instanciando la clase conexion
    //private Connection cn = mysql.conectar();

    public void guardar(SatSeries tarea) {
        try {
            this.conectar();
            PreparedStatement consulta;
            consulta = this.con.prepareStatement("INSERT INTO SatSeries (serie,disponible,satAparato_codigo,compra_sec,venta_sec,Descripcion,fecha_compra,fecha_venta,color) VALUES (?,?,?,?,?,?,?,?,?)");
            System.out.println("Controlador.SatSeries.guardar()" + consulta);
            consulta.setString(1, tarea.getSerie()); 
            consulta.setInt(2, tarea.getDisponible());
            consulta.setInt(3, tarea.getSatAparato_codigo());
            consulta.setString(4, tarea.getCompra_sec());
            consulta.setString(5, tarea.getVenta_sec());            
            consulta.setString(6, tarea.getDescripcion());
            consulta.setDate(7, tarea.getFecha_compra());
            consulta.setDate(8, tarea.getFecha_venta());
            consulta.setString(9, tarea.getColor());
            System.out.println("Controlador.satAparato.guardar()" + consulta);
            System.out.println("Controlador.Sat.SatAparatoDao.guardar():  "+consulta);
            consulta.executeUpdate();
            
        } catch (SQLException ex) {
            
            System.out.println("Controlador.Sat.SatAparatoDao.guardar():  "+ex);
            msg.setProgressBar_mensajae(ex.toString());
            System.out.println("Controlador.satAparato.guardar() : " + ex);
        } finally {
            this.cerrar();
        }
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
//            System.out.println("Controlador.Usuarios.CUsuarios.modificar()"+ sql);
//            st.executeUpdate();
//            Principal.jProgressBar2.setString("eeeeeeeeeeeee");
//            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
//        } catch (SQLException e) {
//            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error" + e + sql, "Error al modificar Registro" + e.toString()));
//System.out.println("Controlador.CUsuarios.guardar()" + e);
//        } finally {
//            this.cerrar();
//        }
//
//    }

    public ArrayList<SatSeries>  listar() {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from SatSeries  order BY fecha_ingreso" );
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                SatSeries per = new SatSeries();
                per.setCodigo(rs.getInt("Codigo"));
                per.setCompra_sec(rs.getString("compra_sec"));
                per.setVenta_sec(rs.getString("venta_sec"));
                per.setDescripcion(rs.getString("descripcion"));
                per.setDisponible(rs.getInt("disponible"));
                per.setFecha_compra(rs.getDate("fecha_compra"));
                per.setFecha_venta(rs.getDate("fecha_venta"));
                per.setSatAparato_codigo(rs.getInt("satAparato_codigo"));
                per.setSerie(rs.getString("serie"));                
                per.setColor(rs.getString("color"));                
                this.lista.add(per);
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }

    public SatSeries  buscarAparatoConID(Integer id) {
        ResultSet rs;
                SatSeries u = new SatSeries();
        try {
            this.conectar();
            PreparedStatement st;
//            select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo
//            select usuarios.*, tipos_usuarios.codigo,tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo where usuarios.codigo = 1

            st = this.getCnx().prepareCall("select * from SatSeries where codigo= "+ id+" order BY fecha_ingreso");
            //select usuarios.*, tipos_usuarios.tipo from usuarios inner join tipos_usuarios on tipos_usuarios.codigo=usuarios.Tipo_Usuario_codigo

            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                SatSeries per = new SatSeries();
                per.setCodigo(rs.getInt("Codigo"));
                per.setCompra_sec(rs.getString("compra_sec"));
                per.setVenta_sec(rs.getString("venta_sec"));
                per.setDescripcion(rs.getString("descripcion"));
                per.setDisponible(rs.getInt("disponible"));
                per.setFecha_compra(rs.getDate("fecha_compra"));
                per.setFecha_venta(rs.getDate("fecha_venta"));
                per.setSatAparato_codigo(rs.getInt("satAparato_codigo"));
                per.setSerie(rs.getString("serie"));                
                per.setColor(rs.getString("color"));                
                this.lista.add(per);
                u = per;
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConId()" + ex);
        } finally {
            this.cerrar();
        }

        return u;
    }

    
//     public  ArrayList<SatAparato> buscarAparatoLikeDescripcion(String nombre) {
//         ArrayList<SatAparato> c= new ArrayList<>();
//        ResultSet rs;
//        SatAparato u = new SatAparato();
//        try {
//            this.conectar();
//            PreparedStatement st;
//            st = this.getCnx().prepareCall("select * from SatAparato "
//              + "where descripcion like '%"+nombre+ "%' order BY descripcion LIMIT 0, 50");
//            rs = st.executeQuery();
//            
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//                SatAparato per = new SatAparato();
//                per.setCodigo(rs.getInt("Codigo"));
//                per.setDescripcion(rs.getString("descripcion"));                
//                per.setParte(rs.getString("parte"));
//                per.setCategria(rs.getString("categoria"));
//                per.setMarca(rs.getString("marca"));
//                per.setModelo(rs.getString("modelo"));                
//                per.setFechaIngreso(rs.getDate("fechaIngreso"));
//                per.setSatOrden_codigo(rs.getInt("satorden_codigo"));                                
//                per.setObservaciones(rs.getString("observaciones"));                
//                u = per;
//                c.add(per);
//            }
//
//        } catch (Exception ex) {
//            System.out.println("Controlador.CUsuarios.BuscarConCedula()sss" + ex);
//        } finally {
//            this.cerrar();
////             if(){
////            u.setCodigo(-100);
////            }
//            
//            
//        }
//
//        return c;
//    }
     
     public  ArrayList<SatSeries> buscarSerieLikeSerie(String serie) {
         ArrayList<SatSeries> c= new ArrayList<>();
        ResultSet rs;
        SatSeries u = new SatSeries();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from SatSeries "
              + "where serie like '%"+serie+ "%' order BY descripcion LIMIT 0, 50");
            rs = st.executeQuery();
            
            //this.lista= new ArrayList();
            while (rs.next()) {SatSeries per = new SatSeries();
                per.setCodigo(rs.getInt("Codigo"));
                per.setCompra_sec(rs.getString("compra_sec"));
                per.setVenta_sec(rs.getString("venta_sec"));
                per.setDescripcion(rs.getString("descripcion"));
                per.setDisponible(rs.getInt("disponible"));
                per.setFecha_compra(rs.getDate("fecha_compra"));
                per.setFecha_venta(rs.getDate("fecha_venta"));
                per.setSatAparato_codigo(rs.getInt("satAparato_codigo"));
                per.setSerie(rs.getString("serie"));                
                per.setColor(rs.getString("color"));                
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
     public  SatSeries buscarSerieAparato(String serie) {
         ArrayList<SatSeries> c= new ArrayList<>();
        ResultSet rs;
        SatSeries u = new SatSeries();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("select * from SatSeries "
              + "where serie = "+serie+ "  order BY descripcion");
            rs = st.executeQuery();
            
            //this.lista= new ArrayList();
            while (rs.next()) {
                SatSeries per = new SatSeries();
                per.setCodigo(rs.getInt("Codigo"));
                per.setCompra_sec(rs.getString("compra_sec"));
                per.setVenta_sec(rs.getString("venta_sec"));
                per.setDescripcion(rs.getString("descripcion"));
                per.setDisponible(rs.getInt("disponible"));
                per.setFecha_compra(rs.getDate("fecha_compra"));
                per.setFecha_venta(rs.getDate("fecha_venta"));
                per.setSatAparato_codigo(rs.getInt("satAparato_codigo"));
                per.setSerie(rs.getString("serie"));                
                per.setColor(rs.getString("color"));                
                u=per;
            }

        } catch (Exception ex) {
            System.out.println("Controlador.CUsuarios.BuscarConCedula()sss" + ex);
        } finally {
            this.cerrar();

        }

        return u;
    }
//       public  ArrayList<SatAparato> buscarAparatoPorIDCliente(String codigo) {
//       ArrayList<SatAparato> c= new ArrayList<>();
//        ResultSet rs;
//        SatAparato u = new SatAparato();
//        try {
//            this.conectar();
//            PreparedStatement st;
//            st = this.getCnx().prepareCall("select * from SatAparato "
//              + "where clientes_codigo = "+codigo);
//            rs = st.executeQuery();
//            
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//                SatAparato per = new SatAparato();
//                per.setCodigo(rs.getInt("Codigo"));
//                per.setDescripcion(rs.getString("descripcion"));
//                per.setObservaciones(rs.getString("observaciones"));              
//                per.setParte(rs.getString("parte"));
//                per.setCategria(rs.getString("categoria"));
//                per.setMarca(rs.getString("marca"));
//                per.setModelo(rs.getString("modelo"));              
//                per.setFechaIngreso(rs.getDate("fechaIngreso"));
//                per.setSatOrden_codigo(rs.getInt("satorden_codigo"));                         
//                u = per;
//                c.add(per);
//            }
//
//        } catch (Exception ex) {
//            System.out.println("Controlador.CUsuarios.BuscarConCedula()sss" + ex);
//        } finally {
//            this.cerrar();
////             if(){
////            u.setCodigo(-100);
////            }
//            
//            
//        }
//
//        return c;
//    }
    public void eliminar(SatSeries persona) throws Exception {
        try {             
            this.conectar();
            PreparedStatement st =this.con.prepareStatement("DELETE from SatSeries "
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
            st = this.getCnx().prepareCall("select * from SatSeries where "+columna+"  like '%"+value+ "%'" );

          //  st = this.getCnx().prepareCall("Select * from " + tabla + " where " + columna + " like '%" + value + "%'");
            System.out.println("Controlador.CUsuarios.Buscar_table()" + st.toString());
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
                System.out.println("Controlador.CUsuarios.Buscar_table()" + registros[1]);

                //per.setObservaciones(rs.getString("PersonaObservaciones"));
                //per.setFechaN(rs.getDate("PersonaFN").toString());
                //System.out.println("Controlador.CUsuarios.listar()"+rs.getString("Nombres")); 
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex+"wehhhh");
        } finally {
            this.cerrar();
        }

        return modelo;
    }
    
}
