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

/**
 *
 * @author  skondo
 * @version 
 */
public interface rpcAdapterInterface {

    /**
     * �T�u�I�[�_�[�I�u�W�F�N�g��XSL���}�[�W���A�p�����[�^�𐶐���AASP�ɑ΂�������ǉ�����B
     * @param String actionurl
     * @param String method
     * @param StreamSource xslfile
     * @param Sub_Order so
     * @param Product_Send ps
     * @return String agt_order_no
     */
    public String addSubOrder(String actionurl, String method, StreamSource xslfile, Sub_Order so, Product_Send ps);
    /**
     * �T�u�I�[�_�[�I�u�W�F�N�g��XSL���}�[�W���A�p�����[�^�𐶐���AASP�ɑ΂��������L�����Z������B
     * @param String actionurl
     * @param String method
     * @param StreamSource xslfile
     * @param Sub_Order so
     * @return int 0=OK, 1< ErrorCode 
     */
    public int removeSubOrder(String actionurl, String method, StreamSource xslfile, Sub_Order so);
    /**
     * �J�[�h�L�����̃`�F�b�N���s��
     * @param String cardno
     * @param String expire
     * @param String name
     * @param String price
     * @return int ErrorCord 0=OK, 1<ErrorCode
     */
    public int checkCard(String cardno, String expire, String name, String price);
}
