package jp.co.yobrain.util.form.conf;

import java.io.*;
import jp.co.yobrain.util.form.*;

/**
* ������`�F�b�N�p�N���X
*
*/
public class FormCheckFull implements FormCheck{

	/**
	* �����Ȃ��R���X�g���N�^
	*/
	public FormCheckFull(){
	}

	/**
	* �g�p�s�̕�����ϊ�
	* @return	CheckError	CheckError�I�u�W�F�N�g
	* @param	valu	�`�F�b�N���镶����
	*/
	synchronized public CheckError convertCheck(String valu, CheckError checkError){
		StringBuffer sb = new StringBuffer( valu );
		StringBuffer msb = new StringBuffer();
		
		char c;
		char ch ;

		for( int i = 0; i < sb.length() ; i++ ) {
			c = sb.charAt( i );
                        
                        if( c == 0xfffd){
                            checkError.setError(8);
                            checkError.setRstr(valu);
                            return checkError;
			}

			//���p���ȑS�p�J�i�ɕϊ�
			if( 0xff60 < c && c <= 0xff9d ) {

				if( (i +1) < sb.length()){
					ch = sb.charAt( i + 1 );
				} else{
					ch = ' ';
				}
				switch (ch) {
					case 0xff9e:
						msb.append(KANA[c - 0xff61][1]);
						++i;
						break;

					case 0xff9f:
						msb.append(KANA[c - 0xff61][2]);
						++i;
						break;

					default :
						msb.append(KANA[c - 0xff61][0]);
				}

			//�S�p�A���t�@�x�b�g=>���p�A���t�@�x�b�g�ϊ�
			} else if( (0xff21 <= c && c <= 0xff3a) || (0xff41 <= c && c <= 0xff5a)){

				msb.append(ALPHABET.charAt( c - 0xff20));

			//�S�p����=>���p�����ϊ�
			} else if ( 0xff10 <= c && c <= 0xff19 ){

				msb.append(NUMBER.charAt( c - 0xff0d));

			//���̑��̕���
			} else {

				//��p�����ɒu��
				switch (c) {
					case 0x301c: 					//�g��(SJIS)�𔼊p-
						msb.append((char)0x002d);
						break;

					case 0xff5e:					//�g��(MS932)�𔼊p-
						msb.append((char)0x002d);
						break;

					case 0x2010:					//�S�p�\�𔼊p-
						msb.append((char)0x002d);
						break;

					case 0x2015:					//�S�p�\�𔼊p-
						msb.append((char)0x002d);
						break;

					case 0x2212:					//�S�p�\�𔼊p-
						msb.append((char)0x002d);
						break;

					case 0x30fc:					//�S�p�[�𔼊p�]
						msb.append((char)0x002d);
						break;

					case 0x003c:					// < ���G�X�P�[�v������
						msb.append("&lt;");
						break;

					case 0x003e:					// > ���G�X�P�[�v������
						msb.append("&gt;");
						break;

					case 0x0026:					// & ���G�X�P�[�v������
						msb.append("&amp;");
						break;

					case 0x0022:					// " ���G�X�P�[�v������
						msb.append("&quot;");
						break;

					case 0x0027:					// ' ���G�X�P�[�v������
						msb.append("&#180;");
						break;

					default :						//�u������
						msb.append(c);
				}
			}
		}
		checkError.setRstr(msb.toString());
		return checkError;
	}
}