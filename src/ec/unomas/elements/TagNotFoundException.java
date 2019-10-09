package ec.unomas.elements;

public class TagNotFoundException extends Exception{
	public TagNotFoundException(String message) {
        super(message);
    }
    public TagNotFoundException(String message, Throwable throwable) {
        super(message, throwable);
    }
}
