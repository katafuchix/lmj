package jp.co.lastminute.cart.user;

/**
 * @author user
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
/*
 * User.java
 *
 * Created on 2002/04/27, 17:45
 */


import java.io.*;
import java.util.*;
import jp.co.lastminute.cart.user.*;
import jp.co.lastminute.cart.user.model.*;


/**
 *
 * @author  skondo
 * @version 
 */
public class User implements Serializable{
    private User_Tbl user;
    private Profile profile;
    
    /** �R���X�g���N�^ */
    public User() {
        user = null;
        profile = null;
    }
    /**
     * �C�j�V�����C�Y
     */
    public void init(){
    	this.user = new User_Tbl();
    	this.profile = new Profile();
    }
    /** �v���p�e�B profile �̎擾���\�b�h�B
     * @return �v���p�e�B profile �̒l�B
     */
    public Profile getProfile() {
        return profile;
    }
    
    /** �v���p�e�B profile �̐ݒ胁�\�b�h�B
     * @param profile �v���p�e�B profile �̐V�����l�B
     */
    public void setProfile(Profile profile) {
        this.profile = profile;
    }
    
    /** �v���p�e�B user �̎擾���\�b�h�B
     * @return �v���p�e�B user �̒l�B
     */
    public User_Tbl getUser() {
        return user;
    }
    
    /** �v���p�e�B user �̐ݒ胁�\�b�h�B
     * @param user �v���p�e�B user �̐V�����l�B
     */
    public void setUser(User_Tbl user) {
        this.user = user;
    }
    
}
