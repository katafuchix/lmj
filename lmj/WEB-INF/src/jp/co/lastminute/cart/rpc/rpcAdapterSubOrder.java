/*
 * rpcAdapterSubOrder.java
 *
 * Created on 2002/04/01, 22:56
 */

package jp.co.lastminute.cart.rpc;

import java.io.*;
import java.util.*;
import org.jdom.*;
import org.jdom.input.*;
import org.jdom.output.*;
import org.jdom.transform.*;
import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import jp.co.lastminute.cart.model.*;
import jp.co.lastminute.common.xml.*;
import jp.co.lastminute.cart.xml.*;

//import jp.co.lastminute.hotel.util.*;

/**
 *
 * @author  skondo
 * @version
 */
public class rpcAdapterSubOrder implements Serializable{

    /**
     * �R���X�g���N�^�[
     */
    public rpcAdapterSubOrder(){
    }

    synchronized public String[] addSubOrderArray( Sub_Order so, Product_Send ps, Card_Auth card, HashMap xmlhash){
        String[] reStr = {"", "", "", "", "", ""};
        try{
            String agt_cd = so.getAGT_CD();                 
            int product_type_cd = so.getPRODUCT_TYPE_CD(); 
            XmlReader xreader = new XmlReader( xmlhash );
            String send_url = "";
            send_url = xreader.getSendurl( agt_cd, product_type_cd); //System.err.println( "rpcAdapterSubOrder:48" );
            if(( send_url == null )||( send_url.length() == 0)){
                reStr[0] = "LMJ_ORDER";
                return reStr;
            }
            String convxsl = xreader.getSendxsltAmount( agt_cd, product_type_cd);   //System.err.println( "rpcAdapterSubOrder:49" );
            //XML���� //�|�X�g�}�l�[�W���[�ɑ��M
            SupplyOrderResult result;           //System.err.println( "rpcAdapterSubOrder:51" );
             XmlBeanBase xmlbeen = null;
             String outputstring = "---���\��m�F��---------------------------------------------\n";
                                    
             String xmlstring = "";
            try {                               //System.err.println( "rpcAdapterSubOrder:52" );
                  result = (SupplyOrderResult)XmlPostHelper.querySupplyer(  
                  send_url,
                  "<?xml version=\"1.0\" encoding=\"UTF-8\"?><ORDER><SUB_ORDER>"+  so.getXMLdocument() + "\n</SUB_ORDER><PRODUCT_SEND>" + ps.getXMLdocument() + "</PRODUCT_SEND>"+ card.getXMLdocument() + "</ORDER>", 
                  convxsl, 
                  "SupplyOrderResult");         //System.err.println( "rpcAdapterSubOrder:54" );
                   //= xmlbeen;
                  
                  XMLCDATAGetter xg = new XMLCDATAGetter();
                  xg.setXmlString( result.getXmldocument() );//xmlbeen.xmlstring
                  Vector vc = xg.getCDATAofChild("NEWBOKOUT|SUCCESS|DISCRIPTION");
                  //String xmlstring xml;
                  /**
                   *<![CDATA[�S�{��z�e���j���[����]]></CONTENT>
                    <CONTENT><![CDATA[0288-77-2611]]></CONTENT>
                    <CONTENT><![CDATA[�o�X�t�a�m��]]></CONTENT>
                    <CONTENT><![CDATA[�[���H�t]]></CONTENT>
                    <CONTENT><![CDATA[(�h������)21000�~ + (����)1350�~]]></CONTENT>
                    <CONTENT><![CDATA[06��28������1���@��l10500�~�~2��]]></CONTENT>
                    <CONTENT><![CDATA[2002�N06��25������@20���@(����������́A�������t���ɂ���ĕς��܂�)]]></CONTENT>
                   */
                  //String[] heder = {"�h����\t:", "\t\t\t", "�����^�C�v\t:", "�H������\t:", "�������v\t", "�h����������\t:", "", "", "", "", "", "", ""};
                  String[] heder = {"\u5BBF\u6CCA\u5148\t:",
                                    "\t\t\t",
                                    "\u5BBF\u6CCA\u6599\u91D1\u5185\u8A33\t", 
                                    "\u6599\u91D1\u5408\u8A08\t:", 
                                    "\u98DF\u4E8B\u6761\u4EF6\t:", 
                                    "\u90E8\u5C4B\u30BF\u30A4\u30D7\t:", "", "", "", "", "", "", ""};
                  for(int i =0; i< vc.size(); i++){
                      outputstring += heder[i] + (String)vc.get(i) + "\n";
                  }
                  if( so.getAGT_CD().equals("KNT") ){
                    if (so.getPROD_CD().indexOf("-2917-") >= 0) {
                        outputstring+="������ɂ���\n";
                        outputstring+="�ȉ��ɏh���@�ւ̒�߂�W���������������ē��v���܂��B\n";
                        outputstring+="������͏h���{�݂��ƂɈقȂ�܂��̂ŏڍׂɂ��Ă͂��₢���킹�������B\n";
                        outputstring+="�h���@�ւ̒�߂�W��������i14���l�ȓ��ł̂��\���̏ꍇ�j\n";
                        outputstring+="�E�h���R���O����h���O���܂ł̃L�����Z���̏ꍇ	�h��������20%\n";
                        outputstring+="�E�h�������y�ѕs���̏ꍇ		�h��������50%\n";
                        outputstring+="\n";
                        outputstring+="�����̂��ē��ɋL�ڂ̖��������͓��Ў�z���s�񊼂ɂ��܂�\n";
                    } else {
                        outputstring+="������ɂ���\n";
                        outputstring+="�ȉ��ɏh���@�ւ̒�߂�W���������������ē��v���܂��B\n";
                        outputstring+="������͏h���{�݂��ƂɈقȂ�܂��̂ŏڍׂɂ��Ă͂��₢���킹�������B\n";
                        outputstring+="�h���@�ւ̒�߂�W��������i14���l�ȓ��ł̂��\���̏ꍇ�j\n";
                        outputstring+="�E�h���O���܂ł̃L�����Z���̏ꍇ	�h��������20%\n";
                        outputstring+="�E�h�������̃L�����Z���̏ꍇ		�h��������80%\n";
                        outputstring+="�E�s���̏ꍇ			�h��������100%\n";
                        outputstring+="\n";
                        outputstring+="�����̂��ē��ɋL�ڂ̖��������͓��Ў�z���s�񊼂ɂ��܂�\n";
                    }
                  }
                  outputstring += "------------------------------------------------------------\n";
            } catch(Exception e){               //System.err.println( "rpcAdapterSubOrder:55" );  e.printStackTrace();
              return reStr ;
            }                                   //System.err.println( "rpcAdapterSubOrder:57" );
            if(result.isSuccess() == false) return reStr ;
            reStr[0] = result.getORDERNO();
            reStr[1] = result.getPRICE();
            reStr[2] = outputstring;
            //System.err.println("-------------- reStr[0]" + reStr[0] + "----------------");
            //System.err.println("-------------- reStr[1]" + reStr[1] + "----------------");
            //System.err.println("-------------- reStr[2]" + reStr[2] + "----------------");
            //XmlLicener xmlreader = new XmlLicener( reStr[2] );
            //System.err.println( "-------------------"+ xmlreader.getLicenceData()+ "-----------------------------");
             //System.err.println( "------------------------------------------------------------------------");
        //
        }catch(Exception ex){
            ex.printStackTrace();       //System.err.println( "rpcAdapterSubOrder:62" );
        }
        return reStr;
    }
    /**
     * 
     */
    synchronized public String[] addSubOrderArray( Sub_Order so ){
        String[] reStr = {"", "", "", "", "", ""};
        try{
             System.err.println("----------------------------Shift_JIS----------------");
        String xmlstring = "<SUB_ORDER>" + so.getXMLdocument() + "</SUB_ORDER>";
        System.err.println("----------------------------Shift_JIS----------------");
       // System.err.println( xmlstring );
        XMLCDATAGetter xg = new XMLCDATAGetter();
        xg.setXmlString( xmlstring.trim() );
        Vector vc = xg.getCDATAofChild("SUB_ORDER|BUY_PROP|gift");
        System.err.println("----------------------------Shift_JIS----------------");
        System.err.println(   (String)vc.elementAt( 0 ) );
         System.err.println(   (String)vc.elementAt( 1 ) );
          System.err.println(   (String)vc.elementAt( 2 ) );
           System.err.println(   (String)vc.elementAt( 3 ) );
            System.err.println(   (String)vc.elementAt( 4 ) );
             System.err.println(   (String)vc.elementAt( 5 ) );
             System.err.println("----------------------------Shift_JIS----------------");
            reStr[2] = (String)vc.elementAt( 5 );
        }catch(Exception ex){}
        return reStr;
    }
    /**
     * �T�u�I�[�_�[�I�u�W�F�N�g��XSL���}�[�W���A�p�����[�^�𐶐���AASP�ɑ΂�������ǉ�����B
     * @param String actionurl
     * @param String method
     * @param StreamSource xslfile
     * @param Sub_Order so
     * @param Product_Send ps
     * @return String agt_order_no
     */
    synchronized public String addSubOrder( Sub_Order so, Product_Send ps, Card_Auth card, HashMap xmlhash){
        try{
            String agt_cd = so.getAGT_CD();     //System.err.println( "rpcAdapterSubOrder:45" );
            int product_type_cd = so.getPRODUCT_TYPE_CD();  //System.err.println( "rpcAdapterSubOrder:46" );
            XmlReader xreader = new XmlReader( xmlhash );   //System.err.println( "rpcAdapterSubOrder:47" );
            String send_url = "";
            send_url = xreader.getSendurl( agt_cd, product_type_cd);    //System.err.println( "rpcAdapterSubOrder:48" );
            if(( send_url == null )||( send_url.length() == 0)){
                return "LMJ_ORDER";
            }
            String convxsl = xreader.getSendxsltAmount( agt_cd, product_type_cd);
            //XML���� //�|�X�g�}�l�[�W���[�ɑ��M
            SupplyOrderResult result;
            try {
              result = (SupplyOrderResult)XmlPostHelper.querySupplyer(  
                  send_url,"<?xml version=\"1.0\" encoding=\"UTF-8\"?><ORDER><SUB_ORDER>"+  so.getXMLdocument() + "\n</SUB_ORDER><PRODUCT_SEND>" + ps.getXMLdocument() + "</PRODUCT_SEND>"+ card.getXMLdocument() + "</ORDER>", convxsl, "SupplyOrderResult"); System.err.println( "rpcAdapterSubOrder:54" );
            } catch(Exception e){   //System.err.println( "rpcAdapterSubOrder:55" );  
                e.printStackTrace();
                return "";
            }       //System.err.println( "rpcAdapterSubOrder:57" );
            if(result.isSuccess() == false) return "";
            
            return result.getORDERNO();
        //
        }catch(Exception ex){
            ex.printStackTrace();       //System.err.println( "rpcAdapterSubOrder:62" );
        }
        return "";
    }
    
