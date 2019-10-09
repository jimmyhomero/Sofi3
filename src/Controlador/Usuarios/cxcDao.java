/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.Cxc;
import Vista.Principal;
import Vlidaciones.ProgressBar;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author USUARIO
 */
public class cxcDao extends Coneccion {

    ProgressBar msg = new ProgressBar(1000, "Mensaje Inicial");
    String tabla = "cxc";
    private ArrayList<Cxc> lista = new ArrayList<Cxc>();

    public Integer guardar(Cxc tarea) {
        Integer CodigoThisInsert = null;
        try {
            this.conectar();
            PreparedStatement consulta;

            consulta = this.con.prepareStatement("INSERT INTO " + this.tabla + " (tipo,"
                    + " descripcion,fechaVencimiento,total,abono,saldo,facturas_codigo,formasPagoV_codigo,diasCredito,diasAtrazo,Clientes_codigo)"
                    + " VALUES(?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);

            consulta.setString(1, tarea.getTipo().toUpperCase());
            consulta.setString(2, tarea.getDescripcion().toUpperCase());
            long d = tarea.getFechaVencimiento().getTime();
            java.sql.Date fecha = new java.sql.Date(d);
            consulta.setDate(3, fecha);
            consulta.setString(4, tarea.getTotal());
            consulta.setString(5, tarea.getAbono());
            consulta.setString(6, tarea.getSaldo());
            consulta.setInt(7, tarea.getFacturas_codigo());
            consulta.setInt(8, tarea.getFormasPagoV_codigo());
            consulta.setString(9, tarea.getDiasCredito());
            consulta.setString(10, tarea.getDiasAtrazo());
            consulta.setInt(11, tarea.getClientes_Codigo());
            System.out.println("Controlador.Usuarios.PagosDao.guardar()consulta: " + consulta.toString());
            consulta.executeUpdate();
            ResultSet rs = consulta.getGeneratedKeys();
            if (rs.next()) {
                CodigoThisInsert = rs.getInt(1);
                //System.out.println("Controlador.Usuarios.FacturasDao.guardar()>: " + codigoThisFactura);
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex + "ssssssss");
            msg.setProgressBar_mensajae("Error..!! " + ex);

        } finally {
            this.cerrar();
        }
        return CodigoThisInsert;
    }

    public DefaultTableModel Buscar_table(String columna, String value) {
        DefaultTableModel modelo = null;

        String[] titulos
                = {"Codigo", "Marcas", "Descripcion"};
        String[] registros = new String[3];
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
                registros[1] = rs.getString("Marca");
                registros[2] = rs.getString("Descripcion");
                modelo.addRow(registros);

            }

        } catch (Exception ex) {
            msg.setProgressBar_mensajae(ex.toString());
        } finally {
            this.cerrar();
        }

