/*
 * SearchConditionHundler.java
 *
 * Created on 2002/04/08, 0:09
 */

package jp.co.lastminute.common.searchCondition;

import java.io.*;

/**
 *
 * @author  skondo
 * @version 
 */
public class SearchConditionHundler {
    private Cultures culture;
    private DomesticHotel domestichotel;
    private DomesticTours domestictours;
    private Entertaiment entertaiment;
    private Gift gift;
    private OverseaFlight overseaflight;
    private OverseaHotel overseahotel;
    private OverseaTours overseatours;
    private Selection selection;
    private Topdestination topdestination;
    /** Creates new SearchConditionHundler */
    public SearchConditionHundler() {
    }

    /** �v���p�e�B culture �̎擾���\�b�h�B
     * @return �v���p�e�B culture �̒l�B
     */
    public Cultures getCulture() {
        return culture;
    }
    
    /** �v���p�e�B culture �̐ݒ胁�\�b�h�B
     * @param culture �v���p�e�B culture �̐V�����l�B
     */
    public void setCulture(Cultures culture) {
        this.culture = culture;
    }
    
    /** �v���p�e�B domestichotel �̎擾���\�b�h�B
     * @return �v���p�e�B domestichotel �̒l�B
     */
    public DomesticHotel getDomestichotel() {
        return domestichotel;
    }
    
    /** �v���p�e�B domestichotel �̐ݒ胁�\�b�h�B
     * @param domestichotel �v���p�e�B domestichotel �̐V�����l�B
     */
    public void setDomestichotel(DomesticHotel domestichotel) {
        this.domestichotel = domestichotel;
    }
    
    /** �v���p�e�B domestictours �̎擾���\�b�h�B
     * @return �v���p�e�B domestictours �̒l�B
     */
    public DomesticTours getDomestictours() {
        return domestictours;
    }
    
    /** �v���p�e�B domestictours �̐ݒ胁�\�b�h�B
     * @param domestictours �v���p�e�B domestictours �̐V�����l�B
     */
    public void setDomestictours(DomesticTours domestictours) {
        this.domestictours = domestictours;
    }
    
    /** �v���p�e�B entertaiment �̎擾���\�b�h�B
     * @return �v���p�e�B entertaiment �̒l�B
     */
    public Entertaiment getEntertaiment() {
        return entertaiment;
    }
    
    /** �v���p�e�B entertaiment �̐ݒ胁�\�b�h�B
     * @param entertaiment �v���p�e�B entertaiment �̐V�����l�B
     */
    public void setEntertaiment(Entertaiment entertaiment) {
        this.entertaiment = entertaiment;
    }
    
    /** �v���p�e�B gift �̎擾���\�b�h�B
     * @return �v���p�e�B gift �̒l�B
     */
    public Gift getGift() {
        return gift;
    }
    
    /** �v���p�e�B gift �̐ݒ胁�\�b�h�B
     * @param gift �v���p�e�B gift �̐V�����l�B
     */
    public void setGift(Gift gift) {
        this.gift = gift;
    }
    
    /** �v���p�e�B overseaflight �̎擾���\�b�h�B
     * @return �v���p�e�B overseaflight �̒l�B
     */
    public OverseaFlight getOverseaflight() {
        return overseaflight;
    }
    
    /** �v���p�e�B overseaflight �̐ݒ胁�\�b�h�B
     * @param overseaflight �v���p�e�B overseaflight �̐V�����l�B
     */
    public void setOverseaflight(OverseaFlight overseaflight) {
        this.overseaflight = overseaflight;
    }
    
    /** �v���p�e�B overseatours �̎擾���\�b�h�B
     * @return �v���p�e�B overseatours �̒l�B
     */
    public OverseaTours getOverseatours() {
        return overseatours;
    }
    
    /** �v���p�e�B overseatours �̐ݒ胁�\�b�h�B
     * @param overseatours �v���p�e�B overseatours �̐V�����l�B
     */
    public void setOverseatours(OverseaTours overseatours) {
        this.overseatours = overseatours;
    }
    
    /** �v���p�e�B selection �̎擾���\�b�h�B
     * @return �v���p�e�B selection �̒l�B
     */
    public Selection getSelection() {
        return selection;
    }
    
    /** �v���p�e�B selection �̐ݒ胁�\�b�h�B
     * @param selection �v���p�e�B selection �̐V�����l�B
     */
    public void setSelection(Selection selection) {
        this.selection = selection;
    }
    
    /** �v���p�e�B topdestination �̎擾���\�b�h�B
     * @return �v���p�e�B topdestination �̒l�B
     */
    public Topdestination getTopdestination() {
        return topdestination;
    }
    
    /** �v���p�e�B topdestination �̐ݒ胁�\�b�h�B
     * @param topdestination �v���p�e�B topdestination �̐V�����l�B
     */
    public void setTopdestination(Topdestination topdestination) {
        this.topdestination = topdestination;
    }
    
}
