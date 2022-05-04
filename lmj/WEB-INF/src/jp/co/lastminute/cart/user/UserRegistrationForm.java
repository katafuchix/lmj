package jp.co.lastminute.cart.user;

import java.io.*;
import java.util.*;
import jp.co.lastminute.cart.user.model.*;
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
public class UserRegistrationForm extends ActionForm{
    private String e_mail = "";         //���[���A�h���X�i���[�UID�j
    private String passwd = "";         //�p�X���[�h
    private String oncepasswd = "";     //�p�X���[�h�ē���
    private String html_mail_ok = "1";   //HTML���[���̎�M�t���O
    private String sei_kanji = "";      //���O����-��
    private String na_kanji = "";       //���O����-��
    private String sex = "";            //����
    private String postal_cda = "";     //�X�֔ԍ���
    private String postal_cdb = "";     //�X�֔ԍ���
    //
    private String sei_kana = "";
    private String na_kana = "";
    private String state_cd = "";
    private String city_name = "";
    private String address = "";
    private String tel_no = "";
    private String birthyear = "";
    private String birthmonth = "";
    private String throwflg = "";
    //
    private int user_id = 0;
	//�G���[�R�����g
    protected Vector error_comm = new Vector();
    
    public UserRegistrationForm(){
    }
    /**
     * 
     */
    private String Conv2Sjis(String str) throws IOException {
        return new String( str.getBytes("ISO-8859-1"), "Shift_JIS" ) ;
    }
    /** �v���p�e�B E_mail �̎擾���\�b�h�B
     * @param return �v���p�e�B e_mail �̒l�B
     */
    public String getE_mail() {
        return e_mail;
    }
    
    /** �v���p�e�B E_mail �̐ݒ胁�\�b�h�B
     * @param return �v���p�e�B e_mail �̐V�����l�B
     */
    public void setE_mail(String e_mail) throws IOException {
        this.e_mail = Conv2Sjis( e_mail ) ;
    }
    
    /** �v���p�e�B E_mail �̎擾���\�b�h�B
     * @param return �v���p�e�B Passwd �̒l�B
     */
    public String getPasswd() {
        return passwd;
    }
    
    /** �v���p�e�B Passwd �̐ݒ胁�\�b�h�B
     * @param return �v���p�e�B passwd �̐V�����l�B
     */
    public void setPasswd(String passwd)  throws IOException {
        this.passwd = Conv2Sjis( passwd ) ;
    }
    
    /** �v���p�e�B Oncepasswd �̎擾���\�b�h�B
     * @param return �v���p�e�B oncepasswd �̒l�B
     */
    public String getOncepasswd() {
        return oncepasswd;
    }
    
    /** �v���p�e�B Oncepasswd �̐ݒ胁�\�b�h�B
     * @param return �v���p�e�B oncepasswd �̐V�����l�B
     */
    public void setOncepasswd(String oncepasswd) throws IOException {
        this.oncepasswd = Conv2Sjis( oncepasswd ) ;
    }
    
    /** �v���p�e�B Html_mail_ok �̎擾���\�b�h�B
     * @param return �v���p�e�B html_mail_ok �̒l�B
     */
    public String getHtml_mail_ok() {
        return html_mail_ok;
    }
    
    /** �v���p�e�B Html_mail_ok �̐ݒ胁�\�b�h�B
     * @param Html_Mail_Ok �v���p�e�B Html_Mail_Ok �̐V�����l�B
     */
    public void setHtml_mail_ok(String html_mail_ok) throws IOException {
        this.html_mail_ok = Conv2Sjis( html_mail_ok ) ;
    }
    /** �v���p�e�B Sei_kanji �̎擾���\�b�h�B
     * @param return �v���p�e�B sei_kanji �̒l�B
     */
    public String getSei_kanji() {
        return sei_kanji;
    }
    
