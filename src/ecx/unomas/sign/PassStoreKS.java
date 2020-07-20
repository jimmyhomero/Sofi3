package ecx.unomas.sign;

import java.security.cert.X509Certificate;

import es.mityc.javasign.pkstore.IPassStoreKS;

/**
 * Permite automatizar el acceso a las contraseOas de los almacenes de certificados de testeo.
 */
public class PassStoreKS implements IPassStoreKS {
	
	/** ContraseOa de acceso al almacOn. */
	private transient String password;
	
	/**
	 * Crea una instancia con la contraseOa que se utilizarO con el almacOn relacionado.
	 * @param pass ContraseOa del almacOn
	 */
	public PassStoreKS(final String pass) {
		this.password = new String(pass);
	}

	/**
	 * Devuelve la contrasea configurada para este almacOn.
	 * @param certificate No se utiliza
	 * @param alias no se utiliza
	 * @return contraseOa configurada para este almacOn
	 * @see es.mityc.javasign.pkstore.IPassStoreKS#getPassword(java.security.cert.X509Certificate, java.lang.String)
	 */
	public char[] getPassword(final X509Certificate certificate, final String alias) {
		return password.toCharArray();
	}

}