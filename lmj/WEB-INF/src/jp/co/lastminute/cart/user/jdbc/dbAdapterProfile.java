/*
 * dbAdapterProfile.java
 *
 * Created on 2002/04/05, 21:15
 */

package jp.co.lastminute.cart.user.jdbc;

import java.io.*;
import java.util.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import jp.co.yobrain.util.*;
import jp.co.yobrain.util.jdbc.JdbcAdapter;
import jp.co.lastminute.cart.user.*;
import jp.co.lastminute.cart.user.model.*;

/**
 *
 * @author  Takashi Yamada
 * @version 1.0
 */
public class dbAdapterProfile implements Serializable{
    private User_Tbl uscd;
    private Profile prcd;
    private DataSource ds;

    /**
     * �R���X�g���N�^�[
     */
    public dbAdapterProfile(DataSource dss) {
        this.ds = dss;
        prcd = null;
        uscd = null;
    }

    /**
     * ���[�U�[������������
     * @param int userid
     */
    synchronized public User findProfile( String email ){
        User us = new User();
        String  SQL = "";	System.err.println("<------dbAdapterProfile:44----->");
        try{				System.err.println("<------dbAdapterProfile:45----->");
            // ���[�U�f�[�^���������邽�߂�SQL����ݒ�
            SQL  = "SELECT"
                 + " A.USER_ID,"
                 + " A.E_MAIL,"
                 + " A.PASSWD,"
                 + " A.AUTH_FLG,"
                 + " A.DEL_FLG,"
                 + " A.HTML_MAIL_OK,"
                 + " A.MAIL_MAG_OK,"
                 + " A.CAMPAIGNUSERFLAG,"
                 + " A.DEALWATCHID,"
                 + " TO_CHAR(A.MAKE_DATE, 'YYYYMMDD'),"
                 + " TO_CHAR(A.UP_DATE, 'YYYYMMDD'),"
                 + " B.SEI_KANA,"
                 + " B.SEI_KANJI,"
                 + " B.NA_KANA,"
                 + " B.NA_KANJI,"
                 + " B.FIRST_NAME,"
                 + " B.LASTNAME,"
                 + " B.SEX,"
                 + " B.BIRTH_DAY,"
                 + " B.POSTAL_CD,"
                 + " B.STATE_CD,"
                 + " B.CITY_NAME,"
                 + " B.ADDRESS,"
                 + " B.TEL_NO,"
                 + " B.FAX"
                 + " FROM USER_TBL A, PROFILE B"
                 + " WHERE A.E_MAIL='" + email + "' AND B.USER_ID=A.USER_ID AND A.DEL_FLG=0 AND A.CAMPAIGNUSERFLAG=1";
     		System.err.println("<------dbAdapterProfile:75----->");
	        //JDBCAdapter�N��
	        JdbcAdapter db = new JdbcAdapter();	System.err.println("<------dbAdapterProfile:77----->");
	        int gsize = 0;		////
	        System.err.println( SQL );
	        //DB�ɐڑ�������
	        if( db.init(ds) ){
	            Vector setd = db.dbSelect(SQL);
	            dbDataAccesser dba = new dbDataAccesser(setd);
	
	            //�f�[�^�𓾂�
	            uscd = new User_Tbl();  // User_Tbl�̏��������s��  
	            prcd = new Profile();   // Profile�̏��������s��
	
	            //User_Tbl
	            uscd.setUSER_ID(dba.getDatabyInt(0,0));             //���[�U�[ID(int)
	            uscd.setE_MAIL(dba.getData(0,1));                   //E_MAIL(String)
	            uscd.setPASSWD(dba.getData(0,2));                   //�p�X���[�h(String)
	            uscd.setAUTH_FLG(dba.getData(0,3));                 //�F�؃t���O(String)
	            uscd.setDEL_FLG(dba.getDatabyInt(0,4));             //�폜�t���O(int)
	            uscd.setHTML_MAIL_OK(dba.getData(0,5));             //HTML���[��OK�t���O(String)
	            uscd.setMAIL_MAG_OK(dba.getData(0,6));              //���[���}�K�W��OK�t���O(String)
	            uscd.setCAMPAIGNUSERFLAG(dba.getDatabyInt(0,7));    //�L�����y�[�����[�U�[�t���O(int)
	            uscd.setDEALWATCHID(dba.getData(0,8));              //�f�B�[���E�H�b�`ID(String)
	            uscd.setMAKE_DATE(dba.getData(0,9));                //�쐬��(String)
	            uscd.setUP_DATE(dba.getData(0,10));                 //�C����(String)
	            us.setUser(uscd);        
	
	            //Profile
	            prcd.setUSER_ID(uscd.getUSER_ID());         //���[�U�[ID(int)
	            prcd.setSEI_KANA(dba.getData(0,11));        //��-����(String)
	            prcd.setSEI_KANJI(dba.getData(0,12));       //��-����(String)
	            prcd.setNA_KANA(dba.getData(0,13));         //��-����(String)
	            prcd.setNA_KANJI(dba.getData(0,14));        //��-����(String)
	            prcd.setFIRST_NAME(dba.getData(0,15));      //�t�@�[�X�g�l�[��(String)
	            prcd.setLASTNAME(dba.getData(0,16));        //���X�g�l�[��(String)
	            prcd.setSEX(dba.getDatabyInt(0,17));        //����(int)
	            prcd.setBIRTH_DAY(dba.getDatabyInt(0,18));  //�a����(int)
	            prcd.setPOSTAL_CD(dba.getData(0,19));       //�X�֔ԍ�(String)
	            prcd.setSTATE_CD(dba.getDatabyInt(0,20));   //�s���{���R�[�h(int)
	            prcd.setCITY_NAME(dba.getData(0,21));       //�s�s��(String)
	            prcd.setADDRESS(dba.getData(0,22));         //�Z��(String)
	            prcd.setTEL_NO(dba.getData(0,23));          //�d�b�ԍ�(String)
	            prcd.setFAX(dba.getData(0,24));             //FAX(String)
	            us.setProfile(prcd);
	            return us;
	        }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }

    synchronized public User findProfile( int userid ){
        User us = new User();
        String  SQL = "";
        try{
            // ���[�U�f�[�^���������邽�߂�SQL����ݒ�
            SQL  = " SELECT"
                 + "   A.USER_ID,"
                 + "   A.E_MAIL,"
                 + "   A.PASSWD,"
                 + "   A.AUTH_FLG,"
                 + "   A.DEL_FLG,"
                 + "   A.HTML_MAIL_OK,"
                 + "   A.MAIL_MAG_OK,"
                 + "   A.CAMPAIGNUSERFLAG,"
                 + "   A.DEALWATCHID,"
                 + "   TO_CHAR(A.MAKE_DATE, 'YYYYMMDD'),"
                 + "   TO_CHAR(A.UP_DATE, 'YYYYMMDD'),"
                 + "   B.SEI_KANA,"
                 + "   B.SEI_KANJI,"
                 + "   B.NA_KANA,"
                 + "   B.NA_KANJI,"
                 + "   B.FIRST_NAME,"
                 + "   B.LASTNAME,"
                 + "   B.SEX,"
                 + "   B.BIRTH_DAY,"
                 + "   B.POSTAL_CD,"
                 + "   B.STATE_CD,"
                 + "   B.CITY_NAME,"
                 + "   B.ADDRESS,"
                 + "   B.TEL_NO,"
                 + "   B.FAX"
                 + " FROM USER_TBL A, PROFILE B"
                 + " WHERE A.USER_ID=" + userid + " AND B.USER_ID=A.USER_ID AND A.DEL_FLG=0";
        
	        //JDBCAdapter�N��
	        JdbcAdapter db = new JdbcAdapter();
	        int gsize = 0;
	        //DB�ɐڑ�������
	        if( db.init(ds) ){
	            Vector setd = db.dbSelect(SQL);
	            dbDataAccesser dba = new dbDataAccesser(setd);
	
	            //�f�[�^�𓾂�
	            uscd = new User_Tbl();  // User_Tbl�̏��������s��  
	            prcd = new Profile();   // Profile�̏��������s��
	
	            //User_Tbl
	            uscd.setUSER_ID(dba.getDatabyInt(0,0));             //���[�U�[ID(int)
	            uscd.setE_MAIL(dba.getData(0,1));                   //E_MAIL(String)
	            uscd.setPASSWD(dba.getData(0,2));                   //�p�X���[�h(String)
	            uscd.setAUTH_FLG(dba.getData(0,3));                 //�F�؃t���O(String)
	            uscd.setDEL_FLG(dba.getDatabyInt(0,4));             //�폜�t���O(int)
	            uscd.setHTML_MAIL_OK(dba.getData(0,5));             //HTML���[��OK�t���O(String)
	            uscd.setMAIL_MAG_OK(dba.getData(0,6));              //���[���}�K�W��OK�t���O(String)
	            uscd.setCAMPAIGNUSERFLAG(dba.getDatabyInt(0,7));    //�L�����y�[�����[�U�[�t���O(int)
	            uscd.setDEALWATCHID(dba.getData(0,8));              //�f�B�[���E�H�b�`ID(String)
	            uscd.setMAKE_DATE(dba.getData(0,9));                //�쐬��(String)
	            uscd.setUP_DATE(dba.getData(0,10));                 //�C����(String)
	            us.setUser(uscd);        
	
	            //Profile
	            prcd.setUSER_ID(uscd.getUSER_ID());         //���[�U�[ID(int)
	            prcd.setSEI_KANA(dba.getData(0,11));        //��-����(String)
	            prcd.setSEI_KANJI(dba.getData(0,12));       //��-����(String)
	            prcd.setNA_KANA(dba.getData(0,13));         //��-����(String)
	            prcd.setNA_KANJI(dba.getData(0,14));        //��-����(String)
	            prcd.setFIRST_NAME(dba.getData(0,15));      //�t�@�[�X�g�l�[��(String)
	            prcd.setLASTNAME(dba.getData(0,16));        //���X�g�l�[��(String)
	            prcd.setSEX(dba.getDatabyInt(0,17));        //����(int)
	            prcd.setBIRTH_DAY(dba.getDatabyInt(0,18));  //�a����(int)
	            prcd.setPOSTAL_CD(dba.getData(0,19));       //�X�֔ԍ�(String)
	            prcd.setSTATE_CD(dba.getDatabyInt(0,20));   //�s���{���R�[�h(int)
	            prcd.setCITY_NAME(dba.getData(0,21));       //�s�s��(String)
	            prcd.setADDRESS(dba.getData(0,22));         //�Z��(String)
	            prcd.setTEL_NO(dba.getData(0,23));          //�d�b�ԍ�(String)
	            prcd.setFAX(dba.getData(0,24));             //FAX(String)
	            us.setProfile(prcd);
	        }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return us;
    }
	/**
     *  SQL�̎擾
     */
	synchronized static public String getAddProflieStr( Profile prcd, JdbcAdapter db ) throws Exception {
		String SQL;
		SQL  = " INSERT INTO"
                 + " PROFILE("
                 + "   USER_ID,"
                 + "   SEI_KANA,"
                 + "   SEI_KANJI,"
                 + "   NA_KANA,"
                 + "   NA_KANJI,"
                 + "   FIRST_NAME,"
                 + "   LASTNAME,"
                 + "   SEX,"
                 + "   BIRTH_DAY,"
                 + "   POSTAL_CD,"
                 + "   STATE_CD,"
                 + "   CITY_NAME,"
                 + "   ADDRESS,"
                 + "   TEL_NO,"
                 + "   FAX"
                 + " )VALUES("
                 + " "  + prcd.getUSER_ID()                        + ","    //���[�U�[ID(int)
                 + " '" + db.convQuotation(prcd.getSEI_KANA())   + "',"   //��-����(String)
                 + " '" + db.convQuotation(prcd.getSEI_KANJI())  + "',"   //��-����(String)
                 + " '" + db.convQuotation(prcd.getNA_KANA())    + "',"   //��-����(String)
                 + " '" + db.convQuotation(prcd.getNA_KANJI())   + "',"   //��-����(String)
                 + " '" + db.convQuotation(prcd.getFIRST_NAME()) + "',"   //�t�@�[�X�g�l�[��(String)
                 + " '" + db.convQuotation(prcd.getLASTNAME())   + "',"   //���X�g�l�[��(String)
                 + " "  + prcd.getSEX()                            + ","    //����(int)
                 + " "  + prcd.getBIRTH_DAY()                     + ","    //�a����(int)
                 + " '" + db.convQuotation(prcd.getPOSTAL_CD())  + "',"   //�X�֔ԍ�(String)
                 + " "  + prcd.getSTATE_CD()                       + ","    //�s���{���R�[�h(int)
                 + " '" + db.convQuotation(prcd.getCITY_NAME())  + "',"   //�s�s��(String)
                 + " '" + db.convQuotation(prcd.getADDRESS())    + "',"   //�Z��(String)
                 + " '" + db.convQuotation(prcd.getTEL_NO())     + "',"   //�d�b�ԍ�(String)
                 + " '" + db.convQuotation(prcd.getFAX())         + "'"   //FAX(String)
                 + " )";
		return SQL;		
	}
    /**
     * ���[�U�[����ǉ�����
     * @param Profile profile
     */
    synchronized public boolean addProfile( Profile prcd ){
        String  SQL = "";
        boolean rfrg = false;
        //JDBCAdapter�N��
        JdbcAdapter db = new JdbcAdapter();
        try{
             // �v���t�@�C���f�[�^��ǉ�����ׂ�SQL����ݒ�
            SQL  = getAddProflieStr( prcd, db );
            //DB�ɐڑ�������
        	if( db.init(ds) )	rfrg = db.dbInsert(SQL);
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return rfrg;
    }
	/**
	 *  SQL�X�V�̎擾
	 */
	synchronized public static String getModifyProfileStr( Profile prcd, JdbcAdapter db ) throws Exception {
    	return "UPDATE PROFILE"
                 + " SET"
                 //+ "   USER_ID="       + prcd.getUSER_ID()                        + ","     //���[�U�[ID(int)
                 + "   SEI_KANA='"     + db.convQuotation(prcd.getSEI_KANA())   + "',"    //��-����(String)
                 + "   SEI_KANJI='"    + db.convQuotation(prcd.getSEI_KANJI())  + "',"    //��-����(String)
                 + "   NA_KANA='"      + db.convQuotation(prcd.getNA_KANA())    + "',"    //��-����(String)
                 + "   NA_KANJI='"     + db.convQuotation(prcd.getNA_KANJI())   + "',"    //��-����(String)
                 + "   FIRST_NAME='"   + db.convQuotation(prcd.getFIRST_NAME()) + "',"    //�t�@�[�X�g�l�[��(String)
                 + "   LASTNAME='"     + db.convQuotation(prcd.getLASTNAME())   + "',"    //���X�g�l�[��(String)
                 + "   SEX="           + prcd.getSEX()                            + ","     //����(int)
                 + "   BIRTH_DAY="     + prcd.getBIRTH_DAY()                     + ","     //�a����(int)
                 + "   POSTAL_CD='"    + db.convQuotation(prcd.getPOSTAL_CD())  + "',"   //�X�֔ԍ�(String)
                 + "   STATE_CD="      + prcd.getSTATE_CD()                       + ","    //�s���{���R�[�h(int)
                 + "   CITY_NAME='"    + db.convQuotation(prcd.getCITY_NAME())  + "',"   //�s�s��(String)
                 + "   ADDRESS='"      + db.convQuotation(prcd.getADDRESS())    + "',"   //�Z��(String)
                 + "   TEL_NO='"       + db.convQuotation(prcd.getTEL_NO())     + "',"   //�d�b�ԍ�(String)
                 + "   FAX='"          + db.convQuotation(prcd.getFAX())         + "'"   //FAX(String)
                 + " WHERE USER_ID="   + prcd.getUSER_ID();                               //���[�U�[ID�Ō���(int)
	}
    /**
     * ���[�U�[�����X�V����B
     * @param Profile profile
     */
    synchronized public boolean modifyProfile( Profile prcd ){
        String  SQL = "";
        boolean rfrg = false;
        //JDBCAdapter�N��
        JdbcAdapter db = new JdbcAdapter();
        try{
            // �v���t�@�C���f�[�^���X�V����ׂ�SQL����ݒ�
        	SQL = getModifyProfileStr( prcd, db );
        	 //DB�ɐڑ�������
        	if( db.init(ds) )	rfrg = db.dbUpdate(SQL);
        	System.err.println( SQL );
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return rfrg;
    }

    /**
     * ���[�U�[����\����~����
     * @param int userid
     */
    synchronized public boolean stopProfile( int userid ){
        return true;
    }
}
