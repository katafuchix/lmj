/*
 * User_Tbl.java
 *
 * Created on 2002/04/05, 13:37
 */
package jp.co.lastminute.cart.user.model;

/**
 *
 * @author  skondo & Takashi Yamada
 * @version 1.0
 */
public class User_Tbl {
    /**
        USER_ID                                   NOT NULL NUMBER(10)
        E_MAIL                                    NOT NULL VARCHAR2(120)
        PASSWD                                    NOT NULL VARCHAR2(10)
        AUTH_FLG                                           CHAR(1)
        DEL_FLG                                            NUMBER(2)
        HTML_MAIL_OK                                       CHAR(1)
        MAIL_MAG_OK                                        CHAR(1)
        CAMPAIGNUSERFLAG                                   NUMBER(2)
        DEALWATCHID                               NOT NULL VARCHAR2(4)
        MAKE_DATE                                          DATE
        UP_DATE                                            DATE
     */

    /** ������ */
    private int USER_ID;            //���[�U�[ID
    private String E_MAIL;          //E_MAIL
    private String PASSWD;          //�p�X���[�h
    private String AUTH_FLG;        //�F�؃t���O
    private int DEL_FLG;            //�폜�t���O
    private String HTML_MAIL_OK;    //HTML���[���n�j�t���O
    private String MAIL_MAG_OK;     //���[���}�K�W���n�j�t���O
    private int CAMPAIGNUSERFLAG;   //�L�����y�[�����[�U�[�t���O
    private String DEALWATCHID;     //�f�B�[���E�H�b�`�h�c
    private String MAKE_DATE;       //�쐬��
    private String UP_DATE;         //�C����

    /** �R���g���N�^�[ */
    public User_Tbl() {
         this.USER_ID = 0;          //���[�U�[ID(���Z�b�g)
         this.E_MAIL = "";          //E_MAIL(���Z�b�g)
         this.PASSWD = "";          //�p�X���[�h(���Z�b�g)
         this.AUTH_FLG = "";        //�F�؃t���O(���Z�b�g)
         this.DEL_FLG = 0;          //�폜�t���O(���Z�b�g)
         this.HTML_MAIL_OK = "";    //HTML���[���n�j�t���O(���Z�b�g)
         this.MAIL_MAG_OK = "";     //���[���}�K�W���n�j�t���O(���Z�b�g)
         this.CAMPAIGNUSERFLAG = 0; //�L�����y�[�����[�U�[�t���O(���Z�b�g)
         this.DEALWATCHID = "";     //�f�B�[���E�H�b�`�h�c(���Z�b�g)
         this.MAKE_DATE = "";       //�쐬��(���Z�b�g)
         this.UP_DATE = "";         //�C����(���Z�b�g)
    }

    /**
     * ���[�U�[ID�̕ێ�������
     * @param int USER_ID
     */
    synchronized public void setUSER_ID(int userid){
        this.USER_ID = userid;        
    }

    /**
     * E_MAIL�̕ێ�������
     * @return String E_MAIL
     */
    synchronized public void setE_MAIL(String email){
        this.E_MAIL = email;
    }

    /**
     * �p�X���[�h�̕ێ�������
     * @param String PASSWD
     */
    synchronized public void setPASSWD(String passwd){
        this.PASSWD = passwd;
    }

    /**
     * �F�؃t���O�̕ێ�������
     * @param char AUTH_FLG
     */
    synchronized public void setAUTH_FLG(String authflg){
        this.AUTH_FLG = authflg;
    }

    /**
     * �폜�t���O�̕ێ�����
     * @param char DEL_FLG 
     */
    synchronized public void setDEL_FLG(int delflg){
        this.DEL_FLG = delflg;
    }

    /**
     * HTML���[���n�j�t���O�̕ێ�������
     * @param char HTML_MAIL_OK
     */
    synchronized public void setHTML_MAIL_OK(String htmlmailkok){
        this.HTML_MAIL_OK = htmlmailkok;
    }

