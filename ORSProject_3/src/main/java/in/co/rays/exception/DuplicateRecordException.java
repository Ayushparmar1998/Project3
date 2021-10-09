package in.co.rays.exception;


/**
 * DuplicateRecordException is prpogated by DAO classes when an unhandled Database
 * exception occurred
 * @author AYUSH
 *
 */
public class DuplicateRecordException extends Exception{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @param msg
	 * error msg
	 */
	public DuplicateRecordException(String msg){
		super(msg);
	}

}
