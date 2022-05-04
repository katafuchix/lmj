/*
 * CheckImage.java
 *
 * Created on 2002/04/08, 20:57
 */

package jp.co.yobrain.util.file;

import java.io.*;
import java.util.*;

/**
 *
 * @author  skondo
 * @version 
 */
public class CheckImage {
    private static ResourceBundle resources;		
    private static String basedir;
    
	/*���\�[�X�t�@�C�������݂���ꍇ���\�[�X���擾����*/
	static {
            try {
		resources   = ResourceBundle.getBundle("jp.co.yobrain.util.file.resource.FileSettrer", Locale.getDefault());
		basedir    = resources.getString("basedir");
	}catch (MissingResourceException mre){	resources = null;	}
	}
        
        /**�`�F�b�N�t�@�C����A�C���[�W�̃����N���o��
         * @param String imagefile
         * @param int width
         * @param int height
         * @param int border
         * @return ���o��  
         */
         public static String getImgUrl(String imagefile, int width, int height, int border){
             try{
            File filename = new File(basedir + "/" + imagefile);
            if( filename.exists() ){
                return "<IMG SRC=" + imagefile + "\" WIDTH=\"" + width + "\" HEIGHT=\"" + height + "\" + BORDER=\"" + border + "\">";
            }
             }catch(Exception ex){
                ex.printStackTrace();
             }
            return "";
         }
         /**�`�F�b�N�t�@�C����A�C���[�W�̃����N���o��
         * @param String imagefile
         * @return ���o��  
         */
         public static String getImgUrl(String imagefile ){
             try{
            File filename = new File(basedir + "/" + imagefile);
            if( filename.exists() ){
                return "<IMG SRC=" + imagefile + "\" BORDER=\"0\">";
            }
             }catch(Exception ex){
                ex.printStackTrace();
             }
            return "";
         }
}
