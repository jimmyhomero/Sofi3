package ecx.unomas.sign;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringWriter;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.Provider;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.List;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import ecx.unomas.service.Config;
import es.mityc.firmaJava.libreria.utilidades.UtilidadTratarNodo;
import es.mityc.firmaJava.libreria.xades.DataToSign;
import es.mityc.firmaJava.libreria.xades.FirmaXML;
import es.mityc.javasign.pkstore.IPKStoreManager;
import es.mityc.javasign.pkstore.keystore.KSStore;

public abstract class GenericXMLSignature {

   public static String SIGN_FILE_NAME;

   protected boolean execute() throws Exception {
       boolean status=false;
	  Logger LOGGER = Logger.getLogger("Oneplus.log");
	  //FileHandler fh = new FileHandler("/tmp/Oneplus.log");  
      //LOGGER.addHandler(fh);
      //SimpleFormatter formatter = new SimpleFormatter();  
      //fh.setFormatter(formatter);
	   
      // Obtencion del gestor de claves
	  LOGGER.info("Obtencion del gestor de claves");
      IPKStoreManager storeManager = getPKStoreManager();
      if (storeManager == null) {
    	  LOGGER.warning("El gestor de claves no se ha obtenido correctamente.");
    	  throw new KeyNotFoundException("El gestor de claves no se ha obtenido correctamente.");
      }

      // Obtencion del certificado para firmar. Utilizaremos el primer certificado del almacen.
      LOGGER.info("Obtencion del certificado para firmar. Utilizaremos el primer certificado del almacen.");
      List<X509Certificate> certs = null;
      certs = storeManager.getSignCertificates();
      if ((certs == null) || (certs.size() == 0)) {
          LOGGER.warning("Lista de certificados vacia");
          throw new CertNotFoundException("Lista de certificados vacia");
      }
      X509Certificate certificate = certs.get(0);
      if (certificate == null) {
    	  LOGGER.warning("No existe ningun certificado para firmar.");
//          Variables.FE_DOCUMENTO_ERROR_LOG="No existe ningun certificado para firmar.";
    	  throw new CertNotFoundException("No existe ningun certificado para firmar.");
      }

      // Obtencion de la clave privada asociada al certificado
      LOGGER.info("Obtencion de la clave privada asociada al certificado");
      PrivateKey privateKey;
      privateKey = storeManager.getPrivateKey(certificate);   

      // Obtencion del provider encargado de las labores criptogroficas
      LOGGER.info("Obtencion del provider encargado de las labores criptogroficas");
      Provider provider = storeManager.getProvider(certificate);
       try {
           
           
      // Creacion del objeto que contiene tanto los datos a firmar como la configuracion del tipo de firma
      LOGGER.info("Obtencion del provider encargado de las labores criptogr�ficas");
      DataToSign dataToSign = createDataToSign();

      // Creacion del objeto encargado de realizar la firma
      LOGGER.info("Creacion del objeto encargado de realizar la firma");
      FirmaXML firma = new FirmaXML();

      // Firmamos el documento
      LOGGER.info("Firmamos el documento");
      Document docSigned = null;
   	  Object[] res = firma.signFile(certificate, dataToSign, privateKey, provider);
   	  docSigned = (Document) res[0];
  //     Variables.FE_DOCUMENTO_ERROR_LOG="Firmamos el documento";
      // Guardamos la firma a un fichero en el home del usuario
      LOGGER.info("Guardamos la firma a un fichero en el home del usuario");
      String filePath = Config.FIRMADOS_DIR + getSignatureFileName();
      saveDocumentToFile(docSigned, filePath);
      status=true;
    //  Variables.FE_DOCUMENTO_ERROR_LOG="DOCUMENTO GUARDADO EN: "+Config.FIRMADOS_DIR;
       } catch (Exception e) {
           LOGGER.info("Error proceso de firmar dcumento "+e);
      status=false;  
      
       }
       
      return status;
  }
   
  /**
   * Crea el objeto DataToSign que contiene toda la informaci�n de la firma
   * que se desea realizar. Todas las implementaciones deber�n proporcionar
   * una implementaci�n de este m�todo
   * 
   * @return El objeto DataToSign que contiene toda la informaci�n de la firma
   *         a realizar
 * @throws ParserConfigurationException 
 * @throws IOException 
 * @throws SAXException 
   */
  protected abstract DataToSign createDataToSign() throws SAXException, IOException, ParserConfigurationException;

  /**
   * Nombre del fichero donde se desea guardar la firma generada. Todas las
   * implementaciones deber�n proporcionar este nombre.
   * 
   * @return El nombre donde se desea guardar la firma generada
   */
  protected String getSignatureFileName(){
	  return this.SIGN_FILE_NAME;
  }

