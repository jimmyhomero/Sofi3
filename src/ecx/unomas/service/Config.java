package ecx.unomas.service;

import Controlador.Usuarios.HoraFecha;
import java.io.File;
import login.login;

public class Config {

    
    public static String RECEPCION_WSDL_PRUEBAS =        "https://celcer.sri.gob.ec/comprobantes-electronicos-ws/RecepcionComprobantesOffline?wsdl";
    public static String AUTORIZACION_WSDL_PRUEBAS =     "https://celcer.sri.gob.ec/comprobantes-electronicos-ws/AutorizacionComprobantesOffline?wsdl";

    public static String RECEPCION_WSDL_PRODUCCION =     "https://cel.sri.gob.ec/comprobantes-electronicos-ws/RecepcionComprobantesOffline?wsdl";
    public static String AUTORIZACION_WSDL_PRODUCCION =  "https://cel.sri.gob.ec/comprobantes-electronicos-ws/AutorizacionComprobantesOffline?wsdl";

    ////////////////////////////
    ///// UNOMAS.EC
    ////////////////////////
    public static String api = "key-xxx";
    public static String domain = "https://api.mailgun.net/v3/mg.1mas.ec/";
    public static String from = "UNOMAS.EC <noreply@1mas.ec>";
    public static String name = "COMPUECONOMIA";
    public static String web = "1mas.ec";
    public static String color = "#666666";

    /* 
	public static String LOGO = "/var/www/html/comprobantes/logo.png";
	public static String CACERT = "/var/www/html/comprobantes/cacerts";
	public static String PKCS12_RESOURCE = "/var/www/html/comprobantes/firma.p12";
	public static String PKCS12_PASSWORD_DIR = "/var/www/html/comprobantes/clave.txt";
	
	/* 
        
     */
    public static String RAIZ;
    public static char SEPARADOR;
    public static String LOGO = "C:\\Sofi\\electronica\\logo.png";
    public static String CACERT = "C:\\Sofi\\electronica\\cacerts";
    public static String PKCS12_RESOURCE = "C:\\Sofi\\electronica\\firma.p12";
    public static String PKCS12_PASSWORD_DIR = "C:\\Sofi\\electronica\\clave.txt";
    //*/
    /*
	public static String SUBIDOS_DIR = "/var/www/html/comprobantes" + File.separatorChar + "subidos" + File.separatorChar;
	public static String GENERADOS_DIR = "/var/www/html/comprobantes" + File.separatorChar + "generados" + File.separatorChar;
	public static String FIRMADOS_DIR = "/var/www/html/comprobantes" + File.separatorChar + "firmados" + File.separatorChar;
	public static String AUTORIZADOS_DIR = "/var/www/html/comprobantes" + File.separatorChar + "autorizados" + File.separatorChar;
	public static String NO_AUTORIZADOS_DIR = "/var/www/html/comprobantes" + File.separatorChar + "no_autorizados" + File.separatorChar;
	public static String REENVIAR_DIR = "/var/www/html/comprobantes" + File.separatorChar + "reenviar" + File.separatorChar;
     */
    
    public static String SUBIDOS_DIR = "C:\\Sofi\\electronica" + File.separatorChar + "subidos" + File.separatorChar;
    public static String GENERADOS_TEMP = "C:\\Sofi\\electronica" + File.separatorChar + "generados_temp" + File.separatorChar;
    public static String GENERADOS_DIR = "C:\\Sofi\\electronica" + File.separatorChar + "generados" + File.separatorChar;    
    public static String FIRMADOS_DIR = "C:\\Sofi\\electronica" + File.separatorChar + "firmados" + File.separatorChar;
    public static String EMITIDOS_DIR = "C:\\Sofi\\electronica" + File.separatorChar + "DESCARGADOS_SRI" +File.separatorChar+ "EMITIDOS"+File.separatorChar  ;
    public static String RECIBIDOS_DIR = "C:\\Sofi\\electronica" + File.separatorChar + "DESCARGADOS_SRI" +File.separatorChar+ "RECIBIDOS"+File.separatorChar;
    public static String AUTORIZADOS_DIR = "C:\\Sofi\\electronica" + File.separatorChar + "autorizados" + File.separatorChar;
    public static String AUTORIZADOS_DIR_CONSULTADOS = "C:\\Sofi\\electronica" + File.separatorChar + "autorizados_consultados" + File.separatorChar;
    public static String NO_AUTORIZADOS_DIR = "C:\\Sofi\\electronica" + File.separatorChar + "no_autorizados" + File.separatorChar;
    public static String REENVIAR_DIR = "C:\\Sofi\\electronica" + File.separatorChar + "reenviar" + File.separatorChar;
////    
////    public static String SUBIDOS_DIR = "C:\\Sofi\\electronica\\subidos\\" ;
////    public static String GENERADOS_DIR = "C:\\Sofi\\electronica\\generados\\";
////    public static String FIRMADOS_DIR = "C:\\Sofi\\electronica\\firmados\\" ;
////    public static String AUTORIZADOS_DIR = "C:\\Sofi\\electronica\\autorizados\\";
////    public static String NO_AUTORIZADOS_DIR = "C:\\Sofi\\electronica\\no_autorizados\\";
////    public static String REENVIAR_DIR = "C:\\Sofi\\electronica\\reenviar\\";
////    public static String GENERADOS_TEMP = "C:\\Sofi\\electronica\\generados_temp\\" ;

//public static String PERIODO_RET=HoraFecha.fecha_mmaaConSlash("");
    /////diferenes faces del prceso de facturacion electronica
    public static boolean FE_SOLO_FIRMA_DOC = false; /// TRUE SOLO FIRMA DOCUMENTO / FALSE  FIRMA Y ENVIA AL SRI
    public static boolean FE_DOCUMENTO_FIRMADO = false;
    public static boolean FE_DOCUMENTO_ENVIADO = false;
//    public static String  FE_DOCUMENTO_ERROR_LOG;
//    public static boolean FE_DOCUMENTO_ESTADO= false;
//    public static boolean FE_DOCUMENTO_FIRMADO= false;
//    public static boolean FE_DOCUMENTO_GUARDADO_EN_FIRMADOS= false;
    public static boolean FE_DOCUMENTO_AUTORIZADO = false;
    public static String FE_LISTA_DE_RESPUESTA_SRI ="";
//    public static boolean FE_DOCUMENTO_GUARDADO_EN_AUTORIZADO= false;
//    /////////////////

