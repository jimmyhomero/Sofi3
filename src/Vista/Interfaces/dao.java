/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista.Interfaces;

import java.util.List;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author USUARIO
 */
public interface dao <T>{

    public Integer guardar(T obj);
    public List<T> listar();
    public DefaultTableModel listarDefacultTableModel();
    public T BuscarById(Integer id);
    public void Modificar(T obj);
    public void Eliminar(T obj);
    
    
    
}
