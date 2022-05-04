package jp.co.lastminute.cart.user;

import java.io.*;
import java.util.*;
import jp.co.lastminute.cart.model.Order;
import org.apache.struts.action.*;
/**
 * @author user
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public class UserLoginForm extends ActionForm{
    private String e_mail = ""; //���[���A�h���X�i���[�UID�j
    private String passwd = ""; //�p�X���[�h
	//�G���[�R�����g
    protected Vector error_comm = new Vector();
    /** �v���p�e�B E_Mail �̎擾���\�b�h�B
     * @return �v���p�e�B e_mail �̒l�B
     */
    public String getE_mail() {
        return e_mail;
    }    

    /** �v���p�e�B E_Mail �̐ݒ胁�\�b�h�B
     * @param e_mail �v���p�e�B e_mail �̐V�����l�B
     */
    public void setE_mail(String e_mail) throws IOException {
        this.e_mail = new String( e_mail.getBytes("ISO-8859-1"), "Shift_JIS" ) ;
    }
    
    /** �v���p�e�B Passwd �̎擾���\�b�h�B
     * @return �v���p�e�B Passwd �̒l�B
     */
    public String getPasswd() {
        return passwd;
    }
    
    /** �v���p�e�B Passwd �̐ݒ胁�\�b�h�B
     * @param passwd �v���p�e�B passwd �̐V�����l�B
     */
    public void setPasswd(String passwd)  throws IOException {
        this.passwd = new String( passwd.getBytes("ISO-8859-1"), "Shift_JIS" ) ;
    }
    /**
	 * Sets the error_comm.
	 * @param error_comm The error_comm to set
	 */
	public void setError_comm(Vector error_comm) {
		this.error_comm = error_comm;
	}
	public void clearError_comm() {
		this.error_comm = null;
		this.error_comm = new Vector();
	}
	public void addError_comm(String error_comm) {
		this.error_comm.add( error_comm );
	}
	public String getViewErrorCopmment( String careturn ){
		String er_comment = "";
		try{
			for(int eindex=0; eindex<this.error_comm.size(); eindex++){
				er_comment += (String)this.error_comm.get(eindex) + careturn;
			}
		}catch(Exception ex){}
		return er_comment;
	}
	/**
	 * �G���[�R�����g�̈ړ�
	 */
	public void modifyErrComment( Order order ){
		try{
			Vector order_er_ = order.getError_comm();
			for(int i=0; i<order_er_.size(); i++ ){
				String err_com = (String)order_er_.get( i );
				addError_comm( err_com );
			}
		}catch(Exception ex){}
	} 
}