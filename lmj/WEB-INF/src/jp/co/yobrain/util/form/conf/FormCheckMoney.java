package jp.co.yobrain.util.form.conf;

/**
* �ʉ݃`�F�b�N�p�N���X
*
*/

import java.io.*;
import jp.co.yobrain.util.form.*;

public class FormCheckMoney implements FormCheck{

	/**
	* �����Ȃ��R���X�g���N�^
	*/
	public FormCheckMoney(){
	}


	/**
	* �ʉ݂Ƃ��Đ�����������
	* @return	CheckError CheckError�I�u�W�F�N�g
	* @param	valu	�`�F�b�N���镶����
	*/
	synchronized public CheckError convertCheck(String valu, CheckError checkError){
		StringBuffer sb = new StringBuffer( valu );
		StringBuffer msb = new StringBuffer();
		
		char c;
		int counter = 0;
		int counter2 = 0;

		for( int i = 0; i < sb.length() ; i++ ) {
			c = sb.charAt( i );
                        
                        if( c == 0xfffd){
                            checkError.setError(8);
                            checkError.setRstr(valu);
                            return checkError;
			}

			//�S�p�����`�F�b�N
			if( 0xff10 <= c && c <= 0xff19 ) {

				//���p�����ϊ�
				msb.append(NUMBER.charAt( c - 0xff0d));
				counter2++;
			//���p�����`�F�b�N
			} else if(0x0030 <= c && c <= 0x0039){

				msb.append(c);
				counter2++;

			//���p , ��菜��
			} else if( c == 0x002c){

			//�S�p �C��菜��
			} else if( c == 0xff0c){

			//�G���[����
			} else {
				checkError.setError(6);
				checkError.setRstr(valu);
				return checkError;
			}

		}

		if(counter2 < 1){
			checkError.setError(6);
			checkError.setRstr(valu);
			return checkError;
		}

		if(Long.parseLong(msb.toString()) < 1){
			checkError.setError(6);
			checkError.setRstr(valu);
			return checkError;
		}
		checkError.setRstr(msb.toString());
		return checkError;
	}

}