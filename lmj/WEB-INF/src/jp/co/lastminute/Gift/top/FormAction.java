package jp.co.lastminute.Gift.top;

import java.io.*;
import java.text.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;
import jp.co.yobrain.util.*;
import jp.co.lastminute.ContextProperty;
import jp.co.lastminute.Gift.*;

import jp.co.lastminute.maintenance.XmlReadServlet;

/**
 * @author user
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public class FormAction extends Action {
	
	public ActionForward perform(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response) {
		ActionForward actionforward = null;
		ActionErrors errors = null; 
		actionforward = new ActionForward();
		////Session
		HttpSession session = request.getSession();
		ServletContext servletContext = servlet.getServletContext();
		//�g�[�N�����Z�b�g
		
		//�`�F�b�N���[�`����ʉ߂��邪�A���Ƀ`�F�b�N���[�`���͂Ȃ��B
		
		String xmlStrings = "";
		
		//�J�ڂ𐧌䂷��
		Form actionform = (Form)form;
		if( actionform.getAct().length() == 0){
			actionform.setAct( Property._index );
		}
		//�R���e�L�X�g����XML�X�g�����O�̎擾
		System.err.println( "Form : start");
		try{
			//System.err.println( "Form : string length== ? ");
			if( (xmlStrings = getContextString( actionform.getAct(), servletContext )).length() == 0){
				//System.err.println( "Form : string length== 0 ");
				setContextValue( servlet.getServletConfig() );
				xmlStrings = getContextString( actionform.getAct(), servletContext );
			}
		}catch(Exception ex){	
			ex.printStackTrace();
		}
		//System.err.println( "Form Step2: string length== ? ");
		if( xmlStrings.length() > 0 ){
			//System.err.println( "Form Step2: string length > 0 ");
			actionform.setXmlstring( xmlStrings );
			//System.err.println( xmlStrings );
			return (mapping.findForward( "success" ));
		}
		//System.err.println( "Form Step3: sNG ");		
		return (mapping.findForward( "failure" ));
	}
	/**
	 * �R���e�L�X�g�}�b�v�̎擾
	 */
	private String getContextString( String act, ServletContext servletContext) {
		try{
			HashMap xmlStringsMap = (HashMap)servletContext.getAttribute( ContextProperty._Gift );
			String reStr = (String)xmlStringsMap.get( act );
			//System.out.println ( "reStr   " +reStr );
			return reStr;
		}catch(Exception ex){
			ex.printStackTrace();
			//�G���^�[�v���C�Y���O������
		}
		return "";
	}
	/**
	 * //�R���e�L�X�g��NULL��������ċN��
	 */
	private void setContextValue( ServletConfig servletConfig ) throws Exception{
		XmlReadServlet xmlReadServlet = new XmlReadServlet();
		xmlReadServlet.setServletConfig( servletConfig );
		xmlReadServlet.initGIFT_CONTEXT();
	}
}
