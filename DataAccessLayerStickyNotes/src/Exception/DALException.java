package Exception;

public class DALException extends Exception {

    public DALException(String message, Throwable throwException) {
        super(message, throwException);
    }

}
