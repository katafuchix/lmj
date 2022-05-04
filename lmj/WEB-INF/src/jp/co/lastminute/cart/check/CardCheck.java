package jp.co.lastminute.cart.check;

import java.io.*;
import java.text.*;
import java.util.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;

import com.ec_one.cBank.payment.connector.model.RequestYoshinCancel;

import jp.co.yobrain.util.*;
import jp.co.yobrain.util.form.*;
import jp.co.yobrain.util.form.Check;

import jp.co.lastminute.cart.*;
import jp.co.lastminute.cart.prop.*;
import jp.co.lastminute.cart.model.*;
import jp.co.lastminute.cart.rpc.*;
import jp.co.lastminute.cart.jdbc.*;
/**
 * @author user
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public class CardCheck implements CheckInterface{
	
	public CardCheck(){}
	public void init( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response ){
		this.mapping = mapping;
		this.form = form;
		this.request = request;
        this.response = response;
	}
	synchronized public boolean CancellCheck(){
		return false;
	}
	/** Creates new ActivityCheck */
    public void init( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Order orders, ServletContext servletContext ) {
        this.mapping = mapping;
        this.form = form;
        this.request = request;
        this.response = response;
        this.servletContext = servletContext;
        this.errors = new ActionErrors();
        this.orders = orders;
    }
	synchronized public boolean Check(){
		cartForm cartform = null;
		try{
			cartform = (cartForm)this.form;
		}catch(Exception ex){	ex.printStackTrace();	}
		
		int error_sum = 0;
		//�J�[�h�m�F//
        String Card_No      = "";
        String Expire       = ((cartForm)form).getExpire() ;
        String ExpireMonth  = ((cartForm)form).getExpireMonth() ;
        String First_Name   = "";
        String Card_type    = ((cartForm)form).getCard_type();
        //�`�F�b�N���[�`��
        Check formchk;
        CheckError chError;
        //�J�[�hNO
        formchk = new jp.co.yobrain.util.form.Check();
        chError = formchk.offSet( ((cartForm)form).getCard_No() , 0, true);
        Card_No = chError.getRstr();
        if( chError.getError() > 0 ){
        	error_sum++;
        	cartform.addError_comm( "�J�[�h�ԍ��̓��͂��s���ł��B" );
        }
        chError = null;
        formchk = null;
        //
        formchk = new jp.co.yobrain.util.form.Check();
        chError = formchk.offSet( ((cartForm)form).getFirst_Name() , 1, true);
        First_Name = chError.getRstr();
        if( chError.getError() > 0 ){
        	error_sum++;
        	cartform.addError_comm( "�J�[�h���`�̓��͂��s���ł��B" );
        }
        chError = null;
        formchk = null;
        //���͒l�����������H
        if(error_sum > 0){
         	return false;
        }
        //�I�[�X�������̏ꍇ�́A�����Ń��^�[��
        if( ! request.getParameter("throwflg").equals( Constants.STEP05_CONFIRM ) ){
        	return true;
        }
        System.err.println("<---CARD CHECk ---95- PASS--->");
        //�I�[�_�[�̎擾�Z�b�V������
        Card_Auth card = new Card_Auth();
        card.setOrder_No( orders.getORDER_NO() );
        card.setCard_No( Card_No );
        card.setExpire( Expire + ExpireMonth );
        card.setFirst_Name( First_Name );
        card.setCard_type( Card_type );
        int auth_type = 0;	// 0 = �Ȃ�,�@1 = �L�����̂݁A 2 = ����
        boolean auththrow = false;	//�I�[�X�����邩�ۂ��H
        //�I�[�X�̎�ނ̔���
        int sub_order_no = 0;
        for(int index = 0; index<orders.getSubOrderCount(); index++){
        	Sub_Order temp = orders.getSubOrder( index );
        	Navigato navi = (Navigato)temp.getActionclass();
        	if( orders.getSubOrder( index ).getStatus() == Constants.NOT_CONFIRM_ ){
        		if( navi.isCardAuth() >= Constants.AUTH_ONLY_ ){
        			if( auth_type < navi.isCardAuth() ){
        				auth_type = navi.isCardAuth();
        			}
        			if( sub_order_no == 0 ){	sub_order_no = temp.getSUB_ORDER_NO();	}
        		}
        	}        	
        }
        card.setSub_order_no( sub_order_no );
        String result = "";
        //�J�[�h�̃I�[�X
        if( auth_type == Constants.AUTH_ONLY_ ){	System.err.println("<---CARD CHECk -AUTH ONLY ----->");
        	result = this.checkCard( card );
        	auththrow = true;
        }else if( auth_type == Constants.REAL_SALE_ ){	System.err.println("<---CARD CHECk -REAL SALE ----->");
        	result = this.checkCard( card, orders );
        	auththrow = true;
        }
        System.err.println("<---CARD CHECk -RESULT--  " + result + " ----->");
        System.err.println("<---CARD CHECk -RESULT--  " + auththrow + " ----->");
        //�J�[�h�̉񓚂��擾
        if(( result.indexOf( "Message" ) != -1)&&(auththrow) ){     
        	System.err.println("<---CARD CHECk -THROWW ----->");
        	String targettStr = "Message:";
        	cartform.addError_comm( "�J�[�h�G���[" + result.substring( result.indexOf( targettStr ) + targettStr.length() ) );
        	error_sum++;
        }
        card.setAuth_Code( result );
      	//�f�[�^�x�[�X�̍X�V
      	if( error_sum == 0 ){
	      	DataSource datasouse = (DataSource) servletContext.getAttribute(Action.DATA_SOURCE_KEY);
	      	if( !addCardAuth( card, datasouse) ){	System.err.println("<---CARD CHECk -DATABASE UPDATE ----->");
	      		error_sum++;
	      		cartform.addError_comm("�V�X�e����Ԃ��ُ�ł�");
	      	}
      	}
      	System.err.println("<---CARD CHECk -ALL THROW ERROR = " + error_sum + " ----->");
		if( error_sum == 0){
			return true;
		}
		return false;
	}
	/**
	 * �f�[�^�x�[�X���X�V����B
	 * 
	 */
	synchronized private boolean addCardAuth( Card_Auth card, DataSource datasouse ){               //  System.err.println("CARD_AUTH");
        dbAdapterCardAuth db = new dbAdapterCardAuth( datasouse );
        return db.addCardAuth(card);
    }
	public ActionErrors getActionErrors(){
        return this.errors;
    }
    public Order getOrder(){
    	return this.orders;	
    }
    /**
     * �L�����̊m�F
     */
    synchronized private String checkCard(Card_Auth card){
		String card_no = card.getCard_No();
        if( card_no.length() == 14 ){	card_no = "00" + card_no;	}
        ///////////////////////////
        return new rpcAdapterCardAuth().checkCard( card_no, card.getExpire().substring(2), "", "");
    }
    synchronized private String checkCard(Card_Auth card, Order orders){
        Vector sorders = orders.getSubOrders();
        int totals = 0;
        for(int i=0; i<sorders.size(); i++){
            Sub_Order sodss = (Sub_Order)sorders.elementAt( i );
            Navigato navi = (Navigato)sodss.getActionclass();
            //�X�e�[�^�X�@�P�́A�M�������e�B�t���b�O�@1�́A���ϑ҂����ϑΏ�
            if(( sodss.getStatus() == Constants.NOT_CONFIRM_ )&&
            ( navi.isCardAuth() == Constants.REAL_SALE_ )){	
                totals += sodss.getPrices() + sodss.getTax() + sodss.getSending() + sodss.getSending_tax();
            }
        }
        if( totals <= 0 )   return "";
        String card_no = card.getCard_No();
        if( card_no.length() == 14 ){	card_no = "00" + card_no;	}
        ///////////////////////////
       	return new rpcAdapterCardAuth().checkCard(card_no,
                                                    card.getExpire().substring(2),
                                                    Integer.toString( orders.getORDER_NO() ),
                                                    totals, true );
    }
    public ActionForm getForm(){
    	return this.form;
    }
    private ActionMapping mapping;
    private ActionForm form;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private ActionErrors errors;
    private ServletContext servletContext;
    private Order orders;
}
