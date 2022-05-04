package jp.co.lastminute.cart.prop;

import jp.co.lastminute.cart.model.Sub_Order;
import jp.co.lastminute.cart.Constants;

/**
 * @author user
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public class Restrant implements Navigato{
	private int flow = Constants.IS_THROW_NG;
	private int cards = Constants.REAL_SALE_;
	private int fax = Constants.IS_FAX_PASS;
	private int sending = Constants.IS_SENDING_PASS;
	private int member = Constants.IS_MEMBER_NEED;
	private int modify = Constants.IS_MODIFY_OK;

	public Restrant(){}
	public int isThrow(){
		return flow;
	}
	public String getMemberInfoClass(){
		return "jp.co.lastminute.cart.check.member.RestrantCheck";
	}
	public String getSendingClass(){
		return "jp.co.lastminute.cart.sending.DflightCheck";
	}
	public String getBookingClass(){
		return "";
	}
	public int isMember(){
		return member;	
	}
	public int isSending(){
		return sending;
	}
	public int isCardAuth(){
		return cards;
	}
	public int isFax(){
		return fax;
	}
	public int isModify(){
		return modify;
	}
	public String getFinalCancellClass(){
		return "jp.co.lastminute.Restrant.jdbc.dbAdapterRestrant";
	}
	public String getCancellClass(){
		return "jp.co.lastminute.cart.check.DelCheck";
	}
	public String getAllotCheckClass(){
		return "jp.co.lastminute.Restrant.jdbc.dbAdapterRestrant";
	}
	public String getAllotReturnClass(){
		return "jp.co.lastminute.Restrant.jdbc.dbAdapterRestrant";
	}
	public String getCardAuthClass(){
		return "jp.co.lastminute.cart.check.CardCheck";
	}
	public String getMemberUpdateClass(){
		return "jp.co.lastminute.Restrant.jdbc.dbAdapterRestrant";
	}
	public String getSendingUpdateClass(){
		return "jp.co.lastminute.Restrant.jdbc.dbAdapterRestrant";
	}
	public String getSubOrderCheckClass(){
		return "jp.co.lastminute.cart.check.ModifyPax";
	}
	public String getSubOrderUpdateClass(){
		return "jp.co.lastminute.Restrant.jdbc.dbAdapterRestrant";
	}
}
