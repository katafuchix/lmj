/*
 * Topdestination.java
 *
 * Created on 2002/04/08, 0:26
 */

package jp.co.lastminute.common.searchCondition;

/**
 *
 * @author  skondo
 * @version 
 */
public class Topdestination {
    private int countrycd;
    private int citycd;
    private String fromdate;
    private String todate;
    private int catid;
    private int subcatid;
    private int pax;
    
    /** Creates new Topdestination */
    public Topdestination() {
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
