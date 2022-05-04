package jp.co.yobrain.util.form;

import java.io.*;
import java.util.*;
import jp.co.yobrain.util.form.*;
import jp.co.yobrain.util.form.conf.*;

/**
* Form�`�F�b�N�pCLASS
*
*/

public class Check implements Serializable{
        private CheckError check;
        //�X�^�e�B�b�N�p�����[�^
        public static final int EORROR_0 = 0;
        public static final int EORROR_1 = 1;
        public static final int EORROR_2 = 2;
        public static final int EORROR_3 = 3;
        public static final int EORROR_4 = 4;
        public static final int EORROR_5 = 5;
        public static final int EORROR_6 = 6;
        public static final int EORROR_7 = 7;
        public static final int EORROR_8 = 8;
        public static final int EORROR_9 = 9;
        public static final int EORROR_10 = 10;
                
        /**
         * �R���X�g���N�^�[
         */
        public Check(){
            check = new CheckError();
        }
        /**
	* �R���o�[�g�y�уG���[�`�F�b�N
	*
	* @return	CheckError	CheckError�I�u�W�F�N�g
	* @param	string		�`�F�b�N���镶����
	* @param	type		�`�F�b�N�^�C�v
	* @param	flag		�K�{flag true�ŕK�{
	*/
	synchronized public CheckError offSet(String string, int type, boolean flag){	
            try{
                //Null�`�F�b�N&�^�C�v�`�F�b�N
		if( string == null || jp.co.yobrain.util.form.conf.FormCheck.MAX <= type){		
                    check.setError(35);
                    return check;
		}
		//�K�{�`�F�b�N
		if(flag && string.length() < 1){
                    check.setError(37);
                    return check;
		} else if(!flag && string.length() == 0){
                    return new CheckError();
		}
		return setCheckList( type , string, check);
            }catch(Exception e){
                check.setError(999);
		check.setRstr(e.getMessage());
		return check;
            }
	}

	/**
	* �G���[�`�F�b�N(�����񒷂��`�F�b�N�t)�y�уR���o�[�g
	*
	* @return	CheckError	CheckError�I�u�W�F�N�g
	* @param	string		�`�F�b�N���镶����
	* @param	type		�`�F�b�N�^�C�v
	* @param	flag		�K�{flag true�ŕK�{
	* @param	leng1		�ŏ�������
	* @param	leng2		�ő啶����
	*/
	synchronized public CheckError offSet(String string, int type,  boolean flag, int leng1, int leng2){
            int stleng;
            try{
                //Null�`�F�b�N&�^�C�v�`�F�b�N
		if( string == null || jp.co.yobrain.util.form.conf.FormCheck.MAX <= type){
                    check.setError(35);
                    return check;
		}

		//�R���o�[�g�y�уG���[�`�F�b�N
		check = offSet(string, type, flag);
		//���łɃG���[����
		if(check.getError() > 0)    return check;

		//�R���o�[�g��̕�����
		stleng = check.getRstr().length();

		//������͈̓`�F�b�N(����)
		if(stleng < leng1 || stleng > leng2){
                    check.setError(36);
                    return check;
		}

		return check;

            }catch(Exception e){
                check.setError(999);
		check.setRstr(e.getMessage());
		return check;
            }
	}

	/**
	* �G���[�`�F�b�N(�����񒷂�&�o�C�g�`�F�b�N�t)�y�уR���o�[�g
	*
	* @return	CheckError	CheckError�I�u�W�F�N�g
	* @param	string		�`�F�b�N���镶����
	* @param	type		�`�F�b�N�^�C�v
	* @param	flag		�K�{flag true�ŕK�{
	* @param	leng1		�ŏ�������
	* @param	leng2		�ő啶����
	* @param	maxByte		�ő�o�C�g��
	*/
	synchronized public CheckError offSet(String string, int type,  boolean flag, int leng1, int leng2, int maxByte){
            int stleng;

            try{
                //Null�`�F�b�N&�^�C�v�`�F�b�N
		if( string == null || jp.co.yobrain.util.form.conf.FormCheck.MAX <= type){
                    check.setError(35);
                    return check;
		}

		//�R���o�[�g�y�уG���[�`�F�b�N
		check = offSet(string, type, flag);

		//���łɃG���[����
		if(check.getError() > 0)    return check;

		//�R���o�[�g��̕�����
		stleng = check.getRstr().length();

		//������͈̓`�F�b�N(����)
		if(stleng < leng1 || stleng > leng2){
                    check.setError(36);
                    return check;
		}

		byte[] b = check.getRstr().getBytes();

		if(b.length > maxByte){
                    check.setError(32);
                    return check;
		}
		return check;

            }catch(Exception e){
                check.setError(999);
		check.setRstr(e.getMessage());
		return check;
            }
	}

