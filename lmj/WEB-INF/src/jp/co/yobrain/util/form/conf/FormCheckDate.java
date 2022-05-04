package jp.co.yobrain.util.form.conf;

import java.io.*;
import java.util.*;
import jp.co.yobrain.util.form.*;

/**
* ���t�`�F�b�N�p�N���X
*
*/
public class FormCheckDate implements FormCheck{

	/**
	* �����Ȃ��R���X�g���N�^
	*/
	public FormCheckDate(){
	}

	/**
	*  ���t�`�F�b�N(yyyy/m/d)(yyyymmdd)�Ή�
	* @return	CheckError CheckError�I�u�W�F�N�g
	* @param	valu	�`�F�b�N���镶����
	*/
	synchronized public CheckError convertCheck(String valu, CheckError checkError){
		String[] date;
		String day;
		
		StringBuffer sb;
		char c;

		valu = valu.replace('\uff0f', '/');
		if(valu.indexOf("/") > 0){
			date = sprit(valu, "/");
			if(date.length == 3){
				for(int i = 1; i <= 2; i++){
					switch (date[i].length()){
						case 1:
							date[i] = "0" + date[i];
							break;
						case 2:
							break;
						default:
							checkError.setError(9);
							checkError.setRstr(valu);
							return checkError;
					}
				}

			} else{
				checkError.setError(9);
				checkError.setRstr(valu);
				return checkError;
			}
			day = date[0] + date[1] + date[2];

		} else {
			day = new String(valu);
		}


		sb = new StringBuffer( day );

		for( int i = 0; i < sb.length() ; i++ ) {
			c = sb.charAt( i );
                        
                        if( c == 0xfffd){
                            checkError.setError(8);
                            checkError.setRstr(valu);
                            return checkError;
			}

			//�S�p����=>���p�����ϊ�
			if( 0xff10 <= c && c <= 0xff19 ) {
				sb.setCharAt(i, NUMBER.charAt( c - 0xff0d));
			//���p����
			} else if(0x0030 <= c && c <= 0x0039){
			//�G���[����
			} else {
				checkError.setError(9);
				checkError.setRstr(valu);
				return checkError;
			}
		}
		day = sb.toString();

		if(day.length() > 4 && day.length() < 9){
			int yy = Integer.parseInt(day.substring(0,day.length() - 4));
			int mm = Integer.parseInt(day.substring(day.length() - 4,day.length() - 2));
			int dd = Integer.parseInt(day.substring(day.length() - 2));

			if( (yy < 1 ) || (mm < 1 || mm > 12) || ( dd < 1 || dd > daysget( yy, mm) ) ){
				checkError.setError(10);
				checkError.setRstr(valu);
				return checkError;
			}
		} else {
			checkError.setError(9);
			checkError.setRstr(valu);
			return checkError;
		}
		checkError.setRstr(day);
		return checkError;
	}

	/**
	*  �w�肳�ꂽ���̓�����Ԃ����]�b�g
	* @return	int ����
	* @param	yy	����
	* @param	mm	��
	*/
	private static int daysget(int yy, int mm){

		switch(mm)
		{
		case 2:
			if( (yy % 400 == 0) || (yy % 4 == 0 && yy % 100 != 0) ) {	return 29;	} else {	return 28;	}
		case 4:
			return 30;
		case 6:
			return 30;
		case 9:
			return 30;
		case 11:
			return 30;
		default:
			return 31;
		}

	}

	/**
	*  ���������؂蕶���ŋ�؂�z��ŕԂ�
	* @return	String[]	String�z��
	* @param	str			�`�F�b�N���镶����
	* @param	delimiers	��؂蕶��
	*/
	private static String[] sprit(String str, String delimiers) {
		StringTokenizer st = new StringTokenizer(str, delimiers);
		int count = st.countTokens();
		String[] moji = new String[count];
		for(int i = 0; i < count; i++){
			moji[i] = st.nextToken();
		}
		return moji;
	}

}
