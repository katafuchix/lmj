package jp.co.yobrain.util.form;

import java.io.*;

/**
* Form�`�F�b�N�pBean<BR>
*
*/

public class CheckError implements Serializable{

	/** �`�F�b�N���ʕ����� */
	private String str = "";
	/** �G���[No */
	private int eNumber = 0;
	/** �����Ȃ��R���X�g���N�^ */
	public CheckError(){
	}
	/**
	* �G���[�`�F�b�N���String��Ԃ��܂�
	* @return	String	�G���[�`�F�b�N���String
	*/
	synchronized public String getRstr(){
		return str;
	}

	/**
	* �G���[No��Ԃ��܂�
	* @return	int	�G���[Nomber
	*/
	synchronized public int getError(){
		return eNumber;
	}

	/**
	* �G���[�`�F�b�N���String���Z�b�g���܂�
	* @param	s	�G���[�`�F�b�N���String
	*/
	synchronized public void setRstr(String s){
		str = s;
	}

	/**
	* �G���[No���Z�b�g���܂�
	* @param	i	�G���[Nomber
	*/
	synchronized public void setError(int i){
		eNumber = i;
	}

}