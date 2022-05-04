/*
 * dbAdapterUserTbl.java
 *
 * Created on 2002/04/05, 21:14
 */

package jp.co.lastminute.cart.user.jdbc.rsource;

import java.io.*;
import java.util.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import jp.co.yobrain.util.*;
import jp.co.yobrain.util.jdbc.JdbcAdapter;
import jp.co.lastminute.cart.user.*;
import jp.co.lastminute.cart.user.model.*;
import jp.co.lastminute.cart.user.jdbc.dbAdapterProfile;
/**
 *
 * @author  Takashi Yamada
 * @version 1.0
 */
public class dbAdapterUserTbl implements Serializable{
    private User us;
    private User_Tbl ut;
    //private dbDataSource dbsource;
    private DataSource ds;

    /**
     * �R���X�g���N�^�[
     */
    public dbAdapterUserTbl(DataSource dss) {
        this.ds = dss;
        us = null;
        ut = null;
    }

    /**
     * ���[�U�[���L�����ۂ��𔻒f����
     * @param String e_mail
     * @return int USER_ID
     */
    synchronized public int checkEmail( String e_mail ){
        String  SQL = "";
        try{
            // ���[�U�f�[�^���������邽�߂�SQL����ݒ�
            SQL  = " SELECT"
                 + " USER_ID"
                 + " FROM USER_TBL"
                 + " WHERE E_MAIL='" + e_mail + "'"
                 + " AND   DEL_FLG=0";
        }catch(Exception ex){
            ex.printStackTrace();
        }
        //JDBCAdapter�N��
        JdbcAdapter db = new JdbcAdapter();
        int gsize = 0;
        int seruserid = 0;
        //DB�ɐڑ�������
        if( db.init(ds) ){
            Vector setd = db.dbSelect(SQL);
            dbDataAccesser dba = new dbDataAccesser(setd);
            gsize = dba.getRowsize();   // �f�[�^�̃��X�g�T�C�Y�𓾂�
            if(gsize != 0){
                seruserid = dba.getDatabyInt(0,0);
            }
        }
        if(gsize == 0){
            return gsize;
        }
        return seruserid;
     }

     /**
     * ���[�U�[���L�����ۂ��𔻒f����
     * @param String e_mail
     * @param String passwd
     */
    synchronized public int checkUser( String e_mail, String passwd ){
        String  SQL = "";
        try{
            // ���[�U�f�[�^���������邽�߂�SQL����ݒ�
            SQL  = " SELECT"
                 + " USER_ID"
                 + " FROM USER_TBL"
                 + " WHERE E_MAIL='" + e_mail + "'"
                 + " AND   PASSWD='" + passwd + "'"
                 + " AND   DEL_FLG=0";
        }catch(Exception ex){
            ex.printStackTrace();
        }
        //JDBCAdapter�N��
        JdbcAdapter db = new JdbcAdapter();
        int gsize = 0;
        int seruserid = 0;
        //DB�ɐڑ�������
        if( db.init(ds) ){
            Vector setd = db.dbSelect(SQL);
            dbDataAccesser dba = new dbDataAccesser(setd);
            gsize = dba.getRowsize();   // �f�[�^�̃��X�g�T�C�Y�𓾂�
            if(gsize != 0){
                seruserid = dba.getDatabyInt(0,0);
            }
        }
        if(gsize == 0){
            return gsize;
        }
        return seruserid;
     }

     /**
     * ���[�U�[�h�c�Ɋ�Â��A��{�I�ȏ��𒊏o����
     * @param int userid
     * @return User_Tbl 
     */
    synchronized public User_Tbl findUserTbl( int userid ){
        User us = new User();
        dbAdapterProfile fp = new dbAdapterProfile(ds);
        us = fp.findProfile(userid);
        return us.getUser();
    }

