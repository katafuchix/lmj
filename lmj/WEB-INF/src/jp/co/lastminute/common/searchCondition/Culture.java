/*
 * Gift.java
 *
 * Created on 2002/04/08, 0:32
 */

package jp.co.lastminute.common.searchCondition;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;

import java.io.*;
/**
 *
 * @author  skondo
 * @version 
 */
public class Culture extends ActionForm implements Serializable
{
    private int catid;
    private int scatid;
    private String jan_cd;
    //for Order
    int numberOforder;

    /** reset properties when user do action */
    public void reset(ActionMapping mapping, HttpServletRequest request)
    {
         this.catid = 0;
        this.scatid = 0;
        this.jan_cd = "";
        this.numberOforder = 0;
    }
    /** Creates new Gift */
    public Culture() {
        this.catid = 0;
        this.scatid = 0;
        this.jan_cd = "";
        this.numberOforder = 0;
    }

    /** �v���p�e�B catid �̎擾���\�b�h�B
     * @return �v���p�e�B catid �̒l�B
     */
    public int getCatid() {
        return catid;
    }
    
    /** �v���p�e�B catid �̐ݒ胁�\�b�h�B
     * @param catid �v���p�e�B catid �̐V�����l�B
     */
    public void setCatid(int catid) {
        this.catid = catid;
    }
    
    /** �v���p�e�B jan_cd �̎擾���\�b�h�B
     * @return �v���p�e�B jan_cd �̒l�B
     */
    public String getJan_cd() {
        return jan_cd;
    }    
    
    /** �v���p�e�B jan_cd �̐ݒ胁�\�b�h�B
     * @param jan_cd �v���p�e�B jan_cd �̐V�����l�B
     */
    public void setJan_cd(String jan_cd) {
        this.jan_cd = jan_cd;
    }
    
    /** �v���p�e�B scatid �̎擾���\�b�h�B
     * @return �v���p�e�B scatid �̒l�B
     */
    public int getScatid() {
        return scatid;
    }
    
    /** �v���p�e�B scatid �̐ݒ胁�\�b�h�B
     * @param scatid �v���p�e�B scatid �̐V�����l�B
     */
    public void setScatid(int scatid) {
        this.scatid = scatid;
    }
    
    /** �v���p�e�B numberOforder �̎擾���\�b�h�B
     * @return �v���p�e�B numberOforder �̒l�B
     */
    public int getNumberOforder() {
        return numberOforder;
    }
    
    /** �v���p�e�B numberOforder �̐ݒ胁�\�b�h�B
     * @param numberOforder �v���p�e�B numberOforder �̐V�����l�B
     */
    public void setNumberOforder(int numberOforder) {
        this.numberOforder = numberOforder;
    }
    
}
