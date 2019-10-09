/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vlidaciones;

import Controlador.Usuarios.ClientesDao;
import Controlador.Usuarios.UsuariosDao;
import javax.swing.JOptionPane;
import javax.swing.text.html.parser.DTDConstants;

/**
 *
 * @author USUARIO
 */
public class ValidaCedula {

    boolean existeUsuario = false;
    boolean cedulaCorrecta = false;
    UsuariosDao obj = new UsuariosDao();
    
    

    public boolean isCedula(String cedula) {
        String ruc = "";

        try {

            if (cedula.length() == 10 || (cedula.length() == 13)) // ConstantesApp.LongitudCedula
            {
                if (!(cedula.length() == 10)) {

                    if (cedula.substring(10, 13).equals("001")) {
                        cedula = cedula.substring(0, 10);
                    }

                }
                if (obj.buscarConCedula(cedula) != null) {
                    existeUsuario = true;
                }
                int tercerDigito = Integer.parseInt(cedula.substring(2, 3));
                if (tercerDigito < 6) {
// Coeficientes de validaciÃ³n cÃ©dula
// El decimo digito se lo considera dÃ­gito verificador
                    int[] coefValCedula = {2, 1, 2, 1, 2, 1, 2, 1, 2};
                    int verificador = Integer.parseInt(cedula.substring(9, 10));
                    int suma = 0;
                    int digito = 0;
                    for (int i = 0; i < (cedula.length() - 1); i++) {
                        digito = Integer.parseInt(cedula.substring(i, i + 1)) * coefValCedula[i];
                        suma += ((digito % 10) + (digito / 10));
                    }

                    if ((suma % 10 == 0) && (suma % 10 == verificador)) {
                        cedulaCorrecta = true;
                    } else if ((10 - (suma % 10)) == verificador) {
                        cedulaCorrecta = true;
                    } else {
                        cedulaCorrecta = false;
                    }
                } else {
                    cedulaCorrecta = false;
                }
            } else {
                // cedulaCorrecta = false;
            }
        } catch (NumberFormatException nfe) {
            cedulaCorrecta = false;
        } catch (Exception err) {
            JOptionPane.showMessageDialog(null, "Error en proceso de validaciÃ³n");
            //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error en proceso de validaciÃ³n", "Error en proceso de validaciÃ³n"));                        
            cedulaCorrecta = false;
        }

        if (!cedulaCorrecta) {
            JOptionPane.showMessageDialog(null, "Cedula o Ruc Incorrectos");
            // FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "CÃ©dula o RUC es Incorrecta" ,"CÃ©dula o RUC es Incorrecta"));                        
        } else {
            if (this.existeUsuario) {
                this.existeUsuario = false;
                JOptionPane.showMessageDialog(null, "UsuarioRegistrado");
                //  FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Usuario ya existe en la Base de Datos", "Usuario ya existe en la Base de Datos"));                            

            } else {
//                    if(accion.equals("Registrar"))
//                    {
//                        if(!(persona.getCedula().equals("")||persona.getNombre().equals("")|| persona.getTelefono().equals("")) )
//                        {
//                        this.registrar();                                                
//                        this.limpiar();
//                        }else
//                        {
//                        FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Debe Llenar Los campos Cedula, Nombre,TelÃ©fono", "Usuario ya existe en la Base de Datos"));                                                          
//                        
//                        }
//                    }
//                    else if(accion.equals("ValidarRUC"))
//                    {
//                    FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "CÃ©dula o RUC es Correcta" ,"CÃ©dula o RUC es Correcta"));                                  
//                    }            

            }
        }
        return cedulaCorrecta;
    }

