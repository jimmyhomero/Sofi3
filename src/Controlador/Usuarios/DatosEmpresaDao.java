/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.DatosEmpresa;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import static javax.management.Query.gt;

/**
 *
 * @author USUARIO
 */
public class DatosEmpresaDao extends Coneccion {

    public boolean guardarImagen(String ruta, String nombre) {
        String insert = "insert into DatosEMpresa (ruc,nombre,telefono,celular,mail,direccion,slogan"
                + ",cedula2,nombre2,direccion2,telefono2,observacion,imagen,obligado,contador,ruccontador) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        FileInputStream fis = null;
        PreparedStatement ps = null;
        this.conectar();
        try {
            //conexion.setAutoCommit(false);
            File file = new File(ruta);
            fis = new FileInputStream(file);
            ps = this.con.prepareStatement(insert);
            ps.setString(1, "ruc");
            ps.setString(2, "nombre");
            ps.setString(3, "telefono");
            ps.setString(4, "celular");
            ps.setString(5, "mail");
            ps.setString(6, "direccion");
            ps.setString(7, "slogan");
            ps.setString(8, "cedula2");
            ps.setString(9, "nombre2");
            ps.setString(10, "direccion2");
            ps.setString(11, "telefono2");
            ps.setString(12, "observacion");
            ps.setBinaryStream(13, fis, (int) file.length());
            ps.setString(14, "obligado");
            ps.setString(15, "contador");
            ps.setString(16, "ruccontador");

            ps.executeUpdate();
            // conexion.commit();
            return true;
        } catch (Exception ex) {
            //          Logger.getLogger(BaseDatos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                ps.close();
                fis.close();
                this.cerrar();
            } catch (Exception ex) {

                System.out.println("Controlador.Usuarios.DatosEmpresaDao.guardarImagen()" + ex);
            }
        }
        return false;
    }

    public boolean ActualizarDatosEMpresa(DatosEmpresa de, File img) {

        String insert = "update  DatosEMpresa set "
                + "ruc= ?,"
                + "nombre= ?,"
                + "telefono= ?,"
                + "celular= ?,"
                + "mail= ?,"
                + "direccion= ?,"
                + "slogan= ?,"
                + "cedula2= ?,"
                + "nombre2= ?,"
                + "direccion2= ?,"
                + "telefono2= ?,"
                + "observacion= ?,"
                + "imagen= ?, "
                + "obligado= ?, "
                + "contador= ?, "
                + "ruccontador= ? "
                + "where codigo = ?";
        FileInputStream fis = null;
        PreparedStatement ps = null;
        this.conectar();
        // byte[] image = null;
        try {
////            //conexion.setAutoCommit(false);
////            ps = this.con.prepareStatement(insert);
////            if (!ruta.isEmpty()) {
////                File file = new File(ruta);
////                fis = new FileInputStream(file);
////                ps.setBinaryStream(14, fis, (int) file.length());
////            }
            ps = this.con.prepareStatement(insert);
            try {
                Image a;
                fis = new FileInputStream(img);
                ps.setBinaryStream(13, fis, (int) img.length());
            } catch (FileNotFoundException ex) {
                System.out.println("Controlador.Usuarios.DatosEmpresaDao.ActualizarDatosEMpresa()cccsss: " + ex);
                Logger.getLogger(ProductosDao.class.getName()).log(Level.SEVERE, null, ex);
            }

            ps.setString(1, de.getRuc());
            ps.setString(2, de.getNombre());
            ps.setString(3, de.getTelefono());
            ps.setString(4, de.getCelular());
            ps.setString(5, de.getMail());
            ps.setString(6, de.getDireccion());
            ps.setString(7, de.getSlogan());
            ps.setString(8, de.getCedula2());
            ps.setString(9, de.getNombre2());
            ps.setString(10, de.getDireccion2());
            ps.setString(11, de.getTelefono2());
            ps.setString(12, de.getObservacion());
            ps.setString(14, de.getObligado());
            ps.setString(15, de.getContador());
            ps.setString(16, de.getRuc_contador());
            ps.setInt(17, de.getCodigo());

            ps.executeUpdate();
            // conexion.commit();
            return true;
        } catch (Exception ex) {
            System.err.println("error al guardar daatos empresadd :" + ps.toString());
            System.err.println("error al guardar daatos empresa :" + ex);
            //          Logger.getLogger(BaseDatos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                this.cerrar();
                ps.close();
                fis.close();

            } catch (Exception ex) {

                System.out.println("Controlador.Usuarios.DatosEmpresaDao.guardarImagen()" + ex);
            }
        }
        return false;
    }

    public boolean ActualizarDatosEMpresaSinImagen(DatosEmpresa de) {

        String insert = "update  DatosEMpresa set "
                + "ruc= ?,"
                + "nombre= ?,"
                + "telefono= ?,"
                + "celular= ?,"
                + "mail= ?,"
                + "direccion= ?,"
                + "slogan= ?,"
                + "cedula2= ?,"
                + "nombre2= ?,"
                + "direccion2= ?,"
                + "telefono2= ?,"
                + "observacion= ?,"                
                + "obligado= ?, "
                + "contador= ?, "
                + "ruccontador= ? "
                + "where codigo = ?";
        
        PreparedStatement ps = null;
        this.conectar();
        // byte[] image = null;
        try {
            ps = this.con.prepareStatement(insert);
            
            ps.setString(1, de.getRuc());
            ps.setString(2, de.getNombre());
            ps.setString(3, de.getTelefono());
            ps.setString(4, de.getCelular());
            ps.setString(5, de.getMail());
            ps.setString(6, de.getDireccion());
            ps.setString(7, de.getSlogan());
            ps.setString(8, de.getCedula2());
            ps.setString(9, de.getNombre2());
            ps.setString(10, de.getDireccion2());
            ps.setString(11, de.getTelefono2());
            ps.setString(12, de.getObservacion());
            ps.setString(13, de.getObligado());
            ps.setString(14, de.getContador());
            ps.setString(15, de.getRuc_contador());
            ps.setInt(16, de.getCodigo());

            ps.executeUpdate();
            
            return true;
        } catch (Exception ex) {
            System.err.println("error al guardar daatos empresadd :" + ps.toString());
            System.err.println("error al guardar daatos empresa :" + ex);
            //          Logger.getLogger(BaseDatos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                this.cerrar();
                ps.close();            
            } catch (Exception ex) {

                System.out.println("Controlador.Usuarios.DatosEmpresaDao.guardarImagen()" + ex);
            }
        }
        return false;
    }
    
    public ArrayList< DatosEmpresa> getImagenes() {
        ArrayList< DatosEmpresa> lista = new ArrayList();
        PreparedStatement st = null;
        this.conectar();
        try {
            st = this.con.prepareCall("SELECT * FROM DatosEMpresa");

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DatosEmpresa obj = new DatosEmpresa();
                Blob blob = rs.getBlob("imagen");
                String nombre = rs.getObject("nombre").toString();
                byte[] data = blob.getBytes(1, (int) blob.length());
                BufferedImage img = null;
                try {
                    img = ImageIO.read(new ByteArrayInputStream(data));
                } catch (IOException ex) {
                    System.out.println("Controlador.Usuarios.DatosEmpresaDao.getImagenes() error al leer imagen BDD" + ex);
                    //Logger.getLogger(BaseDatos.class.getName()).log(Level.SEVERE, null, ex);
                }

                obj.setRuc("ruc");
                obj.setNombre(nombre);
                obj.setTelefono("telefono");
                obj.setCelular("celular");
                obj.setMail("mail");
                obj.setDireccion("direccion");
                obj.setSlogan("slogan");
                obj.setCedula2("cedula2");
                obj.setNombre("nombre2");
                obj.setTelefono("telefono2");
                obj.setDireccion2("direccion2");
                obj.setObservacion("observacion");
                obj.setImagen(img);
                obj.setObligado(rs.getString("obligado"));
                obj.setContador(rs.getString("contador"));
                obj.setRuc_contador(rs.getString("ruccontador"));

                lista.add(obj);
            }
            rs.close();
        } catch (SQLException ex) {

            System.out.println("Controlador.Usuarios.DatosEmpresaDao.getImagenes()" + ex);
            //Logger.getLogger(BaseDatos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.cerrar();
        }
        return lista;
    }

    public DatosEmpresa getEepresaNUmero1() {
        DatosEmpresa objDE = new DatosEmpresa();
        PreparedStatement st = null;
        this.conectar();
        try {
            st = this.con.prepareCall("SELECT * FROM DatosEMpresa");

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DatosEmpresa obj = new DatosEmpresa();
                Blob blob = rs.getBlob("imagen");
                //POR ALGO COMENTE SI NO FUNCIONA DESCOMENTAR
                //String nombre = rs.getObject("nombre").toString();

                byte[] data = blob.getBytes(1, (int) blob.length());
                BufferedImage img = null;
                try {
                    img = ImageIO.read(new ByteArrayInputStream(data));
                } catch (IOException ex) {
                    System.out.println("Controlador.Usuarios.DatosEmpresaDao.getImagenes() error al leer imagen BDD" + ex);
                    //Logger.getLogger(BaseDatos.class.getName()).log(Level.SEVERE, null, ex);
                }
                obj.setCodigo(rs.getInt("codigo"));
                obj.setRuc(rs.getString("ruc"));
                //obj.setNombre(nombre);
                obj.setNombre(rs.getString("nombre"));
                obj.setTelefono(rs.getString("telefono"));
                obj.setCelular(rs.getString("celular"));
                obj.setMail(rs.getString("mail"));
                obj.setDireccion(rs.getString("direccion"));
                obj.setSlogan(rs.getString("slogan"));
                obj.setCedula2(rs.getString("cedula2"));
                obj.setNombre2(rs.getString("nombre2"));
                obj.setTelefono2(rs.getString("telefono2"));
                obj.setDireccion2(rs.getString("direccion2"));
                obj.setObservacion(rs.getString("observacion"));
                obj.setImagen(img);
                obj.setObligado(rs.getString("obligado"));
                obj.setContador(rs.getString("contador"));
                obj.setRuc_contador(rs.getString("ruccontador"));
                objDE = obj;
            }
            rs.close();
        } catch (SQLException ex) {

            System.out.println("Controlador.Usuarios.DatosEmpresaDao.getImagenes()" + ex);
            //Logger.getLogger(BaseDatos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.cerrar();
        }
        return objDE;
    }

    public DatosEmpresa getEepresa(String nombreEM) {
        DatosEmpresa objDE = new DatosEmpresa();
        PreparedStatement st = null;
        this.conectar();
        try {
            st = this.con.prepareCall("SELECT * FROM DatosEMpresa where nombre= " + nombreEM);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DatosEmpresa obj = new DatosEmpresa();

                if (rs.getBlob("imagen") != null) {
                    Blob blob = rs.getBlob("imagen");

                    byte[] data = blob.getBytes(1, (int) blob.length());
                    BufferedImage img = null;
                    try {
                        img = ImageIO.read(new ByteArrayInputStream(data));
                    } catch (IOException ex) {
                        Logger.getLogger(ProductosDao.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    obj.setImagen(img);
                }

//                Blob blob = rs.getBlob("imagen");
//                
//                byte[] data = blob.getBytes(1, (int) blob.length());
//                BufferedImage img = null;
//                try {
//                    img = ImageIO.read(new ByteArrayInputStream(data));
//                } catch (IOException ex) {
//                    System.out.println("Controlador.Usuarios.DatosEmpresaDao.getImagenes() error al leer imagen BDD" + ex);
//                    //Logger.getLogger(BaseDatos.class.getName()).log(Level.SEVERE, null, ex);
//                }
                String nombre = rs.getObject("nombre").toString();
                obj.setCodigo(rs.getInt("codigo"));
                obj.setRuc(rs.getString("ruc"));
                obj.setNombre(nombre);
                obj.setTelefono(rs.getString("telefono"));
                obj.setCelular(rs.getString("celular"));
                obj.setMail(rs.getString("mail"));
                obj.setDireccion(rs.getString("direccion"));
                obj.setSlogan(rs.getString("slogan"));
                obj.setCedula2(rs.getString("cedula2"));
                obj.setNombre2(rs.getString("nombre2"));
                obj.setTelefono2(rs.getString("telefono2"));
                obj.setDireccion2(rs.getString("direccion2"));
                obj.setObservacion(rs.getString("observacion"));
                //obj.setImagen(img);
                obj.setObligado(rs.getString("obligado"));
                obj.setContador(rs.getString("contador"));
                obj.setRuc_contador(rs.getString("ruccontador"));

                objDE = obj;
            }
            rs.close();
        } catch (SQLException ex) {

            System.out.println("Controlador.Usuarios.DatosEmpresaDao.getImagenes()" + ex);
            //Logger.getLogger(BaseDatos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.cerrar();
        }
        return objDE;
    }
}