    /**
     * ���[���}�K�W���n�j�t���O�̕ێ�������
     * @param char MAIL_MAG_OK
     */
    synchronized public void setMAIL_MAG_OK(String mailmagok){
        this.MAIL_MAG_OK = mailmagok;
    }

    /**
     * �L�����y�[�����[�U�[�t���O�̕ێ�������
     * @param int CAMPAIGNUSERFLAG
     */
    synchronized public void setCAMPAIGNUSERFLAG(int campaignuserflag){
        this.CAMPAIGNUSERFLAG = campaignuserflag;
    }

    /**
     * �f�B�[���E�H�b�`�h�c�̕ێ�������
     * @param String DEALWATCHID
     */
    synchronized public void setDEALWATCHID(String dealwatchid){
        this.DEALWATCHID = dealwatchid;
    }

    /**
     * �쐬����ێ�����
     * @param String MAKE_DATE
     */
    synchronized public void setMAKE_DATE(String makedate){
        this.MAKE_DATE = makedate;
    }

    /**
     * �C������ێ�����
     * @param String UP_DATE
     */
    synchronized public void setUP_DATE(String update){
        this.UP_DATE = update;        
    }

    /**
     * ���[�U�[ID���擾����
     * @return int USER_ID 
     */
    synchronized public int getUSER_ID(){
        try{
            return this.USER_ID;
        }catch(Exception ex){}
        return 0;
    }

    /**
     * E_MAIL���擾����
     * @retrun String E_MAIL
     */
    synchronized public String getE_MAIL(){
        try{
            return this.E_MAIL;
        }catch(Exception ex){}
        return "";
    }

    /**
     * �p�X���[�h���擾����
     * @return String PASSWD
     */
    synchronized public String getPASSWD(){
        try{
            return this.PASSWD;
        }catch(Exception ex){}
        return "";
    }

    /**
     * �F�؃t���O���擾����
     * @return String AUTH_FLG
     */
    synchronized public String getAUTH_FLG(){
        try{
            return this.AUTH_FLG;
        }catch(Exception ex){}
        return "";
    }

    /**
     * �폜�t���O���擾����
     * @return int DEL_FLG
     */
    synchronized public int getDEL_FLG(){
        try{
            return this.DEL_FLG;
        }catch(Exception ex){}
        return 0;
    }

    /**
     * ���[����ʃt���O���擾����
     * @return String HTML_MAIL_OK
     */
    synchronized public String getHTML_MAIL_OK(){
        try{
            return this.HTML_MAIL_OK;        
        }catch(Exception ex){}
        return "";
    }

    /**
     * ���[���}�K�W�����s�\�t���O���擾����
     * @return String MAIL_MAG_OK
     */
    synchronized public String getMAIL_MAG_OK(){
        try{
            return this.MAIL_MAG_OK;
        }catch(Exception ex){}
        return "";
    }

    /**
     * �L�����y�[���t���O���擾����
     * @return int CAMPAIGNUSERFLAG
     */
    synchronized public int getCAMPAIGNUSERFLAG(){
        try{
            return this.CAMPAIGNUSERFLAG;
        }catch(Exception ex){}
        return 0;
    }

    /**
     * �f�B�[���E�H�b�`ID���擾����
     * @return String DEALWATCHID
     */
    synchronized public String getDEALWATCHID(){
        try{
            return this.DEALWATCHID;
        }catch(Exception ex){}
        return "";
    }

    /**
     * �쐬���̎擾����
     * @return String MAKE_DATE
     */
    synchronized public String getMAKE_DATE(){
        try{
            return this.MAKE_DATE; 
        }catch(Exception ex){}
        return "";
    }

    /**
     * �C�����̎擾����
     * @return String UP_DATE
     */
    synchronized public String getUP_DATE(){
        try{
            return this.UP_DATE;
        }catch(Exception ex){}
        return "";
    }
}
