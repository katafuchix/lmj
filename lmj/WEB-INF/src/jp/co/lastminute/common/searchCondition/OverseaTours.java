/*
 * OverseaTours.java
 *
 * Created on 2002/04/08, 0:22
 */

package jp.co.lastminute.common.searchCondition;

import java.io.*;
/**
 *
 * @author  skondo
 * @version 
 */
public class OverseaTours implements Serializable {
    private int catid;
    private int subcatid;
    private int areacd;
    private int countrycd;
    private int citycd;
    private int pax;
    private int adult;
    private int child;
    private int infant;
    private String fromdate;
    private String todate;
    private int depcitycd;
    
    /** Creates new OverseaTours */
    public OverseaTours() {
    }

    /** �v���p�e�B adult �̎擾���\�b�h�B
     * @return �v���p�e�B adult �̒l�B
     */
    public int getAdult() {
        return adult;
    }
    
    /** �v���p�e�B adult �̐ݒ胁�\�b�h�B
     * @param adult �v���p�e�B adult �̐V�����l�B
     */
    public void setAdult(int adult) {
        this.adult = adult;
    }
    
    /** �v���p�e�B areacd �̎擾���\�b�h�B
     * @return �v���p�e�B areacd �̒l�B
     */
    public int getAreacd() {
        return areacd;
    }
    
    /** �v���p�e�B areacd �̐ݒ胁�\�b�h�B
     * @param areacd �v���p�e�B areacd �̐V�����l�B
     */
    public void setAreacd(int areacd) {
        this.areacd = areacd;
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
    
    /** �v���p�e�B child �̎擾���\�b�h�B
     * @return �v���p�e�B child �̒l�B
     */
    public int getChild() {
        return child;
    }
    
    /** �v���p�e�B child �̐ݒ胁�\�b�h�B
     * @param child �v���p�e�B child �̐V�����l�B
     */
    public void setChild(int child) {
        this.child = child;
    }
    
    /** �v���p�e�B citycd �̎擾���\�b�h�B
     * @return �v���p�e�B citycd �̒l�B
     */
    public int getCitycd() {
        return citycd;
    }
    
    /** �v���p�e�B citycd �̐ݒ胁�\�b�h�B
     * @param citycd �v���p�e�B citycd �̐V�����l�B
     */
    public void setCitycd(int citycd) {
        this.citycd = citycd;
    }
    
    /** �v���p�e�B countrycd �̎擾���\�b�h�B
     * @return �v���p�e�B countrycd �̒l�B
     */
    public int getCountrycd() {
        return countrycd;
    }
    
    /** �v���p�e�B countrycd �̐ݒ胁�\�b�h�B
     * @param countrycd �v���p�e�B countrycd �̐V�����l�B
     */
    public void setCountrycd(int countrycd) {
        this.countrycd = countrycd;
    }
    
    /** �v���p�e�B depcitycd �̎擾���\�b�h�B
     * @return �v���p�e�B depcitycd �̒l�B
     */
    public int getDepcitycd() {
        return depcitycd;
    }
    
    /** �v���p�e�B depcitycd �̐ݒ胁�\�b�h�B
     * @param depcitycd �v���p�e�B depcitycd �̐V�����l�B
     */
    public void setDepcitycd(int depcitycd) {
        this.depcitycd = depcitycd;
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
    
    /** �v���p�e�B infant �̎擾���\�b�h�B
     * @return �v���p�e�B infant �̒l�B
     */
    public int getInfant() {
        return infant;
    }
    
    /** �v���p�e�B infant �̐ݒ胁�\�b�h�B
     * @param infant �v���p�e�B infant �̐V�����l�B
     */
    public void setInfant(int infant) {
        this.infant = infant;
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
