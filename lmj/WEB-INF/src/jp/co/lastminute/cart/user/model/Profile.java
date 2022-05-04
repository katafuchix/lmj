/*
 * Profile.java
 *
 * Created on 2002/04/05, 19:08
 */
package jp.co.lastminute.cart.user.model;

/**
 *
 * @author  skondo & Takashi Yamada
 * @version 1.0
 */
public class Profile {
    /**
        USER_ID                                   NOT NULL NUMBER(10)
        SEI_KANA                                           VARCHAR2(30)
        SEI_KANJI                                          VARCHAR2(30)
        NA_KANA                                            VARCHAR2(30)
        NA_KANJI                                           VARCHAR2(30)
        FIRST_NAME                                         VARCHAR2(30)
        LASTNAME                                           VARCHAR2(30)
        SEX                                                NUMBER(10)
        BIRTH_DAY                                          NUMBER(8)
        POSTAL_CD                                 NOT NULL CHAR(7)
        STATE_CD                                           NUMBER(10)
        CITY_NAME                                          VARCHAR2(24)
        ADDRESS                                            VARCHAR2(80)
        TEL_NO                                             VARCHAR2(20)
        FAX                                                VARCHAR2(20)
    */

    /** ������ */
    private int USER_ID;        //���[�U�[�h�c
    private String SEI_KANA;    //��-����
    private String SEI_KANJI;   //��-����
    private String NA_KANA;     //��-����
    private String NA_KANJI;    //��-����
    private String FIRST_NAME;  //�t�@�[�X�g�l�[��
    private String LASTNAME;    //���X�g�l�[��
    private int SEX;            //����
    private int BIRTH_DAY;      //�a����
    private String POSTAL_CD;   //�X�֔ԍ�
    private int STATE_CD;       //�s���{���R�[�h
    private String CITY_NAME;   //�s�s��
    private String ADDRESS;     //�Z��
    private String TEL_NO;      //�d�b�ԍ�
    private String FAX;         //FAX

    /** �R���X�g���N�^ */
    public Profile() {
         this.USER_ID = 0;      //���[�U�[�h�c(���Z�b�g)
         this.SEI_KANA = "";    //��-����(���Z�b�g)
         this.SEI_KANJI = "";   //��-����(���Z�b�g)
         this.NA_KANA = "";     //��-����(���Z�b�g)
         this.NA_KANJI = "";    //��-����(���Z�b�g)
         this.FIRST_NAME = "";  //�t�@�[�X�g�l�[��(���Z�b�g)
         this.LASTNAME = "";    //���X�g�l�[��(���Z�b�g)
         this.SEX = 0;          //����(���Z�b�g)
         this.BIRTH_DAY = 0;    //�a����(���Z�b�g)
         this.POSTAL_CD = "";   //�X�֔ԍ�(���Z�b�g)
         this.STATE_CD = 0;     //�s���{���R�[�h(���Z�b�g)
         this.CITY_NAME = "";   //�s�s��(���Z�b�g)
         this.ADDRESS = "";     //�Z��(���Z�b�g)
         this.TEL_NO = "";      //�d�b�ԍ�(���Z�b�g)
         this.FAX = "";         //FAX(���Z�b�g)
    }

    /**
     * ���[�U�[�h�c�̎擾
     * @param int USER_ID
     */
    synchronized public int getUSER_ID(){
        try{
            return this.USER_ID;
        }catch(Exception ex){}
        return 0;
    }

    /**
     * ��-���Ȃ̎擾
     * @param String SEI_KANA
     */
    synchronized public String getSEI_KANA(){
        try{
            return this.SEI_KANA;
        }catch(Exception ex){}
        return "";
    }

    /**
     * ��-�����̎擾
     * @param String SEI_KANJI
     */
    synchronized public String getSEI_KANJI(){
        try{
            return this.SEI_KANJI;
        }catch(Exception ex){}
        return "";
    }

    /**
     * ��-���Ȃ̎擾
     * @param String NA_KANA
     */
    synchronized public String getNA_KANA(){
        try{
            return this.NA_KANA;
        }catch(Exception ex){}
        return "";
    }

    /**
     * ��-�����̎擾
     * @param String NA_KANJI
     */
    synchronized public String getNA_KANJI(){
        try{
            return this.NA_KANJI;
        }catch(Exception ex){}
        return "";
    }

    /**
     * �t�@�[�X�g�l�[���̎擾
     * @param String FIRST_NAME
     */
    synchronized public String getFIRST_NAME(){
        try{
            return this.FIRST_NAME;
        }catch(Exception ex){}
        return "";
    }

    /**
     * ���X�g�l�[���̎擾
     * @param String LASTNAME
     */
    synchronized public String getLASTNAME(){
        try{
            return this.LASTNAME;
        }catch(Exception ex){}
        return "";
    }