    /** �v���p�e�B Sei_Kanji �̐ݒ胁�\�b�h�B
     * @param return �v���p�e�B sei_kanji �̐V�����l�B
     */
    public void setSei_kanji(String sei_kanji) throws IOException {
        this.sei_kanji = Conv2Sjis( sei_kanji ) ;
    }
    
    /** �v���p�e�B Na_kanji �̎擾���\�b�h�B
     * @param return �v���p�e�B na_kanji �̒l�B
     */
    public String getNa_kanji() {
        return na_kanji;
    }
    
    /** �v���p�e�B Na_kanji �̐ݒ胁�\�b�h�B
     * @param return �v���p�e�B na_kanji �̐V�����l�B
     */
    public void setNa_kanji(String na_kanji) throws IOException {
        this.na_kanji = Conv2Sjis( na_kanji ) ;
    }
    
    /** �v���p�e�B Sex �̎擾���\�b�h�B
     * @param return �v���p�e�B sex �̒l�B
     */
    public String getSex() {
        return sex;
    }
    
    /** �v���p�e�B Sex �̐ݒ胁�\�b�h�B
     * @param return �v���p�e�B sex �̐V�����l�B
     */
    public void setSex(String sex) throws IOException {
        this.sex = Conv2Sjis( sex );
    }
    
    /** �v���p�e�B Postal_CdA �̎擾���\�b�h�B
     * @param return �v���p�e�B postal_cda �̒l�B
     */
    public String getPostal_cda() {
        return postal_cda;
    }
    
    /** �v���p�e�B Postal_cda �̐ݒ胁�\�b�h�B
     * @param return �v���p�e�B postal_cda �̐V�����l�B
     */
    public void setPostal_cda(String postal_cda) throws IOException {
        this.postal_cda = Conv2Sjis( postal_cda ) ;
    }
    
    /** �v���p�e�B Postal_cdb �̎擾���\�b�h�B
     * @param return �v���p�e�B postal_cdb �̒l�B
     */
    public String getPostal_cdb() {
        return postal_cdb;
    }
    
    /** �v���p�e�B Postal_cdb �̐ݒ胁�\�b�h�B
     * @param return �v���p�e�B postal_cdb �̐V�����l�B
     */
    public void setPostal_cdb(String postal_cdb) throws IOException {
        this.postal_cdb = Conv2Sjis( postal_cdb ) ;
    }
    
    /** �v���p�e�B address �̎擾���\�b�h�B
     * @return �v���p�e�B address �̒l�B
     */
    public String getAddress() {
        return address;
    }
    
    /** �v���p�e�B address �̐ݒ胁�\�b�h�B
     * @param address �v���p�e�B address �̐V�����l�B
     */
    public void setAddress(String address) throws IOException {
        this.address = Conv2Sjis( address ) ;
    }
    
    /** �v���p�e�B sei_kana �̎擾���\�b�h�B
     * @return �v���p�e�B sei_kana �̒l�B
     */
    public String getSei_kana() {
        return sei_kana;
    }
    
    /** �v���p�e�B sei_kana �̐ݒ胁�\�b�h�B
     * @param sei_kana �v���p�e�B sei_kana �̐V�����l�B
     */
    public void setSei_kana(String sei_kana) throws IOException {
        this.sei_kana = Conv2Sjis( sei_kana ) ;
    }
    
    /** �v���p�e�B na_kana �̎擾���\�b�h�B
     * @return �v���p�e�B na_kana �̒l�B
     */
    public String getNa_kana() {
        return na_kana;
    }
    
    /** �v���p�e�B na_kana �̐ݒ胁�\�b�h�B
     * @param na_kana �v���p�e�B na_kana �̐V�����l�B
     */
    public void setNa_kana(String na_kana) throws IOException {
        this.na_kana = Conv2Sjis( na_kana ) ;
    }
    
    /** �v���p�e�B city_name �̎擾���\�b�h�B
     * @return �v���p�e�B city_name �̒l�B
     */
    public String getCity_name() {
        return city_name;
    }
    
