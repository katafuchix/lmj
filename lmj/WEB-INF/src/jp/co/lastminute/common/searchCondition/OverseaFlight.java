/*
 * OverseaFlight.java
 *
 * Created on 2002/04/08, 0:20
 */

package jp.co.lastminute.common.searchCondition;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;

import java.io.*;
import java.util.*;
/**
 *
 * @author  skondo
 * @version 
 */
public class OverseaFlight extends ActionForm implements Serializable {
    public static final int sec_dep_ = 0;
    public static final int sec_con_ = 1;
    public static final int sec_oj_ = 2;
    
    protected String agentCode;
    protected ArrayList Segment;
    protected String citycd;
    protected String countrycd;
    protected String fromcity;
    protected String carear;
    protected int pax;
    protected int adult;
    protected int child;
    protected int infant;
    protected int depdate;
    protected int arridate;
    protected int deptime;
    protected int arritime;
    int status; 
    ////////////////////////////
    protected int branch_id = 1;
    protected String flex_id;                 
    public static final String[] BRANCH = {"", "TYO", "NGO", "KIX", "FUK"};     //add by skonbdo
    ////////////////////////
    /** Creates new OverseaFlight */
    public OverseaFlight() {
    }
    
    public void reset(ActionMapping mapping, HttpServletRequest request){
        
       Segment = new ArrayList();
       agentCode = "";
       citycd = "";
       countrycd = "";
       fromcity = "";
       carear = "";
       pax = 0;
       adult = 0;
       child = 0;
       infant = 0;
       depdate = 0;
       arridate = 0;
       deptime = 0;
       arritime = 0;
       status = 0;
       branch_id = 1;
       flex_id = "";
    }
    public void setAgentCode(String agentCode){
        this.agentCode = agentCode;
    }
    public String getAgentCode(){
        return this.agentCode;
    }
    /**
     * 
     */
    public void addSector( Sector sector_){
        this.Segment.add( sector_ );
    }
    /**
     *
     */
    public void removeSector( int idx){
        this.Segment.remove( idx );
    }
    /**
     *
     */
    public void setSector( Sector sector_, int idx ){
        this.Segment.set( idx, sector_ );
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
    
    /** �v���p�e�B arridate �̎擾���\�b�h�B
     * @return �v���p�e�B arridate �̒l�B
     */
    public int getArridate() {
        return this.arridate;
    }    
    
    /** �v���p�e�B arridate �̐ݒ胁�\�b�h�B
     * @param arridate �v���p�e�B arridate �̐V�����l�B
     */
    public void setArridate(int arridate) {
        this.arridate = arridate;
    }
    
    /** �v���p�e�B arritime �̎擾���\�b�h�B
     * @return �v���p�e�B arritime �̒l�B
     */
    public int getArritime() {
        return arritime;
    }
    
    /** �v���p�e�B arritime �̐ݒ胁�\�b�h�B
     * @param arritime �v���p�e�B arritime �̐V�����l�B
     */
    public void setArritime(int arritime) {
        this.arritime = arritime;
    }
    
    /** �v���p�e�B carear �̎擾���\�b�h�B
     * @return �v���p�e�B carear �̒l�B
     */
    public String getCarear() {
        return carear;
    }
    
    /** �v���p�e�B carear �̐ݒ胁�\�b�h�B
     * @param carear �v���p�e�B carear �̐V�����l�B
     */
    public void setCarear(String carear) {
        this.carear = carear;
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
    public String getCitycd() {
        return citycd;
    }
    
    /** �v���p�e�B citycd �̐ݒ胁�\�b�h�B
     * @param citycd �v���p�e�B citycd �̐V�����l�B
     */
    public void setCitycd(String citycd) {
        this.citycd = citycd;
    }
    
    /** �v���p�e�B countrycd �̎擾���\�b�h�B
     * @return �v���p�e�B countrycd �̒l�B
     */
    public String getCountrycd() {
        return countrycd;
    }
    
    /** �v���p�e�B countrycd �̐ݒ胁�\�b�h�B
     * @param countrycd �v���p�e�B countrycd �̐V�����l�B
     */
    public void setCountrycd(String countrycd) {
        this.countrycd = countrycd;
    }
    
    /** �v���p�e�B depdate �̎擾���\�b�h�B
     * @return �v���p�e�B depdate �̒l�B
     */
    public int getDepdate() {
        return depdate;
    }
    
    /** �v���p�e�B depdate �̐ݒ胁�\�b�h�B
     * @param depdate �v���p�e�B depdate �̐V�����l�B
     */
    public void setDepdate(int depdate) {
        this.depdate = depdate;
    }
    
    /** �v���p�e�B deptime �̎擾���\�b�h�B
     * @return �v���p�e�B deptime �̒l�B
     */
    public int getDeptime() {
        return deptime;
    }
    
    /** �v���p�e�B deptime �̐ݒ胁�\�b�h�B
     * @param deptime �v���p�e�B deptime �̐V�����l�B
     */
    public void setDeptime(int deptime) {
        this.deptime = deptime;
    }
    
    /** �v���p�e�B fromcity �̎擾���\�b�h�B
     * @return �v���p�e�B fromcity �̒l�B
     */
    public String getFromcity() {
        return fromcity;
    }
    
    /** �v���p�e�B fromcity �̐ݒ胁�\�b�h�B
     * @param fromcity �v���p�e�B fromcity �̐V�����l�B
     */
    public void setFromcity(String fromcity) {
        this.fromcity = fromcity;
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
    
    /** �v���p�e�B Segment �̎擾���\�b�h�B
     * @return �v���p�e�B Segment �̒l�B
     */
    public ArrayList getSegment() {
        return Segment;
    }
    
    /** �v���p�e�B Segment �̐ݒ胁�\�b�h�B
     * @param Segment �v���p�e�B Segment �̐V�����l�B
     */
    public void setSegment(ArrayList Segment) {
        this.Segment = Segment;
    }
    
    /** �v���p�e�B status �̎擾���\�b�h�B
     * @return �v���p�e�B status �̒l�B
     */
    public int getStatus() {
        return status;
    }
    
    /** �v���p�e�B status �̐ݒ胁�\�b�h�B
     * @param status �v���p�e�B status �̐V�����l�B
     */
    public void setStatus(int status) {
        this.status = status;
    }
    ////////////////////////////////////////////////
    /** �v���p�e�B flex_id �̎擾���\�b�h�B
     * @return �v���p�e�B flex_id �̒l�B
     */
    public String getFlex_id() {
        return flex_id;
    }
    
    /** �v���p�e�B flex_id �̐ݒ胁�\�b�h�B
     * @param flex_id �v���p�e�B flex_id �̐V�����l�B
     */
    public void setFlex_id(String flex_id) {
        this.flex_id = flex_id;
    }
    
    /** �v���p�e�B branch_id �̎擾���\�b�h�B
     * @return �v���p�e�B branch_id �̒l�B
     */
    public int getBranch_id() {
        return branch_id;
    }
    
    /** �v���p�e�B branch_id �̐ݒ胁�\�b�h�B
     * @param branch_id �v���p�e�B branch_id �̐V�����l�B
     */
    public void setBranch_id(int branch_id) {
        this.branch_id = branch_id;
    }
    //////////////////////////////////////add by skonbdo
}
