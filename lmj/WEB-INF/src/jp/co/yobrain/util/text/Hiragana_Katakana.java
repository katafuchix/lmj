package jp.co.yobrain.util.text;

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
public class Hiragana_Katakana {
    private HashMap hiragana_katakana;
    
    public Hiragana_Katakana(){
        super();
        setHiragana_katakana();
    }
    /**
     * 
     */
    public HashMap getKanaMapping(){
        if( hiragana_katakana == null) initHiragana_katakana();
        return hiragana_katakana;
    }
    /**
     *
     */
    public void initHiragana_katakana(){
        if( hiragana_katakana == null )    setHiragana_katakana();
    }
    /**
     *
     */
    private void setHiragana_katakana(){
        try{
            hiragana_katakana = new HashMap();
            hiragana_katakana.put("��","��");
            hiragana_katakana.put("��","�@");
            hiragana_katakana.put("��","�B");
            hiragana_katakana.put("��","�D");
            hiragana_katakana.put("��","�F");
            hiragana_katakana.put("��","�H");
            hiragana_katakana.put("��","��");
            hiragana_katakana.put("��","��");
            hiragana_katakana.put("��","��");
            hiragana_katakana.put("��","�b");
            hiragana_katakana.put("�[","�[");
            hiragana_katakana.put("��","�A");
            hiragana_katakana.put("��","�C");
            hiragana_katakana.put("��","�E");
            //hiragana_katakana.put("��","��");
            hiragana_katakana.put("��","�G");
            hiragana_katakana.put("��","�I");
            hiragana_katakana.put("��","�J");
            hiragana_katakana.put("��","�K");
            hiragana_katakana.put("��","�L");
            hiragana_katakana.put("��","�M");
            hiragana_katakana.put("��","�N");
            hiragana_katakana.put("��","�O");
            hiragana_katakana.put("��","�P");
            hiragana_katakana.put("��","�Q");
            hiragana_katakana.put("��","�R");
            hiragana_katakana.put("��","�S");
            hiragana_katakana.put("��","�T");
            hiragana_katakana.put("��","�U");
            hiragana_katakana.put("��","�V");
            hiragana_katakana.put("��","�W");
            hiragana_katakana.put("��","�X");
            hiragana_katakana.put("��","�Y");
            hiragana_katakana.put("��","�Z");
            hiragana_katakana.put("��","�[");
            hiragana_katakana.put("��","�\");
            hiragana_katakana.put("��","�]");
            hiragana_katakana.put("��","�^");
            hiragana_katakana.put("��","�_");
            hiragana_katakana.put("��","�`");
            hiragana_katakana.put("��","�a");
            hiragana_katakana.put("��","�c");
            hiragana_katakana.put("��","�d");
            hiragana_katakana.put("��","�e");
            hiragana_katakana.put("��","�f");
            hiragana_katakana.put("��","�g");
            hiragana_katakana.put("��","�h");
            hiragana_katakana.put("��","�i");
            hiragana_katakana.put("��","�j");
            hiragana_katakana.put("��","�k");
            hiragana_katakana.put("��","�l");
            hiragana_katakana.put("��","�m");
            hiragana_katakana.put("��","�n");
            hiragana_katakana.put("��","�o");
            hiragana_katakana.put("��","�p");
            hiragana_katakana.put("��","�q");
            hiragana_katakana.put("��","�r");
            hiragana_katakana.put("��","�s");
            hiragana_katakana.put("��","�t");
            hiragana_katakana.put("��","�u");
            hiragana_katakana.put("��","�v");
            hiragana_katakana.put("��","�w");
            hiragana_katakana.put("��","�x");
            hiragana_katakana.put("��","�y");
            hiragana_katakana.put("��","�z");
            hiragana_katakana.put("��","�{");
            hiragana_katakana.put("��","�|");
            hiragana_katakana.put("��","�}");
            hiragana_katakana.put("��","�~");
            hiragana_katakana.put("��","��");
            hiragana_katakana.put("��","��");
            hiragana_katakana.put("��","��");
            hiragana_katakana.put("��","��");
            hiragana_katakana.put("��","��");
            hiragana_katakana.put("��","��");
            hiragana_katakana.put("��","��");
            hiragana_katakana.put("��","��");
            hiragana_katakana.put("��","��");
            hiragana_katakana.put("��","��");
            hiragana_katakana.put("��","��");
            hiragana_katakana.put("��","��");
            hiragana_katakana.put("��","��");
        }catch( MissingResourceException mre ){
            mre.printStackTrace();
        }
    }

}
