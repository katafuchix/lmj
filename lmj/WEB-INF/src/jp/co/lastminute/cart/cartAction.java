package jp.co.lastminute.cart;

import java.io.*;
import java.text.*;
import java.util.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;
import jp.co.yobrain.util.*;
import jp.co.yobrain.util.jdbc.JdbcAdapter;
import jp.co.lastminute.cart.model.*;
import jp.co.lastminute.cart.user.*;
import jp.co.lastminute.cart.Sending.*;
import jp.co.lastminute.cart.user.jdbc.*;
import jp.co.lastminute.cart.user.model.*;
import jp.co.lastminute.cart.mailsender.*;
import jp.co.lastminute.cardauth.CardAuthClient;
import jp.co.yobrain.util.form.*;
import jp.co.lastminute.common.xml.*;
import jp.co.lastminute.*;

///////////////////////////////////////
import jp.co.lastminute.cart.prop.*;
import jp.co.lastminute.cart.check.*;
import jp.co.lastminute.cart.check.member.*;
import jp.co.lastminute.cart.jdbc.*;
import jp.co.lastminute.cart.check.product.*;
import jp.co.lastminute.cart.members.*;
import jp.co.lastminute.cart.rpc.*;
/**
 * @author user
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public class cartAction extends Action {
	DataSource dss;
	public ActionForward perform(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response) {
		////////////////
		ActionForward actionforward = new ActionForward();
		ActionErrors errors = null;
		////////////////
		HttpSession session = request.getSession();	System.err.println("<---Cart In-49-->");
		///�Z�b�V�����̔���
		if( session.getAttribute( Constants.CartOrder ) == null){	System.err.println("<---Cart In-51-->");
			return (mapping.findForward("no_product"));
		}
		if(session.getAttribute( Constants.CartUser ) == null ){	System.err.println("<---Cart In-54-->");
				//�������Ȃ��ŁA�J�ڕύX
				System.err.println("<---Cart In-56-->");
			return (mapping.findForward("no_login"));	
		}
		Order orders = (Order) session.getAttribute( Constants.CartOrder );
		if( orders.getMinStatus() >= Constants.CON_CONFIRM_ ){
			return (mapping.findForward("complete"));
		}
		User users = (User)session.getAttribute( Constants.CartUser );
		ServletContext servletContext = servlet.getServletContext();
		this.dss = (DataSource) servletContext.getAttribute(Action.DATA_SOURCE_KEY);
		//////////////////////////////////////////////
		cartForm cartform = (cartForm)form;
		////////////////�J�ڐ���///////////////////////
		String throwflg = request.getParameter( "throwflg");
		String previewflg = request.getParameter( "previewflg");
		//���[�U�[���O�C���A���[�U�[�o�^�́A�J�ڂ𓊂���H
		//�܂��A���ϖ��̃T�u�I�[�_�[�̎擾
		Sub_Order suborder = getSelectedSubOrder( orders, cartform.sub_order_no, cartform.action_type );
		int status = 0;	System.err.println("<---Cart In-71-->");
		//�G���[����
		if( request.getParameter( "throwflg") == null ){	System.err.println("<---Cart In-74-->");
			return (mapping.findForward("noaction"));
		}
		if( request.getParameter( "previewflg") == null ){	System.err.println("<---Cart In-76-->");
			return (mapping.findForward("noaction"));
		}
		if( suborder == null ){
			System.err.println("<-----<---" + throwflg + "---->----->");
			if((!throwflg.equals( Constants.STEP04_CARD ))&&
				(!throwflg.equals( Constants.STEP05_PREVIEW ))&&
				(!throwflg.equals( Constants.STEP05_CONFIRM) )){	System.err.println("<---Cart In-82-->");
				return (mapping.findForward("noaction"));
			}	System.err.println("<---Cart In-83-->");
			return (new ActionForward(mapping.getInput()));
		}
		status = suborder.status; //�X�e�[�^�X���擾
		//�C���X�^���X������N���X���N��
		Navigato navigate = (Navigato)suborder.getActionclass();
		//
		boolean profile_update = false; //�v���t�@�C���̍X�V���s�����ۂ����f
		String formname = "";	//���[�h����N���X��
		//�J�ڃp�����[�^
		int flow = navigate.isThrow();	//1�ł�������J�[�h���ς܂ōs���Ȃ��Ă͏I�����Ȃ��B
		int card = navigate.isCardAuth();
		int sending = navigate.isSending();
		suborder.setFax( navigate.isFax() ); //FAX���M�t���O���Z�b�g
		
		//
		System.err.println("<-----<---" + throwflg + "---->----->");
		//�L�����Z���n
		boolean cansel = false;
		if( throwflg.equals( Constants.STEP01_CANCELL ) ){
			if( status >= Constants.NOT_CONFIRM_ ){	//�X�e�[�^�X���A�������Ă�����L�����Z���ł��Ȃ�
				cartform.addError_comm("�����������������Ă��邽�߁A�L�����Z���ł��܂���B" );	//�A�N�V���������Ȃ�
				System.err.println("<---Cart In-104-->");
				return (new ActionForward(mapping.getInput()));
			}else{
				formname = navigate.getCancellClass();
				cansel = true;
			}
		}
		System.err.println("<---Cart In-110-->");
		//�t�����n
		boolean member = false;
		if( throwflg.equals( Constants.STEP00_MEMBER ) ){
			if( status >= Constants.CON_CONFIRM_ ){	//�X�e�[�^�X���A�������Ă�������̕ύX�͂ł��Ȃ�
				cartform.addError_comm("�����������������Ă��邽�߁A�����o�[���̕ύX�͂ł��܂���"); //�A�N�V���������Ȃ�
				System.err.println("<---Cart In-117-->");
				return (new ActionForward(mapping.getInput()));
			}else{
				formname = navigate.getMemberInfoClass();
				member = true;
			}
		}	System.err.println("<---CartIn:111--->");
		//�z����
		boolean lastflag = false; //�ŏI��ʂ��ۂ��𔻒f
		boolean sendingflg = false;
		if( throwflg.equals( Constants.STEP03_SENDING) ){
			System.err.println("Sending_Flag Up 132");
			if( status >= Constants.CON_CONFIRM_ ){
				System.err.println("Sending_Erre Status Get 134");
				cartform.addError_comm( "�����������������Ă��邽�߁A�z������̕ύX�͂ł��܂���");
				return (new ActionForward(mapping.getInput()));
			}else{
				System.err.println("Sending_ClassName Get 137");
				formname = navigate.getSendingClass();
				sendingflg = true;
			}
			if(( sendingflg )&&(orders.getSending() == 1)&&
			 (cartform.getPreviewflg().equals( Constants.SENDING_UPDATE ))){
				orders.setSending( 0 );
				orders = setSubOrdersStatus( orders, Constants.NOT_CONFIRM_, Constants.CART_IN_ );
				sendingflg = false;
				session.setAttribute( Constants.CartOrder, orders );
				return (new ActionForward(mapping.getInput()));				
			}
			if(( sendingflg )&&( cartform.getUpdate_flg().equals( "1" ) )){
				profile_update = true;
			}
			System.err.println("Sending_ClassName Get Name 145 + " + formname );
		}	System.err.println("<---CartIn:126--->");		
		//�J�[�h�֘A
		boolean card_flg = false;
		if( throwflg.equals( Constants.STEP04_CARD ) ){	System.err.println("<---CartIn:128--->");
			formname = navigate.getCardAuthClass();
			card_flg = true;
			if( previewflg.equals( "" + Constants.UPDATE_ + "" ) ){	System.err.println("<---CartIn:146--->");
				cartform.setThrowflg( Constants.STEP04_CARD );
				orders.setCard( 0 );
				session.setAttribute( Constants.CartOrder, orders );
				return (new ActionForward(mapping.getInput()));
			}
		}
		if( throwflg.equals( Constants.STEP05_CONFIRM ) ){ 
			System.err.println("<---CartIn:LAST FLAG IS OK--->");	
			lastflag = true;
		}
		try{
			if( member ){
				Memberhandler memberhandler = new Memberhandler( formname );
				memberhandler.init(  suborder.getPax(), suborder.getInfant() );
				System.err.println("<----TARGET DATE CART--" + suborder.getSALES_DATE() + "--->");
				memberhandler.setMember( request, suborder.getSALES_DATE() );
				///�X�V��Ƃ̍ۂ́A�X�e�[�^�X�𗎂Ƃ�//
				if( previewflg.equals( Constants.MEMBER_UPDATE ) ){
					orders = setRelation(orders, suborder, memberhandler.getMembers(), 0 );
					session.setAttribute( Constants.CartOrder, orders );
					ActionForward af = new ActionForward(mapping.getInput());
					return ( af );
				}
				if( !memberhandler.isReBoolean() ){	System.err.println("<---CartIn:145 Not Passwd--->");
					orders = setRelation(orders, suborder, memberhandler.getMembers(), suborder.getStatus() );
					session.setAttribute( Constants.CartOrder, orders );
					cartform.addError_comm("�����o�[�o�^�̓��͒l�ɊԈႢ������܂�");
					ActionForward af = new ActionForward(mapping.getInput());
					return ( af );
				}else{	System.err.println("<---CartIn:151-->");
					//�t���O���J�[�h�p�ɕς���
					String next = "";
					int nextstatus = 0;
					//�z����̓��͂�v������Ă��Ă܂��A�I�����Ă��Ȃ��ꍇ
					System.err.println("<---CartIn:156-->");
					if(( navigate.isSending() == 1 )&&( orders.sending == 0 )){
						System.err.println("<---CartIn:158-->");
						next = Constants.STEP03_SENDING;
					}else if(( navigate.isSending() == 0)&&( navigate.isCardAuth() >= Constants.AUTH_ONLY_)){
						System.err.println("<---CartIn:161-->");
						next = Constants.STEP04_CARD;
						nextstatus = Constants.NOT_CONFIRM_;
					}else if(( navigate.isSending() == 0)&&( navigate.isCardAuth() == 0)){
						System.err.println("<---CartIn:165-->");
						next = Constants.STEP05_PREVIEW;
						nextstatus = Constants.NOT_CONFIRM_;
					}
					System.err.println("<---CartIn:169-->");
					orders = setRelation(orders, suborder, memberhandler.getMembers(), nextstatus );
					//�Z�b�V�����ɕۑ�����B
					session.setAttribute( Constants.CartOrder, orders );
					cartform.setThrowflg( next );
					ActionForward af = new ActionForward(mapping.getInput());
					return ( af );
				}
			} //else{  System.err.println("<---CartIn:199 IN " + formname + "--->");
				if( !lastflag ){
					CheckInterface infoform = 
						( CheckInterface )Class.forName( formname ).newInstance();
					infoform.init( mapping, form, request, response, orders, servletContext ) ;	
					System.err.println("<---CartIn:201 INFORM CHK --->");
					boolean check_flg = infoform.Check();
					cartform = (cartForm)infoform.getForm();
					if( !check_flg ){	System.err.println("<---CartIn:202 INFORM FALSE --->");
						session.setAttribute( Constants.CartOrder, infoform.getOrder() );	
						ActionForward af = new ActionForward(mapping.getInput());
						///�ُ�n����
						return ( af );
					}	System.err.println("<---CartIn:208 INFORM END --->");
					orders = infoform.getOrder();
					//�J�[�h�I�[�\���m�F�Ȃ�΁A�J�[�h�̃X�e�[�^�X���グ�܂��傤
					if(card_flg){	System.err.println("<---CartIn:234 CARD FLG == --->");						
						Card_Auth cards = orders.getCard_Auth();
						cards.setCard_No( cartform.getCard_No() );
						cards.setCard_type( cartform.getCard_type() );
						cards.setExpire( cartform.getExpireMonth() + cartform.getExpire() );
						orders.setCardAuth( cards );
						orders.setCard( 1 );
					}
					//�Z�b�V�����ɕێ�����B
					//session.setAttribute( Constants.CartOrder, orders );				
					if( cansel ){	//�L�����Z�����s��
						//�T�u�I�[�_�[�폜
						orders.removeSubOrder( cartform.sub_order_no );
				    	//���z�̍Čv�Z
				    	orders.calcTotal();
				    	//�f�[�^�x�[�X�X�V
				    	modifyCannsel( orders, cartform.sub_order_no );
				    	//�폜���ăT�u�I�[�_�[���Ȃ��Ȃ�����G���[��ʂ�
				    	if( orders.getSubOrderCount() <= 0 ){	//���i���Ȃ����ʂ�
				    		///�ُ�n����
				    		return (mapping.findForward("no_product"));
				    	}
					}
					System.err.print( "L262 sendingflg IS " +  sendingflg );
					System.err.print( "L263 previewflg IS " +  previewflg );
					if( sendingflg ){	//�z����̍X�V
						cartform.setAction_type( Constants.CARD_ENDING );
						System.err.print( "Sending Update Go" );
						SendingLogicHandler handler = null;
						Product_Send productsend = handler.getProductSend( cartform, orders.getProductSend(0) );
						orders = setSubOrdersStatus( orders, Constants.CART_IN_, Constants.NOT_CONFIRM_ );//�T�u�I�[�_�[�̃X�e�[�^�X��ウ��
						//suborder.setStatus( Constants.NOT_CONFIRM_ );	
						orders.setSending( 1 );							//�z����m��
						orders.setSubOrder( suborder );	
						orders.setProductSend(productsend, 0);			//�Z���f�B���O�̃X�e�[�^�X��ウ��
					}
					if( profile_update ){	//���[�U�[�̍X�V
						Product_Send productsend = orders.getProductSend(0);
						//�v���t�@�C�����烆�[�U�[�f�[�^�ւ̕ϊ�
						Profile profile = productsend.getUserProfile(users.getProfile(), productsend);
						users.setProfile( profile );
						session.setAttribute( Constants.CartUser, users );
						orders.setProfile( 1 );		
					}
					//�����t���O��t�����͌n�ɖ߂�
					cartform.setThrowflg( Constants.STEP05_PREVIEW );
					actionforward = new ActionForward(mapping.getInput());
				}else{
					//�J�[�h�̃I�[�\�����s��
					if( isCardAuth( orders )) {
						String cardchekcclass = "jp.co.lastminute.cart.check.CardCheck";
						CheckInterface infoform = 
							( CheckInterface )Class.forName( cardchekcclass ).newInstance();
						infoform.init( mapping, form, request, response, orders, servletContext ) ;	
						if( !infoform.Check() ){	System.err.println("<---CartIn:257 INFORM FALSE --->");
							cartform = (cartForm)infoform.getForm();
							session.setAttribute( Constants.CartOrder, infoform.getOrder() );	
							ActionForward af = new ActionForward(mapping.getInput());
							///�ُ�n����
							return ( af );
						}
						String booleingclassname = getBookingClassname( orders );
						if( booleingclassname.length() > 0 ){
							String authnumber = orders.getCard_Auth().getAuth_Code();
							//�u�b�L���O���s���B
							dbProductAdapter db = (dbProductAdapter)Class.forName( booleingclassname ).newInstance();
							HashMap xmlhash = (HashMap) servletContext.getAttribute(Constants.Product_Type_Mapping_);
							Sub_Order bookingsuborder = db.bookingOrder( getBookingSubOrder(orders) , xmlhash );
							bookingsuborder.setAuthnumber( authnumber );
							//�u�b�L���O�N���X��߂��B
							orders.setSubOrder( bookingsuborder );
							//�u�b�L���O���������Ă���̂��H
							if( bookingsuborder.isBooking() ){
								session.setAttribute( Constants.CartOrder, orders );
								return (mapping.findForward("noaction"));
							}
						}
					}
					//���[���𑗐M����B
					CartMailSender cartmailsender = new CartMailSender();
					cartmailsender.init( orders, users.getProfile(), this.dss );
					cartmailsender.MailSend();
					//�f�[�^�x�[�X���X�V���X�e�[�^�X���R���t�@�[���ɃA�b�v����B
					orders = setConfirmStatus( orders, Constants.NOT_CONFIRM_, Constants.CON_CONFIRM_ , users);
					if( orders == null ){
						///�ُ�n����
						return (mapping.findForward("noaction"));					
					}
					//�ŏI��ʂɑJ��
					//actionforward = new ActionForward(mapping.getInput());
					actionforward = mapping.findForward("complete");
				}
				session.setAttribute( Constants.CartOrder, orders );
				return (actionforward);
		}catch(ClassNotFoundException cnfex){
			cnfex.printStackTrace();
		}catch(IllegalAccessException iex){
				iex.printStackTrace();
		}catch(InstantiationException itex){
			itex.printStackTrace();
		}catch(Exception ex){
			ex.printStackTrace();	
		}
		return (mapping.findForward("actionfail"));
	}
	/**
	 * �u�b�L���O�N���X�̖��̎擾
	 */
	private String getBookingClassname( Order orders ){
		for( int i=orders.getSubOrderCount()-1; i>=0; i-- ){
			Sub_Order subo = orders.getSubOrder( i );
			if( subo.status == Constants.NOT_CONFIRM_ ){
				return ((Navigato)subo.getActionclass()).getBookingClass();
			}
		}
		return "";
	}
	private Sub_Order getBookingSubOrder( Order orders ){
		for( int i=orders.getSubOrderCount()-1; i>=0; i-- ){
			Sub_Order subo = orders.getSubOrder( i );
			if( subo.status == Constants.NOT_CONFIRM_ ){
				return subo;
			}
		}
		return null;
	}
	/**
	 * �z����̃X�e�[�^�X��ύX���邽�߂ɑS�ẴX�e�[�^�X��UP
	 */
	private Order setSubOrdersStatus( Order order, int beforestatus, int nextstatus ){
		try{
			for( int i=0; i<order.getSubOrderCount(); i++ ){
				Sub_Order temp_suborder = order.getSubOrder( i );
				if(( temp_suborder.status == beforestatus )
					&&( CheckTool.isPassCart( temp_suborder.getPRODUCT_TYPE_CD() ))){
					temp_suborder.setStatus( nextstatus );
					order.setSubOrder( temp_suborder, i );
				}
			}
		}catch(Exception ex){	ex.printStackTrace();	}
		return order;
	}
	/**
	 * �����[�V�������Z�b�g���I�[�_�[��Ԃ�
	 */
	private Order setRelation( Order order, Sub_Order sub, Node members, int nextstatus ){
		int targetstatus = sub.status;
		for(int i=0; i<order.getSubOrderCount(); i++){
			System.err.println("<---CartIn:273:" + i + "-->");
			Sub_Order temp = order.getSubOrder( i );
			System.err.println( temp.getPRODUCT_TYPE_CD() ); System.err.println( temp.getAGT_CD() ); System.err.println( temp.status );
			System.err.println( sub.status );
			if(( temp.status < Constants.CON_CONFIRM_ )
			&&( temp.getPRODUCT_TYPE_CD() == sub.getPRODUCT_TYPE_CD())
			&&( temp.getAGT_CD().equals( sub.getAGT_CD() ))
			&&( temp.status == targetstatus ) ) {
				System.err.println("<---CartIn:279-->");
				temp.setMember( members );
				temp.status = nextstatus;
				order.setSubOrder( temp );
			}
			System.err.println("<---CartIn:284-->");
		}
		System.err.println("<---CartIn:286-->");
		return order;
	}
	/**
	 * �T�u�I�[�_�[�̎擾���s��
	 */
	private Sub_Order getSelectedSubOrder( Order orders, String sub_order_no, String action_type ) {
		try{
			if( sub_order_no.length() == 0){	System.err.println("<----selectedSuborder 325---->");
				for(int i=0; i<orders.getSubOrderCount(); i++){
					if( ((Sub_Order)orders.getSub_order().get( i )).status < Constants.CON_CONFIRM_ ){
						System.err.println("<----selectedSuborder 328:i " +  i +"---->");
						return ((Sub_Order)orders.getSub_order().get( i ));
					}
				}
				return null;
			}else if(action_type.equals( Constants.CANCELL )){
				System.err.println("<----selectedSuborder 332---->");
				for(int i=0; i<orders.getSubOrderCount(); i++){
					if( ((Sub_Order)orders.getSub_order().get( i )).status < Constants.NOT_CONFIRM_ ){
						Sub_Order suborder = (Sub_Order)orders.getSub_order().get( i );
						if( suborder.getSUB_ORDER_NO() ==  Integer.parseInt( sub_order_no ) ){
							return suborder;
						}
					}
				}
				return null;
			}else if( action_type.equals( Constants.MEMBER_UPDATE) ){
				System.err.println("<----selectedSuborder 343---->");
				for(int i=0; i<orders.getSubOrderCount(); i++){
					if( ((Sub_Order)orders.getSub_order().get( i )).status < Constants.CON_CONFIRM_ ){
						Sub_Order suborder = (Sub_Order)orders.getSub_order().get( i );
						if( suborder.getSUB_ORDER_NO() ==  Integer.parseInt( sub_order_no ) ){
							Navigato navig = (Navigato)suborder.getActionclass();
							if( navig.isMember() == Constants.IS_MEMBER_NEED){
								return suborder;
							}
							return null;
						}
						return null;
					}
				}
				return null;
			}
		}catch(Exception ex){	ex.printStackTrace();	}		
		return null;
	}
	/**
	 * �J�[�h�I�[�\�����K�v���H
	 */
	private boolean isCardAuth( Order order ){
		for( int i=0; i<order.getSubOrderCount(); i++){	
			Sub_Order temp = order.getSubOrder( i );
			if( temp.getStatus() == Constants.NOT_CONFIRM_ ){
				Navigato navi = (Navigato)temp.getActionclass();
				if( navi.isCardAuth() == Constants.AUTH_ONLY_ ){
					return true;
				}
				if( navi.isCardAuth() == Constants.REAL_SALE_ ){
					return true;
				}
			}
		}
		return false;
	}
	/**
	 * �X�e�[�^�X���グ�I�[�_�[��Ԃ�,�グ��I�[�_�[���Ȃ��ꍇ�́ANULL��Ԃ�,
	 * �܂��A�f�[�^�x�[�X�ւ̍X�V�������s��
	 */
	private Order setConfirmStatus( Order order, int status1, int status2, User users ){
		Vector query = new Vector();
		try{
			for(int i=0; i<order.getSubOrderCount(); i++){
				Sub_Order temp = order.getSubOrder(i);
				if( temp.status == status1 ){
					temp.setStatus( status2 );
					dbAdapterSubOrder db = new dbAdapterSubOrder();
					query.add( db.modifySubOrderStr( temp ) );				
					order.setSubOrder(temp, i);
					db = null;
				}
			}
			if( query.size() > 0 ){
				dbAdapterOrder db = new dbAdapterOrder( this.dss );
				String orderSql = db.getModifyOrderStr( order );
				int add_counter = 2;
				String profilesql = "";
				if( order.getProfile() == 1 ){
					Profile profile = (order.getProductSend(0)).getUserProfile(users.getProfile(), order.getProductSend(0) );
					dbAdapterProfile profiledb  = null;
					try{
						profilesql = profiledb.getModifyProfileStr( profile, (new JdbcAdapter()) );
						add_counter = 3;
					}catch(Exception ex){	ex.printStackTrace();	}
				}
				String[] subordersql = new String[query.size() + add_counter ];
				subordersql[ query.size() ] = orderSql;
				subordersql[ query.size() + 1 ] = getSendingSql( order.getProductSend(0) );	//�z���摗�M
				if( profilesql.length() > 0 ){
					subordersql[ query.size() + 2 ] = profilesql; //�v���t�@�C���X�V
				}
				for(int j=0; j<query.size(); j++){
					subordersql[j] = (String)query.get(j);
				}
				if( db.doBatchUpdate( subordersql )){
					db = null;
					return order;
				}
				if( db != null )	db = null;
			}
		}catch(Exception ex){	ex.printStackTrace();	
			return null;
		}
		return null;
	}
	/**
	 * �z����N�G���[�̎擾
	 */
	private String getSendingSql(Product_Send prs ) throws Exception{
		dbAdapterProductSend dbp = null;
		String reStr = "";
		if( prs.getSEND_ID() > 0){
			dbp = new dbAdapterProductSend();
			reStr = dbp.getModifyProductSendStr( prs );
		}else{
			dbp = new dbAdapterProductSend( this.dss );
			reStr = dbp.getAddProductSendStr( prs );	
		}
		dbp = null;
		return reStr;
	}
	/**
	 * �L�����Z���������s��
	 */
	private void modifyCannsel( Order order, String sub_order_no ){
		try{
			dbAdapterSubOrder subdb = new dbAdapterSubOrder();
			dbAdapterOrder db = new dbAdapterOrder( this.dss );
			String[] query = { subdb.removeSuborderStr( sub_order_no ), db.getModifyOrderStr( order )} ;
			subdb = null;
			if( db.doBatchUpdate( query )){
				db = null;
			}
			if( db != null )	db = null;
		}catch(Exception ex){	ex.printStackTrace();	}
	}
}