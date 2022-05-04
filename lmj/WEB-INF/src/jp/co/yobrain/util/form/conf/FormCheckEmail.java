package jp.co.yobrain.util.form.conf;

import java.io.*;
import jp.co.yobrain.util.form.*;

/**
* E-mail�A�h���X�`�F�b�N�p�N���X
*
*/

public class FormCheckEmail implements FormCheck{

	/**
	* �����Ȃ��R���X�g���N�^
	*/
	public FormCheckEmail(){
	}

	/**
	* �S�p�p���𔼊p�p���ɒu����Email�A�h���X������
	* @return	CheckError CheckError�I�u�W�F�N�g
	* @param	valu	�`�F�b�N���镶����
	*/
	synchronized public CheckError convertCheck(String valu, CheckError checkError){
		String value;
		StringBuffer sb = new StringBuffer( valu );
		
		int pointer = 0;
		char c;

		// �s���ȕ������Ȃ������肷��
		for( int i = 0; sb.length() > i; i++ ){
			c = sb.charAt( i );
                        
                        if( c == 0xfffd){
                            checkError.setError(8);
                            checkError.setRstr(valu);
                            return checkError;
			}

			// �S�p �Q �[ �E �� ���p�ϊ�
			if( c == 0xff3f || c == 0x2010 || c == 0x2015 || c == 0x2212 || c == 0x30fc || c == 0xff0e || c == 0xff20){

				switch (c) {
					case 0xff3f:
						sb.setCharAt(i, ALPHABET.charAt(31));		//�S�p �Q => ���p _
						break;

					case 0x2010:
						sb.setCharAt(i, NUMBER.charAt(0));			//�S�p �\ => ���p -
						break;

					case 0x2015:
						sb.setCharAt(i, NUMBER.charAt(0));			//�S�p �\ => ���p -
						break;

					case 0x2212:
						sb.setCharAt(i, NUMBER.charAt(0));			//�S�p �\ => ���p -
						break;

					case 0x30fc:
						sb.setCharAt(i, NUMBER.charAt(0));			//�S�p �\ => ���p -
						break;

					case 0xff0e:
						sb.setCharAt(i, NUMBER.charAt(1));			//�S�p �D => ���p .
						break;

					case 0xff20:
						sb.setCharAt(i, ALPHABET.charAt(0));		//�S�p �� => ���p @
						break;

					default :
				}

			//�S�p�A���t�@�x�b=>�g���p�A���t�@�x�b�g
			} else if( (0xff21 <= c && c <= 0xff3a) || (0xff41 <= c && c <= 0xff5a)){

				sb.setCharAt(i, ALPHABET.charAt( c - 0xff20));

			//�S�p����=>���p����
			} else if ( 0xff10 <= c && c <= 0xff19 ){

				sb.setCharAt(i, NUMBER.charAt( c - 0xff0d));

			//�g�p�\���� ���p�A���t�@�x�b�g / ���p���� / @ / _ / - / .
			} else if( (0x0030 <= c && c <= 0x0039) || (0x0040 <= c && c <= 0x005a) ||
					   (0x0061 <= c && c <= 0x007a) || c == 0x002d || c == 0x002e ||
						c == 0x005f){

			//���̑��G���[����
			} else {
				checkError.setError(11);
				checkError.setRstr(valu);
				return checkError;
			}
		}

		//�u����̕�����
		value = sb.toString();

		// ���[�U���ƃz�X�g���ɕ�����
		int atpos = value.indexOf("@");
		if (atpos == -1){
			checkError.setError(12);
			checkError.setRstr(valu);
			return checkError;
		}
                int atpos_dot = value.indexOf("@.");
                if( atpos_dot > 0){
                    checkError.setError(12);
                    checkError.setRstr(valu);
                    return checkError;
                }
                /**
                int dot_atpos = value.indexOf(".@.");
                if( dot_atpos > 0){
                    checkError.setError(12);
                    checkError.setRstr(valu);
                    return checkError;
                }
                int dot_dot = value.indexOf("..");
                if( dot_dot > 0){
                    checkError.setError(12);
                    checkError.setRstr(valu);
                    return checkError;
                }
                 */
                //�Ō�̕������.���܂܂�Ă���B
                try{
                    String laststring = value.substring( value.length() - 2 );
                    if( laststring.indexOf(".") > 0){
                        checkError.setError(12);
                        checkError.setRstr(valu);
                        return checkError;                    
                    }
                }catch(Exception ex){   }
		// �A�h���X��
		String addr = value.substring(atpos + 1);
		if (addr.length() == 0){
			checkError.setError(12);
			checkError.setRstr(valu);
			return checkError;
		}

		// �A�J�E���g��
		String user = value.substring(0, atpos);
		if (user.length() == 0){
			checkError.setError(12);
			checkError.setRstr(valu);
			return checkError;
		}

		// �A�h���X���`�F�b�N
		if (addr.indexOf("@") >= 0 || addr.indexOf(".") < 0){
			checkError.setError(12);
			checkError.setRstr(valu);
			return checkError;
		}

		checkError.setRstr(value);
		return checkError;
	}
}
