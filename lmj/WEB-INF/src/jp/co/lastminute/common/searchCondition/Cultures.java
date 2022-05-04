/*
 * Cultures.java
 *
 * Created on 2002/04/08, 0:25
 */

package jp.co.lastminute.common.searchCondition;

import java.io.*;

/**
 *
 * @author  skondo
 * @version 
 */
public class Cultures implements Serializable {
    private String fromdate;    //����FROM
    private String todate;      //����TO
    private int weekday;        //�j��
    private int member;         //�l��
    private int sex;            //����
    private int subcat;         //�T�u�J�e�S���[
    private int citycd;         //�s�s�R�[�h
    /** �R���X�g���N�^ */
    public Cultures(){
        this.fromdate = "";
        this.todate = "";
        this.citycd = 0;
        this.member = 0;
        this.sex = 0;
        this.subcat = 0;
        this.weekday = 0;
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
    
    /** �v���p�e�B member �̎擾���\�b�h�B
     * @return �v���p�e�B member �̒l�B
     */
    public int getMember() {
        return member;
    }
    
    /** �v���p�e�B member �̐ݒ胁�\�b�h�B
     * @param member �v���p�e�B member �̐V�����l�B
     */
    public void setMember(int member) {
        this.member = member;
    }
    
    /** �v���p�e�B sex �̎擾���\�b�h�B
     * @return �v���p�e�B sex �̒l�B
     */
    public int getSex() {
        return sex;
    }
    
    /** �v���p�e�B sex �̐ݒ胁�\�b�h�B
     * @param sex �v���p�e�B sex �̐V�����l�B
     */
    public void setSex(int sex) {
        this.sex = sex;
    }
    
    /** �v���p�e�B subcat �̎擾���\�b�h�B
     * @return �v���p�e�B subcat �̒l�B
     */
    public int getSubcat() {
        return subcat;
    }
    
    /** �v���p�e�B subcat �̐ݒ胁�\�b�h�B
     * @param subcat �v���p�e�B subcat �̐V�����l�B
     */
    public void setSubcat(int subcat) {
        this.subcat = subcat;
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
    
    /** �v���p�e�B weekday �̎擾���\�b�h�B
     * @return �v���p�e�B weekday �̒l�B
     */
    public int getWeekday() {
        return weekday;
    }
    
    /** �v���p�e�B weekday �̐ݒ胁�\�b�h�B
     * @param weekday �v���p�e�B weekday �̐V�����l�B
     */
    public void setWeekday(int weekday) {
        this.weekday = weekday;
    }
    
}
