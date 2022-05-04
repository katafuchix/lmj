/*
 * dbAdapter.java
 *
 * Created on 2002/03/31, 22:41
 */

package jp.co.lastminute.cart.jdbc;

import java.io.*;
import java.util.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import jp.co.yobrain.util.*;
import jp.co.yobrain.util.jdbc.JdbcAdapter;
import jp.co.lastminute.cart.*;
import jp.co.lastminute.cart.model.*;
import jp.co.lastminute.common.jdbc.CommonCityCarrier;

/**
 *
 * @author  skondo
 * @version 
 */
public class dbAdapterSubOrder implements Serializable{
    private DataSource ds;
    /**
     * �R���X�g���N�^�[
     */
    public dbAdapterSubOrder(){
    }
    public dbAdapterSubOrder( DataSource dss ){
        this.ds = dss;
    }
    /**
     * ���X�g�T�u�I�[�_�[�̎擾
     *�@CREATE�@SEQUENCE�@SUB_ORDER_NO
     */
    synchronized public int getSubOrderNO(){
        JdbcAdapter db = new JdbcAdapter();
        try{
        if( db.init(ds) ){
            Vector vc = db.dbSelect( "SELECT SUB_ORDER_NO.NEXTVAL FROM DUAL" );
            dbDataAccesser dba = new dbDataAccesser( vc );
            return dba.getDatabyInt(0,0);
        }
        }catch(Exception ex){}
        return -1;
    }
    /**
     * �T�u�I�[�_�[SQL�̏o��
     * 
     */
    synchronized public String addSubOrderStr( Sub_Order so ) throws Exception{ 
    	return "INSERT INTO SUB_ORDER( "
            	+ " SUB_ORDER_NO, "
                + " ORDER_NO, " 
                + " AGT_ORDER_NO, "
                + " ORDER_XSL_FILE, "
                + " PRODUCT_TYPE_CD, "
                + " PROD_CD, "
                + " AGT_PROD_CD, "
                + " AGT_CD, "
                + " TITLE, "
                + " BUY_PROP, "
                + " GUARANTEE_FLG, "
                + " PRICE, "
                + " LAST_SALE, "
                + " STATUS, "
                + " DEL_FLG, "
				+ " MAKE_DATE, "
				+ " SESSION_ID, PAX, "
				+ " SALES_DATE, INFANT, SHEAT ) "
                + " VALUES ( "
                + so.getSUB_ORDER_NO() + " , "
                +  so.getORDER_NO() + " , "
                + " '" + so.getAGT_ORDER_NO() + "', "
                + " '" + so.getORDER_XSL_FILE() + "', "
                + so.getPRODUCT_TYPE_CD() + " , "
                + " '" + so.getPROD_CD() + "', "
                + " '" + so.getAGT_PROD_CD() + "', "
                + " '" + so.getAGT_CD() + "', "
                + " '" + getparseString( so.getTITLE() ) + "', "
                + " '" + so.getBUY_PROP() + "', "
                + so.getGUARANTEE_FLG() + ", "
                + so.getPRICE() + ", "
                + so.getLAST_SALE() + ", "
                + so.getStatus() + ", "
                + so.getDEL_FLG() + ", "
                + " SYSDATE, '" + so.getSessionid() + "', " + so.getPax() + ", '"
                + so.getSALES_DATE() + "', "+ so.getInfant() +", " + so.getSheat() + ") ";
    }
    /**
     * �T�u�I�[�_�[�ǉ�
     * @param Sub_Order so
     * @param DataSource ds
     * @return boolean true/false
     */
    synchronized public boolean addSubOrder( Sub_Order so ){    
        int orderNo;
        //SQL���𐶐�
        String SQL = "";
        try{
            SQL = addSubOrderStr( so );
        }catch(Exception ex){   ex.printStackTrace();   }
        ///JDBCAdapter�N��
        System.err.println( SQL );
        JdbcAdapter db = new JdbcAdapter();
        if( db.init(ds) ){
        	return db.dbUpdate( SQL );
        }
        return false;
    }
    /**
     * �T�u�I�[�_�[�̃��f�B�t�@�C
     * @param Sub_Order so
     * @param DataSource ds
     * @return boolean true/false
     */
    synchronized public boolean modifySubOrder( Sub_Order so , boolean flg){
        //SQL���𐶐�
        String SQL = "";
        try{
            int fg = 0;
            if( flg ){  fg = 1;     }
            SQL = " UPDATE SUB_ORDER SET DEL_FLG=" + fg + " WHERE SUB_ORDER_NO="+ so.getSUB_ORDER_NO();        
        }catch(Exception ex){   
            ex.printStackTrace();
            return false;
        
        }
        // Update 
        System.err.println( SQL );
        JdbcAdapter db = new JdbcAdapter();
        if( db.init(ds) ){
            if( db.dbUpdate( SQL ) ){
                return true;
            }
        }
        return false;
    }
    /**
     * SQL�̏o��
     */
    synchronized public String modifySubOrderStatusStr( Sub_Order so ) throws Exception {
    	return "UPDATE SUB_ORDER SET STATUS=" + so.getStatus() + " WHERE SUB_ORDER_NO=" + so.getSUB_ORDER_NO(); 
    }
    /**
     * �X�e�[�^�X�̕ύX
     */
    synchronized public boolean modifySubOrderStatus( Sub_Order so ){
        //SQL���𐶐�
        String SQL = "";
        try{
            SQL = modifySubOrderStatusStr( so );      
        }catch(Exception ex){   
            ex.printStackTrace();
            return false;
        
        }
        // Update 
        System.err.println( SQL );
        JdbcAdapter db = new JdbcAdapter();
        if( db.init(ds) ){
            if( db.dbUpdate( SQL ) ){
                return true;
            }
        }
        return false;
    }
    /**
     * �X�e�[�^�X�̕ύX�ƃG�[�W�F���g����NO�̓o�^
     */
    synchronized public boolean modifySubOrderAgtOrderNo( Sub_Order so ){
        //SQL���𐶐�
        String SQL = "";
        try{
            SQL = " UPDATE SUB_ORDER SET "
            	+ " AGT_ORDER_NO='" + so.getAGT_ORDER_NO() + "', "
            	+ " STATUS=" + so.getStatus() + " WHERE SUB_ORDER_NO="+ so.getSUB_ORDER_NO();
        }catch(Exception ex){   
            ex.printStackTrace();
            return false;
        
        }
        // Update 
        System.err.println( SQL );
        JdbcAdapter db = new JdbcAdapter();
        if( db.init(ds) ){
            if( db.dbUpdate( SQL ) ){
                return true;
            }
        }
        return false;
    }
    /**
     * 
     */
    synchronized public String modifySubOrderStr( Sub_Order so ) throws Exception{
    	return "UPDATE SUB_ORDER SET "
                + " ORDER_NO="+ so.getORDER_NO() + ", " 
                + " AGT_ORDER_NO='" + so.getAGT_ORDER_NO() + "', "
                + " BUY_PROP='" + so.getBUY_PROP() + "', "
                + " MEMBERS='" + so.getMemberStr() + "', "
                + " STATUS=" + so.getStatus() +", "
				+ " PAX=" + so.getPax() 
                + " WHERE SUB_ORDER_NO="+ so.getSUB_ORDER_NO(); 
    }
    /**
     * �T�u�I�[�_�[�̍X�V���f�B�t�@�C
     */
    synchronized public String modifySubOrderBuyPropStr( Sub_Order so ) throws Exception{
    	return "UPDATE SUB_ORDER SET BUY_PROP='" + so.getBUY_PROP() + "'  WHERE SUB_ORDER_NO="+ so.getSUB_ORDER_NO(); 
    }
    /**
     * �T�u�I�[�_�[�̃��f�B�t�@�C
     * @param Sub_Order so
     * @param DataSource ds
     * @return boolean true/false
     */
    synchronized public boolean modifySubOrderBuyProp( Sub_Order so ){
        //SQL���𐶐�
        String SQL = "";
        try{
            SQL =  modifySubOrderBuyPropStr( so );       
        }catch(Exception ex){   
            ex.printStackTrace();
            return false;
        
        }
        System.err.println( SQL );
        // Update 
        JdbcAdapter db = new JdbcAdapter();
        if( db.init(ds) ){
            if( db.dbUpdate( SQL ) ){
                return true;
            }
        }
        return false;
    }
    /**
     * �L�����Z���N�G���[�̎擾
     */
    synchronized public String removeSuborderStr( String suborderno ) throws Exception{
    	return "UPDATE SUB_ORDER SET STATUS=" + Constants.CANCLL_STATUS_ + " ,DEL_FLG=1 WHERE SUB_ORDER_NO=" + suborderno;
    }
    synchronized public boolean removeSubOrder( Sub_Order so ){
    	return removeSubOrder( "" +  so.getSUB_ORDER_NO() + "" );
    }
    /**
     * �T�u�I�[�_�[�̃L�����Z���f���[�g�t���O���A�b�v�f�[�g
     * @param Sub_Order so
     * @param DataSource ds
     * @param boolean TRUE/FALSE
     */
    synchronized public boolean removeSubOrder( String suborderno ){
        //SQL���𐶐�
        String SQL;
        try{
        SQL = removeSuborderStr( suborderno );
        }catch(Exception ex){
            ex.printStackTrace();
            return false;
        }
        // Update 
        //JDBCAdapter�N��
        JdbcAdapter db = new JdbcAdapter();
        //�N�G���[�o��
        System.err.println( SQL );
        if( db.init(ds) ){
            return db.dbUpdate( SQL ) ;
        }
        return false;        
    }
    synchronized private String getparseString( String str ){
        if(str == null){
            return "";
        }
        if( str.length() == 0){
            return "";
        }
        int point =  str.indexOf('\'');
        if( point != -1 ){
        return str.substring(0, point) + '\'' + str.substring( point );
        }
        return str;
    }
}
