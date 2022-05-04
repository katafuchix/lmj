/*
 * DomesticHotel.java
 *
 * Created on 2002/04/08, 0:21
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
public class DomesticHotel
    extends ActionForm
    implements Serializable

{
    //FOR SEARCH
    
    private int catid;
    private String[] state_cd;
    private int city_cd;
    private int nights;
    private int numberOfrooms;
    private int numberOfadult;
    private int numberOfkids;
    private String category;
    private int price;
    private int from_price;
    private int to_price;
    private String SYO_TYPE;
    private String xmlString;
    private int scatid;
    private String agt_cd;
    private String product_id;
    private String sup_id;
    private int checkoutdate;
    private int checkindate;
    //FOR BOOKING
    
    /** Creates new DomesticHotel */
    public DomesticHotel() {
        this.catid = 3;
        this.state_cd = null;
        this.city_cd = 0;
        this.checkindate = 0;
        this.checkoutdate = 0;
        this.nights = 0;
        this.numberOfrooms = 0;
        this.numberOfadult = 0;
        this.numberOfkids = 0;
        this.category = "";
        this.price = 0;
        this.from_price = 0;
        this.scatid = 0;
        this.SYO_TYPE = "";
    }

  	public void reset(ActionMapping mapping, HttpServletRequest request)
    {

        this.catid = 3;
        this.state_cd = null;
        this.city_cd = 0;
        this.checkindate = 0;
        this.checkoutdate = 0;
        this.nights = 0;
        this.numberOfrooms = 0;
        this.numberOfadult = 0;
        this.numberOfkids = 0;
        this.category = "";
        this.price = 0;
        this.from_price = 0;
        this.scatid = 0;
        this.SYO_TYPE = "";
    }
    
    /** �v���p�e�B category �̎擾���\�b�h�B
     * @return �v���p�e�B category �̒l�B
     */
    public String getCategory() {
        return category;
    }
    
    /** �v���p�e�B category �̐ݒ胁�\�b�h�B
     * @param category �v���p�e�B category �̐V�����l�B
     */
    public void setCategory(String category) {
        this.category = category;
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
    
    /** �v���p�e�B checkindate �̎擾���\�b�h�B
     * @return �v���p�e�B checkindate �̒l�B
     */
    public int getCheckindate() {
        return checkindate;
    }
    
    /** �v���p�e�B checkindate �̐ݒ胁�\�b�h�B
     * @param checkindate �v���p�e�B checkindate �̐V�����l�B
     */
    public void setCheckindate(int checkindate) {
        this.checkindate = checkindate;
    }
    
    /** �v���p�e�B city_cd �̎擾���\�b�h�B
     * @return �v���p�e�B city_cd �̒l�B
     */
    public int getCity_cd() {
        return city_cd;
    }
    
    /** �v���p�e�B city_cd �̐ݒ胁�\�b�h�B
     * @param city_cd �v���p�e�B city_cd �̐V�����l�B
     */
    public void setCity_cd(int city_cd) {
        this.city_cd = city_cd;
    }
    
    /** �v���p�e�B from_price �̎擾���\�b�h�B
     * @return �v���p�e�B from_price �̒l�B
     */
    public int getFrom_price() {
        return from_price;
    }
    
    /** �v���p�e�B from_price �̐ݒ胁�\�b�h�B
     * @param from_price �v���p�e�B from_price �̐V�����l�B
     */
    public void setFrom_price(int from_price) {
        this.from_price = from_price;
    }
    
    /** �v���p�e�B nights �̎擾���\�b�h�B
     * @return �v���p�e�B nights �̒l�B
     */
    public int getNights() {
        return nights;
    }
    
    /** �v���p�e�B nights �̐ݒ胁�\�b�h�B
     * @param nights �v���p�e�B nights �̐V�����l�B
     */
    public void setNights(int nights) {
        this.nights = nights;
    }
    
    /** �v���p�e�B numberOfadul �̎擾���\�b�h�B
     * @return �v���p�e�B numberOfadul �̒l�B
     */
    public int getNumberOfadult() {
        return numberOfadult;
    }
    
    /** �v���p�e�B numberOfadul �̐ݒ胁�\�b�h�B
     * @param numberOfadul �v���p�e�B numberOfadul �̐V�����l�B
     */
    public void setNumberOfadult(int numberOfadult) {
        this.numberOfadult = numberOfadult;
    }
    
    /** �v���p�e�B numberOfkids �̎擾���\�b�h�B
     * @return �v���p�e�B numberOfkids �̒l�B
     */
    public int getNumberOfkids() {
        return numberOfkids;
    }
    
    /** �v���p�e�B numberOfkids �̐ݒ胁�\�b�h�B
     * @param numberOfkids �v���p�e�B numberOfkids �̐V�����l�B
     */
    public void setNumberOfkids(int numberOfkids) {
        this.numberOfkids = numberOfkids;
    }
    
    /** �v���p�e�B numberOfrooms �̎擾���\�b�h�B
     * @return �v���p�e�B numberOfrooms �̒l�B
     */
    public int getNumberOfrooms() {
        return numberOfrooms;
    }
    
    /** �v���p�e�B numberOfrooms �̐ݒ胁�\�b�h�B
     * @param numberOfrooms �v���p�e�B numberOfrooms �̐V�����l�B
     */
    public void setNumberOfrooms(int numberOfrooms) {
        this.numberOfrooms = numberOfrooms;
    }
    
    /** �v���p�e�B price �̎擾���\�b�h�B
     * @return �v���p�e�B price �̒l�B
     */
    public int getPrice() {
        return price;
    }
    
    /** �v���p�e�B price �̐ݒ胁�\�b�h�B
     * @param price �v���p�e�B price �̐V�����l�B
     */
    public void setPrice(int price) {
        this.price = price;
    }    
    
    /** �v���p�e�B state_cd �̎擾���\�b�h�B
     * @return �v���p�e�B state_cd �̒l�B
     */
    public String[] getState_cd() { return state_cd; }
    
    /** �v���p�e�B state_cd �̐ݒ胁�\�b�h�B
     * @param state_cd �v���p�e�B state_cd �̐V�����l�B
     */
    public void setState_cd(String[] state_cd) { this.state_cd = state_cd; }
    
    /** �v���p�e�B SYO_TYPE �̎擾���\�b�h�B
     * @return �v���p�e�B SYO_TYPE �̒l�B
     */
    public String getSYO_TYPE() {
        return SYO_TYPE;
    }
    
    /** �v���p�e�B SYO_TYPE �̐ݒ胁�\�b�h�B
     * @param SYO_TYPE �v���p�e�B SYO_TYPE �̐V�����l�B
     */
    public void setSYO_TYPE(String SYO_TYPE) {
        this.SYO_TYPE = SYO_TYPE;
    }
    
    /** �v���p�e�B to_price �̎擾���\�b�h�B
     * @return �v���p�e�B to_price �̒l�B
     */
    public int getTo_price() {
        return to_price;
    }
    
    /** �v���p�e�B to_price �̐ݒ胁�\�b�h�B
     * @param to_price �v���p�e�B to_price �̐V�����l�B
     */
    public void setTo_price(int to_price) {
        this.to_price = to_price;
    }

    public String getXmlString(){ return xmlString; }    

    public void setXmlString(String xmlString){ this.xmlString = xmlString; }

    public int getScatid(){
            return scatid;
        }

    public void setScatid(int scatid){
            this.scatid = scatid;
        }

    public String getAgt_cd(){ return agt_cd; }

    public void setAgt_cd(String agt_cd){ this.agt_cd = agt_cd; }

    public String getProduct_id(){ return product_id; }

    public void setProduct_id(String product_id){ this.product_id = product_id; }

    public String getSup_id(){ return sup_id; }

    public void setSup_id(String sup_id){ this.sup_id = sup_id; }

    public int getCheckoutdate(){
            return checkoutdate;
        }

    public void setCheckoutdate(int checkoutdate){
            this.checkoutdate = checkoutdate;
        }
}
