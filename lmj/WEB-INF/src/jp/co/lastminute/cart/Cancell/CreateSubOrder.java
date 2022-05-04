package jp.co.lastminute.cart.Cancell;

import java.util.*;
import jp.co.lastminute.cart.Constants;
import jp.co.lastminute.cart.user.*;
import jp.co.lastminute.cart.user.model.*;
import jp.co.lastminute.cart.model.*;
import jp.co.lastminute.cart.prop.*;
import jp.co.lastminute.cart.members.*;
import jp.co.yobrain.util.*;
import jp.co.yobrain.util.text.QueryStringCorrect;
/**
 * @author user
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public final class CreateSubOrder {
	public static Sub_Order createSubOrder( dbDataAccesser accesser, User user, HashMap xmlhmap ) throws Exception{
		Sub_Order sub = new Sub_Order();
		sub.setORDER_NO( accesser.getDatabyInt(0, 2) );
		sub.setSUB_ORDER_NO( accesser.getDatabyInt(0, 3) );
		sub.setTITLE( accesser.getData( 0, 4) );
		sub.setPRICE( accesser.getDatabyInt(0, 5) );
		sub.setAGT_ORDER_NO( accesser.getData(0, 7) );
		sub.setAGT_CD( accesser.getData(0, 8) );
		sub.setPRODUCT_TYPE_CD( accesser.getDatabyInt(0, 9));
		sub.setPax( accesser.getDatabyInt(0, 10) );
		sub.setLAST_SALE( accesser.getDatabylong(0, 11));
		sub.setPROD_CD( accesser.getData(0, 12) );
		sub.setPROD_CD( accesser.getData(0, 13));
		sub.setAGT_PLAN_CD( accesser.getData(0, 14));
		String buy_prop = accesser.getData(0, 15);
		
		sub.setAGR_AREA_CD( accesser.getData(0, 16 ));
		sub.setInfant( accesser.getDatabyInt( 0,35 )); 
		sub.setSheat( accesser.getDatabyInt( 0,36 ) );
		sub.setSALES_DATE( accesser.getData( 0,34 ) );
		//sub.setLAST_SALE( accesser.getDatabylong( 0, 34));
		jp.co.lastminute.common.xml.XmlReader xreader = new jp.co.lastminute.common.xml.XmlReader( xmlhmap );
		String classname = xreader.getFlowClass( accesser.getData(0, 8), accesser.getDatabyInt(0, 9));
		Object obj = Class.forName( classname ).newInstance();
		//XML�̎擾
		Navigato navi = (Navigato)obj;
		if( navi.isMember() == Constants.IS_MEMBER_NEED ){
			String xmlstring = accesser.getData( 0, 33).trim();
			Memberhandler memberhandler = new Memberhandler(�@xmlstring, user, classname );
			sub.setMember( memberhandler.getMembers() );
			buy_prop = modiftBuy_prop( buy_prop, memberhandler );
			memberhandler = null;
		}
		sub.setBUY_PROP( buy_prop );
		sub.setActionclass( obj );
		return sub;
	}
	private static String modiftBuy_prop( String buy_prop, Memberhandler memberhandler ) throws Exception{
		buy_prop = QueryStringCorrect.modifyStr( "ADULT", buy_prop, "" +  memberhandler.getParentsize()  + "" );
		buy_prop = QueryStringCorrect.modifyStr( "INFANT", buy_prop, "" +  memberhandler.getChildsize()  + "" );
		return buy_prop;
	}
	/**
	 * ���[�U�[�̐���
	 */
	public static User createUser( dbDataAccesser accesser ){
		User user = new User();
		user.setUser( createUserTbl(accesser) );
		user.setProfile( createProfile(accesser) );
		return user;
	}
	/**
	 * ���[�U�[�̐���
	 */
	private static Profile createProfile( dbDataAccesser dba ){
		Profile prcd = new Profile();
		prcd.setUSER_ID( dba.getDatabyInt(0,0));    //���[�U�[ID(int)
	    prcd.setSEI_KANA(dba.getData(0,19));        //��-����(String)
	    prcd.setSEI_KANJI(dba.getData(0,17));       //��-����(String)
	    prcd.setNA_KANA(dba.getData(0,20));         //��-����(String)
	    prcd.setNA_KANJI(dba.getData(0,18));        //��-����(String)
	    prcd.setFIRST_NAME(dba.getData(0,21));      //�t�@�[�X�g�l�[��(String)
	    prcd.setLASTNAME(dba.getData(0,22));        //���X�g�l�[��(String)
	    prcd.setSEX(dba.getDatabyInt(0,23));        //����(int)
	    prcd.setBIRTH_DAY(dba.getDatabyInt(0,24));  //�a����(int)
	    prcd.setPOSTAL_CD(dba.getData(0,25));       //�X�֔ԍ�(String)
	    prcd.setSTATE_CD(dba.getDatabyInt(0,26));   //�s���{���R�[�h(int)
	    prcd.setCITY_NAME(dba.getData(0,27));       //�s�s��(String)
	    prcd.setADDRESS(dba.getData(0,28));         //�Z��(String)
	    prcd.setTEL_NO(dba.getData(0,29));          //�d�b�ԍ�(String)
	    prcd.setFAX(dba.getData(0,30));             //FAX(String)
		return prcd;
	}
	/**
	 * �v���t�@�C���̐���
	 */
	private static User_Tbl createUserTbl( dbDataAccesser dba ){
		User_Tbl uscd = new User_Tbl();
		uscd.setUSER_ID( dba.getDatabyInt(0, 0));
		uscd.setE_MAIL(dba.getData(0,31));              //E_MAIL(String)
	    uscd.setPASSWD(dba.getData(0,1));               //�p�X���[�h(String)
	    uscd.setDEALWATCHID(dba.getData(0,32));         //�f�B�[���E�H�b�`ID(String)
		return uscd;
	}
}
