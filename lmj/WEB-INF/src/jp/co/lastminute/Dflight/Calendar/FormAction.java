package jp.co.lastminute.Dflight.Calendar;

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
import jp.co.lastminute.Dflight.*;
import jp.co.lastminute.Dflight.jdbc.*;
import jp.co.lastminute.Dflight.cash.*;
import jp.co.lastminute.cart.Constants;

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
		
		//�g�[�N�����Z�b�g
		
		//�`�F�b�N���[�`����ʉ߂���
		CheckForm checkForm = new CheckForm( mapping, form, request, response);
        if( !checkForm.Check() ){
        	//�g�[�N�����������Z�b�g
           	errors = checkForm.getActionErrors();
            saveErrors( request, errors );
           return (mapping.findForward( "fail" ));
        }
		Form actionform = (Form)form;
		//�J�ڂ𐧌䂷��
		String throwflg = ((Form)form).getThrowflg();
		
		//�C���f�b�N�X�̎擾�ƃR���e�L�X�g�̕ێ�/XML���o�͂��A���N�G�X�g�ɒǉ�����B
		//XML���擾����
		String xmlStr = "";
		System.err.println("<------ FORM ACTION BEFORE----->");
		try{
			dbAdapterDflight db = new dbAdapterDflight( (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY));
			xmlStr = db.getLIst( form );
			
			//�g�[�N������������H
			if( xmlStr.length() > 0 ){
				actionform.setXmlstring( xmlStr );
				System.err.println("<------ FORM ACTION SUCCESS----->");
				//request.setAttribute( Constants.Calendar, xmlStr);
				return (mapping.findForward( "success" ));
			}	
		}catch(Exception ex){ ex.printStackTrace();	}
		System.err.println("<------ FORM ACTION FAIL----->");
		return (mapping.findForward( "fail" ));
	}

}
