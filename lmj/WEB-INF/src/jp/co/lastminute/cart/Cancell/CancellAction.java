package jp.co.lastminute.cart.Cancell;

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
import jp.co.yobrain.util.DataFormat;
import jp.co.yobrain.util.jdbc.JdbcAdapter;
import jp.co.yobrain.util.jdbc.Sqlmaker;
import jp.co.lastminute.*;
import jp.co.lastminute.cart.*;
import jp.co.lastminute.cart.jdbc.*;
import jp.co.lastminute.cart.prop.*;
import jp.co.lastminute.cart.model.*;
import jp.co.lastminute.cart.user.*;
import jp.co.lastminute.cart.members.*;
import jp.co.lastminute.cart.mailsender.*;
import jp.co.lastminute.cart.user.model.*;
import jp.co.lastminute.cardauth.CardAuthClient;
import jp.co.yobrain.util.form.*;
/**
 * @author user
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public class CancellAction extends Action {
	DataSource dss;
	public ActionForward perform(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response) {
		////////////////
		ActionForward actionforward = new ActionForward();
		////////////////
		HttpSession session = request.getSession();
		ServletContext servletContext = servlet.getServletContext();
		this.dss = (DataSource) servletContext.getAttribute(Action.DATA_SOURCE_KEY);

		ActionErrors errors = new ActionErrors();
		////////////////////////////
		CancellForm cancellForm = (CancellForm) form;
		cancellForm.clearError_comm();
		//String previewflg = request.getParameter("previewflg");
		String sub_order_no = cancellForm.sub_order_no;
		String id = cancellForm.id;
		String passward = cancellForm.passward;
		String previewflg = cancellForm.previewflg;
		int error_sum = 0;
		Check formchk;
		CheckError chError;
		//�I�[�_�[NO
		formchk = new jp.co.yobrain.util.form.Check();
		chError = formchk.offSet(sub_order_no, 0, true);
		sub_order_no = chError.getRstr();
		if (chError.getError() > 0) {
			error_sum++;
		}
		chError = null;
		formchk = null;
		//ID
		formchk = new jp.co.yobrain.util.form.Check();
		chError = formchk.offSet(id, 4, true);
		id = chError.getRstr();
		if (chError.getError() > 0) {
			error_sum++;
		}
		chError = null;
		formchk = null;
		//�p�X���[�h
		formchk = new jp.co.yobrain.util.form.Check();
		chError = formchk.offSet(passward, 1, true);
		passward = chError.getRstr();
		if (chError.getError() > 0) {
			error_sum++;
		}
		chError = null;
		formchk = null;
		if( error_sum > 0){
			cancellForm.addError_comm("ID,�p�X���[�h,�����ԍ��ɕs���ȓ��͂�����܂��B");
			return (new ActionForward(mapping.getInput()));
		}
		//���[�U�[ID�ƃp�X���[�h����v����
		boolean canselokflg = false;
		Vector result = null;
		JdbcAdapter db = new JdbcAdapter();
		dbDataAccesser accesser = null;
		DataFormat df  = null;
		String nowdatetime = df.getNowTimeDate("", "", "", "").substring(0, 12);
		String[] values = { id, passward, nowdatetime ,sub_order_no };
		String selectquery = Sqlmaker.strPrintf(Property.cancellsql, values);
		System.err.println(selectquery);
		if (db.init(dss)) {
			result = db.dbSelect(selectquery);
			accesser = new dbDataAccesser( result );
			db = null;
		}
		if ((result == null) || (result.size() == 0)) {
			cancellForm.addError_comm("ID,�p�X���[�h,�����ԍ��ɕs���ȓ��͂�����܂��B");
			cancellForm.setPreviewflg("");
			return (new ActionForward(mapping.getInput()));
		}
		//////�I�[�_�[�n
		Sub_Order suborder = null;
		User user = null;
		try{
			///////���[�U�[�n
	    	user = CreateSubOrder.createUser( accesser );
	    	cancellForm.setUser( user );
	    		System.err.println("<----USER IS NULL CHCK --->");
	    	if( user == null )	System.err.println("<----USER IS NULL --->");
	    	if( user.getUser() == null )	System.err.println("<----USER_TBL IS NULL --->");
	    	if( user.getProfile() == null )	System.err.println("<----PROFILE IS NULL --->");
	    		System.err.println("<----USER IS NULL CHCK END--->");
	    	//////�I�[�_�[�n
			HashMap xmlhmap = (HashMap) servletContext.getAttribute(Constants.Product_Type_Mapping_);
			String title = accesser.getData(0,4);
			cancellForm.setTitle( accesser.getData(0,4) );
	    	String price = accesser.getData(0,5);
	    	cancellForm.setPrice( accesser.getData(0,5) );
	    	String makedate = accesser.getData(0,6);
	    	cancellForm.setMakedate( accesser.getData(0,6) );
	    	suborder = CreateSubOrder.createSubOrder( accesser, user, xmlhmap );
	    	cancellForm.setSuborder( suborder );
		}catch(Exception ex){	ex.printStackTrace();	
			cancellForm.addError_comm("�V�X�e����Q���������܂����B");
			return (mapping.findForward("cansellfail"));
		}
		session.setAttribute( Constants.Cancell_SOrder, cancellForm);
    	/////
		if(previewflg.length() == 0) {
			cancellForm.setPreviewflg( Constants.CANCELL );	
		}else if(previewflg.equals( Constants.CANCELL )){
			try{
				//�N���X�����擾
				Navigato navi = (Navigato)suborder.getActionclass();
				dbProductAdapter dbp = (dbProductAdapter)Class.forName( navi.getFinalCancellClass()).newInstance();
				//�f�[�^�x�[�X�X�V
				dbp.init( dss );
				if( dbp.cancellOrder( accesser.getDatabyInt(0,3)) ){
					dbp = null;
					//�I�[�_�[�̎�����
					dbAdapterSubOrder dbsub = new dbAdapterSubOrder( this.dss );
					boolean results = false;
					if( dbsub.removeSubOrder( accesser.getData(0, 3))){
						results = true;
					}
					//���ʂ����O�ɏo��
					//���[�����M
					String seding_name = user.getProfile().getSEI_KANJI() + " " + user.getProfile().getNA_KANJI();
					CancellMailSender cancellMailSender = new CancellMailSender();
					cancellMailSender.init( suborder, id, seding_name, this.dss );
					cancellMailSender.MailSend();
					dbsub = null;
					navi = null;
					return (mapping.findForward("cansellsuccess"));
				}
				//�L�����Z���ł��Ȃ������ꍇ
				if( dbp != null )	dbp = null;
				cancellForm.addError_comm("�V�X�e����Q���������܂����B");
				return (mapping.findForward("cansellfail"));
			}catch(Exception ex){	
				ex.printStackTrace();
				return (mapping.findForward("cansellfail"));
			}
		}
		ActionForward af = new ActionForward(mapping.getInput());
		return (af);
	}

}
