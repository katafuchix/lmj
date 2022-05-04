package jp.co.lastminute.Restrant.detail;

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
import jp.co.lastminute.Restrant.*;
import jp.co.lastminute.Restrant.jdbc.*;
import jp.co.lastminute.Restrant.cash.*;

/**
 * @author user
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public class FormAction extends Action{
DataSource dss;
	public ActionForward perform(ActionMapping mapping,
				 ActionForm form,
				 HttpServletRequest request,
				 HttpServletResponse response)
	throws IOException, ServletException
    {
    	//���ϐ������o��
    	////Session
		HttpSession session = request.getSession();
		ServletContext servletContext = servlet.getServletContext();
		this.dss = (DataSource) servletContext.getAttribute(Action.DATA_SOURCE_KEY);
    	Form actionform = (Form)form;
    	
    	//�f�[�^�x�[�X����l���擾
    	String xmlStr = "";
    	try{
	    	dbAdapterRestrant db = new dbAdapterRestrant( this.dss );
	    	xmlStr = db.getDetail( actionform );
    	}catch(Exception ex){	ex.printStackTrace();
    		return (mapping.findForward("dbfail"));
    	}
    	//���N�G�X�g��Ԃ�
		try{
			actionform.setXmlstring( xmlStr );
			return (mapping.findForward("success"));
		}catch(Exception ex){	ex.printStackTrace();
			//�G���[�J��
			return (mapping.findForward("mappingfail"));
		}	   	
    }
}
