/*
 * ConstentsXml.java
 *
 * Created on 2002/05/03, 1:22
 */

package jp.co.lastminute.common.xml;

import java.io.*;

/**
 *
 * @author  skondo
 * @version 
 */
public class ConstantsXml implements Serializable{
    private int product_type_cd = 0;
    private String agt_cd = "";
    private String category = "";
    private String checkurl = "";
    private String templatexsd = "";
    private String templatexsl = "";
    private String sendurl = "";
    private String sendxslt = "";
    private String cancelurl = "";
    private String cancelxslt = "";
    private String descxslt = "";

    /** Creates new ConstentsXml */
    public ConstantsXml() {
    }

    /** �v���p�e�B agt_cd �̎擾���\�b�h�B
     * @return �v���p�e�B agt_cd �̒l�B
     */
    public String getAgt_cd() {
        return agt_cd;
    }
    
    /** �v���p�e�B agt_cd �̐ݒ胁�\�b�h�B
     * @param agt_cd �v���p�e�B agt_cd �̐V�����l�B
     */
    public void setAgt_cd(String agt_cd) {
        this.agt_cd = agt_cd;
    }
    
    /** �v���p�e�B cancelurl �̎擾���\�b�h�B
     * @return �v���p�e�B cancelurl �̒l�B
     */
    public String getCancelurl() {
        return cancelurl;
    }
    
    /** �v���p�e�B cancelurl �̐ݒ胁�\�b�h�B
     * @param cancelurl �v���p�e�B cancelurl �̐V�����l�B
     */
    public void setCancelurl(String cancelurl) {
        this.cancelurl = cancelurl;
    }
    
    /** �v���p�e�B cancelxslt �̎擾���\�b�h�B
     * @return �v���p�e�B cancelxslt �̒l�B
     */
    public String getCancelxslt() {
        return cancelxslt;
    }
    
    /** �v���p�e�B cancelxslt �̐ݒ胁�\�b�h�B
     * @param cancelxslt �v���p�e�B cancelxslt �̐V�����l�B
     */
    public void setCancelxslt(String cancelxslt) {
        this.cancelxslt = cancelxslt;
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
    
    /** �v���p�e�B checkurl �̎擾���\�b�h�B
     * @return �v���p�e�B checkurl �̒l�B
     */
    public String getCheckurl() {
        return checkurl;
    }
    
    /** �v���p�e�B checkurl �̐ݒ胁�\�b�h�B
     * @param checkurl �v���p�e�B checkurl �̐V�����l�B
     */
    public void setCheckurl(String checkurl) {
        this.checkurl = checkurl;
    }
    
    /** �v���p�e�B descxslt �̎擾���\�b�h�B
     * @return �v���p�e�B descxslt �̒l�B
     */
    public String getDescxslt() {
        return descxslt;
    }
    
    /** �v���p�e�B descxslt �̐ݒ胁�\�b�h�B
     * @param descxslt �v���p�e�B descxslt �̐V�����l�B
     */
    public void setDescxslt(String descxslt) {
        this.descxslt = descxslt;
    }
    
    /** �v���p�e�B product_type_cd �̎擾���\�b�h�B
     * @return �v���p�e�B product_type_cd �̒l�B
     */
    public int getProduct_type_cd() {
        return product_type_cd;
    }
    
    /** �v���p�e�B product_type_cd �̐ݒ胁�\�b�h�B
     * @param product_type_cd �v���p�e�B product_type_cd �̐V�����l�B
     */
    public void setProduct_type_cd(int product_type_cd) {
        this.product_type_cd = product_type_cd;
    }
    
    /** �v���p�e�B sendxslt �̎擾���\�b�h�B
     * @return �v���p�e�B sendxslt �̒l�B
     */
    public String getSendxslt() {
        return sendxslt;
    }
    
    /** �v���p�e�B sendxslt �̐ݒ胁�\�b�h�B
     * @param sendxslt �v���p�e�B sendxslt �̐V�����l�B
     */
    public void setSendxslt(String sendxslt) {
        this.sendxslt = sendxslt;
    }
    
    /** �v���p�e�B templatexsd �̎擾���\�b�h�B
     * @return �v���p�e�B templatexsd �̒l�B
     */
    public String getTemplatexsd() {
        return templatexsd;
    }
    
    /** �v���p�e�B templatexsd �̐ݒ胁�\�b�h�B
     * @param templatexsd �v���p�e�B templatexsd �̐V�����l�B
     */
    public void setTemplatexsd(String templatexsd) {
        this.templatexsd = templatexsd;
    }
    
    /** �v���p�e�B sendurl �̎擾���\�b�h�B
     * @return �v���p�e�B sendurl �̒l�B
     */
    public String getSendurl() {
        return sendurl;
    }
    
    /** �v���p�e�B sendurl �̐ݒ胁�\�b�h�B
     * @param sendurl �v���p�e�B sendurl �̐V�����l�B
     */
    public void setSendurl(String sendurl) {
        this.sendurl = sendurl;
    }
    
    /** �v���p�e�B templatexsl �̎擾���\�b�h�B
     * @return �v���p�e�B templatexsl �̒l�B
     */
    public String getTemplatexsl() {
        return templatexsl;
    }
    
    /** �v���p�e�B templatexsl �̐ݒ胁�\�b�h�B
     * @param templatexsl �v���p�e�B templatexsl �̐V�����l�B
     */
    public void setTemplatexsl(String templatexsl) {
        this.templatexsl = templatexsl;
    }
    
}