    /** �v���p�e�B city_name �̐ݒ胁�\�b�h�B
     * @param city_name �v���p�e�B city_name �̐V�����l�B
     */
    public void setCity_name(String city_name) throws IOException {
        this.city_name = Conv2Sjis( city_name ) ;
    }
    
    /** �v���p�e�B state_cd �̎擾���\�b�h�B
     * @return �v���p�e�B state_cd �̒l�B
     */
    public String getState_cd() {
        return state_cd;
    }
    
    /** �v���p�e�B state_cd �̐ݒ胁�\�b�h�B
     * @param state_cd �v���p�e�B state_cd �̐V�����l�B
     */
    public void setState_cd(String state_cd) {
        this.state_cd = state_cd;
    }
    
    /** �v���p�e�B tel_no �̎擾���\�b�h�B
     * @return �v���p�e�B tel_no �̒l�B
     */
    public String getTel_no() {
        return tel_no;
    }
    
    /** �v���p�e�B tel_no �̐ݒ胁�\�b�h�B
     * @param tel_no �v���p�e�B tel_no �̐V�����l�B
     */
    public void setTel_no(String tel_no) {
        this.tel_no = tel_no;
    }
    
    /** �v���p�e�B birthmonth �̎擾���\�b�h�B
     * @return �v���p�e�B birthmonth �̒l�B
     */
    public String getBirthmonth() {
        return birthmonth;
    }
    
    /** �v���p�e�B birthmonth �̐ݒ胁�\�b�h�B
     * @param birthmonth �v���p�e�B birthmonth �̐V�����l�B
     */
    public void setBirthmonth(String birthmonth) {
        this.birthmonth = birthmonth;
    }
    
    /** �v���p�e�B birthyear �̎擾���\�b�h�B
     * @return �v���p�e�B birthyear �̒l�B
     */
    public String getBirthyear() {
        return birthyear;
    }
    
    /** �v���p�e�B birthyear �̐ݒ胁�\�b�h�B
     * @param birthyear �v���p�e�B birthyear �̐V�����l�B
     */
    public void setBirthyear(String birthyear) {
        this.birthyear = birthyear;
    }
    

	/**
	 * Returns the throwflg.
	 * @return String
	 */
	public String getThrowflg() {
		return throwflg;
	}

	/**
	 * Sets the throwflg.
	 * @param throwflg The throwflg to set
	 */
	public void setThrowflg(String throwflg) {
		this.throwflg = throwflg;
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
		//System.err.println( this.error_comm.size() );
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
	/**
	 * Returns the user_id.
	 * @return int
	 */
	public int getUser_id() {
		return user_id;
	}

	/**
	 * Sets the user_id.
	 * @param user_id The user_id to set
	 */
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public void setUser_id(String user_id) {
		try{
			this.user_id = Integer.parseInt( user_id );
		}catch(Exception ex){	ex.printStackTrace();	}
	}
	public void setUserProfile( User us ){
		User_Tbl usertbl = us.getUser();
		Profile profile = us.getProfile();
		this.user_id = usertbl.getUSER_ID();
		this.e_mail = usertbl.getE_MAIL();
		this.html_mail_ok = "1";
		this.sei_kanji = profile.getSEI_KANJI();
		this.sei_kana = profile.getSEI_KANA();
		this.na_kanji = profile.getNA_KANJI();
		this.na_kana = profile.getNA_KANA();
		this.sex = "" + profile.getSEX() + "";
		this.postal_cda = profile.getPOSTAL_CD().substring(0, 3);
		this.postal_cdb = profile.getPOSTAL_CD().substring( 3 );
		this.state_cd = "" + profile.getSTATE_CD() + "";
		this.city_name = profile.getCITY_NAME();
		this.address = profile.getADDRESS();
		this.tel_no = profile.getTEL_NO();
		String birth = "" + profile.getBIRTH_DAY() + "";
		if( birth.length() == 6 ){
			this.birthyear = birth.substring(0, 4);
			this.birthmonth = birth.substring( 4 );
		}
	}
}
