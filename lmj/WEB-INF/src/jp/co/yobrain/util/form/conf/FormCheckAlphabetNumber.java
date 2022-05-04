package jp.co.yobrain.util.form.conf;

import jp.co.yobrain.util.form.*;

/**
* �A���t�@�x�b�g�`�F�b�N�p�N���X
*
*/

import java.io.*;

public class FormCheckAlphabetNumber implements FormCheck{

	/**
	* �����Ȃ��R���X�g���N�^
	*/
	public FormCheckAlphabetNumber(){
	}


	/**
	* �S�p�p�����𔼊p�p�����ɕϊ��y�щp����������<BR>
	* �p����(�A���t�@�x�b�g������)
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

			//�S�p�A���t�@�x�b�g
			if((0xff21 <= c && c <= 0xff3a) || (0xff41 <= c && c <= 0xff5a)) {
				//�S�p�A���t�@�x�b�g=>���p�A���t�@�x�b�g�ϊ�
				msb.append(ALPHABET.charAt( c - 0xff20));

			//���p�A���t�@�x�b�g
			} else if((0x0041 <= c && c <= 0x005a) || (0x0061 <= c && c <= 0x007a)){

				msb.append(c);

			//�S�p����
			} else if( 0xff10 <= c && c <= 0xff19 ) {
				//�S�p����=>���p�����ϊ�
				msb.append(NUMBER.charAt( c - 0xff0d));

			//���p����
			} else if(0x0030 <= c && c <= 0x0039){

				msb.append(c);

			//�p�����ȊO
			} else {
				checkError.setError(34);
				checkError.setRstr(valu);
				return checkError;
			}

		}
		checkError.setRstr(msb.toString());
		return checkError;
	}

}