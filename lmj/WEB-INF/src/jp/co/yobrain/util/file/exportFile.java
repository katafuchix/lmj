/*
 * InportFile.java
 *
 * Created on 2002/05/01, 11:15
 */

package jp.co.yobrain.util.file;

import java.io.*;
import java.util.*;

/**
 *
 * @author  skondo
 * @version
 */
public class exportFile {
    /**
     * �t�@�C�����̏o�͂��s��
     * @param String �t�@�C����
     * @param String �p�X
     */
  public static void putFileAmount(String filename, String path, String source, String encoding) throws Exception{
    BufferedWriter out = null;
    try {
      out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(path + "/" + filename), encoding));
      out.write(source, 0, source.length());
      } catch(Exception e){
        throw e;
      } finally {
        out.close();
      }
    }
    /**
     * �t�@�C�����̎擾���s��
     * @param String �t�@�C����
     * @param String �p�X
     * @param String �G���R�[�h��
     */
  public static void putFileAmount(String filename, String path, String source) throws Exception{
    try {
      putFileAmount(filename, path, source, "UTF-8") ;
    } catch (Exception e) {
      throw e;
    }
  }
}
