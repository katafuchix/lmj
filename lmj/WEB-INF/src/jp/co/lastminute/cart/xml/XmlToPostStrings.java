package jp.co.lastminute.cart.xml;

import java.util.Vector;
import java.io.StringReader;
import javax.xml.parsers.*;
import org.xml.sax.*;
import org.xml.sax.helpers.*;
import jp.co.yobrain.util.rpc.PostString;

/**
 * �P����XML ����͂��� ���e�� PostString �� Vector �ɂ��郆�[�e�B���e�B�N���X�B
 * ���[�g�v�f�̒����ɁAPostString �ɑΉ�����v�f���o�����邱�Ƃ�z��B
 * �v�f����PostString�̖��O�A���e���l�B
 * �v�f�������������Ă���ꍇ�͂��ׂĖ�������B
 * ���O��Ԃ̉�͍͂s�킸�APrefix �������Ă��APrefix �ς̗v�f�������̂܂܎g�p����B
 * �i���O��ԁAPrefix �Ȃ���XML�����͂���邱�Ƃ�z�肵�Ă��邽�߁j
 * ���������O��Ԃւ̑Ή����K�v�ȏꍇ�� SAXParserFactory �֐ݒ��ǉ����邱�ƁB
  * @author <a href="mailto:yasuko.akai@npcsystem.com">Yasuko AKAI</a>
 */
public final class XmlToPostStrings {

    /**
     * XML���e�� Post���b�Z�[�W���e�ɕϊ�����
     * @param xmlContent XML���e
     * @return Post���b�Z�[�W���e (PostString��Vector)
     * @exception org.xml.sax.SAXException xmlContent�̃p�[�Y���̗�O(xmlContent�̓��e���s�����j
     * @exception jp.co.lastminute.basket.xml.IllegalEnvironmentException SAX�����s��
     * @exception java.lang.NullPointerException xmlContent��null
     * @exception java.lang.IllegalArgumentException xmlContent�Ɋւ���IO��O
     **/
    public static Vector toVector(String xmlContent)
        throws IllegalEnvironmentException, SAXException {
        if (xmlContent == null) {
            throw new NullPointerException("xmlContent");
        }       System.err.println("XMLContents\n" + xmlContent );
        try {
            SAXParser parser = SAXParserFactory.newInstance().newSAXParser();       System.err.println("XmlToPostStrings:37");
            Handler handler = new Handler();                                        System.err.println("XmlToPostStrings:38");
            parser.parse(new InputSource(new StringReader(xmlContent)), handler);       System.err.println("XmlToPostStrings:38");
                                                                                     System.err.println("XmlToPostStrings:39");
            return handler.getVector();
        } catch (ParserConfigurationException e) {
            throw new IllegalEnvironmentException("Could not create SAXParser. "+e.toString());
        } catch (java.io.IOException e) {
            throw new IllegalArgumentException("Unexpected internal IO Exception : "+e.toString());
        }
    }
    
    /**
     * SAX�ŉ�͂��Ȃ��� ������ Vector �𗭂߂�����N���X�B
     * ��List �łȂ� Vector �Ȃ̂͒P�Ɏ擾�������̂� Vector ������B
     **/
    private static class Handler extends DefaultHandler {
        private Vector vector_ = new Vector();
        private int level_ = 0;
        StringBuffer buffer_ = null;

        public void startElement(String namespaceURI, String localName, String qName, Attributes atts) {
            level_++;
            if (level_ == 2) {
                buffer_ = new StringBuffer(50);
            }
        }
        public void characters(char[] ch, int start, int length) {
            if (level_ == 2) {
                buffer_.append(ch, start, length);
            }
        }

        public void endElement(String namespaceURI, String localName, String qName) {
            if (level_ == 2) {
                PostString postString = new PostString(qName, buffer_.toString());
                vector_.add(postString);
            }
            level_--;
        }

        public Vector getVector() {
            return vector_;
        }

    }

}
