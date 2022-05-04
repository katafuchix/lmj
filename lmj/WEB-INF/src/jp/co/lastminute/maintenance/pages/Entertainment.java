package jp.co.lastminute.maintenance.pages;

import java.io.*;
import java.util.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;

import jp.co.yobrain.util.jdbc.*;
import jp.co.yobrain.util.DataFormat;
import jp.co.yobrain.util.dbDataAccesser;

import jp.co.lastminute.maintenance.Property;
import jp.co.lastminute.maintenance.xmlstruct.*;
import jp.co.lastminute.maintenance.model.*;

/**
 * @author user
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public class Entertainment extends IndexPageMaker implements Serializable{

	public static int[][] pagemetrix = jp.co.lastminute.maintenance.ticket.Property.pagemetrix;
	public static int[] page_types = jp.co.lastminute.maintenance.ticket.Property.page_types;
	public static String[] page_type_names = jp.co.lastminute.maintenance.ticket.Property.page_type_names;
	public static String page_paths = jp.co.lastminute.maintenance.ticket.Property.page_paths + "/";
	public static String targetname = jp.co.lastminute.maintenance.ticket.Property.targetname;
	private static int catid = jp.co.lastminute.maintenance.ticket.Property.product_type_cd;
	public void setpageamount( int type ) throws Exception {
		String sql = getSelectSql( page_types[ type ] );
		System.err.println( sql );
		setpageamount( type, pagemetrix[type][0], pagemetrix[type][1], sql, this.catid );
	}
	public String getSelectSql( int type ){
		String[] values = { "" + type + "" };
		String sql = Sqlmaker.strPrintf( _selectsql, values );
		return sql;
	}
	public String getViewSql( int type ){
		String[] values = { "" + type + "" };
		String sql = Sqlmaker.strPrintf( _viewsql, values );
		return sql;
	}
	public Entertainment(){	
	}
	/**
	 * XML�̐���
	 */
	public String makeXml( String contextValue, int type ){
		try{
			
			if( super.makeXml( this.xmlString(), page_type_names[ type ], page_paths ).indexOf( "-1" ) == -1 ){
				return "<script language=\"JavaScript\">\n alert('�������܂����B');\n</script>";
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return "<script language=\"JavaScript\">\n alert('���s���܂����B');\n</script>";
	}
	/**
	 * �R���e�L�X�g�̃��[�h
	 */
	public String changeContextStr(  ){
		if(  super.changeContext( targetname ) ){
			return "<script language=\"JavaScript\">\n alert('�������܂����B');\n</script>";
		}
		return "<script language=\"JavaScript\">\n alert('���s���܂����B');\n</script>";
	}
	/**
	 * �J�e�S���[�Z���N�g���擾����
	 */
	public Vector getMaintenanceView( int type ){
		Vector reVec = new Vector();
		String sql = getViewSql( type );
		System.err.println( sql );
		dbDataAccesser accesser = getSqlData( sql );
		for( int i=0; i<accesser.getRowsize(); i++){
			Mentlist mentlist = new Mentlist();
			//
			Categoryselect select 	= new Categoryselect();
			Catid_small small 		= new Catid_small();
			////////
			select.setSeqno( accesser.getDatabyInt( i, 5 ) );
			select.setPage_type( accesser.getDatabyInt( i, 8 ) );
			select.setS_catid( accesser.getDatabyInt( i, 0 ) );
			select.setStartdate( accesser.getDatabyInt( i, 3 ) );
			select.setStopdate( accesser.getDatabyInt( i, 4 ) );
			select.setDescription( accesser.getData( i, 1 ) );
			select.setProd_id_1( accesser.getData( i, 2 ) );
			
			small.setS_catid( accesser.getDatabyInt( i, 0) );
			small.setCatid( this.catid );
			small.setCatch_copy( accesser.getData( i, 7 ) );
			small.setDescription( accesser.getData( i, 1 ) );
			/////
			mentlist.setProduct_name( accesser.getData( i, 6 ) );
			mentlist.init( select, small );
			/////
			reVec.add( mentlist );
			mentlist = null;	small= null;	select = null;
		}
		return reVec;
	}
	/**
	 * �E�C���h�E���X�g���o�͂���
	 */
	public WindowList[] getWindowList( String scatid ){
		String sql = getWindowListSql( scatid );
		System.err.println( sql );
		try{
		dbDataAccesser accesser = getSqlData( sql );
		WindowList[] windolist = new WindowList[ accesser.getRowsize() ];
			for( int i=0; i<accesser.getRowsize(); i++){
				WindowList window = new WindowList();
				window.jan_cd = accesser.getData( i, 0 );
				window.agt_product_cd = accesser.getData( i, 1 );
				window.product_name = accesser.getData( i, 2 );
				window.agt_cd = accesser.getData( i, 3 );
				window.price = accesser.getData( i, 4 );
				window.allotnum = accesser.getData( i, 5 );
				window.havealt= accesser.getData( i, 6 );
				window.first_name= accesser.getData( i, 7 );
				windolist[i] = window;
				window = null;
			}
			return windolist;
		}catch(Exception ex){	ex.printStackTrace();	}
		return null;
	}
	public String getWindowListSql( String scarid ){
		String[] values = { scarid, scarid, scarid };
		String sql = Sqlmaker.strPrintf( _windowsql, values );
		return sql;
	}
	
	public static final String _windowsql = "SELECT B.PRODUCT_SEQ,"
 										+"B.JAN_CD, "
 										+"B.PRODUCT_NAME, "
 										+"B.AGT_CD, "
 										+"B.PRICE_CATCH, "
 										+"'10', "
 										+"'0', "
 										+"C.FIRST_NAME  "
										+"FROM "
										+"TICKETSACTIVTY B, "
										+"(SELECT JAN_CD FROM SCATID_MARGE WHERE S_CATID=$1) A,"
										+"AGENT_TBL C "
										+"WHERE A.JAN_CD=B.PRODUCT_SEQ AND C.AGT_CD=B.AGT_CD "
										+"ORDER BY AGT_CD,JAN_CD";
	
	public static final String _selectsql ="SELECT "
										+"A.PROD_ID_1, "
										+"A.S_CATID, "
										+"A.STARTDATE, "
										+"A.STOPDATE, "
										+"A.SEQNO, "
										+"A.PAGE_TYPE, "
										+"E.CATCHCOPY, "
										+"C.CATCH_COPY, "
										+"B.DESCRPTION, "
										+"E.PRICE_CATCH, "
										+"E.PRODUCT_NAME, "
										+"NVL( B.DESCRIPTION, '' ) DESCRIPTION"
										+" FROM  CATEGORYSELECT A,"
										+"PAGETYPE_MASTER B,"
										+"CATID_SMALL_MASTER C,"
										+"TICKETSACTIVTY E"
										+" WHERE "
										+"A.PROD_ID_1 = TO_CHAR( E.PRODUCT_SEQ ) AND "
										+"A.S_CATID=C.S_CATID AND "
										+"A.PAGE_TYPE=B.PAGE_TYPE AND "
										+"A.PAGE_TYPE=$1 ORDER BY SEQNO";
										
	public static final String _viewsql = "SELECT  "
 										+ "B.S_CATID,"		//00
 										+ "NVL(B.DESCRIPTION, ' ') DESCRIPTION,"	//01
 										+ "B.PROD_ID_1,"							//02
 										+ "B.STARTDATE,"							//03
 										+ "B.STOPDATE,"								//04
 										+ "B.SEQNO,"								//05
 										+ "C.PRODUCT_NAME,"							//06
 										+ "A.CATCH_COPY, "							//07 
 										+ "B.PAGE_TYPE"		//08
 										+ " FROM CATID_SMALL_MASTER A, "
 										+ "CATEGORYSELECT B,TICKETSACTIVTY C "
 										+ "WHERE B.PROD_ID_1=TO_CHAR(C.PRODUCT_SEQ) AND "
 										+ "B.STOP_FLG='0' AND "
 										+ "A.S_CATID=B.S_CATID AND B.PAGE_TYPE=$1 ORDER BY SEQNO";
	
}
