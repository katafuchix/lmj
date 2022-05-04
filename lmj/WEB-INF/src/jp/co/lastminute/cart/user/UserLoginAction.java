package jp.co.lastminute.cart.user;

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
import jp.co.lastminute.cart.user.*;
import jp.co.lastminute.cart.user.model.*;
import jp.co.lastminute.cart.user.jdbc.*;
import jp.co.yobrain.util.form.*;
import jp.co.lastminute.cart.jdbc.*;
import jp.co.lastminute.cart.model.*;
import jp.co.lastminute.cart.*;

/**
 * @author user
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public class UserLoginAction extends Action{

    public ActionForward perform(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
            
        HttpSession session = request.getSession();
        ServletContext servletContext = servlet.getServletContext();
        DataSource dss = (DataSource)servletContext.getAttribute(Action.DATA_SOURCE_KEY);
        Profile pf;
        User_Tbl ut;
        User us;
 
        //�G���[�I�u�W�F�N�g����
        //ActionErrors errors = new ActionErrors();
        UserLoginForm actionform = (UserLoginForm)form;
        
        //�t�H�[������f�[�^���󂯎��
        String e_mail = actionform.getE_mail();
        String passwd = actionform.getPasswd();
        
        //�`�F�b�N���[�`��
        int error_sum = 0;
        Check formchk;
        CheckError chError;

        //----------------------------------
        //ID�̃`�F�b�N�֌W
        //----------------------------------

        int id_form_check_frg = 0;

        //ID�̃t�H�[�}�b�g���`�F�b�N����
        chError = null;
        formchk = null;
        formchk = new jp.co.yobrain.util.form.Check();
        chError = formchk.offSet(e_mail,4,true);
        e_mail = chError.getRstr();

        //ID�����͂���Ă��邩���`�F�b�N
        if(e_mail.length() == 0){
            error_sum++;
            actionform.addError_comm( "E MAIL�������͂ł�" );
            id_form_check_frg |= 1;
        }

        //ID�̃t�H�[�}�b�g�ᔽ���L��ꍇ�G���[
        if(chError.getError() > 0 && (id_form_check_frg & 1) == 0){
            error_sum++;
            actionform.addError_comm( "E MAIL�ɁA�s���ȓ��͂�����܂�" );
            id_form_check_frg |= 2;
        }

        //ID�̕��������`�F�b�N
        if(e_mail.length() > 120 && (id_form_check_frg & 3) == 0){
            error_sum++;
            actionform.addError_comm( "E MAIL���������������z���Ă��܂�" );
            id_form_check_frg |= 4;
        }

        //----------------------------------
        //�p�X���[�h�̃`�F�b�N�֌W
        //----------------------------------

        int passwd_form_check_frg = 0;

        //�p�X���[�h�̃t�H�[�}�b�g���`�F�b�N����
        chError = null;
        formchk = null;
        formchk = new jp.co.yobrain.util.form.Check();
        chError = formchk.offSet(passwd,7,true);
        passwd = chError.getRstr();

        //�p�X���[�h�����͂���Ă��邩���`�F�b�N
        if(passwd.length() == 0){
        	dbAdapterProfile dpf = new dbAdapterProfile(dss);
            us = dpf.findProfile( e_mail );
            if(( us.getUser().getUSER_ID() == 0 )&&( e_mail.length() > 0 )){
                ut = us.getUser();
                ut.setCAMPAIGNUSERFLAG( 0 );
                us.setUser( ut );
                session.setAttribute( Constants.CartUser, us);
                return (mapping.findForward("modify"));
            }
            error_sum++;
            actionform.addError_comm( "�p�X���[�h�������͂ł�" );
            passwd_form_check_frg |= 1;
        }
        
        //�p�X���[�h�̃t�H�[�}�b�g�ᔽ���L��ꍇ�G���[
        if(chError.getError() > 0 && (passwd_form_check_frg & 1) == 0){
            error_sum++;
            actionform.addError_comm( "�p�X���[�h�ɕs���ȕ������܂܂�Ă��܂�" );
            passwd_form_check_frg |= 2;
        }

        //�p�X���[�h�̕��������`�F�b�N
        if(passwd.length() > 10 && (passwd_form_check_frg & 3) == 0){
            error_sum++;
            actionform.addError_comm( "�p�X���[�h��3�����ȏ�A10�����ȓ��ł�" );
            passwd_form_check_frg |= 4;
        }

        //ID�ƃp�X���[�h�̓��͂Ɉُ킪�����ꍇ�����������s��
        int user_id = 0;
        if(id_form_check_frg == 0 && passwd_form_check_frg == 0){
            //ID�ƃp�X���[�h��DB�ɑ��݂���̂����`�F�b�N
            dbAdapterUserTbl dut = new dbAdapterUserTbl(dss);
            user_id = dut.checkUser(e_mail,passwd);
            if(user_id == 0 && error_sum == 0){
                error_sum++;
                actionform.addError_comm( "����o�^�����Ă��Ȃ��悤�ł��B�V�K����o�^�����肢���܂�" );
            }
        }
        //���͒l�����������H
        if(error_sum > 0){	
            return (new ActionForward(mapping.getInput()));
        }
        //���O�C���������s��
        dbAdapterProfile dpf = new dbAdapterProfile(dss);
        us = dpf.findProfile( user_id ); //DB���烆�[�U����ǂݍ���        
        session.setAttribute( Constants.CartUser , us);
        //����J��
        return (mapping.findForward("success"));
    }
}
