/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares;

import ClasesAuxiliares.debug.Deb;
import static java.lang.System.in;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import jdk.nashorn.internal.ir.TryNode;
import org.hyperic.sigar.OperatingSystem;
import org.hyperic.sigar.CpuInfo;
import org.hyperic.sigar.Sigar;
import org.hyperic.sigar.SigarException;
import org.hyperic.sigar.NetInfo;
import org.hyperic.sigar.NetInterfaceConfig;
import org.hyperic.sigar.Sigar;
import org.hyperic.sigar.SigarException;

/**
 *
 * @author USUARIO
 */
public class MaquinaDao {

    OperatingSystem os;
    Sigar s;
    NetInterfaceConfig net;
    NetInfo info;

    public MaquinaDao() {
//
//        try {
//            os = OperatingSystem.getInstance();
//            s = new Sigar();
//
//            net = s.getNetInterfaceConfig(null);
//            info = s.getNetInfo();
//        } catch (SigarException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
    }

    public String getNombreEquipo() {

        String sHostName = "";
        InetAddress address = null;
        try {
            address = InetAddress.getLocalHost();
            sHostName = address.getHostName();
        } catch (UnknownHostException ex) {
            Deb.consola("ClasesAuxiliares.Maquina.getNombreEquipo(): " + ex);
        }

        return sHostName;
    }

    public String getIpEquipo() {

        String sHostName = "";
        InetAddress address = null;
        String sIPAddress = "";
        try {
            address = InetAddress.getLocalHost();
            sHostName = address.getHostName();

            // Cogemos la IP 
            byte[] bIPAddress = address.getAddress();

// IP en formato String
            for (int x = 0; x < bIPAddress.length; x++) {

                if (x > 0) {
                    // A todos los numeros les anteponemos
                    // un punto menos al primero    
                    sIPAddress += ".";
                }
                // Jugamos con los bytes y cambiamos el bit del signo
                sIPAddress += bIPAddress[x] & 255;
            }
        } catch (UnknownHostException ex) {
            Logger.getLogger(MaquinaDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        Deb.consola("ClasesAuxiliares.Maquina.getCaracteristicasEquipo() " + sIPAddress);
        Deb.consola("ClasesAuxiliares.Maquina.getCaracteristicasEquipo() " + sHostName);
        return sIPAddress;
    }

    public ArrayList<String> obtenerDatosSO() {
        ArrayList<String> datos = new ArrayList();
        try {

            datos.add("Descripcion: ");
            datos.add(os.getDescription());
            datos.add("Nombre: ");
            datos.add(os.getVendorName());
            datos.add("Version: ");
            datos.add(os.getVersion());
            datos.add("Arquitectura: ");
            datos.add(os.getArch());
            Deb.consola("ClasesAuxiliares.Maquina.obtenerDatosSO():  " + datos);

        } catch (Exception e) {
        }
        return datos;
    }

    public ArrayList<String> obtenerDatosCPU() {

        ArrayList<String> datos = new ArrayList();
        try {
            CpuInfo cpu[] = s.getCpuInfoList();
            CpuInfo info = cpu[0];
            datos.add("Vendedor: ");
            datos.add(info.getVendor());
            datos.add("Modelo: ");
            datos.add(info.getModel());
            datos.add("Mhz: ");
            datos.add("" + info.getMhz());
            if (info.getCacheSize() != Sigar.FIELD_NOTIMPL) {
                datos.add("Tamaño de Cache: ");
                datos.add("" + info.getCacheSize());
            }
            if ((info.getTotalCores() != info.getTotalSockets()) || (info.getCoresPerSocket() > info.getTotalCores())) {
                datos.add("CPU´s Fisicas: ");
                datos.add("" + info.getTotalSockets());
                datos.add("Nucleos por CPU: ");
                datos.add("" + info.getCoresPerSocket());
            }

        } catch (SigarException e) {
            e.printStackTrace();
        }
        Deb.consola("ClasesAuxiliares.Maquina.obtenerDatosSO()" + datos);
        return datos;
    }

    public ArrayList<String> obtenerDatosNet() {

        ArrayList<String> datos = new ArrayList();
        try {
            datos.add("IP primaria: ");
            datos.add(net.getAddress());
            datos.add("Mac primaria: ");
            datos.add(net.getHwaddr());
            datos.add("Host: ");
            datos.add(info.getHostName());
        } catch (Exception e) {
        }

        Deb.consola("ClasesAuxiliares.Maquina.obtenerDatosSO()" + datos);
        return datos;
    }

  
}
