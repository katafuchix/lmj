package jp.co.yobrain.util;

import java.io.*;
import java.util.*;

public class DataAccesser implements Serializable{
    private Vector jdbcVector;
    /**
     * �R���X�g���N�^�[
     *�@�f�[�^�x�[�X�̒l���擾
     */
    public DataAccesser(Vector jdbcvector){
        this.jdbcVector = jdbcvector;
    }
    /**
     * �s�����擾
     * @return int �s��
     */
    public int getRowCount(){	return jdbcVector.size();	}
    /**
     * �x�N�^�[���f�[�^���擾����
     *�@@return 	String	�擾�f�[�^
     *�@@param 	int	i	�s
     *�@@param	int j	��
     */
    public String getData(int i, int j){	
	try{
            return getValueAt(i,j).toString();	
	}catch(Exception e){
            return "";
	}
    }
    private Object getValueAt(int aRow, int aColumn){
        Vector row = (Vector)jdbcVector.elementAt(aRow);
        return row.elementAt(aColumn);
    }
}

