package jp.co.yobrain.util.form.conf;

import jp.co.yobrain.util.form.*;

/**
* �A���t�@�x�b�g�`�F�b�N�p�N���X
*
*/

import java.io.*;

public class FormCheckAlphabet implements FormCheck{

	/**
	* �����Ȃ��R���X�g���N�^
	*/
	public FormCheckAlphabet(){
	}

	/**
	* �S�p�A���t�@�x�b�g�𔼊p�A���t�@�x�b�g�ɕϊ��y�уA���t�@�x�b�g������
	* @return	CheckError CheckError�I�u�W�F�N�g
	* @param	valu	�`�F�b�N���镶����
	*/
	synchronized public CheckError convertCheck(String valu, CheckError checkError){
		StringBuffer sb = new StringBuffer( valu );
		StringBuffer msb = new StringBuffer();
		char c;

		for( int i = 0; i < sb.length() ; i++ ) {
			c = sb.charAt( i );
                        
                        if( c == 0xfffd){
                            checkError.setError(8);
                            checkError.setRstr(valu);
                            return checkError;
			}

			//�S�p�A���t�@�x�b�g=>���p�A���t�@�x�b�g�ϊ�
			if((0xff21 <= c && c <= 0xff3a) || (0xff41 <= c && c <= 0xff5a)) {

				msb.append(ALPHABET.charAt( c - 0xff20));

			//���p�A���t�@�x�b�g
			} else if((0x0041 <= c && c <= 0x005a) || (0x0061 <= c && c <= 0x007a)){

				msb.append(c);

			//�A���t�@�x�b�g�ȊO
			} else {
				checkError.setError(31);
				checkError.setRstr(valu);
				return checkError;
			}

		}

		checkError.setRstr(msb.toString());
		return checkError;
	}

}