    public Config() {
        String c = "";
        char dir = File.separatorChar;
        if (login.os.equalsIgnoreCase("w")) {
            c = "c:";
        }
        if (login.os.equalsIgnoreCase("l")) {
            c = "";
        }
        LOGO = c + dir + "Sofi" + dir + "electronica" + dir + "logo.png";
        CACERT = c + dir + "Sofi" + dir + "electronica" + dir + "cacerts";
        PKCS12_RESOURCE = c + dir + "Sofi" + dir + "electronica" + dir + "firma.p12";
        PKCS12_PASSWORD_DIR = c + dir + "Sofi" + dir + "electronica" + dir + "clave.txt";
        RAIZ= c + dir;
        SEPARADOR=dir;
        System.out.println("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");         
        System.out.println("ec.unomas.service.Config.<init>(xxx): -> "+RAIZ); 
        System.out.println("ec.unomas.service.Config.<init>(xxxx): -> "+SEPARADOR); 
        System.out.println("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"); 
    }   
    public static void iniciarConfig(){
String c = "";
        char dir = File.separatorChar;
        if (login.os.equalsIgnoreCase("w")) {
            c = "c:";
        }
        if (login.os.equalsIgnoreCase("l")) {
            c = "";
        }
        LOGO = c + dir + "Sofi" + dir + "electronica" + dir + "logo.png";
        CACERT = c + dir + "Sofi" + dir + "electronica" + dir + "cacerts";
        PKCS12_RESOURCE = c + dir + "Sofi" + dir + "electronica" + dir + "firma.p12";
        PKCS12_PASSWORD_DIR = c + dir + "Sofi" + dir + "electronica" + dir + "clave.txt";
        RAIZ= c + dir;
        SEPARADOR=dir;
        SUBIDOS_DIR =c + dir + "Sofi" + dir + "electronica" + dir +"subidos" +dir;
     GENERADOS_TEMP = c + dir + "Sofi" + dir + "electronica" + dir + "generados_temp" +dir;
     GENERADOS_DIR = c + dir + "Sofi" + dir + "electronica" + dir + "generados" +dir;  
    FIRMADOS_DIR = c + dir + "Sofi" + dir + "electronica" + dir + "firmados" +dir;
     AUTORIZADOS_DIR = c + dir + "Sofi" + dir + "electronica" + dir + "autorizados" +dir;
     AUTORIZADOS_DIR_CONSULTADOS = c + dir + "Sofi" + dir + "electronica" + dir + "autorizados_consultados" +dir;
     NO_AUTORIZADOS_DIR = c + dir + "Sofi" + dir + "electronica" + dir + "no_autorizados"+dir;
     REENVIAR_DIR =c + dir + "Sofi" + dir + "electronica" + dir+ "reenviar"+ dir;
        System.out.println("ecx.unomas.service.Config.iniciarConfig()xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:"+ FIRMADOS_DIR);
        System.out.println("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");         
        System.out.println("ec.unomas.service.Config.<init>(): -> "+RAIZ); 
        System.out.println("ec.unomas.service.Config.<init>(): -> "+SEPARADOR); 
        System.out.println("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"); 
        
        
}    
}
