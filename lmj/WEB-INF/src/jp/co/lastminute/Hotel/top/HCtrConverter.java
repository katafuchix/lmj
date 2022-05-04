package jp.co.lastminute.Hotel.top;

import jp.co.lastminute.Hotel.Property;

/**
 * @author user
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public final class HCtrConverter {
	private static String pagt_cd = Property.pagt_cd;
	private static final String[] target = {"�o�X�t62", "�o�X�t61"};
	private static final String[] chStr = {"�o�X�t�f���b�N�X�c�C��", "�o�X�t�X�^���_�[�h�c�C��"};
	public static String getMealType(String meal_code) {
		try {
			int id = Integer.parseInt(meal_code);
			if (id == 2)	return "���[�H����";
			if (id == 4)	return "���H����";
			if (id == 6)	return "�H���Ȃ�";			
		} catch (Exception e){	e.printStackTrace();	}
		return "�H���Ȃ�";
	}
	public String getMealCodeTxt(String code, String agt_cd ) {
		if( agt_cd.equals( pagt_cd ) ){	return getMealType( code );	}
		if ("00".equals(code))	return "�H���Ȃ�";
		if ("10".equals(code))	return "���H����";
		return "���[�H����";
	}
	public static String modifyTxt(String str) {
		for( int i=0; i<target.length; i++){
			if( target[ i ].indexOf(str) >= 0){
				return chStr[ i ];
			}
		}
		return str;
	}
	public static String getRoomTypeTxt(String str) {
		if ( "007".equals(str) ) return  "�V���O��";
		else if ("107".equals(str)) return  "�c�C��";
		else if ("108".equals(str)) return  "�_�u��";
		else if ("041".equals(str)) return "�m���^�C�v";
		else if ("038".equals(str)) return "�a���^�C�v";
		else if ("040".equals(str)) return "���ʎ�";
		return "";

	}
	public static String getFooter( String agt_cd ){
		if( agt_cd.equals( pagt_cd ) ){
			return "���s��z�F�ߋE���{�c�[���X�g<br/>"
				   +"��t���ԁF���� AM 6:00 �` �� AM 3:00 / �x�� AM 8:00 �` �� AM 0:00<br/>"
				   +"�����i�����\��̏ꍇ�́A�\���������x���������������ƂȂ��ɁA���s�_��̒����ƂȂ�܂��B<br/>"
				   +"�Ȃ��A�\�񑀍슮�����ɕ\������u���\��m�F��ʁv�������āA�u�����s���󏑁v�Ƃ��܂��̂ŁA������A�ۊǂ��Ă��������B";			
		}
		return "";
	}
}