        return modelo;
    }

    public DefaultTableModel getCxCnow(int num, Double parametro, Integer valor) {
        DefaultTableModel modelo = null;
        String sql = "";
        if (num == 0) {
            sql = "SELECT * , (SELECT DATE_FORMAT(NOW(),'%Y-%m-%d')) AS hoy from cxc INNER join clientes on cxc.Clientes_Codigo=Clientes.codigo INNER JOIN facturas on facturas.Codigo=cxc.facturas_codigo where cxc.visible=1 and cxc.estado='peNdiente'";
        } else if (num == 1) {
            sql = "SELECT * , (SELECT DATE_FORMAT(NOW(),'%Y-%m-%d')) AS hoy  from cxc INNER join clientes on cxc.Clientes_Codigo=Clientes.codigo INNER JOIN facturas on facturas.Codigo=cxc.facturas_codigo where fechaVencimiento= (SELECT DATE_FORMAT(NOW(),'%Y-%m-%d')) AND cxc.visible=1 and cxc.estado='peNdiente'";
        } else if (num == 2) {
            sql = "SELECT * , (SELECT DATE_FORMAT(NOW(),'%Y-%m-%d')) AS hoy from cxc INNER join clientes on cxc.Clientes_Codigo=Clientes.codigo INNER JOIN facturas on facturas.Codigo=cxc.facturas_codigo where cxc.visible=1 and cxc.estado='CANCELADO'";
        } else if (num == 3) {
            sql = "SELECT * , (SELECT DATE_FORMAT(NOW(),'%Y-%m-%d')) AS hoy from cxc INNER join clientes on cxc.Clientes_Codigo=Clientes.codigo INNER JOIN facturas on facturas.Codigo=cxc.facturas_codigo where fechaVencimiento<= (SELECT DATE_FORMAT(NOW(),'%Y-%m-%d')) AND cxc.visible=1 and cxc.estado='peNdiente'";
        } else if (num == 4) {
            sql = "SELECT * , (SELECT DATE_FORMAT(NOW(),'%Y-%m-%d')) AS hoy from cxc INNER join clientes on cxc.Clientes_Codigo=Clientes.codigo INNER JOIN facturas on facturas.Codigo=cxc.facturas_codigo where clientes.codigo=" + valor + " AND cxc.visible=1 and cxc.estado='peNdiente'";
        } else if (num == 5) {
            sql = "SELECT * , (SELECT DATE_FORMAT(NOW(),'%Y-%m-%d')) AS hoy from cxc INNER join clientes on cxc.Clientes_Codigo=Clientes.codigo INNER JOIN facturas on facturas.Codigo=cxc.facturas_codigo where cxc.total=" + parametro + " AND cxc.visible=1 and cxc.estado='peNdiente'";
        }

        String[] titulos
                = {"", " # ", "CLIENTE", "TIPO", "FECHA MOV", "FECHA COBR", "RETRASO", "MONTO", "ANTICIPO", "SALDO", "SUMANA"};
        String[] registros = new String[11];
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
            System.out.println("Controlador.CUsuarios.Buscar_table()xxxxx" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            int i = 1;
            Double saldox = 0.0;
            while (rs.next()) {
                registros[0] = rs.getString("codigo");
                registros[1] = String.valueOf(i);
                registros[2] = rs.getString("nombres");
                registros[3] = rs.getString("tipo_documento");
                registros[4] = rs.getString("fecha");
                registros[5] = rs.getString("fechavencimiento");
                Date factual = rs.getDate("hoy");
                Date fvenc = rs.getDate("fechavencimiento");
                int dias = getdiferenciaEnDiasdedosfechas(factual, fvenc);
                if (dias <= 0) {
                    registros[6] = "0";
                } else {
                    registros[6] = String.valueOf(dias);
                }

                registros[7] = rs.getString("total");
                registros[8] = rs.getString("abono");
                registros[9] = rs.getString("saldo");
                saldox = saldox + Double.parseDouble(rs.getString("saldo"));
                registros[10] = saldox.toString();

                modelo.addRow(registros);
                i++;
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
            msg.setProgressBar_mensajae("Error..!! " + ex);

        } finally {
            this.cerrar();
        }

        return modelo;
    }

    public String[] getCxcxcInfo(Integer codigo) {
        DefaultTableModel modelo = null;
        String sql = "";

        sql = "SELECT * FROM cxc INNER JOIN clientes ON cxc.Clientes_Codigo=Clientes.codigo INNER JOIN facturas ON facturas.Codigo=cxc.facturas_codigo WHERE cxc.codigo=" + codigo + " AND cxc.visible=1 AND cxc.estado='peNdiente'";

        String[] registros = new String[13];
        Cxc cc = new Cxc();
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;

            st = this.getCnx().prepareCall(sql);
            System.out.println("Controlador.CUsuarios.Buscar_table()xxxxx" + st.toString());
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            int i = 1;
            Double saldox = 0.0;
            while (rs.next()) {

                registros[0] = rs.getString("codigo");
                registros[1] = String.valueOf(i);
                registros[2] = rs.getString("nombres");
                registros[3] = rs.getString("tipo_documento");
                registros[4] = rs.getString("fecha");
                registros[5] = rs.getString("fechavencimiento");
                Date factual = rs.getDate("fecha");
                Date fvenc = rs.getDate("fechavencimiento");
                int dias = getdiferenciaEnDiasdedosfechas(fvenc, factual);
                registros[6] = String.valueOf(dias);//rs.getString("diasretraso");

                registros[7] = rs.getString("total");
                registros[8] = rs.getString("abono");
                registros[9] = rs.getString("saldo");
                saldox = saldox + Double.parseDouble(rs.getString("saldo"));
                registros[10] = saldox.toString();
                registros[11] = rs.getString("descripcion");
                registros[12] = rs.getString("secuencia");

                i++;
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
            msg.setProgressBar_mensajae("Error..!! " + ex);

        } finally {
            this.cerrar();
        }

        return registros;
    }

    public static int getdiferenciaEnDiasdedosfechas(Date fechaMayor, Date fechaMenor) {

        long diferenciaEn_ms;
        diferenciaEn_ms = fechaMayor.getTime() - fechaMenor.getTime();
        long dias = diferenciaEn_ms / (1000 * 60 * 60 * 24);
        return (int) dias;
    }

    public void modificar(Cxc c) {
        try {
            this.conectar();
//            PreparedStatement st = this.con.prepareStatement("UPDATE " + tabla + " SET "
//                    + "tipo = ?, "
//                    + "Descripcion = ? "
//                    + "total = ? "
//                    + "abono = ? "
//                    + "saldo = ? "
//                    + "facturas_codigo = ? "
//                    + "formasPagoV_codigo = ? "
//                    + "fechaVencimiento = ? "
//                    + "diasCredito = ? "
//                    + "diasAtrazo = ? "
//                    + "fecha = ? "
//                    + "clientes_codigo = ? "
//                    + "estado = ? "
//                    + "visible = ? "
//                    + "where codigo = ?");
            PreparedStatement st = this.con.prepareStatement("UPDATE " + tabla + " SET "
                    + "Descripcion = ? ,"
                    + "abono = ? ,"
                    + "saldo = ? ,"
                    + "estado = ? ,"
                    + "visible = ? "
                    + "where codigo = ?");

            st.setString(1, c.getDescripcion());

            st.setString(2, c.getAbono());
            st.setString(3, c.getSaldo());
            st.setString(4, c.getEstado());
            st.setInt(5, c.getVisible());
            st.setInt(6, c.getCodigo());
//            st.setString(1, c.getTipo());
//            st.setString(2, c.getDescripcion());
//            st.setString(3, c.getTotal());
//            st.setString(3, c.getAbono());
//            st.setString(3, c.getSaldo());
//            st.setInt(3, c.getFacturas_codigo());
//            st.setInt(3, c.getFormasPagoV_codigo());
//            st.setDate(3, (Date) c.getFechaVencimiento());
//            st.setString(3, c.getDiasCredito());
//            st.setString(3, c.getDiasAtrazo());
            //st.setString(3, c.getFechaVencimiento());

            String sql = st.toString();

            st.executeUpdate();

            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito", " Registro Actualizado"));
        } catch (SQLException e) {
            //msg.setProgressBar_mensajae(e.toString());
            System.out.println("Controlador.Usuarios.cxcDao.modificar(): errir modificar: "+e.toString());
        } finally {
            this.cerrar();
        }

    }

    public Cxc listarBuscarConCodigo(Integer cod) {
        ResultSet rs;
        Cxc per2 = new Cxc();
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla + " where codigo = " + cod + "");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Cxc per = new Cxc();
                per.setCodigo(rs.getInt("Codigo"));
                per.setTipo(rs.getString("tipo"));
                per.setDescripcion(rs.getString("Descripcion"));
                per.setFechaVencimiento(rs.getDate("fechaVencimiento"));
                per.setTotal(rs.getString("total"));
                per.setAbono(rs.getString("abono"));
                per.setSaldo(rs.getString("saldo"));
                per.setFacturas_codigo(rs.getInt("facturas_codigo"));
                per.setFormasPagoV_codigo(rs.getInt("formasPagoV_codigo"));
                per.setVisible(rs.getInt("visible"));
                per.setEstado(rs.getString("ESTADO"));
                per.setDiasCredito(rs.getString("diasCredito"));

                per2 = per;
            }

        } catch (Exception ex) {
            msg.setMensaje(ex.toString());
            //System.out.println("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return per2;
    }

    public ArrayList<Cxc> listar() {
        ResultSet rs;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall("Select * from " + tabla + "");
            rs = st.executeQuery();
            //this.lista= new ArrayList();
            while (rs.next()) {
                Cxc per = new Cxc();
                per.setCodigo(rs.getInt("Codigo"));
                per.setTipo(rs.getString("tipo"));
                per.setDescripcion(rs.getString("Descripcion"));
                per.setFechaVencimiento(rs.getDate("fechaVencimiento"));
                per.setTotal(rs.getString("total"));
                per.setAbono(rs.getString("abono"));
                per.setSaldo(rs.getString("saldo"));
                per.setFacturas_codigo(rs.getInt("facturas_codigo"));
                per.setFormasPagoV_codigo(rs.getInt("formasPagoV_codigo"));
per.setVisible(rs.getInt("visible"));
                per.setEstado(rs.getString("ESTADO"));
                per.setDiasCredito(rs.getString("diasCredito"));
                this.lista.add(per);
            }

        } catch (Exception ex) {
            msg.setMensaje(ex.toString());
            //System.out.println("Controlador.CUsuarios.listar()" + ex);
        } finally {
            this.cerrar();
        }

        return lista;
    }

