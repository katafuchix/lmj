/*
 * Selection.java
 *
 * Created on 2002/04/08, 0:26
 */

package jp.co.lastminute.common.searchCondition;

import java.io.*;
/**
 *
 * @author  skondo
 * @version 
 */
public class Selection implements Serializable {
    private int subcatid;
    /** Creates new Selection */
    public Selection() {
    }

    /** �v���p�e�B subcatid �̎擾���\�b�h�B
     * @return �v���p�e�B subcatid �̒l�B
     */
    public int getSubcatid() {
        return subcatid;
    }
    
    /** �v���p�e�B subcatid �̐ݒ胁�\�b�h�B
     * @param subcatid �v���p�e�B subcatid �̐V�����l�B
     */
    public void setSubcatid(int subcatid) {
        this.subcatid = subcatid;
    }
    
}
