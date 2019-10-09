/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares;

import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 *
 * @author USUARIO
 */
public class NullValidator {
 
    public static Object validarCampos(Object pObjeto) {
        Object objeto = pObjeto;
        Method metodos[] = pObjeto.getClass().getMethods();
        for (int i = 0; i < metodos.length; i++) {
            Method metodo = metodos[i];
            //Si es un metodo get o is lo utilizo con su equivalente set
            if ((metodo.getName().substring(0, 3).equalsIgnoreCase("get") || metodo.getName().substring(0, 2).equalsIgnoreCase("is")) && !metodo.getName().equals("getClass")) {
                String methodNameSet = "";
                if(metodo.getName().substring(0, 3).equalsIgnoreCase("get")){
                    methodNameSet = metodo.getName().replaceFirst("get", "set");
                }else{
                    methodNameSet = methodNameSet.replaceFirst("is", "set");
                }
                try {
                    Method metodoSet = pObjeto.getClass().getMethod(methodNameSet, metodo.getReturnType());
                    if (metodoSet != null) {
                        //Datos numericos
                        //Si es byte
                        if (metodo.getReturnType().equals(java.lang.Byte.class)) {
                            Byte valor = (Byte)metodo.invoke(pObjeto, new Object[0]);
                            if(valor==null){
                                metodoSet.invoke(pObjeto, 0);
                            }
                        }
                        //Si es bigDecimal
                        if (metodo.getReturnType().equals(java.math.BigDecimal.class)) {
                            BigDecimal valor = (BigDecimal)metodo.invoke(pObjeto, new Object[0]);
                            if(valor==null){
                                metodoSet.invoke(pObjeto, new BigDecimal(0));
                            }
                        }
                        // Si es Double
                        if (metodo.getReturnType().equals(java.lang.Double.class)) {
                            Double valor = (Double)metodo.invoke(pObjeto, new Object[0]);
                            if(valor==null){
                                metodoSet.invoke(pObjeto, new Double(0));
                            }
                        }
                        //Si es un string
                        if (metodo.getReturnType().equals(java.lang.String.class)) {
                            String valor = (String)metodo.invoke(pObjeto, new Object[0]);
                            if(valor==null){
                                metodoSet.invoke(pObjeto, "");
                            }
                        }
                        //Si es una lista
                        if (metodo.getReturnType().equals(java.util.List.class)) {
                            List objetosList = (List)metodo.invoke(pObjeto, new Object[0]);
                            for(Object objetoFromList:objetosList){
                                NullValidator.validarCampos(objetoFromList);
                            }
                        }
                        //Si es date
                        if (metodo.getReturnType().equals(java.util.Date.class)) {
                            Date valor = (Date)metodo.invoke(pObjeto, new Object[0]);
                            if(valor==null){
                                metodoSet.invoke(pObjeto, new Date());
                            }
                        }
                        //Si es primitivo
                        if (metodo.getReturnType().isPrimitive()) {
                            //los primitivos no permiten null
                        }
                    }
                } catch (Exception e) {
                }
            }
        }
        return objeto;
    }
 
}