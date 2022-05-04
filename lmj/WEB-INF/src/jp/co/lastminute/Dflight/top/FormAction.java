package jp.co.lastminute.Dflight.top;

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
import jp.co.lastminute.cash.*;
import jp.co.lastminute.Dflight.*;
import jp.co.lastminute.Dflight.cash.*;

/**
 * @author user
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public class FormAction extends Action {
        
	private DataSource dataSource;
	
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
		this.dataSource = (DataSource) servletContext.getAttribute(Action.DATA_SOURCE_KEY);
		//�g�[�N�����Z�b�g
		
		//�`�F�b�N���[�`����ʉ߂���
		CheckForm checkForm = new CheckForm( mapping, form, request, response);
        if( !checkForm.Check() ){
        	//�g�[�N�����������Z�b�g
           	errors = checkForm.getActionErrors();
            saveErrors( request, errors );
           return (new ActionForward(mapping.getInput()));
        }
		
		//�J�ڂ𐧌䂷��
		Form actionform = (Form)form;
		String throwflg = ((Form)form).getThrowflg();
		
		//�C���f�b�N�X�̎擾�ƃR���e�L�X�g�̕ێ�/XML���o�͂��A�Z�b�V�����ɒǉ�����B
		CashMaker cashMaker = null;
		String makedStr = "";
		if( servletContext.getAttribute( Property.listcash ) == null ){
			cashMaker = new CashMaker();
		}else{
			cashMaker = (CashMaker)servletContext.getAttribute( Property.listcash );
		}
		makedStr = cashMaker.getXML( dataSource, form );
		if( cashMaker.mustReload() ){
			servletContext.setAttribute( Property.listcash, cashMaker );
		}
		try{
			actionform.setXmlstring( makedStr );
		//System.err.println("<//// ----- Top FormAction----. 8>");
		//System.err.println("\n\n<!--XML" + makedStr + "-->\n\n");
			if( makedStr.length() == 0 ){	//�����W���Ȃ��ꍇ
				errors = checkForm.getActionErrors();
	            saveErrors( request, errors );
	           	return (new ActionForward(mapping.getInput()));	
			}
		}catch(Exception ex){
			ex.printStackTrace();
			errors = checkForm.getActionErrors();
            saveErrors( request, errors );
           	return (new ActionForward(mapping.getInput()));			
		}
		//System.err.println( makedStr );
		//System.err.println("<//// ----- Top FormAction----. 9>");
		//�g�[�N������������H
		return (mapping.findForward( "success" ));
	}
}
