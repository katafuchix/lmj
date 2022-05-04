/*
 * CardForm.java
 *
 * Created on 2002/04/28, 13:10
 */

package jp.co.lastminute.cart.form;

import java.io.*;
import org.apache.struts.action.*;

import javax.servlet.*;
import javax.servlet.http.*;

import jp.co.lastminute.*;
import jp.co.lastminute.cart.user.*;
import jp.co.lastminute.cart.user.model.*;

/**
 *
 * @author  skondo
 * @version 
 */
public class ProductSendForm extends ActionForm{
    private String lastname = "";
    //
    private String lastname_1 = "";
    private String lastname_2 = "";
    //
    private String first_name = "";
    //
    private String first_name1 = "";
    private String first_name2 = "";
    //
    private String state_cd = "";
    private String postal_cd = "";
    //
    private String postal_cd1 = "";
    private String postal_cd2 = "";
    //
    private String city_name = "";
    private String address = "";
    private String deliveryname = "";
    private String tel_no= "";
    private String fax ="";
    private String mobile_e_mail= "";
    private String addressflg = "1";
    ///////
    private String buildaddress = "";
    private String main_state = "";
    private String main_address = "";
    //////
    private String main_lastname_kana = "";
    private String main_firstname_kana = "";
    private String main_lastname_kanji = "";
    private String main_firstname_kanji = "";
    private String main_postalcode = "";
    //
    private String main_postalcode1 = "";
    private String main_postalcode2 = "";
    //
    //////
    private String ticketing = "1";
    private String payment_way ="1";
    //////
    private String update_flg = "";
    
    //////////////////////////////////////////
    private String deriver_month = "";
    private String deriver_day = "";
    private String deriver_time = "";

    public String getBuildaddress(){
        return this.buildaddress;
    }
    public void setBuildaddress(String buildaddress)throws IOException{
        this.buildaddress = getConv2Sjis( buildaddress ) ;
        return ;
    }
    public void setBuildaddress(String buildaddress, boolean flg)throws IOException{
        this.buildaddress = buildaddress ;
    }
    public String getMain_state(){
        return this.main_state;
    }
    public void setMain_state(String main_state)throws IOException{
        this.main_state = getConv2Sjis( main_state ) ;
    }
    public String getMain_address(){
        return this.main_address;
    }
    public void setMain_address(String main_address)throws IOException{
        this.main_address = getConv2Sjis( main_address ) ;
    }
    public void setMain_address(String main_address, boolean flg)throws IOException{
        this.main_address = main_address ;
    }
    /** �v���p�e�B address �̎擾���\�b�h�B
     * @return �v���p�e�B address �̒l�B
     */
    public String getAddress() {
        return address;
    }    
    
    /** �v���p�e�B address �̐ݒ胁�\�b�h�B
     * @param address �v���p�e�B address �̐V�����l�B
     */
    public void setAddress(String address) throws IOException{
        this.address = getConv2Sjis( address ) ;
    }
    public void setAddress(String address, boolean flg) throws IOException{
        this.address = address;
    }
    
    /** �v���p�e�B addressflg �̎擾���\�b�h�B
     * @return �v���p�e�B addressflg �̒l�B
     */
    public String getAddressflg() {
        return addressflg;
    }
    
    /** �v���p�e�B addressflg �̐ݒ胁�\�b�h�B
     * @param addressflg �v���p�e�B addressflg �̐V�����l�B
     */
    public void setAddressflg(String addressflg){
        this.addressflg = addressflg;
    }
    
    /** �v���p�e�B city_name �̎擾���\�b�h�B
     * @return �v���p�e�B city_name �̒l�B
     */
    public String getCity_name() {
        return city_name;
    }
    
    /** �v���p�e�B city_name �̐ݒ胁�\�b�h�B
     * @param city_name �v���p�e�B city_name �̐V�����l�B
     */
    public void setCity_name(String city_name) throws IOException{
        this.city_name = getConv2Sjis( city_name ) ;
    }
    public void setCity_name(String city_name, boolean flg) throws IOException{
        this.city_name = city_name;
    }
    
