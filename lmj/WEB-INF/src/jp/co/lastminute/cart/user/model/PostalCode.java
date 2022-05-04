/*
 * PostalCode.java
 *
 * Created on 2002/04/20, 20:26
 */
package jp.co.lastminute.cart.user.model;

/**
 *
 * @author  Takashi Yamada
 * @version 1.0
 */
public class PostalCode {
    /**
        POSTAL_CD                                          CHAR(7)
        STATE_CD                                           NUMBER(2)
        CITY_CD                                            NUMBER(7)
        STREETCD                                           NUMBER(8)
        STATE_NAME                                         VARCHAR2(18)
        CITY_NAME                                          VARCHAR2(24)
        STREETNAME                                         VARCHAR2(60)
    */
   
    /** ������ */
    private String POSTAL_CD;   // �X�֔ԍ��R�[�h
    private int STATE_CD;       // �s���{���R�[�h
    private String STATE_NAME;  // �s���{����
    private int CITY_CD;        // �s�撬���R�[�h
    private String CITY_NAME;   // �s�撬����
    private int STREETCD;       // ���於
    private String STREETNAME;  // ���於
    
    /** �R���X�g���N�^ */
    public PostalCode() {
        this.POSTAL_CD = "";    // �X�֔ԍ��R�[�h(���Z�b�g)
        this.STATE_CD = 0;      // �s���{���R�[�h(���Z�b�g)
        this.STATE_NAME = "";   // �s���{����(���Z�b�g)
        this.CITY_CD = 0;       // �s�撬���R�[�h(���Z�b�g)
        this.CITY_NAME = "";    // �s�撬����(���Z�b�g)
        this.STREETCD = 0;      // ����R�[�h(���Z�b�g)
        this.STREETNAME = "";   // ���於(���Z�b�g)
    }

    /**
     * �X�֔ԍ��R�[�h���擾����B
     * @param String POSTAL_CD
     */
    synchronized public String getPOSTAL_CD(){
        try{
            return this.POSTAL_CD;
        }catch(Exception ex){}
        return "";
    }

    /**
     * �s���{���R�[�h���擾����B
     * @param int STATE_CD
     */
    synchronized public int getSTATE_CD(){
        try{
            return this.STATE_CD;
        }catch(Exception ex){}
        return 0;
    }

    /**
     * �s���{�������擾����B
     * @param String STATE_NAME
     */
    synchronized public String getSTATE_NAME(){
        try{
            return this.STATE_NAME;
        }catch(Exception ex){}
        return "";
    }

    /**
     * �s�撬���R�[�h���擾����B
     * @param int CITY_CD
     */
    synchronized public int getCITY_CD(){
        try{
            return this.CITY_CD;
        }catch(Exception ex){}
        return 0;
    }

    /**
     * �s�撬�������擾����B
     * @param String CITY_NAME
     */
    synchronized public String getCITY_NAME(){
        try{
            return this.CITY_NAME;
        }catch(Exception ex){}
        return "";
    }

    /**
     * �n��R�[�h���擾����B
     * @param int STREETCD
     */
    synchronized public int getSTREETCD(){
        try{
            return this.STREETCD;
        }catch(Exception ex){}
        return 0;
    }

    /**
     * �n�於���擾����B
     * @param String STREETNAME
     */
    synchronized public String getSTREETNAME(){
        try{
            return this.STREETNAME;
        }catch(Exception ex){}
        return "";
    }

    /**
     * �X�֔ԍ��R�[�h��ێ�����B
     * @param String POSTAL_CD
     */
    synchronized public void setPOSTAL_CD(String postal_Cd){
        this.POSTAL_CD = postal_Cd;
    }

    /**
     * �s���{���R�[�h��ێ�����B
     * @param int STATE_CD
     */
    synchronized public void setSTATE_CD(int state_Code){
        this.STATE_CD = state_Code;
    }

    /**
     * �s���{������ێ�����B
     * @param String STATE_NAME
     */
    synchronized public void setSTATE_NAME(String state_Name){
        this.STATE_NAME = state_Name;
    }

    /**
     * �s�撬���R�[�h��ێ�����B
     * @param int CITY_CD
     */
    synchronized public void setCITY_CD(int city_Code ){
        this.CITY_CD = city_Code;
    }

    /**
     * �s�撬������ێ�����B
     * @param String CITY_NAME
     */
    synchronized public void setCITY_NAME(String city_Name){
        this.CITY_NAME = city_Name;
    }

    /**
     * �n��R�[�h��ێ�����B
     * @param int STREETCD
     */
    synchronized public void setSTREETCD(int street_Code){
        this.STREETCD = street_Code;
    }

    /**
     * �n�於��ێ�����B
     * @param String STREETNAME
     */
    synchronized public void setSTREETNAME(String street_Name){
        this.STREETNAME = street_Name;
    }
}
