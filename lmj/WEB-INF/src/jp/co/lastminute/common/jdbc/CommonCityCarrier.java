/*
 * CommonCityCarrier.java
 *
 * Created on 2002/07/05, 20:19
 */

package jp.co.lastminute.common.jdbc;

import java.io.*;
import java.util.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import jp.co.yobrain.util.*;
import jp.co.yobrain.util.dbDataAccesser;

/**
 *
 * @author  skondo
 * @version 
 */
public class CommonCityCarrier implements Serializable{
    private DataSource ds;

    /** Creates new CommonCityCarrier */
    public CommonCityCarrier( DataSource dss ) {
        this.ds = dss;
    }
    public CommonCityCarrier() {
    }
    
    /**
     *
     */
    synchronized public String getAirportName(String code){
        JdbcAdapter db = new JdbcAdapter();
        try{
        if( db.init(ds) ){
            Vector vc = db.dbSelect( "SELECT JAPAN_NAME FROM MAST_AIRPORT WHERE CODE='" + code + "'" );
            dbDataAccesser dba = new dbDataAccesser( vc );
            return dba.getData(0,0);
        }
        }catch(Exception ex){}
        return "";
    }
    /**
     *
     */
    synchronized public String getCarrierName(String code){
        JdbcAdapter db = new JdbcAdapter();
        try{
        if( db.init(ds) ){
            Vector vc = db.dbSelect( "SELECT JAPAN_NAME FROM MAST_CARRIER WHERE CODE='" + code + "'" );
            dbDataAccesser dba = new dbDataAccesser( vc );
            return dba.getData(0,0);
        }
        }catch(Exception ex){}
        return "";
    }
    /**
     *
     */
    synchronized public void changeStock( String jan_cd, boolean flg ){
        String add = "+1";
        if( flg ){  add = "-1"; }
        JdbcAdapter db = new JdbcAdapter();
        try{
        if( db.init(ds) ){
            db.dbInsert( "UPDATE CALLEGEPRODUCT_TBL SET ALLOTNUM=ALLOTNUM"+ add + " WHERE JAN_CD='" + jan_cd + "'" );            
                    //�N�G���[�o��
        }
        db = null;
        }catch(Exception ex){}
    }
    synchronized public void changeStock( String jan_cd, int num, boolean flg ){
        String add = "+" +  num ;
        if( flg ){  add = "-" + num ; }
        JdbcAdapter db = new JdbcAdapter();
        try{
        if( db.init(ds) ){
            db.dbInsert( "UPDATE CALLEGEPRODUCT_TBL SET ALLOTNUM=ALLOTNUM"+ add + " WHERE JAN_CD='" + jan_cd + "'" );            
                    //�N�G���[�o��
        }
        db = null;
        }catch(Exception ex){}
    }
    /**
     * �s���{�������擾����B
     */
    synchronized public String getStateName(int num){
        try{
            return state_name_[num];
        }catch(Exception ex){}
        return "";
    }
    synchronized public String getStateName(String str){
        int num = 0;
        try{
            num = Integer.parseInt( str );
            return state_name_[num];
        }catch(Exception ex){}
        return "";
    }
    public static final String[] state_name_ = {"",
						  "\u5317\u6D77\u9053",//�k�C��",
						  "\u9752\u68EE\u770C",//�X��",
						  "\u5CA9\u624B\u770C", //��茧",
						  "\u5BAE\u57CE\u770C",//�{�錧",
						  "\u79CB\u7530\u770C",//�H�c��",
						  "\u5C71\u5F62\u770C", //�R�`��",
						  "\u798F\u5CF6\u770C", //������",
						  "\u8328\u57CE\u770C", //��錧",
						  "\u6803\u6728\u770C", //�Ȗ،�",
						  "\u7FA4\u99AC\u770C", //�Q�n��",
						  "\u57FC\u7389\u770C", //��ʌ�",
						  "\u5343\u8449\u770C", //��t��",
						  "\u6771\u4EAC\u90FD", //�����s",
						  "\u795E\u5948\u5DDD\u770C", //�_�ސ쌧",
						  "\u5C71\u68A8\u770C", //�R����",
						  "\u9577\u91CE\u770C", //���쌧",
						  "\u65B0\u6F5F\u770C", //�V����",
						  "\u5BCC\u5C71\u770C", //�x�R��",
						  "\u77F3\u5DDD\u770C", //�ΐ쌧",
						  "\u798F\u4E95\u770C", //���䌧",
						  "\u5C90\u961C\u770C", //�򕌌�",
						  "\u9759\u5CA1\u770C", //�É���",
						  "\u611B\u77E5\u770C", //���m��",
						  "\u4E09\u91CD\u770C", //�O�d��",
						  "\u6ECB\u8CC0\u770C", //���ꌧ",
						  "\u4EAC\u90FD\u5E9C", //���s�{",
						  "\u5927\u962A\u5E9C", //���{",
						  "\u5175\u5EAB\u770C", //���Ɍ�",
						  "\u5948\u826F\u770C", //�ޗǌ�",
						  "\u548C\u6B4C\u5C71\u770C", //�a�̎R��",
						  "\u9CE5\u53D6\u770C", //���挧",
						  "\u5CF6\u6839\u770C", //������",
						  "\u5CA1\u5C71\u770C", //���R��",
						  "\u5E83\u5CF6\u770C", //�L����",
						  "\u5C71\u53E3\u770C", //�R����",
						  "\u5FB3\u5CF6\u770C", //������",
						  "\u9999\u5DDD\u770C", //���쌧",
						  "\u611B\u5A9B\u770C", //���Q��",
						  "\u9AD8\u77E5\u770C", //���m��",
						  "\u798F\u5CA1\u770C", //������",
						  "\u4F50\u8CC0\u770C", //���ꌧ",
						  "\u9577\u5D0E\u770C", //���茧",
						  "\u718A\u672C\u770C", //�F�{��",
						  "\u5927\u5206\u770C", //�啪��",
						  "\u5BAE\u5D0E\u770C", //�{�茧",
						  "\u9E7F\u5150\u5CF6\u770C", //��������",
						  "\u6C96\u7E04\u770C", //���ꌧ",
                                                  "",
                                                  "",
                                                  "\u6D77\u5916"}; //�C�O"};
}
