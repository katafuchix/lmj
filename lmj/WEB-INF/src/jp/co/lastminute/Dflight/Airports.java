package jp.co.lastminute.Dflight;

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
public class Airports implements Serializable{
	public String dep = "";
	public String arv = "";
	
	public Airports(){}
	public Airports(String dep, String arv){
		this.dep = dep;
		this.arv = arv;
	}
	/**
	 *  �n�b�V���R�[�h���擾
	 */
	public final int hashCode(){
		return 13*this.dep.hashCode() + 17*this.arv.hashCode();
	}
	/**
	 *  �I�u�W�F�N�g���r
	 */
	public final boolean equals( Object obj ){
		try{
			if( this.dep.equals( ((Airports)obj).dep ) &&
				this.arv.equals( ((Airports)obj).arv ) ){
					return true;
				}
		}catch(Exception ex){}
		return false;		
	}
}
