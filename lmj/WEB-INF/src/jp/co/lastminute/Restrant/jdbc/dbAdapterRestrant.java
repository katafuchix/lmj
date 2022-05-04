package jp.co.lastminute.Restrant.jdbc;

import jp.co.lastminute.*;
import jp.co.lastminute.Restrant.*;
import jp.co.lastminute.Restrant.detail.*;
import jp.co.lastminute.cart.model.*;
import jp.co.lastminute.cart.jdbc.*;

import java.io.*;
import java.util.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;

import jp.co.yobrain.util.dbDataAccesser;
import jp.co.yobrain.util.jdbc.JdbcAdapter;
import jp.co.yobrain.util.DataFormat;
import jp.co.yobrain.util.jdbc.Sqlmaker;
import jp.co.yobrain.util.DataFormat;

/**
 * @author user
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public class dbAdapterRestrant implements dbProductAdapter, Serializable{
	private static final int cat_id = Property.cat_id;
	private static final String detailsql = Property.detailsql;
	private static final String courcesql = Property.courcesql;
	private static final String allotchecksql = Property.allotchecksql;
	private static final String allotcatchsql = Property.allotcatchsql;
	private static final String allotreturnsql = Property.allotreturnsql;
	private static final String listsql = Property.listsql;
	private static final String listsqlallot = Property.listsqlallot;
	private static final String listsqlscatid = Property.listsqlscatid;
	private static final String memberUpdatesql = Property.memberUpdatesql;
	private static final String suborderUpdatesql = Property.suborderUpdatesql;
	
	private DataSource ds;
	/**
	 * �R���X�g���N�^�[
	 */
	public dbAdapterRestrant() {
	}
	
	public dbAdapterRestrant(DataSource ds) {
		this.ds = ds;
	}
	public void init(DataSource ds) {
		this.ds = ds;
	}
	/**
	 * ���X�g�pXML�o��
	 */
	public String getLIst(Object obj) {
		String reStr = "";
		DataFormat dataformat = null;
		try{
			RestrantSearchCondition searchCondition = (RestrantSearchCondition)obj;
			String[] values = null;
			String sql = "";
			sql = Sqlmaker.strPrintf( sql, values );
			//�N�G���[���s
			System.err.println( sql );
			JdbcAdapter db = new JdbcAdapter();
			if( db.init( this.ds ) ){	
				Vector rows = db.dbSelect( sql );
				if( rows.size() > 0 ){	
				//�f�[�^�i�[ <NodeHandler���g���č쐬>
				NodeHandler nodeHandler = new NodeHandler();
				//nodeHandler.setSqldata( rows, searchCondition.getCheckindate(),  );
				//�f�[�^�o��
				reStr = nodeHandler.getXmlString();
				}
			} 		
		}catch(Exception ex){				
			ex.printStackTrace();
		}
		return reStr;
	}
	/**
	 * �ڍחpXML�o�́@//�@XML���o�͂���΂悢
	 */
	public String getDetail(Object obj) {
		String reStr = "";
		DataFormat dataformat = null;
		DetailHandler detailHandler = null;
		try{
			RestrantSearchCondition searchCondition = (RestrantSearchCondition)obj;
			//SQL�쐬�@{���i�R�[�h, �݌ɃR�[�h};
			//////////////////
			
			int nowtime = Integer.parseInt( dataformat.getNowTimeDate("", "", "", "").substring( 8, 12 ) );
			String nowdate = dataformat.getNowDate(0, true);
			String afterdate = dataformat.getNowDate(1, true);
			String targetdatstre = "";
			String targetdatstreafter = "";
			String restrant = searchCondition.getRestrantid();
			///���X�g�����h�c���w�肳��Ă��Ȃ��l�̓n�b�J�[���H
			if( searchCondition.getRestrantid().length() == 0){
				return "";
			}
			//XML���o�͂���΂悢
			//////////////////
			if( searchCondition.getCheckindate().length() == 0){
				targetdatstre = afterdate;
			}else if( searchCondition.getCheckindate().equals( nowdate ) ){
				targetdatstre = afterdate;
			}else if( searchCondition.getCheckindate().equals( afterdate ) ){
				if( Integer.parseInt( Property.endsale ) < nowtime ){
					targetdatstre = dataformat.getNowDate(2, true);
				}else{
					targetdatstre = afterdate;
				}
			}
			int targetdate = Integer.parseInt( targetdatstre );
			targetdatstreafter = dataformat.AddToDate( targetdatstre, Property.detail_days_length);
			/////�݌ɏo�͗p///////[ ���X�g�����h�c, �Ώۓ�, �Ώۓ� + �����W] 
			String[] values = { restrant, targetdatstre, targetdatstreafter};
			String sql = Sqlmaker.strPrintf( detailsql, values );
			////�R�[�X�o�͗p//////[ ���X�g�����h�c, �Ώۓ�, �Ώۓ� + �����W ] 
			String[] courcevalue = { restrant, targetdatstre, targetdatstreafter};
			String csql = Sqlmaker.strPrintf( courcesql, courcevalue );
			//�N�G���[���s
			System.err.println( sql );
			JdbcAdapter db = new JdbcAdapter();
			if( db.init( this.ds ) ){
				detailHandler = new DetailHandler( targetdate, restrant ); 
				Vector allotrows = db.dbSelect( sql );
				if( allotrows.size() > 0 ){
					detailHandler.setSqldata( allotrows );
				}
				Vector courcerows = db.dbSelect( csql );
				if( courcerows.size() > 0 ){
					detailHandler.setSqldataCource( courcerows );
				}
				reStr = detailHandler.detailXml();
			}
		}catch(Exception ex){	ex.printStackTrace();	}
		return reStr;
	}
	/**
	 * �݌Ɋm�F
	 */
	public int checkAllotment(Object obj) {
		int reInt = -1;
		try{
			AllotCheckCondition allotCheckCondition = (AllotCheckCondition)obj;
			String value00 = allotCheckCondition.getProduct_cd();
			String value01 = Integer.toString( allotCheckCondition.getProduct_type_cd() );
			String value02 = Integer.toString( allotCheckCondition.getAllot() );
			String[] values = { value02, value00 };
			String sql = Sqlmaker.strPrintf( allotchecksql, values );
			//�N�G���[���s
			System.err.println( sql );
			JdbcAdapter db = new JdbcAdapter();
			if( db.init( this.ds ) ){
				Vector rows = db.dbSelect( sql );
				if( rows.size() > 0 ){
					dbDataAccesser accesser = new dbDataAccesser( rows );
					reInt = accesser.getDatabyInt(0, 0);
					if( reInt < 0 )	reInt = 0;
				}
			} 
		}catch(Exception ex){}
		return reInt;
	}
	/**
	 * �݌Ɉ����߂�
	 */
	public void returnAllotment(Object obj, int allot) {
		try{
			AllotCheckCondition allotCheckCondition = (AllotCheckCondition)obj;
			String value00 = allotCheckCondition.getProduct_cd();
			String value01 = Integer.toString( allotCheckCondition.getProduct_type_cd() );
			String value02 = Integer.toString( allot );
			String[] values = { value02, value00  };
			String sql = Sqlmaker.strPrintf( allotreturnsql, values );
			//�N�G���[���s
			System.err.println( sql );
			JdbcAdapter db = new JdbcAdapter();
			if( db.init( this.ds ) ){
				db.dbUpdate( sql );
			} 
		}catch(Exception ex){}
	}
	/**
	 * �݌Ɉ���
	 */
	public boolean getAllotment(Object obj, int allot) {
		boolean rebool = false;
		try{
			AllotCheckCondition allotCheckCondition = (AllotCheckCondition)obj;
			String value00 = allotCheckCondition.getProduct_cd();
			String value01 = Integer.toString( allotCheckCondition.getProduct_type_cd() );
			String value02 = Integer.toString( allotCheckCondition.getAllot() );
			String[] values = { value02, value00 };
			String sql = Sqlmaker.strPrintf( allotcatchsql, values );
			//�N�G���[���s
			System.err.println( sql );
			JdbcAdapter db = new JdbcAdapter();
			if( db.init( this.ds ) ){
				db.dbUpdate( sql );
			} 
		}catch(Exception ex){}
		return rebool;
	}
	public boolean cancellOrder( int suborder ){
		
		return true;
	}
	public boolean memberUpdate( Sub_Order suborder){
		String[] values = new String[3];
		try{
			values[0] = "" + suborder.getPax()+ "";
			values[1] = suborder.getMemberStr();
			values[2] = "" + suborder.getSUB_ORDER_NO() + "";
			String sql = Sqlmaker.strPrintf( memberUpdatesql, values );
			//�N�G���[���s
			System.err.println( sql );
			JdbcAdapter db = new JdbcAdapter();
			if( db.init( this.ds ) ){
				return db.dbUpdate( sql );
			}
			if( db != null ){	db = null;	}
		}catch(Exception ex){	ex.printStackTrace();	}
		return false;
	}
	public boolean sendingUpdate( Sub_Order suborder, Product_Send sending ){
		return true;
		
	}
	public boolean suborderUpdate( Sub_Order suborder){
		String[] values = new String[2];
		try{
			values[0] = "" + suborder.getPax()+ "";
			values[1] = "" + suborder.getSUB_ORDER_NO() + "";
			String sql = Sqlmaker.strPrintf( suborderUpdatesql, values );
			//�N�G���[���s
			System.err.println( sql );
			JdbcAdapter db = new JdbcAdapter();
			if( db.init( this.ds ) ){
				return db.dbUpdate( sql );
			}
			if( db != null ){	db = null;	}
		}catch(Exception ex){	ex.printStackTrace();	}
		return false;
	}
	public Sub_Order bookingOrder( Sub_Order suborder ){
		return suborder;
	}
}
