/*
 * dbAdapterPostalCode.java
 *
 * Created on 2002/04/19, 22:41
 */

package jp.co.lastminute.cart.user.jdbc;

import java.io.*;
import java.util.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import jp.co.yobrain.util.*;
import jp.co.yobrain.util.jdbc.JdbcAdapter;
import jp.co.lastminute.cart.user.model.*;

/**
 *
 * @author  Takashi Yamada
 * @version 1.0
 */
public class dbAdapterPostalCode implements Serializable{
    private PostalCode[] pocd;
    //private dbDataSource dbsource;
    private DataSource ds;

    /** 
     * �R���X�g���N�^�[
     */
    public dbAdapterPostalCode(DataSource dss){
        this.ds = dss;
        pocd = null;
    }

    /**
     * �X�֔ԍ�����Z���̏ڍׂ������i���͂����l�̏ꍇ�j
     * @param int ZIPCODE
     * @param Vecter TRUE/FALSE
     */
    synchronized public PostalCode[] findAddress(int ZIPCODE){
        try{
            String zip = Integer.toString(ZIPCODE); // ���l���當����ɕϊ����s��
            return findAddress(zip);                // ���ۂɌ����������s��
        }catch(Exception ex){   ex.printStackTrace();   }
        return null;
    }

    /**
     * �X�֔ԍ�����Z���̏ڍׂ������i���͂�������̏ꍇ�j
     * @param String ZIPCODE
     * @param Vecter TRUE/FALSE
     */
    synchronized public PostalCode[] findAddress(String ZIPCODE){
        String  SQL = "";
        try{
            // �X�֔ԍ��f�[�^���������邽�߂�SQL����ݒ�
            SQL  = " SELECT ZC.POSTAL_CD,TN.STATE_CD,TN.STATE_NAME,SN.CITY_CD,SN.CITY_NAME,CN.STREETCD,CN.STREETNAME"
                 + " FROM POSTAL_CD_MASTER ZC,STATE_MASTER TN,CITY_MASTER SN,STREETMASTER CN"
                 + " WHERE ZC.POSTAL_CD = '" + ZIPCODE + "'"
                 + " AND   TN.STATE_CD  = ZC.STATE_CD"
                 + " AND   SN.CITY_CD   = ZC.CITY_CD"
                 + " AND   CN.STREETCD  = ZC.STREETCD";
        }catch(Exception ex){
            ex.printStackTrace();
        }
       
        //JDBCAdapter�N��
        JdbcAdapter db = new JdbcAdapter();
        int gsize = 0;
        //DB�ɐڑ�������
        if( db.init(ds) ){
            Vector setd = db.dbSelect(SQL);
            dbDataAccesser dba = new dbDataAccesser(setd);
            gsize = dba.getRowsize();   // �f�[�^�̃��X�g�T�C�Y�𓾂�
            pocd = new PostalCode[gsize];   // ���X�g�̃T�C�Y�ɍ��킹�o�b�t�@���m��
            //���X�g���̃f�[�^�𓾂�
            for(int loopcnt = 0 ; loopcnt < gsize ; loopcnt++){
                pocd[loopcnt] = new PostalCode();   // ���������s��
                pocd[loopcnt].setPOSTAL_CD(dba.getData(loopcnt,0));         // �X�֔ԍ��R�[�h(String)
                pocd[loopcnt].setSTATE_CD(dba.getDatabyInt(loopcnt,1));     // �s���{���R�[�h(int)
                pocd[loopcnt].setSTATE_NAME(dba.getData(loopcnt,2));        // �s���{����(String)
                pocd[loopcnt].setCITY_CD(dba.getDatabyInt(loopcnt,3));      // �s�撬���R�[�h(int)
                pocd[loopcnt].setCITY_NAME(dba.getData(loopcnt,4));         // �s�撬����(String)
                pocd[loopcnt].setSTREETCD(dba.getDatabyInt(loopcnt,5));     // ����R�[�h(int)
                pocd[loopcnt].setSTREETNAME(dba.getData(loopcnt,6));        // ���於(String)
            }
        }
        return pocd;
    }

    /**
     * POSTAL_CD_MASTER�e�[�u���Ƀf�[�^��ǉ����鏈�����s��
     * @param PostalCode PostalCodeData
     * @param Vecter TRUE/FALSE
     */
    synchronized public boolean addPostalCode( PostalCode pc ){
        String  SQL = "";
        //JDBCAdapter�N��
        JdbcAdapter db = new JdbcAdapter();
        try{
            //POSTAL_CD_MASTER�f�[�^��ǉ�����ׂ�SQL����ݒ�
            SQL  = " INSERT INTO"
                 + "   POSTAL_CD_MASTER("
                 + "   POSTAL_CD,"
                 + "   CITY_CD,"
                 + "   STATE_CD,"
                 + "   STREETCD"
                 + "  )VALUES("
                 + " " + pc.getPOSTAL_CD() + ","    //�X�֔ԍ��R�[�h(int)
                 + " " + pc.getCITY_CD() + ","      //�s�撬���R�[�h(int)
                 + " " + pc.getSTATE_CD() + ","     //�s���{���R�[�h(int)
                 + " " + pc.getSTREETCD()           //����R�[�h(int)
                 + " )";
        }catch(Exception ex){
            ex.printStackTrace();
        }
        boolean rfrg = false;
         //DB�ɐڑ�������
        if( db.init(ds) ){
            rfrg = db.dbInsert(SQL);
        }
        return rfrg;
    }

