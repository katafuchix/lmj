package jp.co.yobrain.util.form.conf;

import jp.co.yobrain.util.form.*;

/**
* �A���t�@�x�b�g�`�F�b�N�p�N���X
*
*/

import java.io.*;

public class FormCheckDoublebyte implements FormCheck{

	/**
	* �����Ȃ��R���X�g���N�^
	*/
	public FormCheckDoublebyte(){
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
                        if( c > 127 ){
                            msb.append(c);
			//�A���t�@�x�b�g�ȊO
			} else {
                            checkError.setError(91);
                            checkError.setRstr(valu);
                            return checkError;
			}
		}
		checkError.setRstr(msb.toString());
		return checkError;
	}

}