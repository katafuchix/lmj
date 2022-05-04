/*
 * Menu.java
 *
 * Created on 2002/04/21, 16:10
 */

package jp.co.lastminute.menu;

import java.io.Serializable;
/**
 *
 * @author  skondo
 * @version 
 */
public final class Menu implements Serializable{
    private String catid = null;
    private String title = null;
    private String url = null;

    /** �v���p�e�B catid �̎擾���\�b�h�B
     * @return �v���p�e�B catid �̒l�B
     */
    public String getCatid() {
        return catid;
    }
    
    /** �v���p�e�B catid �̐ݒ胁�\�b�h�B
     * @param catid �v���p�e�B catid �̐V�����l�B
     */
    public void setCatid(String catid) {
        this.catid = catid;
    }
    
    /** �v���p�e�B title �̎擾���\�b�h�B
     * @return �v���p�e�B title �̒l�B
     */
    public String getTitle() {
        return title;
    }
    
    /** �v���p�e�B title �̐ݒ胁�\�b�h�B
     * @param title �v���p�e�B title �̐V�����l�B
     */
    public void setTitle(String title) {
        this.title = title;
    }
    
    /** �v���p�e�B url �̎擾���\�b�h�B
     * @return �v���p�e�B url �̒l�B
     */
    public String getUrl() {
        return url;
    }
    
    /** �v���p�e�B url �̐ݒ胁�\�b�h�B
     * @param url �v���p�e�B url �̐V�����l�B
     */
    public void setUrl(String url) {
        this.url = url;
    }
    
}