//    public Marcas buscarConID(Integer id) {
//        ResultSet rs;
//        Marcas u = new Marcas();
//        try {
//            this.conectar();
//            PreparedStatement st;
//            st = this.getCnx().prepareCall("Select * from " + tabla + " where codigo = " + id);
//            rs = st.executeQuery();
//            //this.lista= new ArrayList();
//            while (rs.next()) {
//                Marcas per = new Marcas();
//                per.setCodigo(rs.getInt("Codigo"));
//                per.setMarca(rs.getString("Marca"));
//                per.setDescripcion(rs.getString("Descripcion"));
//                u = per;
//            }
//
//        } catch (Exception ex) {
//            msg.setProgressBar_mensajae(ex.toString());
//        } finally {
//            this.cerrar();
//        }
//
//        return u;
//    }
    public ResultSet listar_table(String sql) {
        //
        ResultSet rs = null;
        try {
            this.conectar();
            PreparedStatement st;
            st = this.getCnx().prepareCall(sql);
            rs = st.executeQuery();
        } catch (Exception ex) {
            msg.setProgressBar_mensajae(ex.toString());
        } finally {
            //  this.cerrar();
        }

        return rs;

    }

    public void eliminar(Integer cod) throws Exception {
        try {
            this.conectar();
            PreparedStatement st = this.con.prepareStatement("DELETE from " + tabla
                    + " WHERE Codigo=?");
            st.setInt(1, cod);
            st.executeUpdate();
        } catch (SQLException e) {
            msg.setProgressBar_mensajae("Error..!! " + e);
        } finally {
            this.cerrar();
        }

    }

}
