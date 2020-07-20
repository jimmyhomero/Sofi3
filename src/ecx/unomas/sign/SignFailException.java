package ecx.unomas.sign;

public class SignFailException extends Exception {
	
	public SignFailException(String message) {
        super(message);
    }
    public SignFailException(String message, Throwable throwable) {
        super(message, throwable);
    }
}
