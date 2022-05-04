package jp.co.lastminute.common;

import java.io.*;
/**
 * @author user
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public final class StateToString {
	private static final String[] States = {"",
											   "�k�C��","�X��","��茧","�{�錧","�H�c��",
											"�R�`��","������","��錧","�Ȗ،�","�Q�n��",
											"��ʌ�","��t��","�����s","�_�ސ쌧","�R����",
											"���쌧","�V����","�x�R��","�ΐ쌧","���䌧",
											"�򕌌�","�É���","���m��","�O�d��","���ꌧ",
											"���s�{","���{","���Ɍ�","�ޗǌ�","�a�̎R��",
											"���挧","������","���R��","�L����","�R����",
											"������","���쌧","���Q��","���m��","������",
											"���ꌧ","���茧","�F�{��","�啪��","�{�茧",
											"��������","���ꌧ","","","�C�O"};
	private static final String[] Sex = {"", "�j��", "����"};
	public static String getSexCtr( int num ){
		try{
			return Sex[num];
		}catch(Exception ex){}
		return "";
	}
	public static String getSexCtr( String num ){
		try{
			return Sex[ Integer.parseInt( num ) ];
		}catch(Exception ex){}
		return "";
	}
	public static String getStateCtr( int num ){
		try{
			return States[num];
		}catch(Exception ex){}
		return "";
	}
	public static String getStateCtr( String num ){
		try{
			return States[ Integer.parseInt( num ) ];
		}catch(Exception ex){}
		return "";
	}
}
