/*
 * dbDataAccesser.java
 *
 * Created on 2002/04/20, 19:36
 */

package jp.co.yobrain.util;

import java.io.*;
import java.util.*;
import java.math.*;

/**
 *
 * @author  skondo
 * @version 
 */
public class dbDataAccesser implements Serializable{
    private Vector rows;
    /** �R���X�g���N�^�[ 
     * @param Vector Valurs
     */
    public dbDataAccesser(Vector Values) {
        this.rows = Values;
    }
    /**
      * �f�[�^���f�[�^�x�[�X��蒼�ڎ擾����
      * @param 	int i	�s
    �@* @param  int  col	��
�@�@�@* @return 	String	�擾�f�[�^
    �@*/
    synchronized public String getData(int i, int j){
        try{
            if( getValueAt(i,j) == null ){
                return "";
            }
            return getValueAt(i,j).toString();	
	}catch(Exception e){
            e.printStackTrace();
            return "";
    	}
    }
    /**
      * �f�[�^���f�[�^�x�[�X��蒼�ڎ擾����
      * @param 	int i	�s
    �@* @param  int  col	��
�@�@�@* @return int �擾�f�[�^
    �@*/
    synchronized public int getDatabyInt(int i, int j){
        try{
            if( getValueAt(i, j) == null ){ return 0;   }
            Integer inte = (Integer)getValueAt(i,j);
            return inte.intValue();
	}catch(ClassCastException e){
            try{
                BigDecimal bigdec = (BigDecimal)getValueAt(i,j);
                return bigdec.intValue();
            }catch(Exception ex){
                ex.printStackTrace();
            }
            return 0;
    	}catch(Exception ex){
            return 0;
        }
    }
    /**
      * �f�[�^���f�[�^�x�[�X��蒼�ڎ擾����
      * @param 	int i	�s
    �@* @param  int  col	��
�@�@�@* @return int �擾�f�[�^
    �@*/
    synchronized public double getDatabydouble(int i, int j){
        try{
            if( getValueAt(i, j) == null ){ return 0;   }
            Double inte = (Double)getValueAt(i,j);
            return inte.doubleValue();
	}catch(ClassCastException e){
            try{
                BigDecimal bigdec = (BigDecimal)getValueAt(i,j);
                return bigdec.intValue();
            }catch(Exception ex){
                ex.printStackTrace();
            }
            return 0;
    	}catch(Exception ex){
            return 0;
        }
    }
    /**
      * �f�[�^���f�[�^�x�[�X��蒼�ڎ擾����
      * @param 	int i	�s
    �@* @param  int  col	��
�@�@�@* @return long �擾�f�[�^
    �@*/
    synchronized public long getDatabylong(int i, int j){
        try{
            Long lg = (Long)getValueAt(i,j);
            return lg.longValue();
	}catch(Exception e){
            e.printStackTrace();
            return 0;
    	}
    }
    /**
      * �f�[�^���f�[�^�x�[�X��蒼�ڎ擾����
      * @param 	int i	�s
    �@* @param  int  col	��
�@�@�@* @return float �擾�f�[�^
    �@*/
    synchronized public float getDatabyfloat(int i, int j){
        try{
            Long lg = (Long)getValueAt(i,j);
            return lg.floatValue();
	}catch(Exception e){
            e.printStackTrace();
            return 0;
    	}
    }
    /**
      * �f�[�^���f�[�^�x�[�X��蒼�ڎ擾����
      * @param 	int i	�s
    �@* @param  int  col	��
�@�@�@* @return boolean �擾�f�[�^
    �@*/
    synchronized public boolean getDatabyboolean(int i, int j){
        try{
            Boolean lg = (Boolean)getValueAt(i,j);
            return lg.booleanValue();
	}catch(Exception e){
            e.printStackTrace();
            return false;
    	}
    }
    //�w�肳�ꂽ�A�s�|�� �̃I�u�W�F�N�g�̎擾////////////////////////
    synchronized private Object getValueAt(int aRow, int aColumn){
	Vector row = (Vector)rows.elementAt(aRow);
	return row.elementAt(aColumn);
    }
    /**�@�f�[�^�T�C�Y�̎擾
     * @return int ROWSIZE
     */
    synchronized public int getRowsize(){
        return rows.size();
    }
}
