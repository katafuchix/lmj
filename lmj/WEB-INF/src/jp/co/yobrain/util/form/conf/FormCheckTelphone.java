package jp.co.yobrain.util.form.conf;

import java.io.*;
import jp.co.yobrain.util.form.*;

/**
* �d�b�ԍ��p�N���X
*
*/

public class FormCheckTelphone implements FormCheck{

	/**
	* �����Ȃ��R���X�g���N�^
	*/
	public FormCheckTelphone(){
	}

	/**
	* �S�p���l�𔼊p���l�ɕϊ��y�ѐ���������
	* @return	CheckError CheckError�I�u�W�F�N�g
	* @param	valu	�`�F�b�N���镶����
	*/
	synchronized public CheckError convertCheck(String valu, CheckError checkError){
		StringBuffer sb = new StringBuffer( valu );
		StringBuffer msb = new StringBuffer();
		
		char c;
		int counter2 = 0;
		for( int i = 0; i < sb.length() ; i++ ) {
			c = sb.charAt( i );
                        
                        if( c == 0xfffd){
                            checkError.setError(8);
                            checkError.setRstr(valu);
                            return checkError;
			}
                        
			//�S�p����=>���p�����ϊ�
			if( 0xff10 <= c && c <= 0xff19 ) {
				msb.append(NUMBER.charAt( c - 0xff0d));
				counter2++;
			//���p����
			} else if(0x0030 <= c && c <= 0x0039){
				msb.append(c);
				counter2++;
			//�S�p�\�𔼊p-
			}else if( 0x2010 == c){
				msb.append((char)0x002d);
				counter2++;
			//�S�p�\�𔼊p-
			}else if( 0x2015 == c){
				msb.append((char)0x002d);
				counter2++;
			//�S�p�\�𔼊p-
			}else if( 0x2212 == c){
				msb.append((char)0x002d);
				counter2++;
			//�S�p�[�𔼊p�]
			}else if( 0x30fc == c){
				msb.append((char)0x002d);
				counter2++;
			//���p�]
			}else if( 0x002d == c){
				msb.append((char)0x002d);
				counter2++;
			//�G���[����
			} else {
				int num;
				switch (c) {
					case 0x002e:			//�S�p �D
						num = 1;
						break;
					case 0x002c:			//�S�p �C
						num = 2;
						break;
					default :				//���̑��G���[����
						num = 3;
				}
				checkError.setError(num);
				checkError.setRstr(valu);
				return checkError;
			}
		}
		if(counter2 < 1){
			checkError.setError(3);
			checkError.setRstr(valu);
			return checkError;
		}
		checkError.setRstr(msb.toString());
		return checkError;
	}
}