    public static boolean validaRUC(String campo) {
        String numero = campo;
        Integer suma = 0;
        Integer residuo = 0;
        boolean pri = false;
        boolean pub = false;
        boolean nat = false;
        Integer numeroProvincias = 22;
        Integer modulo = 11;       
        /* Aqui almacenamos los digitos de la cedula en variables. */
        String d1 = numero.substring(0, 1);
        String d2 = numero.substring(1, 2);
        String d3 = numero.substring(2, 3);
        String d4 = numero.substring(3, 4);
        String d5 = numero.substring(4, 5);
        String d6 = numero.substring(5, 6);
        String d7 = numero.substring(6, 7);
        String d8 = numero.substring(7, 8);
        String d9 = numero.substring(8, 9);
        String d10 = numero.substring(9, 10);
        Integer p1 = null;
        Integer p2 = null;
        Integer p3 = null;
        Integer p4 = null;
        Integer p5 = null;
        Integer p6 = null;
        Integer p7 = null;
        Integer p8 = null;
        Integer p9 = null;
        
        /* El tercer digito es: */
 /* 9 para sociedades privadas y extranjeros */
 /* 6 para sociedades publicas */
 /* menor que 6 (0,1,2,3,4,5) para personas naturales */
        if (d3.equals("7") || d3.equals("8")) {
System.err.println("El tercer dígito ingresado es inválido");
            return false;
        }

        /* Solo para personas naturales (modulo 10) */
        if (Integer.valueOf(d3) < 6) {
            nat = true;
            p1 = Integer.valueOf(d1) * 2;
            if (p1 >= 10) {
                p1 -= 9;
            }
            p2 = Integer.valueOf(d2) * 1;
            if (p2 >= 10) {
                p2 -= 9;
            }
            p3 = Integer.valueOf(d3) * 2;
            if (p3 >= 10) {
                p3 -= 9;
            }
            p4 = Integer.valueOf(d4) * 1;
            if (p4 >= 10) {
                p4 -= 9;
            }
            p5 = Integer.valueOf(d5) * 2;
            if (p5 >= 10) {
                p5 -= 9;
            }
            p6 = Integer.valueOf(d6) * 1;
            if (p6 >= 10) {
                p6 -= 9;
            }
            p7 = Integer.valueOf(d7) * 2;
            if (p7 >= 10) {
                p7 -= 9;
            }
            p8 = Integer.valueOf(d8) * 1;
            if (p8 >= 10) {
                p8 -= 9;
            }
            p9 = Integer.valueOf(d9) * 2;
            if (p9 >= 10) {
                p9 -= 9;
            }
            modulo = 10;
            /* Solo para sociedades publicas (modulo 11) */ /* Aqui el digito verficador esta en la posicion 9, en las otras 2 en la pos. 10 */
        } else if (Integer.valueOf(d3) == 6) {
            pub = true;
            p1 = Integer.valueOf(d1) * 3;
            p2 = Integer.valueOf(d2) * 2;
            p3 = Integer.valueOf(d3) * 7;
            p4 = Integer.valueOf(d4) * 6;
            p5 = Integer.valueOf(d5) * 5;
            p6 = Integer.valueOf(d6) * 4;
            p7 = Integer.valueOf(d7) * 3;
            p8 = Integer.valueOf(d8) * 2;
            p9 = 0;
            /* Solo para entidades privadas (modulo 11) */
        } else if (Integer.valueOf(d3) == 9) {
            pri = true;
            p1 = Integer.valueOf(d1) * 4;
            p2 = Integer.valueOf(d2) * 3;
            p3 = Integer.valueOf(d3) * 2;
            p4 = Integer.valueOf(d4) * 7;
            p5 = Integer.valueOf(d5) * 6;
            p6 = Integer.valueOf(d6) * 5;
            p7 = Integer.valueOf(d7) * 4;
            p8 = Integer.valueOf(d8) * 3;
            p9 = Integer.valueOf(d9) * 2;
        }

        suma = p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8 + p9;
        residuo = suma % modulo;

        /* Si residuo=0, dig.ver.=0, caso contrario 10 - residuo*/
        Integer digitoVerificador = residuo == 0 ? 0 : modulo - residuo;

        /* ahora comparamos el elemento de la posicion 10 con el dig. ver.*/
        if (pub == true) {
            if (digitoVerificador != Integer.valueOf(d9)) {
                System.err.println("EL ruc dle sector public es incorreto");
                return false;
            }
            /* El ruc de las empresas del sector publico terminan con 0001*/
            if (!numero.substring(9, 13).equals("001")) {
                System.err.println(" El ruc de la empresa del sector público debe terminar con 0001");

                return false;
            }
        } else if (pri == true) {
            if (digitoVerificador != Integer.valueOf(d10)) {
                System.err.println("El ruc de la empresa del sector privado es incorrecto.");
                return false;
            }
            if (!numero.substring(10, 13).equals("001")) {
                System.err.println("El ruc de la empresa del sector privado debe terminar con 001");

                return false;
            }
        } else if (nat == true) {
            if (digitoVerificador != Integer.valueOf(d10)) {
                System.err.println("El número de cédula de la persona natural es incorrecto.");
                return false;
            }
            if (numero.length() > 10 && !numero.substring(10, 13).equals("001")) {
                System.err.println("El ruc de la persona natural debe terminar con 001");

                return false;
            }
        }

        return true;
    }
}
