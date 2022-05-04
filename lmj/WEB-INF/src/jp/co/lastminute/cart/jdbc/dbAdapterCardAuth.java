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
import jp.co.lastminute.cart.model.*;

/**
 *
 * @author  skondo
 * @version 
 */
public class dbAdapterCardAuth implements Serializable{
    private DataSource ds;
    /**
     * �R���X�g���N�^�[
     */
    public dbAdapterCardAuth( DataSource dss ){
        this.ds = dss;  
    }
    /**
     * �J�[�h���ǉ�
     * @param Card_Auth card
     * @param DataSource ds
     * @return boolean true/false
     */
    synchronized public boolean addCardAuth( Card_Auth card ){
        //SQL���𐶐�
        String SQL;
        try{
            SQL = getAddCardAuthStr( card );
            JdbcAdapter db = new JdbcAdapter();
            System.err.println( SQL );
            if( db.init(ds) )	return db.dbUpdate( SQL );
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    /**
     * �C���T�[�gSQL�̎擾
     */
    public static String getAddCardAuthStr( Card_Auth card ) throws Exception{
    	return "INSERT INTO CARD_AUTH ("
            	+ " ORDER_NO, "
            	+ " AUTH_NUM, "
            	+ " SUB_ORDER_NO, "
            	+ " CARD_NO, "
            	+ " EXPIRE, "
            	+ " FIRST_NAME, "
            	+ " AUTH_CODE, "
            	+ " MAKE_DATE)" 
            	+ " VALUES " 
            	+ "("
                + card.getOrder_No() + ", "
                + "CARD_AUTH_SEQ.NEXTVAL,"
                + card.getSub_order_no() + "," 
                + "'" + card.getCard_No() + "', "
                + "'" + card.getExpire() + "', "
                + "'" + card.getFirst_Name() + "', "
                + "'" + card.getAuth_Code() + "', SYSDATE) ";    	
    }
    /**
     * �J�[�h���̃��f�B�t�@�C
     * @param Card_Auth card
     * @param DataSource ds
     * @return boolean true/false
     */
    synchronized public boolean modifyCardAuth( Card_Auth card ){
        String SQL;
        try{
	        SQL = getModifyCardAuthStr( card );
	        System.err.println( SQL );
	        JdbcAdapter db = new JdbcAdapter();
	        if( db.init(ds) )	return db.dbUpdate( SQL );
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;        
    }
    /**
     * �J�[�h���̒ǉ�SQL
     */
    synchronized public static String getModifyCardAuthStr( Card_Auth card ) throws Exception{
    	return "UPDATE CARD_AUTH SET CARD_NO='" + card.getCard_No() + "', "
                + " EXPIRE='" + card.getExpire() + "', "
                + " FIRST_NAME='" + card.getFirst_Name() + "', "
                + " AUTH_CODE='" + card.getAuth_Code() + "', "
                + " UP_DATE=SYSDATE"
        		+ " WHERE ORDER_NO=" + card.getOrder_No();    
	}
    /**
     * �J�[�h���̃L�����Z���f���[�g�t���O���A�b�v�f�[�g<BR>
     * ����, �g�p���@�������Ȃ����� ��������
     * @param Card_Auth card
     * @param DataSource ds
     * @param boolean TRUE/FALSE
     */
    synchronized public boolean removeCardAuth( Card_Auth card ){
        //SQL���𐶐�
        String SQL = "";
        // Update 
        //JDBCAdapter�N��
        //�N�G���[�o��
        return false;        
    }   
}
