/*
 * Entertaiment.java
 *
 * Created on 2002/04/08, 0:33
 */

package jp.co.lastminute.common.searchCondition;

import java.io.*;
/**
 *
 * @author  skondo
 * @version 
 */
public class Entertaiment implements Serializable {
    
    private int catid;
    private int subcatid;
    private int cityid;
    private int pax;
    private String fromdate;
    private String todate;
        
    /** Creates new Entertaiment */
    public Entertaiment() {
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
    
    /** �v���p�e�B cityid �̎擾���\�b�h�B
     * @return �v���p�e�B cityid �̒l�B
     */
    public int getCityid() {
        return cityid;
    }
    
    /** �v���p�e�B cityid �̐ݒ胁�\�b�h�B
     * @param cityid �v���p�e�B cityid �̐V�����l�B
     */
    public void setCityid(int cityid) {
        this.cityid = cityid;
    }
    
    /** �v���p�e�B fromdate �̎擾���\�b�h�B
     * @return �v���p�e�B fromdate �̒l�B
     */
    public String getFromdate() {
        return fromdate;
    }
    
    /** �v���p�e�B fromdate �̐ݒ胁�\�b�h�B
     * @param fromdate �v���p�e�B fromdate �̐V�����l�B
     */
    public void setFromdate(String fromdate) {
        this.fromdate = fromdate;
    }
    
    /** �v���p�e�B pax �̎擾���\�b�h�B
     * @return �v���p�e�B pax �̒l�B
     */
    public int getPax() {
        return pax;
    }
    
    /** �v���p�e�B pax �̐ݒ胁�\�b�h�B
     * @param pax �v���p�e�B pax �̐V�����l�B
     */
    public void setPax(int pax) {
        this.pax = pax;
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
    
    /** �v���p�e�B todate �̎擾���\�b�h�B
     * @return �v���p�e�B todate �̒l�B
     */
    public String getTodate() {
        return todate;
    }
    
    /** �v���p�e�B todate �̐ݒ胁�\�b�h�B
     * @param todate �v���p�e�B todate �̐V�����l�B
     */
    public void setTodate(String todate) {
        this.todate = todate;
    }
    
}
