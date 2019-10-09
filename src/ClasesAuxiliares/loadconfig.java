/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares;

import Controlador.Usuarios.Config_EquiposDao;
import Controlador.Usuarios.FormasPagoVDao;
import Modelo.Bodegas;
import Modelo.ConfigSofia;
import Modelo.Config_Equipos;
import Modelo.Config_Usuarios;
import Modelo.FormasPagoV;
import Vista.Principal;
import static Vista.Usuarios.Configuracion.CHECFACGRANDE;
import static Vista.Usuarios.Configuracion.CHECFACROLLO;
import static Vista.Usuarios.Configuracion.CHECK_CONTROL_EFECTIVO;
import static Vista.Usuarios.Configuracion.CHECPROFGRANDE;
import static Vista.Usuarios.Configuracion.CHECPROFROLLO;
import static Vista.Usuarios.Configuracion.CHECTICGRANDE;
import static Vista.Usuarios.Configuracion.CHECTICROLLO;
import static Vista.Usuarios.Configuracion.TXT_CONTROL_EFECTIVO_CAJA_SI_NO;
import static Vista.Usuarios.Configuracion.TXT_FACTURASDEROOLO;
import static Vista.Usuarios.Configuracion.TXT_PROFORMASDEROOLO2;
import static Vista.Usuarios.Configuracion.TXT_TICKETSDEROOLO;
import static Vista.Usuarios.Configuracion.jcb_BodegaPredeterminadCOmpra;
import static Vista.Usuarios.Configuracion.jcb_BodegaPredeterminadventas;
import static Vista.Usuarios.Configuracion.jcb_formadePagoPredeterminada;
import static Vista.Usuarios.Configuracion.jcb_impfacturas;
import static Vista.Usuarios.Configuracion.jcb_imptickets;
import static Vista.Usuarios.Configuracion.txt_bodegaPredeterminadaEnCompras;
import static Vista.Usuarios.Configuracion.txt_bodegaPredeterminadaEnVENTAS;
import static Vista.Usuarios.Configuracion.txt_facturas;
import static Vista.Usuarios.Configuracion.txt_formadepagoPredeterminada;
import static Vista.Usuarios.Configuracion.txt_tickets;
import java.util.ArrayList;
import login.login;

/**
 *
 * @author USUARIO
 */
public class loadconfig {
    
    public static String controlElefectivoSiNO;
    Config_EquiposDao confEquipoDao = new Config_EquiposDao();
      ArrayList<ConfigSofia> listConfig = new ArrayList<ConfigSofia>();
    ArrayList<Bodegas> listBodegas = new ArrayList<Bodegas>();
    ArrayList<Config_Equipos> listConfigdeEquipo = new ArrayList<Config_Equipos>();
    ArrayList<Config_Usuarios> listConfigdeUsuarios = new ArrayList<Config_Usuarios>();
    
    public loadconfig() {
        
        listConfigdeEquipo = confEquipoDao.listarByID(login.CodigoDelEquipo);
        ///lleno combo forma de pago       

        FormasPagoVDao fpDao = new FormasPagoVDao();
        for (FormasPagoV f : fpDao.listar()) {
            jcb_formadePagoPredeterminada.addItem(f.getFormaPago());
        }
        //// fin formas dpago

        for (Config_Equipos c : listConfigdeEquipo) {

            switch (c.getNombre()) {

                case "IMPRESORA TICKETS":
                    txt_tickets.setText(c.getNombre());
                    jcb_imptickets.setSelectedItem(c.getValor1());

                    break;
                case "IMPRESORA FACTURAS":
                    txt_facturas.setText(c.getNombre());
                    jcb_impfacturas.setSelectedItem(c.getValor1());
                    break;
                case "FORMA DE PAGO PREDETERMINADA":
                    txt_formadepagoPredeterminada.setText(c.getNombre());
                    jcb_formadePagoPredeterminada.setSelectedItem(c.getValor1());
                    break;
                case "BODEGA PREDETERMINADA EN COMPRA":
                    txt_bodegaPredeterminadaEnCompras.setText(c.getNombre());
                    jcb_BodegaPredeterminadCOmpra.setSelectedItem(c.getValor1());
                    break;

                case "BODEGA PREDETERMINADA EN VENTA":

                    txt_bodegaPredeterminadaEnVENTAS.setText(c.getNombre());
                    jcb_BodegaPredeterminadventas.setSelectedItem(c.getValor1());
                    break;
                case "FACTURA TIRILLAS O CON FORMATO":

                    TXT_FACTURASDEROOLO.setText(c.getNombre());
                    if (c.getValor1().equalsIgnoreCase("ROLLO")) {
                        CHECFACROLLO.setSelected(true);
                    } else if (c.getValor1().equalsIgnoreCase("GRANDE")) {
                        CHECFACGRANDE.setSelected(true);
                    }
                    Principal.facturatiriiasoGrande=c.getValor1();
                    break;
                case "TICKET TIRILLAS O CON FORMATO":

                    TXT_TICKETSDEROOLO.setText(c.getNombre());
                    if (c.getValor1().equalsIgnoreCase("ROLLO")) {
                        CHECTICROLLO.setSelected(true);
                    } else if (c.getValor1().equalsIgnoreCase("GRANDE")) {
                        CHECTICGRANDE.setSelected(true);
                    }
                    Principal.tickettiriiasoGrande=c.getValor1();
                    break;
                case "ACTIVAR CONTROL EFECTIVO":

                    TXT_CONTROL_EFECTIVO_CAJA_SI_NO.setText(c.getNombre());
                    if (c.getValor1().equalsIgnoreCase("SI")) {
                        CHECK_CONTROL_EFECTIVO.setSelected(true);
                    } else if (c.getValor1().equalsIgnoreCase("NO")) {
                        CHECK_CONTROL_EFECTIVO.setSelected(false);
                    }
                   this.controlElefectivoSiNO=c.getValor1();
                    break;

                case "PROFORMA TIRILLAS O CON FORMATO":

                    TXT_PROFORMASDEROOLO2.setText(c.getNombre());
                    if (c.getValor1().equalsIgnoreCase("ROLLO")) {
                        CHECPROFROLLO.setSelected(true);
                    } else if (c.getValor1().equalsIgnoreCase("GRANDE")) {
                        CHECPROFGRANDE.setSelected(true);
                    }
                    Principal.proformatiriiasoFacturaGrande=c.getValor1();
                    break;

            }

        }
    }
    
}
