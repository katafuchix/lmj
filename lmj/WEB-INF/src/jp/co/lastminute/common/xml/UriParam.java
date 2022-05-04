/*
 * UriParam.java
 *
 * Created on 2002/05/03, 13:08
 */

package jp.co.lastminute.common.xml;

import java.io.*;

/**
 *
 * @author  skondo
 * @version 
 */
public class UriParam{
    private int product_type_cd = 0;
    private String agt_cd = "";
    
    /** Creates new UriParam */
    public UriParam() {
    }
    
    public UriParam(int producttypecd, String agtcd) {
        this.agt_cd = agtcd;
        this.product_type_cd = producttypecd;
    }


    /** �v���p�e�B agt_cd �̎擾���\�b�h�B
     * @return �v���p�e�B agt_cd �̒l�B
     */
    public String getAgt_cd() {
        return agt_cd;
    }
    
    /** �v���p�e�B agt_cd �̐ݒ胁�\�b�h�B
     * @param agt_cd �v���p�e�B agt_cd �̐V�����l�B
     */
    public void setAgt_cd(String agt_cd) {
        this.agt_cd = agt_cd;
    }
    
    /** �v���p�e�B product_type_cd �̎擾���\�b�h�B
     * @return �v���p�e�B product_type_cd �̒l�B
     */
    public int getProduct_type_cd() {
        return product_type_cd;
    }
    
    /** �v���p�e�B product_type_cd �̐ݒ胁�\�b�h�B
     * @param product_type_cd �v���p�e�B product_type_cd �̐V�����l�B
     */
    public void setProduct_type_cd(int product_type_cd) {
        this.product_type_cd = product_type_cd;
    }
    /**
     * �n�b�V���o��
     */
    public int hashCode(){
        return 13 * this.agt_cd.hashCode() + 17 * this.product_type_cd;
    }
    /**
     *
     */
    public final boolean equals( Object urlparam ){
        //System.err.println("GO_BOOLEAN_URLPARAM_GOGOG");
        try{
            //System.err.println("GO_BOOLEAN_URLPARAM");
        if((this.getAgt_cd().equals( ((UriParam)urlparam).getAgt_cd()))&&(this.getProduct_type_cd() == ((UriParam)urlparam).getProduct_type_cd())){
            return true;
        }
        return false;
        }catch(Exception ex){
            ex.printStackTrace();
            return false;
        }
    }   
}
