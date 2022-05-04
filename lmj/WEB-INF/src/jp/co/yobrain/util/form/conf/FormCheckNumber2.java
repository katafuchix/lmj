package jp.co.yobrain.util.form.conf;

import java.io.*;
import jp.co.yobrain.util.form.*;

/**
* ���l�`�F�b�N�p�N���X
*
*/

public class FormCheckNumber2 implements FormCheck{

	/**
	* �����Ȃ��R���X�g���N�^
	*/
	public FormCheckNumber2(){
	}

	/**
	* �S�p�����𔼊p�����ɕϊ��y�ѐ��l������
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
			//���p . & �S�p �D�`�F�b�N
			} else if( c == 0xff0e || c == 0x002e ){

				// . �̌��y�шʒu�`�F�b�N
				if( counter == 0 && i > 0 && i < (sb.length() -1)){

					//�S�p �D=> ���p. �ϊ�
					if( c == 0xff0e ) c = NUMBER.charAt( c - 0xff0d);
					msb.append(c);
					counter++;

				} else if( i == (sb.length() - 1) ){

				}else{
					checkError.setError(5);
					checkError.setRstr(valu);
					return checkError;
				}

			//�G���[����
			} else {
				int num;
				switch (c) {

					case 0x002c:			//�S�p ,
						num = 2;
						break;

					default :				//���̑�
						num = 3;
				}
				checkError.setError(num);
				checkError.setRstr(valu);
				return checkError;
			}

		}

		if(counter2 < 1){
			checkError.setError(5);
			checkError.setRstr(valu);
			return checkError;
		}

		checkError.setRstr(msb.toString());
		return checkError;
	}

}