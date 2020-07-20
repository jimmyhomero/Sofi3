
import ClasesAuxiliares.FeCodigoNUmerico;
import ClasesAuxiliares.Variables;
import ecx.unomas.elements.ArchivoUtil;
import ecx.unomas.factura.Detalle;
import ecx.unomas.factura.Factura;
import ecx.unomas.factura.Impuesto;
import ecx.unomas.factura.InfoAdicional;
import ecx.unomas.factura.Pago;
import ecx.unomas.factura.TotalImpuesto;
import ecx.unomas.service.Comprobante;
import ecx.unomas.service.Config;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author USUARIO
 */
public class Main1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
//private void finddoc(){

    File fichero = new File(Config.GENERADOS_DIR );
       String[] listaArchivos=fichero.list();
        for(int i=0; i<listaArchivos.length; i++){
            System.out.println(listaArchivos[i]);
        }

//        if (txt_cedula.getText().length() == 10) {
//            ruc = txt_cedula.getText() + "001";
//        } else if (txt_cedula.getText().length() == 13) {
//            ruc = txt_cedula.getText();
//        }
        String ruc = "1722239967001";
       // 00187941
        ///1002201801172223996700110010020000000518564578315
       //  1002201801239002122700120020010001879380018794119
           //1002201801172223996700110010020000000510018794116
       //  1002201801172223996700110010020000000510018794111
                                //  20020010001879380018794119
         //System.out.println("Main1.main()  : "+claveAcceso);
         String claveAcceso;
        String fecha = "12022018";
//        String claveCosmo="100220180123900212270012002001000187938001879411";
        claveAcceso = fecha + Variables.FE_FACTURA + ruc + Variables.FE_TIPO_AMBIENTE + "001" + "002" + "000000090" + Variables.FE_CODIGO_NUMERICO + Variables.FE_TIPO_EMISION;                       
         Variables.FE_DIGITO_VERIFICADOR=   String.valueOf(FeCodigoNUmerico.obtenerSumaPorDigitosOK(FeCodigoNUmerico.invertirCadenaOK(claveAcceso)));
         System.out.println("DIGITO VERIFICADOR " +Variables.FE_DIGITO_VERIFICADOR);
         claveAcceso=claveAcceso+Variables.FE_DIGITO_VERIFICADOR;
        //claveAcceso="1002201801172223996700110010020000000031234567811";  
        System.out.println("calve de acceso: " + claveAcceso);        
        Factura f = new Factura();
        f.setTipoEmision(1);
        f.setAmbiente(1);
        f.setAmbienteName("PRUEBAS");
        f.setNombreComercial("compuec");
        f.setRazonSocial("CARRION TORRES JIMMY HOMERO");
        f.setRUC(ruc);
        f.setClaveAcceso(claveAcceso);
        f.setCodDoc("01");
        f.setEstab("001");
        f.setPtoEmi("002");
        f.setSecuencia("000000090");
        f.setDirMatriz("santo domingo");
        f.setFechaEmision("13/02/2018");
        f.setDirEstablecimiento("qv. quito");
        // f.setContribuyenteEspecial(0);
        f.setObligadoContabilidad("NO");
        f.setTipoIdentificacionComprador("04");
        // f.setGuiaRemision("001-001-00000002");
        f.setRazonSocialComprador("PRUEBAS SERVICIO DE RENTAS INTERNAS");
        f.setIdentificacionComprador("1717148371001");
        f.setDireccionComprador("gran colombia");
        f.setTotalSinImpuestos(10.00);
        f.setTotalDescuento(0.00);

//// totatal con impuesto ya esta en xml     
        /////
        TotalImpuesto totimp = new TotalImpuesto();
        totimp.setBaseImponible(10.00);
        totimp.setCodigo(2);
        totimp.setCodigoPorcentaje(2);
        totimp.setValor(1.20);
        
        f.setTotalImpuestos(totimp);
        
/////////////
       f.setImporteTotal(11.20);
        Detalle d = new Detalle();

        d.setCodigoPrincipal("inter-12");
        d.setCodigoSecundario("20mbps");
        d.setDescripcion("internet banda ancha");
        d.setCantidad(1.0);
        d.setPrecioUnitario(10.0);
        d.setDescuento(0.0);
        d.setPrecioTotalSinImpuesto(10.0);
        Impuesto i = new Impuesto();
        Vector<Impuesto> ivec = new Vector<Impuesto>();

        i.setCodigo(2);
        i.setCodigoPorcentaje(2);
        i.setTarifa(12.00);
        i.setBaseImponible(10.00);
        i.setValor(1.20);
        ivec.add(i);
        d.setImpuesto(ivec);
        f.setDetalle(d);

        InfoAdicional infadd = new InfoAdicional();
        InfoAdicional infadd1 = new InfoAdicional();
        InfoAdicional infadd2 = new InfoAdicional();

        infadd.setNombre("DIRECCION");
        infadd.setValor("sannta martha");
        infadd1.setNombre("FORMA DE PAGO");
        infadd1.setValor("EFECTIVO");
        infadd2.setNombre("RESPONSABLE");
        infadd2.setValor("jc");

        f.setInfAdicional(infadd);
        f.setInfAdicional(infadd1);
        f.setInfAdicional(infadd2);
//        
//        Pago p = new Pago();
//        p.setFormaPago("01");
//        p.setTotal(11.20);
//        //f.setPagos(p);
//        f.setDetalle(d);
//        f.setImporteTotal(11.20);
//        

        String s = f.getXML();
   //     System.out.println("xmls" + s);
        // TODO code application logic here
        //byte[] xmlBytes=  readBytesFromFile("D:\\comprobantes\\generados\\fac3.xml");
        ArchivoUtil.stringToFile(Config.GENERADOS_DIR + claveAcceso + ".xml", s);
        File xml_file = new File(Config.GENERADOS_DIR + claveAcceso + ".xml");
        byte[] archivoBytes = null;
        try {

            archivoBytes = ArchivoUtil.convertirArchivoAByteArray(xml_file);
        } catch (IOException ex) {
            Logger.getLogger(Main1.class.getName()).log(Level.SEVERE, null, ex);
        }
          
        Comprobante a = new Comprobante();
        a.upload(claveAcceso, archivoBytes);
        a.validate(claveAcceso);                
        a.download(claveAcceso, "xml");
              //a.sendDoc(claveAcceso,"homer_loading@hotmail.com"," Jimmy carri");
  
      

        //      a.download(claveAcceso, ext);
    }

    private static byte[] readBytesFromFile(String filePath) {

        FileInputStream fileInputStream = null;
        byte[] bytesArray = null;

        try {

            File file = new File(filePath);
            bytesArray = new byte[(int) file.length()];

            //read file into bytes[]
            fileInputStream = new FileInputStream(file);
            fileInputStream.read(bytesArray);

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (fileInputStream != null) {
                try {
                    fileInputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

        }

        return bytesArray;

    }

}
