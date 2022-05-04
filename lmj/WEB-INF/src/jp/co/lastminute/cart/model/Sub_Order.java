/*
 * SubOrderModel.java
 *
 * Created on 2002/03/31, 23:08
 */

package jp.co.lastminute.cart.model;

import java.io.*;
import jp.co.yobrain.util.ParseFormat;
import jp.co.lastminute.cart.members.*;

import jp.co.lastminute.cart.prop.*;
import jp.co.lastminute.cart.Constants;

/**
 *
 * @author  skondo
 * @version 
 */
public class Sub_Order implements Serializable{
    /**
    SUB_ORDER_NO       NUMBER(10, 0)     NOT NULL,
    ORDER_NO           NUMBER(10, 0),
    PRODUCT_TYPE_CD    NUMBER(10, 0)     NOT NULL,
    ORDER_XSL_FILE     VARCHAR2(80)
    PROD_CD            CHAR(10),
    AGT_CD             CHAR(4)           NOT NULL,
    TITLE              VARCHAR2(30),
    BUY_PROP           VARCHAR2(2000),
    GUARANTEE_FLG      NUMBER(1, 0),
    PRICE              NUMBER(10, 0)     NOT NULL,
    AGENT_ACTION_URL   VARCHAR2(256)
    MAKE_DATE          DATE,
    DEL_FLG            NUMBER(1, 0),
     */
    private int SUB_ORDER_NO;
    private int ORDER_NO;
    private String AGT_ORDER_NO;
    private int PRODUCT_TYPE_CD;
    private String ORDER_XSL_FILE;
    private String PROD_CD;
    private String AGT_PLAN_CD;
    private String AGT_PROD_CD;
    private String AGR_AREA_CD;
    private String AGT_CD;
    private String TITLE;
    private String BUY_PROP;
    private int GUARANTEE_FLG;
    private int PRICE;
    private String AGENT_ACTION_URL;
    private String MAKE_DATE;
    private int DEL_FLG;
    private long LAST_SALE;
    private long END_SALE;
    ////
    private String SALES_DATE;
    ////
    private String authnumber = "";
    ////
    private String sessionid = "";
    private int pax = 1;
    private int adult = 0;
    private int child = 0;
    private int infant = 0;
    private String etc = "";
   	//
   	private int sending = 0;
   	private int sending_tax = 0;
   	private int tax = 0;
   	//
   	private int sending_calc_unit = 0;
	//
	private int fax = 0;
    public int status;
    //
    public int sheat = 0;
    //
    private Object actionclass = null;
    //
    private Node member = null;
    private boolean booking = false;
    private String returnXmlStr = "";
    
