package jp.co.lastminute.Dflight.node;

import java.io.*;
import java.util.*;

/**
 * @author user
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public class ActFlights implements Serializable{
	private HashMap distnationsflight = new HashMap();
	/**
	 * �t���C�g�f�B�X�e�B�l�[�V�����̕ێ�
	 */
	public void setDistnationsflight( P2PAirport airport, FlightNodesList distnation){
		if( containsP2PAirport( airport )) {
			distnationsflight.remove( airport );
		}
		distnationsflight.put( airport, distnation );
	}
	/**
	 * �n�b�V���}�b�v�̎擾
	 */
	public HashMap getHashActFlights(){
		return distnationsflight;
	}
	/**
	 * �f�B�X�e�B�l�[�V�������̃t���C�g���X�g�̎擾
	 */
	public boolean containsP2PAirport( P2PAirport airport ){
		try{
			return distnationsflight.containsKey( airport );
		}catch(Exception ex){}
		return false;
	}
	/**
	 * �f�B�X�e�B�l�[�V�������̃f�B�X�e�B�l�[�V�����̎擾
	 */
	public FlightNodesList getDistination( P2PAirport airport ){
		try{
			return (FlightNodesList) distnationsflight.get( airport );
		}catch(Exception ex){}
		return null;
	}
}
