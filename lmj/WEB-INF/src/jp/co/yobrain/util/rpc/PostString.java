/*
 * PostString.java
 *
 * Created on 2002/04/29, 19:34
 */

package jp.co.yobrain.util.rpc;

import java.io.*;

/**
 *
 * @author  skondo
 * @version 0.1
 */
public class PostString implements Serializable{
    private String name = "";
    private String value = "";

    /** Creates new PostString */
    public PostString(String nam, String val) {
        try{
            this.name = nam;
        }catch(Exception ex){
            this.name = "";
        }
        try{
            this.value = val;
        }catch(Exception ex){
            this.value = "";
        }
        //System.err.println("Nam: " + nam + ", val: " + val);
    }

    /** �v���p�e�B name �̎擾���\�b�h�B
     * @return �v���p�e�B name �̒l�B
     */
    public String getName() {
        return name;
    }
    
    /** �v���p�e�B name �̐ݒ胁�\�b�h�B
     * @param name �v���p�e�B name �̐V�����l�B
     */
    public void setName(String name) {
        this.name = name;
    }
    
    /** �v���p�e�B value �̎擾���\�b�h�B
     * @return �v���p�e�B value �̒l�B
     */
    public String getValue() {
        return value;
    }
    
    /** �v���p�e�B value �̐ݒ胁�\�b�h�B
     * @param value �v���p�e�B value �̐V�����l�B
     */
    public void setValue(String value) {
        this.value = value;
    }
    
    public String geteqName() {
        return this.name + "=";
    }

    /**
     * @author Ricardo Leon
     * @returns a String with the name and the value of the PostString object
     */
    public String toString() {
    	return name + "=" + value;
    }
}