  /**
   * Escribe el documento a un fichero.
   * 
   * @param document
   *            El documento a imprmir
   * @param pathfile
   *            El path del fichero donde se quiere escribir.
 * @throws FileNotFoundException 
   */
  private void saveDocumentToFile(Document document, String pathfile) throws FileNotFoundException {
	  try {
			FileOutputStream fos = new FileOutputStream(pathfile);
			UtilidadTratarNodo.saveDocumentToOutputStream(document, fos, true);
			fos.close();
	  } catch (IOException e) {
		  	System.err.println("Error al salvar el documento");
			e.printStackTrace();
	  }
  }

  /**
   * <p>
   * Escribe el documento a un fichero. Esta implementacion es insegura ya que
   * dependiendo del gestor de transformadas el contenido podr�a ser alterado,
   * con lo que el XML escrito no ser�a correcto desde el punto de vista de
   * validez de la firma.
   * </p>
   * 
   * @param document
   *            El documento a imprmir
   * @param pathfile
   *            El path del fichero donde se quiere escribir.
 * @throws TransformerException 
   */
  @SuppressWarnings("unused")
  private void saveDocumentToFileUnsafeMode(Document document, String pathfile) throws TransformerException {
      TransformerFactory tfactory = TransformerFactory.newInstance();
      Transformer serializer;
      
          serializer = tfactory.newTransformer();

          serializer.transform(new DOMSource(document), new StreamResult(new File(pathfile)));
      /*} catch (TransformerException e) {
          System.err.println("Error al salvar el documento");
          e.printStackTrace();
          System.exit(-1);
      }*/
  }

  /**
   * Devuelve el <code>Document</code> correspondiente al
   * <code>resource</code> pasado como par�metro
   * 
   * @param resource
   *            El recurso que se desea obtener
   * @return El <code>Document</code> asociado al <code>resource</code>
 * @throws ParserConfigurationException 
 * @throws IOException 
 * @throws SAXException 
   */
  protected Document getDocument(String resource) throws SAXException, IOException, ParserConfigurationException {
      Document doc = null;
      DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
      dbf.setNamespaceAware(true);
      File f = new File(resource);
      doc = dbf.newDocumentBuilder().parse(f);
      /*
      } catch (ParserConfigurationException ex) {
          System.err.println("Error al parsear el documento");
          ex.printStackTrace();
          System.exit(-1);
      } catch (SAXException ex) {
          System.err.println("Error al parsear el documento");
          ex.printStackTrace();
          System.exit(-1);
      } catch (IOException ex) {
          System.err.println("Error al parsear el documento");
          ex.printStackTrace();
          System.exit(-1);
      } catch (IllegalArgumentException ex) {
          System.err.println("Error al parsear el documento");
          ex.printStackTrace();
          System.exit(-1);
      }*/
      return doc;
  }

  /**
   * Devuelve el contenido del documento XML
   * correspondiente al <code>resource</code> pasado como par�metro
   * como un <code>String</code>
   * 
   * @param resource
   *            El recurso que se desea obtener
   * @return El contenido del documento XML como un <code>String</code>
 * @throws ParserConfigurationException 
 * @throws IOException 
 * @throws SAXException 
 * @throws TransformerException 
   */
  protected String getDocumentAsString(String resource) throws SAXException, IOException, ParserConfigurationException, TransformerException {
      Document doc = getDocument(resource);
      TransformerFactory tfactory = TransformerFactory.newInstance();
      Transformer serializer;
      StringWriter stringWriter = new StringWriter();
      serializer = tfactory.newTransformer();
      serializer.transform(new DOMSource(doc), new StreamResult(stringWriter));
      /*
      } catch (TransformerException e) {
          System.err.println("Error al imprimir el documento");
          e.printStackTrace();
          System.exit(-1);
      }
      */

      return stringWriter.toString();
  }

  /**
   * Devuelve el gestor de claves que se va a utilizar
   * 
   * @return El gestor de claves que se va a utilizar</p>
 * @throws KeyStoreException 
 * @throws IOException 
 * @throws CertificateException 
 * @throws NoSuchAlgorithmException 
   */
  private IPKStoreManager getPKStoreManager() throws KeyStoreException, NoSuchAlgorithmException, CertificateException, IOException {
		//LEER CLAVE
		String PKCS12_KEY="";
		BufferedReader br = new BufferedReader(new FileReader(Config.PKCS12_PASSWORD_DIR));
		try {
		    StringBuilder sb = new StringBuilder();
		    String line = br.readLine();
		    while (line != null) {
		        sb.append(line);
		        line = br.readLine();
		    }
		    PKCS12_KEY = sb.toString();
		} finally {
		    br.close();
		}
		IPKStoreManager storeManager = null;
		KeyStore ks = KeyStore.getInstance("PKCS12");
		ks.load(new FileInputStream(new File(Config.PKCS12_RESOURCE)), PKCS12_KEY.toCharArray());
		storeManager = new KSStore(ks, new PassStoreKS(PKCS12_KEY));
		return storeManager;
  }
}