    private ParseFormat pf = null;
    /** �R���X�g���N�^ */ 
    public Sub_Order() {
        SUB_ORDER_NO = 0;
        ORDER_NO = 0;
        AGT_ORDER_NO = "";
        PRODUCT_TYPE_CD = 0;
        ORDER_XSL_FILE = "";
        PROD_CD = "";
        AGT_PLAN_CD = "";
        AGT_PROD_CD = "";
        AGR_AREA_CD = "";
        AGT_CD = "";
        TITLE = "";
        BUY_PROP = "";
        GUARANTEE_FLG = 0;
        PRICE = 0;
        AGENT_ACTION_URL = "";
        LAST_SALE = 0;
        END_SALE  = 0;
        MAKE_DATE = "";
        //////////
        SALES_DATE = "";
        status = 0;
        ///////////
        sending = 0;
   		sending_tax = 0;
   		tax = 0;
        
        etc = "";
        sessionid = "";
        pax = 1;
    }
    /**
     * �����N�X�g�����O
     */
    public String getLinkStr( Order orders ){
    	try{
	    	if((this.getStatus() < Constants.NOT_CONFIRM_ )
	    	&&( this.getActionclass() != null ) 
	    	&&( ((Navigato)this.getActionclass()).isThrow() == Constants.IS_THROW_NG )){
	    		return "<A HREF='/lmj/cart/CartIn.do;jsessionid=" + sessionid
	    				+ "?previewflg="+Constants.STEP01
	    				+ "&order_NO="+ orders.getORDER_NO()
	    				+ "&sub_order_no=" + this.getSUB_ORDER_NO()
	    				+ "&action_type=" + Constants.CANCELL
						+ "&throwflg=" + Constants.STEP01_CANCELL
						+ "&product_type_cd=" + this.getPRODUCT_TYPE_CD()
						+ "&agtcode=" + this.getAGT_CD() + "'>"
						+ "<img src='/img/icon_stop.gif' alt='�L�����Z��' width='10' height='10' border='0'/></A>";
	    	}
    	}catch(Exception ex){	ex.printStackTrace();	}
    	return "";	
    }
    public int getPrices(){
        return this.pax * this.PRICE;
    }
    /**
     * �T�u�I�[�_�[��ێ�����
     * @param int suborderno
     */
    synchronized public void setSUB_ORDER_NO(int suborderno){
        this.SUB_ORDER_NO = suborderno;
    }
    /**
     * �I�[�_�[NO��ێ�����
     * @param int orderno
     */
    synchronized public void setORDER_NO(int orderno){
        this.ORDER_NO = orderno;
    }
    /**
     * ���i��ʃR�[�h��ێ�����
     * @param int producttypecd
     */
    synchronized public void setPRODUCT_TYPE_CD(int producttypecd){
        this.PRODUCT_TYPE_CD = producttypecd;
    }
    /**
     * �I�[�_�[XSL�t�@�C����ێ�����
     * @param String orderxslfile
     */
    synchronized public void setORDER_XSL_FILE(String orderxslfile){
        this.ORDER_XSL_FILE = orderxslfile;
    }
    /**
     * ���i�R�[�h��ێ�����
     * @param String prodcd
     */
    synchronized public void setPROD_CD(String prodcd){
        this.PROD_CD = prodcd;
    }
    /** 
     * �G�[�W�F���g���i�R�[�h��ێ�
     * @param String agtprodcd
     */
    synchronized public void setAGT_PROD_CD(String agtprodcd){
        this.AGT_PROD_CD = agtprodcd;
    }
    /**
     * �G�[�W�F���g�R�[�h��ێ�
     * @param String agtcd
     */
    synchronized public void setAGT_CD(String agtcd){
        this.AGT_CD = agtcd;
    }
    /**
     * �^�C�g�����擾
     * @param String title
     */
    synchronized public void setTITLE(String title){
        this.TITLE = title;
    }
    /**
     * �w����������ێ�����
     * @param String buyprop
     */
    synchronized public void setBUY_PROP(String buyprop){
        this.BUY_PROP = buyprop;
    }
    /**
     * �M�������e�B�t���O��ێ�����
     * @param int guaanteeflg
     */
    synchronized public void setGUARANTEE_FLG(int guaanteeflg){
        this.GUARANTEE_FLG = guaanteeflg;
    }
    /**
     * ���i��ێ�����
     * @param int price
     */
    synchronized public void setPRICE(int price){
        this.PRICE = price;
    }
    /**
     * �G�[�W�F���g�A�N�V����URL
     * @param String agetactionurl
     */
    synchronized public void setAGENT_ACTION_URL(String agetactionurl){
        this.AGENT_ACTION_URL = agetactionurl;
    }
    /**
     * ������ێ�����
     * @param String agent_action_url
     */
    synchronized public void setMAKE_DATE(String agent_action_url){
        this.AGENT_ACTION_URL = agent_action_url;
    }
    /**
     * �폜�t���O��ێ�����
     * @param int delflg
     */
    synchronized public void setDEL_FLG(int delflg){
        this.DEL_FLG = delflg;
    }
    /**
     * ��d���������擾����
     * @param int lastsale
     */
    synchronized public void setLAST_SALE(long lastsale){
        this.LAST_SALE = lastsale;
    }
    /**
     * �I�[�_�[NO���擾����
     * @return int SUB_ORDER_NO
     */
    public int getSUB_ORDER_NO(){
        try{
            return this.SUB_ORDER_NO;
        }catch(Exception e){    return 0;   }
    }
    /**
     * �I�[�_�[No���擾����
     * @return int ORDER_NO
     */
    public int getORDER_NO(){
        try{
            return this.ORDER_NO;
        }catch(Exception e){    return 0;   }
    }
    /**
     * ���i��ʂ��擾����
     * @return int PRODUCT_TYPE_CD
     */
    public int getPRODUCT_TYPE_CD(){
        try{
            return this.PRODUCT_TYPE_CD;
        }catch(Exception e){    return 0;   }
    }
    /**
     * �I�[�_�[XSL�t�@�C�����擾����
     * @return String ORDER_XSL_FIlE
     */
    public String getORDER_XSL_FILE(){
        try{
            return this.ORDER_XSL_FILE;
        }catch(Exception e){    return "";   }
    }
    /**
     * ���i�R�[�h���擾����
     * @return String PROD_CD
     */
    public String getPROD_CD(){
        try{
            return this.PROD_CD;
        }catch(Exception e){    return "";   }
    }
    /**
     * �G�[�W�F���g���i�R�[�h���擾
     * @return String AGT_PROD_CD
     */
    public String getAGT_PROD_CD(){
        try{
            return this.AGT_PROD_CD;
        }catch(Exception e){    return "";   }
    }
    /**
     * �G�[�W�F���g�R�[�h���擾
     * @return String AGT_CD
     */
    public String getAGT_CD(){
        try{
            return this.AGT_CD;
        }catch(Exception e){    return "";   }
    }
    /**
     * ���i�����擾
     * @return String TITLE
     */
    public String getTITLE(){
        try{
            return this.TITLE;
        }catch(Exception e){    return "";   }
    }
    /**
     * �w���������
     * @return String BUY_PROP
     */
    public String getBUY_PROP(){
        try{
            return this.BUY_PROP;
        }catch(Exception e){    return "";   }
    }
    /**
     * �M�������e�B�t���O���擾����
     * @return int GUARANTEE_FLG
     */
    public int getGUARANTEE_FLG(){
        try{
            return this.GUARANTEE_FLG;
        }catch(Exception e){    return 0;   }
    }
    /**
     * ���i���擾����
     * @return int PRICE
     */
    public int getPRICE(){
        try{
            return this.PRICE;
        }catch(Exception e){    return 0;   }
    }
    /**
     * �G�[�W�F���g�A�N�V����URL
     * @return AGENT_ACATION_URL
     */
    public String getAGENT_ACTION_URL(){
        try{
            return this.AGENT_ACTION_URL;
        }catch(Exception e){    return "";   }
    }
    /**
     * �쐬�����擾����
     * @return String MAKE_DATE
     */
    public String getMAKE_DATE(){
        try{
            return this.MAKE_DATE;
        }catch(Exception e){    return "";   }
    }
    /**
     * �폜�t���O���擾����
     * @return int DEL_FLG
     */
    public int getDEL_FLG(){
        try{
            return this.DEL_FLG;
        }catch(Exception e){    return 0;   }
    }
    /**
     * ��d���������擾����
     * @return int LAST_SALE
     */
    public long getLAST_SALE(){
        try{
            return this.LAST_SALE;
        }catch(Exception e){    return 0;   }
    }
    /**
     * �n�C�t���Ȃ�
     */
    public String getPROD_CDdel(){
        String newStr = "";
        String oldStr = this.getPROD_CD();
        StringBuffer sb = new StringBuffer();
        for(int i=0; i<oldStr.length(); i++){
            char ch = oldStr.charAt(i);
            if(ch != '-'){      sb.append( ch );    }
        }
        newStr = sb.toString();
        return newStr;
    }
    /**
     * XML�o��
     */
    public synchronized String getXMLdocument() {
        String xmldoc = "<SUB_ORDER_NO>" + this.getSUB_ORDER_NO() + "</SUB_ORDER_NO>\n"
                      + "<ORDER_XSL_FILE>" + this.getORDER_XSL_FILE() + "</ORDER_XSL_FILE>\n"
                      + "<AGT_ORDER_NO><![CDATA[" + this.getAGT_ORDER_NO() + "]]></AGT_ORDER_NO>\n"
                      + "<ORDER_NO>" + this.getORDER_NO() + "</ORDER_NO>\n"
                      + "<PRODUCT_TYPE_CD>" + this.getPRODUCT_TYPE_CD() + "</PRODUCT_TYPE_CD>\n"
                      + "<AGT_CD>" + this.getAGT_CD() + "</AGT_CD>\n"
                      + "<PROD_CD>" + this.getPROD_CD() + "</PROD_CD>\n"
                      + "<PROD_CD_B>" + this.getPROD_CDdel() + "</PROD_CD_B>\n"
                      + "<AGT_PROD_CD><![CDATA[" + this.getAGT_PROD_CD() + "]]></AGT_PROD_CD>\n"
                      + "<AGT_PLAN_CD><![CDATA[" + this.getAGT_PLAN_CD() + "]]></AGT_PLAN_CD>\n"
                      + "<AGR_AREA_CD>" + this.getAGR_AREA_CD() + "</AGR_AREA_CD>\n"
                      + "<TITLE><![CDATA[" + this.getTITLE() + "]]></TITLE>"
                      + "<GUARANTEE_FLG>" + this.getGUARANTEE_FLG() + "</GUARANTEE_FLG>\n"
                      + "<PRICE>" + this.getPRICE() + "</PRICE>\n"
                      + "<PRICE_STR>" + pf.ToPriceFormat(this.getPRICE()) + "</PRICE_STR>\n"
                      + "<AGENT_ACTION_URL>" + this.getAGENT_ACTION_URL() + "</AGENT_ACTION_URL>\n"
                      + "<MAKE_DATE>" + this.getMAKE_DATE() + "</MAKE_DATE>\n"
                      + "<LAST_SALE>" + this.getLAST_SALE() + "</LAST_SALE>\n"
                      + "<END_SALE>" + this.getEND_SALE() + "</END_SALE>\n"
                      + "<SENDING>" + this.sending + "</SENDING>\n"
					  + "<SENDING_TAX>" + this.sending_tax + "</SENDING_TAX>\n"
					  + "<TAX>" + this.tax + "</TAX>\n"
					  + "<FAX>" + this.fax + "</FAX>\n"
					  + "<PAX>" + this.pax + "</PAX>\n"
					  + "<ADLUT>" + this.adult + "</ADLUT>\n"
					  + "<CHILD>" + this.child + "</CHILD>\n"
					  + "<INFANT>" + this.infant + "</INFANT>\n"
					  + "<SHEAT><![CDATA[" + this.sheat	+ "]]></SHEAT>\n"
					  + "<SESSION_ID><![CDATA[" + this.sessionid + "]]></SESSION_ID>\n"
                      + "<BUY_PROP>" + this.getBUY_PROP() + "</BUY_PROP>\n"
                      + "<CARD>" + this.authnumber + "</CARD>\n"
                      + getMemberStr() + "\n";
        return xmldoc;
    }
    public String getMemberStr(){
    	String memberxml = "";
    	if( this.member != null ){
    		memberxml = this.member.getXmlString();
    	}
    	return memberxml;
    }
    /** �v���p�e�B status �̎擾���\�b�h�B
     * @return �v���p�e�B status �̒l�B
     */
    public int getStatus() {
        return status;
    }
    