    /** �v���p�e�B deliveryname �̎擾���\�b�h�B
     * @return �v���p�e�B deliveryname �̒l�B
     */
    public String getDeliveryname() {
        return deliveryname;
    }
    
    /** �v���p�e�B deliveryname �̐ݒ胁�\�b�h�B
     * @param deliveryname �v���p�e�B deliveryname �̐V�����l�B
     */
    public void setDeliveryname(String deliveryname) throws IOException{
        this.deliveryname = getConv2Sjis( deliveryname ) ;
    }
    public void setDeliveryname(String deliveryname, boolean flg) throws IOException{
        this.deliveryname = deliveryname;
    }
    
    /** �v���p�e�B fax �̎擾���\�b�h�B
     * @return �v���p�e�B fax �̒l�B
     */
    public String getFax() {
        return fax;
    }
    
    /** �v���p�e�B fax �̐ݒ胁�\�b�h�B
     * @param fax �v���p�e�B fax �̐V�����l�B
     */
    public void setFax(String fax) throws IOException{
        this.fax = getConv2Sjis( fax ) ;
    }
    
    /** �v���p�e�B first_name �̎擾���\�b�h�B
     * @return �v���p�e�B first_name �̒l�B
     */
    public String getFirst_name() {
        return first_name;
    }
    
    /** �v���p�e�B first_name �̐ݒ胁�\�b�h�B
     * @param first_name �v���p�e�B first_name �̐V�����l�B
     */
    public void setFirst_name(String first_name) throws IOException{
        this.first_name = getConv2Sjis( first_name ) ;;
    }
    public void setFirst_name(String first_name, boolean flg) throws IOException{
        this.first_name = first_name;
    }
    /** �v���p�e�B lastname �̎擾���\�b�h�B
     * @return �v���p�e�B lastname �̒l�B
     */
    public String getLastname() {
        return lastname;
    }
    
    /** �v���p�e�B lastname �̐ݒ胁�\�b�h�B
     * @param lastname �v���p�e�B lastname �̐V�����l�B
     */
    public void setLastname(String lastname) throws IOException{
        this.lastname = getConv2Sjis( lastname ) ;
    }
    public void setLastname(String lastname, boolean flg) throws IOException{
        this.lastname = lastname;
    }
    
    /** �v���p�e�B mobile_e_mail �̎擾���\�b�h�B
     * @return �v���p�e�B mobile_e_mail �̒l�B
     */
    public String getMobile_e_mail() {
        return mobile_e_mail;
    }
    
    /** �v���p�e�B mobile_e_mail �̐ݒ胁�\�b�h�B
     * @param mobile_e_mail �v���p�e�B mobile_e_mail �̐V�����l�B
     */
    public void setMobile_e_mail(String mobile_e_mail) throws IOException{
        this.mobile_e_mail = getConv2Sjis( mobile_e_mail ) ;
    }
    public void setMobile_e_mail(String mobile_e_mail, boolean flg) throws IOException{
        this.mobile_e_mail = mobile_e_mail ;
    }
    /** �v���p�e�B postal_cd �̎擾���\�b�h�B
     * @return �v���p�e�B postal_cd �̒l�B
     */
    public String getPostal_cd() {
        return postal_cd;
    }
    
    /** �v���p�e�B postal_cd �̐ݒ胁�\�b�h�B
     * @param postal_cd �v���p�e�B postal_cd �̐V�����l�B
     */
    public void setPostal_cd(String postal_cd) throws IOException{
        this.postal_cd = getConv2Sjis( postal_cd ) ;
    }
    
    /** �v���p�e�B tel_no �̎擾���\�b�h�B
     * @return �v���p�e�B tel_no �̒l�B
     */
    public String getTel_no() {
        return tel_no;
    }
    
