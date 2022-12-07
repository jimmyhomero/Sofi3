/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import ClasesAuxiliares.NewSql.Forms.OperacionesForms;
import Controlador.Usuarios.FacturasDao;
import Controlador.Usuarios.RetencionCDao;
import Modelo.Facturas;
import Modelo.Retencion_;
import Vista.Principal;
import Vlidaciones.ProgressBar;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author USUARIO
 */
public class HiloElectronica extends Thread {

    ArrayList<Facturas> listafac = new ArrayList<Facturas>();
    ArrayList<Retencion_> listaret = new ArrayList<Retencion_>();

    @Override
    public void run() {

        while (Principal.activarfacturacionelectronica) {
            try {
                try {

                    FacturasDao fdao = new FacturasDao();
                    listafac = fdao.buscarFacturasNoAutorizadas();
                    for (Facturas f : listafac) {
                        if (f.isAnulada()) {
                            OperacionesForms.EnviarFacturaElectronicaAlSri(f, f.getCalveAcceso());
                        } else {
                            ProgressBar.mostrarMensajeAzul("DOCUMENTO ANULADO NO AUTORIZAR");
                        }

                    }
                    sleep(10000);
                } catch (InterruptedException ex) {
                    Logger.getLogger(HiloElectronica.class.getName()).log(Level.SEVERE, null, ex);
                }
                RetencionCDao rdao = new RetencionCDao();
                listaret = rdao.buscarRetencionesNoAutorizadas();
                for (Retencion_ r : listaret) {
                    OperacionesForms.EnviarFacturaElectronicaAlSri(r, r.getAutorizacion());
                }
                sleep(10000);
            } catch (InterruptedException ex) {
                Logger.getLogger(HiloElectronica.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
}