    /** �v���p�e�B status �̐ݒ胁�\�b�h�B
     * @param status �v���p�e�B status �̐V�����l�B
     */
    public void setStatus(int status) {
        this.status = status;
    }
    
    /** �v���p�e�B AGT_ORDER_NO �̎擾���\�b�h�B
     * @return �v���p�e�B AGT_ORDER_NO �̒l�B
     */
    public String getAGT_ORDER_NO() {
        return AGT_ORDER_NO;
    }
    
    /** �v���p�e�B AGT_ORDER_NO �̐ݒ胁�\�b�h�B
     * @param AGT_ORDER_NO �v���p�e�B AGT_ORDER_NO �̐V�����l�B
     */
    public void setAGT_ORDER_NO(String AGT_ORDER_NO) {
        this.AGT_ORDER_NO = AGT_ORDER_NO;
    }
    
    /** �v���p�e�B AGT_PLAN_CD �̎擾���\�b�h�B
     * @return �v���p�e�B AGT_PLAN_CD �̒l�B
     */
    public String getAGT_PLAN_CD() {
        return AGT_PLAN_CD;
    }
    
    /** �v���p�e�B AGT_PLAN_CD �̐ݒ胁�\�b�h�B
     * @param AGT_PLAN_CD �v���p�e�B AGT_PLAN_CD �̐V�����l�B
     */
    public void setAGT_PLAN_CD(String AGT_PLAN_CD) {
        this.AGT_PLAN_CD = AGT_PLAN_CD;
    }
    
