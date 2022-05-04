/*
 * XmlReader.java
 *
 * Created on 2002/05/03, 13:21
 */

package jp.co.lastminute.common.xml;

import java.io.*;
import java.util.*;
import jp.co.lastminute.cart.Constants;
import jp.co.yobrain.util.file.*;

/**
 *
 * @author  skondo
 * @version 
 */
public class XmlReader implements Serializable{
    private HashMap xMLMappingObj;
    private static String path = Constants.path;
    private static String encoding = "UTF-8";

    /** �R���X�g���N�^�[ */
    public XmlReader(HashMap xmlmapiing) {
        this.xMLMappingObj = xmlmapiing;
    }
    
    /** 
     * �}�b�s���O�I�u�W�F�N�g�̎擾
     * @param  UriParam �}�b�s���O�L�[
     */
    public ConstantsXml getMapping( UriParam uriparam ){
        return (ConstantsXml)this.xMLMappingObj.get( (UriParam)uriparam );
    }
    /** 
     * �}�b�s���O�t�@�C���̎擾
     */
    public ConstantsXml getMapping( String agt_cd, int product_type_cd ){
        UriParam uriparam = new UriParam();
        uriparam.setAgt_cd(agt_cd);
        uriparam.setProduct_type_cd(product_type_cd);
        return (ConstantsXml)this.xMLMappingObj.get( uriparam );
    }
    /**
     * �L�����Z��URL
     */
     public String getCancelurl(String agt_cd, int product_type_cd){
         return getMapping(agt_cd, product_type_cd).getCancelurl();
     }
     /**
      * �L�����Z��XSL
      */
     public String getCancelxslt(String agt_cd, int product_type_cd){
         return getMapping(agt_cd, product_type_cd).getCancelxslt();
     }
     /**
      * �L�����Z��XSL���e
      */
     public String getCancelxsltAmount(String agt_cd, int product_type_cd){
         InportFile inf = null;
         try{
         return inf.getFileAmount(getMapping(agt_cd, product_type_cd).getCancelxslt(), path, encoding) ;
         }catch(Exception ex){  ex.printStackTrace(); }
         return "";
     }
     /**
      * �݌ɏƉ�URL
      */
     public String getCheckurl(String agt_cd, int product_type_cd){
         return getMapping(agt_cd, product_type_cd).getCheckurl();
     }
     /**
      * �ڍ�XSL
      */
     public String getDescxslt(String agt_cd, int product_type_cd){
         return getMapping(agt_cd, product_type_cd).getDescxslt();
     }
     /**
      * �ڍ�XSL���e
      */
     public String getDescxsltAmount(String agt_cd, int product_type_cd){
         InportFile inf = null;
         try{
         return inf.getFileAmount(getMapping(agt_cd, product_type_cd).getDescxslt(), path, encoding) ;
         }catch(Exception ex){  ex.printStackTrace(); }
         return "";
     }
     /**
      * 
      */
     public String getSendurl( String agt_cd, int product_type_cd ){
         return getMapping(agt_cd, product_type_cd).getSendurl();
     }
     /**
      * ����XSL
      */
     public String getSendxslt(String agt_cd, int product_type_cd){
         return getMapping(agt_cd, product_type_cd).getSendxslt();
     }
     /**
      * ����XSL���e
      */
     public String getSendxsltAmount(String agt_cd, int product_type_cd){
         InportFile inf = null;
         try{
         return inf.getFileAmount(getMapping(agt_cd, product_type_cd).getSendxslt(), path, encoding) ;
         }catch(Exception ex){  ex.printStackTrace(); }
         return "";
     }
     /**
      * �t�H�[������XSD
      */
     public String getTemplatexsd(String agt_cd, int product_type_cd){
     	if( product_type_cd == Constants.Gift_ ){
     		return getMapping(Constants.KeyW, product_type_cd).getTemplatexsd();
     	}
        return getMapping(agt_cd, product_type_cd).getTemplatexsd();
     }
     /**
      * �t�H�[������XSD�̓��e
      */
     public String getTemplatexsdAmount(String agt_cd, int product_type_cd){
         InportFile inf = null;
         try{
         return inf.getFileAmount(getMapping(agt_cd, product_type_cd).getTemplatexsd(), path, encoding) ;
         }catch(Exception ex){  ex.printStackTrace(); }
         return "";
     }
     /**
      * �N���X�擾
      */
     public String getFlowClass( String agt_cd, int product_type_cd){
     	if( product_type_cd == Constants.Gift_ ){
     		return getMapping(Constants.KeyW, product_type_cd).getTemplatexsl();
     	}
     	return getMapping(agt_cd, product_type_cd).getTemplatexsl();
     }
}