/*
 * CardAuth.java
 *
 * Created on 2002/03/31, 23:12
 */

package jp.co.lastminute.cart.model;

import java.io.*;
/**
 *
 * @author  skondo
 * @version 
 */
public class Card_Auth implements Serializable{
    /**
    ORDER_NO        NUMBER(10, 0)    NOT NULL,
    CARD_NO         VARCHAR2(16),
    EXPIRE          CHAR(4),
    FIRST_NAME      VARCHAR2(30),
    LAST_NAME       VARCHAR2(30),
    MAKE_DATE       DATE,
    UP_DATE         DATE,
    */
    private int Order_No;
    private String Card_No;
    private String Expire;
    private String First_Name;
    private String Last_Name;
    private String Card_type;
    private String Auth_Code;
    private int sub_order_no;
    private int Make_Date;
    private int Up_Date;
  
    /** �R���X�g���N�^ */
   public Card_Auth() {
        this.Order_No   = 0;;
        this.Card_No    = "";
        this.Expire     = "";
        this.First_Name = "";
        this.Last_Name  = "";
        this.Card_type = "";
        this.Auth_Code = "";
        this.sub_order_no = 0;
        this.Make_Date  = 0;
        this.Up_Date = 0;
    }
    /**
     * �I�[�_�[No��ێ�����B
     * @param int order_no
     */
    public void  setOrder_No( int order_No ){
        this.Order_No = order_No;
    }
    /**
     * �J�[�hNo��ێ�����
     * @param String card_No
     */
    public void  setCard_No( String card_No ){
        this.Card_No = card_No;
    }
    /**
     * �L��������ێ�����B
     * @param String expire
     */
    public void setExpire( String expire ){
        this.Expire = expire;
    }
    /**
     * �t�@�[�X�g�l�[����ێ�����B
     * @param String first_Name
     */
    public void setFirst_Name( String first_Name ){
        this.First_Name = first_Name;
    }
    /**
     * ���X�g�l�[����ێ�����B
     * @param String last_Name
     */
    public void setLast_Name( String last_Name ){
        this.Last_Name = last_Name;
    }
    /**
     * �쐬����ێ�����
     * @param int make_Date
     */
    public void setMake_Date( int make_Date ){
        this.Make_Date = make_Date;
    }
    /**
     * �C������ێ�����
     * @param int up_Date
     */
    public void setUp_Date( int up_Date ){
        this.Up_Date = up_Date;
    }
    /**
     * �I�[�_�[���擾����
     */
    public int getOrder_No(){
        try{
            return this.Order_No;
         }catch(Exception ex){}
        return 0;
    }
    /**
     * �J�[�hNO���擾����
     */
    public String getCard_No(){
        try{
            return this.Card_No;
        }catch(Exception ex){}
        return "";
    }
    /**
     * �L���������擾����
     */
    public String getExpire(){
        try{
            return this.Expire;
        }catch(Exception ex){}
        return "";
    }
    /**
     * �t�@�[�X�g�l�[�����擾����B
     */
    public String getFirst_Name(){
        try{
            return this.First_Name;
        }catch(Exception ex){}
        return "";
    }
    /**
     * ���X�g�l�[�����擾����
     */
    public String getLast_Name(){
        try{
            return this.Last_Name;
        }catch(Exception ex){}
        return "";
    }
    /**
     * �쐬�����擾����
     */
    public int getMake_Date(){
        try{
            return this.Make_Date;
        }catch(Exception ex){}
        return 0;    
    }
    /**
     * �C�������擾����
     */
    public int getUp_Date(){
        try{
            return this.Up_Date;
        }catch(Exception ex){}
        return 0;
    }
    /** �v���p�e�B Card_type �̎擾���\�b�h�B
     * @return �v���p�e�B Card_type �̒l�B
     */
    public String getCard_type() {
        try{
            return Card_type;
        }catch(Exception ex){}
        return "";
    }
    
    /** �v���p�e�B Card_type �̐ݒ胁�\�b�h�B
     * @param Card_type �v���p�e�B Card_type �̐V�����l�B
     */
    public void setCard_type(String Card_type) {
        this.Card_type = Card_type;
    }
    
    /** �v���p�e�B Auth_Code �̎擾���\�b�h�B
     * @return �v���p�e�B Auth_Code �̒l�B
     */
    public String getAuth_Code() {
        try{
            return Auth_Code;
        }catch(Exception ex){}
        return "";
    }
    
    /** �v���p�e�B Auth_Code �̐ݒ胁�\�b�h�B
     * @param Auth_Code �v���p�e�B Auth_Code �̐V�����l�B
     */
    public void setAuth_Code(String Auth_Code) {
        this.Auth_Code = Auth_Code;
    }
    public synchronized String getXMLdocument(){
        String xmldoc = "<CARD>" + this.getAuth_Code() + "</CARD>\n";
        return xmldoc;
    }
	/**
	 * Returns the sub_order_no.
	 * @return int
	 */
	public int getSub_order_no() {
		return sub_order_no;
	}

	/**
	 * Sets the sub_order_no.
	 * @param sub_order_no The sub_order_no to set
	 */
	public void setSub_order_no(int sub_order_no) {
		this.sub_order_no = sub_order_no;
	}

}
