/*
 * XmlPostHelper.java
 *
 * Created on 2002/05/01, 11:09
 */

package jp.co.lastminute.cart.xml;

import java.io.Serializable;
import java.util.Vector;
import jp.co.yobrain.util.xml.Xslt;
import jp.co.lastminute.cart.xml.XmlToPostStrings;
import jp.co.yobrain.util.rpc.SendClient;

/**
 *
 * @author  skondo
 * @version
 */
public class XmlPostHelper implements Serializable{
    
    public static XmlBeanBase querySupplyer(String posturl, String xmlstring, String xslfile)
    throws Exception {
        try{
            return querySupplyer(posturl, xmlstring, xslfile, "XmlBeanBase");
        } catch(Exception e){
            throw e;
        }
    }
    public static XmlBeanBase querySupplyer(String posturl, String xmlstring, String xslfile, String classname)
    throws Exception {
        System.err.println( "POST URl=\n" + posturl );
        System.err.println( "POST XML=\n" + xmlstring );
        System.err.println( "POST XSL=\n" + xslfile );
        System.err.println( "POST CLASS=\n" + classname );
        // �e�L�X�g�x�[�X�̂w�l�k�Ƃw�r�k�t�@�C���t�q�h����w�l�k���쐬����
        Xslt xslt = new Xslt();         System.err.println( "XmlPostHelper:37" );
        xslt.setTextXml(xmlstring);     System.err.println( "XmlPostHelper:38" );
        xslt.setTextXsl( xslfile );     System.err.println( "XmlPostHelper:39" );
        //xslt.setXsl(xslfile);
        String result = xslt.applyToString("UTF-8");  
        xslt = null;                                  
        // �w�l�k����p�����[�^���X�g���쐬����
        Vector vector;
        try{
        	vector = XmlToPostStrings.toVector(result);
        } catch(Exception e){
            throw e;
        }
        // �T�v���C���[�ɂo�n�r�s����
        SendClient client = new SendClient();
        result = client.sendText(posturl, vector);
        client = null;
        // �ԐM��JAVA CLASS �ɓ����
        String clname = "jp.co.lastminute.cart.xml." + classname;
        XmlBeanBase obj;
        try {
            obj = (XmlBeanBase)Class.forName(clname).newInstance();
            obj.fill(result);
        } catch(Exception e){
            throw e;
        }
        return obj;
    }
    
    
}