    /** �v���p�e�B AGR_AREA_CD �̎擾���\�b�h�B
     * @return �v���p�e�B AGR_AREA_CD �̒l�B
     */
    public String getAGR_AREA_CD() {
        return AGR_AREA_CD;
    }
    
    /** �v���p�e�B AGR_AREA_CD �̐ݒ胁�\�b�h�B
     * @param AGR_AREA_CD �v���p�e�B AGR_AREA_CD �̐V�����l�B
     */
    public void setAGR_AREA_CD(String AGR_AREA_CD) {
        this.AGR_AREA_CD = AGR_AREA_CD;
    }
    
    /** �v���p�e�B sessionid �̎擾���\�b�h�B
     * @return �v���p�e�B sessionid �̒l�B
     */
    public String getSessionid() {
        return sessionid;
    }
    
    /** �v���p�e�B sessionid �̐ݒ胁�\�b�h�B
     * @param sessionid �v���p�e�B sessionid �̐V�����l�B
     */
    public void setSessionid(String sessionid) {
        this.sessionid = sessionid;
    }
    
    /** �v���p�e�B pax �̎擾���\�b�h�B
     * @return �v���p�e�B pax �̒l�B
     */
    public int getPax() {
        return pax;
    }
    
    /** �v���p�e�B pax �̐ݒ胁�\�b�h�B
     * @param pax �v���p�e�B pax �̐V�����l�B
     */
    public void setPax(int pax) {
        this.pax = pax;
    }
    