    /**
     * ���[�U�[�̐V�K�o�^
     * @param User_Tbl
     * @return boolean TRUE/FALSE
     */
    synchronized public boolean addUserTbl( User_Tbl ut ){
        String  SQL = "";
        //JDBCAdapter�N��
        JdbcAdapter db = new JdbcAdapter();
        try{
             // ���[�U�e�[�u���f�[�^��ǉ�����ׂ�SQL����ݒ�
            SQL  = " INSERT INTO"
                 + "   USER_TBL("
                 + "   USER_ID,"
                 + "   E_MAIL,"
                 + "   PASSWD,"
                 + "   AUTH_FLG,"
                 + "   DEL_FLG,"
                 + "   HTML_MAIL_OK,"
                 + "   MAIL_MAG_OK,"
                 + "   CAMPAIGNUSERFLAG,"
                 + "   DEALWATCHID,"
                 + "   MAKE_DATE"
                 + "  )VALUES("
                 + " "  + ut.getUSER_ID()                           + ","   //���[�U�[ID(int)
                 + " '" + db.convQuotation(ut.getE_MAIL())          + "',"  //E_MAIL(String)
                 + " '" + db.convQuotation(ut.getPASSWD())          + "',"  //�p�X���[�h(String)
                 + " '" + db.convQuotation(ut.getAUTH_FLG())        + "',"  //�F�؃t���O(String)
                 + " 0,"                                                    //�폜�t���O(int)
                 + " '" + db.convQuotation(ut.getHTML_MAIL_OK())    + "',"  //HTML���[��OK�t���O(String)
                 + " '" + db.convQuotation(ut.getMAIL_MAG_OK())     + "',"  //���[���}�K�W��OK�t���O(String)
                 + " "  + ut.getCAMPAIGNUSERFLAG()                  + ","   //�L�����y�[�����[�U�[�t���O(int)
                 + " '" + db.convQuotation(ut.getDEALWATCHID())     + "',"  //�f�B�[���E�H�b�`ID(String)
                 + " SYSDATE"                                               //�쐬��(String)
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
     * ���[�U�[���̍X�V
     * @param User_Tbl ut
     * @return boolean TRUE/ FALSE
     */
    synchronized public boolean modifyUserTbl( User_Tbl ut ){
        String  SQL = "";
        //JDBCAdapter�N��
        JdbcAdapter db = new JdbcAdapter();
        try{
            // ���[�U�e�[�u���f�[�^���X�V����ׂ�SQL����ݒ�
            SQL  = " UPDATE USER_TBL"
                 + " SET"
                 + "   USER_ID="          + ut.getUSER_ID()                         + ","  //���[�U�[ID(int)
                 + "   E_MAIL='"          + db.convQuotation(ut.getE_MAIL())        + "'," //E_MAIL(String)
                 + "   PASSWD='"          + db.convQuotation(ut.getPASSWD())        + "'," //�p�X���[�h(String)
                 + "   AUTH_FLG='"        + db.convQuotation(ut.getAUTH_FLG())      + "'," //�F�؃t���O(String)
                 + "   DEL_FLG=0,"                                                         //�폜�t���O(int)
                 + "   HTML_MAIL_OK='"    + db.convQuotation(ut.getHTML_MAIL_OK())  + "'," //HTML���[��OK�t���O(String)
                 + "   MAIL_MAG_OK='"     + db.convQuotation(ut.getMAIL_MAG_OK())   + "'," //���[���}�K�W��OK�t���O(String)
                 + "   CAMPAIGNUSERFLAG=" + ut.getCAMPAIGNUSERFLAG()                + ","  //�L�����y�[�����[�U�[�t���O(int)
                 + "   DEALWATCHID='"     + db.convQuotation(ut.getDEALWATCHID())   + "'," //�f�B�[���E�H�b�`ID(String)
                 + "   UP_DATE=SYSDATE"                                                    //�C����(SYSDATE)
                 + " WHERE USER_ID="      + ut.getUSER_ID();                               //���[�U�[ID�Ō���
        }catch(Exception ex){
            ex.printStackTrace();
        }
        boolean rfrg = false;
        //DB�ɐڑ�������
        if( db.init(ds) ){
            rfrg = db.dbUpdate(SQL);
        }
        return rfrg;
    }

    /**
     * ���[�U�[�̎g�p��~
     * @param int userid
     * @return boolean TRUE / FALSE
     */
    synchronized public boolean stopUser( int userid ){
        String  SQL = "";
        try{
            // ���[�U�e�[�u���f�[�^���폜����ׂ�SQL����ݒ�
            SQL  = " UPDATE USER_TBL"
                 + " SET"
                 + "   DEL_FLG=1,"                //�폜�t���O(int)
                 + "   UP_DATE=SYSDATE"           //�C����(SYSDATE)
                 + " WHERE USER_ID=" + userid;    //���[�U�[ID�Ō���
        }catch(Exception ex){
            ex.printStackTrace();
        }
        //JDBCAdapter�N��
        JdbcAdapter db = new JdbcAdapter();
        boolean rfrg = false;
        //DB�ɐڑ�������
        if( db.init(ds) ){
            rfrg = db.dbUpdate(SQL);
        }
        return rfrg;
    }

    /**
     * ���[�U�[ID�쐬����
     * @return int USER_ID
     */
    synchronized public int genUserid(){
        String  SQL = "";
        try{
            // ���[�UID�𔭐����邽�߂�SQL����ݒ�
            SQL  = " SELECT seq_user_id.NEXTVAL FROM DUAL ";
        }catch(Exception ex){
            ex.printStackTrace();
        }
        //JDBCAdapter�N��
        JdbcAdapter db = new JdbcAdapter();
        int ucount = 0;
        //DB�ɐڑ�������
        if(db.init(ds)){
            Vector setd = db.dbSelect(SQL);
            dbDataAccesser dba = new dbDataAccesser(setd);
            ucount = dba.getDatabyInt(0,0);
        }
        return ucount;
    }
}
