/*
 * CheckLogonTag.java
 *
 * Created on 2002/04/27, 13:36
 */

package jp.co.lastminute.cart.taglib;

import java.util.*;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import jp.co.lastminute.cart.*;
import org.apache.struts.action.*;
import jp.co.lastminute.cart.jdbc.*;
import jp.co.lastminute.cart.model.*;
import jp.co.lastminute.cart.user.*;
import javax.sql.*;

/**
 *
 * @author  skondo
 * @version 
 */
public class CheckLogonTag extends TagSupport {
    private String name = Constants.CartUser ;
    private String page = Constants.LOGON_PAGE;

    public String getName() {
	return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    /**
     * �X�^�[�g�^�O
     */
    public int doStartTag() throws JspException {
        return (SKIP_BODY);
    }
    /**
     * �G���h�^�O
     */
    public int doEndTag() throws JspException {
        //���O�C���̔��f
        boolean valid = false;	//�J��OK����
        String redirect = "";
        HttpSession session = pageContext.getSession();
        HttpServletRequest req = ( HttpServletRequest )pageContext.getRequest();
        try{
        	//���_�C���N�g�̗v�������邩�ۂ��𔻒f���Z�b�V�����ɕێ�
	        if(( req.getParameterValues( Constants.REDIRECT_PARAMETER_NAME ) != null )
	        	&&(session.getAttribute( Constants.AFTER_CARTID_ ) == null)){
	            session.setAttribute( Constants.AFTER_CARTID_ , 
	            					  req.getParameterValues( Constants.REDIRECT_PARAMETER_NAME )[0] );
	        }
	        //�Z�b�V�����𔻒f���t�H���[�h
	        if( session.getAttribute( Constants.AFTER_CARTID_ ) != null ){
	            if( ((String)session.getAttribute( Constants.AFTER_CARTID_ )).length() > 0 ){
	            	pageContext.forward( Constants.AFTER_CART_IN_REDIRECT_  );
	            }
	        }
			//���O�C������	
			//System.err.println(	"[] LOGIN Step 0000 []");
	        if ((session != null) && (session.getAttribute(name) != null)) {	//System.err.println(	"[] LOGIN Step 00 -1 []");
	            if(session.getAttribute(name) != null){ 	//System.err.println(	"[] LOGIN Step 00 []");
	                if( session.getAttribute( Constants.CartOrder ) != null){	//System.err.println(	"[] LOGIN Step 01-1 []");
	                	Order order = (Order)session.getAttribute(Constants.CartOrder);
	                	int user_id = ((User)session.getAttribute( name )).getUser().getUSER_ID();
	                	//�I�[�_�[�ɂāA���[�U�[ID���Z�b�g����Ă��āA���[�U�[ID�����݂���ꍇ
	                	if(( order.getUSER_ID() > 0 )
	                		&&( user_id == order.getUSER_ID())
	                		&&( order.getORDER_NO() > 0 )){		//System.err.println(	"[] LOGIN Step 01 []");
	                		valid = true; 
	                	}else{	//�f�[�^�x�[�X�ɓo�^�������ꍇ
		                	order.setUSER_ID( user_id );		//System.err.println(	"[] LOGIN Step 02 []");
		                    //�v���p�e�B�̊m�F
		                    if( order.getExec_type() == Constants.INSERT_ ){	//System.err.println(	"[] LOGIN Step 03 []");
		                    	//�C���T�[�g�t���b�O�������Ă���΃C���T�[�g���s�� 
		                    	ServletContext servletContext = pageContext.getServletContext();
		                    	DataSource dss = ((DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY ));                   	
		  						dbAdapterOrder db = new dbAdapterOrder( ((DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY )) );
		                    	///�I�[�_�[�C���T�[�g���s��
								int orderno = db.addOrder( order );
								if( orderno > 0 ){		//System.err.println(	"[] LOGIN Step 04 []");
									order.setORDER_NO( orderno );
									order.setExec_type( Constants.UPDATE_ );
									order = setProductSend( order, session.getAttribute( name ) );
									for( int i=0; i<order.getSubOrderCount(); i++){
										Sub_Order tempsub = order.getSubOrder( i );
										tempsub.setORDER_NO( orderno );
										order.setSubOrder( tempsub, i );
									}
									session.setAttribute( Constants.CartOrder , order );
									valid = true; 
								}
		                        db = null;
		                    }
	                    }
	                }else{	page = Constants.NO_PRODUCT;	}
	            }
			}
	        if (valid) {	//���O�C��������
	        	return (EVAL_PAGE);                  
	        }
	        pageContext.forward(page);
        }catch( Exception e ){	
        	e.printStackTrace();
        	throw new JspException(e.toString());
        }
        return (SKIP_PAGE);
    }
    private Order setProductSend( Order order, Object obj ){
    	User user = (User)obj;
    	Product_Send productsend = order.getProductSend( 0 );
    	productsend.setProfile( user.getProfile() );
    	productsend.setE_MAIL( user.getUser().getE_MAIL() );
    	productsend.setUSER_ID( user.getUser().getUSER_ID() );
    	productsend.setORDER_NO( order.getORDER_NO() );
    	order.setProductSend(productsend, 0);
    	order.setUSER_ID( user.getUser().getUSER_ID() );
    	return order;
    }
}