    /** �v���p�e�B tel_no �̐ݒ胁�\�b�h�B
     * @param tel_no �v���p�e�B tel_no �̐V�����l�B
     */
    public void setTel_no(String tel_no) throws IOException{
        this.tel_no = getConv2Sjis( tel_no ) ;
    }
    public void setTel_no(String tel_no, boolean flg) throws IOException{
        this.tel_no = tel_no;
    }
    
    /** �v���p�e�B state_cd �̎擾���\�b�h�B
     * @return �v���p�e�B state_cd �̒l�B
     */
    public String getState_cd() {
        return state_cd;
    }
    
    /** �v���p�e�B state_cd �̐ݒ胁�\�b�h�B
     * @param state_cd �v���p�e�B state_cd �̐V�����l�B
     */
    public void setState_cd(String state_cd) {
        this.state_cd = state_cd;
    }
    ////////////////////////////////////////////////////////////////////////////////
    /** �v���p�e�B main_firstname_kana �̎擾���\�b�h�B
     * @return �v���p�e�B main_firstname_kana �̒l�B
     */
    public String getMain_firstname_kana() {
        return main_firstname_kana;
    }
    
    /** �v���p�e�B main_firstname_kana �̐ݒ胁�\�b�h�B
     * @param main_firstname_kana �v���p�e�B main_firstname_kana �̐V�����l�B
     */
    public void setMain_firstname_kana(String main_firstname_kana) throws IOException{
        this.main_firstname_kana = getConv2Sjis(main_firstname_kana);
    }
    public void setMain_firstname_kana(String main_firstname_kana, boolean flg) throws IOException{
        this.main_firstname_kana = main_firstname_kana;
    }
    
    /** �v���p�e�B main_firstname_kanji �̎擾���\�b�h�B
     * @return �v���p�e�B main_firstname_kanji �̒l�B
     */
    public String getMain_firstname_kanji() {
        return main_firstname_kanji;
    }
    
    /** �v���p�e�B main_firstname_kanji �̐ݒ胁�\�b�h�B
     * @param main_firstname_kanji �v���p�e�B main_firstname_kanji �̐V�����l�B
     */
    public void setMain_firstname_kanji(String main_firstname_kanji) throws IOException{
        this.main_firstname_kanji = getConv2Sjis( main_firstname_kanji ) ;
    }
    public void setMain_firstname_kanji(String main_firstname_kanji, boolean flg) throws IOException{
        this.main_firstname_kanji = main_firstname_kanji;
    }
    /** �v���p�e�B main_lastname_kana �̎擾���\�b�h�B
     * @return �v���p�e�B main_lastname_kana �̒l�B
     */
    public String getMain_lastname_kana() {
        return main_lastname_kana;
    }
    
    /** �v���p�e�B main_lastname_kana �̐ݒ胁�\�b�h�B
     * @param main_lastname_kana �v���p�e�B main_lastname_kana �̐V�����l�B
     */
    public void setMain_lastname_kana(String main_lastname_kana) throws IOException{
        this.main_lastname_kana = getConv2Sjis( main_lastname_kana ) ;
    }
    public void setMain_lastname_kana(String main_lastname_kana, boolean flg ) throws IOException{
        this.main_lastname_kana = main_lastname_kana ;
    }
    
    /** �v���p�e�B main_lastname_kanji �̎擾���\�b�h�B
     * @return �v���p�e�B main_lastname_kanji �̒l�B
     */
    public String getMain_lastname_kanji() {
        return main_lastname_kanji;
    }
    
    /** �v���p�e�B main_lastname_kanji �̐ݒ胁�\�b�h�B
     * @param main_lastname_kanji �v���p�e�B main_lastname_kanji �̐V�����l�B
     */
    public void setMain_lastname_kanji(String main_lastname_kanji) throws IOException{
        this.main_lastname_kanji = getConv2Sjis( main_lastname_kanji ) ;
    }
    public void setMain_lastname_kanji(String main_lastname_kanji, boolean flg ) throws IOException{
        this.main_lastname_kanji = main_lastname_kanji ;
    }
    /** �v���p�e�B main_postalcode �̎擾���\�b�h�B
     * @return �v���p�e�B main_postalcode �̒l�B
     */
    public String getMain_postalcode() {
        return main_postalcode;
    }
    
