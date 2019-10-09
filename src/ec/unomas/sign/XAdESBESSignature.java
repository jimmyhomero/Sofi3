package ec.unomas.sign;

import java.io.IOException;

import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;
import es.mityc.firmaJava.libreria.xades.DataToSign;
import es.mityc.firmaJava.libreria.xades.XAdESSchemas;
import es.mityc.javasign.EnumFormatoFirma;
import es.mityc.javasign.xml.refs.InternObjectToSign;
import es.mityc.javasign.xml.refs.ObjectToSign;

public class XAdESBESSignature extends GenericXMLSignature {
	private static String RESOURCE_TO_SIGN;
	private static String SIGN_FILE_NAME;
        
	
	public static boolean sign(String path, String claveAcceso) throws Exception {
		RESOURCE_TO_SIGN = path;
		SIGN_FILE_NAME = claveAcceso+".xml";
		XAdESBESSignature signature = new XAdESBESSignature();
	return	signature.execute();
	
        }
	
	@Override
	protected DataToSign createDataToSign() throws SAXException, IOException, ParserConfigurationException {
		DataToSign dataToSign = new DataToSign();
		dataToSign.setXadesFormat(EnumFormatoFirma.XAdES_BES);
		dataToSign.setEsquema(XAdESSchemas.XAdES_132);
		dataToSign.setXMLEncoding("UTF-8");
		dataToSign.setEnveloped(true);
		dataToSign.addObject(new ObjectToSign(new InternObjectToSign("comprobante"), "contenido comprobante", null, "text/xml", null));
		Document docToSign = getDocument(RESOURCE_TO_SIGN);
		dataToSign.setDocument(docToSign);
		return dataToSign;
	}
	@Override
	protected String getSignatureFileName() {
		return SIGN_FILE_NAME;
	}
}