	/**
	* �G���[�`�F�b�N(�����񒷂�&�o�C�g��&�������`�F�b�N�t)�y�уR���o�[�g
	*
	* @return	CheckError	CheckError�I�u�W�F�N�g
	* @param	string		�`�F�b�N���镶����
	* @param	type		�`�F�b�N�^�C�v
	* @param	flag		�K�{flag true�ŕK�{
	* @param	leng1		�ŏ�������
	* @param	leng2		�ő啶����
	* @param	maxByte		�ő�o�C�g��
	* @param	maxDec		�ő叭��

	*/
	synchronized public CheckError offSet(String string, int type,  boolean flag, int leng1, int leng2, int maxByte, int maxDec){
            if( type != jp.co.yobrain.util.form.conf.FormCheck.TYPE_FLOAT_ ){
                return offSet(string, type,  flag, leng1, leng2, maxByte);
            }
                        
            int stleng;
            try{
			//Null�`�F�b�N&�^�C�v�`�F�b�N
		if( string == null || jp.co.yobrain.util.form.conf.FormCheck.MAX <= type){
                    check.setError(35);
                    return check;
		}

		//�R���o�[�g�y�уG���[�`�F�b�N
		check = offSet(string, type, flag);

		//���łɃG���[����
		if(check.getError() > 0)    return check;

		//�R���o�[�g��̕�����
		stleng = check.getRstr().length();

		//������͈̓`�F�b�N(����)
		if(stleng < leng1 || stleng > leng2){
                    check.setError(36);
                    return check;
		}

		byte[] b = check.getRstr().getBytes();

		if(b.length > maxByte){
                    check.setError(32);
                    return check;
		}

		int in = check.getRstr().indexOf(".");
		if(in < 0)
                    return check;

                    if((stleng - ( in + 1)) > maxDec){
                    check.setError(33);
                    return check;
		}
		return check;

            }catch(Exception e){
                check.setError(999);
		check.setRstr(e.getMessage());
		return check;
            }
	}

	/**
	* �G���[�`�F�b�N(�o�C�g���`�F�b�N�t)�y�уR���o�[�g
	*
	* @return	CheckError	CheckError�I�u�W�F�N�g
	* @param	string		�`�F�b�N���镶����
	* @param	type		�`�F�b�N�^�C�v
	* @param	flag		�K�{flag true�ŕK�{
	* @param	leng		�ő�o�C�g��
	*/
	synchronized public CheckError offSetByte(String string, int type, boolean flag, int leng){
            try{
                //Null�`�F�b�N&�^�C�v�`�F�b�N
		if( string == null || jp.co.yobrain.util.form.conf.FormCheck.MAX <= type){
                    check.setError(35);
                    return check;
		}
                //�R���o�[�g�y�уG���[�`�F�b�N
		check = offSet(string, type, flag);
		//���łɃG���[����
		if(check.getError() > 0)    return check;

		byte[] b = check.getRstr().getBytes();

		if(b.length > leng){
                    check.setError(32);
                    return check;
		}
		return check;

            }catch(Exception e){
		check = new CheckError();
		check.setError(999);
		check.setRstr(e.getMessage());
		return check;
            }
	}

	/**
	* �G���[�`�F�b�N(�������̍ő包���`�F�b�N�t)�y�уR���o�[�g
	*
	* @return	CheckError	CheckError�I�u�W�F�N�g
	* @param	string		�`�F�b�N���镶����
	* @param	type		�`�F�b�N�^�C�v
	* @param	flag		�K�{flag true�ŕK�{
	* @param	leng		�������̍ő包��
	*/
	synchronized public CheckError offSetDecimal(String string, int type, boolean flag, int leng){
            try{
                //Null�`�F�b�N&�^�C�v�`�F�b�N
		if( string == null || jp.co.yobrain.util.form.conf.FormCheck.MAX <= type){
                    check.setError(35);
                    return check;
		}

		//�R���o�[�g�y�уG���[�`�F�b�N
		check = offSet(string, type, flag);

		//���łɃG���[����
		if(check.getError() > 0)    return check;

		int  in = check.getRstr().indexOf(".");
		if(in < 0)  return check;

		if((check.getRstr().length() - ( in + 1)) > leng){
                    check.setError(33);
                    return check;
		}
                return check;
            }catch(Exception e){
                check.setError(999);
		check.setRstr(e.getMessage());
		return check;
            }
	}
        /** �`�F�b�N�I�u�W�F�N�g�Z�b�g */
	public CheckError setCheckList(int type, String stirng, CheckError checkerror){
                switch (type){
                case jp.co.yobrain.util.form.conf.FormCheck.TYPE_NUMBER_:
                    return new FormCheckNumber().convertCheck(stirng, checkerror);
                case jp.co.yobrain.util.form.conf.FormCheck.TYPE_STRING_:
                    return new FormCheckFull().convertCheck(stirng, checkerror);
                case jp.co.yobrain.util.form.conf.FormCheck.TYPE_FLOAT_:              
                    return new FormCheckNumber2().convertCheck(stirng, checkerror);
                case jp.co.yobrain.util.form.conf.FormCheck.TYPE_DATE_:
                    return new FormCheckDate().convertCheck(stirng, checkerror);
                case jp.co.yobrain.util.form.conf.FormCheck.TYPE_EMAIL_:
                    return new FormCheckEmail().convertCheck(stirng, checkerror);
                case jp.co.yobrain.util.form.conf.FormCheck.TYPE_MONEY_:
                    return new FormCheckMoney().convertCheck(stirng, checkerror);
                case jp.co.yobrain.util.form.conf.FormCheck.TYPE_ALPHABET_:
                    return new FormCheckAlphabet().convertCheck(stirng, checkerror);
                case jp.co.yobrain.util.form.conf.FormCheck.TYPE_ALPHABETNUMBER_:
                    return new FormCheckAlphabetNumber().convertCheck(stirng, checkerror);
                case jp.co.yobrain.util.form.conf.FormCheck.TYPE_DATETIME_:
                    return new FormCheckDateTime().convertCheck(stirng, checkerror);
                case jp.co.yobrain.util.form.conf.FormCheck.TYPE_PHONE_:
                    return new FormCheckTelphone().convertCheck(stirng, checkerror);
                case jp.co.yobrain.util.form.conf.FormCheck.TYPE_TWOBYTE_:
                    return new FormCheckDoublebyte().convertCheck(stirng, checkerror);
                default:
                    return new FormCheckFull().convertCheck(stirng, checkerror);
		}
	}

}