    /** �v���p�e�B main_postalcode �̐ݒ胁�\�b�h�B
     * @param main_postalcode �v���p�e�B main_postalcode �̐V�����l�B
     */
    public void setMain_postalcode(String main_postalcode) {
        this.main_postalcode = main_postalcode;
    }
    
    /** �v���p�e�B main_postalcode1 �̎擾���\�b�h�B
     * @return �v���p�e�B main_postalcode1 �̒l�B
     */
    public String getMain_postalcode1() {
        return main_postalcode1;
    }
    
    /** �v���p�e�B main_postalcode1 �̐ݒ胁�\�b�h�B
     * @param main_postalcode1 �v���p�e�B main_postalcode1 �̐V�����l�B
     */
    public void setMain_postalcode1(String main_postalcode1) {
        this.main_postalcode1 = main_postalcode1;
    }
    
    /** �v���p�e�B main_postalcode2 �̎擾���\�b�h�B
     * @return �v���p�e�B main_postalcode2 �̒l�B
     */
    public String getMain_postalcode2() {
        return main_postalcode2;
    }
    
    /** �v���p�e�B main_postalcode2 �̐ݒ胁�\�b�h�B
     * @param main_postalcode2 �v���p�e�B main_postalcode2 �̐V�����l�B
     */
    public void setMain_postalcode2(String main_postalcode2) {
        this.main_postalcode2 = main_postalcode2;
    }
    
    /** �v���p�e�B postal_cd1 �̎擾���\�b�h�B
     * @return �v���p�e�B postal_cd1 �̒l�B
     */
    public String getPostal_cd1() {
        return postal_cd1;
    }
    
    /** �v���p�e�B postal_cd1 �̐ݒ胁�\�b�h�B
     * @param postal_cd1 �v���p�e�B postal_cd1 �̐V�����l�B
     */
    public void setPostal_cd1(String postal_cd1) {
        this.postal_cd1 = postal_cd1;
    }
    
    /** �v���p�e�B postal_cd2 �̎擾���\�b�h�B
     * @return �v���p�e�B postal_cd2 �̒l�B
     */
    public String getPostal_cd2() {
        return postal_cd2;
    }
    
    /** �v���p�e�B postal_cd2 �̐ݒ胁�\�b�h�B
     * @param postal_cd2 �v���p�e�B postal_cd2 �̐V�����l�B
     */
    public void setPostal_cd2(String postal_cd2) {
        this.postal_cd2 = postal_cd2;
    }
    
    /** �v���p�e�B ticketing �̎擾���\�b�h�B
     * @return �v���p�e�B ticketing �̒l�B
     */
    public String getTicketing() {
        return ticketing;
    }
    
    /** �v���p�e�B ticketing �̐ݒ胁�\�b�h�B
     * @param ticketing �v���p�e�B ticketing �̐V�����l�B
     */
    public void setTicketing(String ticketing) {
        this.ticketing = ticketing;
    }
    
    /** �v���p�e�B payment_way �̎擾���\�b�h�B
     * @return �v���p�e�B payment_way �̒l�B
     */
    public String getPayment_way() {
        return payment_way;
    }
    
    /** �v���p�e�B payment_way �̐ݒ胁�\�b�h�B
     * @param payment_way �v���p�e�B payment_way �̐V�����l�B
     */
    public void setPayment_way(String payment_way) {
        this.payment_way = payment_way;
    }
    
    /** �v���p�e�B first_name1 �̎擾���\�b�h�B
     * @return �v���p�e�B first_name1 �̒l�B
     */
    public String getFirst_name1() {
        return first_name1;
    }
    
