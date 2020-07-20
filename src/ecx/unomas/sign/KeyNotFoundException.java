package ecx.unomas.sign;

public class KeyNotFoundException extends Exception {

	public KeyNotFoundException(String message) {
        super(message);
    }
    public KeyNotFoundException(String message, Throwable throwable) {
        super(message, throwable);
    }
}