    /**
     * ���ʂ̎擾
     * @param int SEX
     */
    synchronized public int getSEX(){
        try{
            return this.SEX;
        }catch(Exception ex){}
        return 0;
    }

    /**
     * �a�����̎擾
     * @param int BIRTH_DAY
     */
    synchronized public int getBIRTH_DAY(){
        try{
            return this.BIRTH_DAY;
        }catch(Exception ex){}
        return 0;
    }

    /**
     * �X�֔ԍ��̎擾
     * @param char POSTAL_CD
     */
    synchronized public String getPOSTAL_CD(){
        try{
            return this.POSTAL_CD;
        }catch(Exception ex){}
        return "";
    }

    /**
     * �s���{���R�[�h�̎擾
     * @param int STATE_CD
     */
    synchronized public int getSTATE_CD(){
        try{
            return this.STATE_CD;
        }catch(Exception ex){}
        return 0;
    }

    /**
     * �s�s���̎擾
     * @param String CITY_NAME
     */
    synchronized public String getCITY_NAME(){
        try{
            return this.CITY_NAME;
        }catch(Exception ex){}
        return "";
    }

    /**
     * �Z���̎擾
     * @param String ADDRESS
     */
    synchronized public String getADDRESS(){
        try{
            return this.ADDRESS;
        }catch(Exception ex){}
        return "";
    }

    /**
     * �d�b�ԍ��̎擾
     * @param String TEL_NO
     */
    synchronized public String getTEL_NO(){
        try{
            return this.TEL_NO; 
        }catch(Exception ex){}
        return "";
    }

    /**
     * FAX�̎擾
     * @param String FAX
     */
    synchronized public String getFAX(){
        try{
            return this.FAX; 
        }catch(Exception ex){}
        return "";
    }

    /**
     * ���[�U�[�h�c�̕ێ�
     * @param int USER_ID
     */
    synchronized public void setUSER_ID(int userid){
        this.USER_ID = userid;
    }

    /**
     * ��-���Ȃ̕ێ�
     * @param String SEI_KANA
     */
    synchronized public void setSEI_KANA(String sei_kana){
        this.SEI_KANA = sei_kana;
    }

    /**
     * ��-�����̕ێ�
     * @param String SEI_KANJI
     */
    synchronized public void setSEI_KANJI(String sei_kanji){
        this.SEI_KANJI = sei_kanji;
    }

    /**
     * ��-���Ȃ̕ێ�
     * @param String NA_KANA
     */
    synchronized public void setNA_KANA(String na_kana){
        this.NA_KANA = na_kana;
    }

    /**
     * ��-�����̕ێ�
     * @param String NA_KANJI
     */
    synchronized public void setNA_KANJI(String na_kanji){
        this.NA_KANJI = na_kanji;
    }

    /**
     * �t�@�[�X�g�l�[���̕ێ�
     * @param String FIRST_NAME
     */
    synchronized public void setFIRST_NAME(String first_name){
        this.FIRST_NAME = first_name;
    }


    /**
     * ���X�g�l�[���̕ێ�
     * @param String LASTNAME
     */
    synchronized public void setLASTNAME(String lastname){
        this.LASTNAME = lastname;
    }

    /**
     * ���ʂ̕ێ�
     * @param int SEX
     */
    synchronized public void setSEX(int sex){
        this.SEX = sex;
    }

    /**
     * �a�����̕ێ�
     * @param int BIRTH_DAY
     */
    synchronized public void setBIRTH_DAY(int birth_day){
        this.BIRTH_DAY = birth_day;
    }

    /**
     * �X�֔ԍ��̕ێ�
     * @param char POSTAL_CD
     */
    synchronized public void setPOSTAL_CD(String postalcd){
        this.POSTAL_CD = postalcd;
    }

    /**
     * �s���{���R�[�h�̕ێ�
     * @param int STATE_CD
     */
    synchronized public void setSTATE_CD(int statecd){
        this.STATE_CD = statecd;
    }

    /**
     * �s�s���̕ێ�
     * @param String CITY_NAME
     */
    synchronized public void setCITY_NAME(String cityname){
        this.CITY_NAME = cityname;
    }

    /**
     * �Z���̕ێ�
     * @param String ADDRESS
     */
    synchronized public void setADDRESS(String address){
        this.ADDRESS = address;
    }

    /**
     * �d�b�ԍ��̕ێ�
     * @param String TEL_NO
     */
    synchronized public void setTEL_NO(String telno){
        this.TEL_NO = telno;
    }

    /**
     * FAX�̕ێ�
     * @param String FAX
     */
    synchronized public void setFAX(String fax){
        this.FAX = fax;
    }
}
