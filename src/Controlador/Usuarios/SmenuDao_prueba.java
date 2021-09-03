/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Usuarios;

import Controlador.Coneccion;
import Modelo.smenu;
import Vista.Interfaces.dao;
import java.io.IOException;
import java.lang.reflect.Field;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.FileSystemNotFoundException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import ClasesAuxiliares.debug.Deb;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Stream;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author USUARIO
 */
public class SmenuDao_prueba<T> extends Coneccion implements dao<smenu> {

    private T t;

    public T get() {
        return t;
    }

    public void set(T t) {
        this.t = t;
    }
    private ArrayList<String> listanombres = new ArrayList();
    private ArrayList<String> listatipos = new ArrayList();
    private String tabla;
    private HashMap<String, String> campos = new HashMap<String, String>();

    public void listarnodos(T a) throws NoSuchFieldException {
        tabla = a.getClass().getName();

        Field ax[] = a.getClass().getDeclaredFields();
        //  a.getClass().getDeclaredField("as").getType();
        String nombreCampo = "";
        String tipoCampo = "";

        for (Field field : ax) {
            nombreCampo = field.getName();
            tipoCampo = a.getClass().getDeclaredField(nombreCampo).getType().toString();// a.getClass().getField(nombreCampo).getType().getTypeName();
            listanombres.add(nombreCampo);
            listatipos.add(tipoCampo);
            campos.put(nombreCampo, tipoCampo);
            Deb.consola("   <<:>>>  " + field.getName() + "########: " + tipoCampo);
        }
    }

    public void insertInto(Object a) {
        try {
            try {
                
                for (Class<?> listanombre : getClassesForPackage("Modelo")) {
                    
                    Deb.consola("Clases: "+listanombre.getSimpleName());
                
                }
            } catch (IOException ex) {
                Logger.getLogger(SmenuDao_prueba.class.getName()).log(Level.SEVERE, null, ex);
            } catch (URISyntaxException ex) {
                Logger.getLogger(SmenuDao_prueba.class.getName()).log(Level.SEVERE, null, ex);
            }
            listarnodos((T) a);
            try {
                this.conectar();

                tabla = a.getClass().getName();

                Field ax[] = a.getClass().getDeclaredFields();
                //  a.getClass().getDeclaredField("as").getType();
                String nombreCampo = "";
                String tipoCampo = "";
                PreparedStatement consulta;
                String sql, aql1, sql2, sql3 = null, sql4;
                //"INSERT INTO " + tabla + "values (null,?,?,?)"
                sql2 = "INSERT INTO " + tabla + "values (null" + "FG" + ")";
                for (Field field : ax) {
                    nombreCampo = field.getName();
                    tipoCampo = a.getClass().getDeclaredField(nombreCampo).getType().toString();// a.getClass().getField(nombreCampo).getType().getTypeName();        
                    Deb.consola("   <<:>>>  " + field.getName() + "########: " + tipoCampo);

                    sql3 = sql3.concat(",?");
                }
                sql2 = sql2.replace("FG", sql3);
                Deb.consola("sdasdas" +sql2 );
                /*
                
                 */
                consulta = this.con.prepareStatement(sql2, PreparedStatement.RETURN_GENERATED_KEYS);
                Integer i = 1;

//            
//            consulta.setString(1, a.getClass().getClass().getField(campo.toString()));
//            consulta.setString(2, tarea.getDescripcion());
//            consulta.setInt(3, tarea.getEstado());
//            long d = tarea.getFechaApertura().getTime();
//            java.sql.Date fecha = new java.sql.Date(d);
//            consulta.setDate(4, fecha);
//            consulta.setDouble(5, tarea.getSaldoInicial());
//            consulta.setDouble(6, tarea.getTotalCierre());
//            consulta.executeUpdate();
            } catch (Exception ex) {
                //   msg.setProgressBar_mensajae("Error..!! " + ex);

            } finally {
                this.cerrar();
            }
        } catch (NoSuchFieldException ex) {
            Logger.getLogger(SmenuDao_prueba.class.getName()).log(Level.SEVERE, null, ex);
            //   msg.setProgressBar_mensajae("Error..!! " + ex);

        }
    }
public static List<Class<?>> getClassesForPackage(final String pkgName) throws IOException, URISyntaxException {
    final String pkgPath = pkgName.replace('.', '/');
    final URI pkg = Objects.requireNonNull(ClassLoader.getSystemClassLoader().getResource(pkgPath)).toURI();
    final ArrayList<Class<?>> allClasses = new ArrayList<Class<?>>();

    Path root;
    if (pkg.toString().startsWith("jar:")) {
        try {
            root = FileSystems.getFileSystem(pkg).getPath(pkgPath);
        } catch (final FileSystemNotFoundException e) {
            root = FileSystems.newFileSystem(pkg, Collections.emptyMap()).getPath(pkgPath);
        }
    } else {
        root = Paths.get(pkg);
    }

    final String extension = ".class";
    try (final Stream<Path> allPaths = Files.walk(root)) {
        allPaths.filter(Files::isRegularFile).forEach(file -> {
            try {
                final String path = file.toString().replace('\\', '.');
                final String name = path.substring(path.indexOf(pkgName), path.length() - extension.length());
           //     Deb.consola("Controlador.Usuarios.SmenuDao_prueba.getClassesForPackage()bbbbbbbbbbb::::  "+ Class.forName(name).getSimpleName());
               allClasses.add(Class.forName(name));
            } catch (final ClassNotFoundException | StringIndexOutOfBoundsException ignored) {
            }
        });
    }
    return allClasses;
}



    @Override
    public List listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Integer guardar(smenu a) {
        
        return 1;
    }

    @Override
    public DefaultTableModel listarDefacultTableModel() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public smenu BuscarById(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void Modificar(smenu obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void Eliminar(smenu obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