    /**
     * �T�u�I�[�_�[�I�u�W�F�N�g��XSL���}�[�W���A�p�����[�^�𐶐���AASP�ɑ΂��������L�����Z������B
     * @param String actionurl
     * @param String method
     * @param StreamSource xslfile
     * @param Sub_Order so
     * @return int 0=OK, 1< ErrorCode
     */
    synchronized public int removeSubOrder( Sub_Order so, HashMap xmlhash ){
        try{
            String agt_cd = so.getAGT_CD();
            int product_type_cd = so.getPRODUCT_TYPE_CD();
            XmlReader xreader = new XmlReader( xmlhash );
            String send_url = "";
            send_url = xreader.getCancelurl( agt_cd, product_type_cd);
            if(( send_url != null)||( send_url.length() > 0)){          
                String convxsl = xreader.getCancelxsltAmount( agt_cd, product_type_cd );
                //XML����  �|�X�g�}�l�[�W���[�ɑ��M
                XmlBeanBase result;
                try {                                                 
                  result = XmlPostHelper.querySupplyer(send_url, so.getXMLdocument(), convxsl);
                } catch(Exception e){                          
                  return -1;
                }                                                
                if(result.isSuccess() == false) return -1;
                return 0;
            }                                
            return 0;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return -1;
    }
    /**
     * �T�u�I�[�_�[�̈ꊇ�I�[�_�[
     */
    synchronized public int multaddSubOrder( Order od, int status, int target){
        //�f�[�^�x�[�X���ꊇ�ōX�V���A�݌ɂ����炷
        return 0;
    }
    /**
     * �h�L�������g���}�b�s���O
     */
    synchronized private String DocToXML(Document doc){
        try {
            XMLOutputter putter = new XMLOutputter("", false);
            putter.setOmitDeclaration(true);
            putter.setIndent(false);
            putter.setEncoding("UTF-8");
            //System.err.println("DocToXML OK");
            return putter.outputString(doc);
        } catch(Exception e){
            //System.err.println("DocToXML NG");
            e.printStackTrace();
        }
        return "";
    }
}
