package jp.co.lastminute.cart.user;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import jp.co.lastminute.cart.Constants;
import jp.co.lastminute.cart.mailsender.MailSender;
import jp.co.lastminute.cart.user.jdbc.dbAdapterUserTbl;
import jp.co.lastminute.cart.user.model.PostalCode;
import jp.co.lastminute.cart.user.model.Profile;
import jp.co.lastminute.cart.user.model.User_Tbl;
import jp.co.yobrain.util.form.Check;
import jp.co.yobrain.util.form.CheckError;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 * @author user
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public class UserUpdateAction extends Action{

    public ActionForward perform(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
            
        HttpSession session = request.getSession();
        
        if( session.getAttribute( Constants.CartUser ) == null ){
        	return (mapping.findForward("notlogin"));
        }
        
        ServletContext servletContext = servlet.getServletContext();
        DataSource dss = (DataSource)servletContext.getAttribute(Action.DATA_SOURCE_KEY);
        Profile pf;
        User_Tbl ut;
        User us;
//        PostalCode pc;

        //�G���[�I�u�W�F�N�g����
        //ActionErrors errors = new ActionErrors();
		
        //�t�H�[������f�[�^���󂯎��
        UserRegistrationForm actionform = (UserRegistrationForm)form;
        String e_mail = actionform.getE_mail();
        String passwd = actionform.getPasswd();
        String oncepasswd = actionform.getOncepasswd();
        String sei_kanji = actionform.getSei_kanji();
        String na_kanji = actionform.getNa_kanji();
        String sex = actionform.getSex();
        String postal_cda = actionform.getPostal_cda();
        String postal_cdb = actionform.getPostal_cdb();
        String html_mail_ok = actionform.getHtml_mail_ok();
        //////////////////////////////////////////////////////////////////////
        String sei_kana = actionform.getSei_kana();
        String na_kana = actionform.getNa_kana();
        String state_cd = actionform.getState_cd();
        String city_name = actionform.getCity_name();
        String address = actionform.getAddress();
        String tel_no = actionform.getTel_no();
        String birthyear = actionform.getBirthyear();
        String birthmonth = actionform.getBirthmonth();

        //�`�F�b�N���[�`��
        int error_sum = 0;
        Check formchk;
        CheckError chError;

        ////////////////////////////////////////////////////////////////////////////////////////
        //----------------------------------
        //E-MAIL�̃`�F�b�N�֌W
        //----------------------------------

        int email_form_check_frg = 0;

        //E-MAIL�̃t�H�[�}�b�g���`�F�b�N����
        chError = null;
        formchk = null;
        formchk = new jp.co.yobrain.util.form.Check();
        chError = formchk.offSet(e_mail,4,true);
        e_mail = chError.getRstr();
        //E-MAIL�����͂���Ă��邩���`�F�b�N
        if(e_mail.length() == 0){
            error_sum++;
            actionform.addError_comm( "E MAIL�������͂ł�" );
            email_form_check_frg |= 1;
        }

        //E-MAIL�̃t�H�[�}�b�g�ᔽ���L��ꍇ�G���[
        if(chError.getError() > 0 && (email_form_check_frg & 1) == 0){
            error_sum++;	
            actionform.addError_comm( "E MAIL�ɁA�s���ȓ��͂�����܂�" );
            email_form_check_frg |= 2;
        }

        //E-MAIL�̕��������`�F�b�N
        if(e_mail.length() > 120 && (email_form_check_frg & 3) == 0){
            error_sum++;	
            actionform.addError_comm( "E MAIL���������������z���Ă��܂�" );
            email_form_check_frg |= 4;
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

        //----------------------------------
        //�p�X���[�h�ē��͂̃`�F�b�N�֌W
        //----------------------------------

        //�p�X���[�h�ē��͂̃t�H�[�}�b�g���`�F�b�N����
        chError = null;
        formchk = null;
        formchk = new jp.co.yobrain.util.form.Check();
        chError = formchk.offSet(oncepasswd,7,true);
        oncepasswd = chError.getRstr();

        //�p�X���[�h�ē��͂����͂���Ă��邩���`�F�b�N
        if(oncepasswd.length() == 0){
            error_sum++;	
            actionform.addError_comm( "�m�F�p�p�X���[�h�������͂ł�" );
            passwd_form_check_frg |= 8;
        }
        
        //�p�X���[�h�ē��͂̃t�H�[�}�b�g�ᔽ���L��ꍇ�G���[
        if(chError.getError() > 0 && (passwd_form_check_frg & 8) == 0){
            error_sum++;
            actionform.addError_comm( "�m�F�p�p�X���[�h�ɕs���ȕ������܂܂�Ă��܂�" );
            passwd_form_check_frg |= 16;
        }

        //�p�X���[�h�ƃp�X���[�h�̍ē��͂����������`�F�b�N
        if(!passwd.equals(oncepasswd) && passwd_form_check_frg == 0){
            error_sum++;
            actionform.addError_comm( "�p�X���[�h�Ɗm�F�p�p�X���[�h�̓��͒l���قȂ��Ă��܂�" );
            passwd_form_check_frg |= 32;
        }
        
        //----------------------------------
        //���O-�������̃`�F�b�N�֌W
        //----------------------------------

        //���O-�������̃t�H�[�}�b�g���`�F�b�N����
        chError = null;
        formchk = null;
        formchk = new jp.co.yobrain.util.form.Check();
        chError = formchk.offSet(sei_kanji,1,true);
        sei_kanji = chError.getRstr();

        //���O-�����������͂���Ă��邩���`�F�b�N
         if(sei_kanji.length() == 0){
            error_sum++;
            actionform.addError_comm( "���@�����̓��͂��Ԉ���Ă��܂�" );
        }

        //���O-�������̕��������`�F�b�N
        if(sei_kanji.length() > 30){
            error_sum++;
            actionform.addError_comm( "���@�����̕��������������z���Ă��܂�" );
        }

        //----------------------------------
        //���O-�������̃`�F�b�N�֌W
        //----------------------------------

        //���O-�������̃t�H�[�}�b�g���`�F�b�N����
        chError = null;
        formchk = null;
        formchk = new jp.co.yobrain.util.form.Check();
        chError = formchk.offSet(na_kanji,1,true);
        na_kanji = chError.getRstr();

        //���O-�����������͂���Ă��邩���`�F�b�N
        if(na_kanji.length() == 0){
            error_sum++;
            actionform.addError_comm( "���@�����̓��͂��Ԉ���Ă��܂�" );
        }

        //���O-�������̕��������`�F�b�N
        if(na_kanji.length() > 30){
            error_sum++;
            actionform.addError_comm( "���@�����̕��������������z���Ă��܂�" );
        }
        ////////////////////////////////////////////////////////
        chError = null;
        formchk = null;
        formchk = new jp.co.yobrain.util.form.Check();
        chError = formchk.offSet(sei_kana,1,true);
        sei_kana = chError.getRstr();
        if(chError.getError() > 0){
            error_sum++;
            actionform.addError_comm( "���@���Ȃ̓��͂��Ԉ���Ă��܂�" );
        }
        chError = null;
        formchk = null;
        formchk = new jp.co.yobrain.util.form.Check();
        chError = formchk.offSet(na_kana,1,true);
        na_kana = chError.getRstr();
        if(chError.getError() > 0){
            error_sum++;
            actionform.addError_comm( "���@���Ȃ̓��͂��Ԉ���Ă��܂�" );
        }
        //----------------------------------
        //���ʂ̃t�H�[�}�b�g�̃`�F�b�N�֌W
        //----------------------------------

        int sex_form_check_frg = 0;

        //���ʂ̃t�H�[�}�b�g���`�F�b�N
        chError = null;
        formchk = null;
        formchk = new jp.co.yobrain.util.form.Check();
        chError = formchk.offSet(sex,0,true);
        sex = chError.getRstr();

        //���ʂ����͂���Ă��邩���`�F�b�N
         if(sex.length() == 0){
            error_sum++;
            actionform.addError_comm( "���ʂ������͂ł�" );
            sex_form_check_frg |= 1;
        }
        
        //���ʂ̃t�H�[�}�b�g�ᔽ���L��ꍇ�G���[
        int nsex = 0;
        if(chError.getError() > 0){	
            if((sex_form_check_frg & 1) == 0){
                error_sum++;
                actionform.addError_comm( "���ʂ̓��͒l���Ԉ���Ă��܂�" );
            }
        }else{
            nsex = Integer.parseInt(sex);
        }

        //----------------------------------
        //�X�֔ԍ��i��j�̃`�F�b�N�֌W
        //----------------------------------

        int postal_form_check_frg = 0;

        //�X�֔ԍ��i��j�̃t�H�[�}�b�g���`�F�b�N
        chError = null;
        formchk = null;
        formchk = new jp.co.yobrain.util.form.Check();
        chError = formchk.offSet(postal_cda,0,true);
        postal_cda = chError.getRstr();

        //�X�֔ԍ��i��j�����͂���Ă��邩���`�F�b�N
         if(postal_cda.length() == 0){	
            error_sum++;
            actionform.addError_comm( "�X�֔ԍ��̓��͒l���Ԉ���Ă��܂�" );
            postal_form_check_frg |= 1;
        }

        //�X�֔ԍ��i��j�̃t�H�[�}�b�g�ᔽ���L��ꍇ�G���[
        if(chError.getError() > 0 && (postal_form_check_frg & 1) == 0){
            error_sum++;		
			actionform.addError_comm( "�X�֔ԍ��̓��͒l���Ԉ���Ă��܂�" );
            postal_form_check_frg |= 2;
        }

        //�X�֔ԍ��i��j�̕��������`�F�b�N
        postal_cda = chError.getRstr();
        if(postal_cda.length() != 3 && (postal_form_check_frg & 3) == 0){
            error_sum++;
            actionform.addError_comm( "�X�֔ԍ��̓��͒l���Ԉ���Ă��܂�" );
            postal_form_check_frg |= 4;
        }

        //----------------------------------
        //�X�֔ԍ��i���j�̃`�F�b�N�֌W
        //----------------------------------

        //�X�֔ԍ��i���j�̃t�H�[�}�b�g���`�F�b�N
        chError = null;
        formchk = null;
        formchk = new jp.co.yobrain.util.form.Check();
        chError = formchk.offSet(postal_cdb,0,true);
        postal_cdb = chError.getRstr();

        //�X�֔ԍ��i���j�����͂���Ă��邩���`�F�b�N
         if(postal_cdb.length() == 0){
            error_sum++;
            actionform.addError_comm( "�X�֔ԍ��̓��͒l���Ԉ���Ă��܂�" );
            postal_form_check_frg |= 8;
        }
        
        //�X�֔ԍ��i���j�̃t�H�[�}�b�g�ᔽ���L��ꍇ�G���[
        if(chError.getError() > 0 && (postal_form_check_frg & 8) == 0){
            error_sum++;
            actionform.addError_comm( "�X�֔ԍ��̓��͒l���Ԉ���Ă��܂�" );
            postal_form_check_frg |= 16;
        }

        //�X�֔ԍ��i���j�̕��������`�F�b�N
        if(postal_cdb.length() != 4 && (postal_form_check_frg & 24) == 0){
            error_sum++;
            actionform.addError_comm( "�X�֔ԍ��̓��͒l���Ԉ���Ă��܂�" );
            postal_form_check_frg |= 32;
        }
/////////////////////////////////////////////
        chError = null;
        formchk = null;
        formchk = new jp.co.yobrain.util.form.Check();
        chError = formchk.offSet(city_name,1,true);
        city_name = chError.getRstr();
        if(chError.getError() > 0){
            error_sum++;
            actionform.addError_comm( "�s�s���̓��͂��Ԉ���Ă��܂�" );
        }
        chError = null;
        formchk = null;
        formchk = new jp.co.yobrain.util.form.Check();
        chError = formchk.offSet(address,1,true);
        address = chError.getRstr();
        if(chError.getError() > 0){
            error_sum++;
            actionform.addError_comm( "�Z���̓��͂��Ԉ���Ă��܂�" );
        }
        
        chError = null;
        formchk = null;
        formchk = new jp.co.yobrain.util.form.Check();
        chError = formchk.offSet(tel_no,9,true);
        tel_no = chError.getRstr();	
        if(chError.getError() > 0){
            error_sum++;
            actionform.addError_comm( "�d�b�ԍ��̓��͂��Ԉ���Ă��܂�" );
        }
        //----------------------------------
        //HTML���[���̃`�F�b�N�֌W
        //----------------------------------

        int htmlmailok_form_check_frg = 0;

        //HTML���[���̃t�H�[�}�b�g���`�F�b�N
        chError = null;
        formchk = null;
        formchk = new jp.co.yobrain.util.form.Check();
        chError = formchk.offSet(html_mail_ok,7,true);
        html_mail_ok = chError.getRstr();

        //HTML���[�������͂���Ă��邩���`�F�b�N
         if(html_mail_ok.length() == 0){
            error_sum++;
            actionform.addError_comm( "OK�t���O�̓��͂��Ԉ���Ă��܂�" );
            htmlmailok_form_check_frg |= 1;
        }
        
        //HTML���[���̃t�H�[�}�b�g�ᔽ���L��ꍇ�G���[
        if(chError.getError() > 0 && (htmlmailok_form_check_frg & 1) == 0){
            error_sum++;
            actionform.addError_comm( "OK�t���O�̓��͂��Ԉ���Ă��܂�" );
            htmlmailok_form_check_frg |= 2;
        }

        //HTML���[���̕��������`�F�b�N
        if(html_mail_ok.length() != 1 && (htmlmailok_form_check_frg & 3) == 0){
            error_sum++;
            actionform.addError_comm( "OK�t���O�̓��͂��Ԉ���Ă��܂�" );
            htmlmailok_form_check_frg |= 4;
        }
        //----------------------------------
        //DB���Q�Ƃ���`�F�b�N�֌W
        //----------------------------------

        //ID(E-MAIL)�ƃp�X���[�h�̓��͂Ɉُ킪�����ꍇ�����������s��
        int user_id = ((UserRegistrationForm) form).getUser_id();
        boolean update_flg = false;
        if(email_form_check_frg == 0 && passwd_form_check_frg == 0){
            //ID�����ۂ�DB�ɑ��݂���̂����`�F�b�N(���łɓo�^����Ă���ꍇ�̓G���[)
            //user_id = dut.checkUser(e_mail);
            dbAdapterUserTbl dut = new dbAdapterUserTbl(dss);
            int tempuser_id = dut.checkUserRegist( e_mail )[0];         
            if( tempuser_id != user_id && tempuser_id != 0){
            	error_sum++;
                actionform.addError_comm( "����ID/�p�X���[�h�͊��ɓo�^����Ă��܂�" );
            }
        }
        //�X�֔ԍ��̓��͂Ɉُ킪�����ꍇ�����������s��
        PostalCode[] pocd = null;
        String pocdstr = postal_cda + postal_cdb;
        int state_cd_int = 0;
        ////////////////////////////////////////////
        try{
            state_cd_int = Integer.parseInt( state_cd );
        }catch(Exception e){
            error_sum++;
            actionform.addError_comm( "�s���{�����I������Ă��܂���" );
        }
        int birthday = 0;
        try{
            if((birthyear.length() > 0)&&(birthmonth.length()> 0)){
                birthday =  Integer.parseInt( birthyear + birthmonth );
            }else{
                error_sum++;
                actionform.addError_comm( "���N�����ɕs���Ȓl�����͂���Ă��܂�" );
            }
        }catch(Exception e){
            error_sum++;
            actionform.addError_comm( "���N�����ɕs���Ȓl�����͂���Ă��܂�" );
        }
        //�G���[�����������ꍇ�t�H�[���ɖ߂�A����̏ꍇ��DB�ɒǉ��������݂̏������s��
        if(error_sum == 0){
        	if( !((UserRegistrationForm)form).getThrowflg().equals( Constants.USER_UPDATE )){
       			((UserRegistrationForm)form).setThrowflg( Constants.PREVIEW );
        		return (new ActionForward(mapping.getInput()));
        	}
        	
        	dbAdapterUserTbl dut = new dbAdapterUserTbl(dss);
            
            
            //�e���f���̏�����
            pf = new Profile();     //Profile
            ut = new User_Tbl();    //User_Tbl
            us = new User();        //User
            //pc = new PostalCode(); //PostalCode

            //User_Tbl�̃f�[�^���Z�b�g����
            ut.setUSER_ID(user_id);
            ut.setE_MAIL(e_mail);
            ut.setPASSWD(passwd);
            ut.setAUTH_FLG("");
            ut.setHTML_MAIL_OK(html_mail_ok);
            ut.setMAIL_MAG_OK("");
            ut.setCAMPAIGNUSERFLAG(0);
            ut.setDEALWATCHID("AAAA");
            us.setUser(ut);

            //Profile�̃f�[�^���Z�b�g����
            pf.setUSER_ID(user_id);
            pf.setSEI_KANA(sei_kana);
            pf.setSEI_KANJI(sei_kanji);
            pf.setNA_KANA(na_kana);
            pf.setNA_KANJI(na_kanji);
            pf.setFIRST_NAME("");
            pf.setLASTNAME("");
            pf.setSEX(nsex);
            pf.setBIRTH_DAY( birthday );
            pf.setPOSTAL_CD( pocdstr );
            pf.setSTATE_CD( state_cd_int );
            pf.setCITY_NAME(city_name);
            pf.setADDRESS(address);
            pf.setTEL_NO(tel_no);
            pf.setFAX("");
            us.setProfile(pf);

            //DB�ɓo�^������
            boolean db_success = false;
            db_success = dut.modifyUserTbl(ut, pf); //UserTbl�̒ǉ�
                                  
			if( db_success ){
	            //�Z�b�V�����Ŏ��̉�ʂɓn��
	            session.setAttribute(Constants.CartUser ,us);
	            return (mapping.findForward("success_fail"));	//����J��
			}else{
				actionform.addError_comm( "�V�X�e����Q�ł�" );
			}
        }
		return (new ActionForward(mapping.getInput()));
        //���̉�ʂ֔��
    }
}