    /**
     * STREETMASTER�e�[�u���Ƀf�[�^��ǉ����鏈�����s��
     * @param PostalCode PostalCodeData
     * @param Vecter TRUE/FALSE
     */
    synchronized public boolean addStreetCode( PostalCode pc ){
        String  SQL = "";
	//JDBCAdapter�N��
	JdbcAdapter db = new JdbcAdapter();
	try{
            //STREETMASTER�f�[�^����ǉ�����ׂ�SQL����ݒ�
	    SQL  = " INSERT INTO"
	         + "   STREETMASTER("
	         + "   STREETCD,"
	         + "   STREETNAME,"
	         + "   STATE_CD,"
	         + "   CITY_CD"
	         + "  )VALUES("
	         + " "  + pc.getSTREETCD() + ","                        //����R�[�h(int)
	         + " '" + db.convQuotation(pc.getSTREETNAME()) + "'," //���於(String)
	         + " "  + pc.getSTATE_CD() + ","                        //�s���{���R�[�h(int)
	         + " "  + pc.getCITY_CD()                               //�s�撬���R�[�h(int)
	         + " )";
        }catch(Exception ex){
            ex.printStackTrace();
        }
        boolean rfrg = false;
        //DB�ɐڑ�������
        if( db.init(ds) ){
            rfrg = db.dbInsert(SQL);
        }
        return rfrg;
    }

    /**
     * STATE_MASTER�e�[�u���Ƀf�[�^��ǉ����鏈�����s��
     * @param PostalCode PostalCodeData
     * @param Vecter TRUE/FALSE
     */
    synchronized public boolean addStateCode( PostalCode pc ){
        String  SQL = "";
        //JDBCAdapter�N��
        JdbcAdapter db = new JdbcAdapter();
        try{
            //STATE_MASTER�f�[�^����ǉ�����ׂ�SQL����ݒ�
            SQL  = " INSERT INTO"
                 + " STATE_MASTER( "
                 + "   STATE_CD,"
                 + "   STATE_NAME"
                 + "  )VALUES("
                 + " "  + pc.getSTATE_CD() + ","                              //�s���{���R�[�h(int)
                 + " '" + db.convQuotation(pc.getSTATE_NAME()) + "'"        //�s���{����(String)
                 + " )";
        }catch(Exception ex){
            ex.printStackTrace();
        }
        boolean rfrg = false;
        //DB�ɐڑ�������
        if( db.init(ds) ){
            rfrg = db.dbInsert(SQL);
        }
        return rfrg;
    }

    /**
     * CITY_MASTER�e�[�u���Ƀf�[�^��ǉ����鏈�����s��
     * @param PostalCode PostalCodeData
     * @param Vecter TRUE/FALSE
     */
    synchronized public boolean addCityCode( PostalCode pc ){
        String  SQL = "";
        //JDBCAdapter�N��
        JdbcAdapter db = new JdbcAdapter();
        try{
            //CITY_MASTER�f�[�^��ǉ�����ׂ�SQL����ݒ�
            SQL  = " INSERT INTO"
                 + " CITY_MASTER("
                 + "   CITY_CD,"
                 + "   CITY_NAME,"
                 + "   STATE_CD"
                 + "  )VALUES("
                 + " "  + pc.getCITY_CD() + ","                             //�s�撬���R�[�h(int)
                 + " '" + db.convQuotation(pc.getCITY_NAME()) + "',"      //�s�撬����(String)
                 + " " 	+ pc.getSTATE_CD()                                  //�s���{���R�[�h(int)
                 + " )";
        }catch(Exception ex){
            ex.printStackTrace();
        }
    	boolean rfrg = false;
   	//DB�ɐڑ�������
    	if( db.init(ds) ){
            rfrg = db.dbInsert(SQL);
    	}
        return rfrg;
    }

    /**
     * STATE_CD����Ή�����CITY_CD��CITY_NAME�̌������s��
     * @param String STATE_CD
     * @param Vecter TRUE/FALSE
     */
    synchronized public PostalCode[] findCity(int statecd){
        String  SQL = "";
        try{
            // STATE_CD����CITY�f�[�^���������邽�߂�SQL����ݒ�
            SQL  = " SELECT CITY_CD,CITY_NAME"
                 + " FROM CITY_MASTER"
                 + " WHERE STATE_CD = " + statecd;
        }catch(Exception ex){
            ex.printStackTrace();
        }

        //JDBCAdapter�N��
        JdbcAdapter db = new JdbcAdapter();
        int gsize = 0;
        //DB�ɐڑ�������
        if( db.init(ds) ){
            Vector setd = db.dbSelect(SQL);
            dbDataAccesser dba = new dbDataAccesser(setd);
            gsize = dba.getRowsize();       // �f�[�^�̃��X�g�T�C�Y�𓾂�
            pocd = new PostalCode[gsize];    // ���X�g�̃T�C�Y�ɍ��킹�o�b�t�@���m��
            //���X�g���̃f�[�^�𓾂�
            for(int loopcnt = 0 ; loopcnt < gsize ; loopcnt++){
                pocd[loopcnt] = new PostalCode();                            // ���������s��
                pocd[loopcnt].setCITY_CD(dba.getDatabyInt(loopcnt,0));      // �s�撬���R�[�h(int)
                pocd[loopcnt].setCITY_NAME(dba.getData(loopcnt,1));         // �s�撬����(String)
            }
        }
        return pocd;
    }
}