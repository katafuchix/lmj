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
public class FlightNodesList implements Serializable {
	public P2PAirport distination = null;
	public Vector flightslistbyday = new Vector();
	private int dayscounts = 0;
	/**
	 * �f�B�X�e�B�l�[�V�����̕ێ�
	 */
	public void setDistination( P2PAirport distination ){
		this.distination = distination;		
	}
	/**
	 * �f�B�X�e�B�l�[�V�����̎擾
	 */
	public P2PAirport getDistination(){
		return this.distination;	
	}
	/**
	 * �����̃t���C�g�̕ێ�
	 */
	public void setDayflight( Dayflight dayflights ){
		try{
			int targetdate = Integer.parseInt( dayflights.flightdate );
			if( flightslistbyday.size() == 0 ){
				flightslistbyday.add( dayflights );
			}else{
				boolean actionflg = false;
				int max = 0;
				for(int i=0; i<flightslistbyday.size(); i++){
					Dayflight flights = (Dayflight)flightslistbyday.get( i );
					int basedate = Integer.parseInt( flights.flightdate );
					if( targetdate == basedate ){
						actionflg = true;
					}
					if( basedate > max ){
						max = basedate;
					}
				}
				if( !actionflg ){
					for(int i=0; i<flightslistbyday.size(); i++){
						//�T�C�Y���P�̎��́A�K���ǉ� //���������̂��O�ɂ���B
						if( flightslistbyday.size() == 1){
							int nowstatus = Integer.parseInt( ((Dayflight)flightslistbyday.get( i ) ).flightdate );
							if( nowstatus < targetdate ){
								flightslistbyday.add( dayflights );
							}else{
								flightslistbyday.add( 0, dayflights );
							}
							break;
						}else if( i== flightslistbyday.size() -1 ){	// �S�ĉ���Ă��܂����Ƃ�
							if( max < targetdate ){
								flightslistbyday.add( dayflights );
							}else{
								flightslistbyday.add( 0, dayflights );
							}
							break;
						}else{	//
							int nowstatus = Integer.parseInt( ((Dayflight)flightslistbyday.get( i ) ).flightdate );
							int nexttatus = Integer.parseInt( ((Dayflight)flightslistbyday.get( i+1 )).flightdate );
							if(( nowstatus < targetdate )&&( nexttatus > targetdate)){
								flightslistbyday.add( i+1 , dayflights );
								break;
							}		
						}		
					}
				}
			}
		}catch(Exception ex){
			ex.printStackTrace();	
		}
	}
	/**
	 * �����̃t���C�g�̎擾 
	 */
	public Dayflight getDayflight( int index ){
		if( index > flightslistbyday.size() )	return null;
		if( flightslistbyday.get( index ) == null )	return null;
		return (Dayflight) flightslistbyday.get( index );
	}
	/**
	 * �������X�g�̎擾
	 */
	public Vector getDayflights(){
		return flightslistbyday;
	}

}