    /** �v���p�e�B first_name1 �̐ݒ胁�\�b�h�B
     * @param first_name1 �v���p�e�B first_name1 �̐V�����l�B
     */
    public void setFirst_name1(String first_name1) throws IOException{
        this.first_name1 = getConv2Sjis( first_name1 ) ;
    }
    public void setFirst_name1(String first_name1, boolean flg) throws IOException{
        this.first_name1 = first_name1 ;
    }
    
    /** �v���p�e�B first_name2 �̎擾���\�b�h�B
     * @return �v���p�e�B first_name2 �̒l�B
     */
    public String getFirst_name2() {
        return first_name2;
    }
    
    /** �v���p�e�B first_name2 �̐ݒ胁�\�b�h�B
     * @param first_name2 �v���p�e�B first_name2 �̐V�����l�B
     */
    public void setFirst_name2(String first_name2) throws IOException{
        this.first_name2 = getConv2Sjis( first_name2 ) ;
    }
    public void setFirst_name2(String first_name2, boolean flg) throws IOException{
        this.first_name2 = first_name2;
    }
    
    /** �v���p�e�B lastname_1 �̎擾���\�b�h�B
     * @return �v���p�e�B lastname_1 �̒l�B
     */
    public String getLastname_1() {
        return lastname_1;
    }
    
    /** �v���p�e�B lastname_1 �̐ݒ胁�\�b�h�B
     * @param lastname_1 �v���p�e�B lastname_1 �̐V�����l�B
     */
    public void setLastname_1(String lastname_1) throws IOException{
        this.lastname_1 = getConv2Sjis( lastname_1 ) ;
    }
    public void setLastname_1(String lastname_1, boolean flg ) throws IOException{
        this.lastname_1 = lastname_1 ;
    }
    
    /** �v���p�e�B lastname_2 �̎擾���\�b�h�B
     * @return �v���p�e�B lastname_2 �̒l�B
     */
    public String getLastname_2() {
        return lastname_2;
    }
    
    /** �v���p�e�B lastname_2 �̐ݒ胁�\�b�h�B
     * @param lastname_2 �v���p�e�B lastname_2 �̐V�����l�B
     */
    public void setLastname_2(String lastname_2) throws IOException{
        this.lastname_2 = getConv2Sjis( lastname_2 );
    }
    public void setLastname_2(String lastname_2, boolean flg ) throws IOException{
        this.lastname_2 = lastname_2 ;
    }
    
    /** �v���p�e�B update_flg �̎擾���\�b�h�B
     * @return �v���p�e�B update_flg �̒l�B
     */
    public String getUpdate_flg() {
        return update_flg;
    }
    
    /** �v���p�e�B update_flg �̐ݒ胁�\�b�h�B
     * @param update_flg �v���p�e�B update_flg �̐V�����l�B
     */
    public void setUpdate_flg(String update_flg) {
        this.update_flg = update_flg;
    }
    
	/**
	 * Returns the deriver_day.
	 * @return String
	 */
	public String getDeriver_day() {
		return deriver_day;
	}

	/**
	 * Returns the deriver_month.
	 * @return String
	 */
	public String getDeriver_month() {
		return deriver_month;
	}

	/**
	 * Returns the deriver_time.
	 * @return String
	 */
	public String getDeriver_time() {
		return deriver_time;
	}

	/**
	 * Sets the deriver_day.
	 * @param deriver_day The deriver_day to set
	 */
	public void setDeriver_day(String deriver_day) {
		this.deriver_day = deriver_day;
	}

	/**
	 * Sets the deriver_month.
	 * @param deriver_month The deriver_month to set
	 */
	public void setDeriver_month(String deriver_month) {
		this.deriver_month = deriver_month;
	}

	/**
	 * Sets the deriver_time.
	 * @param deriver_time The deriver_time to set
	 */
	public void setDeriver_time(String deriver_time) {
		this.deriver_time = deriver_time;
	}
	/////
	public String getConv2Sjis( String str ) throws IOException{
		return new String(str.getBytes("ISO-8859-1"), "Shift_JIS" ) ;
    }

}
