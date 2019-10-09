package ec.unomas.sign;

public class CertNotFoundException extends Exception {
	
	public CertNotFoundException(String message) {
        super(message);
    }
    public CertNotFoundException(String message, Throwable throwable) {
        super(message, throwable);
    }
}