    /** �v���p�e�B etc �̎擾���\�b�h�B
     * @return �v���p�e�B etc �̒l�B
     */
    public String getEtc() {
        return etc;
    }
    
    /** �v���p�e�B etc �̐ݒ胁�\�b�h�B
     * @param etc �v���p�e�B etc �̐V�����l�B
     */
    public void setEtc(String etc) {
        this.etc = etc;
    }
    
	/**
	 * Returns the sending.
	 * @return int
	 */
	public int getSending() {
		return sending;
	}

	/**
	 * Returns the sending_tax.
	 * @return int
	 */
	public int getSending_tax() {
		return sending_tax;
	}

	/**
	 * Returns the tax.
	 * @return int
	 */
	public int getTax() {
		return tax;
	}

	/**
	 * Sets the sending.
	 * @param sending The sending to set
	 */
	public void setSending(int sending) {
		this.sending = sending;
	}

	/**
	 * Sets the sending_tax.
	 * @param sending_tax The sending_tax to set
	 */
	public void setSending_tax(int sending_tax) {
		this.sending_tax = sending_tax;
	}

	/**
	 * Sets the tax.
	 * @param tax The tax to set
	 */
	public void setTax(int tax) {
		this.tax = tax;
	}
	/**
	 *  ���[�e�B���e�B�n
	 */
	public static String convBuyProp(String str){
        String addbuyprop = "";
        try{
            int start = str.indexOf("<BUY_PROP>");
            int end = str.indexOf("</BUY_PROP>");
            if(( start == -1 )&&( end == -1 )) {
                addbuyprop = str;
            }else if(( start != -1 )&&( end != -1 )){
                addbuyprop = str.substring(start + 10, end );
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return addbuyprop;
    }
	/**
	 * Returns the fax.
	 * @return int
	 */
	public int getFax() {
		return fax;
	}

	/**
	 * Sets the fax.
	 * @param fax The fax to set
	 */
	public void setFax(int fax) {
		this.fax = fax;
	}

	/**
	 * Returns the member.
	 * @return Node
	 */
	public Node getMember() {
		return member;
	}

	/**
	 * Sets the member.
	 * @param member The member to set
	 */
	public void setMember(Node member) {
		this.member = member;
	}

	/**
	 * Returns the actionclass.
	 * @return Object
	 */
	public Object getActionclass() {
		return actionclass;
	}

	/**
	 * Sets the actionclass.
	 * @param actionclass The actionclass to set
	 */
	public void setActionclass(Object actionclass) {
		this.actionclass = actionclass;
	}

	/**
	 * Returns the child.
	 * @return int
	 */
	public int getChild() {
		return child;
	}

	/**
	 * Returns the infant.
	 * @return int
	 */
	public int getInfant() {
		return infant;
	}

	/**
	 * Sets the child.
	 * @param child The child to set
	 */
	public void setChild(int child) {
		this.child = child;
	}

	/**
	 * Sets the infant.
	 * @param infant The infant to set
	 */
	public void setInfant(int infant) {
		this.infant = infant;
	}

	/**
	 * Returns the adult.
	 * @return int
	 */
	public int getAdult() {
		return adult;
	}

	/**
	 * Sets the adult.
	 * @param adult The adult to set
	 */
	public void setAdult(int adult) {
		this.adult = adult;
	}

	/**
	 * Returns the eND_SALE.
	 * @return double
	 */
	public long getEND_SALE() {
		return END_SALE;
	}

	/**
	 * Sets the eND_SALE.
	 * @param eND_SALE The eND_SALE to set
	 */
	public void setEND_SALE(long eND_SALE) {
		END_SALE = eND_SALE;
	}

	/**
	 * Returns the sALES_DATE.
	 * @return String
	 */
	public String getSALES_DATE() {
		return SALES_DATE;
	}

	/**
	 * Sets the sALES_DATE.
	 * @param sALES_DATE The sALES_DATE to set
	 */
	public void setSALES_DATE(String sALES_DATE) {
		SALES_DATE = sALES_DATE;
	}

	/**
	 * Returns the sheat.
	 * @return int
	 */
	public int getSheat() {
		return sheat;
	}

	/**
	 * Sets the sheat.
	 * @param sheat The sheat to set
	 */
	public void setSheat(int sheat) {
		this.sheat = sheat;
	}

	/**
	 * Returns the sending_calc_unit.
	 * @return int
	 */
	public int getSending_calc_unit() {
		return sending_calc_unit;
	}

	/**
	 * Sets the sending_calc_unit.
	 * @param sending_calc_unit The sending_calc_unit to set
	 */
	public void setSending_calc_unit(int sending_calc_unit) {
		this.sending_calc_unit = sending_calc_unit;
	}

	/**
	 * Returns the booking.
	 * @return boolean
	 */
	public boolean isBooking() {
		return booking;
	}

	/**
	 * Sets the booking.
	 * @param booking The booking to set
	 */
	public void setBooking(boolean booking) {
		this.booking = booking;
	}

	/**
	 * Returns the returnXmlStr.
	 * @return String
	 */
	public String getReturnXmlStr() {
		return returnXmlStr;
	}

	/**
	 * Sets the returnXmlStr.
	 * @param returnXmlStr The returnXmlStr to set
	 */
	public void setReturnXmlStr(String returnXmlStr) {
		this.returnXmlStr = returnXmlStr;
	}

	/**
	 * Returns the authnumber.
	 * @return String
	 */
	public String getAuthnumber() {
		return authnumber;
	}

	/**
	 * Sets the authnumber.
	 * @param authnumber The authnumber to set
	 */
	public void setAuthnumber(String authnumber) {
		this.authnumber = authnumber;
	}
}
